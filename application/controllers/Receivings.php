<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once("Secure_Controller.php");

class Receivings extends Secure_Controller
{
    public function __construct()
    {
        parent::__construct('receivings');

        $this->load->library('receiving_lib');
        $this->load->library('barcode_lib');
    }

    public function index()
    {
        $this->_reload();
    }

    public function item_search()
    {
        $suggestions = $this->Item->get_search_suggestions($this->input->get('term'), array('search_custom' => FALSE, 'is_deleted' => FALSE), TRUE);
        $suggestions = array_merge($suggestions, $this->Item_kit->get_search_suggestions($this->input->get('term')));

        $suggestions = $this->xss_clean($suggestions);

        echo json_encode($suggestions);
    }

    public function stock_item_search()
    {
        $suggestions = $this->Item->get_stock_search_suggestions($this->input->get('term'), array('search_custom' => FALSE, 'is_deleted' => FALSE), TRUE);
        $suggestions = array_merge($suggestions, $this->Item_kit->get_search_suggestions($this->input->get('term')));

        $suggestions = $this->xss_clean($suggestions);

        echo json_encode($suggestions);
    }

    public function select_consignmenter()
    {
        $consignmenter_id = $this->input->post('consignmenter');
        if ($this->Consignmenter->exists($consignmenter_id)) {
            $this->receiving_lib->set_consignmenter($consignmenter_id);
        }

        $this->_reload();
    }

    public function change_mode()
    {
        $stock_destination = $this->input->post('stock_destination');
        $stock_source = $this->input->post('stock_source');

        if ((!$stock_source || $stock_source == $this->receiving_lib->get_stock_source()) &&
            (!$stock_destination || $stock_destination == $this->receiving_lib->get_stock_destination())
        ) {
            $this->receiving_lib->clear_reference();
            $mode = $this->input->post('mode');
            $this->receiving_lib->set_mode($mode);
        } elseif ($this->Stock_location->is_allowed_location($stock_source, 'receivings')) {
            $this->receiving_lib->set_stock_source($stock_source);
            $this->receiving_lib->set_stock_destination($stock_destination);
        }

        $this->_reload();
    }

    public function set_expiration_date()
    {
        $this->receiving_lib->set_expiration_date($this->input->post('expiration_date'));
    }

    public function set_comment()
    {
        $this->receiving_lib->set_comment($this->input->post('comment'));
    }

    public function set_print_after_sale()
    {
        $this->receiving_lib->set_print_after_sale($this->input->post('recv_print_after_sale'));
    }

    public function set_reference()
    {
        $this->receiving_lib->set_reference($this->input->post('recv_reference'));
    }

    public function add()
    {
        $data = array();

        $mode = $this->receiving_lib->get_mode();
        $item_id_or_number_or_item_kit_or_receipt = $this->input->post('item');
        $this->barcode_lib->parse_barcode_fields($quantity, $item_id_or_number_or_item_kit_or_receipt);
        $quantity = ($mode == 'receive' || $mode == 'requisition') ? $quantity : -$quantity;
        $item_location = $this->receiving_lib->get_stock_source();
        $discount = $this->config->item('default_receivings_discount');
        $fee = 20;
        $discount_type = $this->config->item('default_receivings_discount_type');

        if ($mode == 'return' && $this->Receiving->is_valid_receipt($item_id_or_number_or_item_kit_or_receipt)) {
            $this->receiving_lib->return_entire_receiving($item_id_or_number_or_item_kit_or_receipt);
        } elseif ($this->Item_kit->is_valid_item_kit($item_id_or_number_or_item_kit_or_receipt)) {
            $this->receiving_lib->add_item_kit($item_id_or_number_or_item_kit_or_receipt, $item_location, $discount, $fee, $discount_type);
        } elseif (!$this->receiving_lib->add_item($item_id_or_number_or_item_kit_or_receipt, $quantity, $item_location, $discount, $fee, $discount_type)) {
            $data['error'] = $this->lang->line('receivings_unable_to_add_item');
        }

        $this->_reload($data);
    }

    public function add_items_multiple()
    {

        $consignmenter_name = '';
        $consignmenter_id = $this->receiving_lib->get_consignmenter();
        if ($consignmenter_id != -1) {
            $consignmenter_info = $this->Consignmenter->get_info($consignmenter_id);
            $consignmenter_name = $consignmenter_info->consignmenter_name;
        }

        $employee_id = $this->Employee->get_logged_in_employee_info()->person_id;
        $array_item_id = $this->Item->add_items_multiple($this->input->post('generate_new_item_input'), $employee_id, $consignmenter_name);

        $data = array();
        $mode = $this->receiving_lib->get_mode();
        $quantity = 0;
        $item_location = $this->receiving_lib->get_stock_source();
        $discount = $this->config->item('default_receivings_discount');
        $fee = 20;
        $discount_type = $this->config->item('default_receivings_discount_type');
        foreach ($array_item_id as $item_id) {
            $item_id = (int)trim($item_id);
            $stock_locations = $this->Stock_location->get_undeleted_all()->result_array();
            foreach($stock_locations as $location)
            {
                $updated_quantity = 0;
                $location_detail = array('item_id' => $item_id,
                    'location_id' => $location['location_id'],
                    'quantity' => $updated_quantity);

                $new_item = TRUE;
                $item_quantity = $this->Item_quantity->get_item_quantity($item_id, $location['location_id']);
                if($item_quantity->quantity != $updated_quantity || $new_item)
                {
                    $success = $this->Item_quantity->save($location_detail, $item_id, $location['location_id']);

                    $inv_data = array(
                        'trans_date' => date('Y-m-d H:i:s'),
                        'trans_items' => $item_id,
                        'trans_user' => $employee_id,
                        'trans_location' => $location['location_id'],
                        'trans_comment' => $this->lang->line('items_manually_editing_of_quantity'),
                        'trans_inventory' => $updated_quantity - $item_quantity->quantity
                    );

                    $success &= $this->Inventory->insert($inv_data);
                }
            }

            $item_id_or_number_or_item_kit_or_receipt = (int)trim($item_id);
            $this->barcode_lib->parse_barcode_fields($quantity, $item_id_or_number_or_item_kit_or_receipt);
            if (!$this->receiving_lib->add_item($item_id_or_number_or_item_kit_or_receipt, $quantity, $item_location, $discount, $fee, $discount_type)) {
                $data['error'] = $this->lang->line('receivings_unable_to_add_item');
            }
        }
        $this->_reload($data);
    }

    public function edit_item($item_id)
    {
        $data = array();

        $this->form_validation->set_rules('price', 'lang:items_price', 'required|callback_numeric');
        $this->form_validation->set_rules('quantity', 'lang:items_quantity', 'required|callback_numeric');
        $this->form_validation->set_rules('discount', 'lang:items_discount', 'required|callback_numeric');

        $description = $this->input->post('description');
        $serialnumber = $this->input->post('serialnumber');
        $price = parse_decimals($this->input->post('price'));
        $quantity = parse_decimals($this->input->post('quantity'));
        $discount = parse_decimals($this->input->post('discount'));
        $fee = parse_decimals($this->input->post('fee'));
        $discount_type = parse_decimals($this->input->post('discount_type'));
        $item_location = $this->input->post('location');
        $receiving_quantity = $this->input->post('receiving_quantity');

        if ($this->form_validation->run() != FALSE) {
            $this->receiving_lib->edit_item($item_id, $description, $serialnumber, $quantity, $discount, $fee, $discount_type, $price, $receiving_quantity);
        } else {
            $data['error'] = $this->lang->line('receivings_error_editing_item');
        }

        $this->_reload($data);
    }

    public function edit($receiving_id)
    {
        $data = array();

        $data['consignmenters'] = array('' => 'No Consignmenter');
        foreach ($this->Consignmenter->get_all()->result() as $consignmenter) {
            $data['consignmenters'][$consignmenter->person_id] = $this->xss_clean($consignmenter->name);
        }

        $data['employees'] = array();
        foreach ($this->Employee->get_all()->result() as $employee) {
            $data['employees'][$employee->person_id] = $this->xss_clean($employee->name);
        }

        $receiving_info = $this->xss_clean($this->Receiving->get_info($receiving_id)->row_array());
        $data['selected_consignmenter_name'] = !empty($receiving_info['consignmenter_id']) ? $receiving_info['consignmenter_name'] : '';
        $data['selected_consignmenter_id'] = $receiving_info['consignmenter_id'];
        $data['receiving_info'] = $receiving_info;

        $this->load->view('receivings/form', $data);
    }

    public function delete_item($item_number)
    {
        $this->receiving_lib->delete_item($item_number);

        $this->_reload();
    }

    public function delete($receiving_id = -1, $update_inventory = TRUE)
    {
        $employee_id = $this->Employee->get_logged_in_employee_info()->person_id;
        $receiving_ids = $receiving_id == -1 ? $this->input->post('ids') : array($receiving_id);

        if ($this->Receiving->delete_list($receiving_ids, $employee_id, $update_inventory)) {
            echo json_encode(array('success' => TRUE, 'message' => $this->lang->line('receivings_successfully_deleted') . ' ' .
                count($receiving_ids) . ' ' . $this->lang->line('receivings_one_or_multiple'), 'ids' => $receiving_ids));
        } else {
            echo json_encode(array('success' => FALSE, 'message' => $this->lang->line('receivings_cannot_be_deleted')));
        }
    }

    public function remove_consignmenter()
    {
        $this->receiving_lib->clear_reference();
        $this->receiving_lib->remove_consignmenter();

        $this->_reload();
    }

    public function complete()
    {
        $data = array();

        $newdate2 = $this->input->post('expiration_date');
        $date_formatter2 = date_create_from_format($this->config->item('dateformat'), $newdate2);

        $data['cart'] = $this->receiving_lib->get_cart();
        $data['total'] = $this->receiving_lib->get_total();
        $data['transaction_time'] = to_datetime(time());
        $data['mode'] = $this->receiving_lib->get_mode();
        $data['comment'] = $this->receiving_lib->get_comment();
        $data['reference'] = $this->receiving_lib->get_reference();
        $data['payment_type'] = $this->input->post('payment_type');
        $data['show_stock_locations'] = $this->Stock_location->show_locations('receivings');
        $data['stock_location'] = $this->receiving_lib->get_stock_source();
        $data['expiration_date'] = $date_formatter2->format('Y-m-d');
        if ($this->input->post('amount_tendered') != NULL) {
            $data['amount_tendered'] = $this->input->post('amount_tendered');
            $data['amount_change'] = to_currency($data['amount_tendered'] - $data['total']);
        }

        $employee_id = $this->Employee->get_logged_in_employee_info()->person_id;
        $employee_info = $this->Employee->get_info($employee_id);
        $data['employee'] = $employee_info->name;

        $consignmenter_info = '';
        $consignmenter_id = $this->receiving_lib->get_consignmenter();
        if ($consignmenter_id != -1) {
            $consignmenter_info = $this->Consignmenter->get_info($consignmenter_id);
            $data['consignmenter'] = $consignmenter_info->consignmenter_name;
            $data['name'] = $consignmenter_info->name;
            $data['consignmenter_email'] = $consignmenter_info->email;
            $data['consignmenter_address'] = $consignmenter_info->address_1;
            if (!empty($consignmenter_info->zip) or !empty($consignmenter_info->city)) {
                $data['consignmenter_location'] = $consignmenter_info->zip . ' ' . $consignmenter_info->city;
            } else {
                $data['consignmenter_location'] = '';
            }
        }

        //SAVE receiving to database
        $data['receiving_id'] = 'RECV ' . $this->Receiving->save($data['cart'], $consignmenter_id, $employee_id, $data['comment'], $data['reference'], $data['payment_type'], $data['stock_location'], $data['expiration_date']);

        $data = $this->xss_clean($data);

        if ($data['receiving_id'] == 'RECV -1') {
            $data['error_message'] = $this->lang->line('receivings_transaction_failed');
        } else {
            $data['barcode'] = $this->barcode_lib->generate_receipt_barcode($data['receiving_id']);
        }

        $data['print_after_sale'] = $this->receiving_lib->is_print_after_sale();

        $this->load->view("receivings/receipt", $data);

        $this->receiving_lib->clear_all();
    }

    public function requisition_complete()
    {
        if ($this->receiving_lib->get_stock_source() != $this->receiving_lib->get_stock_destination()) {
            foreach ($this->receiving_lib->get_cart() as $item) {
                $this->receiving_lib->delete_item($item['line']);
                $this->receiving_lib->add_item($item['item_id'], $item['quantity'], $this->receiving_lib->get_stock_destination(), $item['discount_type']);
                $this->receiving_lib->add_item($item['item_id'], -$item['quantity'], $this->receiving_lib->get_stock_source(), $item['discount_type']);
            }

            $this->complete();
        } else {
            $data['error'] = $this->lang->line('receivings_error_requisition');

            $this->_reload($data);
        }
    }

    public function receipt($receiving_id)
    {
        $receiving_info = $this->Receiving->get_info($receiving_id)->row_array();
        $this->receiving_lib->copy_entire_receiving($receiving_id);
        $data['cart'] = $this->receiving_lib->get_cart();
        $data['total'] = $this->receiving_lib->get_total();
        $data['mode'] = $this->receiving_lib->get_mode();
        $data['transaction_time'] = to_datetime(strtotime($receiving_info['receiving_time']));
        $data['show_stock_locations'] = $this->Stock_location->show_locations('receivings');
        $data['payment_type'] = $receiving_info['payment_type'];
        $data['reference'] = $this->receiving_lib->get_reference();
        $data['receiving_id'] = 'RECV ' . $receiving_id;
        $data['barcode'] = $this->barcode_lib->generate_receipt_barcode($data['receiving_id']);
        $employee_info = $this->Employee->get_info($receiving_info['employee_id']);
        $data['employee'] = $employee_info->name;

        $consignmenter_id = $this->receiving_lib->get_consignmenter();
        if ($consignmenter_id != -1) {
            $consignmenter_info = $this->Consignmenter->get_info($consignmenter_id);
            $data['consignmenter'] = $consignmenter_info->consignmenter_name;
            $data['name'] = $consignmenter_info->name;
            $data['consignmenter_email'] = $consignmenter_info->email;
            $data['consignmenter_address'] = $consignmenter_info->address_1;
            if (!empty($consignmenter_info->zip) or !empty($consignmenter_info->city)) {
                $data['consignmenter_location'] = $consignmenter_info->zip . ' ' . $consignmenter_info->city;
            } else {
                $data['consignmenter_location'] = '';
            }
        }

        $data['print_after_sale'] = FALSE;

        $data = $this->xss_clean($data);

        $this->load->view("receivings/receipt", $data);

        $this->receiving_lib->clear_all();
    }

    private function _reload($data = array())
    {
        $data['cart'] = $this->receiving_lib->get_cart();
        $data['modes'] = array('receive' => $this->lang->line('receivings_receiving'), 'return' => $this->lang->line('receivings_return'));
        $data['mode'] = $this->receiving_lib->get_mode();
        $data['stock_locations'] = $this->Stock_location->get_allowed_locations('receivings');
        $data['show_stock_locations'] = count($data['stock_locations']) > 1;
        if ($data['show_stock_locations']) {
            $data['modes']['requisition'] = $this->lang->line('receivings_requisition');
            $data['stock_source'] = $this->receiving_lib->get_stock_source();
            $data['stock_destination'] = $this->receiving_lib->get_stock_destination();
        }

        $data['total'] = $this->receiving_lib->get_total();
        $data['items_module_allowed'] = $this->Employee->has_grant('items', $this->Employee->get_logged_in_employee_info()->person_id);
        $data['comment'] = $this->receiving_lib->get_comment();
        $data['reference'] = $this->receiving_lib->get_reference();
        $data['payment_options'] = $this->Receiving->get_payment_options();

        $consignmenter_id = $this->receiving_lib->get_consignmenter();
        $consignmenter_info = '';
        if ($consignmenter_id != -1) {
            $consignmenter_info = $this->Consignmenter->get_info($consignmenter_id);
            $data['consignmenter'] = $consignmenter_info->consignmenter_name;
            $data['name'] = $consignmenter_info->name;
            $data['consignmenter_email'] = $consignmenter_info->email;
            $data['consignmenter_address'] = $consignmenter_info->address_1;
            if (!empty($consignmenter_info->zip) or !empty($consignmenter_info->city)) {
                $data['consignmenter_location'] = $consignmenter_info->zip . ' ' . $consignmenter_info->city;
            } else {
                $data['consignmenter_location'] = '';
            }
        }

        $data['print_after_sale'] = $this->receiving_lib->is_print_after_sale();

        $data = $this->xss_clean($data);

        $this->load->view("receivings/receiving", $data);
    }

    public function save($receiving_id = -1)
    {
        $newdate = $this->input->post('date');
        $newdate2 = $this->input->post('expiration_date');

        $date_formatter = date_create_from_format($this->config->item('dateformat') . ' ' . $this->config->item('timeformat'), $newdate);
        $date_formatter2 = date_create_from_format($this->config->item('dateformat'), $newdate2);

        $receiving_data = array(
            'receiving_time' => $date_formatter->format('Y-m-d'),
            'consignmenter_id' => $this->input->post('consignmenter_id') ? $this->input->post('consignmenter_id') : NULL,
            'employee_id' => $this->input->post('employee_id'),
            'comment' => $this->input->post('comment'),
            'reference' => $this->input->post('reference') != '' ? $this->input->post('reference') : NULL,
            'expiration_date' => $date_formatter2->format('Y-m-d')
        );

        if ($this->Receiving->update($receiving_data, $receiving_id)) {
            echo json_encode(array('success' => TRUE, 'message' => $this->lang->line('receivings_successfully_updated'), 'id' => $receiving_id));
        } else {
            echo json_encode(array('success' => FALSE, 'message' => $this->lang->line('receivings_unsuccessfully_updated'), 'id' => $receiving_id));
        }
    }

    public function cancel_receiving()
    {
        $this->receiving_lib->clear_all();

        $this->_reload();
    }
}

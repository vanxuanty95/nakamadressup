<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Receiving class
 */
class Receiving extends CI_Model
{
    public function get_info($receiving_id)
    {
        $this->db->from('receivings');
        $this->db->join('people', 'people.person_id = receivings.consignmenter_id', 'LEFT');
        $this->db->join('consignmenters', 'consignmenters.person_id = receivings.consignmenter_id', 'LEFT');
        $this->db->where('receiving_id', $receiving_id);

        return $this->db->get();
    }

    public function get_receiving_by_reference($reference)
    {
        $this->db->from('receivings');
        $this->db->where('reference', $reference);

        return $this->db->get();
    }

    public function is_valid_receipt($receipt_receiving_id)
    {
        if (!empty($receipt_receiving_id)) {
            //RECV #
            $pieces = explode(' ', $receipt_receiving_id);

            if (count($pieces) == 2 && preg_match('/(RECV|KIT)/', $pieces[0])) {
                return $this->exists($pieces[1]);
            } else {
                return $this->get_receiving_by_reference($receipt_receiving_id)->num_rows() > 0;
            }
        }

        return FALSE;
    }

    public function exists($receiving_id)
    {
        $this->db->from('receivings');
        $this->db->where('receiving_id', $receiving_id);

        return ($this->db->get()->num_rows() == 1);
    }

    public function update_edited($receiving_id, $items, $consignmenter_id, $employee_id, $comment, $reference, $payment_type, $stock_location, $expiration_date, $list_deleted)
    {
        if (count($items) == 0) {
            return -1;
        }

        $receivings_data = array(
            'receiving_time' => date('Y-m-d H:i:s'),
            'consignmenter_id' => $consignmenter_id,
            'employee_id' => $employee_id,
            'payment_type' => $payment_type,
            'comment' => $comment,
            'reference' => $reference,
            'expiration_date' => $expiration_date,
        );

        //Run these queries as a transaction, we want to make sure we do all or nothing
        $this->db->trans_start();

        $this->db->where('receiving_id', $receiving_id);
        $this->db->update('receivings', $receivings_data);

        foreach ($items as $line => $item) {
            $cur_item_info = $this->Item->get_info($item['item_id']);

            $receivings_items_data = array(
                'description' => $item['description'],
                'serialnumber' => $item['serialnumber'],
                'quantity_purchased' => $item['quantity'],
                'receiving_quantity' => $item['receiving_quantity'],
                'fee' => $item['fee'],
                'discount' => $item['discount'],
                'discount_type' => $item['discount_type'],
                'item_cost_price' => $item['price'],
                'item_unit_price' => $item['total'],
                'item_location' => $item['item_location']
            );

            //make sure item exists in database.
            if ($this->get_receiving_item_exits($receiving_id, $item['item_id'], $item['line'])) {
                $this->db->where('receiving_id', $receiving_id);
                $this->db->where('item_id', $item['item_id']);
                $this->db->where('line', $item['line']);
                $this->db->update('receivings_items', $receivings_items_data);
            } else {
                $receivings_items_data['receiving_id'] = $receiving_id;
                $receivings_items_data['item_id'] = $item['item_id'];
                $receivings_items_data['line'] = $item['line'];
                $this->db->insert('receivings_items', $receivings_items_data);
            }

            $items_received = $item['receiving_quantity'] != 0 ? $item['quantity'] * $item['receiving_quantity'] : $item['quantity'];

            // update cost price, if changed AND is set in config as wanted
            if ($cur_item_info->cost_price != $item['price']) {
                $this->Item->change_cost_price($item['item_id'], $items_received, $item['price'], $cur_item_info->cost_price, $item['total']);
            }

            $this->Item->save_consignmenter_id_and_expiration_date($item['item_id'], $this->Consignmenter->exists($consignmenter_id) ? $consignmenter_id : NULL, $receiving_id, $expiration_date);

            //Update stock quantity
            $item_quantity = $this->Item_quantity->get_item_quantity($item['item_id'], $item['item_location']);
            $this->Item_quantity->save(array('quantity' => $items_received, 'item_id' => $item['item_id'],
                'location_id' => $item['item_location']), $item['item_id'], $item['item_location']);

            $recv_remarks = 'sửa đơn nhập bằng tay';
            $inv_data = array(
                'trans_date' => date('Y-m-d H:i:s'),
                'trans_items' => $item['item_id'],
                'trans_user' => $employee_id,
                'trans_location' => $item['item_location'],
                'trans_comment' => $recv_remarks,
                'trans_inventory' => $items_received - $item_quantity->quantity
            );

            $this->Inventory->insert($inv_data);

            $this->Attribute->copy_attribute_links($item['item_id'], 'receiving_id', $receiving_id);
        }

        foreach ($list_deleted as $line2 => $item_id) {
            $this->db->where('receiving_id', $receiving_id);
            $this->db->where('item_id', $item_id);
            $this->db->delete('receivings_items');

            $this->Item->delete($item_id);
        }

        $this->db->trans_complete();

        if ($this->db->trans_status() === FALSE) {
            return -1;
        }

        return $receiving_id;
    }

    public function save($items, $consignmenter_id, $employee_id, $comment, $reference, $payment_type, $receiving_id = FALSE, $expiration_date)
    {
        if (count($items) == 0) {
            return -1;
        }

        $receivings_data = array(
            'receiving_time' => date('Y-m-d H:i:s'),
            'consignmenter_id' => $this->Consignmenter->exists($consignmenter_id) ? $consignmenter_id : NULL,
            'employee_id' => $employee_id,
            'payment_type' => $payment_type,
            'comment' => $comment,
            'reference' => $reference,
            'expiration_date' => $expiration_date,
        );

        //Run these queries as a transaction, we want to make sure we do all or nothing
        $this->db->trans_start();

        $this->db->insert('receivings', $receivings_data);
        $receiving_id = $this->db->insert_id();

        foreach ($items as $line => $item) {
            $cur_item_info = $this->Item->get_info($item['item_id']);

            $receivings_items_data = array(
                'receiving_id' => $receiving_id,
                'item_id' => $item['item_id'],
                'line' => $item['line'],
                'description' => $item['description'],
                'serialnumber' => $item['serialnumber'],
                'quantity_purchased' => $item['quantity'],
                'receiving_quantity' => $item['receiving_quantity'],
                'fee' => $item['fee'],
                'discount' => $item['discount'],
                'discount_type' => $item['discount_type'],
                'item_cost_price' => $item['price'],
                'item_unit_price' => $item['total'],
                'item_location' => $item['item_location']
            );

            $this->db->insert('receivings_items', $receivings_items_data);

            $items_received = $item['receiving_quantity'] != 0 ? $item['quantity'] * $item['receiving_quantity'] : $item['quantity'];

            // update cost price, if changed AND is set in config as wanted
            if ($cur_item_info->cost_price != $item['price']) {
                $this->Item->change_cost_price($item['item_id'], $items_received, $item['price'], $cur_item_info->cost_price, $item['total']);
            }

            $this->Item->save_consignmenter_id_and_expiration_date($item['item_id'], $this->Consignmenter->exists($consignmenter_id) ? $consignmenter_id : NULL, $receiving_id, $expiration_date);

            //Update stock quantity
            $item_quantity = $this->Item_quantity->get_item_quantity($item['item_id'], $item['item_location']);
            $this->Item_quantity->save(array('quantity' => $item_quantity->quantity + $items_received, 'item_id' => $item['item_id'],
                'location_id' => $item['item_location']), $item['item_id'], $item['item_location']);

            $recv_remarks = 'RECV ' . $receiving_id;
            $inv_data = array(
                'trans_date' => date('Y-m-d H:i:s'),
                'trans_items' => $item['item_id'],
                'trans_user' => $employee_id,
                'trans_location' => $item['item_location'],
                'trans_comment' => $recv_remarks,
                'trans_inventory' => $items_received
            );

            $this->Inventory->insert($inv_data);

            $this->Attribute->copy_attribute_links($item['item_id'], 'receiving_id', $receiving_id);

            $consignmenter = $this->Consignmenter->get_info($consignmenter_id);
        }

        $this->db->trans_complete();

        if ($this->db->trans_status() === FALSE) {
            return -1;
        }

        return $receiving_id;
    }

    public function delete_list($receiving_ids, $employee_id, $update_inventory = TRUE)
    {
        $success = TRUE;

        // start a transaction to assure data integrity
        $this->db->trans_start();

        foreach ($receiving_ids as $receiving_id) {
            $success &= $this->delete($receiving_id, $employee_id, $update_inventory);
        }

        // execute transaction
        $this->db->trans_complete();

        $success &= $this->db->trans_status();

        return $success;
    }

    public function delete($receiving_id, $employee_id, $update_inventory = TRUE)
    {
        // start a transaction to assure data integrity
        $this->db->trans_start();

        if ($update_inventory) {
            // defect, not all item deletions will be undone??
            // get array with all the items involved in the sale to update the inventory tracking
            $items = $this->get_receiving_items($receiving_id)->result_array();
            foreach ($items as $item) {
                // create query to update inventory tracking
                $inv_data = array(
                    'trans_date' => date('Y-m-d H:i:s'),
                    'trans_items' => $item['item_id'],
                    'trans_user' => $employee_id,
                    'trans_comment' => 'Deleting receiving ' . $receiving_id,
                    'trans_location' => $item['item_location'],
                    'trans_inventory' => $item['quantity_purchased'] * -1
                );
                // update inventory
                $this->Inventory->insert($inv_data);

                // update quantities
                $this->Item_quantity->change_quantity($item['item_id'], $item['item_location'], $item['quantity_purchased'] * -1);
            }
        }

        // delete all items
        $this->db->delete('receivings_items', array('receiving_id' => $receiving_id));
        // delete sale itself
        $this->db->delete('receivings', array('receiving_id' => $receiving_id));

        // execute transaction
        $this->db->trans_complete();

        return $this->db->trans_status();
    }

    public function get_receiving_items($receiving_id)
    {
        $this->db->from('receivings_items');
        $this->db->where('receiving_id', $receiving_id);

        return $this->db->get();
    }

    public function get_receiving_item_exits($receiving_id, $item_id, $line)
    {
        $this->db->from('receivings_items');
        $this->db->where('receiving_id', $receiving_id);
        $this->db->where('item_id', $item_id);
        $this->db->where('line', $line);
        if ($this->db->get()->num_rows() == 1){
            return true;
        }
        return false;
    }

    public function get_consignmenter($receiving_id)
    {
        $this->db->from('receivings');
        $this->db->where('receiving_id', $receiving_id);

        return $this->Consignmenter->get_info($this->db->get()->row()->consignmenter_id);
    }

    public function get_payment_options()
    {
        return array(
            $this->lang->line('sales_cash') => $this->lang->line('sales_cash'),
            $this->lang->line('sales_check') => $this->lang->line('sales_check'),
            $this->lang->line('sales_debit') => $this->lang->line('sales_debit'),
            $this->lang->line('sales_credit') => $this->lang->line('sales_credit'),
            $this->lang->line('sales_due') => $this->lang->line('sales_due')
        );
    }

    /*
    We create a temp table that allows us to do easy report/receiving queries
    */
    public function create_temp_table(array $inputs)
    {
        if (empty($inputs['receiving_id'])) {
            if (empty($this->config->item('date_or_time_format'))) {
                $where = 'WHERE DATE(receiving_time) BETWEEN ' . $this->db->escape($inputs['start_date']) . ' AND ' . $this->db->escape($inputs['end_date']);
            } else {
                $where = 'WHERE receiving_time BETWEEN ' . $this->db->escape(rawurldecode($inputs['start_date'])) . ' AND ' . $this->db->escape(rawurldecode($inputs['end_date']));
            }
        } else {
            $where = 'WHERE receivings_items.receiving_id = ' . $this->db->escape($inputs['receiving_id']);
        }

        $this->db->query('CREATE TEMPORARY TABLE IF NOT EXISTS ' . $this->db->dbprefix('receivings_items_temp') .
            ' (INDEX(receiving_date), INDEX(receiving_time), INDEX(receiving_id))
			(
				SELECT 
					MAX(DATE(receiving_time)) AS receiving_date,
					MAX(receiving_time) AS receiving_time,
					receivings_items.receiving_id,
					MAX(comment) AS comment,
					MAX(item_location) AS item_location,
					MAX(reference) AS reference,
					MAX(payment_type) AS payment_type,
					MAX(employee_id) AS employee_id, 
					items.item_id,
					MAX(receivings.consignmenter_id) AS consignmenter_id,
					MAX(quantity_purchased) AS quantity_purchased,
					MAX(receivings_items.receiving_quantity) AS receiving_quantity,
					MAX(item_cost_price) AS item_cost_price,
					MAX(item_unit_price) AS item_unit_price,
					MAX(discount) AS discount,
					MAX(fee) AS fee,
					discount_type as discount_type,
					receivings_items.line,
					MAX(serialnumber) AS serialnumber,
					MAX(receivings_items.description) AS description,
					MAX(CASE WHEN receivings_items.discount_type = ' . PERCENT . ' THEN item_unit_price * quantity_purchased * receivings_items.receiving_quantity - item_unit_price * quantity_purchased * receivings_items.receiving_quantity * discount / 100 + item_unit_price * quantity_purchased * receivings_items.receiving_quantity * fee / 100 ELSE item_unit_price * quantity_purchased * receivings_items.receiving_quantity - discount + item_unit_price * quantity_purchased * receivings_items.receiving_quantity * fee / 100 END) AS subtotal,
					MAX(CASE WHEN receivings_items.discount_type = ' . PERCENT . ' THEN item_unit_price * quantity_purchased * receivings_items.receiving_quantity - item_unit_price * quantity_purchased * receivings_items.receiving_quantity * discount / 100 + item_unit_price * quantity_purchased * receivings_items.receiving_quantity * fee / 100 ELSE item_unit_price * quantity_purchased * receivings_items.receiving_quantity - discount + item_unit_price * quantity_purchased * receivings_items.receiving_quantity * fee / 100 END) AS total,
					MAX((CASE WHEN receivings_items.discount_type = ' . PERCENT . ' THEN item_unit_price * quantity_purchased * receivings_items.receiving_quantity - item_unit_price * quantity_purchased * receivings_items.receiving_quantity * discount / 100 + item_unit_price * quantity_purchased * receivings_items.receiving_quantity * fee / 100 ELSE item_unit_price * quantity_purchased * receivings_items.receiving_quantity - discount + item_unit_price * quantity_purchased * receivings_items.receiving_quantity * fee END) - (item_cost_price * quantity_purchased)) AS profit,
					MAX(item_cost_price * quantity_purchased * receivings_items.receiving_quantity ) AS cost
				FROM ' . $this->db->dbprefix('receivings_items') . ' AS receivings_items
				INNER JOIN ' . $this->db->dbprefix('receivings') . ' AS receivings
					ON receivings_items.receiving_id = receivings.receiving_id
				INNER JOIN ' . $this->db->dbprefix('items') . ' AS items
					ON receivings_items.item_id = items.item_id
				' . "
				$where
				" . '
				GROUP BY receivings_items.receiving_id, items.item_id, receivings_items.line
			)'
        );
    }

    public function get_number_reviving_today()
    {
        $this->db->from('receivings');
        $this->db->join('ospos_consignmenters', 'receivings.consignmenter_id = ospos_consignmenters.person_id', 'left');
        $this->db->where('DATE_FORMAT(receiving_time, "%Y-%m-%d") >= DATE_FORMAT(NOW(), "%Y-%m-%d") AND consignmenter_name like CONCAT(DATE_FORMAT(NOW(), "%d%m"), \'%\')');
        $number = $this->db->get()->num_rows();
        return $number + 1;
    }

    public function get_receiving_by_consignmenter_id($consignmenter_id)
    {
        $temp = (string)trim($consignmenter_id);
        $this->db->from('receivings');
        $this->db->where('consignmenter_id', $temp);
        $query = $this->db->get();

        if ($query->num_rows() === 1) {
            return $query->row();
        }
        return null;
    }
}

?>

<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Tabular views helper
 */

/*
Basic tabular headers function
*/
function transform_headers_readonly($array)
{
    $result = array();

    foreach ($array as $key => $value) {
        $result[] = array('field' => $key, 'title' => $value, 'sortable' => $value != '', 'switchable' => !preg_match('(^$|&nbsp)', $value));
    }

    return json_encode($result);
}

/*
Basic tabular headers function
*/
function transform_headers($array, $readonly = FALSE, $editable = TRUE)
{
    $result = array();

    if (!$readonly) {
        $array = array_merge(array(array('checkbox' => 'select', 'sortable' => FALSE)), $array);
    }

    if ($editable) {
        $array[] = array('edit' => '');
    }

    foreach ($array as $element) {
        reset($element);
        $result[] = array('field' => key($element),
            'title' => current($element),
            'switchable' => isset($element['switchable']) ? $element['switchable'] : !preg_match('(^$|&nbsp)', current($element)),
            'sortable' => isset($element['sortable']) ? $element['sortable'] : current($element) != '',
            'checkbox' => isset($element['checkbox']) ? $element['checkbox'] : FALSE,
            'class' => isset($element['checkbox']) || preg_match('(^$|&nbsp)', current($element)) ? 'print_hide' : '',
            'sorter' => isset($element['sorter']) ? $element ['sorter'] : '');
    }

    return json_encode($result);
}


/*
Get the header for the sales tabular view
*/
function get_sales_manage_table_headers()
{
    $CI =& get_instance();

    $headers = array(
        array('sale_id' => $CI->lang->line('common_id')),
        array('sale_time' => $CI->lang->line('sales_sale_time')),
        array('customer_name' => $CI->lang->line('customers_customer')),
        array('amount_due' => $CI->lang->line('sales_amount_due')),
        array('amount_tendered' => $CI->lang->line('sales_amount_tendered')),
        array('change_due' => $CI->lang->line('sales_change_due')),
        array('payment_type' => $CI->lang->line('sales_payment_type'))
    );

    if ($CI->config->item('invoice_enable') == TRUE) {
        $headers[] = array('invoice_number' => $CI->lang->line('sales_invoice_number'));
        $headers[] = array('invoice' => '&nbsp', 'sortable' => FALSE);
    }

    $headers[] = array('receipt' => '&nbsp', 'sortable' => FALSE);

    return transform_headers($headers);
}

/*
Get the html data row for the sales
*/
function get_sale_data_row($sale)
{
    $CI =& get_instance();

    $controller_name = $CI->uri->segment(1);

    $row = array(
        'sale_id' => $sale->sale_id,
        'sale_time' => to_datetime(strtotime($sale->sale_time)),
        'customer_name' => $sale->customer_name,
        'amount_due' => to_currency($sale->amount_due),
        'amount_tendered' => to_currency($sale->amount_tendered),
        'change_due' => to_currency($sale->change_due),
        'payment_type' => $sale->payment_type
    );

    if ($CI->config->item('invoice_enable')) {
        $row['invoice_number'] = $sale->invoice_number;
        $row['invoice'] = empty($sale->invoice_number) ? '' : anchor($controller_name . "/invoice/$sale->sale_id", '<span class="glyphicon glyphicon-list-alt"></span>',
            array('title' => $CI->lang->line('sales_show_invoice'))
        );
    }

    $row['receipt'] = anchor($controller_name . "/receipt/$sale->sale_id", '<span class="glyphicon glyphicon-usd"></span>',
        array('title' => $CI->lang->line('sales_show_receipt'))
    );
    $row['edit'] = anchor($controller_name . "/edit/$sale->sale_id", '<span class="glyphicon glyphicon-edit"></span>',
        array('class' => 'modal-dlg print_hide', 'data-btn-delete' => $CI->lang->line('common_delete'), 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line($controller_name . '_update'))
    );

    return $row;
}

/*
Get the html data last row for the sales
*/
function get_sale_data_last_row($sales)
{
    $CI =& get_instance();

    $sum_amount_due = 0;
    $sum_amount_tendered = 0;
    $sum_change_due = 0;

    foreach ($sales->result() as $key => $sale) {
        $sum_amount_due += $sale->amount_due;
        $sum_amount_tendered += $sale->amount_tendered;
        $sum_change_due += $sale->change_due;
    }

    return array(
        'sale_id' => '-',
        'sale_time' => '<b>' . $CI->lang->line('sales_total') . '</b>',
        'amount_due' => '<b>' . to_currency($sum_amount_due) . '</b>',
        'amount_tendered' => '<b>' . to_currency($sum_amount_tendered) . '</b>',
        'change_due' => '<b>' . to_currency($sum_change_due) . '</b>'
    );
}

/*
Get the sales payments summary
*/
function get_sales_manage_payments_summary($payments, $sales)
{
    $CI =& get_instance();

    $table = '<div id="report_summary">';

    foreach ($payments as $key => $payment) {
        $amount = $payment['payment_amount'];

        // WARNING: the strong assumption here is that if a change is due it was a cash transaction always
        // therefore we remove from the total cash amount any change due
        if ($payment['payment_type'] == $CI->lang->line('sales_cash')) {
            foreach ($sales->result_array() as $key => $sale) {
                $amount -= $sale['change_due'];
            }
        }
        $table .= '<div class="summary_row">' . $payment['payment_type'] . ': ' . to_currency($amount) . '</div>';
    }
    $table .= '</div>';

    return $table;
}


/*
Get the header for the people tabular view
*/
function get_people_manage_table_headers()
{
    $CI =& get_instance();

    $headers = array(
        array('people.person_id' => $CI->lang->line('common_id')),
        array('name' => $CI->lang->line('common_name')),
        array('email' => $CI->lang->line('common_email')),
        array('phone_number' => $CI->lang->line('common_phone_number'))
    );

    if ($CI->Employee->has_grant('messages', $CI->session->userdata('person_id'))) {
        $headers[] = array('messages' => '', 'sortable' => FALSE);
    }

    return transform_headers($headers);
}

/*
Get the html data row for the person
*/
function get_person_data_row($person)
{
    $CI =& get_instance();
    $controller_name = strtolower(get_class($CI));

    return array(
        'people.person_id' => $person->person_id,
        'name' => $person->name,
        'email' => empty($person->email) ? '' : mailto($person->email, $person->email),
        'phone_number' => $person->phone_number,
        'messages' => empty($person->phone_number) ? '' : anchor("Messages/view/$person->person_id", '<span class="glyphicon glyphicon-phone"></span>',
            array('class' => 'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line('messages_sms_send'))),
        'edit' => anchor($controller_name . "/view/$person->person_id", '<span class="glyphicon glyphicon-edit"></span>',
            array('class' => 'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line($controller_name . '_update'))
        )
    );
}


/*
Get the header for the customer tabular view
*/
function get_customer_manage_table_headers()
{
    $CI =& get_instance();

    $headers = array(
        array('people.person_id' => $CI->lang->line('common_id')),
        array('name' => $CI->lang->line('common_name')),
        array('phone_number' => $CI->lang->line('common_phone_number')),
        array('total' => $CI->lang->line('common_total_spent'), 'sortable' => FALSE)
    );

    if ($CI->Employee->has_grant('messages', $CI->session->userdata('person_id'))) {
        $headers[] = array('messages' => '', 'sortable' => FALSE);
    }

    return transform_headers($headers);
}

/*
Get the html data row for the customer
*/
function get_customer_data_row($person, $stats)
{
    $CI =& get_instance();

    $controller_name = strtolower(get_class($CI));

    return array(
        'people.person_id' => $person->person_id,
        'name' => $person->name,
        'email' => empty($person->email) ? '' : mailto($person->email, $person->email),
        'phone_number' => $person->phone_number,
        'total' => to_currency($stats->total),
        'messages' => empty($person->phone_number) ? '' : anchor("Messages/view/$person->person_id", '<span class="glyphicon glyphicon-phone"></span>',
            array('class' => 'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line('messages_sms_send'))),
        'edit' => anchor($controller_name . "/view/$person->person_id", '<span class="glyphicon glyphicon-edit"></span>',
            array('class' => 'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line($controller_name . '_update'))
        ));
}


/*
Get the header for the consignmenters tabular view
*/
function get_consignmenters_manage_table_headers()
{
    $CI =& get_instance();

    $headers = array(
        array('people.person_id' => $CI->lang->line('common_id')),
        array('consignmenter_name' => $CI->lang->line('consignmenters_consignmenter')),
        array('name' => $CI->lang->line('common_name')),
        array('phone_number' => $CI->lang->line('common_phone_number')),
        array('images' => $CI->lang->line('consignmenters_images'))
    );

    if ($CI->Employee->has_grant('messages', $CI->session->userdata('person_id'))) {
        $headers[] = array('messages' => '');
    }

    return transform_headers($headers);
}

/*
Get the html data row for the consignmenter
*/
function get_consignmenter_data_row($consignmenter)
{
    $CI =& get_instance();

    $controller_name = strtolower(get_class($CI));

    return array(
        'people.person_id' => $consignmenter->person_id,
        'consignmenter_name' => $consignmenter->consignmenter_name,
        'agency_name' => $consignmenter->agency_name,
        'category' => $consignmenter->category,
        'name' => $consignmenter->name,
        'email' => empty($consignmenter->email) ? '' : mailto($consignmenter->email, $consignmenter->email),
        'phone_number' => $consignmenter->phone_number,
        'messages' => empty($consignmenter->phone_number) ? '' : anchor("Messages/view/$consignmenter->person_id", '<span class="glyphicon glyphicon-phone"></span>',
            array('class' => "modal-dlg", 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line('messages_sms_send'))),
        'images' => anchor($controller_name . "/view_images/$consignmenter->person_id", $CI->lang->line('consignmenters_images'),
            array('class' => "btn btn-info btn-sm", 'target' => '_blank', 'title' => $CI->lang->line($controller_name . '_images'))),
        'edit' => anchor($controller_name . "/view/$consignmenter->person_id", '<span class="glyphicon glyphicon-edit"></span>',
            array('class' => "modal-dlg", 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line($controller_name . '_update')))
    );
}


/*
Get the header for the items tabular view
*/
function get_items_manage_table_headers()
{
    $CI =& get_instance();

    $definition_names = $CI->Attribute->get_definitions_by_flags(Attribute::SHOW_IN_ITEMS);

    $headers = array(
        array('items.item_id' => $CI->lang->line('common_id')),
        array('name' => $CI->lang->line('items_name')),
        array('consignmenter_name' => $CI->lang->line('consignmenters_consignmenter')),
        array('receiving_id' => $CI->lang->line('receivings_id')),
        array('cost_price' => $CI->lang->line('items_cost_price')),
        array('unit_price' => $CI->lang->line('items_unit_price')),
        array('expiration_date' => $CI->lang->line('expiration_date')),
        array('quantity' => $CI->lang->line('items_quantity')),
        array('paid' => $CI->lang->line('items_paid'))
    );

    $headers[] = array('item_pic' => $CI->lang->line('items_image'), 'sortable' => FALSE);

    foreach ($definition_names as $definition_id => $definition_name) {
        $headers[] = array($definition_id => $definition_name);
    }

    $headers[] = array('inventory' => '');
    $headers[] = array('stock' => '');

    return transform_headers($headers);
}

/*
Get the html data row for the item
*/
function get_item_data_row($item)
{
    $CI =& get_instance();

    if ($CI->config->item('use_destination_based_tax') == '1') {
        if ($item->tax_category_id == NULL) {
            $tax_percents = '-';
        } else {
            $tax_category_info = $CI->Tax_category->get_info($item->tax_category_id);
            $tax_percents = $tax_category_info->tax_category;
        }
    } else {
        $item_tax_info = $CI->Item_taxes->get_info($item->item_id);
        $tax_percents = '';
        foreach ($item_tax_info as $tax_info) {
            $tax_percents .= to_tax_decimals($tax_info['percent']) . '%, ';
        }
        // remove ', ' from last item
        $tax_percents = substr($tax_percents, 0, -2);
        $tax_percents = !$tax_percents ? '-' : $tax_percents;
    }

    $controller_name = strtolower(get_class($CI));

    $image = NULL;
    if ($item->pic_filename != '') {
        $ext = pathinfo($item->pic_filename, PATHINFO_EXTENSION);
        if ($ext == '') {
            // legacy
            $images = glob('./uploads/item_pics/' . $item->pic_filename . '.*');
        } else {
            // preferred
            $images = glob('./uploads/item_pics/' . $item->pic_filename);
        }

        if (sizeof($images) > 0) {
            $image .= '<a class="rollover" href="' . base_url($images[0]) . '"><img src="' . site_url('items/pic_thumb/' . pathinfo($images[0], PATHINFO_BASENAME)) . '"></a>';
        }
    }

    if ($CI->config->item('multi_pack_enabled') == '1') {
        $item->name .= NAME_SEPARATOR . $item->pack_name;
    }

    $definition_names = $CI->Attribute->get_definitions_by_flags(Attribute::SHOW_IN_ITEMS);

    $columns = array(
        'items.item_id' => $item->item_id,
        'item_number' => $item->item_number,
        'name' => $item->name,
        'category' => $item->category,
        'consignmenter_name' => $item->consignmenter_name,
        'receiving_id' => $item->receiving_id,
        'cost_price' => to_currency($item->cost_price),
        'unit_price' => to_currency($item->unit_price),
        'expiration_date' => empty($item->expiration_date) ? NULL : date('d/m/Y', strtotime($item->expiration_date)),
        'quantity' => to_quantity_decimals($item->quantity),
        'tax_percents' => !$tax_percents ? '-' : $tax_percents,
        'paid' => binary_to_icon($item->paid),
        'item_pic' => $image
    );

    $icons = array(
        'inventory' => anchor($controller_name . "/inventory/$item->item_id", '<span class="glyphicon glyphicon-pushpin"></span>',
            array('class' => 'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line($controller_name . '_count'))
        ),
        'stock' => anchor($controller_name . "/count_details/$item->item_id", '<span class="glyphicon glyphicon-list-alt"></span>',
            array('class' => 'modal-dlg', 'title' => $CI->lang->line($controller_name . '_details_count'))
        ),
        'edit' => anchor($controller_name . "/view/$item->item_id", '<span class="glyphicon glyphicon-edit"></span>',
            array('class' => 'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line($controller_name . '_update'))
        )
    );

    return $columns + expand_attribute_values($definition_names, (array)$item) + $icons;

}


/*
Get the header for the giftcard tabular view
*/
function get_giftcards_manage_table_headers()
{
    $CI =& get_instance();

    $headers = array(
        array('giftcard_id' => $CI->lang->line('common_id')),
        array('name' => $CI->lang->line('common_name')),
        array('giftcard_number' => $CI->lang->line('giftcards_giftcard_number')),
        array('value' => $CI->lang->line('giftcards_card_value'))
    );

    return transform_headers($headers);
}

/*
Get the html data row for the giftcard
*/
function get_giftcard_data_row($giftcard)
{
    $CI =& get_instance();

    $controller_name = strtolower(get_class($CI));

    return array(
        'giftcard_id' => $giftcard->giftcard_id,
        'name' => $giftcard->name,
        'giftcard_number' => $giftcard->giftcard_number,
        'value' => to_currency($giftcard->value),
        'edit' => anchor($controller_name . "/view/$giftcard->giftcard_id", '<span class="glyphicon glyphicon-edit"></span>',
            array('class' => 'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line($controller_name . '_update'))
        )
    );
}

/*
Get the header for the item kits tabular view
*/
function get_item_kits_manage_table_headers()
{
    $CI =& get_instance();

    $headers = array(
        array('item_kit_id' => $CI->lang->line('item_kits_kit')),
        array('name' => $CI->lang->line('item_kits_name')),
        array('description' => $CI->lang->line('item_kits_description')),
        array('total_cost_price' => $CI->lang->line('items_cost_price'), 'sortable' => FALSE),
        array('total_unit_price' => $CI->lang->line('items_unit_price'), 'sortable' => FALSE)
    );

    return transform_headers($headers);
}

/*
Get the html data row for the item kit
*/
function get_item_kit_data_row($item_kit)
{
    $CI =& get_instance();

    $controller_name = strtolower(get_class($CI));

    return array(
        'item_kit_id' => $item_kit->item_kit_id,
        'name' => $item_kit->name,
        'description' => $item_kit->description,
        'total_cost_price' => to_currency($item_kit->total_cost_price),
        'total_unit_price' => to_currency($item_kit->total_unit_price),
        'edit' => anchor($controller_name . "/view/$item_kit->item_kit_id", '<span class="glyphicon glyphicon-edit"></span>',
            array('class' => 'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line($controller_name . '_update'))
        )
    );
}

function parse_attribute_values($columns, $row)
{
    $attribute_values = array();
    foreach ($columns as $column) {
        if (array_key_exists($column, $row)) {
            $attribute_value = explode('|', $row[$column]);
            $attribute_values = array_merge($attribute_values, $attribute_value);
        }
    }
    return $attribute_values;
}

function expand_attribute_values($definition_names, $row)
{
    $values = parse_attribute_values(array('attribute_values', 'attribute_dtvalues', 'attribute_dvalues'), $row);

    $indexed_values = array();
    foreach ($values as $attribute_value) {
        $exploded_value = explode('_', $attribute_value);
        if (sizeof($exploded_value) > 1) {
            $indexed_values[$exploded_value[0]] = $exploded_value[1];
        }
    }

    $attribute_values = array();
    foreach ($definition_names as $definition_id => $definition_name) {
        if (isset($indexed_values[$definition_id])) {
            $attribute_value = $indexed_values[$definition_id];
            $attribute_values["$definition_id"] = $attribute_value;
        }
    }

    return $attribute_values;
}

function get_attribute_definition_manage_table_headers()
{
    $CI =& get_instance();

    $headers = array(
        array('definition_id' => $CI->lang->line('attributes_definition_id')),
        array('definition_name' => $CI->lang->line('attributes_definition_name')),
        array('definition_type' => $CI->lang->line('attributes_definition_type')),
        array('definition_flags' => $CI->lang->line('attributes_definition_flags')),
        array('definition_group' => $CI->lang->line('attributes_definition_group')),
    );

    return transform_headers($headers);
}

function get_attribute_definition_data_row($attribute)
{
    $CI =& get_instance();

    $controller_name = strtolower(get_class($CI));

    if (count($attribute->definition_flags) == 0) {
        $definition_flags = $CI->lang->line('common_none_selected_text');
    } else if ($attribute->definition_type == GROUP) {
        $definition_flags = "-";
    } else {
        $definition_flags = implode(', ', $attribute->definition_flags);
    }

    return array(
        'definition_id' => $attribute->definition_id,
        'definition_name' => $attribute->definition_name,
        'definition_type' => $attribute->definition_type,
        'definition_group' => $attribute->definition_group,
        'definition_flags' => $definition_flags,
        'edit' => anchor("$controller_name/view/$attribute->definition_id", '<span class="glyphicon glyphicon-edit"></span>',
            array('class' => 'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line($controller_name . '_update'))
        )
    );
}

/*
Get the header for the expense categories tabular view
*/
function get_expense_category_manage_table_headers()
{
    $CI =& get_instance();

    $headers = array(
        array('expense_category_id' => $CI->lang->line('expenses_categories_category_id')),
        array('category_name' => $CI->lang->line('expenses_categories_name')),
        array('category_description' => $CI->lang->line('expenses_categories_description'))
    );

    return transform_headers($headers);
}

/*
Gets the html data row for the expenses category
*/
function get_expense_category_data_row($expense_category)
{
    $CI =& get_instance();

    $controller_name = strtolower(get_class($CI));

    return array(
        'expense_category_id' => $expense_category->expense_category_id,
        'category_name' => $expense_category->category_name,
        'category_description' => $expense_category->category_description,
        'edit' => anchor($controller_name . "/view/$expense_category->expense_category_id", '<span class="glyphicon glyphicon-edit"></span>',
            array('class' => 'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line($controller_name . '_update'))
        )
    );
}


/*
Get the header for the expenses tabular view
*/
function get_expenses_manage_table_headers()
{
    $CI =& get_instance();

    $headers = array(
        array('expense_id' => $CI->lang->line('expenses_expense_id')),
        array('date' => $CI->lang->line('expenses_date')),
        array('consignmenter_name' => $CI->lang->line('expenses_consignmenter_name')),
        array('consignmenter_tax_code' => $CI->lang->line('expenses_consignmenter_tax_code')),
        array('amount' => $CI->lang->line('expenses_amount')),
        array('tax_amount' => $CI->lang->line('expenses_tax_amount')),
        array('payment_type' => $CI->lang->line('expenses_payment')),
        array('category_name' => $CI->lang->line('expenses_categories_name')),
        array('description' => $CI->lang->line('expenses_description')),
        array('created_by' => $CI->lang->line('expenses_employee'))
    );

    return transform_headers($headers);
}

/*
Gets the html data row for the expenses
*/
function get_expenses_data_row($expense)
{
    $CI =& get_instance();

    $controller_name = strtolower(get_class($CI));

    return array(
        'expense_id' => $expense->expense_id,
        'date' => to_datetime(strtotime($expense->date)),
        'consignmenter_name' => $expense->consignmenter_name,
        'consignmenter_tax_code' => $expense->consignmenter_tax_code,
        'amount' => to_currency($expense->amount),
        'tax_amount' => to_currency($expense->tax_amount),
        'payment_type' => $expense->payment_type,
        'category_name' => $expense->category_name,
        'description' => $expense->description,
        'created_by' => $expense->name,
        'edit' => anchor($controller_name . "/view/$expense->expense_id", '<span class="glyphicon glyphicon-edit"></span>',
            array('class' => 'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line($controller_name . '_update'))
        )
    );
}

/*
Get the html data last row for the expenses
*/
function get_expenses_data_last_row($expense)
{
    $CI =& get_instance();

    $table_data_rows = '';
    $sum_amount_expense = 0;
    $sum_tax_amount_expense = 0;

    foreach ($expense->result() as $key => $expense) {
        $sum_amount_expense += $expense->amount;
        $sum_tax_amount_expense += $expense->tax_amount;
    }

    return array(
        'expense_id' => '-',
        'date' => '<b>' . $CI->lang->line('sales_total') . '</b>',
        'amount' => '<b>' . to_currency($sum_amount_expense) . '</b>',
        'tax_amount' => '<b>' . to_currency($sum_tax_amount_expense) . '</b>'
    );
}

/*
Get the expenses payments summary
*/
function get_expenses_manage_payments_summary($payments, $expenses)
{
    $CI =& get_instance();

    $table = '<div id="report_summary">';

    foreach ($payments as $key => $payment) {
        $amount = $payment['amount'];
        $table .= '<div class="summary_row">' . $payment['payment_type'] . ': ' . to_currency($amount) . '</div>';
    }

    $table .= '</div>';

    return $table;
}


/*
Get the header for the cashup tabular view
*/
function get_cashups_manage_table_headers()
{
    $CI =& get_instance();

    $headers = array(
        array('cashup_id' => $CI->lang->line('cashups_id')),
        array('open_date' => $CI->lang->line('cashups_opened_date')),
        array('open_employee_id' => $CI->lang->line('cashups_open_employee')),
        array('open_amount_cash' => $CI->lang->line('cashups_open_amount_cash')),
        array('transfer_amount_cash' => $CI->lang->line('cashups_transfer_amount_cash')),
        array('close_date' => $CI->lang->line('cashups_closed_date')),
        array('close_employee_id' => $CI->lang->line('cashups_close_employee')),
        array('closed_amount_cash' => $CI->lang->line('cashups_closed_amount_cash')),
        array('note' => $CI->lang->line('cashups_note')),
        array('closed_amount_due' => $CI->lang->line('cashups_closed_amount_due')),
        array('closed_amount_card' => $CI->lang->line('cashups_closed_amount_card')),
        array('closed_amount_check' => $CI->lang->line('cashups_closed_amount_check')),
        array('closed_amount_total' => $CI->lang->line('cashups_closed_amount_total'))
    );

    return transform_headers($headers);
}

/*
Gets the html data row for the cashups
*/
function get_cash_up_data_row($cash_up)
{
    $CI =& get_instance();

    $controller_name = strtolower(get_class($CI));

    return array(
        'cashup_id' => $cash_up->cashup_id,
        'open_date' => to_datetime(strtotime($cash_up->open_date)),
        'open_employee_id' => $cash_up->open_name,
        'open_amount_cash' => to_currency($cash_up->open_amount_cash),
        'transfer_amount_cash' => to_currency($cash_up->transfer_amount_cash),
        'close_date' => to_datetime(strtotime($cash_up->close_date)),
        'close_employee_id' => $cash_up->close_name,
        'closed_amount_cash' => to_currency($cash_up->closed_amount_cash),
        'note' => $cash_up->note ? '<span class="glyphicon glyphicon-ok"></span>' : '<span class="glyphicon glyphicon-remove"></span>',
        'closed_amount_due' => to_currency($cash_up->closed_amount_due),
        'closed_amount_card' => to_currency($cash_up->closed_amount_card),
        'closed_amount_check' => to_currency($cash_up->closed_amount_check),
        'closed_amount_total' => to_currency($cash_up->closed_amount_total),
        'edit' => anchor($controller_name . "/view/$cash_up->cashup_id", '<span class="glyphicon glyphicon-edit"></span>',
            array('class' => 'modal-dlg', 'data-btn-submit' => $CI->lang->line('common_submit'), 'title' => $CI->lang->line($controller_name . '_update'))
        )
    );
}

?>

<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once("Summary_report.php");

class Summary_consignmenters extends Summary_report
{
	protected function _get_data_columns()
	{
		return array(
			array('consignmenter_name' => $this->lang->line('reports_consignmenter')),
			array('quantity' => $this->lang->line('reports_quantity')),
			array('subtotal' => $this->lang->line('reports_subtotal'), 'sorter' => 'number_sorter'),
			array('tax' => $this->lang->line('reports_tax'), 'sorter' => 'number_sorter'),
			array('total' => $this->lang->line('reports_total'), 'sorter' => 'number_sorter'),
			array('cost' => $this->lang->line('reports_cost'), 'sorter' => 'number_sorter'),
			array('profit' => $this->lang->line('reports_profit'), 'sorter' => 'number_sorter'));
	}

	protected function _select(array $inputs)
	{
		parent::_select($inputs);

		$this->db->select('
				MAX(CONCAT(consignmenter_c.company_name, " (", consignmenter_p.name, ")")) AS consignmenter,
				SUM(sales_items.quantity_purchased) AS quantity_purchased
		');
	}

	protected function _from()
	{
		parent::_from();

		$this->db->join('items AS items', 'sales_items.item_id = items.item_id');
		$this->db->join('consignmenters AS consignmenter_c', 'items.consignmenter_id = consignmenter_c.person_id ');
		$this->db->join('people AS consignmenter_p', 'items.consignmenter_id = consignmenter_p.person_id');
	}

	protected function _group_order()
	{
		$this->db->group_by('items.consignmenter_id');
		$this->db->order_by('MAX(CONCAT(consignmenter_c.company_name, " (", consignmenter_p.name, ")"))');
	}
}
?>

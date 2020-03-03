<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once("Persons.php");

class Consignmenters extends Persons
{
	public function __construct()
	{
		parent::__construct('consignmenters');
	}

	public function index()
	{
		$data['table_headers'] = $this->xss_clean(get_suppliers_manage_table_headers());

		$this->load->view('people/manage', $data);
	}

	/*
	Gets one row for a consignmenter manage table. This is called using AJAX to update one row.
	*/
	public function get_row($row_id)
	{
		$data_row = $this->xss_clean(get_supplier_data_row($this->Consignmenter->get_info($row_id)));

		echo json_encode($data_row);
	}
	
	/*
	Returns Consignmenter table data rows. This will be called with AJAX.
	*/
	public function search()
	{
		$search = $this->input->get('search');
		$limit  = $this->input->get('limit');
		$offset = $this->input->get('offset');
		$sort   = $this->input->get('sort');
		$order  = $this->input->get('order');

		$consignmenters = $this->Consignmenter->search($search, $limit, $offset, $sort, $order);
		$total_rows = $this->Consignmenter->get_found_rows($search);

		$data_rows = array();
		foreach($consignmenters->result() as $consignmenter)
		{
			$row = $this->xss_clean(get_supplier_data_row($consignmenter));
			$row['category'] = $this->Consignmenter->get_category_name($row['category']);
			$data_rows[] = $row;
		}

		echo json_encode(array('total' => $total_rows, 'rows' => $data_rows));
	}
	
	/*
	Gives search suggestions based on what is being searched for
	*/
	public function suggest()
	{
		$suggestions = $this->xss_clean($this->Consignmenter->get_search_suggestions($this->input->get('term'), TRUE));

		echo json_encode($suggestions);
	}

	public function suggest_search()
	{
		$suggestions = $this->xss_clean($this->Consignmenter->get_search_suggestions($this->input->post('term'), FALSE));

		echo json_encode($suggestions);
	}
	
	/*
	Loads the consignmenter edit form
	*/
	public function view($supplier_id = -1)
	{
		$info = $this->Consignmenter->get_info($supplier_id);
		foreach(get_object_vars($info) as $property => $value)
		{
			$info->$property = $this->xss_clean($value);
		}
		$data['person_info'] = $info;
		$data['categories'] = $this->Consignmenter->get_categories();

		$this->load->view("consignmenters/form", $data);
	}
	
	/*
	Inserts/updates a consignmenter
	*/
	public function save($supplier_id = -1)
	{
		$name = $this->xss_clean($this->input->post('name'));
		$email = $this->xss_clean(strtolower($this->input->post('email')));

		// format first and last name properly
		$name = $this->nameize($name);

		$person_data = array(
			'name' => $name,
			'gender' => $this->input->post('gender'),
			'email' => $email,
			'phone_number' => $this->input->post('phone_number'),
			'address_1' => $this->input->post('address_1'),
			'address_2' => $this->input->post('address_2'),
			'city' => $this->input->post('city'),
			'state' => $this->input->post('state'),
			'zip' => $this->input->post('zip'),
			'country' => $this->input->post('country'),
			'comments' => $this->input->post('comments')
		);

		$supplier_data = array(
			'company_name' => $this->input->post('company_name'),
			'agency_name' => $this->input->post('agency_name'),
			'category' => $this->input->post('category'),
			'account_number' => $this->input->post('account_number') == '' ? NULL : $this->input->post('account_number'),
			'tax_id' => $this->input->post('tax_id')
		);

		if($this->Consignmenter->save_supplier($person_data, $supplier_data, $supplier_id))
		{
			$supplier_data = $this->xss_clean($supplier_data);

			//New consignmenter
			if($supplier_id == -1)
			{
				echo json_encode(array('success' => TRUE,
								'message' => $this->lang->line('suppliers_successful_adding') . ' ' . $supplier_data['company_name'],
								'id' => $supplier_data['person_id']));
			}
			else //Existing consignmenter
			{
				echo json_encode(array('success' => TRUE,
								'message' => $this->lang->line('suppliers_successful_updating') . ' ' . $supplier_data['company_name'],
								'id' => $supplier_id));
			}
		}
		else//failure
		{
			$supplier_data = $this->xss_clean($supplier_data);

			echo json_encode(array('success' => FALSE,
							'message' => $this->lang->line('suppliers_error_adding_updating') . ' ' . 	$supplier_data['company_name'],
							'id' => -1));
		}
	}
	
	/*
	This deletes consignmenters from the consignmenters table
	*/
	public function delete()
	{
		$suppliers_to_delete = $this->xss_clean($this->input->post('ids'));

		if($this->Consignmenter->delete_list($suppliers_to_delete))
		{
			echo json_encode(array('success' => TRUE,'message' => $this->lang->line('suppliers_successful_deleted').' '.
							count($suppliers_to_delete).' '.$this->lang->line('suppliers_one_or_multiple')));
		}
		else
		{
			echo json_encode(array('success' => FALSE,'message' => $this->lang->line('suppliers_cannot_be_deleted')));
		}
	}
	
}
?>

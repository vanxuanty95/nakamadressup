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
		$data['table_headers'] = $this->xss_clean(get_consignmenters_manage_table_headers());

		$this->load->view('people/manage', $data);
	}

	/*
	Gets one row for a consignmenter manage table. This is called using AJAX to update one row.
	*/
	public function get_row($row_id)
	{
		$data_row = $this->xss_clean(get_consignmenter_data_row($this->Consignmenter->get_info($row_id)));

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
			$row = $this->xss_clean(get_consignmenter_data_row($consignmenter));
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
	public function view($consignmenter_id = -1)
	{
		$info = $this->Consignmenter->get_info($consignmenter_id);
		foreach(get_object_vars($info) as $property => $value)
		{
			$info->$property = $this->xss_clean($value);
		}
		$data['person_info'] = $info;
		$data['categories'] = $this->Consignmenter->get_categories();

		$this->load->view("consignmenters/form", $data);
	}

	/*
	Loads the consignmenter edit form
	*/
	public function view_images($consignmenter_id = -1)
	{
		$info = $this->Consignmenter->get_info($consignmenter_id);
		$images = $this->Consignmenter->get_items_images($consignmenter_id);
		foreach(get_object_vars($info) as $property => $value)
		{
			$info->$property = $this->xss_clean($value);
		}
		$data['person_info'] = $info;
		$data['images'] = $images->result_array();

		$this->load->view("consignmenters/images", $data);
	}
	
	/*
	Inserts/updates a consignmenter
	*/
	public function save($consignmenter_id = -1)
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

		$consignmenter_data = array(
			'consignmenter_name' => $this->input->post('consignmenter_name'),
			'agency_name' => $this->input->post('agency_name'),
			'category' => $this->input->post('category'),
			'account_number' => $this->input->post('account_number') == '' ? NULL : $this->input->post('account_number'),
			'tax_id' => $this->input->post('tax_id')
		);

		if($this->Consignmenter->save_consignmenter($person_data, $consignmenter_data, $consignmenter_id))
		{
			$consignmenter_data = $this->xss_clean($consignmenter_data);

			//New consignmenter
			if($consignmenter_id == -1)
			{
				echo json_encode(array('success' => TRUE,
								'message' => $this->lang->line('consignmenters_successful_adding') . ' ' . $consignmenter_data['consignmenter_name'],
								'id' => $consignmenter_data['person_id']));
			}
			else //Existing consignmenter
			{
				echo json_encode(array('success' => TRUE,
								'message' => $this->lang->line('consignmenters_successful_updating') . ' ' . $consignmenter_data['consignmenter_name'],
								'id' => $consignmenter_id));
			}
		}
		else//failure
		{
			$consignmenter_data = $this->xss_clean($consignmenter_data);

			echo json_encode(array('success' => FALSE,
							'message' => $this->lang->line('consignmenters_error_adding_updating') . ' ' . 	$consignmenter_data['consignmenter_name'],
							'id' => -1));
		}
	}
	
	/*
	This deletes consignmenters from the consignmenters table
	*/
	public function delete()
	{
		$consignmenters_to_delete = $this->xss_clean($this->input->post('ids'));

		if($this->Consignmenter->delete_list($consignmenters_to_delete))
		{
			echo json_encode(array('success' => TRUE,'message' => $this->lang->line('consignmenters_successful_deleted').' '.
							count($consignmenters_to_delete).' '.$this->lang->line('consignmenters_one_or_multiple')));
		}
		else
		{
			echo json_encode(array('success' => FALSE,'message' => $this->lang->line('consignmenters_cannot_be_deleted')));
		}
	}
	
}
?>

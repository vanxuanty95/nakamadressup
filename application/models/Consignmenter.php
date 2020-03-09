<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Consignmenter class
 */
class Consignmenter extends Person
{
    const GOODS_SUPPLIER = 0;
    const COST_SUPPLIER = 1;

    /*
    Determines if a given person_id is a customer
    */
    public function exists($person_id)
    {
        $this->db->from('consignmenters');
        $this->db->join('people', 'people.person_id = consignmenters.person_id');
        $this->db->where('consignmenters.person_id', $person_id);

        return ($this->db->get()->num_rows() == 1);
    }

    public function exists_by_consignmenter_name($consignmenter_name)
    {
        $this->db->from('consignmenters');
        $this->db->where('consignmenter_name', $consignmenter_name);

        return ($this->db->get()->num_rows() >= 1);
    }


    /*
    Gets total of rows
    */
    public function get_total_rows()
    {
        $this->db->from('consignmenters');
        $this->db->where('deleted', 0);

        return $this->db->count_all_results();
    }

    /*
    Returns all the consignmenters
    */
    public function get_all($category = self::GOODS_SUPPLIER, $limit_from = 0, $rows = 0)
    {
        $this->db->from('consignmenters');
        $this->db->join('people', 'consignmenters.person_id = people.person_id');
        $this->db->where('category', $category);
        $this->db->where('deleted', 0);
        $this->db->order_by('consignmenter_name', 'asc');
        if ($rows > 0) {
            $this->db->limit($rows, $limit_from);
        }

        return $this->db->get();
    }

    /*
    Gets information about a particular consignmenter
    */
    public function get_info($consignmenter_id)
    {
        $this->db->from('consignmenters');
        $this->db->join('people', 'people.person_id = consignmenters.person_id');
        $this->db->where('consignmenters.person_id', $consignmenter_id);
        $query = $this->db->get();

        if ($query->num_rows() == 1) {
            return $query->row();
        } else {
            //Get empty base parent object, as $consignmenter_id is NOT an consignmenter
            $person_obj = parent::get_info(-1);

            //Get all the fields from consignmenter table
            //append those fields to base parent object, we we have a complete empty object
            foreach ($this->db->list_fields('consignmenters') as $field) {
                $person_obj->$field = '';
            }
            $person_obj['consignmenter_name'] = $this->generate_consignmenter_name();
            return $person_obj;
        }
    }

    /*
    Gets information about multiple consignmenters
    */
    public function get_multiple_info($consignmenters_ids)
    {
        $this->db->from('consignmenters');
        $this->db->join('people', 'people.person_id = consignmenters.person_id');
        $this->db->where_in('consignmenters.person_id', $consignmenters_ids);
        $this->db->order_by('name', 'asc');

        return $this->db->get();
    }

    /*
    Inserts or updates a consignmenters
    */
    public function save_consignmenter(&$person_data, &$consignmenter_data, $consignmenter_id = FALSE)
    {
        $success = FALSE;

        //Run these queries as a transaction, we want to make sure we do all or nothing
        $this->db->trans_start();

        if (parent::save($person_data, $consignmenter_id)) {
            if (!$consignmenter_id || !$this->exists($consignmenter_id)) {
                $consignmenter_data['person_id'] = $person_data['person_id'];
                $success = $this->db->insert('consignmenters', $consignmenter_data);
            } else {
                $this->db->where('person_id', $consignmenter_id);
                $success = $this->db->update('consignmenters', $consignmenter_data);
            }
        }

        $this->db->trans_complete();

        $success &= $this->db->trans_status();

        return $success;
    }

    /*
    Deletes one consignmenter
    */
    public function delete($consignmenter_id)
    {
        $this->db->where('person_id', $consignmenter_id);

        return $this->db->update('consignmenters', array('deleted' => 1));
    }

    /*
    Deletes a list of consignmenters
    */
    public function delete_list($consignmenter_ids)
    {
        $this->db->where_in('person_id', $consignmenter_ids);

        return $this->db->update('consignmenters', array('deleted' => 1));
    }

    /*
   Get search suggestions to find consignmenters
   */
    public function get_search_suggestions($search, $unique = FALSE, $limit = 25)
    {
        $suggestions = array();

        $this->db->from('consignmenters');
        $this->db->join('people', 'consignmenters.person_id = people.person_id');
        $this->db->where('deleted', 0);
        $this->db->like('consignmenter_name', $search);
        $this->db->order_by('consignmenter_name', 'asc');
        foreach ($this->db->get()->result() as $row) {
            $suggestions[] = array('value' => $row->person_id, 'label' => $row->consignmenter_name);
        }

        $this->db->from('consignmenters');
        $this->db->join('people', 'consignmenters.person_id = people.person_id');
        $this->db->where('deleted', 0);
        $this->db->distinct();
        $this->db->like('agency_name', $search);
        $this->db->where('agency_name IS NOT NULL');
        $this->db->order_by('agency_name', 'asc');
        foreach ($this->db->get()->result() as $row) {
            $suggestions[] = array('value' => $row->person_id, 'label' => $row->agency_name);
        }

        $this->db->from('consignmenters');
        $this->db->join('people', 'consignmenters.person_id = people.person_id');
        $this->db->group_start();
        $this->db->like('name', $search);
        $this->db->or_like('CONCAT(name, " ", name)', $search);
        $this->db->group_end();
        $this->db->where('deleted', 0);
        $this->db->order_by('name', 'asc');
        foreach ($this->db->get()->result() as $row) {
            $suggestions[] = array('value' => $row->person_id, 'label' => $row->name);
        }

        if (!$unique) {
            $this->db->from('consignmenters');
            $this->db->join('people', 'consignmenters.person_id = people.person_id');
            $this->db->where('deleted', 0);
            $this->db->like('email', $search);
            $this->db->order_by('email', 'asc');
            foreach ($this->db->get()->result() as $row) {
                $suggestions[] = array('value' => $row->person_id, 'label' => $row->email);
            }

            $this->db->from('consignmenters');
            $this->db->join('people', 'consignmenters.person_id = people.person_id');
            $this->db->where('deleted', 0);
            $this->db->like('phone_number', $search);
            $this->db->order_by('phone_number', 'asc');
            foreach ($this->db->get()->result() as $row) {
                $suggestions[] = array('value' => $row->person_id, 'label' => $row->phone_number);
            }

            $this->db->from('consignmenters');
            $this->db->join('people', 'consignmenters.person_id = people.person_id');
            $this->db->where('deleted', 0);
            $this->db->like('account_number', $search);
            $this->db->order_by('account_number', 'asc');
            foreach ($this->db->get()->result() as $row) {
                $suggestions[] = array('value' => $row->person_id, 'label' => $row->account_number);
            }
        }

        //only return $limit suggestions
        if (count($suggestions) > $limit) {
            $suggestions = array_slice($suggestions, 0, $limit);
        }

        return $suggestions;
    }

    /*
   Gets rows
   */
    public function get_found_rows($search)
    {
        return $this->search($search, 0, 0, 'name', 'asc', TRUE);
    }

    /*
    Perform a search on consignmenters
    */
    public function search($search, $rows = 0, $limit_from = 0, $sort = 'name', $order = 'asc', $count_only = FALSE)
    {
        // get_found_rows case
        if ($count_only == TRUE) {
            $this->db->select('COUNT(consignmenters.person_id) as count');
        }

        $this->db->from('consignmenters AS consignmenters');
        $this->db->join('people', 'consignmenters.person_id = people.person_id');
        $this->db->group_start();
        $this->db->like('name', $search);
        $this->db->or_like('name', $search);
        $this->db->or_like('consignmenter_name', $search);
        $this->db->or_like('agency_name', $search);
        $this->db->or_like('email', $search);
        $this->db->or_like('phone_number', $search);
        $this->db->or_like('account_number', $search);
        $this->db->or_like('CONCAT(name, " ", name)', $search);
        $this->db->group_end();
        $this->db->where('deleted', 0);

        // get_found_rows case
        if ($count_only == TRUE) {
            return $this->db->get()->row()->count;
        }

        $this->db->order_by($sort, $order);

        if ($rows > 0) {
            $this->db->limit($rows, $limit_from);
        }

        return $this->db->get();
    }

    /*
    Return consignmenter categories
    */
    public function get_categories()
    {
        return array(
            self::GOODS_SUPPLIER => $this->lang->line('consignmenters_goods'),
            self::COST_SUPPLIER => $this->lang->line('consignmenters_cost')
        );
    }

    /*
    Return a category name given its id
    */
    public function get_category_name($id)
    {
        if ($id == self::GOODS_SUPPLIER) {
            return $this->lang->line('consignmenters_goods');
        } elseif ($id == self::COST_SUPPLIER) {
            return $this->lang->line('consignmenters_cost');
        }
    }

    public function generate_consignmenter_name()
    {
        $date = new DateTime('now');
        $date_str = $date->format('dmy');
        $number = $this->Receiving->get_number_reviving_today();
        $not_done = true;
        $consignmenter_name = '';
        while ($not_done) {
            $number_str = str_pad($number, 2, '0', STR_PAD_LEFT);
            $consignmenter_name = $date_str . $number_str;
            if ($this->exists_by_consignmenter_name($consignmenter_name)) {
                $number = $number + 1;
            } else {
                $not_done = false;
            }
        }
        return $consignmenter_name;
    }
}

?>

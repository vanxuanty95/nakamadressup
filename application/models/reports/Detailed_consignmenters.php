<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once("Report.php");

class Detailed_consignmenters extends Report
{
    public function create(array $inputs)
    {
        //Create our temp tables to work with the data in our report
        $this->Consignmenter->get_all();
    }

    public function getDataColumns()
    {
        return array(
            'summary' => array(
                array('consignmenter_name' => $this->lang->line('reports_consignmenter_name')),
                array('name' => $this->lang->line('reports_person_name')),
                array('quantity' => $this->lang->line('reports_quantity'), 'sorter' => 'number_sorter'),
                array('sold_quantity' => $this->lang->line('reports_sold_quantity'), 'sorter' => 'number_sorter'),
                array('remaining_quantity' => $this->lang->line('reports_remaining_quantity'), 'sorter' => 'number_sorter'),
                array('sold_total' => $this->lang->line('reports_sold_quantity'), 'sorter' => 'number_sorter'),
                array('consignmenter_total' => $this->lang->line('reports_consignmenter_total'), 'sorter' => 'number_sorter'),
                array('profit_total' => $this->lang->line('reports_profit_total'), 'sorter' => 'number_sorter'),),
            'details' => array(
                $this->lang->line('reports_name'),
                $this->lang->line('reports_quantity'),
                $this->lang->line('reports_sold_quantity'),
                $this->lang->line('reports_remaining_quantity'),
                $this->lang->line('reports_sold_total'),
                $this->lang->line('reports_consignmenter_total'),
                $this->lang->line('reports_profit_total'),
            )
        );
    }

    public function getData(array $inputs)
    {
        $query = $this->db->query("SELECT ospos_consignmenters.person_id,
        ospos_consignmenters.consignmenter_name,
        ospos_people.name,
        SUM(receivings.receivings_quantity)                        AS quantity,
       SUM(sales.sales_quantity)                                  AS sold_quantity,
       SUM(remaining_quantity.remaining_quantity)                 AS remaining_quantity,
       ROUND(SUM(ospos_items.cost_price))                         AS consignmenter_total,
       ROUND(SUM(sales.sold_total))                               AS sold_total,
       ROUND(SUM(sales.sold_total) - SUM(ospos_items.cost_price)) AS profit_total
        FROM ospos_consignmenters
                 LEFT JOIN ospos_people ON ospos_consignmenters.person_id = ospos_people.person_id
                 LEFT JOIN ospos_items ON ospos_items.consignmenter_id = ospos_consignmenters.person_id
                 LEFT JOIN (SELECT SUM(ospos_item_quantities.quantity) AS remaining_quantity, item_id
                            FROM ospos_item_quantities
                            GROUP BY item_id) AS remaining_quantity ON remaining_quantity.item_id = ospos_items.item_id
                 LEFT JOIN (SELECT SUM(ospos_receivings_items.quantity_purchased) AS receivings_quantity, item_id
                            FROM ospos_receivings_items
                            GROUP BY item_id) AS receivings ON receivings.item_id = ospos_items.item_id
                 LEFT JOIN (SELECT SUM(ospos_sales_items.quantity_purchased) AS sales_quantity,
                                   item_id,
                                   SUM(ospos_sales_items.item_unit_price)    AS sold_total
                            FROM ospos_sales_items
                            GROUP BY item_id) AS sales ON sales.item_id = ospos_items.item_id
        WHERE ospos_items.deleted = 0
        GROUP BY ospos_consignmenters.person_id
        ORDER BY ospos_consignmenters.consignmenter_name DESC");

        $data = array();
        $data2 = array();
        if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {
                $data2[] = $row;
            }
        }
        $data['summary'] = $data2;
        $data['details'] = array();

        foreach ($data['summary'] as $key => $value) {
            $query2 = $this->db->query("SELECT ospos_items.consignmenter_id AS person_id,
            ospos_items.item_id,
            ospos_items.name,
            ospos_items.name,
            SUM(receivings.receivings_quantity)                        AS quantity,
            SUM(sales.sales_quantity)                                  AS sold_quantity,
            SUM(remaining_quantity.remaining_quantity)                 AS remaining_quantity,
            ROUND(SUM(ospos_items.cost_price))                         AS consignmenter_total,
            ROUND(SUM(sales.sold_total))                               AS sold_total,
            ROUND(SUM(sales.sold_total) - SUM(ospos_items.cost_price)) AS profit_total
            FROM ospos_items
                     LEFT JOIN (SELECT SUM(ospos_item_quantities.quantity) AS remaining_quantity, item_id
                                FROM ospos_item_quantities
                                GROUP BY item_id) AS remaining_quantity ON remaining_quantity.item_id = ospos_items.item_id
                     LEFT JOIN (SELECT SUM(ospos_receivings_items.quantity_purchased) AS receivings_quantity, item_id
                                FROM ospos_receivings_items
                                GROUP BY item_id) AS receivings ON receivings.item_id = ospos_items.item_id
                     LEFT JOIN (SELECT SUM(ospos_sales_items.quantity_purchased) AS sales_quantity,
                                       item_id,
                                       SUM(ospos_sales_items.item_unit_price)    AS sold_total
                                FROM ospos_sales_items
                                GROUP BY item_id) AS sales ON sales.item_id = ospos_items.item_id
            WHERE ospos_items.deleted = 0 AND ospos_items.consignmenter_id = ?
            GROUP BY ospos_items.item_id
            ORDER BY ospos_items.name DESC", array($value['person_id']));
            $data['details'][$key] = $query2->result_array();
        }

        return $data;
    }

    public function getSummaryData(array $inputs)
    {
//        $this->db->select('SUM(total) AS total');
//        $this->db->from('receivings_items_temp');
//
//        if ($inputs['location_id'] != 'all') {
//            $this->db->where('item_location', $inputs['location_id']);
//        }
//
//        if ($inputs['receiving_type'] == 'receiving') {
//            $this->db->where('quantity_purchased >', 0);
//        } elseif ($inputs['receiving_type'] == 'returns') {
//            $this->db->where('quantity_purchased <', 0);
//        } elseif ($inputs['receiving_type'] == 'requisitions') {
//            $this->db->where('quantity_purchased', 0);
//        }
//
//        return $this->db->get()->row_array();
    }
}

?>

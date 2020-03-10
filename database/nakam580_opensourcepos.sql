-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 10, 2020 at 08:35 PM
-- Server version: 5.7.29-log-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nakam580_opensourcepos`
--
CREATE DATABASE IF NOT EXISTS `nakam580_opensourcepos` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `nakam580_opensourcepos`;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_app_config`
--

DROP TABLE IF EXISTS `ospos_app_config`;
CREATE TABLE `ospos_app_config` (
  `key` varchar(50) NOT NULL,
  `value` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_app_config`
--

INSERT INTO `ospos_app_config` (`key`, `value`) VALUES
('address', '\r\n196/1/8 cộng hoà, phường 12, quận Tân Bình, TPHCM'),
('allow_duplicate_barcodes', '0'),
('barcode_content', 'id'),
('barcode_first_row', 'category'),
('barcode_font', 'Arial'),
('barcode_font_size', '10'),
('barcode_formats', '[]'),
('barcode_generate_if_empty', '0'),
('barcode_height', '50'),
('barcode_num_in_row', '2'),
('barcode_page_cellspacing', '20'),
('barcode_page_width', '100'),
('barcode_second_row', 'item_code'),
('barcode_third_row', 'unit_price'),
('barcode_type', 'Code39'),
('barcode_width', '250'),
('cash_decimals', '0'),
('cash_rounding_code', '1'),
('company', 'Nakama Dressup'),
('company_logo', ''),
('country_codes', 'vn'),
('currency_code', 'VND'),
('currency_decimals', '0'),
('currency_symbol', '₫'),
('customer_reward_enable', '0'),
('dateformat', 'd/m/Y'),
('date_or_time_format', ''),
('default_receivings_discount', '0'),
('default_receivings_discount_type', '0'),
('default_register_mode', 'sale'),
('default_sales_discount', '0'),
('default_sales_discount_type', '0'),
('default_tax_1_name', ''),
('default_tax_1_rate', ''),
('default_tax_2_name', ''),
('default_tax_2_rate', ''),
('default_tax_category', 'Standard'),
('default_tax_code', ''),
('default_tax_jurisdiction', ''),
('default_tax_rate', '8'),
('derive_sale_quantity', '0'),
('dinner_table_enable', '0'),
('email', 'nakamadressup@gmail.com'),
('email_receipt_check_behaviour', 'last'),
('enforce_privacy', '0'),
('fax', ''),
('financial_year', '1'),
('gcaptcha_enable', '0'),
('gcaptcha_secret_key', ''),
('gcaptcha_site_key', ''),
('giftcard_number', 'series'),
('include_hsn', '0'),
('invoice_default_comments', 'This is a default comment'),
('invoice_email_message', 'Dear {CU}, In attachment the receipt for sale {ISEQ}'),
('invoice_enable', '1'),
('invoice_type', 'invoice'),
('language', 'vietnamese'),
('language_code', 'vi'),
('last_used_invoice_number', '0'),
('last_used_quote_number', '0'),
('last_used_work_order_number', '0'),
('lines_per_page', '25'),
('line_sequence', '0'),
('mailpath', '/usr/sbin/sendmail'),
('msg_msg', ''),
('msg_pwd', ''),
('msg_src', ''),
('msg_uid', ''),
('multi_pack_enabled', '0'),
('notify_horizontal_position', 'center'),
('notify_vertical_position', 'bottom'),
('number_locale', 'vn_VN'),
('payment_options_order', 'cashdebitcredit'),
('phone', '+84 98 689 18 30'),
('print_bottom_margin', '0'),
('print_delay_autoreturn', '0'),
('print_footer', '0'),
('print_header', '0'),
('print_left_margin', '0'),
('print_receipt_check_behaviour', 'last'),
('print_right_margin', '0'),
('print_silently', '1'),
('print_top_margin', '0'),
('protocol', 'mail'),
('quantity_decimals', '0'),
('quote_default_comments', 'This is a default quote comment'),
('receipt_font_size', '12'),
('receipt_show_consignmenter_name', '1'),
('receipt_show_description', '1'),
('receipt_show_serialnumber', '1'),
('receipt_show_taxes', '0'),
('receipt_show_tax_ind', '0'),
('receipt_show_total_discount', '1'),
('receipt_template', 'receipt_default'),
('receiving_calculate_average_price', '0'),
('recv_invoice_format', '{CO}'),
('return_policy', 'Không hoàn trả'),
('sales_invoice_format', '{CO}'),
('sales_quote_format', 'Q%y{QSEQ:6}'),
('smtp_crypto', 'ssl'),
('smtp_host', ''),
('smtp_pass', ''),
('smtp_port', '465'),
('smtp_timeout', '5'),
('smtp_user', ''),
('suggestions_first_column', 'name'),
('suggestions_second_column', ''),
('suggestions_third_column', ''),
('tax_decimals', '0'),
('tax_id', ''),
('tax_included', '0'),
('theme', 'flatly'),
('thousands_separator', '1'),
('timeformat', 'H:i:s'),
('timezone', 'Asia/Bangkok'),
('use_destination_based_tax', '0'),
('website', ''),
('work_order_enable', '0'),
('work_order_format', 'W%y{WSEQ:6}');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_attribute_definitions`
--

DROP TABLE IF EXISTS `ospos_attribute_definitions`;
CREATE TABLE `ospos_attribute_definitions` (
  `definition_id` int(10) NOT NULL,
  `definition_name` varchar(255) NOT NULL,
  `definition_type` varchar(45) NOT NULL,
  `definition_unit` varchar(16) DEFAULT NULL,
  `definition_flags` tinyint(4) NOT NULL,
  `definition_fk` int(10) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_attribute_links`
--

DROP TABLE IF EXISTS `ospos_attribute_links`;
CREATE TABLE `ospos_attribute_links` (
  `attribute_id` int(11) DEFAULT NULL,
  `definition_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `receiving_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_attribute_values`
--

DROP TABLE IF EXISTS `ospos_attribute_values`;
CREATE TABLE `ospos_attribute_values` (
  `attribute_id` int(11) NOT NULL,
  `attribute_value` varchar(255) DEFAULT NULL,
  `attribute_date` date DEFAULT NULL,
  `attribute_decimal` decimal(7,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_cash_up`
--

DROP TABLE IF EXISTS `ospos_cash_up`;
CREATE TABLE `ospos_cash_up` (
  `cashup_id` int(10) NOT NULL,
  `open_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `close_date` timestamp NULL DEFAULT NULL,
  `open_amount_cash` decimal(15,2) NOT NULL,
  `transfer_amount_cash` decimal(15,2) NOT NULL,
  `note` int(1) NOT NULL,
  `closed_amount_cash` decimal(15,2) NOT NULL,
  `closed_amount_card` decimal(15,2) NOT NULL,
  `closed_amount_check` decimal(15,2) NOT NULL,
  `closed_amount_total` decimal(15,2) NOT NULL,
  `description` varchar(255) NOT NULL,
  `open_employee_id` int(10) NOT NULL,
  `close_employee_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `closed_amount_due` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_consignmenters`
--

DROP TABLE IF EXISTS `ospos_consignmenters`;
CREATE TABLE `ospos_consignmenters` (
  `person_id` int(10) NOT NULL,
  `consignmenter_name` varchar(255) NOT NULL,
  `agency_name` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `tax_id` varchar(32) NOT NULL DEFAULT '',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `category` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_consignmenters`
--

INSERT INTO `ospos_consignmenters` (`person_id`, `consignmenter_name`, `agency_name`, `account_number`, `tax_id`, `deleted`, `category`) VALUES
(34, '09032001', '', NULL, '', 1, 0),
(35, '080301', '', NULL, '', 1, 0),
(36, '080301', '', NULL, '', 0, 0),
(37, '080302', '', NULL, '', 0, 0),
(38, '060301', '', NULL, '', 0, 0),
(39, '060302', '', NULL, '', 0, 0),
(40, '060303', '', NULL, '', 0, 0),
(41, '060304', '', NULL, '', 0, 0),
(42, '090301', '', NULL, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_customers`
--

DROP TABLE IF EXISTS `ospos_customers`;
CREATE TABLE `ospos_customers` (
  `person_id` int(10) NOT NULL,
  `consignmenter_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  `tax_id` varchar(32) NOT NULL DEFAULT '',
  `sales_tax_code_id` int(11) DEFAULT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount_type` tinyint(2) NOT NULL DEFAULT '0',
  `package_id` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_id` int(10) NOT NULL,
  `consent` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_customers_packages`
--

DROP TABLE IF EXISTS `ospos_customers_packages`;
CREATE TABLE `ospos_customers_packages` (
  `package_id` int(11) NOT NULL,
  `package_name` varchar(255) DEFAULT NULL,
  `points_percent` float NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_customers_packages`
--

INSERT INTO `ospos_customers_packages` (`package_id`, `package_name`, `points_percent`, `deleted`) VALUES
(1, 'Default', 0, 0),
(2, 'Bronze', 10, 0),
(3, 'Silver', 20, 0),
(4, 'Gold', 30, 0),
(5, 'Premium', 50, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_customers_points`
--

DROP TABLE IF EXISTS `ospos_customers_points`;
CREATE TABLE `ospos_customers_points` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `points_earned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_dinner_tables`
--

DROP TABLE IF EXISTS `ospos_dinner_tables`;
CREATE TABLE `ospos_dinner_tables` (
  `dinner_table_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_dinner_tables`
--

INSERT INTO `ospos_dinner_tables` (`dinner_table_id`, `name`, `status`, `deleted`) VALUES
(1, 'Delivery', 0, 0),
(2, 'Take Away', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_employees`
--

DROP TABLE IF EXISTS `ospos_employees`;
CREATE TABLE `ospos_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `hash_version` int(1) NOT NULL DEFAULT '2',
  `language` varchar(48) DEFAULT NULL,
  `language_code` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_employees`
--

INSERT INTO `ospos_employees` (`username`, `password`, `person_id`, `deleted`, `hash_version`, `language`, `language_code`) VALUES
('admin', '$2y$10$vJBSMlD02EC7ENSrKfVQXuvq9tNRHMtcOA8MSK2NYS748HHWm.gcG', 1, 0, 2, '', ''),
('banhang1', '$2y$10$govCNMAvSD2fD4ktE4IyROLDdqjHpcv3Pl51W88.J8ZBKv.h1oBsK', 33, 0, 2, 'vietnamese', 'vi');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_expenses`
--

DROP TABLE IF EXISTS `ospos_expenses`;
CREATE TABLE `ospos_expenses` (
  `expense_id` int(10) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(15,2) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `consignmenter_tax_code` varchar(255) DEFAULT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `consignmenter_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_expense_categories`
--

DROP TABLE IF EXISTS `ospos_expense_categories`;
CREATE TABLE `ospos_expense_categories` (
  `expense_category_id` int(10) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_giftcards`
--

DROP TABLE IF EXISTS `ospos_giftcards`;
CREATE TABLE `ospos_giftcards` (
  `record_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `giftcard_id` int(11) NOT NULL,
  `giftcard_number` varchar(255) DEFAULT NULL,
  `value` decimal(15,2) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `person_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_grants`
--

DROP TABLE IF EXISTS `ospos_grants`;
CREATE TABLE `ospos_grants` (
  `permission_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `menu_group` varchar(32) DEFAULT 'home'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_grants`
--

INSERT INTO `ospos_grants` (`permission_id`, `person_id`, `menu_group`) VALUES
('attributes', 1, 'office'),
('cashups', 1, 'home'),
('config', 1, 'office'),
('consignmenters', 1, 'home'),
('consignmenters', 33, 'home'),
('customers', 1, 'home'),
('customers', 33, 'home'),
('employees', 1, 'office'),
('expenses', 1, 'home'),
('expenses_categories', 1, 'home'),
('giftcards', 1, 'home'),
('home', 1, 'office'),
('home', 33, 'home'),
('items', 1, 'home'),
('items', 33, 'home'),
('items_stock', 1, '--'),
('items_stock', 33, '--'),
('item_kits', 1, 'home'),
('messages', 1, 'home'),
('office', 1, 'home'),
('receivings', 1, 'home'),
('receivings', 33, 'home'),
('receivings_stock', 1, '--'),
('receivings_stock', 33, '--'),
('reports', 1, 'home'),
('reports', 33, 'home'),
('reports_categories', 1, '--'),
('reports_categories', 33, '--'),
('reports_consignmenters', 1, '--'),
('reports_consignmenters', 33, '--'),
('reports_customers', 1, '--'),
('reports_customers', 33, '--'),
('reports_discounts', 1, '--'),
('reports_discounts', 33, '--'),
('reports_employees', 1, '--'),
('reports_employees', 33, '--'),
('reports_expenses_categories', 1, '--'),
('reports_expenses_categories', 33, '--'),
('reports_inventory', 1, '--'),
('reports_inventory', 33, '--'),
('reports_items', 1, '--'),
('reports_items', 33, '--'),
('reports_payments', 1, '--'),
('reports_payments', 33, '--'),
('reports_receivings', 1, '--'),
('reports_receivings', 33, '--'),
('reports_sales', 1, '--'),
('reports_sales', 33, '--'),
('reports_sales_taxes', 1, '--'),
('reports_sales_taxes', 33, '--'),
('reports_taxes', 1, '--'),
('reports_taxes', 33, '--'),
('sales', 1, 'home'),
('sales', 33, 'home'),
('sales_delete', 1, '--'),
('sales_delete', 33, '--'),
('sales_stock', 1, '--'),
('sales_stock', 33, '--'),
('taxes', 1, 'office');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_inventory`
--

DROP TABLE IF EXISTS `ospos_inventory`;
CREATE TABLE `ospos_inventory` (
  `trans_id` int(11) NOT NULL,
  `trans_items` int(11) NOT NULL DEFAULT '0',
  `trans_user` int(11) NOT NULL DEFAULT '0',
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text NOT NULL,
  `trans_location` int(11) NOT NULL,
  `trans_inventory` decimal(15,3) NOT NULL DEFAULT '0.000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_inventory`
--

INSERT INTO `ospos_inventory` (`trans_id`, `trans_items`, `trans_user`, `trans_date`, `trans_comment`, `trans_location`, `trans_inventory`) VALUES
(236, 216, 33, '2020-03-09 11:20:48', 'Sửa số lượng bằng tay', 1, 0.000),
(237, 217, 33, '2020-03-09 11:20:48', 'Sửa số lượng bằng tay', 1, 0.000),
(238, 216, 33, '2020-03-09 11:21:45', 'RECV 41', 1, 1.000),
(239, 217, 33, '2020-03-09 11:21:45', 'RECV 41', 1, 1.000),
(240, 216, 33, '2020-03-09 11:29:03', 'POS 5', 1, -1.000),
(241, 218, 33, '2020-03-09 12:09:47', 'Sửa số lượng bằng tay', 1, 0.000),
(242, 218, 33, '2020-03-09 12:10:23', 'RECV 42', 1, 1.000),
(243, 219, 33, '2020-03-09 12:11:38', 'Sửa số lượng bằng tay', 1, 0.000),
(244, 220, 33, '2020-03-09 12:11:47', 'Sửa số lượng bằng tay', 1, 0.000),
(245, 221, 33, '2020-03-09 12:11:50', 'Sửa số lượng bằng tay', 1, 0.000),
(246, 218, 33, '2020-03-09 12:12:09', 'Đã xoá', 1, -1.000),
(247, 222, 33, '2020-03-09 12:13:25', 'Sửa số lượng bằng tay', 1, 0.000),
(248, 223, 33, '2020-03-09 12:13:27', 'Sửa số lượng bằng tay', 1, 0.000),
(249, 224, 33, '2020-03-09 12:13:28', 'Sửa số lượng bằng tay', 1, 0.000),
(250, 225, 33, '2020-03-09 12:13:32', 'Sửa số lượng bằng tay', 1, 0.000),
(251, 226, 33, '2020-03-09 12:13:32', 'Sửa số lượng bằng tay', 1, 0.000),
(252, 227, 33, '2020-03-09 12:13:32', 'Sửa số lượng bằng tay', 1, 0.000),
(253, 222, 33, '2020-03-09 12:16:00', 'RECV 43', 1, 1.000),
(254, 223, 33, '2020-03-09 12:16:00', 'RECV 43', 1, 1.000),
(255, 224, 33, '2020-03-09 12:16:00', 'RECV 43', 1, 1.000),
(256, 225, 33, '2020-03-09 12:16:00', 'RECV 43', 1, 1.000),
(257, 226, 33, '2020-03-09 12:16:00', 'RECV 43', 1, 1.000),
(258, 217, 33, '2020-03-09 12:16:53', 'Đã xoá', 1, -1.000),
(259, 228, 33, '2020-03-09 12:17:21', 'Sửa số lượng bằng tay', 1, 0.000),
(260, 229, 33, '2020-03-09 12:17:21', 'Sửa số lượng bằng tay', 1, 0.000),
(261, 230, 33, '2020-03-09 12:17:21', 'Sửa số lượng bằng tay', 1, 0.000),
(262, 231, 33, '2020-03-09 12:17:21', 'Sửa số lượng bằng tay', 1, 0.000),
(263, 232, 33, '2020-03-09 12:17:21', 'Sửa số lượng bằng tay', 1, 0.000),
(264, 233, 33, '2020-03-09 12:17:21', 'Sửa số lượng bằng tay', 1, 0.000),
(265, 234, 33, '2020-03-09 12:17:21', 'Sửa số lượng bằng tay', 1, 0.000),
(266, 235, 33, '2020-03-09 12:17:21', 'Sửa số lượng bằng tay', 1, 0.000),
(267, 236, 33, '2020-03-09 12:17:21', 'Sửa số lượng bằng tay', 1, 0.000),
(268, 237, 33, '2020-03-09 12:17:21', 'Sửa số lượng bằng tay', 1, 0.000),
(269, 238, 33, '2020-03-09 12:17:21', 'Sửa số lượng bằng tay', 1, 0.000),
(270, 239, 33, '2020-03-09 12:17:21', 'Sửa số lượng bằng tay', 1, 0.000),
(271, 240, 33, '2020-03-09 12:17:21', 'Sửa số lượng bằng tay', 1, 0.000),
(272, 241, 33, '2020-03-09 12:17:21', 'Sửa số lượng bằng tay', 1, 0.000),
(273, 242, 33, '2020-03-09 12:17:21', 'Sửa số lượng bằng tay', 1, 0.000),
(274, 228, 33, '2020-03-09 12:25:35', 'RECV 44', 1, 1.000),
(275, 229, 33, '2020-03-09 12:25:35', 'RECV 44', 1, 1.000),
(276, 230, 33, '2020-03-09 12:25:35', 'RECV 44', 1, 1.000),
(277, 231, 33, '2020-03-09 12:25:35', 'RECV 44', 1, 1.000),
(278, 232, 33, '2020-03-09 12:25:35', 'RECV 44', 1, 1.000),
(279, 233, 33, '2020-03-09 12:25:35', 'RECV 44', 1, 1.000),
(280, 234, 33, '2020-03-09 12:25:35', 'RECV 44', 1, 1.000),
(281, 235, 33, '2020-03-09 12:25:35', 'RECV 44', 1, 1.000),
(282, 236, 33, '2020-03-09 12:25:35', 'RECV 44', 1, 1.000),
(283, 237, 33, '2020-03-09 12:25:35', 'RECV 44', 1, 1.000),
(284, 238, 33, '2020-03-09 12:25:35', 'RECV 44', 1, 1.000),
(285, 239, 33, '2020-03-09 12:25:35', 'RECV 44', 1, 1.000),
(286, 240, 33, '2020-03-09 12:25:35', 'RECV 44', 1, 1.000),
(287, 241, 33, '2020-03-09 12:25:35', 'RECV 44', 1, 1.000),
(288, 242, 33, '2020-03-09 12:25:35', 'RECV 44', 1, 1.000),
(289, 243, 33, '2020-03-09 12:37:03', 'Sửa số lượng bằng tay', 1, 0.000),
(290, 244, 33, '2020-03-09 12:37:03', 'Sửa số lượng bằng tay', 1, 0.000),
(291, 245, 33, '2020-03-09 12:37:03', 'Sửa số lượng bằng tay', 1, 0.000),
(292, 246, 33, '2020-03-09 12:37:03', 'Sửa số lượng bằng tay', 1, 0.000),
(293, 247, 33, '2020-03-09 12:37:03', 'Sửa số lượng bằng tay', 1, 0.000),
(294, 248, 33, '2020-03-09 12:37:03', 'Sửa số lượng bằng tay', 1, 0.000),
(295, 249, 33, '2020-03-09 12:37:03', 'Sửa số lượng bằng tay', 1, 0.000),
(296, 250, 33, '2020-03-09 12:37:54', 'Sửa số lượng bằng tay', 1, 0.000),
(297, 251, 33, '2020-03-09 12:37:54', 'Sửa số lượng bằng tay', 1, 0.000),
(298, 252, 33, '2020-03-09 12:37:54', 'Sửa số lượng bằng tay', 1, 0.000),
(299, 243, 33, '2020-03-09 12:44:17', 'RECV 45', 1, 1.000),
(300, 244, 33, '2020-03-09 12:44:17', 'RECV 45', 1, 1.000),
(301, 245, 33, '2020-03-09 12:44:17', 'RECV 45', 1, 1.000),
(302, 246, 33, '2020-03-09 12:44:17', 'RECV 45', 1, 1.000),
(303, 247, 33, '2020-03-09 12:44:17', 'RECV 45', 1, 1.000),
(304, 248, 33, '2020-03-09 12:44:17', 'RECV 45', 1, 1.000),
(305, 249, 33, '2020-03-09 12:44:17', 'RECV 45', 1, 1.000),
(306, 250, 33, '2020-03-09 12:44:17', 'RECV 45', 1, 1.000),
(307, 251, 33, '2020-03-09 12:44:17', 'RECV 45', 1, 1.000),
(308, 253, 33, '2020-03-09 12:45:35', 'Sửa số lượng bằng tay', 1, 0.000),
(309, 254, 33, '2020-03-09 12:45:35', 'Sửa số lượng bằng tay', 1, 0.000),
(310, 255, 33, '2020-03-09 12:45:35', 'Sửa số lượng bằng tay', 1, 0.000),
(311, 256, 33, '2020-03-09 12:45:35', 'Sửa số lượng bằng tay', 1, 0.000),
(312, 257, 33, '2020-03-09 12:45:35', 'Sửa số lượng bằng tay', 1, 0.000),
(313, 258, 33, '2020-03-09 12:45:35', 'Sửa số lượng bằng tay', 1, 0.000),
(314, 259, 33, '2020-03-09 12:45:35', 'Sửa số lượng bằng tay', 1, 0.000),
(315, 260, 33, '2020-03-09 12:45:35', 'Sửa số lượng bằng tay', 1, 0.000),
(316, 261, 33, '2020-03-09 12:45:35', 'Sửa số lượng bằng tay', 1, 0.000),
(317, 262, 33, '2020-03-09 12:45:35', 'Sửa số lượng bằng tay', 1, 0.000),
(318, 263, 33, '2020-03-09 12:45:35', 'Sửa số lượng bằng tay', 1, 0.000),
(319, 264, 33, '2020-03-09 12:45:35', 'Sửa số lượng bằng tay', 1, 0.000),
(320, 265, 33, '2020-03-09 12:45:35', 'Sửa số lượng bằng tay', 1, 0.000),
(321, 266, 33, '2020-03-09 12:45:35', 'Sửa số lượng bằng tay', 1, 0.000),
(322, 267, 33, '2020-03-09 12:45:35', 'Sửa số lượng bằng tay', 1, 0.000),
(323, 268, 33, '2020-03-09 12:50:27', 'Sửa số lượng bằng tay', 1, 0.000),
(324, 253, 33, '2020-03-09 12:52:43', 'RECV 46', 1, 1.000),
(325, 254, 33, '2020-03-09 12:52:43', 'RECV 46', 1, 1.000),
(326, 255, 33, '2020-03-09 12:52:43', 'RECV 46', 1, 1.000),
(327, 256, 33, '2020-03-09 12:52:43', 'RECV 46', 1, 1.000),
(328, 257, 33, '2020-03-09 12:52:43', 'RECV 46', 1, 1.000),
(329, 258, 33, '2020-03-09 12:52:43', 'RECV 46', 1, 1.000),
(330, 259, 33, '2020-03-09 12:52:43', 'RECV 46', 1, 1.000),
(331, 260, 33, '2020-03-09 12:52:43', 'RECV 46', 1, 1.000),
(332, 261, 33, '2020-03-09 12:52:43', 'RECV 46', 1, 1.000),
(333, 262, 33, '2020-03-09 12:52:43', 'RECV 46', 1, 1.000),
(334, 263, 33, '2020-03-09 12:52:43', 'RECV 46', 1, 1.000),
(335, 264, 33, '2020-03-09 12:52:43', 'RECV 46', 1, 1.000),
(336, 265, 33, '2020-03-09 12:52:43', 'RECV 46', 1, 1.000),
(337, 266, 33, '2020-03-09 12:52:43', 'RECV 46', 1, 1.000),
(338, 267, 33, '2020-03-09 12:52:43', 'RECV 46', 1, 1.000),
(339, 268, 33, '2020-03-09 12:52:43', 'RECV 46', 1, 1.000),
(340, 269, 33, '2020-03-09 12:54:26', 'Sửa số lượng bằng tay', 1, 0.000),
(341, 270, 33, '2020-03-09 12:54:26', 'Sửa số lượng bằng tay', 1, 0.000),
(342, 271, 33, '2020-03-09 12:54:26', 'Sửa số lượng bằng tay', 1, 0.000),
(343, 272, 33, '2020-03-09 12:54:26', 'Sửa số lượng bằng tay', 1, 0.000),
(344, 273, 33, '2020-03-09 12:54:26', 'Sửa số lượng bằng tay', 1, 0.000),
(345, 274, 33, '2020-03-09 12:54:26', 'Sửa số lượng bằng tay', 1, 0.000),
(346, 275, 33, '2020-03-09 12:54:26', 'Sửa số lượng bằng tay', 1, 0.000),
(347, 276, 33, '2020-03-09 12:54:26', 'Sửa số lượng bằng tay', 1, 0.000),
(348, 277, 33, '2020-03-09 12:54:26', 'Sửa số lượng bằng tay', 1, 0.000),
(349, 278, 33, '2020-03-09 12:58:07', 'Sửa số lượng bằng tay', 1, 0.000),
(350, 279, 33, '2020-03-09 12:58:07', 'Sửa số lượng bằng tay', 1, 0.000),
(351, 280, 33, '2020-03-09 12:58:07', 'Sửa số lượng bằng tay', 1, 0.000),
(352, 272, 33, '2020-03-09 13:02:51', 'RECV 47', 1, 1.000),
(353, 273, 33, '2020-03-09 13:02:51', 'RECV 47', 1, 1.000),
(354, 274, 33, '2020-03-09 13:02:51', 'RECV 47', 1, 1.000),
(355, 275, 33, '2020-03-09 13:02:51', 'RECV 47', 1, 1.000),
(356, 276, 33, '2020-03-09 13:02:51', 'RECV 47', 1, 1.000),
(357, 277, 33, '2020-03-09 13:02:51', 'RECV 47', 1, 1.000),
(358, 278, 33, '2020-03-09 13:02:51', 'RECV 47', 1, 1.000),
(359, 279, 33, '2020-03-09 13:02:51', 'RECV 47', 1, 1.000),
(360, 280, 33, '2020-03-09 13:02:51', 'RECV 47', 1, 1.000),
(361, 281, 33, '2020-03-09 13:04:37', 'Sửa số lượng bằng tay', 1, 0.000),
(362, 282, 33, '2020-03-09 13:04:37', 'Sửa số lượng bằng tay', 1, 0.000),
(363, 283, 33, '2020-03-09 13:04:37', 'Sửa số lượng bằng tay', 1, 0.000),
(364, 284, 33, '2020-03-09 13:04:37', 'Sửa số lượng bằng tay', 1, 0.000),
(365, 285, 33, '2020-03-09 13:04:37', 'Sửa số lượng bằng tay', 1, 0.000),
(366, 286, 33, '2020-03-09 13:04:37', 'Sửa số lượng bằng tay', 1, 0.000),
(367, 281, 33, '2020-03-09 13:06:19', 'RECV 48', 1, 1.000),
(368, 282, 33, '2020-03-09 13:06:19', 'RECV 48', 1, 1.000),
(369, 283, 33, '2020-03-09 13:06:19', 'RECV 48', 1, 1.000),
(370, 284, 33, '2020-03-09 13:06:19', 'RECV 48', 1, 1.000),
(371, 285, 33, '2020-03-09 13:06:19', 'RECV 48', 1, 1.000),
(372, 286, 33, '2020-03-09 13:06:19', 'RECV 48', 1, 1.000),
(373, 287, 33, '2020-03-09 13:13:25', 'Sửa số lượng bằng tay', 1, 0.000),
(374, 288, 33, '2020-03-09 13:13:25', 'Sửa số lượng bằng tay', 1, 0.000),
(375, 289, 33, '2020-03-09 13:13:25', 'Sửa số lượng bằng tay', 1, 0.000),
(376, 290, 33, '2020-03-09 13:13:25', 'Sửa số lượng bằng tay', 1, 0.000),
(377, 291, 33, '2020-03-09 13:13:25', 'Sửa số lượng bằng tay', 1, 0.000),
(378, 292, 33, '2020-03-09 13:13:25', 'Sửa số lượng bằng tay', 1, 0.000),
(379, 293, 33, '2020-03-09 13:13:25', 'Sửa số lượng bằng tay', 1, 0.000),
(380, 294, 33, '2020-03-09 13:13:25', 'Sửa số lượng bằng tay', 1, 0.000),
(381, 295, 33, '2020-03-09 13:13:25', 'Sửa số lượng bằng tay', 1, 0.000),
(382, 296, 33, '2020-03-09 13:13:25', 'Sửa số lượng bằng tay', 1, 0.000),
(383, 297, 33, '2020-03-09 13:13:25', 'Sửa số lượng bằng tay', 1, 0.000),
(384, 298, 33, '2020-03-09 13:13:25', 'Sửa số lượng bằng tay', 1, 0.000),
(385, 299, 33, '2020-03-09 13:13:25', 'Sửa số lượng bằng tay', 1, 0.000),
(386, 300, 33, '2020-03-09 13:13:25', 'Sửa số lượng bằng tay', 1, 0.000),
(387, 301, 33, '2020-03-09 13:13:25', 'Sửa số lượng bằng tay', 1, 0.000),
(388, 287, 33, '2020-03-09 13:23:40', 'RECV 49', 1, 1.000),
(389, 288, 33, '2020-03-09 13:23:40', 'RECV 49', 1, 1.000),
(390, 289, 33, '2020-03-09 13:23:40', 'RECV 49', 1, 1.000),
(391, 290, 33, '2020-03-09 13:23:40', 'RECV 49', 1, 1.000),
(392, 291, 33, '2020-03-09 13:23:40', 'RECV 49', 1, 1.000),
(393, 292, 33, '2020-03-09 13:23:40', 'RECV 49', 1, 1.000),
(394, 293, 33, '2020-03-09 13:23:40', 'RECV 49', 1, 1.000),
(395, 294, 33, '2020-03-09 13:23:40', 'RECV 49', 1, 1.000),
(396, 295, 33, '2020-03-09 13:23:40', 'RECV 49', 1, 1.000),
(397, 296, 33, '2020-03-09 13:23:40', 'RECV 49', 1, 1.000),
(398, 297, 33, '2020-03-09 13:23:40', 'RECV 49', 1, 1.000),
(399, 298, 33, '2020-03-09 13:23:40', 'RECV 49', 1, 1.000),
(400, 299, 33, '2020-03-09 13:23:40', 'RECV 49', 1, 1.000),
(401, 300, 33, '2020-03-09 13:23:40', 'RECV 49', 1, 1.000);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_items`
--

DROP TABLE IF EXISTS `ospos_items`;
CREATE TABLE `ospos_items` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `consignmenter_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `reorder_level` decimal(15,3) NOT NULL DEFAULT '0.000',
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT '1.000',
  `item_id` int(10) NOT NULL,
  `pic_filename` varchar(255) DEFAULT NULL,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `stock_type` tinyint(2) NOT NULL DEFAULT '0',
  `item_type` tinyint(2) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `tax_category_id` int(10) DEFAULT NULL,
  `qty_per_pack` decimal(15,3) NOT NULL DEFAULT '1.000',
  `pack_name` varchar(8) DEFAULT 'Each',
  `low_sell_item_id` int(10) DEFAULT '0',
  `hsn_code` varchar(32) NOT NULL DEFAULT '',
  `receiving_id` int(10) DEFAULT NULL,
  `expiration_date` timestamp NULL DEFAULT NULL,
  `paid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_items`
--

INSERT INTO `ospos_items` (`name`, `category`, `consignmenter_id`, `item_number`, `description`, `cost_price`, `unit_price`, `reorder_level`, `receiving_quantity`, `item_id`, `pic_filename`, `allow_alt_description`, `is_serialized`, `stock_type`, `item_type`, `deleted`, `tax_category_id`, `qty_per_pack`, `pack_name`, `low_sell_item_id`, `hsn_code`, `receiving_id`, `expiration_date`, `paid`) VALUES
('09032001A', '', 34, NULL, '', 160.00, 200.00, 0.000, 1.000, 216, NULL, 0, 0, 0, 0, 1, 0, 1.000, 'Each', 216, '', 41, '2020-05-08 17:00:00', 0),
('09032001B', '', 34, NULL, '', 80.00, 100.00, 0.000, 1.000, 217, NULL, 0, 0, 0, 0, 1, 0, 1.000, 'Each', 217, '', 41, '2020-05-08 17:00:00', 0),
('080301A', '', 35, NULL, '', 96000.00, 120000.00, 0.000, 1.000, 218, NULL, 0, 0, 0, 0, 1, 0, 1.000, 'Each', 218, '', 42, '2020-05-08 17:00:00', 0),
('080301A', '', NULL, NULL, '', 0.00, 0.00, 0.000, 1.000, 219, NULL, 0, 0, 0, 0, 1, 0, 1.000, 'Each', 219, '', NULL, NULL, 0),
('080301B', '', NULL, NULL, '', 0.00, 0.00, 0.000, 1.000, 220, NULL, 0, 0, 0, 0, 1, 0, 1.000, 'Each', 220, '', NULL, NULL, 0),
('080301C', '', NULL, NULL, '', 0.00, 0.00, 0.000, 1.000, 221, NULL, 0, 0, 0, 0, 1, 0, 1.000, 'Each', 221, '', NULL, NULL, 0),
('080301A', '', 36, NULL, '', 96000.00, 120000.00, 0.000, 1.000, 222, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 222, '', 43, '2020-05-08 17:00:00', 0),
('080301B', '', 36, NULL, '', 136000.00, 170000.00, 0.000, 1.000, 223, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 223, '', 43, '2020-05-08 17:00:00', 0),
('080301C', '', 36, NULL, '', 64000.00, 80000.00, 0.000, 1.000, 224, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 224, '', 43, '2020-05-08 17:00:00', 0),
('080301D', '', 36, NULL, '', 56000.00, 70000.00, 0.000, 1.000, 225, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 225, '', 43, '2020-05-08 17:00:00', 0),
('080301E', '', 36, NULL, '', 64000.00, 80000.00, 0.000, 1.000, 226, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 226, '', 43, '2020-05-08 17:00:00', 0),
('080301F', '', NULL, NULL, '', 0.00, 0.00, 0.000, 1.000, 227, NULL, 0, 0, 0, 0, 1, 0, 1.000, 'Each', 227, '', NULL, NULL, 0),
('080302A', '', 37, NULL, '', 79200.00, 99000.00, 0.000, 1.000, 228, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 228, '', 44, '2020-05-08 17:00:00', 0),
('080302B', '', 37, NULL, '', 31200.00, 39000.00, 0.000, 1.000, 229, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 229, '', 44, '2020-05-08 17:00:00', 0),
('080302C', '', 37, NULL, '', 63200.00, 79000.00, 0.000, 1.000, 230, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 230, '', 44, '2020-05-08 17:00:00', 0),
('080302D', '', 37, NULL, '', 31200.00, 39000.00, 0.000, 1.000, 231, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 231, '', 44, '2020-05-08 17:00:00', 0),
('080302E', '', 37, NULL, '', 79200.00, 99000.00, 0.000, 1.000, 232, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 232, '', 44, '2020-05-08 17:00:00', 0),
('080302F', '', 37, NULL, '', 39200.00, 49000.00, 0.000, 1.000, 233, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 233, '', 44, '2020-05-08 17:00:00', 0),
('080302G', '', 37, NULL, '', 119200.00, 149000.00, 0.000, 1.000, 234, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 234, '', 44, '2020-05-08 17:00:00', 0),
('080302H', '', 37, NULL, '', 151200.00, 189000.00, 0.000, 1.000, 235, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 235, '', 44, '2020-05-08 17:00:00', 0),
('080302I', '', 37, NULL, '', 79200.00, 99000.00, 0.000, 1.000, 236, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 236, '', 44, '2020-05-08 17:00:00', 0),
('080302J', '', 37, NULL, '', 47200.00, 59000.00, 0.000, 1.000, 237, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 237, '', 44, '2020-05-08 17:00:00', 0),
('080302K', '', 37, NULL, '', 79200.00, 99000.00, 0.000, 1.000, 238, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 238, '', 44, '2020-05-08 17:00:00', 0),
('080302L', '', 37, NULL, '', 80000.00, 100000.00, 0.000, 1.000, 239, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 239, '', 44, '2020-05-08 17:00:00', 0),
('080302M', '', 37, NULL, '', 151200.00, 189000.00, 0.000, 1.000, 240, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 240, '', 44, '2020-05-08 17:00:00', 0),
('080302N', '', 37, NULL, '', 79200.00, 99000.00, 0.000, 1.000, 241, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 241, '', 44, '2020-05-08 17:00:00', 0),
('080302O', '', 37, NULL, '', 119200.00, 149000.00, 0.000, 1.000, 242, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 242, '', 44, '2020-05-08 17:00:00', 0),
('060301A', '', 38, NULL, '', 111200.00, 139000.00, 0.000, 1.000, 243, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 243, '', 45, '2020-05-08 17:00:00', 0),
('060301B', '', 38, NULL, '', 55200.00, 69000.00, 0.000, 1.000, 244, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 244, '', 45, '2020-05-08 17:00:00', 0),
('060301C', '', 38, NULL, '', 68000.00, 85000.00, 0.000, 1.000, 245, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 245, '', 45, '2020-05-08 17:00:00', 0),
('060301D', '', 38, NULL, '', 55200.00, 69000.00, 0.000, 1.000, 246, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 246, '', 45, '2020-05-08 17:00:00', 0),
('060301E', '', 38, NULL, '', 55200.00, 69000.00, 0.000, 1.000, 247, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 247, '', 45, '2020-05-08 17:00:00', 0),
('060301F', '', 38, NULL, '', 135200.00, 169000.00, 0.000, 1.000, 248, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 248, '', 45, '2020-05-08 17:00:00', 0),
('060301G', '', 38, NULL, '', 116000.00, 145000.00, 0.000, 1.000, 249, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 249, '', 45, '2020-05-08 17:00:00', 0),
('060301H', '', 38, NULL, '', 52000.00, 65000.00, 0.000, 1.000, 250, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 250, '', 45, '2020-05-08 17:00:00', 0),
('060301I', '', 38, NULL, '', 119200.00, 149000.00, 0.000, 1.000, 251, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 251, '', 45, '2020-05-08 17:00:00', 0),
('060301J', '', NULL, NULL, '', 0.00, 0.00, 0.000, 1.000, 252, NULL, 0, 0, 0, 0, 1, 0, 1.000, 'Each', 252, '', NULL, NULL, 0),
('060302A', '', 39, NULL, '', 36000.00, 45000.00, 0.000, 1.000, 253, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 253, '', 46, '2020-05-08 17:00:00', 0),
('060302B', '', 39, NULL, '', 44000.00, 55000.00, 0.000, 1.000, 254, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 254, '', 46, '2020-05-08 17:00:00', 0),
('060302C', '', 39, NULL, '', 56000.00, 70000.00, 0.000, 1.000, 255, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 255, '', 46, '2020-05-08 17:00:00', 0),
('060302D', '', 39, NULL, '', 28000.00, 35000.00, 0.000, 1.000, 256, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 256, '', 46, '2020-05-08 17:00:00', 0),
('060302E', '', 39, NULL, '', 44000.00, 55000.00, 0.000, 1.000, 257, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 257, '', 46, '2020-05-08 17:00:00', 0),
('060302F', '', 39, NULL, '', 36000.00, 45000.00, 0.000, 1.000, 258, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 258, '', 46, '2020-05-08 17:00:00', 0),
('060302G', '', 39, NULL, '', 12000.00, 15000.00, 0.000, 1.000, 259, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 259, '', 46, '2020-05-08 17:00:00', 0),
('060302H', '', 39, NULL, '', 120000.00, 150000.00, 0.000, 1.000, 260, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 260, '', 46, '2020-05-08 17:00:00', 0),
('060302I', '', 39, NULL, '', 40000.00, 50000.00, 0.000, 1.000, 261, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 261, '', 46, '2020-05-08 17:00:00', 0),
('060302J', '', 39, NULL, '', 104000.00, 130000.00, 0.000, 1.000, 262, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 262, '', 46, '2020-05-08 17:00:00', 0),
('060302K', '', 39, NULL, '', 76000.00, 95000.00, 0.000, 1.000, 263, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 263, '', 46, '2020-05-08 17:00:00', 0),
('060302L', '', 39, NULL, '', 64000.00, 80000.00, 0.000, 1.000, 264, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 264, '', 46, '2020-05-08 17:00:00', 0),
('060302M', '', 39, NULL, '', 40000.00, 50000.00, 0.000, 1.000, 265, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 265, '', 46, '2020-05-08 17:00:00', 0),
('060302N', '', 39, NULL, '', 56000.00, 70000.00, 0.000, 1.000, 266, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 266, '', 46, '2020-05-08 17:00:00', 0),
('060302O', '', 39, NULL, '', 40000.00, 50000.00, 0.000, 1.000, 267, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 267, '', 46, '2020-05-08 17:00:00', 0),
('060302P', '', 39, NULL, '', 0.00, 0.00, 0.000, 1.000, 268, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 268, '', 46, '2020-05-08 17:00:00', 0),
('060303A', '', NULL, NULL, '', 0.00, 0.00, 0.000, 1.000, 269, NULL, 0, 0, 0, 0, 1, 0, 1.000, 'Each', 269, '', NULL, NULL, 0),
('060303B', '', NULL, NULL, '', 0.00, 0.00, 0.000, 1.000, 270, NULL, 0, 0, 0, 0, 1, 0, 1.000, 'Each', 270, '', NULL, NULL, 0),
('060303C', '', NULL, NULL, '', 0.00, 0.00, 0.000, 1.000, 271, NULL, 0, 0, 0, 0, 1, 0, 1.000, 'Each', 271, '', NULL, NULL, 0),
('060303D', '', 40, NULL, '', 40000.00, 50000.00, 0.000, 1.000, 272, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 272, '', 47, '2020-05-08 17:00:00', 0),
('060303E', '', 40, NULL, '', 32000.00, 40000.00, 0.000, 1.000, 273, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 273, '', 47, '2020-05-08 17:00:00', 0),
('060303F', '', 40, NULL, '', 32000.00, 40000.00, 0.000, 1.000, 274, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 274, '', 47, '2020-05-08 17:00:00', 0),
('060303G', '', 40, NULL, '', 32000.00, 40000.00, 0.000, 1.000, 275, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 275, '', 47, '2020-05-08 17:00:00', 0),
('060303H', '', 40, NULL, '', 36000.00, 45000.00, 0.000, 1.000, 276, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 276, '', 47, '2020-05-08 17:00:00', 0),
('060303I', '', 40, NULL, '', 32000.00, 40000.00, 0.000, 1.000, 277, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 277, '', 47, '2020-05-08 17:00:00', 0),
('060303J', '', 40, NULL, '', 72000.00, 90000.00, 0.000, 1.000, 278, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 278, '', 47, '2020-05-08 17:00:00', 0),
('060303K', '', 40, NULL, '', 48000.00, 60000.00, 0.000, 1.000, 279, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 279, '', 47, '2020-05-08 17:00:00', 0),
('060303L', '', 40, NULL, '', 48000.00, 60000.00, 0.000, 1.000, 280, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 280, '', 47, '2020-05-08 17:00:00', 0),
('060304A', '', 41, NULL, '', 87200.00, 109000.00, 0.000, 1.000, 281, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 281, '', 48, '2020-05-08 17:00:00', 0),
('060304B', '', 41, NULL, '', 72000.00, 90000.00, 0.000, 1.000, 282, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 282, '', 48, '2020-05-08 17:00:00', 0),
('060304C', '', 41, NULL, '', 52000.00, 65000.00, 0.000, 1.000, 283, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 283, '', 48, '2020-05-08 17:00:00', 0),
('060304D', '', 41, NULL, '', 56000.00, 70000.00, 0.000, 1.000, 284, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 284, '', 48, '2020-05-08 17:00:00', 0),
('060304E', '', 41, NULL, '', 20000.00, 25000.00, 0.000, 1.000, 285, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 285, '', 48, '2020-05-08 17:00:00', 0),
('060304F', '', 41, NULL, '', 48000.00, 60000.00, 0.000, 1.000, 286, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 286, '', 48, '2020-05-08 17:00:00', 0),
('090301A', '', 42, NULL, '', 76000.00, 95000.00, 0.000, 1.000, 287, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 287, '', 49, '2020-05-08 17:00:00', 0),
('090301B', '', 42, NULL, '', 40000.00, 50000.00, 0.000, 1.000, 288, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 288, '', 49, '2020-05-08 17:00:00', 0),
('090301C', '', 42, NULL, '', 72000.00, 90000.00, 0.000, 1.000, 289, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 289, '', 49, '2020-05-08 17:00:00', 0),
('090301D', '', 42, NULL, '', 48000.00, 60000.00, 0.000, 1.000, 290, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 290, '', 49, '2020-05-08 17:00:00', 0),
('090301E', '', 42, NULL, '', 48000.00, 60000.00, 0.000, 1.000, 291, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 291, '', 49, '2020-05-08 17:00:00', 0),
('090301F', '', 42, NULL, '', 36000.00, 45000.00, 0.000, 1.000, 292, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 292, '', 49, '2020-05-08 17:00:00', 0),
('090301G', '', 42, NULL, '', 40000.00, 50000.00, 0.000, 1.000, 293, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 293, '', 49, '2020-05-08 17:00:00', 0),
('090301H', '', 42, NULL, '', 28000.00, 35000.00, 0.000, 1.000, 294, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 294, '', 49, '2020-05-08 17:00:00', 0),
('090301I', '', 42, NULL, '', 31200.00, 39000.00, 0.000, 1.000, 295, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 295, '', 49, '2020-05-08 17:00:00', 0),
('090301J', '', 42, NULL, '', 52000.00, 65000.00, 0.000, 1.000, 296, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 296, '', 49, '2020-05-08 17:00:00', 0),
('090301K', '', 42, NULL, '', 52000.00, 65000.00, 0.000, 1.000, 297, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 297, '', 49, '2020-05-08 17:00:00', 0),
('090301L', '', 42, NULL, '', 28000.00, 35000.00, 0.000, 1.000, 298, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 298, '', 49, '2020-05-08 17:00:00', 0),
('090301M', '', 42, NULL, '', 56000.00, 70000.00, 0.000, 1.000, 299, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 299, '', 49, '2020-05-08 17:00:00', 0),
('090301N', '', 42, NULL, '', 60000.00, 75000.00, 0.000, 1.000, 300, NULL, 0, 0, 0, 0, 0, 0, 1.000, 'Each', 300, '', 49, '2020-05-08 17:00:00', 0),
('090301O', '', NULL, NULL, '', 0.00, 0.00, 0.000, 1.000, 301, NULL, 0, 0, 0, 0, 1, 0, 1.000, 'Each', 301, '', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_items_taxes`
--

DROP TABLE IF EXISTS `ospos_items_taxes`;
CREATE TABLE `ospos_items_taxes` (
  `item_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_item_kits`
--

DROP TABLE IF EXISTS `ospos_item_kits`;
CREATE TABLE `ospos_item_kits` (
  `item_kit_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `item_id` int(10) NOT NULL DEFAULT '0',
  `kit_discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `kit_discount_type` tinyint(2) NOT NULL DEFAULT '0',
  `price_option` tinyint(2) NOT NULL DEFAULT '0',
  `print_option` tinyint(2) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_item_kit_items`
--

DROP TABLE IF EXISTS `ospos_item_kit_items`;
CREATE TABLE `ospos_item_kit_items` (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL,
  `kit_sequence` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_item_quantities`
--

DROP TABLE IF EXISTS `ospos_item_quantities`;
CREATE TABLE `ospos_item_quantities` (
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL DEFAULT '0.000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_item_quantities`
--

INSERT INTO `ospos_item_quantities` (`item_id`, `location_id`, `quantity`) VALUES
(216, 1, 0.000),
(217, 1, 0.000),
(218, 1, 0.000),
(219, 1, 0.000),
(220, 1, 0.000),
(221, 1, 0.000),
(222, 1, 1.000),
(223, 1, 1.000),
(224, 1, 1.000),
(225, 1, 1.000),
(226, 1, 1.000),
(227, 1, 0.000),
(228, 1, 1.000),
(229, 1, 1.000),
(230, 1, 1.000),
(231, 1, 1.000),
(232, 1, 1.000),
(233, 1, 1.000),
(234, 1, 1.000),
(235, 1, 1.000),
(236, 1, 1.000),
(237, 1, 1.000),
(238, 1, 1.000),
(239, 1, 1.000),
(240, 1, 1.000),
(241, 1, 1.000),
(242, 1, 1.000),
(243, 1, 1.000),
(244, 1, 1.000),
(245, 1, 1.000),
(246, 1, 1.000),
(247, 1, 1.000),
(248, 1, 1.000),
(249, 1, 1.000),
(250, 1, 1.000),
(251, 1, 1.000),
(252, 1, 0.000),
(253, 1, 1.000),
(254, 1, 1.000),
(255, 1, 1.000),
(256, 1, 1.000),
(257, 1, 1.000),
(258, 1, 1.000),
(259, 1, 1.000),
(260, 1, 1.000),
(261, 1, 1.000),
(262, 1, 1.000),
(263, 1, 1.000),
(264, 1, 1.000),
(265, 1, 1.000),
(266, 1, 1.000),
(267, 1, 1.000),
(268, 1, 1.000),
(269, 1, 0.000),
(270, 1, 0.000),
(271, 1, 0.000),
(272, 1, 1.000),
(273, 1, 1.000),
(274, 1, 1.000),
(275, 1, 1.000),
(276, 1, 1.000),
(277, 1, 1.000),
(278, 1, 1.000),
(279, 1, 1.000),
(280, 1, 1.000),
(281, 1, 1.000),
(282, 1, 1.000),
(283, 1, 1.000),
(284, 1, 1.000),
(285, 1, 1.000),
(286, 1, 1.000),
(287, 1, 1.000),
(288, 1, 1.000),
(289, 1, 1.000),
(290, 1, 1.000),
(291, 1, 1.000),
(292, 1, 1.000),
(293, 1, 1.000),
(294, 1, 1.000),
(295, 1, 1.000),
(296, 1, 1.000),
(297, 1, 1.000),
(298, 1, 1.000),
(299, 1, 1.000),
(300, 1, 1.000),
(301, 1, 0.000);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_migrations`
--

DROP TABLE IF EXISTS `ospos_migrations`;
CREATE TABLE `ospos_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_migrations`
--

INSERT INTO `ospos_migrations` (`version`) VALUES
(20191008100000);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_modules`
--

DROP TABLE IF EXISTS `ospos_modules`;
CREATE TABLE `ospos_modules` (
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_modules`
--

INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES
('module_attributes', 'module_attributes_desc', 107, 'attributes'),
('module_cashups', 'module_cashups_desc', 110, 'cashups'),
('module_config', 'module_config_desc', 900, 'config'),
('module_consignmenters', 'module_consignmenters_desc', 40, 'consignmenters'),
('module_customers', 'module_customers_desc', 10, 'customers'),
('module_employees', 'module_employees_desc', 80, 'employees'),
('module_expenses', 'module_expenses_desc', 108, 'expenses'),
('module_expenses_categories', 'module_expenses_categories_desc', 109, 'expenses_categories'),
('module_giftcards', 'module_giftcards_desc', 90, 'giftcards'),
('module_home', 'module_home_desc', 1, 'home'),
('module_items', 'module_items_desc', 20, 'items'),
('module_item_kits', 'module_item_kits_desc', 30, 'item_kits'),
('module_messages', 'module_messages_desc', 98, 'messages'),
('module_office', 'module_office_desc', 999, 'office'),
('module_receivings', 'module_receivings_desc', 60, 'receivings'),
('module_reports', 'module_reports_desc', 50, 'reports'),
('module_sales', 'module_sales_desc', 70, 'sales'),
('module_taxes', 'module_taxes_desc', 105, 'taxes');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_people`
--

DROP TABLE IF EXISTS `ospos_people`;
CREATE TABLE `ospos_people` (
  `name` varchar(255) NOT NULL,
  `gender` int(1) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `person_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_people`
--

INSERT INTO `ospos_people` (`name`, `gender`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `person_id`) VALUES
('Admin', NULL, '+84 98 689 18 30', 'nakamadressup@gmail.com', ' 196/1/8 cộng hoà, phường 12, quận Tân Bình, TPHCM', '', '', '', '', '', '', 1),
('Banhang1', 0, '', '', 'Tan Binh', '', '', '', '', '', '', 33),
('Ty', NULL, '', '', '', '', '', '', '', '', '', 34),
('Ly Ngoc Anh', 0, '', '', '', '', '', '', '', '', '', 35),
('Ly Ngoc Anh', 0, '', '', '', '', '', '', '', '', '', 36),
('Vo Thi Phuong', 0, '', '', '', '', '', '', '', '', '', 37),
('Nhu y', 0, '', '', '', '', '', '', '', '', '', 38),
('Nguyễn Bảo Thùy Vân', 0, '', '', '', '', '', '', '', '', '', 39),
('Tram', 0, '', '', '', '', '', '', '', '', '', 40),
('Duong Hue Trinh', 0, '', '', '', '', '', '', '', '', '', 41),
('Ho Uyen Nhi', 0, '', '', '', '', '', '', '', '', '', 42);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_permissions`
--

DROP TABLE IF EXISTS `ospos_permissions`;
CREATE TABLE `ospos_permissions` (
  `permission_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `location_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_permissions`
--

INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES
('attributes', 'attributes', NULL),
('cashups', 'cashups', NULL),
('config', 'config', NULL),
('consignmenters', 'consignmenters', NULL),
('customers', 'customers', NULL),
('employees', 'employees', NULL),
('expenses', 'expenses', NULL),
('expenses_categories', 'expenses_categories', NULL),
('giftcards', 'giftcards', NULL),
('home', 'home', NULL),
('items', 'items', NULL),
('items_stock', 'items', 1),
('item_kits', 'item_kits', NULL),
('messages', 'messages', NULL),
('office', 'office', NULL),
('receivings', 'receivings', NULL),
('receivings_stock', 'receivings', 1),
('reports', 'reports', NULL),
('reports_categories', 'reports', NULL),
('reports_consignmenters', 'reports', NULL),
('reports_customers', 'reports', NULL),
('reports_discounts', 'reports', NULL),
('reports_employees', 'reports', NULL),
('reports_expenses_categories', 'reports', NULL),
('reports_inventory', 'reports', NULL),
('reports_items', 'reports', NULL),
('reports_payments', 'reports', NULL),
('reports_receivings', 'reports', NULL),
('reports_sales', 'reports', NULL),
('reports_sales_taxes', 'reports', NULL),
('reports_taxes', 'reports', NULL),
('sales', 'sales', NULL),
('sales_delete', 'sales', NULL),
('sales_stock', 'sales', 1),
('taxes', 'taxes', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_receivings`
--

DROP TABLE IF EXISTS `ospos_receivings`;
CREATE TABLE `ospos_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `consignmenter_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text,
  `receiving_id` int(10) NOT NULL,
  `payment_type` varchar(20) DEFAULT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `expiration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_receivings`
--

INSERT INTO `ospos_receivings` (`receiving_time`, `consignmenter_id`, `employee_id`, `comment`, `receiving_id`, `payment_type`, `reference`, `expiration_date`) VALUES
('2020-03-09 11:21:45', 34, 33, '', 41, 'Tiền mặt', NULL, '2020-05-08 17:00:00'),
('2020-03-09 12:10:23', 35, 33, '', 42, 'Tiền mặt', NULL, '2020-05-08 17:00:00'),
('2020-03-09 12:16:00', 36, 33, '', 43, 'Tiền mặt', NULL, '2020-05-08 17:00:00'),
('2020-03-09 12:25:35', 37, 33, '', 44, 'Tiền mặt', NULL, '2020-05-08 17:00:00'),
('2020-03-09 12:44:17', 38, 33, '', 45, 'Tiền mặt', NULL, '2020-05-08 17:00:00'),
('2020-03-09 12:52:43', 39, 33, '', 46, 'Tiền mặt', NULL, '2020-05-08 17:00:00'),
('2020-03-09 13:02:51', 40, 33, '', 47, 'Tiền mặt', NULL, '2020-05-08 17:00:00'),
('2020-03-09 13:06:19', 41, 33, '', 48, 'Tiền mặt', NULL, '2020-05-08 17:00:00'),
('2020-03-09 13:23:40', 42, 33, '', 49, 'Tiền mặt', NULL, '2020-05-08 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_receivings_items`
--

DROP TABLE IF EXISTS `ospos_receivings_items`;
CREATE TABLE `ospos_receivings_items` (
  `receiving_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL,
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT '0.000',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount_type` tinyint(2) NOT NULL DEFAULT '0',
  `item_location` int(11) NOT NULL,
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT '1.000',
  `fee` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_receivings_items`
--

INSERT INTO `ospos_receivings_items` (`receiving_id`, `item_id`, `description`, `serialnumber`, `line`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount`, `discount_type`, `item_location`, `receiving_quantity`, `fee`) VALUES
(41, 216, '', NULL, 1, 1.000, 200.00, 160.00, 0.00, 0, 1, 1.000, 20.00),
(41, 217, '', NULL, 2, 1.000, 100.00, 80.00, 0.00, 0, 1, 1.000, 20.00),
(42, 218, '', NULL, 1, 1.000, 120000.00, 96000.00, 0.00, 0, 1, 1.000, 20.00),
(43, 222, '', NULL, 1, 1.000, 120000.00, 96000.00, 0.00, 0, 1, 1.000, 20.00),
(43, 223, '', NULL, 2, 1.000, 170000.00, 136000.00, 0.00, 0, 1, 1.000, 20.00),
(43, 224, '', NULL, 3, 1.000, 80000.00, 64000.00, 0.00, 0, 1, 1.000, 20.00),
(43, 225, '', NULL, 4, 1.000, 70000.00, 56000.00, 0.00, 0, 1, 1.000, 20.00),
(43, 226, '', NULL, 5, 1.000, 80000.00, 64000.00, 0.00, 0, 1, 1.000, 20.00),
(44, 228, '', NULL, 1, 1.000, 99000.00, 79200.00, 0.00, 0, 1, 1.000, 20.00),
(44, 229, '', NULL, 2, 1.000, 39000.00, 31200.00, 0.00, 0, 1, 1.000, 20.00),
(44, 230, '', NULL, 3, 1.000, 79000.00, 63200.00, 0.00, 0, 1, 1.000, 20.00),
(44, 231, '', NULL, 4, 1.000, 39000.00, 31200.00, 0.00, 0, 1, 1.000, 20.00),
(44, 232, '', NULL, 5, 1.000, 99000.00, 79200.00, 0.00, 0, 1, 1.000, 20.00),
(44, 233, '', NULL, 6, 1.000, 49000.00, 39200.00, 0.00, 0, 1, 1.000, 20.00),
(44, 234, '', NULL, 7, 1.000, 149000.00, 119200.00, 0.00, 0, 1, 1.000, 20.00),
(44, 235, '', NULL, 8, 1.000, 189000.00, 151200.00, 0.00, 0, 1, 1.000, 20.00),
(44, 236, '', NULL, 9, 1.000, 99000.00, 79200.00, 0.00, 0, 1, 1.000, 20.00),
(44, 237, '', NULL, 10, 1.000, 59000.00, 47200.00, 0.00, 0, 1, 1.000, 20.00),
(44, 238, '', NULL, 11, 1.000, 99000.00, 79200.00, 0.00, 0, 1, 1.000, 20.00),
(44, 239, '', NULL, 12, 1.000, 100000.00, 80000.00, 0.00, 0, 1, 1.000, 20.00),
(44, 240, '', NULL, 13, 1.000, 189000.00, 151200.00, 0.00, 0, 1, 1.000, 20.00),
(44, 241, '', NULL, 14, 1.000, 99000.00, 79200.00, 0.00, 0, 1, 1.000, 20.00),
(44, 242, '', NULL, 15, 1.000, 149000.00, 119200.00, 0.00, 0, 1, 1.000, 20.00),
(45, 243, '', NULL, 1, 1.000, 139000.00, 111200.00, 0.00, 0, 1, 1.000, 20.00),
(45, 244, '', NULL, 2, 1.000, 69000.00, 55200.00, 0.00, 0, 1, 1.000, 20.00),
(45, 245, '', NULL, 3, 1.000, 85000.00, 68000.00, 0.00, 0, 1, 1.000, 20.00),
(45, 246, '', NULL, 4, 1.000, 69000.00, 55200.00, 0.00, 0, 1, 1.000, 20.00),
(45, 247, '', NULL, 5, 1.000, 69000.00, 55200.00, 0.00, 0, 1, 1.000, 20.00),
(45, 248, '', NULL, 6, 1.000, 169000.00, 135200.00, 0.00, 0, 1, 1.000, 20.00),
(45, 249, '', NULL, 7, 1.000, 145000.00, 116000.00, 0.00, 0, 1, 1.000, 20.00),
(45, 250, '', NULL, 8, 1.000, 65000.00, 52000.00, 0.00, 0, 1, 1.000, 20.00),
(45, 251, '', NULL, 9, 1.000, 149000.00, 119200.00, 0.00, 0, 1, 1.000, 20.00),
(46, 253, '', NULL, 1, 1.000, 45000.00, 36000.00, 0.00, 0, 1, 1.000, 20.00),
(46, 254, '', NULL, 2, 1.000, 55000.00, 44000.00, 0.00, 0, 1, 1.000, 20.00),
(46, 255, '', NULL, 3, 1.000, 70000.00, 56000.00, 0.00, 0, 1, 1.000, 20.00),
(46, 256, '', NULL, 4, 1.000, 35000.00, 28000.00, 0.00, 0, 1, 1.000, 20.00),
(46, 257, '', NULL, 5, 1.000, 55000.00, 44000.00, 0.00, 0, 1, 1.000, 20.00),
(46, 258, '', NULL, 6, 1.000, 45000.00, 36000.00, 0.00, 0, 1, 1.000, 20.00),
(46, 259, '', NULL, 7, 1.000, 15000.00, 12000.00, 0.00, 0, 1, 1.000, 20.00),
(46, 260, '', NULL, 8, 1.000, 150000.00, 120000.00, 0.00, 0, 1, 1.000, 20.00),
(46, 261, '', NULL, 9, 1.000, 50000.00, 40000.00, 0.00, 0, 1, 1.000, 20.00),
(46, 262, '', NULL, 10, 1.000, 130000.00, 104000.00, 0.00, 0, 1, 1.000, 20.00),
(46, 263, '', NULL, 11, 1.000, 95000.00, 76000.00, 0.00, 0, 1, 1.000, 20.00),
(46, 264, '', NULL, 12, 1.000, 80000.00, 64000.00, 0.00, 0, 1, 1.000, 20.00),
(46, 265, '', NULL, 13, 1.000, 50000.00, 40000.00, 0.00, 0, 1, 1.000, 20.00),
(46, 266, '', NULL, 14, 1.000, 70000.00, 56000.00, 0.00, 0, 1, 1.000, 20.00),
(46, 267, '', NULL, 15, 1.000, 50000.00, 40000.00, 0.00, 0, 1, 1.000, 20.00),
(46, 268, '', NULL, 16, 1.000, 0.00, 0.00, 0.00, 0, 1, 1.000, 20.00),
(47, 272, '', NULL, 4, 1.000, 50000.00, 40000.00, 0.00, 0, 1, 1.000, 20.00),
(47, 273, '', NULL, 5, 1.000, 40000.00, 32000.00, 0.00, 0, 1, 1.000, 20.00),
(47, 274, '', NULL, 6, 1.000, 40000.00, 32000.00, 0.00, 0, 1, 1.000, 20.00),
(47, 275, '', NULL, 7, 1.000, 40000.00, 32000.00, 0.00, 0, 1, 1.000, 20.00),
(47, 276, '', NULL, 8, 1.000, 45000.00, 36000.00, 0.00, 0, 1, 1.000, 20.00),
(47, 277, '', NULL, 9, 1.000, 40000.00, 32000.00, 0.00, 0, 1, 1.000, 20.00),
(47, 278, '', NULL, 10, 1.000, 90000.00, 72000.00, 0.00, 0, 1, 1.000, 20.00),
(47, 279, '', NULL, 11, 1.000, 60000.00, 48000.00, 0.00, 0, 1, 1.000, 20.00),
(47, 280, '', NULL, 12, 1.000, 60000.00, 48000.00, 0.00, 0, 1, 1.000, 20.00),
(48, 281, '', NULL, 1, 1.000, 109000.00, 87200.00, 0.00, 0, 1, 1.000, 20.00),
(48, 282, '', NULL, 2, 1.000, 90000.00, 72000.00, 0.00, 0, 1, 1.000, 20.00),
(48, 283, '', NULL, 3, 1.000, 65000.00, 52000.00, 0.00, 0, 1, 1.000, 20.00),
(48, 284, '', NULL, 4, 1.000, 70000.00, 56000.00, 0.00, 0, 1, 1.000, 20.00),
(48, 285, '', NULL, 5, 1.000, 25000.00, 20000.00, 0.00, 0, 1, 1.000, 20.00),
(48, 286, '', NULL, 6, 1.000, 60000.00, 48000.00, 0.00, 0, 1, 1.000, 20.00),
(49, 287, '', NULL, 1, 1.000, 95000.00, 76000.00, 0.00, 0, 1, 1.000, 20.00),
(49, 288, '', NULL, 2, 1.000, 50000.00, 40000.00, 0.00, 0, 1, 1.000, 20.00),
(49, 289, '', NULL, 3, 1.000, 90000.00, 72000.00, 0.00, 0, 1, 1.000, 20.00),
(49, 290, '', NULL, 4, 1.000, 60000.00, 48000.00, 0.00, 0, 1, 1.000, 20.00),
(49, 291, '', NULL, 5, 1.000, 60000.00, 48000.00, 0.00, 0, 1, 1.000, 20.00),
(49, 292, '', NULL, 6, 1.000, 45000.00, 36000.00, 0.00, 0, 1, 1.000, 20.00),
(49, 293, '', NULL, 7, 1.000, 50000.00, 40000.00, 0.00, 0, 1, 1.000, 20.00),
(49, 294, '', NULL, 8, 1.000, 35000.00, 28000.00, 0.00, 0, 1, 1.000, 20.00),
(49, 295, '', NULL, 9, 1.000, 39000.00, 31200.00, 0.00, 0, 1, 1.000, 20.00),
(49, 296, '', NULL, 10, 1.000, 65000.00, 52000.00, 0.00, 0, 1, 1.000, 20.00),
(49, 297, '', NULL, 11, 1.000, 65000.00, 52000.00, 0.00, 0, 1, 1.000, 20.00),
(49, 298, '', NULL, 12, 1.000, 35000.00, 28000.00, 0.00, 0, 1, 1.000, 20.00),
(49, 299, '', NULL, 13, 1.000, 70000.00, 56000.00, 0.00, 0, 1, 1.000, 20.00),
(49, 300, '', NULL, 14, 1.000, 75000.00, 60000.00, 0.00, 0, 1, 1.000, 20.00);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales`
--

DROP TABLE IF EXISTS `ospos_sales`;
CREATE TABLE `ospos_sales` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text,
  `invoice_number` varchar(32) DEFAULT NULL,
  `quote_number` varchar(32) DEFAULT NULL,
  `sale_id` int(10) NOT NULL,
  `sale_status` tinyint(2) NOT NULL DEFAULT '0',
  `dinner_table_id` int(11) DEFAULT NULL,
  `work_order_number` varchar(32) DEFAULT NULL,
  `sale_type` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_sales`
--

INSERT INTO `ospos_sales` (`sale_time`, `customer_id`, `employee_id`, `comment`, `invoice_number`, `quote_number`, `sale_id`, `sale_status`, `dinner_table_id`, `work_order_number`, `sale_type`) VALUES
('2020-03-09 11:29:03', NULL, 33, '', NULL, NULL, 5, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_items`
--

DROP TABLE IF EXISTS `ospos_sales_items`;
CREATE TABLE `ospos_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT '0.000',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount_type` tinyint(2) NOT NULL DEFAULT '0',
  `item_location` int(11) NOT NULL,
  `print_option` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_sales_items`
--

INSERT INTO `ospos_sales_items` (`sale_id`, `item_id`, `description`, `serialnumber`, `line`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount`, `discount_type`, `item_location`, `print_option`) VALUES
(5, 216, '', '', 1, 1.000, 160.00, 200.00, 0.00, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_items_taxes`
--

DROP TABLE IF EXISTS `ospos_sales_items_taxes`;
CREATE TABLE `ospos_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax_type` tinyint(2) NOT NULL DEFAULT '0',
  `rounding_code` tinyint(2) NOT NULL DEFAULT '0',
  `cascade_sequence` tinyint(2) NOT NULL DEFAULT '0',
  `item_tax_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sales_tax_code_id` int(11) DEFAULT NULL,
  `jurisdiction_id` int(11) DEFAULT NULL,
  `tax_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_payments`
--

DROP TABLE IF EXISTS `ospos_sales_payments`;
CREATE TABLE `ospos_sales_payments` (
  `payment_id` int(11) NOT NULL,
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  `cash_refund` decimal(15,2) NOT NULL DEFAULT '0.00',
  `employee_id` int(11) DEFAULT NULL,
  `payment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_code` varchar(40) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_reward_points`
--

DROP TABLE IF EXISTS `ospos_sales_reward_points`;
CREATE TABLE `ospos_sales_reward_points` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `earned` float NOT NULL,
  `used` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_taxes`
--

DROP TABLE IF EXISTS `ospos_sales_taxes`;
CREATE TABLE `ospos_sales_taxes` (
  `sales_taxes_id` int(11) NOT NULL,
  `sale_id` int(10) NOT NULL,
  `jurisdiction_id` int(11) DEFAULT NULL,
  `tax_category_id` int(11) DEFAULT NULL,
  `tax_type` smallint(2) NOT NULL,
  `tax_group` varchar(32) NOT NULL,
  `sale_tax_basis` decimal(15,4) NOT NULL,
  `sale_tax_amount` decimal(15,4) NOT NULL,
  `print_sequence` tinyint(2) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `tax_rate` decimal(15,4) NOT NULL,
  `sales_tax_code_id` int(11) DEFAULT NULL,
  `rounding_code` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sessions`
--

DROP TABLE IF EXISTS `ospos_sessions`;
CREATE TABLE `ospos_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_sessions`
--

INSERT INTO `ospos_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('0842cde65f871315c3d3e26ca0d6b76c0c13e3a2', '171.100.28.50', 1583752675, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735323637353b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a313b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f696e766f6963655f6e756d6265727c4e3b726563765f636f6e7369676e6d656e7465727c693a2d313b),
('20bc6a03b633957eb985349c1c4d1603cbf55a17', '171.100.28.50', 1583752953, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735323736393b706572736f6e5f69647c733a323a223333223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f73746f636b5f736f757263657c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f636f6e7369676e6d656e7465727c693a2d313b),
('1176dec5227e0bd347fb31a8de919cde95573e71', '182.232.189.41', 1583753161, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735333136313b),
('9ce4a5ea67cf11790fc029f39067dc417a5fb744', '182.232.189.41', 1583753364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735333136353b706572736f6e5f69647c733a323a223333223b6d656e755f67726f75707c733a343a22686f6d65223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f636f6e7369676e6d656e7465727c693a2d313b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c655f69647c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b),
('d462014eae70947f5d9f019aa794a58756b5265b', '182.232.189.41', 1583756553, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735363535333b),
('e6f466e30bd8af6b669db9d03a423cd20db70aab', '171.244.184.4', 1583755804, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735353830343b706572736f6e5f69647c733a323a223333223b6d656e755f67726f75707c733a343a22686f6d65223b726563765f636172747c613a313a7b693a313b613a32323a7b733a373a226974656d5f6964223b693a3231383b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a2230383033303141223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d7d726563765f6d6f64657c733a373a2272656365697665223b726563765f636f6e7369676e6d656e7465727c733a323a223335223b726563765f73746f636b5f736f757263657c733a313a2231223b),
('4ddcb57d11f8c7983c52aedb10f036803806121d', '27.65.196.71', 1583755735, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735353733353b),
('4eef161d8b7234e17c9c4bb7607aacf3bb9cf365', '171.244.184.4', 1583756125, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735363132353b706572736f6e5f69647c733a323a223333223b6d656e755f67726f75707c733a343a22686f6d65223b726563765f73746f636b5f736f757263657c733a313a2231223b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a363a7b693a313b613a32323a7b733a373a226974656d5f6964223b693a3232323b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a2230383033303141223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a3132303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2239363030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a323b613a32323a7b733a373a226974656d5f6964223b693a3232333b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a373a2230383033303142223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a333b613a32323a7b733a373a226974656d5f6964223b693a3232343b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a333b733a343a226e616d65223b733a373a2230383033303143223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a38303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2236343030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a343b613a32323a7b733a373a226974656d5f6964223b693a3232353b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a343b733a343a226e616d65223b733a373a2230383033303144223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a353b613a32323a7b733a373a226974656d5f6964223b693a3232363b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a353b733a343a226e616d65223b733a373a2230383033303145223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a38303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2236343030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a363b613a32323a7b733a373a226974656d5f6964223b693a3232373b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a363b733a343a226e616d65223b733a373a2230383033303146223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d7d726563765f6d6f64657c733a373a2272656365697665223b726563765f636f6e7369676e6d656e7465727c733a323a223336223b),
('aa6a7c718be010a11efcce1376d58e813d48e69f', '171.244.184.4', 1583756437, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735363433373b706572736f6e5f69647c733a323a223333223b6d656e755f67726f75707c733a343a22686f6d65223b726563765f73746f636b5f736f757263657c733a313a2231223b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a31353a7b693a313b613a32323a7b733a373a226974656d5f6964223b693a3232383b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a2230383033303241223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a323b613a32323a7b733a373a226974656d5f6964223b693a3232393b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a373a2230383033303242223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a333b613a32323a7b733a373a226974656d5f6964223b693a3233303b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a333b733a343a226e616d65223b733a373a2230383033303243223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a343b613a32323a7b733a373a226974656d5f6964223b693a3233313b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a343b733a343a226e616d65223b733a373a2230383033303244223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a353b613a32323a7b733a373a226974656d5f6964223b693a3233323b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a353b733a343a226e616d65223b733a373a2230383033303245223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a363b613a32323a7b733a373a226974656d5f6964223b693a3233333b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a363b733a343a226e616d65223b733a373a2230383033303246223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a373b613a32323a7b733a373a226974656d5f6964223b693a3233343b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a373b733a343a226e616d65223b733a373a2230383033303247223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a383b613a32323a7b733a373a226974656d5f6964223b693a3233353b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a383b733a343a226e616d65223b733a373a2230383033303248223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a393b613a32323a7b733a373a226974656d5f6964223b693a3233363b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a393b733a343a226e616d65223b733a373a2230383033303249223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31303b613a32323a7b733a373a226974656d5f6964223b693a3233373b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31303b733a343a226e616d65223b733a373a223038303330324a223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31313b613a32323a7b733a373a226974656d5f6964223b693a3233383b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31313b733a343a226e616d65223b733a373a223038303330324b223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a39393030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2237393230302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31323b613a32323a7b733a373a226974656d5f6964223b693a3233393b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31323b733a343a226e616d65223b733a373a223038303330324c223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a3130303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2238303030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31333b613a32323a7b733a373a226974656d5f6964223b693a3234303b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31333b733a343a226e616d65223b733a373a223038303330324d223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a3138393030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a393a223135313230302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31343b613a32323a7b733a373a226974656d5f6964223b693a3234313b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31343b733a343a226e616d65223b733a373a223038303330324e223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a39393030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2237393230302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31353b613a32323a7b733a373a226974656d5f6964223b693a3234323b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31353b733a343a226e616d65223b733a373a223038303330324f223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a3134393030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a393a223131393230302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d7d726563765f6d6f64657c733a373a2272656365697665223b726563765f636f6e7369676e6d656e7465727c733a323a223337223b),
('33278b6508dcf11ddc86995933792f09bce6e1c6', '171.244.184.4', 1583757386, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735373338363b706572736f6e5f69647c733a323a223333223b6d656e755f67726f75707c733a343a22686f6d65223b726563765f73746f636b5f736f757263657c733a313a2231223b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('d206aa530e552644d43359237b0e1f6dfe8ba266', '182.232.189.41', 1583756596, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735363535333b),
('c699b03c4d6cdc1da1740cd1982215dcf7226c51', '139.99.122.1', 1583756643, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735363634333b),
('1236defa636713330953d314e524f5b2a529a538', '171.244.184.4', 1583758027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735383032373b706572736f6e5f69647c733a323a223333223b6d656e755f67726f75707c733a343a22686f6d65223b726563765f73746f636b5f736f757263657c733a313a2231223b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a31353a7b693a313b613a32323a7b733a373a226974656d5f6964223b693a3235333b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a2230363033303241223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a323b613a32323a7b733a373a226974656d5f6964223b693a3235343b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a373a2230363033303242223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a333b613a32323a7b733a373a226974656d5f6964223b693a3235353b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a333b733a343a226e616d65223b733a373a2230363033303243223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a343b613a32323a7b733a373a226974656d5f6964223b693a3235363b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a343b733a343a226e616d65223b733a373a2230363033303244223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a353b613a32323a7b733a373a226974656d5f6964223b693a3235373b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a353b733a343a226e616d65223b733a373a2230363033303245223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a363b613a32323a7b733a373a226974656d5f6964223b693a3235383b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a363b733a343a226e616d65223b733a373a2230363033303246223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a34353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2233363030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a373b613a32323a7b733a373a226974656d5f6964223b693a3235393b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a373b733a343a226e616d65223b733a373a2230363033303247223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a383b613a32323a7b733a373a226974656d5f6964223b693a3236303b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a383b733a343a226e616d65223b733a373a2230363033303248223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a393b613a32323a7b733a373a226974656d5f6964223b693a3236313b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a393b733a343a226e616d65223b733a373a2230363033303249223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31303b613a32323a7b733a373a226974656d5f6964223b693a3236323b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31303b733a343a226e616d65223b733a373a223036303330324a223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31313b613a32323a7b733a373a226974656d5f6964223b693a3236333b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31313b733a343a226e616d65223b733a373a223036303330324b223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31323b613a32323a7b733a373a226974656d5f6964223b693a3236343b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31323b733a343a226e616d65223b733a373a223036303330324c223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31333b613a32323a7b733a373a226974656d5f6964223b693a3236353b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31333b733a343a226e616d65223b733a373a223036303330324d223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a35303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2234303030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31343b613a32323a7b733a373a226974656d5f6964223b693a3236363b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31343b733a343a226e616d65223b733a373a223036303330324e223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31353b613a32323a7b733a373a226974656d5f6964223b693a3236373b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31353b733a343a226e616d65223b733a373a223036303330324f223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a35303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2234303030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d7d726563765f6d6f64657c733a373a2272656365697665223b726563765f636f6e7369676e6d656e7465727c733a323a223339223b);
INSERT INTO `ospos_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('c8639c29b574c8c8f15cbd00b686f56f76801d4d', '171.244.184.4', 1583757703, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735373730333b706572736f6e5f69647c733a323a223333223b6d656e755f67726f75707c733a343a22686f6d65223b726563765f73746f636b5f736f757263657c733a313a2231223b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a31303a7b693a313b613a32323a7b733a373a226974656d5f6964223b693a3234333b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a2230363033303141223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a3133393030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a393a223131313230302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a323b613a32323a7b733a373a226974656d5f6964223b693a3234343b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a373a2230363033303142223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a36393030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2235353230302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a333b613a32323a7b733a373a226974656d5f6964223b693a3234353b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a333b733a343a226e616d65223b733a373a2230363033303143223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a38353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2236383030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a343b613a32323a7b733a373a226974656d5f6964223b693a3234363b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a343b733a343a226e616d65223b733a373a2230363033303144223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a36393030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2235353230302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a353b613a32323a7b733a373a226974656d5f6964223b693a3234373b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a353b733a343a226e616d65223b733a373a2230363033303145223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a36393030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2235353230302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a363b613a32323a7b733a373a226974656d5f6964223b693a3234383b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a363b733a343a226e616d65223b733a373a2230363033303146223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a3136393030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a393a223133353230302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a373b613a32323a7b733a373a226974656d5f6964223b693a3234393b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a373b733a343a226e616d65223b733a373a2230363033303147223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a3134353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a393a223131363030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a383b613a32323a7b733a373a226974656d5f6964223b693a3235303b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a383b733a343a226e616d65223b733a373a2230363033303148223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a36353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2235323030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a393b613a32323a7b733a373a226974656d5f6964223b693a3235313b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a393b733a343a226e616d65223b733a373a2230363033303149223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a3134393030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a393a223131393230302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31303b613a32323a7b733a373a226974656d5f6964223b693a3235323b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31303b733a343a226e616d65223b733a373a223036303330314a223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d7d726563765f6d6f64657c733a373a2272656365697665223b726563765f636f6e7369676e6d656e7465727c733a323a223338223b),
('9b75c95be36f04196fcd5e38c0d91caf7227981a', '171.244.184.4', 1583758363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735383336333b706572736f6e5f69647c733a323a223333223b6d656e755f67726f75707c733a343a22686f6d65223b726563765f73746f636b5f736f757263657c733a313a2231223b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a31363a7b693a313b613a32323a7b733a373a226974656d5f6964223b693a3235333b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a2230363033303241223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a34353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2233363030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a323b613a32323a7b733a373a226974656d5f6964223b693a3235343b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a373a2230363033303242223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a35353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2234343030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a333b613a32323a7b733a373a226974656d5f6964223b693a3235353b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a333b733a343a226e616d65223b733a373a2230363033303243223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a37303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2235363030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a343b613a32323a7b733a373a226974656d5f6964223b693a3235363b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a343b733a343a226e616d65223b733a373a2230363033303244223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a33353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2232383030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a353b613a32323a7b733a373a226974656d5f6964223b693a3235373b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a353b733a343a226e616d65223b733a373a2230363033303245223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a35353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2234343030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a363b613a32323a7b733a373a226974656d5f6964223b693a3235383b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a363b733a343a226e616d65223b733a373a2230363033303246223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a34353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2233363030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a373b613a32323a7b733a373a226974656d5f6964223b693a3235393b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a373b733a343a226e616d65223b733a373a2230363033303247223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a31353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2231323030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a383b613a32323a7b733a373a226974656d5f6964223b693a3236303b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a383b733a343a226e616d65223b733a373a2230363033303248223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a3135303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a393a223132303030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a393b613a32323a7b733a373a226974656d5f6964223b693a3236313b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a393b733a343a226e616d65223b733a373a2230363033303249223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a35303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2234303030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31303b613a32323a7b733a373a226974656d5f6964223b693a3236323b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31303b733a343a226e616d65223b733a373a223036303330324a223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a3133303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a393a223130343030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31313b613a32323a7b733a373a226974656d5f6964223b693a3236333b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31313b733a343a226e616d65223b733a373a223036303330324b223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a39353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2237363030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31323b613a32323a7b733a373a226974656d5f6964223b693a3236343b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31323b733a343a226e616d65223b733a373a223036303330324c223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a38303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2236343030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31333b613a32323a7b733a373a226974656d5f6964223b693a3236353b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31333b733a343a226e616d65223b733a373a223036303330324d223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a35303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2234303030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31343b613a32323a7b733a373a226974656d5f6964223b693a3236363b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31343b733a343a226e616d65223b733a373a223036303330324e223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a37303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2235363030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31353b613a32323a7b733a373a226974656d5f6964223b693a3236373b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31353b733a343a226e616d65223b733a373a223036303330324f223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a35303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2234303030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31363b613a32323a7b733a373a226974656d5f6964223b693a3236383b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31363b733a343a226e616d65223b733a373a2230363033303250223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d7d726563765f6d6f64657c733a373a2272656365697665223b726563765f636f6e7369676e6d656e7465727c733a323a223339223b),
('c0ce828cd118a848b2424e56fd722b5c8f91fcfe', '171.244.184.4', 1583758687, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735383638373b706572736f6e5f69647c733a323a223333223b6d656e755f67726f75707c733a343a22686f6d65223b726563765f73746f636b5f736f757263657c733a313a2231223b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a393a7b693a313b613a32323a7b733a373a226974656d5f6964223b693a3236393b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a2230363033303341223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a323b613a32323a7b733a373a226974656d5f6964223b693a3237303b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a373a2230363033303342223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a333b613a32323a7b733a373a226974656d5f6964223b693a3237313b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a333b733a343a226e616d65223b733a373a2230363033303343223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a343b613a32323a7b733a373a226974656d5f6964223b693a3237323b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a343b733a343a226e616d65223b733a373a2230363033303344223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a353b613a32323a7b733a373a226974656d5f6964223b693a3237333b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a353b733a343a226e616d65223b733a373a2230363033303345223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a34303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2233323030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a363b613a32323a7b733a373a226974656d5f6964223b693a3237343b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a363b733a343a226e616d65223b733a373a2230363033303346223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a373b613a32323a7b733a373a226974656d5f6964223b693a3237353b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a373b733a343a226e616d65223b733a373a2230363033303347223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a383b613a32323a7b733a373a226974656d5f6964223b693a3237363b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a383b733a343a226e616d65223b733a373a2230363033303348223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a393b613a32323a7b733a373a226974656d5f6964223b693a3237373b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a393b733a343a226e616d65223b733a373a2230363033303349223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a36303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2234383030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d7d726563765f6d6f64657c733a373a2272656365697665223b726563765f636f6e7369676e6d656e7465727c733a323a223430223b),
('4b9f0c2c282e569173df0f8509d2720e4ae3743f', '171.244.184.4', 1583759041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735393034313b706572736f6e5f69647c733a323a223333223b6d656e755f67726f75707c733a343a22686f6d65223b726563765f73746f636b5f736f757263657c733a313a2231223b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('f2f6cdfe1e9dae122fab2d7bf8d9a3c22f09787c', '171.244.184.4', 1583759571, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735393537313b706572736f6e5f69647c733a323a223333223b6d656e755f67726f75707c733a343a22686f6d65223b726563765f73746f636b5f736f757263657c733a313a2231223b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('c78e2cb8595093a19b29baa7ab72b4a1be7fe81a', '182.232.178.85', 1583759671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735393432303b706572736f6e5f69647c733a323a223333223b6d656e755f67726f75707c733a343a22686f6d65223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f636f6e7369676e6d656e7465727c693a2d313b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b);
INSERT INTO `ospos_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('90255cf184d0e1d77c04c32108a45bc116317078', '171.244.184.4', 1583759917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333735393931373b706572736f6e5f69647c733a323a223333223b6d656e755f67726f75707c733a343a22686f6d65223b726563765f73746f636b5f736f757263657c733a313a2231223b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a31353a7b693a313b613a32323a7b733a373a226974656d5f6964223b693a3238373b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a2230393033303141223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a39353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2237363030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a323b613a32323a7b733a373a226974656d5f6964223b693a3238383b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a373a2230393033303142223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a35303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2234303030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a333b613a32323a7b733a373a226974656d5f6964223b693a3238393b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a333b733a343a226e616d65223b733a373a2230393033303143223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a39303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2237323030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a343b613a32323a7b733a373a226974656d5f6964223b693a3239303b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a343b733a343a226e616d65223b733a373a2230393033303144223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a36303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2234383030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a353b613a32323a7b733a373a226974656d5f6964223b693a3239313b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a353b733a343a226e616d65223b733a373a2230393033303145223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a36303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2234383030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a363b613a32323a7b733a373a226974656d5f6964223b693a3239323b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a363b733a343a226e616d65223b733a373a2230393033303146223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a34353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2233363030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a373b613a32323a7b733a373a226974656d5f6964223b693a3239333b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a373b733a343a226e616d65223b733a373a2230393033303147223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a383b613a32323a7b733a373a226974656d5f6964223b693a3239343b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a383b733a343a226e616d65223b733a373a2230393033303148223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a393b613a32323a7b733a373a226974656d5f6964223b693a3239353b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a393b733a343a226e616d65223b733a373a2230393033303149223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31303b613a32323a7b733a373a226974656d5f6964223b693a3239363b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31303b733a343a226e616d65223b733a373a223039303330314a223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31313b613a32323a7b733a373a226974656d5f6964223b693a3239373b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31313b733a343a226e616d65223b733a373a223039303330314b223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31323b613a32323a7b733a373a226974656d5f6964223b693a3239383b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31323b733a343a226e616d65223b733a373a223039303330314c223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31333b613a32323a7b733a373a226974656d5f6964223b693a3239393b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31333b733a343a226e616d65223b733a373a223039303330314d223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31343b613a32323a7b733a373a226974656d5f6964223b693a3330303b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31343b733a343a226e616d65223b733a373a223039303330314e223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31353b613a32323a7b733a373a226974656d5f6964223b693a3330313b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31353b733a343a226e616d65223b733a373a223039303330314f223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a333a22666565223b693a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b733a343a22302e3030223b733a31383a22726563656976696e675f7175616e74697479223b733a353a22312e303030223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a343a22302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d7d726563765f6d6f64657c733a373a2272656365697665223b726563765f636f6e7369676e6d656e7465727c733a323a223432223b),
('be78bcb5868be5ee70805a0c043d757574814a75', '171.244.184.4', 1583760220, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333736303232303b706572736f6e5f69647c733a323a223333223b6d656e755f67726f75707c733a343a22686f6d65223b726563765f73746f636b5f736f757263657c733a313a2231223b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a31343a7b693a313b613a32323a7b733a373a226974656d5f6964223b693a3238373b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a2230393033303141223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a39353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2237363030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a323b613a32323a7b733a373a226974656d5f6964223b693a3238383b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a373a2230393033303142223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a35303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2234303030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a333b613a32323a7b733a373a226974656d5f6964223b693a3238393b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a333b733a343a226e616d65223b733a373a2230393033303143223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a39303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2237323030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a343b613a32323a7b733a373a226974656d5f6964223b693a3239303b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a343b733a343a226e616d65223b733a373a2230393033303144223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a36303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2234383030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a353b613a32323a7b733a373a226974656d5f6964223b693a3239313b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a353b733a343a226e616d65223b733a373a2230393033303145223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a36303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2234383030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a363b613a32323a7b733a373a226974656d5f6964223b693a3239323b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a363b733a343a226e616d65223b733a373a2230393033303146223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a34353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2233363030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a373b613a32323a7b733a373a226974656d5f6964223b693a3239333b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a373b733a343a226e616d65223b733a373a2230393033303147223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a35303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2234303030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a383b613a32323a7b733a373a226974656d5f6964223b693a3239343b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a383b733a343a226e616d65223b733a373a2230393033303148223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a33353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2232383030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a393b613a32323a7b733a373a226974656d5f6964223b693a3239353b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a393b733a343a226e616d65223b733a373a2230393033303149223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a33393030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2233313230302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31303b613a32323a7b733a373a226974656d5f6964223b693a3239363b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31303b733a343a226e616d65223b733a373a223039303330314a223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a36353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2235323030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31313b613a32323a7b733a373a226974656d5f6964223b693a3239373b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31313b733a343a226e616d65223b733a373a223039303330314b223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a36353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2235323030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31323b613a32323a7b733a373a226974656d5f6964223b693a3239383b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31323b733a343a226e616d65223b733a373a223039303330314c223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a33353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2232383030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31333b613a32323a7b733a373a226974656d5f6964223b693a3239393b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31333b733a343a226e616d65223b733a373a223039303330314d223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a37303030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2235363030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d693a31343b613a32323a7b733a373a226974656d5f6964223b693a3330303b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31313a226974656d5f6e756d626572223b4e3b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a31343b733a343a226e616d65223b733a373a223039303330314e223b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b4e3b733a31363a226174747269627574655f76616c756573223b4e3b733a31383a226174747269627574655f647476616c756573223b4e3b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a333a22666565223b643a32303b733a383a22646973636f756e74223b733a313a2230223b733a31333a22646973636f756e745f74797065223b733a313a2230223b733a383a22696e5f73746f636b223b733a353a22302e303030223b733a353a227072696365223b643a37353030303b733a31383a22726563656976696e675f7175616e74697479223b733a313a2231223b733a32363a22726563656976696e675f7175616e746974795f63686f69636573223b613a313a7b693a313b733a323a227831223b7d733a353a22746f74616c223b733a383a2236303030302e3030223b733a31363a22636f6e7369676e6d656e7465725f6964223b4e3b7d7d726563765f6d6f64657c733a373a2272656365697665223b726563765f636f6e7369676e6d656e7465727c733a323a223432223b),
('50dfb0df0e4d5a80ab1bc705bd095c24b11a7752', '171.244.184.4', 1583760220, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333736303232303b706572736f6e5f69647c733a323a223333223b6d656e755f67726f75707c733a343a22686f6d65223b726563765f73746f636b5f736f757263657c733a313a2231223b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('569037c21867be92d48c7069e1fde46b6fa225d8', '115.74.158.174', 1583767072, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333736373037313b),
('3f5e8c86fe676f9c132b9a8c1780ade01d15beec', '27.65.196.70', 1583767309, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333736373330393b),
('6f097002231ab0aa108274704cbfa8588654bc6f', '182.232.178.85', 1583772370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333737323336393b),
('e9c44152d0a7d7f6de0a568020daa737e8ac62c8', '182.232.178.85', 1583773554, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333737333535343b),
('ffa1efe5dad1846bbdeabab668f337640414fec2', '115.74.158.174', 1583774841, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333737343834313b),
('62ac3f98aeb4c92b51e10b5b001973904ff5c478', '182.232.178.85', 1583778630, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333737383431333b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('32619d4e789277b7a7de5304172b42f9061c6e9e', '3.0.163.208', 1583811618, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333831313631373b),
('8916041bcf2db1ccde070b55497a072971752449', '203.146.225.117', 1583811621, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333831313631393b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b),
('3bdbdcffe1ebdb6176b876d400e7764fd1193ecd', '3.0.163.208', 1583811619, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333831313631393b),
('e700b43b2cd7a3ee697eea927689135c60a95a80', '203.146.225.117', 1583811622, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333831313632323b),
('bb328912d2875d90a35cfcc75edf99f93c1b5733', '3.0.163.208', 1583811622, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333831313632323b),
('e700b43b2cd7a3ee697eea927689135c60a95a80', '171.100.28.50', 1583812017, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333831323031373b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a303b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('45437bc3d5e4eb512c7fd75f8dc98cb3622dd951', '171.100.28.50', 1583812045, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333831323031373b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a303b73616c655f69647c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d636173685f6d6f64657c693a303b636173685f726f756e64696e677c693a303b73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f636f6e7369676e6d656e7465727c693a2d313b),
('2986e4a9f39631249d5aae2f5b210876361c013b', '203.146.225.117', 1583823557, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333832333334363b706572736f6e5f69647c733a313a2231223b6d656e755f67726f75707c733a343a22686f6d65223b616c6c6f775f74656d705f6974656d737c693a303b6974656d5f6c6f636174696f6e7c733a313a2231223b);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_stock_locations`
--

DROP TABLE IF EXISTS `ospos_stock_locations`;
CREATE TABLE `ospos_stock_locations` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_stock_locations`
--

INSERT INTO `ospos_stock_locations` (`location_id`, `location_name`, `deleted`) VALUES
(1, 'stock', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_tax_categories`
--

DROP TABLE IF EXISTS `ospos_tax_categories`;
CREATE TABLE `ospos_tax_categories` (
  `tax_category_id` int(10) NOT NULL,
  `tax_category` varchar(32) NOT NULL,
  `tax_group_sequence` tinyint(2) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_tax_codes`
--

DROP TABLE IF EXISTS `ospos_tax_codes`;
CREATE TABLE `ospos_tax_codes` (
  `tax_code_id` int(11) NOT NULL,
  `tax_code` varchar(32) NOT NULL,
  `tax_code_name` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_tax_jurisdictions`
--

DROP TABLE IF EXISTS `ospos_tax_jurisdictions`;
CREATE TABLE `ospos_tax_jurisdictions` (
  `jurisdiction_id` int(11) NOT NULL,
  `jurisdiction_name` varchar(255) DEFAULT NULL,
  `tax_group` varchar(32) NOT NULL,
  `tax_type` smallint(2) NOT NULL,
  `reporting_authority` varchar(255) DEFAULT NULL,
  `tax_group_sequence` tinyint(2) NOT NULL DEFAULT '0',
  `cascade_sequence` tinyint(2) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_tax_rates`
--

DROP TABLE IF EXISTS `ospos_tax_rates`;
CREATE TABLE `ospos_tax_rates` (
  `tax_rate_id` int(11) NOT NULL,
  `rate_tax_code_id` int(11) NOT NULL,
  `rate_tax_category_id` int(10) NOT NULL,
  `rate_jurisdiction_id` int(11) NOT NULL,
  `tax_rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax_rounding_code` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ospos_app_config`
--
ALTER TABLE `ospos_app_config`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `ospos_attribute_definitions`
--
ALTER TABLE `ospos_attribute_definitions`
  ADD PRIMARY KEY (`definition_id`),
  ADD KEY `definition_fk` (`definition_fk`);

--
-- Indexes for table `ospos_attribute_links`
--
ALTER TABLE `ospos_attribute_links`
  ADD UNIQUE KEY `attribute_links_uq1` (`attribute_id`,`definition_id`,`item_id`,`sale_id`,`receiving_id`),
  ADD KEY `attribute_id` (`attribute_id`),
  ADD KEY `definition_id` (`definition_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `receiving_id` (`receiving_id`);

--
-- Indexes for table `ospos_attribute_values`
--
ALTER TABLE `ospos_attribute_values`
  ADD PRIMARY KEY (`attribute_id`),
  ADD UNIQUE KEY `attribute_value` (`attribute_value`);

--
-- Indexes for table `ospos_cash_up`
--
ALTER TABLE `ospos_cash_up`
  ADD PRIMARY KEY (`cashup_id`),
  ADD KEY `open_employee_id` (`open_employee_id`),
  ADD KEY `close_employee_id` (`close_employee_id`);

--
-- Indexes for table `ospos_consignmenters`
--
ALTER TABLE `ospos_consignmenters`
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `ospos_customers`
--
ALTER TABLE `ospos_customers`
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `sales_tax_code_id` (`sales_tax_code_id`);

--
-- Indexes for table `ospos_customers_packages`
--
ALTER TABLE `ospos_customers_packages`
  ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `ospos_customers_points`
--
ALTER TABLE `ospos_customers_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `sale_id` (`sale_id`);

--
-- Indexes for table `ospos_dinner_tables`
--
ALTER TABLE `ospos_dinner_tables`
  ADD PRIMARY KEY (`dinner_table_id`);

--
-- Indexes for table `ospos_employees`
--
ALTER TABLE `ospos_employees`
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `ospos_expenses`
--
ALTER TABLE `ospos_expenses`
  ADD PRIMARY KEY (`expense_id`),
  ADD KEY `expense_category_id` (`expense_category_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `ospos_expenses_ibfk_3` (`consignmenter_id`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `ospos_expense_categories`
--
ALTER TABLE `ospos_expense_categories`
  ADD PRIMARY KEY (`expense_category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `ospos_giftcards`
--
ALTER TABLE `ospos_giftcards`
  ADD PRIMARY KEY (`giftcard_id`),
  ADD UNIQUE KEY `giftcard_number` (`giftcard_number`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `ospos_grants`
--
ALTER TABLE `ospos_grants`
  ADD PRIMARY KEY (`permission_id`,`person_id`),
  ADD KEY `ospos_grants_ibfk_2` (`person_id`);

--
-- Indexes for table `ospos_inventory`
--
ALTER TABLE `ospos_inventory`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `trans_items` (`trans_items`),
  ADD KEY `trans_user` (`trans_user`),
  ADD KEY `trans_location` (`trans_location`),
  ADD KEY `trans_date` (`trans_date`);

--
-- Indexes for table `ospos_items`
--
ALTER TABLE `ospos_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_number` (`item_number`),
  ADD KEY `consignmenter_id` (`consignmenter_id`),
  ADD KEY `ospos_items_ibfk_2` (`receiving_id`);

--
-- Indexes for table `ospos_items_taxes`
--
ALTER TABLE `ospos_items_taxes`
  ADD PRIMARY KEY (`item_id`,`name`,`percent`);

--
-- Indexes for table `ospos_item_kits`
--
ALTER TABLE `ospos_item_kits`
  ADD PRIMARY KEY (`item_kit_id`);

--
-- Indexes for table `ospos_item_kit_items`
--
ALTER TABLE `ospos_item_kit_items`
  ADD PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`),
  ADD KEY `ospos_item_kit_items_ibfk_2` (`item_id`);

--
-- Indexes for table `ospos_item_quantities`
--
ALTER TABLE `ospos_item_quantities`
  ADD PRIMARY KEY (`item_id`,`location_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `ospos_modules`
--
ALTER TABLE `ospos_modules`
  ADD PRIMARY KEY (`module_id`),
  ADD UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  ADD UNIQUE KEY `name_lang_key` (`name_lang_key`);

--
-- Indexes for table `ospos_people`
--
ALTER TABLE `ospos_people`
  ADD PRIMARY KEY (`person_id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `ospos_permissions`
--
ALTER TABLE `ospos_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `ospos_permissions_ibfk_2` (`location_id`);

--
-- Indexes for table `ospos_receivings`
--
ALTER TABLE `ospos_receivings`
  ADD PRIMARY KEY (`receiving_id`),
  ADD KEY `consignmenter_id` (`consignmenter_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `reference` (`reference`),
  ADD KEY `receiving_time` (`receiving_time`);

--
-- Indexes for table `ospos_receivings_items`
--
ALTER TABLE `ospos_receivings_items`
  ADD PRIMARY KEY (`receiving_id`,`item_id`,`line`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `ospos_sales`
--
ALTER TABLE `ospos_sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `sale_time` (`sale_time`),
  ADD KEY `dinner_table_id` (`dinner_table_id`);

--
-- Indexes for table `ospos_sales_items`
--
ALTER TABLE `ospos_sales_items`
  ADD PRIMARY KEY (`sale_id`,`item_id`,`line`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_location` (`item_location`);

--
-- Indexes for table `ospos_sales_items_taxes`
--
ALTER TABLE `ospos_sales_items_taxes`
  ADD PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `ospos_sales_payments`
--
ALTER TABLE `ospos_sales_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payment_sale` (`sale_id`,`payment_type`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `payment_time` (`payment_time`);

--
-- Indexes for table `ospos_sales_reward_points`
--
ALTER TABLE `ospos_sales_reward_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`);

--
-- Indexes for table `ospos_sales_taxes`
--
ALTER TABLE `ospos_sales_taxes`
  ADD PRIMARY KEY (`sales_taxes_id`),
  ADD KEY `print_sequence` (`sale_id`,`print_sequence`,`tax_group`);

--
-- Indexes for table `ospos_sessions`
--
ALTER TABLE `ospos_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `ospos_stock_locations`
--
ALTER TABLE `ospos_stock_locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `ospos_tax_categories`
--
ALTER TABLE `ospos_tax_categories`
  ADD PRIMARY KEY (`tax_category_id`);

--
-- Indexes for table `ospos_tax_codes`
--
ALTER TABLE `ospos_tax_codes`
  ADD PRIMARY KEY (`tax_code_id`);

--
-- Indexes for table `ospos_tax_jurisdictions`
--
ALTER TABLE `ospos_tax_jurisdictions`
  ADD PRIMARY KEY (`jurisdiction_id`);

--
-- Indexes for table `ospos_tax_rates`
--
ALTER TABLE `ospos_tax_rates`
  ADD PRIMARY KEY (`tax_rate_id`),
  ADD KEY `rate_tax_category_id` (`rate_tax_category_id`),
  ADD KEY `rate_tax_code_id` (`rate_tax_code_id`),
  ADD KEY `rate_jurisdiction_id` (`rate_jurisdiction_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ospos_attribute_definitions`
--
ALTER TABLE `ospos_attribute_definitions`
  MODIFY `definition_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ospos_attribute_values`
--
ALTER TABLE `ospos_attribute_values`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ospos_cash_up`
--
ALTER TABLE `ospos_cash_up`
  MODIFY `cashup_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ospos_customers_packages`
--
ALTER TABLE `ospos_customers_packages`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ospos_customers_points`
--
ALTER TABLE `ospos_customers_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ospos_dinner_tables`
--
ALTER TABLE `ospos_dinner_tables`
  MODIFY `dinner_table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ospos_expenses`
--
ALTER TABLE `ospos_expenses`
  MODIFY `expense_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ospos_expense_categories`
--
ALTER TABLE `ospos_expense_categories`
  MODIFY `expense_category_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ospos_giftcards`
--
ALTER TABLE `ospos_giftcards`
  MODIFY `giftcard_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ospos_inventory`
--
ALTER TABLE `ospos_inventory`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- AUTO_INCREMENT for table `ospos_items`
--
ALTER TABLE `ospos_items`
  MODIFY `item_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT for table `ospos_item_kits`
--
ALTER TABLE `ospos_item_kits`
  MODIFY `item_kit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ospos_people`
--
ALTER TABLE `ospos_people`
  MODIFY `person_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `ospos_receivings`
--
ALTER TABLE `ospos_receivings`
  MODIFY `receiving_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `ospos_sales`
--
ALTER TABLE `ospos_sales`
  MODIFY `sale_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ospos_sales_payments`
--
ALTER TABLE `ospos_sales_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ospos_sales_reward_points`
--
ALTER TABLE `ospos_sales_reward_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ospos_sales_taxes`
--
ALTER TABLE `ospos_sales_taxes`
  MODIFY `sales_taxes_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ospos_stock_locations`
--
ALTER TABLE `ospos_stock_locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ospos_tax_categories`
--
ALTER TABLE `ospos_tax_categories`
  MODIFY `tax_category_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ospos_tax_codes`
--
ALTER TABLE `ospos_tax_codes`
  MODIFY `tax_code_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ospos_tax_jurisdictions`
--
ALTER TABLE `ospos_tax_jurisdictions`
  MODIFY `jurisdiction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ospos_tax_rates`
--
ALTER TABLE `ospos_tax_rates`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ospos_attribute_definitions`
--
ALTER TABLE `ospos_attribute_definitions`
  ADD CONSTRAINT `fk_ospos_attribute_definitions_ibfk_1` FOREIGN KEY (`definition_fk`) REFERENCES `ospos_attribute_definitions` (`definition_id`);

--
-- Constraints for table `ospos_attribute_links`
--
ALTER TABLE `ospos_attribute_links`
  ADD CONSTRAINT `ospos_attribute_links_ibfk_1` FOREIGN KEY (`definition_id`) REFERENCES `ospos_attribute_definitions` (`definition_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ospos_attribute_links_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `ospos_attribute_values` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ospos_attribute_links_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_attribute_links_ibfk_4` FOREIGN KEY (`receiving_id`) REFERENCES `ospos_receivings` (`receiving_id`),
  ADD CONSTRAINT `ospos_attribute_links_ibfk_5` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`);

--
-- Constraints for table `ospos_cash_up`
--
ALTER TABLE `ospos_cash_up`
  ADD CONSTRAINT `ospos_cash_up_ibfk_1` FOREIGN KEY (`open_employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_cash_up_ibfk_2` FOREIGN KEY (`close_employee_id`) REFERENCES `ospos_employees` (`person_id`);

--
-- Constraints for table `ospos_consignmenters`
--
ALTER TABLE `ospos_consignmenters`
  ADD CONSTRAINT `ospos_consignmenters_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

--
-- Constraints for table `ospos_customers`
--
ALTER TABLE `ospos_customers`
  ADD CONSTRAINT `ospos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`),
  ADD CONSTRAINT `ospos_customers_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `ospos_customers_packages` (`package_id`),
  ADD CONSTRAINT `ospos_customers_ibfk_3` FOREIGN KEY (`sales_tax_code_id`) REFERENCES `ospos_tax_codes` (`tax_code_id`);

--
-- Constraints for table `ospos_customers_points`
--
ALTER TABLE `ospos_customers_points`
  ADD CONSTRAINT `ospos_customers_points_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_customers` (`person_id`),
  ADD CONSTRAINT `ospos_customers_points_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `ospos_customers_packages` (`package_id`),
  ADD CONSTRAINT `ospos_customers_points_ibfk_3` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`);

--
-- Constraints for table `ospos_employees`
--
ALTER TABLE `ospos_employees`
  ADD CONSTRAINT `ospos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

--
-- Constraints for table `ospos_expenses`
--
ALTER TABLE `ospos_expenses`
  ADD CONSTRAINT `ospos_expenses_ibfk_1` FOREIGN KEY (`expense_category_id`) REFERENCES `ospos_expense_categories` (`expense_category_id`),
  ADD CONSTRAINT `ospos_expenses_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_expenses_ibfk_3` FOREIGN KEY (`consignmenter_id`) REFERENCES `ospos_consignmenters` (`person_id`);

--
-- Constraints for table `ospos_giftcards`
--
ALTER TABLE `ospos_giftcards`
  ADD CONSTRAINT `ospos_giftcards_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

--
-- Constraints for table `ospos_grants`
--
ALTER TABLE `ospos_grants`
  ADD CONSTRAINT `ospos_grants_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `ospos_permissions` (`permission_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ospos_grants_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `ospos_employees` (`person_id`) ON DELETE CASCADE;

--
-- Constraints for table `ospos_inventory`
--
ALTER TABLE `ospos_inventory`
  ADD CONSTRAINT `ospos_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_inventory_ibfk_3` FOREIGN KEY (`trans_location`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Constraints for table `ospos_items`
--
ALTER TABLE `ospos_items`
  ADD CONSTRAINT `ospos_items_ibfk_1` FOREIGN KEY (`consignmenter_id`) REFERENCES `ospos_consignmenters` (`person_id`),
  ADD CONSTRAINT `ospos_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `ospos_receivings` (`receiving_id`);

--
-- Constraints for table `ospos_items_taxes`
--
ALTER TABLE `ospos_items_taxes`
  ADD CONSTRAINT `ospos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `ospos_item_kit_items`
--
ALTER TABLE `ospos_item_kit_items`
  ADD CONSTRAINT `ospos_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `ospos_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ospos_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `ospos_item_quantities`
--
ALTER TABLE `ospos_item_quantities`
  ADD CONSTRAINT `ospos_item_quantities_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_item_quantities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Constraints for table `ospos_permissions`
--
ALTER TABLE `ospos_permissions`
  ADD CONSTRAINT `ospos_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `ospos_modules` (`module_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ospos_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`) ON DELETE CASCADE;

--
-- Constraints for table `ospos_receivings`
--
ALTER TABLE `ospos_receivings`
  ADD CONSTRAINT `ospos_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_receivings_ibfk_2` FOREIGN KEY (`consignmenter_id`) REFERENCES `ospos_consignmenters` (`person_id`);

--
-- Constraints for table `ospos_receivings_items`
--
ALTER TABLE `ospos_receivings_items`
  ADD CONSTRAINT `ospos_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `ospos_receivings` (`receiving_id`);

--
-- Constraints for table `ospos_sales`
--
ALTER TABLE `ospos_sales`
  ADD CONSTRAINT `ospos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`),
  ADD CONSTRAINT `ospos_sales_ibfk_3` FOREIGN KEY (`dinner_table_id`) REFERENCES `ospos_dinner_tables` (`dinner_table_id`);

--
-- Constraints for table `ospos_sales_items`
--
ALTER TABLE `ospos_sales_items`
  ADD CONSTRAINT `ospos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`),
  ADD CONSTRAINT `ospos_sales_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Constraints for table `ospos_sales_items_taxes`
--
ALTER TABLE `ospos_sales_items_taxes`
  ADD CONSTRAINT `ospos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_items` (`sale_id`),
  ADD CONSTRAINT `ospos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`);

--
-- Constraints for table `ospos_sales_payments`
--
ALTER TABLE `ospos_sales_payments`
  ADD CONSTRAINT `ospos_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`),
  ADD CONSTRAINT `ospos_sales_payments_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`);

--
-- Constraints for table `ospos_sales_reward_points`
--
ALTER TABLE `ospos_sales_reward_points`
  ADD CONSTRAINT `ospos_sales_reward_points_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`);

--
-- Constraints for table `ospos_tax_rates`
--
ALTER TABLE `ospos_tax_rates`
  ADD CONSTRAINT `ospos_tax_rates_ibfk_1` FOREIGN KEY (`rate_tax_category_id`) REFERENCES `ospos_tax_categories` (`tax_category_id`),
  ADD CONSTRAINT `ospos_tax_rates_ibfk_2` FOREIGN KEY (`rate_tax_code_id`) REFERENCES `ospos_tax_codes` (`tax_code_id`),
  ADD CONSTRAINT `ospos_tax_rates_ibfk_3` FOREIGN KEY (`rate_jurisdiction_id`) REFERENCES `ospos_tax_jurisdictions` (`jurisdiction_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

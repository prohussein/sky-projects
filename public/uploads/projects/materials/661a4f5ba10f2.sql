-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 06, 2024 at 12:51 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `erp_spa`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_infos`
--

CREATE TABLE `bank_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `beneficiary_name` varchar(191) NOT NULL,
  `beneficiary_address` varchar(191) NOT NULL,
  `beneficiary_street` varchar(191) NOT NULL,
  `beneficiary_account_no` varchar(191) NOT NULL,
  `beneficiary_city` varchar(191) NOT NULL,
  `beneficiary_bank_name` varchar(191) NOT NULL,
  `beneficiary_bank_swift_code` varchar(191) NOT NULL,
  `beneficiary_bank_branch` varchar(191) NOT NULL,
  `beneficiary_bank_city` varchar(191) NOT NULL,
  `intermediary_bank_name` varchar(191) DEFAULT NULL,
  `beneficiary_bank_code` varchar(191) NOT NULL,
  `iban_code` varchar(191) NOT NULL,
  `beneficiary_bank_address` varchar(191) NOT NULL,
  `beneficiary_bank_street` varchar(191) NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(100) DEFAULT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `branch_manager` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `title_ar`, `title_en`, `phone`, `email`, `location`, `branch_manager`, `created_at`, `updated_at`) VALUES
(1, 'الفرع الرئيسي', 'Main Branch', '01157809060', NULL, NULL, 0, NULL, NULL),
(2, 'الفرع الرئيسي', 'main branch', '01157809060', 'mohamedahussien7@gmail.com', 'test loc', 1, '2022-07-19 05:11:52', '2022-07-19 05:12:31');

-- --------------------------------------------------------

--
-- Table structure for table `buy_operations`
--

CREATE TABLE `buy_operations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `start_at` date NOT NULL,
  `end_at` date DEFAULT NULL,
  `is_created_pr` tinyint(4) NOT NULL DEFAULT 0,
  `is_created_po` tinyint(4) NOT NULL DEFAULT 0,
  `is_created_inv` tinyint(4) NOT NULL DEFAULT 0,
  `is_created_receive` tinyint(4) NOT NULL DEFAULT 0,
  `is_created_cust_po` tinyint(4) NOT NULL DEFAULT 0,
  `is_created_return` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy_ordered_supplies`
--

CREATE TABLE `buy_ordered_supplies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opration_id` bigint(20) DEFAULT NULL,
  `reference_no` varchar(100) NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `added_by` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `start_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `total_qty` double(15,3) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy_ordered_supply_details`
--

CREATE TABLE `buy_ordered_supply_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ordered_supply_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `purchase_unit_id` bigint(20) DEFAULT NULL,
  `net_unit_cost` double(15,3) DEFAULT NULL,
  `qunatity` int(11) NOT NULL,
  `unit_price` double(15,3) NOT NULL,
  `tax_rate` double(15,3) NOT NULL,
  `tax` double(15,3) NOT NULL,
  `discount` double(15,3) NOT NULL,
  `total` double(15,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy_purchase_invoices`
--

CREATE TABLE `buy_purchase_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opration_id` bigint(20) DEFAULT NULL,
  `reference_no` varchar(100) NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `money_id` bigint(20) UNSIGNED NOT NULL,
  `added_by` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `total_qty` double(15,3) DEFAULT NULL,
  `items_count` int(11) DEFAULT NULL,
  `order_tax_rate` double(15,3) DEFAULT NULL,
  `order_tax` double(15,3) DEFAULT NULL,
  `tax_type` tinyint(4) NOT NULL COMMENT '1 = for_both ; 2 = for_invoice ; 3 = for_items',
  `invoice_payment_type` tinyint(4) NOT NULL COMMENT '1 = cash_payment ; 2 = fees_payment ; 3 = deferred_payment',
  `shipping_cost` double(15,3) DEFAULT NULL,
  `total_cost` double(15,3) DEFAULT NULL,
  `total_discount` double(15,3) NOT NULL DEFAULT 0.000,
  `discount_type` double DEFAULT NULL COMMENT '1 => percentage , 2 => number',
  `discount_value` double(8,2) DEFAULT 0.00,
  `deduction_tax_type` double DEFAULT NULL,
  `deduction_tax` double(8,2) NOT NULL DEFAULT 0.00,
  `deduction_tax_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax` double(15,3) NOT NULL DEFAULT 0.000,
  `paid_amount` double(15,3) NOT NULL DEFAULT 0.000,
  `grand_total` double(15,3) NOT NULL DEFAULT 0.000,
  `remaining_amount` double(15,3) DEFAULT 0.000,
  `status` tinyint(4) DEFAULT NULL COMMENT '1 = cash_payment , 2 = fees_payment , 3 = deferred_payment',
  `invoice_type` enum('draft','approved') NOT NULL DEFAULT 'draft',
  `is_paid` tinyint(4) NOT NULL,
  `is_received` tinyint(4) NOT NULL,
  `create_items_from` enum('receive','invoice') DEFAULT 'invoice',
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy_purchase_invoice_details`
--

CREATE TABLE `buy_purchase_invoice_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `buy_invoice_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `purchase_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `net_unit_cost` double(15,3) DEFAULT NULL,
  `qunatity` int(11) NOT NULL,
  `unit_price` double(15,3) NOT NULL,
  `tax_rate` double(15,3) DEFAULT NULL,
  `tax` double(15,3) DEFAULT NULL,
  `discount` double(15,3) DEFAULT NULL,
  `discount_type` tinyint(4) DEFAULT NULL,
  `total` double(15,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy_purchase_orders`
--

CREATE TABLE `buy_purchase_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opration_id` bigint(20) DEFAULT NULL,
  `reference_no` varchar(100) NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `added_by` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `total_qty` double(15,3) NOT NULL,
  `items_count` int(11) DEFAULT NULL,
  `total_cost` double(15,3) DEFAULT NULL,
  `shipping_cost` double(15,3) DEFAULT NULL,
  `tax_rate` int(11) DEFAULT NULL,
  `tax_amount` double(15,3) DEFAULT NULL,
  `total_discount` double(15,3) DEFAULT NULL,
  `grand_total` double(15,3) NOT NULL,
  `status` tinyint(4) DEFAULT 0,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy_purchase_order_details`
--

CREATE TABLE `buy_purchase_order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `purchase_unit_id` bigint(20) DEFAULT NULL,
  `net_unit_cost` double(15,3) DEFAULT NULL,
  `qunatity` int(11) NOT NULL,
  `unit_price` double(15,3) NOT NULL,
  `total` double(15,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy_purchase_requisitions`
--

CREATE TABLE `buy_purchase_requisitions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opration_id` bigint(20) DEFAULT NULL,
  `reference_no` varchar(100) NOT NULL,
  `added_by` bigint(20) NOT NULL,
  `requested_by` varchar(191) DEFAULT NULL,
  `date` date NOT NULL,
  `total_qty` int(11) NOT NULL,
  `item_counts` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy_purchase_requisition_items`
--

CREATE TABLE `buy_purchase_requisition_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `purchase_unit_id` bigint(20) DEFAULT NULL,
  `qunatity` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy_purchase_returns`
--

CREATE TABLE `buy_purchase_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opration_id` bigint(20) DEFAULT NULL,
  `reference_no` varchar(100) NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `money_id` bigint(20) NOT NULL,
  `added_by` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `id_p_invoice` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `total_qty` double(15,3) NOT NULL,
  `items_count` bigint(20) NOT NULL,
  `order_tax_rate` double(15,3) NOT NULL,
  `order_tax` double(15,3) NOT NULL,
  `tax_type` double(15,3) NOT NULL,
  `remaining_amount` double(15,3) NOT NULL,
  `invoice_payment_type` double(15,3) NOT NULL,
  `shipping_cost` double(15,3) NOT NULL,
  `total_cost` double(15,3) NOT NULL,
  `total_discount` double(15,3) NOT NULL DEFAULT 0.000,
  `total_tax` double(15,3) NOT NULL DEFAULT 0.000,
  `paid_amount` double(15,3) NOT NULL DEFAULT 0.000,
  `grand_total` double(15,3) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `is_paid` tinyint(4) NOT NULL,
  `is_received` tinyint(4) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy_purchase_return_details`
--

CREATE TABLE `buy_purchase_return_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `buy_return_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `purchase_unit_id` bigint(20) DEFAULT NULL,
  `net_unit_cost` double(15,3) DEFAULT NULL,
  `qunatity` int(11) NOT NULL,
  `unit_price` double(15,3) NOT NULL,
  `tax_rate` double(15,3) NOT NULL,
  `tax` double(15,3) NOT NULL,
  `discount` double(15,3) DEFAULT NULL,
  `discount_type` double(15,3) DEFAULT NULL,
  `total` double(15,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy_receives`
--

CREATE TABLE `buy_receives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opration_id` bigint(20) DEFAULT NULL,
  `purchase_invoice_id` bigint(20) DEFAULT NULL,
  `reference_no` varchar(100) NOT NULL,
  `added_by` bigint(20) NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `items_count` int(10) UNSIGNED DEFAULT NULL,
  `total_qty` double(15,3) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy_receive_details`
--

CREATE TABLE `buy_receive_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `receive_id` bigint(20) NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_unit_id` bigint(20) DEFAULT NULL,
  `qunatity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy_supplier_quotations`
--

CREATE TABLE `buy_supplier_quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opration_id` bigint(20) DEFAULT NULL,
  `purchase_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `added_by` bigint(20) NOT NULL,
  `total_qty` int(10) NOT NULL,
  `item_counts` int(10) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy_supplier_quotation_details`
--

CREATE TABLE `buy_supplier_quotation_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `buy_quotation_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `purchase_unit_id` bigint(20) DEFAULT NULL,
  `qunatity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `whatsapp` varchar(191) DEFAULT NULL,
  `department` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `linkedin` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `is_our_company` enum('0','1') NOT NULL DEFAULT '0',
  `customer_id` bigint(20) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_enName` varchar(100) NOT NULL DEFAULT '',
  `country_arName` varchar(100) NOT NULL DEFAULT '',
  `country_enNationality` varchar(100) NOT NULL DEFAULT '',
  `country_arNationality` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_code`, `country_enName`, `country_arName`, `country_enNationality`, `country_arNationality`) VALUES
('AF', 'Afghanistan', 'أفغانستان', 'Afghan', 'أفغانستاني'),
('AL', 'Albania', 'ألبانيا', 'Albanian', 'ألباني'),
('AX', 'Aland Islands', 'جزر آلاند', 'Aland Islander', 'آلاندي'),
('DZ', 'Algeria', 'الجزائر', 'Algerian', 'جزائري'),
('AS', 'American Samoa', 'ساموا-الأمريكي', 'American Samoan', 'أمريكي سامواني'),
('AD', 'Andorra', 'أندورا', 'Andorran', 'أندوري'),
('AO', 'Angola', 'أنغولا', 'Angolan', 'أنقولي'),
('AI', 'Anguilla', 'أنغويلا', 'Anguillan', 'أنغويلي'),
('AQ', 'Antarctica', 'أنتاركتيكا', 'Antarctican', 'أنتاركتيكي'),
('AG', 'Antigua and Barbuda', 'أنتيغوا وبربودا', 'Antiguan', 'بربودي'),
('AR', 'Argentina', 'الأرجنتين', 'Argentinian', 'أرجنتيني'),
('AM', 'Armenia', 'أرمينيا', 'Armenian', 'أرميني'),
('AW', 'Aruba', 'أروبه', 'Aruban', 'أوروبهيني'),
('AU', 'Australia', 'أستراليا', 'Australian', 'أسترالي'),
('AT', 'Austria', 'النمسا', 'Austrian', 'نمساوي'),
('AZ', 'Azerbaijan', 'أذربيجان', 'Azerbaijani', 'أذربيجاني'),
('BS', 'Bahamas', 'الباهاماس', 'Bahamian', 'باهاميسي'),
('BH', 'Bahrain', 'البحرين', 'Bahraini', 'بحريني'),
('BD', 'Bangladesh', 'بنغلاديش', 'Bangladeshi', 'بنغلاديشي'),
('BB', 'Barbados', 'بربادوس', 'Barbadian', 'بربادوسي'),
('BY', 'Belarus', 'روسيا البيضاء', 'Belarusian', 'روسي'),
('BE', 'Belgium', 'بلجيكا', 'Belgian', 'بلجيكي'),
('BZ', 'Belize', 'بيليز', 'Belizean', 'بيليزي'),
('BJ', 'Benin', 'بنين', 'Beninese', 'بنيني'),
('BL', 'Saint Barthelemy', 'سان بارتيلمي', 'Saint Barthelmian', 'سان بارتيلمي'),
('BM', 'Bermuda', 'جزر برمودا', 'Bermudan', 'برمودي'),
('BT', 'Bhutan', 'بوتان', 'Bhutanese', 'بوتاني'),
('BO', 'Bolivia', 'بوليفيا', 'Bolivian', 'بوليفي'),
('BA', 'Bosnia and Herzegovina', 'البوسنة و الهرسك', 'Bosnian / Herzegovinian', 'بوسني/هرسكي'),
('BW', 'Botswana', 'بوتسوانا', 'Botswanan', 'بوتسواني'),
('BV', 'Bouvet Island', 'جزيرة بوفيه', 'Bouvetian', 'بوفيهي'),
('BR', 'Brazil', 'البرازيل', 'Brazilian', 'برازيلي'),
('IO', 'British Indian Ocean Territory', 'إقليم المحيط الهندي البريطاني', 'British Indian Ocean Territory', 'إقليم المحيط الهندي البريطاني'),
('BN', 'Brunei Darussalam', 'بروني', 'Bruneian', 'بروني'),
('BG', 'Bulgaria', 'بلغاريا', 'Bulgarian', 'بلغاري'),
('BF', 'Burkina Faso', 'بوركينا فاسو', 'Burkinabe', 'بوركيني'),
('BI', 'Burundi', 'بوروندي', 'Burundian', 'بورونيدي'),
('KH', 'Cambodia', 'كمبوديا', 'Cambodian', 'كمبودي'),
('CM', 'Cameroon', 'كاميرون', 'Cameroonian', 'كاميروني'),
('CA', 'Canada', 'كندا', 'Canadian', 'كندي'),
('CV', 'Cape Verde', 'الرأس الأخضر', 'Cape Verdean', 'الرأس الأخضر'),
('KY', 'Cayman Islands', 'جزر كايمان', 'Caymanian', 'كايماني'),
('CF', 'Central African Republic', 'جمهورية أفريقيا الوسطى', 'Central African', 'أفريقي'),
('TD', 'Chad', 'تشاد', 'Chadian', 'تشادي'),
('CL', 'Chile', 'شيلي', 'Chilean', 'شيلي'),
('CN', 'China', 'الصين', 'Chinese', 'صيني'),
('CX', 'Christmas Island', 'جزيرة عيد الميلاد', 'Christmas Islander', 'جزيرة عيد الميلاد'),
('CC', 'Cocos (Keeling) Islands', 'جزر كوكوس', 'Cocos Islander', 'جزر كوكوس'),
('CO', 'Colombia', 'كولومبيا', 'Colombian', 'كولومبي'),
('KM', 'Comoros', 'جزر القمر', 'Comorian', 'جزر القمر'),
('CG', 'Congo', 'الكونغو', 'Congolese', 'كونغي'),
('CK', 'Cook Islands', 'جزر كوك', 'Cook Islander', 'جزر كوك'),
('CR', 'Costa Rica', 'كوستاريكا', 'Costa Rican', 'كوستاريكي'),
('HR', 'Croatia', 'كرواتيا', 'Croatian', 'كوراتي'),
('CU', 'Cuba', 'كوبا', 'Cuban', 'كوبي'),
('CY', 'Cyprus', 'قبرص', 'Cypriot', 'قبرصي'),
('CW', 'Curaçao', 'كوراساو', 'Curacian', 'كوراساوي'),
('CZ', 'Czech Republic', 'الجمهورية التشيكية', 'Czech', 'تشيكي'),
('DK', 'Denmark', 'الدانمارك', 'Danish', 'دنماركي'),
('DJ', 'Djibouti', 'جيبوتي', 'Djiboutian', 'جيبوتي'),
('DM', 'Dominica', 'دومينيكا', 'Dominican', 'دومينيكي'),
('DO', 'Dominican Republic', 'الجمهورية الدومينيكية', 'Dominican', 'دومينيكي'),
('EC', 'Ecuador', 'إكوادور', 'Ecuadorian', 'إكوادوري'),
('EG', 'Egypt', 'مصر', 'Egyptian', 'مصري'),
('SV', 'El Salvador', 'إلسلفادور', 'Salvadoran', 'سلفادوري'),
('GQ', 'Equatorial Guinea', 'غينيا الاستوائي', 'Equatorial Guinean', 'غيني'),
('ER', 'Eritrea', 'إريتريا', 'Eritrean', 'إريتيري'),
('EE', 'Estonia', 'استونيا', 'Estonian', 'استوني'),
('ET', 'Ethiopia', 'أثيوبيا', 'Ethiopian', 'أثيوبي'),
('FK', 'Falkland Islands (Malvinas)', 'جزر فوكلاند', 'Falkland Islander', 'فوكلاندي'),
('FO', 'Faroe Islands', 'جزر فارو', 'Faroese', 'جزر فارو'),
('FJ', 'Fiji', 'فيجي', 'Fijian', 'فيجي'),
('FI', 'Finland', 'فنلندا', 'Finnish', 'فنلندي'),
('FR', 'France', 'فرنسا', 'French', 'فرنسي'),
('GF', 'French Guiana', 'غويانا الفرنسية', 'French Guianese', 'غويانا الفرنسية'),
('PF', 'French Polynesia', 'بولينيزيا الفرنسية', 'French Polynesian', 'بولينيزيي'),
('TF', 'French Southern and Antarctic Lands', 'أراض فرنسية جنوبية وأنتارتيكية', 'French', 'أراض فرنسية جنوبية وأنتارتيكية'),
('GA', 'Gabon', 'الغابون', 'Gabonese', 'غابوني'),
('GM', 'Gambia', 'غامبيا', 'Gambian', 'غامبي'),
('GE', 'Georgia', 'جيورجيا', 'Georgian', 'جيورجي'),
('DE', 'Germany', 'ألمانيا', 'German', 'ألماني'),
('GH', 'Ghana', 'غانا', 'Ghanaian', 'غاني'),
('GI', 'Gibraltar', 'جبل طارق', 'Gibraltar', 'جبل طارق'),
('GG', 'Guernsey', 'غيرنزي', 'Guernsian', 'غيرنزي'),
('GR', 'Greece', 'اليونان', 'Greek', 'يوناني'),
('GL', 'Greenland', 'جرينلاند', 'Greenlandic', 'جرينلاندي'),
('GD', 'Grenada', 'غرينادا', 'Grenadian', 'غرينادي'),
('GP', 'Guadeloupe', 'جزر جوادلوب', 'Guadeloupe', 'جزر جوادلوب'),
('GU', 'Guam', 'جوام', 'Guamanian', 'جوامي'),
('GT', 'Guatemala', 'غواتيمال', 'Guatemalan', 'غواتيمالي'),
('GN', 'Guinea', 'غينيا', 'Guinean', 'غيني'),
('GW', 'Guinea-Bissau', 'غينيا-بيساو', 'Guinea-Bissauan', 'غيني'),
('GY', 'Guyana', 'غيانا', 'Guyanese', 'غياني'),
('HT', 'Haiti', 'هايتي', 'Haitian', 'هايتي'),
('HM', 'Heard and Mc Donald Islands', 'جزيرة هيرد وجزر ماكدونالد', 'Heard and Mc Donald Islanders', 'جزيرة هيرد وجزر ماكدونالد'),
('HN', 'Honduras', 'هندوراس', 'Honduran', 'هندوراسي'),
('HK', 'Hong Kong', 'هونغ كونغ', 'Hongkongese', 'هونغ كونغي'),
('HU', 'Hungary', 'المجر', 'Hungarian', 'مجري'),
('IS', 'Iceland', 'آيسلندا', 'Icelandic', 'آيسلندي'),
('IN', 'India', 'الهند', 'Indian', 'هندي'),
('IM', 'Isle of Man', 'جزيرة مان', 'Manx', 'ماني'),
('ID', 'Indonesia', 'أندونيسيا', 'Indonesian', 'أندونيسيي'),
('IR', 'Iran', 'إيران', 'Iranian', 'إيراني'),
('IQ', 'Iraq', 'العراق', 'Iraqi', 'عراقي'),
('IE', 'Ireland', 'إيرلندا', 'Irish', 'إيرلندي'),
('IL', 'Israel', 'إسرائيل', 'Israeli', 'إسرائيلي'),
('IT', 'Italy', 'إيطاليا', 'Italian', 'إيطالي'),
('CI', 'Ivory Coast', 'ساحل العاج', 'Ivory Coastian', 'ساحل العاج'),
('JE', 'Jersey', 'جيرزي', 'Jersian', 'جيرزي'),
('JM', 'Jamaica', 'جمايكا', 'Jamaican', 'جمايكي'),
('JP', 'Japan', 'اليابان', 'Japanese', 'ياباني'),
('JO', 'Jordan', 'الأردن', 'Jordanian', 'أردني'),
('KZ', 'Kazakhstan', 'كازاخستان', 'Kazakh', 'كازاخستاني'),
('KE', 'Kenya', 'كينيا', 'Kenyan', 'كيني'),
('KI', 'Kiribati', 'كيريباتي', 'I-Kiribati', 'كيريباتي'),
('KP', 'Korea(North Korea)', 'كوريا الشمالية', 'North Korean', 'كوري'),
('KR', 'Korea(South Korea)', 'كوريا الجنوبية', 'South Korean', 'كوري'),
('XK', 'Kosovo', 'كوسوفو', 'Kosovar', 'كوسيفي'),
('KW', 'Kuwait', 'الكويت', 'Kuwaiti', 'كويتي'),
('KG', 'Kyrgyzstan', 'قيرغيزستان', 'Kyrgyzstani', 'قيرغيزستاني'),
('LA', 'Lao PDR', 'لاوس', 'Laotian', 'لاوسي'),
('LV', 'Latvia', 'لاتفيا', 'Latvian', 'لاتيفي'),
('LB', 'Lebanon', 'لبنان', 'Lebanese', 'لبناني'),
('LS', 'Lesotho', 'ليسوتو', 'Basotho', 'ليوسيتي'),
('LR', 'Liberia', 'ليبيريا', 'Liberian', 'ليبيري'),
('LY', 'Libya', 'ليبيا', 'Libyan', 'ليبي'),
('LI', 'Liechtenstein', 'ليختنشتين', 'Liechtenstein', 'ليختنشتيني'),
('LT', 'Lithuania', 'لتوانيا', 'Lithuanian', 'لتوانيي'),
('LU', 'Luxembourg', 'لوكسمبورغ', 'Luxembourger', 'لوكسمبورغي'),
('LK', 'Sri Lanka', 'سريلانكا', 'Sri Lankian', 'سريلانكي'),
('MO', 'Macau', 'ماكاو', 'Macanese', 'ماكاوي'),
('MK', 'Macedonia', 'مقدونيا', 'Macedonian', 'مقدوني'),
('MG', 'Madagascar', 'مدغشقر', 'Malagasy', 'مدغشقري'),
('MW', 'Malawi', 'مالاوي', 'Malawian', 'مالاوي'),
('MY', 'Malaysia', 'ماليزيا', 'Malaysian', 'ماليزي'),
('MV', 'Maldives', 'المالديف', 'Maldivian', 'مالديفي'),
('ML', 'Mali', 'مالي', 'Malian', 'مالي'),
('MT', 'Malta', 'مالطا', 'Maltese', 'مالطي'),
('MH', 'Marshall Islands', 'جزر مارشال', 'Marshallese', 'مارشالي'),
('MQ', 'Martinique', 'مارتينيك', 'Martiniquais', 'مارتينيكي'),
('MR', 'Mauritania', 'موريتانيا', 'Mauritanian', 'موريتانيي'),
('MU', 'Mauritius', 'موريشيوس', 'Mauritian', 'موريشيوسي'),
('YT', 'Mayotte', 'مايوت', 'Mahoran', 'مايوتي'),
('MX', 'Mexico', 'المكسيك', 'Mexican', 'مكسيكي'),
('FM', 'Micronesia', 'مايكرونيزيا', 'Micronesian', 'مايكرونيزيي'),
('MD', 'Moldova', 'مولدافيا', 'Moldovan', 'مولديفي'),
('MC', 'Monaco', 'موناكو', 'Monacan', 'مونيكي'),
('MN', 'Mongolia', 'منغوليا', 'Mongolian', 'منغولي'),
('ME', 'Montenegro', 'الجبل الأسود', 'Montenegrin', 'الجبل الأسود'),
('MS', 'Montserrat', 'مونتسيرات', 'Montserratian', 'مونتسيراتي'),
('MA', 'Morocco', 'المغرب', 'Moroccan', 'مغربي'),
('MZ', 'Mozambique', 'موزمبيق', 'Mozambican', 'موزمبيقي'),
('MM', 'Myanmar', 'ميانمار', 'Myanmarian', 'ميانماري'),
('NA', 'Namibia', 'ناميبيا', 'Namibian', 'ناميبي'),
('NR', 'Nauru', 'نورو', 'Nauruan', 'نوري'),
('NP', 'Nepal', 'نيبال', 'Nepalese', 'نيبالي'),
('NL', 'Netherlands', 'هولندا', 'Dutch', 'هولندي'),
('AN', 'Netherlands Antilles', 'جزر الأنتيل الهولندي', 'Dutch Antilier', 'هولندي'),
('NC', 'New Caledonia', 'كاليدونيا الجديدة', 'New Caledonian', 'كاليدوني'),
('NZ', 'New Zealand', 'نيوزيلندا', 'New Zealander', 'نيوزيلندي'),
('NI', 'Nicaragua', 'نيكاراجوا', 'Nicaraguan', 'نيكاراجوي'),
('NE', 'Niger', 'النيجر', 'Nigerien', 'نيجيري'),
('NG', 'Nigeria', 'نيجيريا', 'Nigerian', 'نيجيري'),
('NU', 'Niue', 'ني', 'Niuean', 'ني'),
('NF', 'Norfolk Island', 'جزيرة نورفولك', 'Norfolk Islander', 'نورفوليكي'),
('MP', 'Northern Mariana Islands', 'جزر ماريانا الشمالية', 'Northern Marianan', 'ماريني'),
('NO', 'Norway', 'النرويج', 'Norwegian', 'نرويجي'),
('OM', 'Oman', 'عمان', 'Omani', 'عماني'),
('PK', 'Pakistan', 'باكستان', 'Pakistani', 'باكستاني'),
('PW', 'Palau', 'بالاو', 'Palauan', 'بالاوي'),
('PS', 'Palestine', 'فلسطين', 'Palestinian', 'فلسطيني'),
('PA', 'Panama', 'بنما', 'Panamanian', 'بنمي'),
('PG', 'Papua New Guinea', 'بابوا غينيا الجديدة', 'Papua New Guinean', 'بابوي'),
('PY', 'Paraguay', 'باراغواي', 'Paraguayan', 'بارغاوي'),
('PE', 'Peru', 'بيرو', 'Peruvian', 'بيري'),
('PH', 'Philippines', 'الفليبين', 'Filipino', 'فلبيني'),
('PN', 'Pitcairn', 'بيتكيرن', 'Pitcairn Islander', 'بيتكيرني'),
('PL', 'Poland', 'بولندا', 'Polish', 'بولندي'),
('PT', 'Portugal', 'البرتغال', 'Portuguese', 'برتغالي'),
('PR', 'Puerto Rico', 'بورتو ريكو', 'Puerto Rican', 'بورتي'),
('QA', 'Qatar', 'قطر', 'Qatari', 'قطري'),
('RE', 'Reunion Island', 'ريونيون', 'Reunionese', 'ريونيوني'),
('RO', 'Romania', 'رومانيا', 'Romanian', 'روماني'),
('RU', 'Russian', 'روسيا', 'Russian', 'روسي'),
('RW', 'Rwanda', 'رواندا', 'Rwandan', 'رواندا'),
('KN', 'Saint Kitts and Nevis', 'سانت كيتس ونيفس,', 'Kittitian/Nevisian', 'سانت كيتس ونيفس'),
('MF', 'Saint Martin (French part)', 'ساينت مارتن فرنسي', 'St. Martian(French)', 'ساينت مارتني فرنسي'),
('SX', 'Sint Maarten (Dutch part)', 'ساينت مارتن هولندي', 'St. Martian(Dutch)', 'ساينت مارتني هولندي'),
('LC', 'Saint Pierre and Miquelon', 'سان بيير وميكلون', 'St. Pierre and Miquelon', 'سان بيير وميكلوني'),
('VC', 'Saint Vincent and the Grenadines', 'سانت فنسنت وجزر غرينادين', 'Saint Vincent and the Grenadines', 'سانت فنسنت وجزر غرينادين'),
('WS', 'Samoa', 'ساموا', 'Samoan', 'ساموي'),
('SM', 'San Marino', 'سان مارينو', 'Sammarinese', 'ماريني'),
('ST', 'Sao Tome and Principe', 'ساو تومي وبرينسيبي', 'Sao Tomean', 'ساو تومي وبرينسيبي'),
('SA', 'Saudi Arabia', 'المملكة العربية السعودية', 'Saudi Arabian', 'سعودي'),
('SN', 'Senegal', 'السنغال', 'Senegalese', 'سنغالي'),
('RS', 'Serbia', 'صربيا', 'Serbian', 'صربي'),
('SC', 'Seychelles', 'سيشيل', 'Seychellois', 'سيشيلي'),
('SL', 'Sierra Leone', 'سيراليون', 'Sierra Leonean', 'سيراليوني'),
('SG', 'Singapore', 'سنغافورة', 'Singaporean', 'سنغافوري'),
('SK', 'Slovakia', 'سلوفاكيا', 'Slovak', 'سولفاكي'),
('SI', 'Slovenia', 'سلوفينيا', 'Slovenian', 'سولفيني'),
('SB', 'Solomon Islands', 'جزر سليمان', 'Solomon Island', 'جزر سليمان'),
('SO', 'Somalia', 'الصومال', 'Somali', 'صومالي'),
('ZA', 'South Africa', 'جنوب أفريقيا', 'South African', 'أفريقي'),
('GS', 'South Georgia and the South Sandwich', 'المنطقة القطبية الجنوبية', 'South Georgia and the South Sandwich', 'لمنطقة القطبية الجنوبية'),
('SS', 'South Sudan', 'السودان الجنوبي', 'South Sudanese', 'سوادني جنوبي'),
('ES', 'Spain', 'إسبانيا', 'Spanish', 'إسباني'),
('SH', 'Saint Helena', 'سانت هيلانة', 'St. Helenian', 'هيلاني'),
('SD', 'Sudan', 'السودان', 'Sudanese', 'سوداني'),
('SR', 'Suriname', 'سورينام', 'Surinamese', 'سورينامي'),
('SJ', 'Svalbard and Jan Mayen', 'سفالبارد ويان ماين', 'Svalbardian/Jan Mayenian', 'سفالبارد ويان ماين'),
('SZ', 'Swaziland', 'سوازيلند', 'Swazi', 'سوازيلندي'),
('SE', 'Sweden', 'السويد', 'Swedish', 'سويدي'),
('CH', 'Switzerland', 'سويسرا', 'Swiss', 'سويسري'),
('SY', 'Syria', 'سوريا', 'Syrian', 'سوري'),
('TW', 'Taiwan', 'تايوان', 'Taiwanese', 'تايواني'),
('TJ', 'Tajikistan', 'طاجيكستان', 'Tajikistani', 'طاجيكستاني'),
('TZ', 'Tanzania', 'تنزانيا', 'Tanzanian', 'تنزانيي'),
('TH', 'Thailand', 'تايلندا', 'Thai', 'تايلندي'),
('TL', 'Timor-Leste', 'تيمور الشرقية', 'Timor-Lestian', 'تيموري'),
('TG', 'Togo', 'توغو', 'Togolese', 'توغي'),
('TK', 'Tokelau', 'توكيلاو', 'Tokelaian', 'توكيلاوي'),
('TO', 'Tonga', 'تونغا', 'Tongan', 'تونغي'),
('TT', 'Trinidad and Tobago', 'ترينيداد وتوباغو', 'Trinidadian/Tobagonian', 'ترينيداد وتوباغو'),
('TN', 'Tunisia', 'تونس', 'Tunisian', 'تونسي'),
('TR', 'Turkey', 'تركيا', 'Turkish', 'تركي'),
('TM', 'Turkmenistan', 'تركمانستان', 'Turkmen', 'تركمانستاني'),
('TC', 'Turks and Caicos Islands', 'جزر توركس وكايكوس', 'Turks and Caicos Islands', 'جزر توركس وكايكوس'),
('TV', 'Tuvalu', 'توفالو', 'Tuvaluan', 'توفالي'),
('UG', 'Uganda', 'أوغندا', 'Ugandan', 'أوغندي'),
('UA', 'Ukraine', 'أوكرانيا', 'Ukrainian', 'أوكراني'),
('AE', 'United Arab Emirates', 'الإمارات العربية المتحدة', 'Emirati', 'إماراتي'),
('GB', 'United Kingdom', 'المملكة المتحدة', 'British', 'بريطاني'),
('US', 'United States', 'الولايات المتحدة', 'American', 'أمريكي'),
('UM', 'US Minor Outlying Islands', 'قائمة الولايات والمناطق الأمريكية', 'US Minor Outlying Islander', 'أمريكي'),
('UY', 'Uruguay', 'أورغواي', 'Uruguayan', 'أورغواي'),
('UZ', 'Uzbekistan', 'أوزباكستان', 'Uzbek', 'أوزباكستاني'),
('VU', 'Vanuatu', 'فانواتو', 'Vanuatuan', 'فانواتي'),
('VE', 'Venezuela', 'فنزويلا', 'Venezuelan', 'فنزويلي'),
('VN', 'Vietnam', 'فيتنام', 'Vietnamese', 'فيتنامي'),
('VI', 'Virgin Islands (U.S.)', 'الجزر العذراء الأمريكي', 'American Virgin Islander', 'أمريكي'),
('VA', 'Vatican City', 'فنزويلا', 'Vatican', 'فاتيكاني'),
('WF', 'Wallis and Futuna Islands', 'والس وفوتونا', 'Wallisian/Futunan', 'فوتوني'),
('EH', 'Western Sahara', 'الصحراء الغربية', 'Sahrawian', 'صحراوي'),
('YE', 'Yemen', 'اليمن', 'Yemeni', 'يمني'),
('ZM', 'Zambia', 'زامبيا', 'Zambian', 'زامبياني'),
('ZW', 'Zimbabwe', 'زمبابوي', 'Zimbabwean', 'زمبابوي');

-- --------------------------------------------------------

--
-- Table structure for table `crm_leads`
--

CREATE TABLE `crm_leads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `company_name` varchar(191) NOT NULL,
  `company_activity` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `fax` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `facbook` varchar(191) DEFAULT NULL,
  `linkedin` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `location_on_map` varchar(191) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `comment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_type` varchar(191) DEFAULT NULL,
  `target_qty` varchar(191) DEFAULT NULL,
  `status` enum('new','send_proposal','waiting','black_list','followup','customer') NOT NULL DEFAULT 'new',
  `is_customer` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 =>''lead'' , 1=>''customer''',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_leads_feedback`
--

CREATE TABLE `crm_leads_feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `file` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_leads_users`
--

CREATE TABLE `crm_leads_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_leads_visits`
--

CREATE TABLE `crm_leads_visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `salesman_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `company_name` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `fax` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `opening_balance` double(15,3) DEFAULT 0.000,
  `website` varchar(191) DEFAULT NULL,
  `facbook` varchar(191) DEFAULT NULL,
  `linkedin` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `location_on_map` text DEFAULT NULL,
  `is_active` varchar(191) NOT NULL DEFAULT '''1''',
  `tax_id` varchar(191) DEFAULT NULL,
  `tax_office` varchar(191) DEFAULT NULL,
  `is_tax_customer` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=> tax customer , 2 => none tax customer',
  `tax_exempt` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>  exempt , 2 => none  exempt',
  `tax_file_number` varchar(191) DEFAULT NULL,
  `cr_id` varchar(191) DEFAULT NULL,
  `id_for_orginaztion` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `percent` double(8,2) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `name`, `percent`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'كبار العملاء', 5.00, 1, '2024-02-04 03:06:22', '2024-02-04 03:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `ref` varchar(191) DEFAULT NULL,
  `date` date NOT NULL,
  `amount` double(10,3) NOT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  `document_code` varchar(191) DEFAULT NULL,
  `transfare_date` varchar(191) DEFAULT NULL,
  `transfare_code` varchar(191) DEFAULT NULL,
  `bank_transfare_fees` double(8,2) DEFAULT 0.00,
  `check_due_date` date DEFAULT NULL,
  `cat_id` bigint(20) NOT NULL,
  `com_tax_rate` int(11) DEFAULT NULL,
  `added_tax_rate` int(11) DEFAULT NULL,
  `paying_method` enum('check','cash','transfare') NOT NULL,
  `spent_to` varchar(191) DEFAULT NULL,
  `desc` varchar(191) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `desc` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `account_id`, `created_by`, `desc`, `created_at`, `updated_at`) VALUES
(4, 'ايجار', 80, 1, 'قسم الايجار', '2022-04-06 20:23:39', '2022-04-06 20:34:37'),
(5, 'مياه', 85, 1, 'مياه', '2022-04-28 15:49:30', '2022-04-28 15:49:30'),
(6, 'كهرباء', 81, 1, 'كهرباء', '2022-04-28 15:50:05', '2022-04-28 15:50:05'),
(7, 'هاتف وانترنت', 82, 1, 'هاتف وانترنت', '2022-04-28 15:50:43', '2022-04-28 15:50:43'),
(8, 'صيانة', 83, 1, 'صيانة', '2022-04-28 15:51:05', '2022-04-28 15:51:05'),
(9, 'مصاريف حكومية', 84, 1, 'مصاريف حكومية', '2022-04-28 15:51:32', '2022-04-28 15:51:32'),
(10, 'رواتب واجور', 79, 1, 'رواتب واجور', '2022-04-28 15:52:04', '2022-04-28 15:52:04'),
(11, 'دعاية واعلان', 77, 1, 'دعاية واعلان', '2022-04-28 15:52:39', '2022-04-28 15:52:39'),
(12, 'مصاريف بنكية', 137, 1, 'مصاريف بنكية', '2022-04-28 15:53:14', '2022-04-28 15:53:14'),
(13, 'بنزين', 185, 1, 'محروقات', '2022-04-28 15:57:41', '2022-04-28 16:00:53'),
(14, 'مسحوبات شخصية (owner )', 59, 1, 'مسحوبات شخصية (owner )', '2022-04-28 16:56:17', '2022-04-28 16:56:17'),
(15, 'انتقلات', 78, 1, 'انتقلات', '2022-04-28 16:59:04', '2022-04-28 16:59:04'),
(16, 'ادوات للمكتب', 78, 1, 'ادوات للمكتب', '2022-04-28 17:01:56', '2022-04-28 17:01:56'),
(17, 'مصروفات سياراه', 78, 1, 'مصروفات سياراه', '2022-04-28 17:08:41', '2022-04-28 17:08:41'),
(18, 'اكراميات', 78, 1, 'اكراميات', '2022-04-28 17:11:03', '2022-04-28 17:11:03'),
(19, 'مصروفات مكتب', 78, 1, 'مصاريف مكتب', '2022-04-28 17:12:26', '2022-04-28 17:12:26'),
(20, 'كارته', 186, 1, 'كارته', '2022-04-28 17:44:29', '2022-04-28 17:44:29'),
(22, 'اختبار', 192, 1, 'ابنبنبن', '2022-06-25 08:12:14', '2022-06-25 08:12:14');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fin_accounts`
--

CREATE TABLE `fin_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(100) DEFAULT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `start_amount` double(15,3) NOT NULL DEFAULT 0.000,
  `parent_id` bigint(20) DEFAULT 0,
  `level` tinyint(4) NOT NULL,
  `description` text DEFAULT NULL,
  `order_account` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('cridet','debit') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fin_accounts`
--

INSERT INTO `fin_accounts` (`id`, `cat_id`, `title_ar`, `title_en`, `start_amount`, `parent_id`, `level`, `description`, `order_account`, `created_at`, `updated_at`, `type`) VALUES
(7, 1, 'الاصول', 'Assets', 0.000, 0, 1, 'Assets', 1, '2021-10-23 10:55:00', '2023-08-06 09:16:59', 'debit'),
(8, 2, 'الالتزامات', 'Liabilities', 0.000, 0, 1, 'Liabilities', 2, '2021-10-23 10:55:43', '2021-10-23 10:55:43', 'cridet'),
(9, 3, 'الايرادات', 'Income', 0.000, 0, 1, 'Income', 4, '2021-10-23 10:56:14', '2021-10-23 10:56:14', 'debit'),
(10, 4, 'المصروفات', 'Expenses', 0.000, 0, 1, 'Expenses', 5, '2021-10-23 10:56:43', '2021-10-23 10:56:43', 'cridet'),
(28, 1, 'الاصول الثابته', 'Fixed Assets', 0.000, 7, 2, 'fixed assets', NULL, '2021-11-26 04:36:38', '2021-11-26 04:36:38', 'debit'),
(29, 1, 'الاصول المتداولة', 'Current Assets', 0.000, 7, 2, 'Variable Assets', NULL, '2021-11-26 04:37:47', '2021-11-26 04:37:47', 'debit'),
(30, 1, 'البنك', 'bank', 0.000, 29, 3, 'bank account', NULL, '2021-11-26 04:42:22', '2021-11-26 04:42:22', 'debit'),
(31, 1, 'الصندوق', 'Treasury', 0.000, 29, 3, 'treasury الصندوق', NULL, '2021-11-26 04:44:25', '2021-11-26 04:44:25', 'debit'),
(32, 1, 'العملاء', 'Customers', 0.000, 29, 3, 'العملاء', NULL, '2021-11-26 04:45:19', '2021-11-26 04:45:19', 'debit'),
(33, 1, 'المخزون', 'Inventory', 0.000, 29, 3, 'Inventory', NULL, '2021-11-26 04:47:02', '2021-11-26 04:47:02', 'debit'),
(34, 1, 'العهد والذمم', 'covenant and slander', 0.000, 29, 3, 'covenant and slander  العهد والذمم', NULL, '2021-11-26 04:48:31', '2021-11-26 04:48:31', 'debit'),
(35, 1, 'المصروفات المقدمة', 'Advance expenses', 0.000, 29, 3, 'Advance expenses  المصروفات المقدمة', NULL, '2021-11-26 04:49:59', '2021-11-26 04:49:59', 'debit'),
(36, 1, 'حسابات مدينة اخري', 'Other debit accounts', 0.000, 29, 3, 'حسابات مدينة اخري', NULL, '2021-11-26 04:51:06', '2021-11-26 04:51:06', 'debit'),
(37, 1, 'المباني', 'buildings', 0.000, 28, 3, 'buildings', NULL, '2021-11-26 04:56:12', '2021-11-26 04:56:12', 'debit'),
(38, 1, 'الاراضي', 'lands', 0.000, 28, 3, 'lands', NULL, '2021-11-26 04:56:55', '2021-11-26 04:56:55', 'debit'),
(39, 1, 'الاثاث والتجهيزات', 'Furniture and fixtures', 0.000, 28, 3, 'Furniture and fixtures', NULL, '2021-11-26 04:57:59', '2021-11-26 04:57:59', 'debit'),
(40, 1, 'آلات', 'Machines', 0.000, 28, 3, 'Machines', NULL, '2021-11-26 04:59:21', '2021-11-26 04:59:21', 'debit'),
(41, 1, 'السيارات', 'cars', 0.000, 28, 3, 'cars', NULL, '2021-11-26 04:59:48', '2021-11-26 04:59:48', 'debit'),
(42, 1, 'معدات الحاسوب', 'computer equipment', 0.000, 28, 3, 'computer equipment', NULL, '2021-11-26 05:00:32', '2021-11-26 05:00:32', 'debit'),
(43, 1, 'برامج الكمبيوتر', 'software', 0.000, 28, 3, 'برامج الكمبيوتر', NULL, '2021-11-26 05:01:14', '2021-11-26 05:01:14', 'debit'),
(44, 2, 'خصوم متداولة', 'Current Liabilities', 0.000, 8, 2, 'Current Liabilities Account', NULL, '2021-11-26 05:05:51', '2021-11-26 05:05:51', 'cridet'),
(45, 2, 'خصوم غير متداولة', 'Non-current liabilities', 0.000, 8, 2, 'Long Term Liabilities', NULL, '2021-11-26 05:07:11', '2021-11-26 05:07:11', 'cridet'),
(46, 2, 'الموردين', 'Suppliers', 0.000, 44, 3, 'suppliers', NULL, '2021-11-26 05:09:44', '2021-11-26 05:09:44', 'cridet'),
(47, 1, 'اوراق القبض', 'accounts receivable', 0.000, 29, 3, 'accounts receivable', NULL, '2021-11-26 13:41:07', '2021-11-26 13:41:07', 'debit'),
(48, 1, 'ايرادات مستحقة', 'accrued revenue account', 0.000, 29, 3, 'accrued revenue account', NULL, '2021-11-26 13:42:31', '2021-11-26 13:42:31', 'debit'),
(49, 1, 'الاصول غير الملموسة', 'intangible assets', 0.000, 7, 2, 'intangible assets', NULL, '2021-11-26 13:44:13', '2021-11-26 13:44:13', 'debit'),
(50, 1, 'العلامة التجارية', 'Trade Mark', 0.000, 49, 3, 'trade mark', NULL, '2021-11-26 13:45:04', '2021-11-26 13:45:04', 'debit'),
(51, 2, 'اوراق الدفع', 'account payable', 0.000, 44, 3, 'account payable', NULL, '2021-11-26 13:47:36', '2021-11-26 13:47:36', 'cridet'),
(52, 2, 'قروض قصيرة الاجل', 'short term loans', 0.000, 44, 3, 'short term loans', NULL, '2021-11-26 13:53:35', '2021-11-26 13:53:35', 'cridet'),
(53, 2, 'ايرادات مقبوضة مقدما', 'Revenue received in advance', 0.000, 44, 3, 'Revenue received in advance', NULL, '2021-11-26 13:54:36', '2021-11-26 13:54:36', 'cridet'),
(54, 2, 'مصروفات مستحقة', 'accrued expenses', 0.000, 44, 3, 'accrued expenses', NULL, '2021-11-26 13:55:39', '2021-11-26 13:55:39', 'cridet'),
(55, 2, 'قروض طويلة الاجل', 'long term loans', 0.000, 45, 3, 'long term loans', NULL, '2021-11-26 13:57:51', '2021-11-26 13:57:51', 'cridet'),
(56, 2, 'حقوق الملكية', 'Property rights', 0.000, 0, 1, 'Property rights ', 3, '2021-10-23 10:55:43', '2021-10-23 10:55:43', 'cridet'),
(57, 2, 'راس المال', 'capital', 0.000, 56, 2, 'capital  / راس المال', NULL, '2021-11-26 14:09:01', '2021-11-26 14:09:01', 'cridet'),
(58, 2, 'الارباح', 'profits', 0.000, 56, 2, 'personal withdrawals  / المسحوبات الشخصية', NULL, '2021-11-26 14:09:48', '2021-11-26 14:09:48', 'cridet'),
(59, 2, 'جاري صاحب الشركة', 'Company owner', 0.000, 56, 2, 'Company owner', NULL, '2021-11-26 14:10:35', '2021-11-26 14:10:35', 'cridet'),
(61, 2, 'الارباح المحتجزة', 'retained earnings', 0.000, 56, 2, 'retained earnings', NULL, '2021-11-26 14:11:48', '2021-11-26 14:11:48', 'cridet'),
(62, 3, 'ايرادات المبيعات', 'Sales revenue', 0.000, 9, 2, 'Sales revenue', NULL, '2021-11-26 14:12:39', '2021-11-26 14:12:39', 'debit'),
(63, 3, 'المبيعات', 'Sales', 0.000, 62, 3, 'المبيعات', NULL, '2021-11-26 14:13:08', '2021-11-26 14:13:08', 'debit'),
(64, 3, 'مردودات المشتريات', 'purchases returns', 0.000, 62, 3, 'Sales returns', NULL, '2021-11-26 14:13:39', '2021-11-26 14:13:39', 'debit'),
(65, 3, 'الخصم المكتسب ', 'earned discount', 0.000, 62, 3, 'Sales discount', NULL, '2021-11-26 14:15:19', '2021-11-26 14:15:19', 'debit'),
(66, 3, 'الايرادات الاخرى', 'Other income', 0.000, 9, 2, 'Other income', NULL, '2021-11-26 14:17:12', '2021-11-26 14:17:12', 'debit'),
(67, 3, 'ايرادات الاستثمار', 'investment income', 0.000, 66, 3, 'investment income', NULL, '2021-11-26 14:18:10', '2021-11-26 14:18:10', 'debit'),
(68, 3, 'ايرادات الايجار', 'rental income', 0.000, 66, 3, 'rental income', NULL, '2021-11-26 14:18:56', '2021-11-26 14:18:56', 'debit'),
(69, 4, 'تكلفة المبيعات', 'sales cost', 0.000, 10, 2, 'تكلفة المبيعات', NULL, '2021-11-26 14:20:57', '2021-11-26 14:20:57', 'cridet'),
(70, 4, 'المشتريات', 'purchases', 0.000, 69, 3, 'المشتريات', NULL, '2021-11-26 14:22:14', '2021-11-26 14:22:14', 'cridet'),
(71, 4, 'مصاريف المشتريات', 'Purchasing expenses', 0.000, 69, 3, 'مصارف مشتريات', NULL, '2021-11-26 14:23:01', '2021-11-26 14:23:01', 'cridet'),
(72, 4, 'مردودات المبيعات', 'Returns sales', 0.000, 69, 3, 'مردودات المشتريات', NULL, '2021-11-26 14:23:39', '2021-11-26 14:23:39', 'cridet'),
(73, 4, 'الخصم المسموح به', 'allowed discount', 0.000, 69, 3, 'Discount on purchases', NULL, '2021-11-26 14:24:06', '2021-11-26 14:24:06', 'cridet'),
(74, 4, 'مصاريف البيع والتسويق', 'Selling and marketing expenses', 0.000, 10, 2, 'Selling and marketing expenses', NULL, '2021-11-26 14:24:44', '2021-11-26 14:24:44', 'cridet'),
(75, 4, 'مصاريف نقل مبيعات', 'Sales transportation expenses', 0.000, 74, 3, 'sales expenses', NULL, '2021-11-26 14:25:45', '2022-04-06 20:48:34', 'cridet'),
(76, 4, 'عمولات بيع', 'sale commissions', 0.000, 74, 3, 'عمولات بيع', NULL, '2021-11-26 14:26:15', '2021-11-26 14:26:15', 'cridet'),
(77, 4, 'دعاية واعلان', 'Advertising', 0.000, 74, 3, 'دعاية واعلان', NULL, '2021-11-26 14:26:40', '2021-11-26 14:26:40', 'cridet'),
(78, 4, 'مصاريف ادارية وعمومية', 'General and administrative expenses', 0.000, 10, 2, 'General and administrative expenses', NULL, '2021-11-26 14:27:08', '2021-11-26 14:27:08', 'cridet'),
(79, 4, 'رواتب واجور', 'Salaries and wages', 0.000, 78, 3, 'Salaries and wages', NULL, '2021-11-26 14:27:40', '2021-11-26 14:27:40', 'cridet'),
(80, 4, 'ايجار', 'rent', 0.000, 78, 3, 'ايجار', NULL, '2021-11-26 14:28:01', '2021-11-26 14:28:01', 'cridet'),
(81, 4, 'كهرباء', 'electricity', 0.000, 78, 3, 'electricity', NULL, '2021-11-26 14:28:30', '2021-11-26 14:28:30', 'cridet'),
(82, 4, 'هاتف وانترنت', 'phone and internet', 0.000, 78, 3, 'phone and internet', NULL, '2021-11-26 14:29:03', '2021-11-26 14:29:03', 'cridet'),
(83, 4, 'صيانة', 'maintenance', 0.000, 78, 3, 'صيانة', NULL, '2021-11-26 14:29:29', '2021-11-26 14:29:29', 'cridet'),
(84, 4, 'مصاريف حكومية', 'Governmental expenses', 0.000, 78, 3, 'مصاريف حكومية', NULL, '2021-11-26 14:29:54', '2021-11-26 14:29:54', 'cridet'),
(85, 4, 'مياه', 'waters', 0.000, 78, 3, 'مياه', NULL, '2021-11-26 14:30:22', '2021-11-26 14:30:22', 'cridet'),
(87, 2, 'ضريبة القيمة المضافة  ', 'value added tax', 0.000, 44, 3, 'value added tax on output  / ضريبة القيمة المضافة علي المخرجات', NULL, '2021-11-26 16:30:35', '2021-11-26 16:30:35', 'cridet'),
(94, 1, 'ارباح تجارية وصناعية', 'commercial and industrial profits', 0.000, 36, 4, 'commercial and industrial profits \r\nارباح تجارية وصناعية', NULL, '2021-12-08 14:31:16', '2021-12-08 14:31:16', 'debit'),
(95, 2, 'دائنون وحسابات دائنة اخري', 'Creditors and other accounts payable', 0.000, 44, 3, 'Creditors and other accounts payable \r\nدائنون وحسابات دائنة اخري', NULL, '2021-12-08 14:35:04', '2021-12-08 14:35:04', 'cridet'),
(97, 2, 'ضريبة الخصم والتحصيل', 'Tax deduction and collection', 0.000, 95, 4, 'Tax deduction and collection', NULL, '2021-12-08 14:38:15', '2021-12-08 14:38:15', 'cridet'),
(98, 2, 'هيئة التأمينات الاجتماعية', 'هيئة التأمينات الاجتماعية', 0.000, 95, 4, 'هيئة التأمينات الاجتماعية', NULL, '2021-12-08 14:40:18', '2021-12-08 14:40:18', 'cridet'),
(99, 4, 'مصاريف تشغيل', 'operating expenses', 0.000, 69, 3, 'operating expenses', NULL, '2021-12-08 15:11:35', '2021-12-08 15:11:35', 'cridet'),
(131, 2, 'مصاريف شحن', 'shipping cost', 0.000, 71, 4, 'مصاريف شحن', NULL, '2022-01-11 09:05:10', '2022-01-11 09:05:10', 'cridet'),
(135, 1, 'bank misr', 'bank misr', 0.000, 30, 4, 'create Bank Account', NULL, '2022-02-07 10:15:45', '2022-02-07 10:15:45', 'debit'),
(136, 3, 'نقل مبيعات', 'sales shipment', 0.000, 66, 3, 'sales shipment', NULL, '2022-02-14 17:34:13', '2022-02-14 17:34:13', 'debit'),
(137, 4, 'مصاريف بنكية', 'Bank Expenses', 0.000, 78, 3, 'Bank Expenses', NULL, '2022-02-15 05:32:56', '2022-02-15 05:32:56', 'cridet'),
(139, 1, 'QNB', 'QNB', 0.000, 30, 4, 'create Bank Account', NULL, '2022-02-24 13:54:52', '2022-02-24 13:54:52', 'debit'),
(154, 1, 'CIB', 'CIB', 0.000, 30, 4, 'create Bank Account', NULL, '2022-04-17 19:13:48', '2022-04-17 19:13:48', 'debit'),
(155, 1, 'ALEX', 'ALEX', 0.000, 30, 4, 'create Bank Account', NULL, '2022-04-17 19:21:08', '2022-04-17 19:21:08', 'debit'),
(156, 1, 'MISR', 'MISR', 0.000, 30, 4, 'create Bank Account', NULL, '2022-04-17 19:21:36', '2022-04-17 19:21:36', 'debit'),
(157, 1, 'AL-AHLY', 'AL-AHLY', 0.000, 30, 4, 'create Bank Account', NULL, '2022-04-17 19:21:58', '2022-04-17 19:21:58', 'debit'),
(184, 1, 'مصرف ابوظبي الاسلامي', 'مصرف ابوظبي الاسلامي', 0.000, 30, 4, 'create Bank Account', NULL, '2022-04-21 13:45:09', '2022-04-21 13:45:09', 'debit'),
(185, 4, 'محروقات', 'محروقات', 0.000, 78, 3, 'محروقات', NULL, '2022-04-28 15:57:16', '2022-04-28 15:57:16', 'cridet'),
(186, 4, 'كارته', 'كارته', 0.000, 78, 3, 'كارته', NULL, '2022-04-28 17:44:09', '2022-04-28 17:44:09', 'cridet'),
(187, 1, 'العلاقات في قواعد البيانات', 'العلاقات في قواعد البيانات', 0.000, 184, 5, 'العلاقات في قواعد البيانات', NULL, '2022-05-06 21:36:01', '2022-05-06 21:36:01', 'debit'),
(188, 1, 'كيفية إنشاء قاعدة بيانات', 'كيفية إنشاء قاعدة بيانات', 0.000, 187, 6, 'كيفية إنشاء قاعدة بيانات', NULL, '2022-05-06 21:50:18', '2022-05-06 21:50:18', 'debit'),
(189, 1, 'تعريف قواعد البيانات', 'تعريف قواعد البيانات', 0.000, 188, 7, 'تعريف قواعد البيانات', NULL, '2022-05-06 21:53:49', '2022-05-06 21:53:49', 'debit'),
(190, 1, 'الاخير', 'الاخير', 0.000, 189, 8, 'ببببب', NULL, '2022-05-06 21:58:02', '2022-05-06 21:58:02', 'debit'),
(197, 1, 'yyyyyyy', 'yyyyyyy', 0.000, 159, 5, 'انشاء حساب جديد للمشروع ', NULL, '2023-02-11 20:11:16', '2023-02-11 20:11:16', 'debit'),
(198, 1, 'new project', 'new project', 0.000, 161, 5, 'انشاء حساب جديد للمشروع ', NULL, '2023-02-11 20:13:46', '2023-02-11 20:13:46', 'debit'),
(199, 1, 'new project', 'new project', 0.000, 161, 5, 'انشاء حساب جديد للمشروع ', NULL, '2023-02-11 20:15:03', '2023-02-11 20:15:03', 'debit'),
(203, 1, 'مشروع ادفو', 'مشروع ادفو', 0.000, 161, 5, 'انشاء حساب جديد للمشروع ', NULL, '2023-03-12 04:48:06', '2023-03-12 04:48:06', 'debit'),
(212, 1, 'مشروع بناء مدرسة', 'مشروع بناء مدرسة', 0.000, 210, 5, 'انشاء حساب جديد للمشروع ', NULL, '2023-08-27 16:49:38', '2023-08-27 16:49:38', 'debit'),
(215, 2, 'المدينة للتوريدات العامة', 'المدينة للتوريدات العامة', 0.000, 46, 4, 'create supplier Account', NULL, '2023-12-04 07:49:10', '2023-12-04 07:49:10', 'cridet'),
(216, 1, 'بولي ايجيبت', 'بولي ايجيبت', 0.000, 32, 4, 'create customer Account', NULL, '2023-12-12 08:15:34', '2023-12-12 08:15:34', 'debit'),
(217, 2, 'الشركة الهندسية', 'الشركة الهندسية', 0.000, 46, 4, 'create supplier Account', NULL, '2024-02-04 02:59:22', '2024-02-04 02:59:22', 'cridet');

-- --------------------------------------------------------

--
-- Table structure for table `fin_banks`
--

CREATE TABLE `fin_banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(191) NOT NULL,
  `title_en` varchar(191) NOT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `notes` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fin_banks`
--

INSERT INTO `fin_banks` (`id`, `title_ar`, `title_en`, `account_id`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'QNB', 'QNB', 139, '', '2022-02-24 13:54:52', '2022-02-24 13:54:52'),
(2, 'CIB', 'CIB', 154, '', '2022-04-17 19:13:48', '2022-04-17 19:13:48'),
(3, 'ALEX', 'ALEX', 155, '', '2022-04-17 19:21:08', '2022-04-17 19:21:08'),
(4, 'MISR', 'MISR', 156, '', '2022-04-17 19:21:36', '2022-04-17 19:21:36'),
(5, 'AL-AHLY', 'AL-AHLY', 157, '', '2022-04-17 19:21:58', '2022-04-17 19:21:58'),
(6, 'مصرف ابوظبي الاسلامي', 'مصرف ابوظبي الاسلامي', 184, '', '2022-04-21 13:45:09', '2022-04-21 13:45:09');

-- --------------------------------------------------------

--
-- Table structure for table `fin_categories`
--

CREATE TABLE `fin_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(100) DEFAULT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fin_categories`
--

INSERT INTO `fin_categories` (`id`, `title_ar`, `title_en`, `created_at`, `updated_at`) VALUES
(1, 'الاصول', 'assets', NULL, NULL),
(2, 'الخصوم', 'liabilities', NULL, NULL),
(3, 'الايرادات', 'income', NULL, NULL),
(4, 'المصروفات', 'expenses', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fin_checks`
--

CREATE TABLE `fin_checks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) DEFAULT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  `belong_to` enum('customer','supplier','expense') DEFAULT NULL,
  `beneficiary` bigint(20) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `due_date` date NOT NULL,
  `check_number` varchar(191) DEFAULT NULL,
  `amount` double NOT NULL,
  `type` enum('payable','receivable') DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `notes` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fin_journals`
--

CREATE TABLE `fin_journals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `ref` varchar(191) DEFAULT NULL,
  `details` varchar(250) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `source` varchar(191) DEFAULT NULL,
  `source_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fin_journal_details`
--

CREATE TABLE `fin_journal_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `journal_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `debit` double(15,3) DEFAULT 0.000,
  `credit` double(15,3) DEFAULT 0.000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fin_notes`
--

CREATE TABLE `fin_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('add','discount') DEFAULT NULL,
  `belong` enum('customer','supplier') DEFAULT NULL,
  `invoice_type` enum('sales','purchases') DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `person_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `amount` double NOT NULL,
  `reason` text DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fin_settings`
--

CREATE TABLE `fin_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(100) DEFAULT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `account_key` varchar(30) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fin_settings`
--

INSERT INTO `fin_settings` (`id`, `title_ar`, `title_en`, `account_id`, `account_key`, `user_id`, `created_at`, `updated_at`) VALUES
(29, 'العملاء', 'Customers', 32, 'Cutomer', 1, '2021-11-03 12:42:07', '2021-12-03 17:08:25'),
(30, 'الموردين', 'Suppliers', 46, 'Supplier', 1, '2021-11-03 12:42:07', '2021-11-28 09:54:40'),
(31, 'المبيعات', 'Sales', 63, 'SalesMaster', 1, '2021-11-03 12:42:07', '2022-01-11 09:28:50'),
(32, 'الالتزامات', 'Liabilities', 8, 'Zero', 1, '2021-11-03 12:42:07', '2021-11-28 09:54:40'),
(33, 'المشتريات', 'purchases', 70, 'PurchasesMaster', 1, '2021-11-03 12:42:07', '2022-01-03 15:54:40'),
(34, 'تكلفة المبيعات', 'sales cost', 69, 'SalesCost', 1, '2021-11-03 12:42:07', '2022-01-11 09:28:50'),
(35, 'الايرادات', 'Income', 9, 'services', 1, '2021-11-03 12:42:07', '2021-11-07 15:49:26'),
(36, 'المخزون', 'Inventory', 33, 'Store', 1, '2021-11-03 12:42:08', '2022-01-11 09:28:50'),
(37, 'الصندوق', 'Treasury', 31, 'Cash', 1, '2021-11-03 12:42:08', '2022-01-04 05:58:12'),
(38, 'الاصول', 'Assets', 7, 'Debts', 1, '2021-11-03 12:42:08', '2021-11-28 09:54:40'),
(39, 'الاصول', 'Assets', 7, 'sales', 1, '2021-11-03 12:42:08', '2021-11-28 09:54:40'),
(40, 'الاصول', 'Assets', 7, 'purchases', 1, '2021-11-03 12:42:08', '2021-11-28 09:54:40'),
(41, 'الالتزامات', 'Liabilities', 8, 'Bank', 1, '2021-11-03 12:42:08', '2021-11-28 09:54:40'),
(42, 'ضريبة القيمة المضافة  ', 'value added tax', 87, 'AddedTaxValue', 1, '2021-11-03 12:42:08', '2022-01-11 07:53:42'),
(43, 'مصاريف المشتريات', 'Purchasing expenses', 71, 'PurchaseExpenses', 1, '2021-11-03 12:42:08', '2022-01-11 09:21:32'),
(44, 'الخصم المكتسب ', 'earned discount', 65, 'DiscountEarned', 1, '2021-11-03 12:42:08', '2022-01-11 09:34:23'),
(45, 'ضريبة الخصم والتحصيل', 'Tax deduction and collection', 97, 'TaxDeductCollect', 1, '2021-11-03 12:42:08', '2022-01-11 09:49:50'),
(46, 'ارباح تجارية وصناعية', 'commercial and industrial profits', 94, 'TaxCommercialIndustrial', 1, '2021-11-03 12:42:08', '2022-02-06 01:27:29'),
(47, 'نقل مبيعات', 'sales shipment', 136, 'ShipmentCost', 1, '2021-11-03 12:42:08', '2022-02-15 12:43:18'),
(48, 'البنك', 'bank', 30, 'Banks', 1, '2021-11-03 12:42:08', '2022-02-07 09:48:42'),
(49, 'اوراق الدفع', 'account payable', 51, 'PayPaper', 1, '2021-11-03 12:42:08', '2022-02-15 12:27:47'),
(50, 'مصاريف بنكية', 'Bank Expenses', 137, 'BankExpenses', 1, '2021-11-03 12:42:08', '2022-02-15 12:27:47'),
(51, 'اوراق القبض', 'accounts receivable', 47, 'NotesReceivables', 1, '2021-11-03 12:42:08', '2022-02-18 15:37:06'),
(53, 'مردودات المشتريات', 'purchases returns', 64, 'PurchaseReturns', 1, '2022-03-29 14:59:45', '2022-06-17 07:33:18'),
(54, 'مردودات المبيعات', 'Returns sales', 72, 'SalesReturns', 1, '2022-03-30 14:59:45', '2022-06-17 07:33:18'),
(56, 'الاصول المتداولة', 'Current Assets', 29, 'CurrentAssets', 1, '2022-03-30 14:59:45', '2022-06-17 07:33:18'),
(57, 'خصوم متداولة', 'Current Liabilities', 44, 'CurrentLiabilities', 1, '2022-03-30 14:59:45', '2022-06-17 07:33:18'),
(58, 'الاصول الثابته', 'Fixed Assets', 28, 'FixedAssets', 1, '2022-03-30 14:59:45', '2022-03-30 14:59:45'),
(59, 'الاصول غير الملموسة', 'intangible assets', 49, 'IntangibleAssets', 1, '2022-03-30 14:59:45', '2022-03-30 14:59:45'),
(60, 'خصوم غير متداولة', 'Non-current liabilities', 45, 'NonCurrentLiabilities', 1, '2022-03-29 14:59:45', '2022-06-17 07:33:18'),
(61, 'حقوق الملكية', 'Property rights', 56, 'Capital', 1, '2022-03-30 14:59:45', '2022-06-21 21:00:11');

-- --------------------------------------------------------

--
-- Table structure for table `fin_transactions`
--

CREATE TABLE `fin_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `belong` enum('supplier','customer','employee') DEFAULT NULL,
  `type` enum('credit','debit') DEFAULT NULL,
  `paying_method` enum('check','cash','transfare') DEFAULT NULL,
  `ref` varchar(191) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  `bank_transfare_fees` double(8,2) DEFAULT 0.00,
  `document_code` varchar(191) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `purch_id` bigint(20) DEFAULT NULL,
  `sale_id` bigint(20) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `check_receive_date` datetime DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fin_years`
--

CREATE TABLE `fin_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `start_at` date NOT NULL,
  `end_at` date NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_attendances`
--

CREATE TABLE `hr_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `shift_id` bigint(20) DEFAULT NULL,
  `date` date NOT NULL,
  `check_in` time NOT NULL,
  `check_out` time DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` enum('late','present') NOT NULL DEFAULT 'late',
  `delay_minutes` int(11) NOT NULL DEFAULT 0,
  `delay_status` varchar(191) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_departments`
--

CREATE TABLE `hr_departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) NOT NULL,
  `name_en` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employees`
--

CREATE TABLE `hr_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `birthday` date NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `is_salesman` tinyint(4) NOT NULL DEFAULT 0,
  `date_of_joining` date NOT NULL,
  `department_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) DEFAULT NULL,
  `shift_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_files`
--

CREATE TABLE `hr_employee_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(191) NOT NULL,
  `title_ar` varchar(191) NOT NULL,
  `file` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee_medicals`
--

CREATE TABLE `hr_employee_medicals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(191) NOT NULL,
  `title_ar` varchar(191) NOT NULL,
  `image` text NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_holidays`
--

CREATE TABLE `hr_holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_paid` tinyint(4) DEFAULT 0,
  `employee_id` bigint(20) DEFAULT NULL,
  `note` text NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_rewards`
--

CREATE TABLE `hr_rewards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(191) NOT NULL,
  `date` date NOT NULL,
  `amount` double NOT NULL,
  `reward_type` enum('reward','sanction') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_salary_employees`
--

CREATE TABLE `hr_salary_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `generate_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `total_salary` double NOT NULL,
  `rewards` double DEFAULT NULL,
  `sanctions` double DEFAULT NULL,
  `dayes_of` double DEFAULT NULL,
  `working_hour` double DEFAULT NULL,
  `working_day` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `pay_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 => Cash Payment , 2 => Bank Payment',
  `paid_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_salary_generates`
--

CREATE TABLE `hr_salary_generates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `salary_name` varchar(191) NOT NULL,
  `date` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_salary_setups`
--

CREATE TABLE `hr_salary_setups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `addition` text NOT NULL,
  `deduction` text NOT NULL,
  `gross_salary` text NOT NULL,
  `is_percentage` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `basic` double(15,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_salary_types`
--

CREATE TABLE `hr_salary_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `benefits` varchar(191) NOT NULL,
  `type` enum('add','deduct') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_workdays`
--

CREATE TABLE `hr_workdays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_day` varchar(191) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_workdays`
--

INSERT INTO `hr_workdays` (`id`, `name`, `is_day`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Saturday', 'isSaturday', '0', '2023-09-24 18:53:04', '2024-02-01 10:10:21'),
(2, 'Sunday', 'isSunday', '1', '2023-09-24 18:53:04', '2023-09-24 18:53:04'),
(3, 'Monday', 'isMonday', '1', '2023-09-24 18:53:04', '2023-09-24 18:53:04'),
(4, 'Tuesday', 'isTuesday', '1', '2023-09-24 18:53:04', '2023-09-24 18:53:04'),
(5, 'Wednesday', 'isWednesday', '1', '2023-09-24 18:53:04', '2023-09-24 18:53:04'),
(6, 'Thursday', 'isThursday', '1', '2023-09-24 18:53:04', '2023-09-24 18:53:04'),
(7, 'Friday', 'isFriday', '0', '2023-09-24 18:53:04', '2023-09-24 18:53:04');

-- --------------------------------------------------------

--
-- Table structure for table `hr_work_shifts`
--

CREATE TABLE `hr_work_shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturing_modles`
--

CREATE TABLE `manufacturing_modles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `damage_store` bigint(20) DEFAULT NULL,
  `matrial_store` bigint(20) DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  `qty` double(8,2) DEFAULT 1.00,
  `total_cost` double(8,2) DEFAULT NULL,
  `item_counts` tinyint(4) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturing_modle_details`
--

CREATE TABLE `manufacturing_modle_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  `qty` double(8,2) DEFAULT 1.00,
  `cost` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturing_orders`
--

CREATE TABLE `manufacturing_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` enum('draft','inprogress','done') NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `damage_store` bigint(20) DEFAULT NULL,
  `matrial_store` bigint(20) DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  `target_qty` double(8,2) DEFAULT 1.00,
  `actual_qty` double(8,2) DEFAULT 1.00,
  `actual_time` varchar(191) DEFAULT NULL,
  `total_cost` double(8,2) DEFAULT NULL,
  `item_counts` tinyint(4) DEFAULT NULL,
  `model_id` bigint(20) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturing_order_details`
--

CREATE TABLE `manufacturing_order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  `qty` double(8,2) DEFAULT 1.00,
  `actual_qty_consumed` double(8,2) DEFAULT 1.00,
  `damage_qty` double(8,2) NOT NULL DEFAULT 0.00,
  `cost` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturing_order_feedback`
--

CREATE TABLE `manufacturing_order_feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `comment` text NOT NULL,
  `added_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_10_115258_laratrust_setup_tables', 1),
(6, '2023_10_10_120521_create_activity_log_table', 2),
(7, '2023_10_10_120522_add_event_column_to_activity_log_table', 2),
(8, '2023_10_10_120523_add_batch_uuid_column_to_activity_log_table', 2),
(9, '2014_10_12_100000_create_password_resets_table', 3),
(10, '2023_10_15_082546_create_manufacturing_modles_table', 3),
(11, '2023_10_15_082557_create_manufacturing_modle_details_table', 3),
(12, '2023_10_21_035630_create_manufacturing_orders_table', 4),
(13, '2023_10_21_035643_create_manufacturing_order_details_table', 4),
(14, '2023_10_21_060141_create_manufacturing_order_feedback_table', 4),
(15, '2023_10_25_151838_add_matrial_store_to_manufacturing_orders_table', 5),
(16, '2023_10_26_054317_add_matrial_store_to_manufacturing_modles_table', 6),
(17, '2023_10_26_083432_add_is_damage_store_store_to_sto_stores_table', 7),
(18, '2023_10_26_124026_add_damage_store_to_manufacturing_modles_table', 8),
(19, '2023_10_26_124106_add_damage_store_to_manufacturing_orders_table', 8),
(20, '2023_10_28_110457_add_unit_id_to_sto_transfare_details_table', 9),
(21, '2023_10_29_050544_add_damage_qty_to_manufacturing_order_details_table', 10),
(22, '2023_10_31_040433_add_invoice_type_to_sal_invoices_table', 11),
(23, '2023_10_31_084827_add_cols_to_sal_invoices_table', 12),
(24, '2023_10_31_092630_add_col_discount_to_sal_invoices_table', 13),
(25, '2024_01_30_064421_create_hr_work_shifts_table', 14),
(26, '2024_01_30_064822_add_delay_to_hr_attendances_table', 14),
(27, '2024_01_30_071242_add_shift_to_hr_attendances_table', 15),
(28, '2024_01_30_071436_add_shift_to_hr_employees_table', 15),
(29, '2024_01_31_110255_add_employee_to_hr_holidays_table', 16);

-- --------------------------------------------------------

--
-- Table structure for table `moved_tickets`
--

CREATE TABLE `moved_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parent_companies`
--

CREATE TABLE `parent_companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'create_BuyOperation', 'Create BuyOperation', 'Create BuyOperation', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(2, 'read_BuyOperation', 'Read BuyOperation', 'Read BuyOperation', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(3, 'update_BuyOperation', 'Update BuyOperation', 'Update BuyOperation', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(4, 'delete_BuyOperation', 'Delete BuyOperation', 'Delete BuyOperation', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(5, 'create_BuyRequest', 'Create BuyRequest', 'Create BuyRequest', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(6, 'read_BuyRequest', 'Read BuyRequest', 'Read BuyRequest', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(7, 'update_BuyRequest', 'Update BuyRequest', 'Update BuyRequest', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(8, 'delete_BuyRequest', 'Delete BuyRequest', 'Delete BuyRequest', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(9, 'create_BuyOrder', 'Create BuyOrder', 'Create BuyOrder', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(10, 'read_BuyOrder', 'Read BuyOrder', 'Read BuyOrder', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(11, 'update_BuyOrder', 'Update BuyOrder', 'Update BuyOrder', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(12, 'delete_BuyOrder', 'Delete BuyOrder', 'Delete BuyOrder', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(13, 'create_BuyRerceives', 'Create BuyRerceives', 'Create BuyRerceives', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(14, 'read_BuyRerceives', 'Read BuyRerceives', 'Read BuyRerceives', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(15, 'update_BuyRerceives', 'Update BuyRerceives', 'Update BuyRerceives', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(16, 'delete_BuyRerceives', 'Delete BuyRerceives', 'Delete BuyRerceives', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(17, 'create_BuyInvoice', 'Create BuyInvoice', 'Create BuyInvoice', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(18, 'read_BuyInvoice', 'Read BuyInvoice', 'Read BuyInvoice', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(19, 'update_BuyInvoice', 'Update BuyInvoice', 'Update BuyInvoice', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(20, 'delete_BuyInvoice', 'Delete BuyInvoice', 'Delete BuyInvoice', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(21, 'create_BuyReturnInvoice', 'Create BuyReturnInvoice', 'Create BuyReturnInvoice', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(22, 'read_BuyReturnInvoice', 'Read BuyReturnInvoice', 'Read BuyReturnInvoice', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(23, 'update_BuyReturnInvoice', 'Update BuyReturnInvoice', 'Update BuyReturnInvoice', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(24, 'delete_BuyReturnInvoice', 'Delete BuyReturnInvoice', 'Delete BuyReturnInvoice', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(25, 'create_Suppliers', 'Create Suppliers', 'Create Suppliers', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(26, 'read_Suppliers', 'Read Suppliers', 'Read Suppliers', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(27, 'update_Suppliers', 'Update Suppliers', 'Update Suppliers', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(28, 'delete_Suppliers', 'Delete Suppliers', 'Delete Suppliers', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(29, 'create_Delivers', 'Create Delivers', 'Create Delivers', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(30, 'read_Delivers', 'Read Delivers', 'Read Delivers', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(31, 'update_Delivers', 'Update Delivers', 'Update Delivers', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(32, 'delete_Delivers', 'Delete Delivers', 'Delete Delivers', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(33, 'create_CustomerOrderSupply', 'Create CustomerOrderSupply', 'Create CustomerOrderSupply', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(34, 'read_CustomerOrderSupply', 'Read CustomerOrderSupply', 'Read CustomerOrderSupply', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(35, 'update_CustomerOrderSupply', 'Update CustomerOrderSupply', 'Update CustomerOrderSupply', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(36, 'delete_CustomerOrderSupply', 'Delete CustomerOrderSupply', 'Delete CustomerOrderSupply', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(37, 'create_Quotaions', 'Create Quotaions', 'Create Quotaions', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(38, 'read_Quotaions', 'Read Quotaions', 'Read Quotaions', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(39, 'update_Quotaions', 'Update Quotaions', 'Update Quotaions', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(40, 'delete_Quotaions', 'Delete Quotaions', 'Delete Quotaions', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(41, 'create_SalInvoices', 'Create SalInvoices', 'Create SalInvoices', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(42, 'read_SalInvoices', 'Read SalInvoices', 'Read SalInvoices', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(43, 'update_SalInvoices', 'Update SalInvoices', 'Update SalInvoices', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(44, 'delete_SalInvoices', 'Delete SalInvoices', 'Delete SalInvoices', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(45, 'create_SalReturnInvoice', 'Create SalReturnInvoice', 'Create SalReturnInvoice', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(46, 'read_SalReturnInvoice', 'Read SalReturnInvoice', 'Read SalReturnInvoice', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(47, 'update_SalReturnInvoice', 'Update SalReturnInvoice', 'Update SalReturnInvoice', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(48, 'delete_SalReturnInvoice', 'Delete SalReturnInvoice', 'Delete SalReturnInvoice', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(49, 'create_Customers', 'Create Customers', 'Create Customers', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(50, 'read_Customers', 'Read Customers', 'Read Customers', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(51, 'update_Customers', 'Update Customers', 'Update Customers', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(52, 'delete_Customers', 'Delete Customers', 'Delete Customers', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(53, 'create_CustomerGroup', 'Create CustomerGroup', 'Create CustomerGroup', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(54, 'read_CustomerGroup', 'Read CustomerGroup', 'Read CustomerGroup', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(55, 'update_CustomerGroup', 'Update CustomerGroup', 'Update CustomerGroup', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(56, 'delete_CustomerGroup', 'Delete CustomerGroup', 'Delete CustomerGroup', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(57, 'create_ParentCompany', 'Create ParentCompany', 'Create ParentCompany', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(58, 'read_ParentCompany', 'Read ParentCompany', 'Read ParentCompany', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(59, 'update_ParentCompany', 'Update ParentCompany', 'Update ParentCompany', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(60, 'delete_ParentCompany', 'Delete ParentCompany', 'Delete ParentCompany', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(61, 'create_Contacts', 'Create Contacts', 'Create Contacts', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(62, 'read_Contacts', 'Read Contacts', 'Read Contacts', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(63, 'update_Contacts', 'Update Contacts', 'Update Contacts', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(64, 'delete_Contacts', 'Delete Contacts', 'Delete Contacts', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(65, 'create_Expenses', 'Create Expenses', 'Create Expenses', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(66, 'read_Expenses', 'Read Expenses', 'Read Expenses', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(67, 'update_Expenses', 'Update Expenses', 'Update Expenses', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(68, 'delete_Expenses', 'Delete Expenses', 'Delete Expenses', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(69, 'create_ExpensesCategory', 'Create ExpensesCategory', 'Create ExpensesCategory', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(70, 'read_ExpensesCategory', 'Read ExpensesCategory', 'Read ExpensesCategory', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(71, 'update_ExpensesCategory', 'Update ExpensesCategory', 'Update ExpensesCategory', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(72, 'delete_ExpensesCategory', 'Delete ExpensesCategory', 'Delete ExpensesCategory', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(73, 'create_Brands', 'Create Brands', 'Create Brands', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(74, 'read_Brands', 'Read Brands', 'Read Brands', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(75, 'update_Brands', 'Update Brands', 'Update Brands', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(76, 'delete_Brands', 'Delete Brands', 'Delete Brands', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(77, 'create_Categories', 'Create Categories', 'Create Categories', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(78, 'read_Categories', 'Read Categories', 'Read Categories', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(79, 'update_Categories', 'Update Categories', 'Update Categories', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(80, 'delete_Categories', 'Delete Categories', 'Delete Categories', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(81, 'create_Units', 'Create Units', 'Create Units', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(82, 'read_Units', 'Read Units', 'Read Units', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(83, 'update_Units', 'Update Units', 'Update Units', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(84, 'delete_Units', 'Delete Units', 'Delete Units', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(85, 'create_Products', 'Create Products', 'Create Products', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(86, 'read_Products', 'Read Products', 'Read Products', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(87, 'update_Products', 'Update Products', 'Update Products', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(88, 'delete_Products', 'Delete Products', 'Delete Products', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(89, 'create_Stores', 'Create Stores', 'Create Stores', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(90, 'read_Stores', 'Read Stores', 'Read Stores', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(91, 'update_Stores', 'Update Stores', 'Update Stores', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(92, 'delete_Stores', 'Delete Stores', 'Delete Stores', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(93, 'create_Tags', 'Create Tags', 'Create Tags', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(94, 'read_Tags', 'Read Tags', 'Read Tags', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(95, 'update_Tags', 'Update Tags', 'Update Tags', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(96, 'delete_Tags', 'Delete Tags', 'Delete Tags', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(97, 'create_PriceList', 'Create PriceList', 'Create PriceList', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(98, 'read_PriceList', 'Read PriceList', 'Read PriceList', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(99, 'update_PriceList', 'Update PriceList', 'Update PriceList', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(100, 'delete_PriceList', 'Delete PriceList', 'Delete PriceList', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(101, 'create_AccountsTree', 'Create AccountsTree', 'Create AccountsTree', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(102, 'read_AccountsTree', 'Read AccountsTree', 'Read AccountsTree', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(103, 'update_AccountsTree', 'Update AccountsTree', 'Update AccountsTree', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(104, 'delete_AccountsTree', 'Delete AccountsTree', 'Delete AccountsTree', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(105, 'create_Banks', 'Create Banks', 'Create Banks', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(106, 'read_Banks', 'Read Banks', 'Read Banks', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(107, 'update_Banks', 'Update Banks', 'Update Banks', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(108, 'delete_Banks', 'Delete Banks', 'Delete Banks', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(109, 'create_JournalEntries', 'Create JournalEntries', 'Create JournalEntries', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(110, 'read_JournalEntries', 'Read JournalEntries', 'Read JournalEntries', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(111, 'update_JournalEntries', 'Update JournalEntries', 'Update JournalEntries', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(112, 'delete_JournalEntries', 'Delete JournalEntries', 'Delete JournalEntries', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(113, 'create_AccountSettings', 'Create AccountSettings', 'Create AccountSettings', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(114, 'read_AccountSettings', 'Read AccountSettings', 'Read AccountSettings', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(115, 'update_AccountSettings', 'Update AccountSettings', 'Update AccountSettings', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(116, 'delete_AccountSettings', 'Delete AccountSettings', 'Delete AccountSettings', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(117, 'create_PaymentSupplier', 'Create PaymentSupplier', 'Create PaymentSupplier', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(118, 'read_PaymentSupplier', 'Read PaymentSupplier', 'Read PaymentSupplier', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(119, 'update_PaymentSupplier', 'Update PaymentSupplier', 'Update PaymentSupplier', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(120, 'delete_PaymentSupplier', 'Delete PaymentSupplier', 'Delete PaymentSupplier', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(121, 'create_CustomerPayment', 'Create CustomerPayment', 'Create CustomerPayment', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(122, 'read_CustomerPayment', 'Read CustomerPayment', 'Read CustomerPayment', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(123, 'update_CustomerPayment', 'Update CustomerPayment', 'Update CustomerPayment', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(124, 'delete_CustomerPayment', 'Delete CustomerPayment', 'Delete CustomerPayment', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(125, 'create_Checks', 'Create Checks', 'Create Checks', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(126, 'read_Checks', 'Read Checks', 'Read Checks', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(127, 'update_Checks', 'Update Checks', 'Update Checks', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(128, 'delete_Checks', 'Delete Checks', 'Delete Checks', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(129, 'create_AccountStatment', 'Create AccountStatment', 'Create AccountStatment', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(130, 'read_AccountStatment', 'Read AccountStatment', 'Read AccountStatment', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(131, 'update_AccountStatment', 'Update AccountStatment', 'Update AccountStatment', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(132, 'delete_AccountStatment', 'Delete AccountStatment', 'Delete AccountStatment', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(133, 'create_TrialBalance', 'Create TrialBalance', 'Create TrialBalance', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(134, 'read_TrialBalance', 'Read TrialBalance', 'Read TrialBalance', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(135, 'update_TrialBalance', 'Update TrialBalance', 'Update TrialBalance', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(136, 'delete_TrialBalance', 'Delete TrialBalance', 'Delete TrialBalance', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(137, 'create_IncomeStatment', 'Create IncomeStatment', 'Create IncomeStatment', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(138, 'read_IncomeStatment', 'Read IncomeStatment', 'Read IncomeStatment', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(139, 'update_IncomeStatment', 'Update IncomeStatment', 'Update IncomeStatment', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(140, 'delete_IncomeStatment', 'Delete IncomeStatment', 'Delete IncomeStatment', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(141, 'create_BalanceSheet', 'Create BalanceSheet', 'Create BalanceSheet', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(142, 'read_BalanceSheet', 'Read BalanceSheet', 'Read BalanceSheet', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(143, 'update_BalanceSheet', 'Update BalanceSheet', 'Update BalanceSheet', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(144, 'delete_BalanceSheet', 'Delete BalanceSheet', 'Delete BalanceSheet', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(145, 'create_Departments', 'Create Departments', 'Create Departments', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(146, 'read_Departments', 'Read Departments', 'Read Departments', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(147, 'update_Departments', 'Update Departments', 'Update Departments', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(148, 'delete_Departments', 'Delete Departments', 'Delete Departments', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(149, 'create_Employees', 'Create Employees', 'Create Employees', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(150, 'read_Employees', 'Read Employees', 'Read Employees', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(151, 'update_Employees', 'Update Employees', 'Update Employees', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(152, 'delete_Employees', 'Delete Employees', 'Delete Employees', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(153, 'create_EmployeeFiles', 'Create EmployeeFiles', 'Create EmployeeFiles', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(154, 'read_EmployeeFiles', 'Read EmployeeFiles', 'Read EmployeeFiles', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(155, 'update_EmployeeFiles', 'Update EmployeeFiles', 'Update EmployeeFiles', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(156, 'delete_EmployeeFiles', 'Delete EmployeeFiles', 'Delete EmployeeFiles', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(157, 'create_Attendances', 'Create Attendances', 'Create Attendances', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(158, 'read_Attendances', 'Read Attendances', 'Read Attendances', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(159, 'update_Attendances', 'Update Attendances', 'Update Attendances', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(160, 'delete_Attendances', 'Delete Attendances', 'Delete Attendances', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(161, 'create_Rewards', 'Create Rewards', 'Create Rewards', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(162, 'read_Rewards', 'Read Rewards', 'Read Rewards', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(163, 'update_Rewards', 'Update Rewards', 'Update Rewards', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(164, 'delete_Rewards', 'Delete Rewards', 'Delete Rewards', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(165, 'create_Medicals', 'Create Medicals', 'Create Medicals', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(166, 'read_Medicals', 'Read Medicals', 'Read Medicals', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(167, 'update_Medicals', 'Update Medicals', 'Update Medicals', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(168, 'delete_Medicals', 'Delete Medicals', 'Delete Medicals', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(169, 'create_SalaryType', 'Create SalaryType', 'Create SalaryType', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(170, 'read_SalaryType', 'Read SalaryType', 'Read SalaryType', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(171, 'update_SalaryType', 'Update SalaryType', 'Update SalaryType', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(172, 'delete_SalaryType', 'Delete SalaryType', 'Delete SalaryType', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(173, 'create_SalarySetup', 'Create SalarySetup', 'Create SalarySetup', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(174, 'read_SalarySetup', 'Read SalarySetup', 'Read SalarySetup', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(175, 'update_SalarySetup', 'Update SalarySetup', 'Update SalarySetup', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(176, 'delete_SalarySetup', 'Delete SalarySetup', 'Delete SalarySetup', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(177, 'create_SalaryGenerate', 'Create SalaryGenerate', 'Create SalaryGenerate', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(178, 'read_SalaryGenerate', 'Read SalaryGenerate', 'Read SalaryGenerate', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(179, 'update_SalaryGenerate', 'Update SalaryGenerate', 'Update SalaryGenerate', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(180, 'delete_SalaryGenerate', 'Delete SalaryGenerate', 'Delete SalaryGenerate', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(181, 'create_WorkDays', 'Create WorkDays', 'Create WorkDays', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(182, 'read_WorkDays', 'Read WorkDays', 'Read WorkDays', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(183, 'update_WorkDays', 'Update WorkDays', 'Update WorkDays', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(184, 'delete_WorkDays', 'Delete WorkDays', 'Delete WorkDays', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(185, 'create_HoliDays', 'Create HoliDays', 'Create HoliDays', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(186, 'read_HoliDays', 'Read HoliDays', 'Read HoliDays', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(187, 'update_HoliDays', 'Update HoliDays', 'Update HoliDays', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(188, 'delete_HoliDays', 'Delete HoliDays', 'Delete HoliDays', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(189, 'create_Tickets', 'Create Tickets', 'Create Tickets', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(190, 'read_Tickets', 'Read Tickets', 'Read Tickets', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(191, 'update_Tickets', 'Update Tickets', 'Update Tickets', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(192, 'delete_Tickets', 'Delete Tickets', 'Delete Tickets', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(193, 'create_Leads', 'Create Leads', 'Create Leads', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(194, 'read_Leads', 'Read Leads', 'Read Leads', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(195, 'update_Leads', 'Update Leads', 'Update Leads', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(196, 'delete_Leads', 'Delete Leads', 'Delete Leads', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(197, 'create_LeadComment', 'Create LeadComment', 'Create LeadComment', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(198, 'read_LeadComment', 'Read LeadComment', 'Read LeadComment', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(199, 'update_LeadComment', 'Update LeadComment', 'Update LeadComment', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(200, 'delete_LeadComment', 'Delete LeadComment', 'Delete LeadComment', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(201, 'create_Users', 'Create Users', 'Create Users', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(202, 'read_Users', 'Read Users', 'Read Users', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(203, 'update_Users', 'Update Users', 'Update Users', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(204, 'delete_Users', 'Delete Users', 'Delete Users', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(205, 'create_Roles', 'Create Roles', 'Create Roles', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(206, 'read_Roles', 'Read Roles', 'Read Roles', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(207, 'update_Roles', 'Update Roles', 'Update Roles', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(208, 'delete_Roles', 'Delete Roles', 'Delete Roles', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(209, 'create_GeneralSetting', 'Create GeneralSetting', 'Create GeneralSetting', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(210, 'read_GeneralSetting', 'Read GeneralSetting', 'Read GeneralSetting', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(211, 'update_GeneralSetting', 'Update GeneralSetting', 'Update GeneralSetting', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(212, 'delete_GeneralSetting', 'Delete GeneralSetting', 'Delete GeneralSetting', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(213, 'moduleSetting_GeneralSetting', 'ModuleSetting GeneralSetting', 'ModuleSetting GeneralSetting', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(214, 'create_Tax', 'Create Tax', 'Create Tax', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(215, 'read_Tax', 'Read Tax', 'Read Tax', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(216, 'update_Tax', 'Update Tax', 'Update Tax', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(217, 'delete_Tax', 'Delete Tax', 'Delete Tax', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(218, 'create_BanksInfo', 'Create BanksInfo', 'Create BanksInfo', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(219, 'read_BanksInfo', 'Read BanksInfo', 'Read BanksInfo', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(220, 'update_BanksInfo', 'Update BanksInfo', 'Update BanksInfo', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(221, 'delete_BanksInfo', 'Delete BanksInfo', 'Delete BanksInfo', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(222, 'create_FinNotes', 'Create FinNotes', 'Create FinNotes', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(223, 'read_FinNotes', 'Read FinNotes', 'Read FinNotes', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(224, 'update_FinNotes', 'Update FinNotes', 'Update FinNotes', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(225, 'delete_FinNotes', 'Delete FinNotes', 'Delete FinNotes', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(226, 'create_purchasesReports', 'Create PurchasesReports', 'Create PurchasesReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(227, 'read_purchasesReports', 'Read PurchasesReports', 'Read PurchasesReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(228, 'update_purchasesReports', 'Update PurchasesReports', 'Update PurchasesReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(229, 'delete_purchasesReports', 'Delete PurchasesReports', 'Delete PurchasesReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(230, 'create_suppliersReports', 'Create SuppliersReports', 'Create SuppliersReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(231, 'read_suppliersReports', 'Read SuppliersReports', 'Read SuppliersReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(232, 'update_suppliersReports', 'Update SuppliersReports', 'Update SuppliersReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(233, 'delete_suppliersReports', 'Delete SuppliersReports', 'Delete SuppliersReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(234, 'create_salesReports', 'Create SalesReports', 'Create SalesReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(235, 'read_salesReports', 'Read SalesReports', 'Read SalesReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(236, 'update_salesReports', 'Update SalesReports', 'Update SalesReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(237, 'delete_salesReports', 'Delete SalesReports', 'Delete SalesReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(238, 'create_customersReports', 'Create CustomersReports', 'Create CustomersReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(239, 'read_customersReports', 'Read CustomersReports', 'Read CustomersReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(240, 'update_customersReports', 'Update CustomersReports', 'Update CustomersReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(241, 'delete_customersReports', 'Delete CustomersReports', 'Delete CustomersReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(242, 'create_expensesReports', 'Create ExpensesReports', 'Create ExpensesReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(243, 'read_expensesReports', 'Read ExpensesReports', 'Read ExpensesReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(244, 'update_expensesReports', 'Update ExpensesReports', 'Update ExpensesReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(245, 'delete_expensesReports', 'Delete ExpensesReports', 'Delete ExpensesReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(246, 'create_itemCardsReports', 'Create ItemCardsReports', 'Create ItemCardsReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(247, 'read_itemCardsReports', 'Read ItemCardsReports', 'Read ItemCardsReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(248, 'update_itemCardsReports', 'Update ItemCardsReports', 'Update ItemCardsReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(249, 'delete_itemCardsReports', 'Delete ItemCardsReports', 'Delete ItemCardsReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(250, 'create_alertQtyReports', 'Create AlertQtyReports', 'Create AlertQtyReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(251, 'read_alertQtyReports', 'Read AlertQtyReports', 'Read AlertQtyReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(252, 'update_alertQtyReports', 'Update AlertQtyReports', 'Update AlertQtyReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(253, 'delete_alertQtyReports', 'Delete AlertQtyReports', 'Delete AlertQtyReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(254, 'create_itemsReports', 'Create ItemsReports', 'Create ItemsReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(255, 'read_itemsReports', 'Read ItemsReports', 'Read ItemsReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(256, 'update_itemsReports', 'Update ItemsReports', 'Update ItemsReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(257, 'delete_itemsReports', 'Delete ItemsReports', 'Delete ItemsReports', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(258, 'create_activityLog', 'Create ActivityLog', 'Create ActivityLog', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(259, 'read_activityLog', 'Read ActivityLog', 'Read ActivityLog', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(260, 'update_activityLog', 'Update ActivityLog', 'Update ActivityLog', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(261, 'delete_activityLog', 'Delete ActivityLog', 'Delete ActivityLog', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(262, 'create_stockCount', 'Create StockCount', 'Create StockCount', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(263, 'read_stockCount', 'Read StockCount', 'Read StockCount', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(264, 'update_stockCount', 'Update StockCount', 'Update StockCount', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(265, 'delete_stockCount', 'Delete StockCount', 'Delete StockCount', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(266, 'create_Branches', 'Create Branches', 'Create Branches', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(267, 'read_Branches', 'Read Branches', 'Read Branches', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(268, 'update_Branches', 'Update Branches', 'Update Branches', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(269, 'delete_Branches', 'Delete Branches', 'Delete Branches', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(270, 'create_Transfers', 'Create Transfers', 'Create Transfers', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(271, 'read_Transfers', 'Read Transfers', 'Read Transfers', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(272, 'update_Transfers', 'Update Transfers', 'Update Transfers', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(273, 'delete_Transfers', 'Delete Transfers', 'Delete Transfers', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(274, 'create_Projects', 'Create Projects', 'Create Projects', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(275, 'read_Projects', 'Read Projects', 'Read Projects', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(276, 'update_Projects', 'Update Projects', 'Update Projects', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(277, 'delete_Projects', 'Delete Projects', 'Delete Projects', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(278, 'create_ProPhases', 'Create ProPhases', 'Create ProPhases', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(279, 'read_ProPhases', 'Read ProPhases', 'Read ProPhases', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(280, 'update_ProPhases', 'Update ProPhases', 'Update ProPhases', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(281, 'delete_ProPhases', 'Delete ProPhases', 'Delete ProPhases', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(282, 'create_ProTasks', 'Create ProTasks', 'Create ProTasks', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(283, 'read_ProTasks', 'Read ProTasks', 'Read ProTasks', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(284, 'update_ProTasks', 'Update ProTasks', 'Update ProTasks', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(285, 'delete_ProTasks', 'Delete ProTasks', 'Delete ProTasks', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(286, 'create_ManufacturingModel', 'Create ManufacturingModel', 'Create ManufacturingModel', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(287, 'read_ManufacturingModel', 'Read ManufacturingModel', 'Read ManufacturingModel', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(288, 'update_ManufacturingModel', 'Update ManufacturingModel', 'Update ManufacturingModel', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(289, 'delete_ManufacturingModel', 'Delete ManufacturingModel', 'Delete ManufacturingModel', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(290, 'create_ManufacturingOrder', 'Create ManufacturingOrder', 'Create ManufacturingOrder', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(291, 'read_ManufacturingOrder', 'Read ManufacturingOrder', 'Read ManufacturingOrder', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(292, 'update_ManufacturingOrder', 'Update ManufacturingOrder', 'Update ManufacturingOrder', '2023-10-21 06:09:11', '2023-10-21 06:09:11'),
(293, 'delete_ManufacturingOrder', 'Delete ManufacturingOrder', 'Delete ManufacturingOrder', '2023-10-21 06:09:11', '2023-10-21 06:09:11');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 1),
(197, 1),
(198, 1),
(199, 1),
(200, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(207, 1),
(208, 1),
(209, 1),
(210, 1),
(211, 1),
(212, 1),
(213, 1),
(214, 1),
(215, 1),
(216, 1),
(217, 1),
(218, 1),
(219, 1),
(220, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(236, 1),
(237, 1),
(238, 1),
(239, 1),
(240, 1),
(241, 1),
(242, 1),
(243, 1),
(244, 1),
(245, 1),
(246, 1),
(247, 1),
(248, 1),
(249, 1),
(250, 1),
(251, 1),
(252, 1),
(253, 1),
(254, 1),
(255, 1),
(256, 1),
(257, 1),
(258, 1),
(259, 1),
(260, 1),
(261, 1),
(262, 1),
(263, 1),
(264, 1),
(265, 1),
(266, 1),
(267, 1),
(268, 1),
(269, 1),
(270, 1),
(271, 1),
(272, 1),
(273, 1),
(274, 1),
(275, 1),
(276, 1),
(277, 1),
(278, 1),
(279, 1),
(280, 1),
(281, 1),
(282, 1),
(283, 1),
(284, 1),
(285, 1),
(286, 1),
(287, 1),
(288, 1),
(289, 1),
(290, 1),
(291, 1),
(292, 1),
(293, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price_lists`
--

CREATE TABLE `price_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `details` text NOT NULL,
  `discount_type` enum('percent','amount') DEFAULT NULL,
  `discount_value` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price_list_items`
--

CREATE TABLE `price_list_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `list_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(15,3) NOT NULL,
  `custom_price` double(15,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pro_phases`
--

CREATE TABLE `pro_phases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `name` varchar(191) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `details` text NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pro_projects`
--

CREATE TABLE `pro_projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `name` varchar(191) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `budget` double NOT NULL,
  `details` text DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `expected_cost` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pro_tasks`
--

CREATE TABLE `pro_tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `phase_id` bigint(20) NOT NULL,
  `name` varchar(191) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `details` text NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'Super Admin', 'Super Admin', '2023-10-21 06:09:10', '2023-10-21 06:09:10'),
(2, 'admin', 'Admin', 'Admin', '2023-10-21 06:09:12', '2023-10-21 06:09:12'),
(3, 'company_user', 'Company User', 'Company User', '2023-10-21 06:09:12', '2023-10-21 06:09:12'),
(4, 'company', 'Company', 'Company', '2023-10-21 06:09:12', '2023-10-21 06:09:12');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Table structure for table `sal_delivers`
--

CREATE TABLE `sal_delivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sal_opretation_id` bigint(20) DEFAULT NULL,
  `sal_invoice_id` bigint(20) DEFAULT NULL,
  `added_by` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `reference_no` varchar(191) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `items_count` int(10) UNSIGNED DEFAULT NULL,
  `total_qty` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sal_deliver_details`
--

CREATE TABLE `sal_deliver_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `deliver_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  `qunatity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sal_invoices`
--

CREATE TABLE `sal_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(100) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `money_id` bigint(20) NOT NULL,
  `added_by` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `total_qty` double(15,3) NOT NULL,
  `items_count` int(11) DEFAULT NULL,
  `order_tax_rate` double(15,3) NOT NULL,
  `order_tax` double(15,3) NOT NULL,
  `tax_type` tinyint(4) NOT NULL COMMENT '1 = for_both ; 2 = for_invoice ; 3 = for_items',
  `invoice_payment_type` tinyint(4) NOT NULL COMMENT '1 = cash_payment ; 2 = fees_payment ; 3 = deferred_payment',
  `shipping_cost` double(15,3) NOT NULL,
  `total_cost` double(15,3) NOT NULL,
  `total_discount` double(15,3) NOT NULL DEFAULT 0.000,
  `invoice_discount` double(8,2) DEFAULT 0.00,
  `items_total` double(8,2) NOT NULL DEFAULT 0.00,
  `invoice_discount_type` tinyint(4) NOT NULL DEFAULT 0,
  `deduction_tax` double(8,2) NOT NULL DEFAULT 0.00,
  `deduction_tax_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `sub_total_after_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `sub_total_after_tax` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax` double(15,3) NOT NULL DEFAULT 0.000,
  `paid_amount` double(15,3) NOT NULL DEFAULT 0.000,
  `grand_total` double(15,3) NOT NULL,
  `remaining_amount` double(15,3) DEFAULT 0.000,
  `status` tinyint(4) DEFAULT 0 COMMENT '1 = cash_payment ,\r\n2 = fees_payment , \r\n3 = deferred_payment ,',
  `invoice_type` enum('draft','approved') NOT NULL DEFAULT 'draft',
  `is_paid` tinyint(4) NOT NULL,
  `is_delivered` tinyint(4) NOT NULL DEFAULT 0,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sal_invoice_details`
--

CREATE TABLE `sal_invoice_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sal_invoice_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `sale_unit_id` bigint(20) DEFAULT NULL,
  `qunatity` int(11) NOT NULL,
  `unit_price` double(15,3) NOT NULL,
  `tax_rate` double(15,3) NOT NULL,
  `tax` double(15,3) NOT NULL,
  `discount` double(15,3) DEFAULT NULL,
  `discount_type` tinyint(4) DEFAULT NULL,
  `total` double(15,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sal_ordered_supply_customers`
--

CREATE TABLE `sal_ordered_supply_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opration_id` bigint(20) DEFAULT NULL,
  `reference_no` varchar(100) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `added_by` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `total_qty` double(15,3) NOT NULL,
  `grand_total` double(15,3) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `shipping_cost` double(15,3) DEFAULT NULL,
  `items_count` int(11) DEFAULT NULL,
  `tax_rate` int(11) DEFAULT NULL,
  `tax_amount` double(7,3) DEFAULT NULL,
  `total_discount` double(10,3) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sal_ordered_supply_customer_details`
--

CREATE TABLE `sal_ordered_supply_customer_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cust_order_suppliy_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  `qunatity` int(11) NOT NULL,
  `unit_price` double(15,3) NOT NULL,
  `tax_rate` int(11) DEFAULT NULL,
  `tax_amount` double(7,3) DEFAULT NULL,
  `discount` double(10,3) DEFAULT NULL,
  `total` double(15,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sal_quotations`
--

CREATE TABLE `sal_quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(100) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `added_by` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `expired_date` date NOT NULL,
  `total_qty` double(15,3) DEFAULT NULL,
  `order_tax_type` varchar(10) DEFAULT NULL,
  `order_tax` int(10) DEFAULT NULL,
  `shipping_cost` double(15,3) DEFAULT NULL,
  `total_cost` double(15,3) DEFAULT NULL,
  `discount_val` double(8,2) DEFAULT 0.00,
  `discount_type` enum('number','percent') DEFAULT NULL,
  `total_discount` double(15,3) DEFAULT NULL,
  `total_tax` double(15,3) DEFAULT NULL,
  `grand_total` double(15,3) NOT NULL,
  `status` varchar(20) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `conditions` text DEFAULT NULL,
  `visiable_photo` tinyint(4) NOT NULL DEFAULT 0,
  `destination_port` varchar(191) DEFAULT NULL,
  `shipping_mark` varchar(191) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `type` enum('internal','external') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sal_quotation_details`
--

CREATE TABLE `sal_quotation_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sal_quotation_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `sale_unit_id` bigint(20) DEFAULT NULL,
  `qunatity` int(11) NOT NULL,
  `unit_price` double(15,3) NOT NULL,
  `tax_rate` double(15,3) DEFAULT NULL,
  `tax` double(15,3) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `discount` double(15,3) DEFAULT NULL,
  `total` double(15,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sal_returns`
--

CREATE TABLE `sal_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(100) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `money_id` bigint(20) NOT NULL,
  `added_by` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `id_sal_invoice` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `total_qty` double(15,3) NOT NULL,
  `items_count` bigint(20) NOT NULL,
  `order_tax_rate` double(15,3) NOT NULL,
  `order_tax` double(15,3) NOT NULL,
  `tax_type` double(15,3) NOT NULL,
  `remaining_amount` double(15,3) NOT NULL,
  `invoice_payment_type` double(15,3) NOT NULL,
  `shipping_cost` double(15,3) NOT NULL,
  `total_cost` double(15,3) NOT NULL,
  `total_discount` double(15,3) NOT NULL DEFAULT 0.000,
  `total_tax` double(15,3) NOT NULL DEFAULT 0.000,
  `paid_amount` double(15,3) NOT NULL DEFAULT 0.000,
  `grand_total` double(15,3) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `is_paid` tinyint(4) NOT NULL,
  `is_received` tinyint(4) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sal_return_details`
--

CREATE TABLE `sal_return_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sal_return_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `sal_unit_id` bigint(20) DEFAULT NULL,
  `net_unit_cost` double(15,3) DEFAULT NULL,
  `qunatity` int(11) NOT NULL,
  `unit_price` double(15,3) NOT NULL,
  `tax_rate` double(15,3) DEFAULT NULL,
  `tax` double(15,3) DEFAULT NULL,
  `discount` double(15,3) DEFAULT NULL,
  `discount_type` double(15,3) DEFAULT NULL,
  `total` double(15,3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ser_services`
--

CREATE TABLE `ser_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(100) DEFAULT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `barcode` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `sale_price` double(15,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ser_service_invoices`
--

CREATE TABLE `ser_service_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(100) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `money_id` bigint(20) NOT NULL,
  `added_by` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `paid_amount` double(15,3) NOT NULL DEFAULT 0.000,
  `grand_total` double(15,3) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `is_paid` tinyint(4) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ser_service_invoice_details`
--

CREATE TABLE `ser_service_invoice_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ser_invoice_id` bigint(20) NOT NULL,
  `service_id` bigint(20) NOT NULL,
  `qunatity` int(11) NOT NULL,
  `unit_price` double(15,3) NOT NULL,
  `tax_rate` double(15,3) NOT NULL,
  `tax` double(15,3) NOT NULL,
  `discount` double(15,3) NOT NULL,
  `total` double(15,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sto_brands`
--

CREATE TABLE `sto_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(100) DEFAULT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `branch_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sto_categories`
--

CREATE TABLE `sto_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(100) DEFAULT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT 0,
  `level` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sto_items`
--

CREATE TABLE `sto_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(100) DEFAULT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `barcode` varchar(191) DEFAULT NULL,
  `item_type` enum('standard','service','collection','manufacturing','template','consuming') DEFAULT NULL,
  `cost` varchar(150) DEFAULT '0.000',
  `sale_price` double(15,3) DEFAULT NULL,
  `qty_list` varchar(191) DEFAULT NULL,
  `price_list` varchar(191) DEFAULT NULL,
  `product_list` varchar(191) DEFAULT NULL,
  `alert_quantity` int(11) DEFAULT NULL,
  `cat_id` bigint(20) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) NOT NULL DEFAULT 1,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sale_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchase_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL,
  `made_in` varchar(10) DEFAULT NULL,
  `weight` varchar(191) DEFAULT NULL,
  `height` varchar(191) DEFAULT NULL,
  `width` varchar(191) DEFAULT NULL,
  `lenght` varchar(191) DEFAULT NULL,
  `discount_group` varchar(191) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `tax_method` int(11) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `barcode_symbology` varchar(191) DEFAULT NULL,
  `is_batch` tinyint(4) DEFAULT 0,
  `is_variant` tinyint(4) DEFAULT 0,
  `is_active` tinyint(4) DEFAULT 0,
  `can_manufactured` tinyint(4) NOT NULL DEFAULT 0,
  `can_bought` tinyint(4) NOT NULL DEFAULT 0,
  `can_sold` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sto_item_cards`
--

CREATE TABLE `sto_item_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `operation_id` bigint(20) DEFAULT NULL,
  `type` enum('purchase','sale','purchaseReturn','saleReturn','recive','delivery','stocktaking') NOT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  `quantity_in` int(10) UNSIGNED DEFAULT NULL,
  `price_in` double UNSIGNED DEFAULT NULL,
  `value_in` double UNSIGNED DEFAULT NULL,
  `quantity_out` int(10) UNSIGNED DEFAULT NULL,
  `price_out` double UNSIGNED DEFAULT NULL,
  `value_out` double UNSIGNED DEFAULT NULL,
  `quantity_balance` int(10) UNSIGNED DEFAULT NULL,
  `price_balance` double UNSIGNED DEFAULT NULL,
  `value_balance` double UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sto_item_collections`
--

CREATE TABLE `sto_item_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `belongs_product` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `price` double(15,3) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sto_item_store_places`
--

CREATE TABLE `sto_item_store_places` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `place` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sto_item_sto_tag`
--

CREATE TABLE `sto_item_sto_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sto_item_id` bigint(20) UNSIGNED NOT NULL,
  `sto_tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sto_quantities`
--

CREATE TABLE `sto_quantities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `unit_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sto_stock_count`
--

CREATE TABLE `sto_stock_count` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref` varchar(191) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `category_id` text DEFAULT NULL,
  `brand_id` text DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `initial_file` varchar(191) DEFAULT NULL,
  `final_file` varchar(191) DEFAULT NULL,
  `type` enum('Full','Partial') NOT NULL,
  `is_adjusted` tinyint(1) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sto_stock_count_items`
--

CREATE TABLE `sto_stock_count_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_count_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `expected` double(8,2) NOT NULL,
  `counted` double(8,2) NOT NULL,
  `difference` double(8,2) NOT NULL,
  `cost` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sto_stores`
--

CREATE TABLE `sto_stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(100) DEFAULT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `branch_id` bigint(20) NOT NULL DEFAULT 1,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'Storekeeper',
  `phone` varchar(191) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_damage_store` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sto_tags`
--

CREATE TABLE `sto_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sto_transfares`
--

CREATE TABLE `sto_transfares` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `from_store` bigint(20) NOT NULL,
  `to_store` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `items_total` double NOT NULL,
  `shipping_cost` double NOT NULL,
  `grand_total` double NOT NULL,
  `status` enum('completed','pending') NOT NULL DEFAULT 'pending',
  `note` text DEFAULT NULL,
  `added_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sto_transfare_details`
--

CREATE TABLE `sto_transfare_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transfare_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  `unit_price` double NOT NULL,
  `total_price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sto_units`
--

CREATE TABLE `sto_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_code` varchar(100) NOT NULL,
  `unit_name` varchar(100) NOT NULL,
  `base_unit` int(11) NOT NULL DEFAULT 0,
  `operator` varchar(100) DEFAULT NULL,
  `operation_value` double(15,3) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_person` varchar(191) NOT NULL,
  `company_name` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `fax` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `opening_balance` double(15,3) DEFAULT 0.000,
  `website` varchar(191) DEFAULT NULL,
  `facbook` varchar(191) DEFAULT NULL,
  `linkedin` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `location_on_map` varchar(191) DEFAULT NULL,
  `country_code` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `is_active` varchar(191) NOT NULL DEFAULT '1',
  `tax_id` varchar(191) DEFAULT NULL,
  `tax_office` varchar(191) DEFAULT NULL,
  `is_tax_supplier` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=> tax supplier , 2 => none tax supplier',
  `tax_exempt` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>  exempt , 2 => none  exempt',
  `id_for_orginaztion` varchar(191) DEFAULT NULL,
  `cr_id` varchar(191) DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_file_number` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `rate` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `created_at`, `updated_at`) VALUES
(1, '@14', 14, '2022-02-27 16:27:23', '2022-02-27 16:27:23'),
(2, '@1', 1, '2022-02-27 16:27:34', '2022-02-27 16:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `priority` varchar(191) NOT NULL,
  `start_at` datetime NOT NULL,
  `description` text NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_moved` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => not moved , 1 => moved',
  `move_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => not moved , 1 => internal , 2 => external',
  `move_description` text NOT NULL,
  `closed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `closed_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `move_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets_users`
--

CREATE TABLE `tickets_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_attachments`
--

CREATE TABLE `ticket_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `link` varchar(191) DEFAULT NULL,
  `reply_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reply_content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `phone`, `photo`, `status`, `branch_id`, `created_by`, `updated_by`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'super_admin@app.com', NULL, '$2y$10$V6nEv2teiW2Tv1uucVcOz.uI5zH37GlvkK3NzRZJh1RvDsIhe1VRy', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2023-10-21 06:09:12', '2023-10-21 06:09:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `bank_infos`
--
ALTER TABLE `bank_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_infos_customer_id_foreign` (`customer_id`),
  ADD KEY `bank_infos_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buy_operations`
--
ALTER TABLE `buy_operations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buy_ordered_supplies`
--
ALTER TABLE `buy_ordered_supplies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buy_ordered_supply_details`
--
ALTER TABLE `buy_ordered_supply_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buy_purchase_invoices`
--
ALTER TABLE `buy_purchase_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buy_purchase_invoices_supplier_id_foreign` (`supplier_id`),
  ADD KEY `buy_purchase_invoices_added_by_foreign` (`added_by`),
  ADD KEY `buy_purchase_invoices_store_id_foreign` (`store_id`),
  ADD KEY `buy_purchase_invoices_money_id_foreign` (`money_id`);

--
-- Indexes for table `buy_purchase_invoice_details`
--
ALTER TABLE `buy_purchase_invoice_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buy_purchase_invoice_details_buy_invoice_id_foreign` (`buy_invoice_id`);

--
-- Indexes for table `buy_purchase_orders`
--
ALTER TABLE `buy_purchase_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buy_purchase_order_details`
--
ALTER TABLE `buy_purchase_order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buy_purchase_requisitions`
--
ALTER TABLE `buy_purchase_requisitions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buy_purchase_requisition_items`
--
ALTER TABLE `buy_purchase_requisition_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buy_purchase_returns`
--
ALTER TABLE `buy_purchase_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buy_purchase_return_details`
--
ALTER TABLE `buy_purchase_return_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buy_receives`
--
ALTER TABLE `buy_receives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buy_receives_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `buy_receive_details`
--
ALTER TABLE `buy_receive_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buy_supplier_quotations`
--
ALTER TABLE `buy_supplier_quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buy_supplier_quotation_details`
--
ALTER TABLE `buy_supplier_quotation_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_code`);

--
-- Indexes for table `crm_leads`
--
ALTER TABLE `crm_leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crm_leads_comment_id_foreign` (`comment_id`);

--
-- Indexes for table `crm_leads_feedback`
--
ALTER TABLE `crm_leads_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crm_leads_feedback_lead_id_foreign` (`lead_id`),
  ADD KEY `crm_leads_feedback_user_id_foreign` (`user_id`);

--
-- Indexes for table `crm_leads_users`
--
ALTER TABLE `crm_leads_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crm_leads_users_lead_id_foreign` (`lead_id`),
  ADD KEY `crm_leads_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `crm_leads_visits`
--
ALTER TABLE `crm_leads_visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crm_leads_visits_lead_id_foreign` (`lead_id`),
  ADD KEY `crm_leads_visits_created_by_foreign` (`created_by`),
  ADD KEY `crm_leads_visits_salesman_id_foreign` (`salesman_id`),
  ADD KEY `crm_leads_visits_comment_id_foreign` (`comment_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_parent_id_foreign` (`parent_id`),
  ADD KEY `customers_group_id_foreign` (`group_id`),
  ADD KEY `customers_account_id_foreign` (`account_id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `expense_categories_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fin_accounts`
--
ALTER TABLE `fin_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fin_accounts_cat_id_foreign` (`cat_id`);

--
-- Indexes for table `fin_banks`
--
ALTER TABLE `fin_banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fin_categories`
--
ALTER TABLE `fin_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fin_checks`
--
ALTER TABLE `fin_checks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fin_journals`
--
ALTER TABLE `fin_journals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fin_journals_user_id_foreign` (`user_id`),
  ADD KEY `fin_journals_source_id_foreign` (`source_id`);

--
-- Indexes for table `fin_journal_details`
--
ALTER TABLE `fin_journal_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fin_journal_details_journal_id_foreign` (`journal_id`),
  ADD KEY `fin_journal_details_account_id_foreign` (`account_id`);

--
-- Indexes for table `fin_notes`
--
ALTER TABLE `fin_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fin_settings`
--
ALTER TABLE `fin_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_key` (`account_key`),
  ADD KEY `fin_settings_user_id_foreign` (`user_id`),
  ADD KEY `fin_settings_account_id_foreign` (`account_id`);

--
-- Indexes for table `fin_transactions`
--
ALTER TABLE `fin_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fin_years`
--
ALTER TABLE `fin_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_attendances`
--
ALTER TABLE `hr_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hr_attendance_employee_id_foreign` (`employee_id`),
  ADD KEY `hr_attendance_created_by_foreign` (`created_by`);

--
-- Indexes for table `hr_departments`
--
ALTER TABLE `hr_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_employees`
--
ALTER TABLE `hr_employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hr_employees_email_unique` (`email`);

--
-- Indexes for table `hr_employee_files`
--
ALTER TABLE `hr_employee_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hr_employee_files_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hr_employee_medicals`
--
ALTER TABLE `hr_employee_medicals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hr_employee_medicals_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hr_holidays`
--
ALTER TABLE `hr_holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_rewards`
--
ALTER TABLE `hr_rewards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hr_rewards_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hr_salary_employees`
--
ALTER TABLE `hr_salary_employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hr_salary_employees_generate_id_foreign` (`generate_id`),
  ADD KEY `hr_salary_employees_employee_id_foreign` (`employee_id`),
  ADD KEY `hr_salary_employees_paid_by_foreign` (`paid_by`);

--
-- Indexes for table `hr_salary_generates`
--
ALTER TABLE `hr_salary_generates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hr_salary_generates_user_id_foreign` (`user_id`);

--
-- Indexes for table `hr_salary_setups`
--
ALTER TABLE `hr_salary_setups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hr_salary_setups_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hr_salary_types`
--
ALTER TABLE `hr_salary_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_workdays`
--
ALTER TABLE `hr_workdays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_work_shifts`
--
ALTER TABLE `hr_work_shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturing_modles`
--
ALTER TABLE `manufacturing_modles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturing_modle_details`
--
ALTER TABLE `manufacturing_modle_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturing_orders`
--
ALTER TABLE `manufacturing_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturing_order_details`
--
ALTER TABLE `manufacturing_order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturing_order_feedback`
--
ALTER TABLE `manufacturing_order_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moved_tickets`
--
ALTER TABLE `moved_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `moved_tickets_ticket_id_foreign` (`ticket_id`),
  ADD KEY `moved_tickets_user_id_foreign` (`user_id`);

--
-- Indexes for table `parent_companies`
--
ALTER TABLE `parent_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `price_lists`
--
ALTER TABLE `price_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `price_list_items`
--
ALTER TABLE `price_list_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `price_list_items_list_id_foreign` (`list_id`);

--
-- Indexes for table `pro_phases`
--
ALTER TABLE `pro_phases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pro_projects`
--
ALTER TABLE `pro_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pro_projects_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `pro_tasks`
--
ALTER TABLE `pro_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sal_delivers`
--
ALTER TABLE `sal_delivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sal_deliver_details`
--
ALTER TABLE `sal_deliver_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sal_invoices`
--
ALTER TABLE `sal_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sal_invoice_details`
--
ALTER TABLE `sal_invoice_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sal_invoice_details_sal_invoice_id_foreign` (`sal_invoice_id`);

--
-- Indexes for table `sal_ordered_supply_customers`
--
ALTER TABLE `sal_ordered_supply_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sal_ordered_supply_customer_details`
--
ALTER TABLE `sal_ordered_supply_customer_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sal_quotations`
--
ALTER TABLE `sal_quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sal_quotation_details`
--
ALTER TABLE `sal_quotation_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sal_returns`
--
ALTER TABLE `sal_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sal_return_details`
--
ALTER TABLE `sal_return_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ser_services`
--
ALTER TABLE `ser_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ser_service_invoices`
--
ALTER TABLE `ser_service_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ser_service_invoice_details`
--
ALTER TABLE `ser_service_invoice_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sto_brands`
--
ALTER TABLE `sto_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sto_categories`
--
ALTER TABLE `sto_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sto_items`
--
ALTER TABLE `sto_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sto_item_cards`
--
ALTER TABLE `sto_item_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sto_item_collections`
--
ALTER TABLE `sto_item_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sto_item_store_places`
--
ALTER TABLE `sto_item_store_places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sto_item_store_places_item_id_foreign` (`item_id`),
  ADD KEY `sto_item_store_places_store_id_foreign` (`store_id`);

--
-- Indexes for table `sto_item_sto_tag`
--
ALTER TABLE `sto_item_sto_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sto_items_tags_item_id_foreign` (`sto_item_id`),
  ADD KEY `sto_items_tags_tag_id_foreign` (`sto_tag_id`);

--
-- Indexes for table `sto_quantities`
--
ALTER TABLE `sto_quantities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sto_stock_count`
--
ALTER TABLE `sto_stock_count`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sto_stock_count_items`
--
ALTER TABLE `sto_stock_count_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sto_stores`
--
ALTER TABLE `sto_stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sto_tags`
--
ALTER TABLE `sto_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sto_transfares`
--
ALTER TABLE `sto_transfares`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sto_transfare_details`
--
ALTER TABLE `sto_transfare_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sto_transfare_details_transfare_id_foreign` (`transfare_id`);

--
-- Indexes for table `sto_units`
--
ALTER TABLE `sto_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suppliers_account_id_foreign` (`account_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_customer_id_foreign` (`customer_id`),
  ADD KEY `tickets_department_id_foreign` (`department_id`);

--
-- Indexes for table `tickets_users`
--
ALTER TABLE `tickets_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_users_ticket_id_foreign` (`ticket_id`),
  ADD KEY `tickets_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_attachments_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_attachments_reply_id_foreign` (`reply_id`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_replies_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_replies_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_infos`
--
ALTER TABLE `bank_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `buy_operations`
--
ALTER TABLE `buy_operations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buy_ordered_supplies`
--
ALTER TABLE `buy_ordered_supplies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buy_ordered_supply_details`
--
ALTER TABLE `buy_ordered_supply_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buy_purchase_invoices`
--
ALTER TABLE `buy_purchase_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buy_purchase_invoice_details`
--
ALTER TABLE `buy_purchase_invoice_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buy_purchase_orders`
--
ALTER TABLE `buy_purchase_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buy_purchase_order_details`
--
ALTER TABLE `buy_purchase_order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buy_purchase_requisitions`
--
ALTER TABLE `buy_purchase_requisitions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buy_purchase_requisition_items`
--
ALTER TABLE `buy_purchase_requisition_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buy_purchase_returns`
--
ALTER TABLE `buy_purchase_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buy_purchase_return_details`
--
ALTER TABLE `buy_purchase_return_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buy_receives`
--
ALTER TABLE `buy_receives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buy_receive_details`
--
ALTER TABLE `buy_receive_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buy_supplier_quotations`
--
ALTER TABLE `buy_supplier_quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buy_supplier_quotation_details`
--
ALTER TABLE `buy_supplier_quotation_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_leads`
--
ALTER TABLE `crm_leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_leads_feedback`
--
ALTER TABLE `crm_leads_feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_leads_users`
--
ALTER TABLE `crm_leads_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_leads_visits`
--
ALTER TABLE `crm_leads_visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fin_accounts`
--
ALTER TABLE `fin_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `fin_banks`
--
ALTER TABLE `fin_banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fin_categories`
--
ALTER TABLE `fin_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fin_checks`
--
ALTER TABLE `fin_checks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fin_journals`
--
ALTER TABLE `fin_journals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fin_journal_details`
--
ALTER TABLE `fin_journal_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fin_notes`
--
ALTER TABLE `fin_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fin_settings`
--
ALTER TABLE `fin_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `fin_transactions`
--
ALTER TABLE `fin_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fin_years`
--
ALTER TABLE `fin_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_attendances`
--
ALTER TABLE `hr_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_departments`
--
ALTER TABLE `hr_departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_employees`
--
ALTER TABLE `hr_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_employee_files`
--
ALTER TABLE `hr_employee_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_employee_medicals`
--
ALTER TABLE `hr_employee_medicals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_holidays`
--
ALTER TABLE `hr_holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_rewards`
--
ALTER TABLE `hr_rewards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_salary_employees`
--
ALTER TABLE `hr_salary_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_salary_generates`
--
ALTER TABLE `hr_salary_generates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_salary_setups`
--
ALTER TABLE `hr_salary_setups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_salary_types`
--
ALTER TABLE `hr_salary_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_workdays`
--
ALTER TABLE `hr_workdays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hr_work_shifts`
--
ALTER TABLE `hr_work_shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturing_modles`
--
ALTER TABLE `manufacturing_modles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturing_modle_details`
--
ALTER TABLE `manufacturing_modle_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturing_orders`
--
ALTER TABLE `manufacturing_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturing_order_details`
--
ALTER TABLE `manufacturing_order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturing_order_feedback`
--
ALTER TABLE `manufacturing_order_feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `moved_tickets`
--
ALTER TABLE `moved_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parent_companies`
--
ALTER TABLE `parent_companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_lists`
--
ALTER TABLE `price_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_list_items`
--
ALTER TABLE `price_list_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pro_phases`
--
ALTER TABLE `pro_phases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pro_projects`
--
ALTER TABLE `pro_projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pro_tasks`
--
ALTER TABLE `pro_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sal_delivers`
--
ALTER TABLE `sal_delivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sal_deliver_details`
--
ALTER TABLE `sal_deliver_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sal_invoices`
--
ALTER TABLE `sal_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sal_invoice_details`
--
ALTER TABLE `sal_invoice_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sal_ordered_supply_customers`
--
ALTER TABLE `sal_ordered_supply_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sal_ordered_supply_customer_details`
--
ALTER TABLE `sal_ordered_supply_customer_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sal_quotations`
--
ALTER TABLE `sal_quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sal_quotation_details`
--
ALTER TABLE `sal_quotation_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sal_returns`
--
ALTER TABLE `sal_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sal_return_details`
--
ALTER TABLE `sal_return_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ser_services`
--
ALTER TABLE `ser_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ser_service_invoices`
--
ALTER TABLE `ser_service_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ser_service_invoice_details`
--
ALTER TABLE `ser_service_invoice_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sto_brands`
--
ALTER TABLE `sto_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sto_categories`
--
ALTER TABLE `sto_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sto_items`
--
ALTER TABLE `sto_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sto_item_cards`
--
ALTER TABLE `sto_item_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sto_item_collections`
--
ALTER TABLE `sto_item_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sto_item_store_places`
--
ALTER TABLE `sto_item_store_places`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sto_item_sto_tag`
--
ALTER TABLE `sto_item_sto_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sto_quantities`
--
ALTER TABLE `sto_quantities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sto_stock_count`
--
ALTER TABLE `sto_stock_count`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sto_stock_count_items`
--
ALTER TABLE `sto_stock_count_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sto_stores`
--
ALTER TABLE `sto_stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sto_tags`
--
ALTER TABLE `sto_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sto_transfares`
--
ALTER TABLE `sto_transfares`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sto_transfare_details`
--
ALTER TABLE `sto_transfare_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sto_units`
--
ALTER TABLE `sto_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets_users`
--
ALTER TABLE `tickets_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_infos`
--
ALTER TABLE `bank_infos`
  ADD CONSTRAINT `bank_infos_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bank_infos_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `buy_purchase_invoices`
--
ALTER TABLE `buy_purchase_invoices`
  ADD CONSTRAINT `buy_purchase_invoices_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buy_purchase_invoices_money_id_foreign` FOREIGN KEY (`money_id`) REFERENCES `fin_accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buy_purchase_invoices_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `sto_stores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buy_purchase_invoices_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `buy_purchase_invoice_details`
--
ALTER TABLE `buy_purchase_invoice_details`
  ADD CONSTRAINT `buy_purchase_invoice_details_buy_invoice_id_foreign` FOREIGN KEY (`buy_invoice_id`) REFERENCES `buy_purchase_invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `buy_receives`
--
ALTER TABLE `buy_receives`
  ADD CONSTRAINT `buy_receives_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `crm_leads`
--
ALTER TABLE `crm_leads`
  ADD CONSTRAINT `crm_leads_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `crm_leads_feedback` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `crm_leads_feedback`
--
ALTER TABLE `crm_leads_feedback`
  ADD CONSTRAINT `crm_leads_feedback_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `crm_leads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `crm_leads_feedback_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `crm_leads_users`
--
ALTER TABLE `crm_leads_users`
  ADD CONSTRAINT `crm_leads_users_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `crm_leads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `crm_leads_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `crm_leads_visits`
--
ALTER TABLE `crm_leads_visits`
  ADD CONSTRAINT `crm_leads_visits_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `crm_leads_feedback` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `crm_leads_visits_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `crm_leads_visits_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `crm_leads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `crm_leads_visits_salesman_id_foreign` FOREIGN KEY (`salesman_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `fin_accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customers_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customers_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `parent_companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fin_accounts`
--
ALTER TABLE `fin_accounts`
  ADD CONSTRAINT `fin_accounts_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `fin_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fin_journals`
--
ALTER TABLE `fin_journals`
  ADD CONSTRAINT `fin_journals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fin_journal_details`
--
ALTER TABLE `fin_journal_details`
  ADD CONSTRAINT `fin_journal_details_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `fin_accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fin_journal_details_journal_id_foreign` FOREIGN KEY (`journal_id`) REFERENCES `fin_journals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hr_attendances`
--
ALTER TABLE `hr_attendances`
  ADD CONSTRAINT `hr_attendance_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hr_attendance_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hr_employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hr_employee_files`
--
ALTER TABLE `hr_employee_files`
  ADD CONSTRAINT `hr_employee_files_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hr_employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hr_employee_medicals`
--
ALTER TABLE `hr_employee_medicals`
  ADD CONSTRAINT `hr_employee_medicals_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hr_employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hr_salary_employees`
--
ALTER TABLE `hr_salary_employees`
  ADD CONSTRAINT `hr_salary_employees_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hr_employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hr_salary_employees_generate_id_foreign` FOREIGN KEY (`generate_id`) REFERENCES `hr_salary_generates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hr_salary_employees_paid_by_foreign` FOREIGN KEY (`paid_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pro_projects`
--
ALTER TABLE `pro_projects`
  ADD CONSTRAINT `pro_projects_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hr_employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sto_transfare_details`
--
ALTER TABLE `sto_transfare_details`
  ADD CONSTRAINT `sto_transfare_details_transfare_id_foreign` FOREIGN KEY (`transfare_id`) REFERENCES `sto_transfares` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

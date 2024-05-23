-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 23, 2024 at 09:15 PM
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
-- Database: `sky_projects`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject_type` varchar(191) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(191) DEFAULT NULL,
  `properties` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `safe_id` bigint(20) NOT NULL,
  `receiver_safe_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `total_expenses` double(12,2) NOT NULL DEFAULT 0.00,
  `safe_balance` double(12,2) NOT NULL DEFAULT 0.00,
  `total_transfares` double(12,2) NOT NULL DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` float(12,2) NOT NULL,
  `type` enum('cash','properties','cash_money') NOT NULL,
  `safe_id` bigint(20) DEFAULT NULL,
  `added_by` bigint(20) NOT NULL,
  `descripton` text DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `name`, `amount`, `type`, `safe_id`, `added_by`, `descripton`, `file`, `created_at`, `updated_at`) VALUES
(1, 'افتتاح رصيد الشركة', 5000000.00, 'cash', 1, 1, 'الخزنة الرئيسية للشركة', '', '2024-05-23 09:57:16', '2024-05-23 09:57:16');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) NOT NULL,
  `name_en` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) NOT NULL,
  `name_en` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) NOT NULL,
  `name_en` varchar(191) NOT NULL,
  `date` date NOT NULL,
  `photo` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `contact_person` varchar(191) DEFAULT NULL,
  `balance` double(8,2) NOT NULL DEFAULT 0.00,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `code`, `phone`, `contact_person`, `balance`, `address`, `created_at`, `updated_at`) VALUES
(1, 'شركة المياه', 'cust-1', '01157809060', 'محمد حسين', 0.00, 'الحي الاول مدينة العبور, الشباب مدينة العبور', '2024-05-14 07:56:18', '2024-05-19 11:17:38'),
(2, 'شركة الصرف', 'cust-2', '123654789', 'علي محمود', 0.00, 'الحي الاول مدينة العبور, الشباب مدينة العبور', '2024-05-19 11:18:01', '2024-05-19 11:18:01');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `type` enum('temp','parmanent') NOT NULL DEFAULT 'temp',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `code`, `phone`, `start_date`, `address`, `file`, `type`, `notes`, `created_at`, `updated_at`, `account_id`, `active`) VALUES
(1, 'مصطفي فهمي', 'emp-1', '01157809060', '2023-01-01', 'الحي الاول مدينة العبور, الشباب مدينة العبور', '66431b6adbb27.pdf', 'parmanent', NULL, '2024-05-14 05:06:02', '2024-05-22 04:33:30', 10, 1),
(2, 'مصطفي عبده علي', 'emp-2', '1236547896', '2024-05-19', 'الحي الاول مدينة العبور, الشباب مدينة العبور', '', 'parmanent', NULL, '2024-05-19 11:20:12', '2024-05-22 04:29:47', 9, 1),
(3, 'صالح محمد النجار', 'emp-3', '123654789', '2024-05-01', '10th of ramdan', '', 'parmanent', NULL, '2024-05-19 11:20:42', '2024-05-22 04:33:39', 8, 1),
(5, 'new user', 'emp-4', '1452541', '2024-05-20', 'test', '', 'temp', NULL, '2024-05-20 07:02:04', '2024-05-20 08:46:13', NULL, 0),
(6, 'عبدالرحمن محمود 2', 'emp-6', '77777777', '2024-05-01', 'المعادي', '', 'temp', NULL, '2024-05-20 07:29:49', '2024-05-20 08:40:21', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `amount` float(15,2) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('materials','general','subcontractor','tempwages','permanentwages','other') NOT NULL DEFAULT 'general',
  `safe_id` bigint(20) NOT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `subcontractor_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `material_name` varchar(191) DEFAULT NULL,
  `material_qty` double(8,2) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `adjustment_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `date`, `reference`, `amount`, `note`, `cat_id`, `created_at`, `updated_at`, `type`, `safe_id`, `project_id`, `subcontractor_id`, `user_id`, `employee_id`, `material_name`, `material_qty`, `file`, `adjustment_id`) VALUES
(1, '2024-05-23', NULL, 10000.00, NULL, NULL, '2024-05-23 10:53:43', '2024-05-23 10:53:43', 'materials', 3, 1, NULL, 10, NULL, 'مواسير بلاستيك 12 بوصة', 500.00, '', NULL),
(2, '2024-05-23', NULL, 5000.00, 'مصروفات وسلفة عمال', NULL, '2024-05-23 10:54:03', '2024-05-23 10:54:03', 'other', 3, 1, NULL, 10, NULL, NULL, NULL, '', NULL),
(3, '2024-05-23', NULL, 25000.00, 'تم الاستلام من السيخ عبده', NULL, '2024-05-23 10:55:07', '2024-05-23 10:55:07', 'materials', 3, 1, NULL, 10, NULL, 'غطيان ظهر', 150.00, '', NULL),
(4, '2024-05-23', NULL, 20000.00, NULL, NULL, '2024-05-23 10:57:15', '2024-05-23 10:57:15', 'materials', 3, 1, NULL, 10, NULL, 'مواسير 16 بوصة', 90.00, '', NULL),
(5, '2024-05-23', NULL, 5000.00, 'جاز  للجرار', NULL, '2024-05-23 10:57:44', '2024-05-23 10:57:44', 'other', 3, 1, NULL, 10, NULL, NULL, NULL, '', NULL),
(6, '2024-05-23', '250', 250000.00, NULL, NULL, '2024-05-23 18:09:25', '2024-05-23 18:09:25', 'subcontractor', 2, 1, 1, 1, NULL, NULL, NULL, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(6, 'ايجار', '2021-12-22 22:45:04', '2021-12-22 22:45:04'),
(7, 'رواتب', '2021-12-22 22:45:18', '2022-01-02 21:13:28'),
(9, 'صيانه', '2022-01-02 21:03:05', '2022-01-02 21:03:05'),
(10, 'ديكور', '2022-01-05 22:28:26', '2022-01-05 22:33:03'),
(11, 'اجهزه', '2022-01-05 22:35:54', '2022-01-05 22:35:54'),
(12, 'برنامج', '2022-01-05 22:36:14', '2022-01-05 22:36:14'),
(13, 'انترنت', '2022-01-05 23:12:22', '2022-01-05 23:12:22'),
(15, 'محامي', '2022-05-15 22:56:34', '2022-05-15 22:56:34'),
(16, 'ترخيص', '2022-08-07 22:07:12', '2022-08-07 22:07:12'),
(17, 'اخري', '2022-10-19 20:26:46', '2022-10-19 20:26:46');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fairs`
--

CREATE TABLE `fairs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) NOT NULL,
  `name_en` varchar(191) NOT NULL,
  `desc_ar` text NOT NULL,
  `desc_en` text NOT NULL,
  `photo` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fair_attachments`
--

CREATE TABLE `fair_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `link` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fair_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fair_media`
--

CREATE TABLE `fair_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `youtube` varchar(191) DEFAULT NULL,
  `type` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `message` varchar(191) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1=> message , 2 => lead , 3=> newslater',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_02_16_060647_laratrust_setup_tables', 1),
(5, '2020_03_10_060427_create_activity_log_table', 1),
(6, '2020_03_12_045249_create_categories_table', 1),
(7, '2020_03_12_121847_create_sliders_table', 1),
(8, '2020_03_21_084305_create_partners_table', 1),
(9, '2020_03_24_052851_create_messages_table', 1),
(10, '2020_06_28_112706_create_products_table', 1),
(11, '2020_06_28_115846_create_product_photos_table', 1),
(12, '2020_06_29_155950_create_tags_table', 1),
(13, '2020_06_29_163057_create_tags_products_table', 1),
(14, '2020_07_06_173721_create_offers_table', 1),
(15, '2020_09_21_104244_create_pages_table', 1),
(16, '2020_10_21_172919_create_brands_table', 1),
(17, '2020_12_15_084527_create_sup_categories_table', 1),
(18, '2020_12_16_071131_add_sup_to_products_table', 1),
(19, '2020_12_16_165710_create_supsup_categories_table', 1),
(20, '2020_12_16_181919_add_cat_to_supsup_categories_table', 1),
(21, '2020_12_16_211938_add_supsup_to_products_table', 1),
(22, '2021_01_14_222535_create_fairs_table', 1),
(23, '2021_01_14_222835_create_certificates_table', 1),
(24, '2021_01_14_223008_create_fair_attachments_table', 1),
(25, '2021_04_02_142031_add_pdf_to_products_table', 2),
(26, '2021_04_02_142237_add_pdf_to_products_table', 3),
(27, '2021_04_02_160904_add_featured_to_products_table', 4),
(28, '2021_04_03_073323_create_orders_table', 5),
(29, '2021_04_16_081329_create_fair_media_table', 6),
(30, '2021_04_16_081726_add_attr_to_fair_media_table', 7),
(31, '2021_04_16_083856_add_fair_id_to_fair_attachments_table', 7),
(32, '2014_10_12_100000_create_password_reset_tokens_table', 8),
(33, '2019_12_14_000001_create_personal_access_tokens_table', 8),
(34, '2023_12_29_081133_create_customers_table', 9),
(35, '2024_01_02_063410_create_projects_table', 10),
(36, '2024_01_06_081652_add_cols_to_expenses_table', 11),
(37, '2024_01_06_084613_create_revenues_table', 11),
(38, '2024_01_06_085302_create_subcontractors_table', 11),
(39, '2024_01_06_090220_create_project_subcontractors_table', 11),
(40, '2024_01_06_091103_create_assets_table', 12),
(41, '2024_01_09_072216_create_employees_table', 13),
(42, '2024_03_08_223229_create_project_items_table', 14),
(43, '2024_03_11_032834_create_project_users_table', 15),
(44, '2024_03_23_034513_create_safes_table', 16),
(45, '2024_03_23_034652_add_safe_id_to_expenses_table', 16),
(46, '2024_03_23_034757_add_safe_id_to_revenues_table', 16),
(47, '2024_03_23_035531_create_safe_transfers_table', 16),
(48, '2024_03_27_035458_add_added_by_to_assets_table', 17),
(49, '2024_03_27_040059_add_safe_id_to_assets_table', 18),
(50, '2024_05_08_175704_add_file_to_revenues_table', 19),
(51, '2024_05_08_181508_create_project_files_table', 20),
(52, '2024_05_11_160251_create_project_ptofits_table', 21),
(53, '2024_05_14_045023_rename_ptofits_to_project_profits_table', 22),
(54, '2024_05_15_113556_add_parent_id_to_safes_table', 23),
(55, '2024_05_15_124840_add_manager_id_to_projects_table', 24),
(56, '2024_05_19_193853_add_account_id_to_employees_table', 25),
(57, '2024_05_19_202050_add_active_to_employees_table', 26),
(58, '2024_05_23_190608_create_adjustments_table', 27),
(59, '2024_05_23_191345_add_adjustment_id_to_expenses_table', 27),
(60, '2024_05_23_191425_add_adjustment_id_to_safe_transfers_table', 27);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) NOT NULL,
  `name_en` varchar(191) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `price_befoer_discount` int(11) NOT NULL,
  `price_after_discount` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `desc_ar` longtext NOT NULL,
  `desc_en` longtext NOT NULL,
  `color` varchar(191) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `style` varchar(191) DEFAULT NULL,
  `photo` varchar(191) NOT NULL,
  `photo1` varchar(191) DEFAULT NULL,
  `photo2` varchar(191) DEFAULT NULL,
  `photo3` varchar(191) DEFAULT NULL,
  `photo4` varchar(191) DEFAULT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `in_stock` tinyint(4) NOT NULL DEFAULT 0,
  `model_name` varchar(191) NOT NULL,
  `meta_keywords` varchar(191) DEFAULT NULL,
  `meta_des` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `order_desc` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `name_ar` varchar(191) NOT NULL,
  `name_en` varchar(191) NOT NULL,
  `content_en` longtext NOT NULL,
  `content_ar` longtext NOT NULL,
  `photo` varchar(191) NOT NULL,
  `meta_keywords` varchar(191) NOT NULL,
  `meta_description` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `photo` varchar(191) NOT NULL,
  `name_ar` varchar(191) NOT NULL,
  `name_en` varchar(191) NOT NULL,
  `content_ar` text DEFAULT NULL,
  `content_en` text DEFAULT NULL,
  `active` varchar(191) NOT NULL DEFAULT '0',
  `type` enum('client','review') DEFAULT 'client',
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
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'create_users', 'Create Users', 'Create Users', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(2, 'read_users', 'Read Users', 'Read Users', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(3, 'update_users', 'Update Users', 'Update Users', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(4, 'delete_users', 'Delete Users', 'Delete Users', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(5, 'create_roles', 'Create Roles', 'Create Roles', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(6, 'read_roles', 'Read Roles', 'Read Roles', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(7, 'update_roles', 'Update Roles', 'Update Roles', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(8, 'delete_roles', 'Delete Roles', 'Delete Roles', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(9, 'create_settings', 'Create Settings', 'Create Settings', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(10, 'read_settings', 'Read Settings', 'Read Settings', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(11, 'update_settings', 'Update Settings', 'Update Settings', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(12, 'delete_settings', 'Delete Settings', 'Delete Settings', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(13, 'create_categories', 'Create Categories', 'Create Categories', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(14, 'read_categories', 'Read Categories', 'Read Categories', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(15, 'update_categories', 'Update Categories', 'Update Categories', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(16, 'delete_categories', 'Delete Categories', 'Delete Categories', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(17, 'create_sliders', 'Create Sliders', 'Create Sliders', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(18, 'read_sliders', 'Read Sliders', 'Read Sliders', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(19, 'update_sliders', 'Update Sliders', 'Update Sliders', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(20, 'delete_sliders', 'Delete Sliders', 'Delete Sliders', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(21, 'create_partners', 'Create Partners', 'Create Partners', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(22, 'read_partners', 'Read Partners', 'Read Partners', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(23, 'update_partners', 'Update Partners', 'Update Partners', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(24, 'delete_partners', 'Delete Partners', 'Delete Partners', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(25, 'create_messages', 'Create Messages', 'Create Messages', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(26, 'read_messages', 'Read Messages', 'Read Messages', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(27, 'update_messages', 'Update Messages', 'Update Messages', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(28, 'delete_messages', 'Delete Messages', 'Delete Messages', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(29, 'create_products', 'Create Products', 'Create Products', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(30, 'read_products', 'Read Products', 'Read Products', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(31, 'update_products', 'Update Products', 'Update Products', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(32, 'delete_products', 'Delete Products', 'Delete Products', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(33, 'create_productphotos', 'Create Productphotos', 'Create Productphotos', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(34, 'read_productphotos', 'Read Productphotos', 'Read Productphotos', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(35, 'update_productphotos', 'Update Productphotos', 'Update Productphotos', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(36, 'delete_productphotos', 'Delete Productphotos', 'Delete Productphotos', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(37, 'create_tags', 'Create Tags', 'Create Tags', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(38, 'read_tags', 'Read Tags', 'Read Tags', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(39, 'update_tags', 'Update Tags', 'Update Tags', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(40, 'delete_tags', 'Delete Tags', 'Delete Tags', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(41, 'create_offers', 'Create Offers', 'Create Offers', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(42, 'read_offers', 'Read Offers', 'Read Offers', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(43, 'update_offers', 'Update Offers', 'Update Offers', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(44, 'delete_offers', 'Delete Offers', 'Delete Offers', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(45, 'create_pages', 'Create Pages', 'Create Pages', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(46, 'read_pages', 'Read Pages', 'Read Pages', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(47, 'update_pages', 'Update Pages', 'Update Pages', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(48, 'delete_pages', 'Delete Pages', 'Delete Pages', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(49, 'create_brands', 'Create Brands', 'Create Brands', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(50, 'read_brands', 'Read Brands', 'Read Brands', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(51, 'update_brands', 'Update Brands', 'Update Brands', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(52, 'delete_brands', 'Delete Brands', 'Delete Brands', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(53, 'create_supcategories', 'Create Supcategories', 'Create Supcategories', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(54, 'read_supcategories', 'Read Supcategories', 'Read Supcategories', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(55, 'update_supcategories', 'Update Supcategories', 'Update Supcategories', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(56, 'delete_supcategories', 'Delete Supcategories', 'Delete Supcategories', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(57, 'create_supsupcategories', 'Create Supsupcategories', 'Create Supsupcategories', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(58, 'read_supsupcategories', 'Read Supsupcategories', 'Read Supsupcategories', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(59, 'update_supsupcategories', 'Update Supsupcategories', 'Update Supsupcategories', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(60, 'delete_supsupcategories', 'Delete Supsupcategories', 'Delete Supsupcategories', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(61, 'create_fairs', 'Create Fairs', 'Create Fairs', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(62, 'read_fairs', 'Read Fairs', 'Read Fairs', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(63, 'update_fairs', 'Update Fairs', 'Update Fairs', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(64, 'delete_fairs', 'Delete Fairs', 'Delete Fairs', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(65, 'create_certificates', 'Create Certificates', 'Create Certificates', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(66, 'read_certificates', 'Read Certificates', 'Read Certificates', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(67, 'update_certificates', 'Update Certificates', 'Update Certificates', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(68, 'delete_certificates', 'Delete Certificates', 'Delete Certificates', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(69, 'create_fairattachments', 'Create Fairattachments', 'Create Fairattachments', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(70, 'read_fairattachments', 'Read Fairattachments', 'Read Fairattachments', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(71, 'update_fairattachments', 'Update Fairattachments', 'Update Fairattachments', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(72, 'delete_fairattachments', 'Delete Fairattachments', 'Delete Fairattachments', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(73, 'create_orders', 'Create Orders', 'Create Orders', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(74, 'read_orders', 'Read Orders', 'Read Orders', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(75, 'update_orders', 'Update Orders', 'Update Orders', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(76, 'delete_orders', 'Delete Orders', 'Delete Orders', '2021-04-03 06:02:43', '2021-04-03 06:02:43'),
(77, 'users_create', 'Create Users', 'Create Users', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(78, 'users_read', 'Read Users', 'Read Users', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(79, 'users_update', 'Update Users', 'Update Users', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(80, 'users_delete', 'Delete Users', 'Delete Users', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(81, 'roles_create', 'Create Roles', 'Create Roles', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(82, 'roles_read', 'Read Roles', 'Read Roles', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(83, 'roles_update', 'Update Roles', 'Update Roles', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(84, 'roles_delete', 'Delete Roles', 'Delete Roles', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(85, 'settings_create', 'Create Settings', 'Create Settings', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(86, 'settings_read', 'Read Settings', 'Read Settings', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(87, 'settings_update', 'Update Settings', 'Update Settings', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(88, 'settings_delete', 'Delete Settings', 'Delete Settings', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(89, 'categories_create', 'Create Categories', 'Create Categories', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(90, 'categories_read', 'Read Categories', 'Read Categories', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(91, 'categories_update', 'Update Categories', 'Update Categories', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(92, 'categories_delete', 'Delete Categories', 'Delete Categories', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(93, 'sliders_create', 'Create Sliders', 'Create Sliders', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(94, 'sliders_read', 'Read Sliders', 'Read Sliders', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(95, 'sliders_update', 'Update Sliders', 'Update Sliders', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(96, 'sliders_delete', 'Delete Sliders', 'Delete Sliders', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(97, 'partners_create', 'Create Partners', 'Create Partners', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(98, 'partners_read', 'Read Partners', 'Read Partners', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(99, 'partners_update', 'Update Partners', 'Update Partners', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(100, 'partners_delete', 'Delete Partners', 'Delete Partners', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(101, 'messages_create', 'Create Messages', 'Create Messages', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(102, 'messages_read', 'Read Messages', 'Read Messages', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(103, 'messages_update', 'Update Messages', 'Update Messages', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(104, 'messages_delete', 'Delete Messages', 'Delete Messages', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(105, 'products_create', 'Create Products', 'Create Products', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(106, 'products_read', 'Read Products', 'Read Products', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(107, 'products_update', 'Update Products', 'Update Products', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(108, 'products_delete', 'Delete Products', 'Delete Products', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(109, 'productphotos_create', 'Create Productphotos', 'Create Productphotos', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(110, 'productphotos_read', 'Read Productphotos', 'Read Productphotos', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(111, 'productphotos_update', 'Update Productphotos', 'Update Productphotos', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(112, 'productphotos_delete', 'Delete Productphotos', 'Delete Productphotos', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(113, 'tags_create', 'Create Tags', 'Create Tags', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(114, 'tags_read', 'Read Tags', 'Read Tags', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(115, 'tags_update', 'Update Tags', 'Update Tags', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(116, 'tags_delete', 'Delete Tags', 'Delete Tags', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(117, 'offers_create', 'Create Offers', 'Create Offers', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(118, 'offers_read', 'Read Offers', 'Read Offers', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(119, 'offers_update', 'Update Offers', 'Update Offers', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(120, 'offers_delete', 'Delete Offers', 'Delete Offers', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(121, 'pages_create', 'Create Pages', 'Create Pages', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(122, 'pages_read', 'Read Pages', 'Read Pages', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(123, 'pages_update', 'Update Pages', 'Update Pages', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(124, 'pages_delete', 'Delete Pages', 'Delete Pages', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(125, 'brands_create', 'Create Brands', 'Create Brands', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(126, 'brands_read', 'Read Brands', 'Read Brands', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(127, 'brands_update', 'Update Brands', 'Update Brands', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(128, 'brands_delete', 'Delete Brands', 'Delete Brands', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(129, 'supcategories_create', 'Create Supcategories', 'Create Supcategories', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(130, 'supcategories_read', 'Read Supcategories', 'Read Supcategories', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(131, 'supcategories_update', 'Update Supcategories', 'Update Supcategories', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(132, 'supcategories_delete', 'Delete Supcategories', 'Delete Supcategories', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(133, 'supsupcategories_create', 'Create Supsupcategories', 'Create Supsupcategories', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(134, 'supsupcategories_read', 'Read Supsupcategories', 'Read Supsupcategories', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(135, 'supsupcategories_update', 'Update Supsupcategories', 'Update Supsupcategories', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(136, 'supsupcategories_delete', 'Delete Supsupcategories', 'Delete Supsupcategories', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(137, 'fairs_create', 'Create Fairs', 'Create Fairs', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(138, 'fairs_read', 'Read Fairs', 'Read Fairs', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(139, 'fairs_update', 'Update Fairs', 'Update Fairs', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(140, 'fairs_delete', 'Delete Fairs', 'Delete Fairs', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(141, 'certificates_create', 'Create Certificates', 'Create Certificates', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(142, 'certificates_read', 'Read Certificates', 'Read Certificates', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(143, 'certificates_update', 'Update Certificates', 'Update Certificates', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(144, 'certificates_delete', 'Delete Certificates', 'Delete Certificates', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(145, 'fairattachments_create', 'Create Fairattachments', 'Create Fairattachments', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(146, 'fairattachments_read', 'Read Fairattachments', 'Read Fairattachments', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(147, 'fairattachments_update', 'Update Fairattachments', 'Update Fairattachments', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(148, 'fairattachments_delete', 'Delete Fairattachments', 'Delete Fairattachments', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(149, 'orders_create', 'Create Orders', 'Create Orders', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(150, 'orders_read', 'Read Orders', 'Read Orders', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(151, 'orders_update', 'Update Orders', 'Update Orders', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(152, 'orders_delete', 'Delete Orders', 'Delete Orders', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(153, 'expenses_create', 'Create Expenses', 'Create Expenses', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(154, 'expenses_read', 'Read Expenses', 'Read Expenses', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(155, 'expenses_update', 'Update Expenses', 'Update Expenses', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(156, 'expenses_delete', 'Delete Expenses', 'Delete Expenses', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(157, 'expensecategories_create', 'Create Expensecategories', 'Create Expensecategories', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(158, 'expensecategories_read', 'Read Expensecategories', 'Read Expensecategories', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(159, 'expensecategories_update', 'Update Expensecategories', 'Update Expensecategories', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(160, 'expensecategories_delete', 'Delete Expensecategories', 'Delete Expensecategories', '2023-12-29 02:54:41', '2023-12-29 02:54:41'),
(161, 'create_expenses', 'Create Expenses', 'Create Expenses', '2023-12-29 03:03:00', '2023-12-29 03:03:00'),
(162, 'read_expenses', 'Read Expenses', 'Read Expenses', '2023-12-29 03:03:00', '2023-12-29 03:03:00'),
(163, 'update_expenses', 'Update Expenses', 'Update Expenses', '2023-12-29 03:03:00', '2023-12-29 03:03:00'),
(164, 'delete_expenses', 'Delete Expenses', 'Delete Expenses', '2023-12-29 03:03:00', '2023-12-29 03:03:00'),
(165, 'create_expensecategories', 'Create Expensecategories', 'Create Expensecategories', '2023-12-29 03:03:00', '2023-12-29 03:03:00'),
(166, 'read_expensecategories', 'Read Expensecategories', 'Read Expensecategories', '2023-12-29 03:03:00', '2023-12-29 03:03:00'),
(167, 'update_expensecategories', 'Update Expensecategories', 'Update Expensecategories', '2023-12-29 03:03:00', '2023-12-29 03:03:00'),
(168, 'delete_expensecategories', 'Delete Expensecategories', 'Delete Expensecategories', '2023-12-29 03:03:00', '2023-12-29 03:03:00'),
(169, 'create_customers', 'Create Customers', 'Create Customers', '2024-01-02 03:44:31', '2024-01-02 03:44:31'),
(170, 'read_customers', 'Read Customers', 'Read Customers', '2024-01-02 03:44:31', '2024-01-02 03:44:31'),
(171, 'update_customers', 'Update Customers', 'Update Customers', '2024-01-02 03:44:31', '2024-01-02 03:44:31'),
(172, 'delete_customers', 'Delete Customers', 'Delete Customers', '2024-01-02 03:44:31', '2024-01-02 03:44:31'),
(173, 'create_projects', 'Create Projects', 'Create Projects', '2024-01-02 03:44:31', '2024-01-02 03:44:31'),
(174, 'read_projects', 'Read Projects', 'Read Projects', '2024-01-02 03:44:31', '2024-01-02 03:44:31'),
(175, 'update_projects', 'Update Projects', 'Update Projects', '2024-01-02 03:44:31', '2024-01-02 03:44:31'),
(176, 'delete_projects', 'Delete Projects', 'Delete Projects', '2024-01-02 03:44:31', '2024-01-02 03:44:31'),
(177, 'create_subcontractors', 'Create Subcontractors', 'Create Subcontractors', '2024-01-08 04:11:08', '2024-01-08 04:11:08'),
(178, 'read_subcontractors', 'Read Subcontractors', 'Read Subcontractors', '2024-01-08 04:11:08', '2024-01-08 04:11:08'),
(179, 'update_subcontractors', 'Update Subcontractors', 'Update Subcontractors', '2024-01-08 04:11:08', '2024-01-08 04:11:08'),
(180, 'delete_subcontractors', 'Delete Subcontractors', 'Delete Subcontractors', '2024-01-08 04:11:08', '2024-01-08 04:11:08'),
(181, 'create_revenues', 'Create Revenues', 'Create Revenues', '2024-01-08 04:11:08', '2024-01-08 04:11:08'),
(182, 'read_revenues', 'Read Revenues', 'Read Revenues', '2024-01-08 04:11:08', '2024-01-08 04:11:08'),
(183, 'update_revenues', 'Update Revenues', 'Update Revenues', '2024-01-08 04:11:08', '2024-01-08 04:11:08'),
(184, 'delete_revenues', 'Delete Revenues', 'Delete Revenues', '2024-01-08 04:11:08', '2024-01-08 04:11:08'),
(185, 'create_employees', 'Create Employees', 'Create Employees', '2024-01-08 04:11:08', '2024-01-08 04:11:08'),
(186, 'read_employees', 'Read Employees', 'Read Employees', '2024-01-08 04:11:08', '2024-01-08 04:11:08'),
(187, 'update_employees', 'Update Employees', 'Update Employees', '2024-01-08 04:11:08', '2024-01-08 04:11:08'),
(188, 'delete_employees', 'Delete Employees', 'Delete Employees', '2024-01-08 04:11:08', '2024-01-08 04:11:08'),
(189, 'create_assets', 'Create Assets', 'Create Assets', '2024-01-10 07:58:10', '2024-01-10 07:58:10'),
(190, 'read_assets', 'Read Assets', 'Read Assets', '2024-01-10 07:58:10', '2024-01-10 07:58:10'),
(191, 'update_assets', 'Update Assets', 'Update Assets', '2024-01-10 07:58:10', '2024-01-10 07:58:10'),
(192, 'delete_assets', 'Delete Assets', 'Delete Assets', '2024-01-10 07:58:10', '2024-01-10 07:58:10'),
(193, 'create_safes', 'Create Safes', 'Create Safes', '2024-03-23 03:17:18', '2024-03-23 03:17:18'),
(194, 'read_safes', 'Read Safes', 'Read Safes', '2024-03-23 03:17:18', '2024-03-23 03:17:18'),
(195, 'update_safes', 'Update Safes', 'Update Safes', '2024-03-23 03:17:18', '2024-03-23 03:17:18'),
(196, 'delete_safes', 'Delete Safes', 'Delete Safes', '2024-03-23 03:17:18', '2024-03-23 03:17:18'),
(197, 'create_reports', 'Create Reports', 'Create Reports', '2024-03-23 03:17:18', '2024-03-23 03:17:18'),
(198, 'read_reports', 'Read Reports', 'Read Reports', '2024-03-23 03:17:18', '2024-03-23 03:17:18'),
(199, 'update_reports', 'Update Reports', 'Update Reports', '2024-03-23 03:17:18', '2024-03-23 03:17:18'),
(200, 'delete_reports', 'Delete Reports', 'Delete Reports', '2024-03-23 03:17:18', '2024-03-23 03:17:18'),
(201, 'create_safetransfers', 'Create Safetransfers', 'Create Safetransfers', '2024-03-23 06:42:17', '2024-03-23 06:42:17'),
(202, 'read_safetransfers', 'Read Safetransfers', 'Read Safetransfers', '2024-03-23 06:42:17', '2024-03-23 06:42:17'),
(203, 'update_safetransfers', 'Update Safetransfers', 'Update Safetransfers', '2024-03-23 06:42:17', '2024-03-23 06:42:17'),
(204, 'delete_safetransfers', 'Delete Safetransfers', 'Delete Safetransfers', '2024-03-23 06:42:17', '2024-03-23 06:42:17');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
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
(204, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) NOT NULL,
  `name_en` varchar(191) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `desc_ar` longtext NOT NULL,
  `desc_en` longtext NOT NULL,
  `photo` varchar(191) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 0,
  `meta_keywords` varchar(191) DEFAULT NULL,
  `meta_des` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sup_category` int(11) DEFAULT NULL,
  `supsup_category` int(11) DEFAULT NULL,
  `pdf` varchar(191) DEFAULT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_photos`
--

CREATE TABLE `product_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `customer_cost` float(15,2) NOT NULL,
  `estimated_cost` float(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `code`, `name`, `customer_id`, `start_date`, `end_date`, `customer_cost`, `estimated_cost`, `created_at`, `updated_at`, `manager_id`) VALUES
(1, 'sky-1', 'مشروع الصرف الصحي لمدينة كوم امبو', 2, '2024-05-01', '2025-06-01', 1500000.00, 1000000.00, '2024-05-23 10:01:52', '2024-05-23 10:01:52', 8);

-- --------------------------------------------------------

--
-- Table structure for table `project_files`
--

CREATE TABLE `project_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `file` varchar(191) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_items`
--

CREATE TABLE `project_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `code` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `qty` double(8,2) NOT NULL,
  `cat` double(8,2) NOT NULL,
  `item_total` double(8,2) NOT NULL,
  `implement_qty` double(8,2) NOT NULL,
  `total_implement_qty` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_profits`
--

CREATE TABLE `project_profits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `safe_id` bigint(20) DEFAULT NULL,
  `customer_cost` double(12,2) NOT NULL,
  `estimate_cost` double(12,2) NOT NULL,
  `actual_cost` double(12,2) NOT NULL,
  `profit` double(12,2) NOT NULL,
  `notes` text DEFAULT NULL,
  `type` enum('profit','loss') NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_subcontractors`
--

CREATE TABLE `project_subcontractors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `subcontractor_id` bigint(20) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `file` varchar(191) DEFAULT NULL,
  `notes` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_subcontractors`
--

INSERT INTO `project_subcontractors` (`id`, `project_id`, `subcontractor_id`, `start_date`, `end_date`, `amount`, `file`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-05-23', '2024-06-01', 500000.00, '', NULL, '2024-05-23 18:09:02', '2024-05-23 18:09:02');

-- --------------------------------------------------------

--
-- Table structure for table `project_users`
--

CREATE TABLE `project_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_users`
--

INSERT INTO `project_users` (`id`, `project_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 10, '2024-05-23 10:01:52', '2024-05-23 10:01:52'),
(2, 1, 9, '2024-05-23 10:01:52', '2024-05-23 10:01:52'),
(3, 1, 8, '2024-05-23 10:01:52', '2024-05-23 10:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `revenues`
--

CREATE TABLE `revenues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `total_amount` float(12,2) NOT NULL,
  `safe_id` bigint(20) NOT NULL,
  `tax_type` enum('flat','percent') NOT NULL DEFAULT 'flat',
  `tax_amount` float(12,2) NOT NULL,
  `net_amount` float(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `revenues`
--

INSERT INTO `revenues` (`id`, `code`, `customer_id`, `project_id`, `date`, `file`, `total_amount`, `safe_id`, `tax_type`, `tax_amount`, `net_amount`, `created_at`, `updated_at`) VALUES
(1, 'rev-1', 2, 1, '2024-05-23', '', 500000.00, 2, 'flat', 0.00, 500000.00, '2024-05-23 18:08:05', '2024-05-23 18:08:05');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'Super Admin', 'Super Admin', '2021-04-03 06:02:42', '2021-04-03 06:02:42'),
(2, 'admin', 'Admin', 'Admin', '2021-04-03 06:02:44', '2021-04-03 06:02:44'),
(3, 'user', 'User', 'User', '2021-04-03 06:02:44', '2021-04-03 06:02:44'),
(6, 'account_manager', 'Account Manager', 'Account Manager', '2024-05-14 09:18:00', '2024-05-14 09:18:00'),
(7, 'super_user', 'Super User', 'Super User', '2024-05-14 09:18:00', '2024-05-14 09:18:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\Models\\User'),
(3, 2, 'App\\Models\\User'),
(3, 5, 'App\\Models\\User'),
(3, 7, 'App\\Models\\User'),
(3, 8, 'App\\Models\\User'),
(3, 9, 'App\\Models\\User'),
(3, 10, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Table structure for table `safes`
--

CREATE TABLE `safes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `balance` float(12,2) NOT NULL,
  `type` enum('bank','custody','main') NOT NULL,
  `descripton` varchar(191) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `safes`
--

INSERT INTO `safes` (`id`, `name`, `balance`, `type`, `descripton`, `user_id`, `created_at`, `updated_at`, `project_id`, `parent_id`) VALUES
(1, 'الخزنة الرئيسية', 4500000.00, 'main', 'الخزنة الرئيسية للشركة', 10, '2024-05-23 09:56:27', '2024-05-23 10:04:17', NULL, NULL),
(2, 'مشروع الصرف الصحي لمدينة كوم امبو', 645000.00, 'main', 'تمت الاضافة بواسطة النظام', 8, '2024-05-23 10:01:52', '2024-05-23 18:09:25', 1, NULL),
(3, 'مشروع الصرف الصحي لمدينة كوم امبو (مصطفي فهمي)', 35000.00, 'custody', 'تمت الاضافة بواسطة النظام', 10, '2024-05-23 10:01:52', '2024-05-23 10:57:44', 1, 2),
(4, 'مشروع الصرف الصحي لمدينة كوم امبو (مصطفي عبده علي)', 5000.00, 'custody', 'تمت الاضافة بواسطة النظام', 9, '2024-05-23 10:01:52', '2024-05-23 11:27:57', 1, 2),
(5, 'مشروع الصرف الصحي لمدينة كوم امبو (صالح محمد النجار)', 0.00, 'custody', 'تمت الاضافة بواسطة النظام', 8, '2024-05-23 10:01:52', '2024-05-23 10:01:52', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `safe_transfers`
--

CREATE TABLE `safe_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_safe` bigint(20) NOT NULL,
  `to_safe` bigint(20) NOT NULL,
  `amount` float(12,2) NOT NULL,
  `safe_send_blance` float(12,2) NOT NULL,
  `safe_receive_blance` decimal(12,2) NOT NULL,
  `transfer_date` datetime NOT NULL,
  `added_by` bigint(20) NOT NULL,
  `notes` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `adjustment_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `safe_transfers`
--

INSERT INTO `safe_transfers` (`id`, `from_safe`, `to_safe`, `amount`, `safe_send_blance`, `safe_receive_blance`, `transfer_date`, `added_by`, `notes`, `created_at`, `updated_at`, `adjustment_id`) VALUES
(1, 1, 2, 500000.00, 4500000.00, 500000.00, '2024-05-23 14:03:00', 1, 'تحويل الي خزنة المشروع', '2024-05-23 10:04:17', '2024-05-23 10:04:17', NULL),
(2, 2, 3, 100000.00, 400000.00, 100000.00, '2024-05-23 14:51:00', 1, 'test', '2024-05-23 10:51:49', '2024-05-23 10:51:49', NULL),
(3, 2, 4, 5000.00, 395000.00, 5000.00, '2024-05-23 15:27:00', 1, 'تحويل جديد', '2024-05-23 11:27:57', '2024-05-23 11:27:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(191) DEFAULT NULL,
  `title_ar` varchar(191) DEFAULT NULL,
  `photo` varchar(191) NOT NULL,
  `description_en` varchar(191) DEFAULT NULL,
  `description_ar` varchar(191) DEFAULT NULL,
  `url` varchar(191) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcontractors`
--

CREATE TABLE `subcontractors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `contact_person` varchar(191) DEFAULT NULL,
  `balance` double(8,2) NOT NULL DEFAULT 0.00,
  `address` text DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcontractors`
--

INSERT INTO `subcontractors` (`id`, `name`, `code`, `phone`, `contact_person`, `balance`, `address`, `file`, `created_at`, `updated_at`) VALUES
(1, 'المقاول محمود الحج', 'cont-1', '01157809060', 'الحج عبدالعال', 0.00, '96 East New Freeway', '', '2024-05-15 06:23:27', '2024-05-19 11:18:29'),
(2, 'المقاول علي الريس عبده', 'cont-2', '1123654875', 'علي الريس', 0.00, '96 East New Freeway', '', '2024-05-19 11:19:01', '2024-05-19 11:19:01');

-- --------------------------------------------------------

--
-- Table structure for table `supsup_categories`
--

CREATE TABLE `supsup_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) NOT NULL,
  `name_en` varchar(191) NOT NULL,
  `sub_category` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sup_categories`
--

CREATE TABLE `sup_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) NOT NULL,
  `name_en` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) NOT NULL,
  `name_en` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags_products`
--

CREATE TABLE `tags_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone_number` varchar(191) DEFAULT NULL,
  `whatsapp_number` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `email_leads` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone_number`, `whatsapp_number`, `photo`, `active`, `created_by`, `level`, `deleted_at`, `deleted_by`, `email`, `email_leads`, `address`, `country`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'super_admin@app.com', NULL, NULL, NULL, NULL, '$2y$12$cCYRxBLZvibftuI2XQfOueucD8avZ9Y1OvLUZfGluxztLlzHkn6fm', NULL, '2024-05-14 09:18:26', '2024-05-14 09:18:26'),
(2, 'محمد حسين', '01157809060', NULL, '1715689523PzX45jA9NJ.download.jpeg', 1, 1, NULL, NULL, NULL, 'user@app.com', NULL, NULL, NULL, NULL, '$2y$12$N5e2gHD.LC7H6aC/TUayrewCcKqOgda.p0pDwAdYcv/32upBUNjyW', NULL, '2024-05-14 09:25:23', '2024-05-19 11:17:06'),
(7, 'عبدالرحمن محمود 2', '77777777', NULL, '', 1, 1, NULL, NULL, NULL, 'user2@app.com', NULL, NULL, NULL, NULL, '$2y$12$SJBqRHcY9/Myczh/DKaRdOQxj/zU854Up7sipcKSEtkQFqcQmzs2e', NULL, '2024-05-20 07:29:49', '2024-05-20 08:40:21'),
(8, 'صالح محمد النجار', '123654789', NULL, '', 1, 1, NULL, NULL, NULL, 'user3@app.com', NULL, NULL, NULL, NULL, '$2y$12$eTtwNx8bLOYTQVVRzy8JEeAfg7LxjFQ/XPP1J44WVLd6bt/QbPtp.', NULL, '2024-05-20 08:41:19', '2024-05-20 08:41:19'),
(9, 'مصطفي عبده علي', '1236547896', NULL, '', 1, 1, NULL, NULL, NULL, 'user4@app.com', NULL, NULL, NULL, NULL, '$2y$12$G73wDNL1jq6DVrA1wlbSOObDe6ykCozDNkrfVOZnOm5PFpTyWGNKC', NULL, '2024-05-22 04:29:47', '2024-05-22 04:29:47'),
(10, 'مصطفي فهمي', '01157809060', NULL, '', 1, 1, NULL, NULL, NULL, 'user5@app.com', NULL, NULL, NULL, NULL, '$2y$12$pKRb4nmUTmhCY85ZeF/nseJeHGW/I2H/j.0h.FTH0QAPSiukSdE/q', NULL, '2024-05-22 04:30:13', '2024-05-22 04:30:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`),
  ADD KEY `subject` (`subject_id`,`subject_type`),
  ADD KEY `causer` (`causer_id`,`causer_type`);

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_code_unique` (`code`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_code_unique` (`code`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fairs`
--
ALTER TABLE `fairs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fair_attachments`
--
ALTER TABLE `fair_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fair_media`
--
ALTER TABLE `fair_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_photos`
--
ALTER TABLE `product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projects_code_unique` (`code`);

--
-- Indexes for table `project_files`
--
ALTER TABLE `project_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_items`
--
ALTER TABLE `project_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_profits`
--
ALTER TABLE `project_profits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_subcontractors`
--
ALTER TABLE `project_subcontractors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_users`
--
ALTER TABLE `project_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revenues`
--
ALTER TABLE `revenues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `revenues_code_unique` (`code`);

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
-- Indexes for table `safes`
--
ALTER TABLE `safes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `safe_transfers`
--
ALTER TABLE `safe_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcontractors`
--
ALTER TABLE `subcontractors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subcontractors_code_unique` (`code`);

--
-- Indexes for table `supsup_categories`
--
ALTER TABLE `supsup_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sup_categories`
--
ALTER TABLE `sup_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags_products`
--
ALTER TABLE `tags_products`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fairs`
--
ALTER TABLE `fairs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fair_attachments`
--
ALTER TABLE `fair_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fair_media`
--
ALTER TABLE `fair_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_photos`
--
ALTER TABLE `product_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project_files`
--
ALTER TABLE `project_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_items`
--
ALTER TABLE `project_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_profits`
--
ALTER TABLE `project_profits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_subcontractors`
--
ALTER TABLE `project_subcontractors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project_users`
--
ALTER TABLE `project_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `revenues`
--
ALTER TABLE `revenues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `safes`
--
ALTER TABLE `safes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `safe_transfers`
--
ALTER TABLE `safe_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcontractors`
--
ALTER TABLE `subcontractors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supsup_categories`
--
ALTER TABLE `supsup_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sup_categories`
--
ALTER TABLE `sup_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags_products`
--
ALTER TABLE `tags_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

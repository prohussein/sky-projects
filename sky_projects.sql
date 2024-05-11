-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 11, 2024 at 10:40 PM
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
(2, 'حفار 60', 750000.00, 'properties', NULL, 1, 'حفار لشغل اسوان', NULL, '2024-01-10 09:15:45', '2024-01-10 09:15:45'),
(3, 'محمد حسين', 5000.00, 'properties', NULL, 1, 'حفار لشغل اسوان', NULL, '2024-03-27 01:59:31', '2024-03-27 01:59:31'),
(4, 'محمد حسين', 5000.00, 'properties', NULL, 1, 'حفار لشغل اسوان', NULL, '2024-03-27 02:12:41', '2024-03-27 02:12:41'),
(7, 'حفار 60', 500000.00, 'properties', NULL, 1, 'حفار لشغل اسوان', NULL, '2024-03-29 10:37:00', '2024-03-29 10:37:00'),
(13, 'محمد علي', 250.00, 'properties', NULL, 1, 'حفار لشغل اسوان', NULL, '2024-04-11 18:46:56', '2024-04-11 18:46:56'),
(14, 'محمد علي', 250.00, 'cash_money', NULL, 1, 'مبلغ الشراكة', NULL, '2024-04-11 18:47:23', '2024-04-11 18:47:23'),
(18, 'Mony', 5000.00, 'cash', 2, 1, NULL, '', '2024-05-11 12:11:11', '2024-05-11 12:11:29'),
(19, 'محمد حسين', 5000.00, 'cash', 1, 1, NULL, '', '2024-05-11 12:15:14', '2024-05-11 12:15:14');

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

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_ar`, `name_en`, `photo`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'UPVC', 'UPVC', '1690734365jdext9Ihu7.jpg', NULL, '2023-07-30 11:59:35', '2023-07-30 20:26:05'),
(2, 'ِشيش حصير', 'Rolling Shutters', '1690734538hiwpSIrSEJ.jpg', NULL, '2023-07-30 20:28:58', '2023-07-30 20:28:58'),
(3, 'كبائن شاور', 'Shower Cabins', '1690734609Og2Sgr0Pco.jpeg', NULL, '2023-07-30 20:30:09', '2023-07-30 20:30:09'),
(4, 'ستائر مكتبية', 'Office curtains', '1690802763G95mxZIuih.jpeg', NULL, '2023-07-31 15:26:03', '2023-07-31 15:26:03'),
(5, 'ابواب غرف', 'Room Doors', '16908028518K2TAuwyfz.jpg', NULL, '2023-07-31 15:27:31', '2023-07-31 15:27:31'),
(6, 'ابواب مصفحة', 'Armored doors', '1690803057iMY4KJWwXj.jpg', NULL, '2023-07-31 15:30:57', '2023-07-31 15:30:57');

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
(1, 'محمد حسين', 'cust-1', '01157809060', 'محمد حسين', 0.00, 'الحي الاول مدينة العبور, الشباب مدينة العبور', '2024-01-02 03:57:48', '2024-01-02 03:57:48'),
(2, 'شركة المياه', 'cust-2', '2345677888', 'محمد عباس', 0.00, 'كوم امبو', '2024-01-09 07:35:37', '2024-04-10 15:53:30');

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `code`, `phone`, `start_date`, `address`, `file`, `type`, `notes`, `created_at`, `updated_at`) VALUES
(2, 'محمد حسين', 'emp-1', '01157809060', '2024-01-01', 'الحي الاول مدينة العبور, الشباب مدينة العبور', '', 'temp', NULL, '2024-01-09 06:16:23', '2024-01-09 06:16:23');

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
  `file` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `date`, `reference`, `amount`, `note`, `cat_id`, `created_at`, `updated_at`, `type`, `safe_id`, `project_id`, `subcontractor_id`, `user_id`, `employee_id`, `material_name`, `material_qty`, `file`) VALUES
(1, '2024-05-08', NULL, 4000.00, 'test', NULL, '2024-05-08 09:05:32', '2024-05-11 11:19:14', 'materials', 4, 1, NULL, 1, NULL, 'مواسير', 500.00, '663e1bda3537d.pdf'),
(3, '2024-05-09', NULL, 500.00, NULL, NULL, '2024-05-08 11:32:49', '2024-05-11 11:22:03', 'materials', 5, 1, NULL, 1, NULL, 'new', 8.00, ''),
(5, '2024-05-08', NULL, 1200.00, NULL, NULL, '2024-05-08 11:33:34', '2024-05-11 11:53:49', 'other', 4, 1, NULL, 1, NULL, NULL, NULL, '663f2626d00cd.pdf'),
(6, '2024-05-09', NULL, 5000.00, 'رمل من المحجر', 7, '2024-05-09 07:44:43', '2024-05-09 07:44:43', 'general', 1, NULL, NULL, NULL, NULL, NULL, NULL, '663ca91b6d9dc.pdf'),
(7, '2024-05-09', NULL, 5000.00, 'اجازة عيد الفطر', 7, '2024-05-09 09:41:49', '2024-05-09 09:53:02', 'general', 5, NULL, NULL, NULL, NULL, NULL, NULL, '663cc72e7bf0c.pdf'),
(10, '2024-05-11', '50', 50.00, NULL, NULL, '2024-05-11 04:24:34', '2024-05-11 04:24:34', 'subcontractor', 4, 1, 7, 1, NULL, NULL, NULL, '663f1d32d859b.pdf'),
(11, '2024-05-11', '250', 500.00, NULL, NULL, '2024-05-11 04:29:18', '2024-05-11 11:22:41', 'subcontractor', 4, 1, 7, 1, NULL, NULL, NULL, '663f1e4eae52a.pdf'),
(12, '2024-05-11', NULL, 150.00, 'd', NULL, '2024-05-11 04:36:22', '2024-05-11 11:41:33', 'tempwages', 4, 1, NULL, 1, 2, NULL, NULL, '663f1ff6d29fc.pdf'),
(13, '2024-05-11', NULL, 50.00, 'f', NULL, '2024-05-11 05:00:57', '2024-05-11 11:54:35', 'other', 3, 1, NULL, 1, NULL, NULL, NULL, '663f25b9664f2.pdf'),
(14, '2024-05-11', NULL, 3750.00, 'test', NULL, '2024-05-11 05:18:27', '2024-05-11 05:19:12', 'materials', 4, 1, NULL, 1, NULL, 'new  2', 5.00, '663f29d3b32b6.pdf'),
(15, '2024-05-11', '185', 4500.00, NULL, NULL, '2024-05-11 09:41:30', '2024-05-11 10:01:10', 'subcontractor', 4, 1, 7, 1, NULL, NULL, NULL, ''),
(16, '2024-05-11', NULL, 1050.00, '85', NULL, '2024-05-11 10:03:06', '2024-05-11 10:03:06', 'tempwages', 4, 1, NULL, 1, 2, NULL, NULL, '');

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
(52, '2024_05_11_160251_create_project_ptofits_table', 21);

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

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `key`, `name_ar`, `name_en`, `content_en`, `content_ar`, `photo`, `meta_keywords`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, NULL, 'أيهما أفضل الألومنيوم أم البي في سي (upvc)؟', 'UPVC', '<p>Although Alumetal is a more durable material, UPVC is also a more durable material. If you are looking for windows that you want to virtually install and then forget about, investing in uPVC windows will definitely be a step in the right direction for you.</p>\r\n\r\n<p>Weather and insect resistance<br />\r\nPVC doors and windows do not rust and are not affected by moisture and heat, thus saving you maintenance. As for aluminum, it needs to be repainted after a while, with the possibility of peeling, easy scratching, and color fading, as it is affected by water and moisture that contain salts. Therefore, PVC is more suitable and better for coastal areas close to seas and rivers.</p>\r\n\r\n<p>thermal insulation<br />\r\nThe upvc windows and profiles are of the best quality, because they are characterized by the presence of additional chambers inside the outer frame and the opening cover, which gives these high-quality profiles along with the inherent strength and durability and the ability to fully thermally insulate. On the other hand, aluminum windows may turn out to be stronger in terms of being metal. But it achieves a &ldquo;thermal break&rdquo; through the presence of a thermal strip of polyamide separating the inner and outer frame, which means that it is a good conductor of heat, which means that you will suffer from excessive heat in the summer and extreme cold in the winter, and this was the difference between Alumetal and PVC in terms of thermal insulation.</p>\r\n\r\n<p>The life span<br />\r\nIn general, upvc sectors are sectors with a long life span, as a ten-year guarantee is obtained with these sectors, and another proof of this is that water pipes that last for many years and years are made of upvc, which means that it is a material with a long life span, unlike alumetal which is highly susceptible to wear and tear over time.</p>\r\n\r\n<p><br />\r\nmaintenance<br />\r\nLike most materials, PVCU and aluminum need to be cleaned every now and then with a damp cloth to remove any dirt, but that&#39;s about it. It never needs to be repainted or treated, but alumetal may need maintenance from time to time, especially because it is greatly affected by climatic changes and is highly susceptible to corrosion and damage, and this was the difference between alumetal and pvc in terms of maintenance.</p>\r\n\r\n<p>The difference between aluminum and PVC in terms of cost<br />\r\nDue to manufacturing costs, as well as the type of material, installing an aluminum window is usually much more expensive than installing a uPVC window.<br />\r\nAlthough Alumetal is a more durable material, UPVC is also a more durable material.<br />\r\nIf you are looking for windows that you actually want to install and then forget about, investing in uPVC windows will definitely be a step in the right direction for you.<br />\r\nUPVC windows are offered at a more affordable price than aluminum windows, but they also have a surprisingly long lifespan.<br />\r\nUPVC windows are highly resistant to mold, and uPVC windows are ideal for those looking to install windows in a medium-sized building.</p>', '<p dir=\"rtl\">على الرغم&nbsp;<strong>من</strong>&nbsp;أن الالوميتال مادة أكثر قدرة على التحمل، إلا أن اليو بي في سي مادة أكثر تحملًا&nbsp;<strong>هي</strong>&nbsp;الأخرى. إذا كنت تبحث عن نوافذ تريد تثبيتها فعليًا ثم نسيانها ، فإن الاستثمار في نوافذ&nbsp;<strong>uPVC</strong>&nbsp;سيكون بالتأكيد خطوة في الاتجاه الصحيح بالنسبة لك.</p>\r\n\r\n<h3 dir=\"rtl\">مقاومة العوامل الجوية و الحشرات</h3>\r\n\r\n<p dir=\"rtl\">أبواب وشبابيك PVC لا تصدأ ولا تتأثر بالرطوبة والحرارة وبالتالى توفر عليك الصيانه. أما الألمونيوم يحتاج إلى إعادة طلاء بعد فترة مع إمكانية التقشير و سهولة الخدش و بهتان اللون حيث أنه يتأثر بالمياه و الرطوبة التى تحتوى على أملاح. ولذلك الـ pvc أنسب وأفضل للمناطق الساحلية القريبه من البحار والأنهار.</p>\r\n\r\n<ul dir=\"rtl\">\r\n	<li>\r\n	<h3 style=\"text-align:right\">العزل الحراري</h3>\r\n	</li>\r\n</ul>\r\n\r\n<p dir=\"rtl\">تعتبر نوافذ وقطاعات&nbsp; upvc ذات الجودة الأفضل&nbsp; وذلك لأنها تتميز بوجود غرف إضافية داخل الإطار الخارجي والغطاء الافتتاحي، مما يعطي هذه القطاعات ذات الجودة العالية بجانب القوة والمتانة المتأصلة والقدرة على العزل الحراري التام، أما على الجانب الاخر فقد يتضح أن نوافذ الألمنيوم أقوى من حيث كونها معدنًا ولكنها تحقق &ldquo;كسرًا حراريًا&rdquo; من خلال وجود شريط حراري من مادة البولي أميد يفصل بين الإطار الداخلي والخارجي، مما يعني أنها موصلة جيدة للحرارة مما يعني أنك ستعاني من الحرارة الزائدة في الصيف والبرد الشديد في الشتاء,وهذا كان الفرق بين الالوميتال و pvc من حيث العزل الحراري.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<h3 dir=\"rtl\" style=\"text-align:right\">العمر الافتراضي</h3>\r\n	</li>\r\n</ul>\r\n\r\n<p dir=\"rtl\">بشكل عام تعتبر قطاعات upvc&nbsp; هي القطاعات ذات العمر الافتراضي الطويل حيث يتم الحصول على ضمان لمدة&nbsp; عشر سنوات مع هذه القطاعات، والدليل الآخر على هذا أن مواسير المياه التي تستمر لسنوات وسنوات عديدة مصنعة من upvc مما يعني أنها مادة ذات عمر افتراضي طويل، على عكس الالوميتال الذي يكون عرضة بشكل كبير للتآكل والتلف مع مرور الوقت.<br />\r\n&nbsp;</p>\r\n\r\n<ul dir=\"rtl\">\r\n	<li>\r\n	<h3 style=\"text-align:right\">الصيانة</h3>\r\n	</li>\r\n</ul>\r\n\r\n<p dir=\"rtl\">مثل معظم المواد ، يحتاج PVCU والالمنيوم للتنظيف بين الحين والآخر بقطعة قماش مبللة لإزالة أي أوساخ ، ولكن هذا كل شيء. لا تحتاج أبدًا إلى إعادة طلاءها أو معالجتها، ولكن قد يحتاج الالوميتال إلى صيانة من حين لآخر خاصة لانه يتأثر بشكل كبير بالتغيرات المناخية ويكون عرضة بشكل كبير للتآكل والتلف,وهذا كان الفرق بين الالوميتال و pvc من حيث الصيانة.</p>\r\n\r\n<h2 dir=\"rtl\">الفرق بين الألمنيوم و pvc من حيث التكلفة</h2>\r\n\r\n<ul>\r\n	<li dir=\"rtl\" style=\"text-align:right\">نظرًا لتكاليف التصنيع ، بالإضافة إلى نوع الخامة ، فإن تركيب نافذة مصنوعة من الألمنيوم عادة ما يكون أغلى بكثير من تركيب نافذة مصنوعة من uPVC..</li>\r\n	<li dir=\"rtl\" style=\"text-align:right\">على الرغم من أن الالوميتال&nbsp; مادة أكثر قدرة على التحمل، إلا أن اليو بي في سي مادة أكثر تحملًا هي الأخرى.</li>\r\n	<li dir=\"rtl\" style=\"text-align:right\">إذا كنت تبحث عن نوافذ تريد تثبيتها فعليًا ثم نسيانها ، فإن الاستثمار في نوافذ uPVC سيكون بالتأكيد خطوة في الاتجاه الصحيح بالنسبة لك.</li>\r\n	<li dir=\"rtl\" style=\"text-align:right\">نوافذ upvc تقدم بأسعار معقولة أكثر من نوافذ الألمنيوم ، ولكن لها أيضًا عمر طويل بشكل مدهش.</li>\r\n	<li dir=\"rtl\" style=\"text-align:right\">نوافذ اليو بي في سي تتميز مقاومتها العالية لل<a href=\"https://ar.wikipedia.org/wiki/%D8%B9%D9%81%D9%86\" rel=\"noopener\" target=\"_blank\">عفن</a>&nbsp;، وتعتبر نوافذ uPVC مثالية لأولئك الذين يتطلعون إلى تثبيت النوافذ في مبنى متوسط ​​الحجم.</li>\r\n</ul>', '16908016757q5TsHZdRV.jpg', 'UPVC', 'أيهما أفضل الألومنيوم أم البي في سي (upvc)؟', '2023-07-30 12:08:48', '2023-08-01 02:08:55'),
(2, NULL, 'مميزات وعيوب upvc', 'upvc advantages and disadvantages', '<p>UPVC windows features<br />\r\n1. Helps save energy<br />\r\nOne of the most important features of UPVC windows is their ability to insulate heat, as they reflect the heat coming from outside in the summer and prevent the heat from leaking from inside the house to the outside in the winter. Therefore, UPVC windows increase the efficiency of cooling and heating, and save you from running air conditioning or heating for long periods, and save you from exorbitant electricity bills.</p>\r\n\r\n<p>2. Ease and speed of installation<br />\r\nUPVC windows are easy to install when compared to wood or alumetal. Its installation takes a few minutes. The manufacturer usually installs them, as the agreed cost includes both manufacturing and installation. And if you want to maintain or clean it, you can easily remove the UPVC window and install it yourself without the need to seek the help of a specialist.</p>\r\n\r\n<p>3. Easy to clean<br />\r\nUPVC windows are easy to clean, which saves you a lot of effort and time. They are also not affected by daily detergents, so you can simply clean them and polish them with a towel and a light polish. In addition, you can take it off yourself to polish it and install it again.</p>\r\n\r\n<p>4. Durability and no need for periodic maintenance<br />\r\nUPVC windows are resistant to high humidity and various weather factors. So it does not rust or rot. UPVC windows are also resistant to shocks, scratches and corrosion. All these features make it do not need regular maintenance. It is more durable and longevity than wood and alumetal, which saves you from spending more money on maintenance and care.</p>\r\n\r\n<p>5. Prevent dust and noise leakage<br />\r\nOne of the most important features of UPVC windows is their protection from air and sound pollution. They prevent dust from entering the house to a large extent. It is also tightly sealed, preventing water from entering the house also in the event of heavy rain.</p>\r\n\r\n<p>UPVC windows also provide you with a sense of calm inside your home. Whatever the noise outside the house, UPVC windows prevent it from leaking into the house. Where it has the ability to insulate sound just as it insulates heat.</p>\r\n\r\n<p>6. Variety of shapes and sizes<br />\r\nUPVC window makers provide sectors in different shapes. Therefore, you can specify the specifications that you need in terms of frame colors or the colors of the glass used and its type, whether double or single, reflective or opaque. You can also choose the opening system that suits you, whether it is tractor or hinge, and other opening systems.</p>\r\n\r\n<p>The unit price is determined according to the specifications that you choose for both the frame and the glass. Prices vary between different colors and types.</p>\r\n\r\n<p>7. Long years warranty<br />\r\nThe warranty years for UPVC windows vary according to the manufacturer and the specifications of the window you choose. But you usually get a guarantee of up to ten years and twenty years as well, especially when the UPVC sector is of high quality.</p>\r\n\r\n<p>There is no doubt that the existence of the warranty gives you a sense of reassurance when purchasing, especially with regard to manufacturing defects that may appear with the passage of time.</p>\r\n\r\n<p>Disadvantages of UPVC windows<br />\r\n1. It is not environmentally friendly<br />\r\nPoly chloride vinyl, which is used to manufacture UPVC windows, is completely chemical. The manufacturing process itself depends entirely on chemical processes and reactions. Of course, these chemicals and processes leave a harmful effect on the environment. If you are a supporter of environmental conservation, perhaps it is more appropriate to choose wooden windows.</p>\r\n\r\n<p>2. The quality of UPVC windows varies from one company to another<br />\r\nWith the increasing demand for UPVC windows, the number of companies and factories that manufacture and supply them to customers has increased dramatically. Of course, quality varies and varies in degree between companies and suppliers. Which makes the customer lost and confused not knowing which one is the best quality and durability. Therefore, we advise you to investigate well and search for evaluation and experiences of other customers with the supplier or company that you wish to purchase from.</p>', '<h1 dir=\"rtl\" style=\"text-align:center\"><span style=\"font-family:Comic Sans MS,cursive\">مميزات شبابيك UPVC</span></h1>\r\n\r\n<h3 dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\"><strong>1. يساعد على توفير الطاقة</strong></span></h3>\r\n\r\n<p dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\">من اهم مميزات نوافذ يو بي في سي (UPVC ) هي فدرتها على عزل الحرارة ،حيث تعكس الحرارة القادمة من الخارج في الصيف و تمنع تسرب الحرارة من داخل البيت الى خارجه في الشتاء. لذا ترفع&nbsp; نوافذ UPVC من كفاءة التبريد و التدفئة ، و توفر عليك تشغيل التكييف او المدفأة لفترات طويلة و ترحمك من فواتير الكهرباء الباهظة.</span></p>\r\n\r\n<hr />\r\n<h3 dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\"><strong>2. سهولة و سرعة التركيب</strong></span></h3>\r\n\r\n<p dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\">تتميز شبابيك UPVC بسهولة التركيب عند مقارنتها بالخشب او الالوميتال. يستغرق تركيبها دقائق معدودة . عادة ما تقوم الشركة المصنعة بتركيبها ،حيث ان التكلفة المتفق عليها تشمل كلا من التصنيع و التركيب. و في حال أردت صيانتها او تنظيفها يمكنك خلع شباك UPVC و تركيبه بنفسك بسهولة دون الحاجة الى الاستعانة بمختص.</span></p>\r\n\r\n<h3 dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\"><strong>3. سهولة التنظيف&nbsp;</strong></span></h3>\r\n\r\n<p dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\">نوافذ اليو بي في سي سهلة التنظيف، مما يوفر عليك الكثير من المجهود و الوقت.كما أنها لا تتأثر بالمنظفات اليومية، فيمكنك بكل بساطة نتظيفها و تلميعها بفوطة و ملمع خفيف. بالاضافة الى انه يمكنك خلعه بنفسك لتلميعه و تركيبه مرة اخرى.</span></p>\r\n\r\n<hr />\r\n<h3 dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\"><strong>4. المتانة و عدم الحاجة الى صيانة دورية</strong></span></h3>\r\n\r\n<p dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\">شبابيك اليو بي في سي مقاومة للرطوبة العالية و عوامل الطقس المختلفة . لذا فهي لا تصدأ أو تتعفن . شباك اليو بي في سي مقاوم أيضا للصدمات و الخدوش و التاكل. كل هذه المميزات تجعلها لا تحتاج الى صيانة دورية. فهي أكثر متانة و طول عمر من الخشب و الالوميتال، مما يوفر عليك انفاق المزيد من الاموال للصيانة و العناية بها.</span></p>\r\n\r\n<hr />\r\n<h3 dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\">5. منع تسرب الاتربة و الضوضاء</span></h3>\r\n\r\n<p dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\">من أهم مميزات نوافذ UPVC هي حمايتك من التلوث الهوائي و السمعي.حيث تمنع تسرب الاتربة الى داخل البيت بشكل كبير . كما انها محكمة الغلق ،فتمنع تسرب المياه الى داخل المنزل ايضا في حال هطول امطار شديدة.</span></p>\r\n\r\n<p dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\">شبابيك اليو بي في سي توفر لك أيضا الشعور بالهدوء داخل بيتك. مهما كانت الضوضاء التي تعج خارج البيت ، تمنع شبابيك اليو بي في سي تسربها الى داخل المنزل . حيث لها القدرة على عزل الصوت مثلما تعزل الحرارة.</span></p>\r\n\r\n<h3 dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\"><strong>6. تنوع الاشكال و الاحجام</strong></span></h3>\r\n\r\n<p dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\">يوفر صناع شبابيك اليو بي في سي قطاعات باشكال مختلفة. لذا يمكنك تحديد المواصفات التي تحتاجها من حيث الوان الاطار او الوان الزجاج المستخدم و نوعه سواء مزدوج او فردي ، عاكس او معتم . يمكنك أيضا اختيار نظام الفتح المناسب لك سواء كان جرار او مفصلي و غيرها من انظمة الفتح.</span></p>\r\n\r\n<p dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\">يتم تحديد سعر الوحدة على حسب المواصفات التي تختارها لكل من الاطار و الزجاج . الاسعار متفاوتة بين الالوان و الانواع المختلفة.</span></p>\r\n\r\n<p dir=\"rtl\">&nbsp;</p>\r\n\r\n<h3 dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\"><strong>7. ضمان لسنوات طويلة&nbsp;</strong></span></h3>\r\n\r\n<p dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\">تختلف سنوات الضمان&nbsp; شبابيك UPVC بحسب الشركة المصنعة و مواصفات الشباك الذي تختاره . لكن عادة ما تحصل على ضمان يصل الى عشر سنوات و عشرون سنة ايضا ، خاصة عندما يكون قطاع UPVC عالي الجودة.</span></p>\r\n\r\n<p dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\">لاشك ان وجود الضمان يمنحك شعورا بالاطمئنان عند الشراء ، خاصة فيما يتعلق بعيوب الصناعة التي قد تظهر مع مرور الوقت.</span></p>\r\n\r\n<h1 dir=\"rtl\" style=\"text-align:center\"><span style=\"font-family:Comic Sans MS,cursive\"><strong>عيوب شبابيك UPVC</strong></span></h1>\r\n\r\n<h3 dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\"><strong>1. ليست صديقة للبيئة&nbsp;</strong></span></h3>\r\n\r\n<p dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\">مادة &ldquo;البولي كلوريد فينيل poly chloride vinyl&rdquo; التي تستخدم لتصنيع نوافذ اليو بي في سي هي مادة كيميائية تماما . كذلك عملية التصنيع نفسها تعتمد كليا على العمليات و التفاعلات الكيميائية. بالطبع هذه المواد و العمليات الكيميائية تترك اثرا ضارا بالبيئة. ان كنت من انصار الحفاظ على البيئة ، فربما يناسبك اكثر اختيار النوافذ الخشبية.</span></p>\r\n\r\n<hr />\r\n<h3 dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\">2. تفاوت جودة شبابيك UPVC من شركة لاخرى</span></h3>\r\n\r\n<p dir=\"rtl\"><span style=\"font-family:Comic Sans MS,cursive\">مع تزايد الطلب على نوافذ UPVC ،ازداد عدد الشركات و المصانع التي تقوم بتصنيعها و توريدها للعملاء بشدة. و بالطبع تختلف الجودة و تتفاوت في درجتها بين الشركات و الموردين . الامر الذي يجعل العميل تائها و حائرا لا يعرف ايهم افضل جودة و متانة. لذا ننصحك بالتحري جيدا و البحث عن تقييم و تجارب عملاء اخرين مع المورد او الشركة التي ترغب بالشراء منها.</span></p>', '1690815488Y7aS9drp42.jpg', 'مميزات وعيوب upvc   upvc advantages and disadvantages', 'مميزات وعيوب upvc', '2023-07-31 18:58:08', '2023-07-31 18:58:08');

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

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `created_by`, `photo`, `name_ar`, `name_en`, `content_ar`, `content_en`, `active`, `type`, `created_at`, `updated_at`) VALUES
(2, 1, '1690734855NCgSgPDQcy.coop2.jpeg', '2', '2', NULL, NULL, '1', 'client', '2023-07-30 20:34:15', '2023-07-30 20:35:02'),
(3, 1, '16907348922GoTm8B0oa.export.jpeg', '3', '3', NULL, NULL, '1', 'client', '2023-07-30 20:34:52', '2023-07-30 20:34:52'),
(4, 1, '1690734928NdKMut1BWr.headEgypt2.jpeg', '4', '4', NULL, NULL, '1', 'client', '2023-07-30 20:35:28', '2023-07-30 20:35:28'),
(5, 1, '16907349446AMmCSaeN8.hospital.jpeg', '5', '5', NULL, NULL, '1', 'client', '2023-07-30 20:35:44', '2023-07-30 20:35:55'),
(6, 1, '1690734968Id9zXqP5i9.insurance.jpeg', '6', '6', NULL, NULL, '1', 'client', '2023-07-30 20:36:08', '2023-07-30 20:36:08'),
(7, 1, '16908161979N1EBS2uB2.WhatsApp Image 2023-07-31 at 6.09.37 PM.jpeg', 'شريف عبدالفتاح', 'شريف عبدالفتاح', 'من افضل الشركات اللي اتعاملت معاهم مواعيد مظبوطة وشغل نضيف جدا', 'من افضل الشركات اللي اتعاملت معاهم مواعيد مظبوطة وشغل نضيف جدا', '1', 'review', '2023-07-31 19:05:49', '2023-08-03 18:20:18'),
(8, 1, '1690816498bCgHQpR09X.116268495_738585450259071_6630751358137087762_n.jpg', 'حياتى كلها لله', 'حياتى كلها لله', 'أأمن شركة وأكثرهم ثقه وضمان ربنا يبارك فيكم ويسدد خطاكم والي الامام دايماً يارب', 'أأمن شركة وأكثرهم ثقه وضمان ربنا يبارك فيكم ويسدد خطاكم والي الامام دايماً يارب', '1', 'review', '2023-07-31 19:14:58', '2023-08-03 18:20:25');

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

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name_ar`, `name_en`, `cat_id`, `brand_id`, `desc_ar`, `desc_en`, `photo`, `active`, `meta_keywords`, `meta_des`, `created_at`, `updated_at`, `sup_category`, `supsup_category`, `pdf`, `featured`) VALUES
(1, 'كبائن شاور', 'Shower Cabins 52', 3, NULL, '<p>test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;</p>', '<p>test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;</p>', '1690735838KWdyhtxTmY.WhatsApp Image 2023-05-23 at 5.35.13 PM.jpeg', 1, '[{\"value\":\"test description\"}]', 'test description', '2023-07-30 12:01:29', '2023-11-12 15:24:34', NULL, NULL, '1690735838B3OQG9OSzj.jpeg', 1),
(2, 'ستائر مكتبية', 'Rolling Shutters', 2, NULL, '<p>test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;</p>', '<p>test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;</p>', '1690803180Y4NkvKszdX.WhatsApp Image 2023-05-22 at 7.06.01 PM.jpeg', 1, '[{\"value\":\"test description\"}]', 'test description ', '2023-07-30 12:03:38', '2023-08-04 15:19:38', NULL, NULL, NULL, 0),
(3, 'يو بي فى سي', 'UPVC', 1, NULL, '<p>test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;</p>', '<p>test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;</p>', '1690803241FwaQaUrs4p.WhatsApp Image 2023-05-22 at 7.05.22 PM.jpeg', 1, '[{\"value\":\"test description\"}]', 'test description ', '2023-07-30 12:04:15', '2023-07-31 15:34:01', NULL, NULL, NULL, 0),
(5, 'Melyssa Serrano', 'Sylvia Spence', 2, NULL, '<p>test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;</p>', '<p>test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;test description&nbsp;</p>', '1690735914nz6cpoXvps.الشيش-الخصيره.jpg', 0, '[{\"value\":\"test description\"}]', 'test description ', '2023-07-30 12:05:04', '2023-08-04 15:17:52', NULL, NULL, NULL, 1),
(7, 'UPVC', 'UPVC', 1, NULL, '<p>UPVC</p>', '<p>UPVC</p>', '1690811285l64aoQubpE.1.jpg', 1, '[{\"value\":\"UPVC\"}]', 'UPVC', '2023-07-31 17:48:05', '2023-08-01 19:31:54', NULL, NULL, NULL, 1),
(8, 'UPVC', 'UPVC', 1, NULL, '<p>UPVC</p>', '<p>UPVC</p>', '1690811326X2LkSaYsiK.2.jpg', 1, '[{\"value\":\"UPVC\"}]', 'UPVC', '2023-07-31 17:48:46', '2023-08-01 19:32:19', NULL, NULL, NULL, 0),
(9, 'UPVC', 'UPVC', 1, NULL, '<p>UPVC</p>', '<p>UPVC</p>', '1690811348onFRvvNC7G.3.jpg', 1, '[{\"value\":\"UPVC\"}]', 'UPVC', '2023-07-31 17:49:08', '2023-08-04 15:17:50', NULL, NULL, NULL, 1),
(10, 'UPVC', 'UPVC', 1, NULL, '<p>UPVC</p>', '<p>UPVC</p>', '1690811368NZZeKLDwvH.4.jpg', 1, '[{\"value\":\"UPVC\"}]', 'UPVC', '2023-07-31 17:49:28', '2023-08-01 19:31:57', NULL, NULL, NULL, 1),
(11, 'UPVC', 'UPVC', 1, NULL, '<p>UPVC</p>', '<p>UPVC</p>', '1690811394Vfz2fe60BD.6.jpg', 1, '[{\"value\":\"UPVC\"}]', 'UPVC', '2023-07-31 17:49:54', '2023-07-31 17:50:13', NULL, NULL, NULL, 0),
(12, 'UPVC', 'UPVC', 1, NULL, '<p>UPVC</p>', '<p>UPVC</p>', '1690811441LGfGeCCAau.5.jpg', 1, '[{\"value\":\"UPVC\"}]', 'UPVC', '2023-07-31 17:50:41', '2023-08-04 15:18:13', NULL, NULL, NULL, 1),
(13, 'UPVC', 'UPVC', 1, NULL, '<p>UPVC</p>', '<p>UPVC</p>', '1690811462IgYoo0C0Yv.7.jpg', 1, '[{\"value\":\"UPVC\"}]', 'UPVC', '2023-07-31 17:51:03', '2023-07-31 17:53:48', NULL, NULL, NULL, 0),
(14, 'UPVC', 'UPVC', 1, NULL, '<p>UPVC</p>', '<p>UPVC</p>', '1690811490sRH5ZUJo2A.9.jpg', 1, '[{\"value\":\"UPVC\"}]', 'UPVC', '2023-07-31 17:51:30', '2023-08-01 19:29:38', NULL, NULL, NULL, 1),
(16, 'UPVC', 'UPVC', 1, NULL, '<p>UPVC</p>', '<p>UPVC</p>', '1690811614XoYpcpc79p.10.jpg', 1, '[{\"value\":\"UPVC\"}]', 'UPVC', '2023-07-31 17:53:34', '2023-07-31 17:53:51', NULL, NULL, NULL, 0),
(17, 'ِشيش حصير', 'Rolling Shutters', 2, NULL, '<p>ِشيش حصير</p>', '<p>Rolling Shutters</p>', '1690811928B6e5eJuVxi.r1.jpg', 1, '[{\"value\":\"ِشيش حصير\"},{\"value\":\"Rolling Shutters\"}]', 'ِشيش حصير Rolling Shutters', '2023-07-31 17:58:48', '2023-08-04 15:18:05', NULL, NULL, NULL, 0),
(18, 'ِشيش حصير', 'Rolling Shutters', 2, NULL, '<p>ِشيش حصير</p>', '<p>Rolling Shutters</p>', '1690811982NMVL5L8Mkh.New.jpg', 1, '[{\"value\":\"ِشيش حصير\"},{\"value\":\"Rolling Shutters\"}]', 'ِشيش حصير Rolling Shutters', '2023-07-31 17:59:42', '2023-08-01 19:29:42', NULL, NULL, NULL, 1),
(20, 'ِشيش حصير', 'Rolling Shutters', 2, NULL, '<p>ِشيش حصير</p>', '<p>Rolling Shutters</p>', '169081220180z9rBvS3A.ad1.jpg', 1, '[{\"value\":\"ِشيش حصير\"},{\"value\":\"Rolling Shutters\"}]', 'ِشيش حصير Rolling Shutters', '2023-07-31 18:03:21', '2023-08-01 19:29:42', NULL, NULL, NULL, 1),
(22, 'شيش حصير', 'Rolling Shutters', 2, NULL, '<p>شيش حصير</p>', '<p>Rolling Shutters</p>', '1690837426YFXJNGZimx.شيش-1.jpg', 1, '[{\"value\":\"Rolling Shutters\"},{\"value\":\"شيش حصير\"}]', 'Rolling Shutters\r\nشيش حصير', '2023-08-01 01:03:46', '2023-08-01 01:03:46', NULL, NULL, NULL, 0),
(23, 'شيش حصير', 'Rolling Shutters', 2, NULL, '<p>شيش حصير</p>', '<p>Rolling Shutters</p>', '1690837498g9QiKMlBto.شيش-2.jpg', 1, '[{\"value\":\"Rolling Shutters\\r\\nشيش حصير\"}]', 'Rolling Shutters\r\nشيش حصير', '2023-08-01 01:04:58', '2023-08-01 01:04:58', NULL, NULL, NULL, 0),
(24, 'شيش حصير', 'Rolling Shutters', 2, NULL, '<p>شيش حصير</p>', '<p>Rolling Shutters</p>', '1690837590ixsWLtQL7G.شيش-3.jpg', 1, '[{\"value\":\"Rolling Shutters\\r\\nشيش حصير\"}]', 'Rolling Shutters\r\nشيش حصير', '2023-08-01 01:06:30', '2023-08-01 01:07:05', NULL, NULL, NULL, 0),
(25, 'شيش حصير', 'Rolling Shutters', 2, NULL, '<p>شيش حصير</p>', '<p>Rolling Shutters</p>', '1690837703ujgoexa7DI.شيش-4.jpg', 1, '[{\"value\":\"Rolling Shutters\\r\\nشيش حصير\"}]', 'Rolling Shutters\r\nشيش حصير', '2023-08-01 01:08:23', '2023-08-01 01:08:23', NULL, NULL, NULL, 0),
(26, 'شيش حصير', 'Rolling Shutters', 2, NULL, '<p>شيش حصير</p>', '<p>Rolling Shutters</p>', '1690837770Tou7nTgCNi.شيش-5.jpg', 1, '[{\"value\":\"Rolling Shutters\\r\\nشيش حصير\"}]', 'Rolling Shutters\r\nشيش حصير', '2023-08-01 01:09:30', '2023-08-01 01:09:30', NULL, NULL, NULL, 0),
(27, 'شيش حصير', 'Rolling Shutters', 2, NULL, '<p>شيش حصير</p>', '<p>Rolling Shutters</p>', '1690837833ks4LRwKau2.شيش-6.jpg', 1, '[{\"value\":\"Rolling Shutters\\r\\nشيش حصير\"}]', 'Rolling Shutters\r\nشيش حصير', '2023-08-01 01:10:33', '2023-08-01 01:10:33', NULL, NULL, NULL, 0),
(28, 'شيش حصير', 'Rolling Shutters', 2, NULL, '<p>شيش حصير</p>', '<p>Rolling Shutters</p>', '1690837898KFq3maK0Yo.شيش-7.jpg', 1, '[{\"value\":\"Rolling Shutters\\r\\nشيش حصير\"}]', 'Rolling Shutters\r\nشيش حصير', '2023-08-01 01:11:38', '2023-08-01 01:11:38', NULL, NULL, NULL, 0),
(29, 'شيش حصير', 'Rolling Shutters', 2, NULL, '<p>شيش حصير</p>', '<p>Rolling Shutters</p>', '1690837954tLaIomXfuI.شيش-8.jpg', 1, '[{\"value\":\"Rolling Shutters\\r\\nشيش حصير\"}]', 'Rolling Shutters\r\nشيش حصير', '2023-08-01 01:12:34', '2023-08-01 01:12:34', NULL, NULL, NULL, 0),
(30, 'شيش حصير', 'Rolling Shutters', 2, NULL, '<p>شيش حصير</p>', '<p>Rolling Shutters</p>', '1690838025vGhH8wWPO5.شيش-9.jpg', 1, '[{\"value\":\"Rolling Shutters\\r\\nشيش حصير\"}]', 'Rolling Shutters\r\nشيش حصير', '2023-08-01 01:13:45', '2023-08-01 01:13:45', NULL, NULL, NULL, 0),
(31, 'شيش حصير', 'Rolling Shutters', 2, NULL, '<p>شيش حصير</p>', '<p>Rolling Shutters</p>', '1690838078P2dUwRAYGj.شيش-10.jpg', 1, '[{\"value\":\"Rolling Shutters\\r\\nشيش حصير\"}]', 'Rolling Shutters\r\nشيش حصير', '2023-08-01 01:14:38', '2023-08-01 01:14:38', NULL, NULL, NULL, 0),
(32, 'ستائر', 'Office curtains', 4, NULL, '<p>ستائر</p>', '<p>Office curtains</p>', '16908400623x8LXZkCVs.ستائر-1.jpg', 1, '[{\"value\":\"Office curtains\\r\\nستائر\"}]', 'Office curtains\r\nستائر', '2023-08-01 01:47:42', '2023-08-01 01:47:42', NULL, NULL, NULL, 0),
(33, 'ستائر', 'Office curtains', 4, NULL, '<p>ستائر</p>', '<p>Office curtains</p>', '16908401253ZaReWlym5.ستائر-2.jpg', 1, '[{\"value\":\"Office curtains\\r\\nستائر\"}]', 'Office curtains\r\nستائر', '2023-08-01 01:48:45', '2023-08-01 01:48:45', NULL, NULL, NULL, 0),
(34, 'ستائر', 'Office curtains', 4, NULL, '<p>ستائر</p>', '<p>Office curtains</p>', '1690840189GnEWmY0REa.ستائر-3.jpg', 1, '[{\"value\":\"Office curtains\\r\\nستائر\"}]', 'Office curtains\r\nستائر', '2023-08-01 01:49:49', '2023-08-01 01:49:49', NULL, NULL, NULL, 0),
(35, 'ستائر', 'Office curtains', 4, NULL, '<p>ستائر</p>', '<p>Office curtains</p>', '1690840245ouWxMquMMo.ستائر-4.jpg', 1, '[{\"value\":\"Office curtains\\r\\nستائر\"}]', 'Office curtains\r\nستائر', '2023-08-01 01:50:45', '2023-08-01 01:52:17', NULL, NULL, NULL, 0),
(36, 'ستائر', 'Office curtains', 4, NULL, '<p>ستائر</p>', '<p>Office curtains</p>', '1690840302Ks1Z7NfWi1.ستائر-5.jpg', 1, '[{\"value\":\"Office curtains\\r\\nستائر\"}]', 'Office curtains\r\nستائر', '2023-08-01 01:51:42', '2023-08-01 01:51:42', NULL, NULL, NULL, 0),
(37, 'ستائر', 'Office curtains', 4, NULL, '<p>ستائر</p>', '<p>Office curtains</p>', '1690840398lSQ5szVLOD.ستائر-6.jpg', 1, '[{\"value\":\"Office curtains\\r\\nستائر\"}]', 'Office curtains\r\nستائر', '2023-08-01 01:53:18', '2023-08-01 01:53:18', NULL, NULL, NULL, 0),
(38, 'ستائر', 'Office curtains', 4, NULL, '<p>ستا\\ر</p>', '<p>Office curtains</p>', '169084044964FqX7ZHvF.ستائر-7.jpg', 1, '[{\"value\":\"Office curtains\\r\\nستائر\"}]', 'Office curtains\r\nستائر', '2023-08-01 01:54:09', '2023-08-04 15:18:22', NULL, NULL, NULL, 0),
(39, 'ستائر', 'Office curtains', 4, NULL, '<p>ستائر</p>', '<p>Office curtains</p>', '1690840498gVQHcHgXgI.ستائر-8.jpg', 0, '[{\"value\":\"Office curtains\\r\\nستائر\"}]', 'Office curtains\r\nستائر', '2023-08-01 01:54:58', '2023-08-01 01:54:58', NULL, NULL, NULL, 0),
(40, 'ستائر', 'Office curtains', 4, NULL, '<p>ستائر</p>', '<p>Office curtains</p>', '1690840546hPN7Lt9MqP.ستائر-9.jpg', 1, '[{\"value\":\"Office curtains\\r\\nستائر\"}]', 'Office curtains\r\nستائر', '2023-08-01 01:55:46', '2023-08-01 01:55:46', NULL, NULL, NULL, 0),
(41, 'ستائر', 'Office curtains', 4, NULL, '<p>ستائر</p>', '<p>Office curtains</p>', '1690840601kbNOr2En7I.ستائر-10.jpg', 1, '[{\"value\":\"Office curtains\\r\\nستائر\"}]', 'Office curtains\r\nستائر', '2023-08-01 01:56:41', '2023-08-04 15:19:28', NULL, NULL, NULL, 0),
(42, 'كبائن شاور', 'Shower Cabins', 3, NULL, '<p>كبائن شاور</p>', '<p>Shower Cabins</p>', '1690842663qLt3mw666E.كبينة-1.jpg', 1, '[{\"value\":\"Shower Cabins\\r\\nكبائن شاور\"}]', 'Shower Cabins\r\nكبائن شاور', '2023-08-01 02:31:03', '2023-08-01 02:31:03', NULL, NULL, NULL, 0),
(43, 'كبائن شاور', 'Shower Cabins', 3, NULL, '<p>كبائن شاور</p>', '<p>Shower Cabins</p>', '1690842722wkqRCdHqiy.كبينة-2.jpg', 1, '[{\"value\":\"Shower Cabins\\r\\nكبائن شاور\"}]', 'Shower Cabins\r\nكبائن شاور', '2023-08-01 02:32:02', '2023-08-01 02:32:02', NULL, NULL, NULL, 0),
(44, 'كبائن شاور', 'Shower Cabins', 3, NULL, '<p>كبائن شاور</p>', '<p>Shower Cabins</p>', '1690842785DlBYFhdpZ5.كبينة-3.jpg', 1, '[{\"value\":\"Shower Cabins\\r\\nكبائن شاور\"}]', 'Shower Cabins\r\nكبائن شاور', '2023-08-01 02:33:05', '2023-08-01 02:33:05', NULL, NULL, NULL, 0),
(45, 'كبائن شاور', 'Shower Cabins', 3, NULL, '<p>كبائن شاور</p>', '<p>Shower Cabins</p>', '169084287466fPn2ay83.كبينة-4.jpg', 1, '[{\"value\":\"Shower Cabins\\r\\nكبائن شاور\"}]', 'Shower Cabins\r\nكبائن شاور', '2023-08-01 02:34:34', '2023-08-01 02:34:34', NULL, NULL, NULL, 0),
(46, 'كبائن شاور', 'Shower Cabins', 3, NULL, '<p>كبائن شاور</p>', '<p>Shower Cabins</p>', '1690842941Bra0h61eQk.كبينة-5.jpg', 1, '[{\"value\":\"Shower Cabins\\r\\nكبائن شاور\"}]', 'Shower Cabins\r\nكبائن شاور', '2023-08-01 02:35:41', '2023-08-01 02:35:41', NULL, NULL, NULL, 0),
(47, 'كبائن شاور', 'Shower Cabins', 3, NULL, '<p>كبائن شاور</p>', '<p>Shower Cabins</p>', '1690842997GxFCJLXCbo.كبينة-6.jpg', 1, '[{\"value\":\"Shower Cabins\\r\\nكبائن شاور\"}]', 'Shower Cabins\r\nكبائن شاور', '2023-08-01 02:36:37', '2023-08-01 02:36:37', NULL, NULL, NULL, 0),
(48, 'كبائن شاور', 'Shower Cabins', 3, NULL, '<p>كبائن شاور</p>', '<p>Shower Cabins</p>', '1690843062ddOlC4QaRs.كبينة-7.jpg', 1, '[{\"value\":\"Shower Cabins\\r\\nكبائن شاور\"}]', 'Shower Cabins\r\nكبائن شاور', '2023-08-01 02:37:42', '2023-08-01 02:37:42', NULL, NULL, NULL, 0),
(49, 'كبائن شاور', 'Shower Cabins', 3, NULL, '<p>كبائن شاور</p>', '<p>Shower Cabins</p>', '1690843120l37cbsvELo.كبينة-8.jpg', 1, '[{\"value\":\"Shower Cabins\\r\\nكبائن شاور\"}]', 'Shower Cabins\r\nكبائن شاور', '2023-08-01 02:38:40', '2023-08-01 02:38:40', NULL, NULL, NULL, 0),
(50, 'كبائن شاور', 'Shower Cabins', 3, NULL, '<p>كبائن شاور</p>', '<p>Shower Cabins</p>', '1690843185yAmijabCv3.كبينة-9.jpg', 1, '[{\"value\":\"Shower Cabins\\r\\nكبائن شاور\"}]', 'Shower Cabins\r\nكبائن شاور', '2023-08-01 02:39:45', '2023-08-04 15:18:35', NULL, NULL, NULL, 1),
(51, 'كبائن شاور', 'Shower Cabins', 3, NULL, '<p>كبائن شاور</p>', '<p>Shower Cabins</p>', '1690843245orxGX6ieFm.كبينة-10.jpg', 1, '[{\"value\":\"Shower Cabins\\r\\nكبائن شاور\"}]', 'Shower Cabins\r\nكبائن شاور', '2023-08-01 02:40:46', '2023-08-01 02:40:46', NULL, NULL, NULL, 0),
(52, 'ابواب', 'Room Doors', 5, NULL, '<p>ابواب</p>', '<p>Room Doors</p>', '1690845566zM7TrvrYPa.باب-1.jpg', 1, '[{\"value\":\"Room Doors\\r\\nابواب\"}]', 'Room Doors\r\nابواب', '2023-08-01 03:19:26', '2023-08-01 03:19:26', NULL, NULL, NULL, 0),
(53, 'ابواب', 'Room Doors', 5, NULL, '<p>ابواب</p>', '<p>Room Doors</p>', '16908456131TrftApWQm.باب-2.jpg', 1, '[{\"value\":\"Room Doors\\r\\nابواب\"}]', 'Room Doors\r\nابواب', '2023-08-01 03:20:13', '2023-08-01 03:20:13', NULL, NULL, NULL, 0),
(54, 'ابواب', 'Room Doors', 5, NULL, '<p>ابواب</p>', '<p>Room Doors</p>', '1690845661S1mXpz4eUz.باب-3.jpg', 1, '[{\"value\":\"Room Doors\\r\\nابواب\"}]', 'Room Doors\r\nابواب', '2023-08-01 03:21:01', '2023-08-04 15:18:44', NULL, NULL, NULL, 1),
(55, 'ابواب', 'Room Doors', 5, NULL, '<p>ابواب</p>', '<p>Room Doors</p>', '1690845702hfmPxC69vr.باب-4.jpg', 1, '[{\"value\":\"Room Doors\\r\\nابواب\"}]', 'Room Doors\r\nابواب', '2023-08-01 03:21:42', '2023-08-01 03:21:42', NULL, NULL, NULL, 0),
(56, 'ابواب', 'Room Doors', 5, NULL, '<p>&nbsp;</p>\r\n\r\n<p>ابواب</p>', '<p>Room Doors</p>', '1690845748KwC2LS6rKw.باب-5.jpg', 1, '[{\"value\":\"Room Doors\\r\\nابواب\"}]', 'Room Doors\r\nابواب', '2023-08-01 03:22:28', '2023-08-01 03:22:28', NULL, NULL, NULL, 0),
(57, 'ابواب', 'Room Doors', 5, NULL, '<p>ابواب</p>', '<p>Room Doors</p>', '1690845787GPR6KfNB4h.باب-6.jpg', 1, '[{\"value\":\"Room Doors\\r\\nابواب\"}]', 'Room Doors\r\nابواب', '2023-08-01 03:23:07', '2023-08-01 03:23:07', NULL, NULL, NULL, 0),
(58, 'ابواب', 'Room Doors', 5, NULL, '<p>ابواب</p>', '<p>Room Doors</p>', '16908458263Xz0t7hpcS.باب-7.jpg', 1, '[{\"value\":\"Room Doors\\r\\nابواب\"}]', 'Room Doors\r\nابواب', '2023-08-01 03:23:46', '2023-08-01 03:23:46', NULL, NULL, NULL, 0),
(59, 'ابواب', 'Room Doors', 5, NULL, '<p>ابواب</p>', '<p>Room Doors</p>', '16908458705arXjDDPpx.باب-8.jpg', 1, '[{\"value\":\"Room Doors\\r\\nابواب\"}]', 'Room Doors\r\nابواب', '2023-08-01 03:24:30', '2023-08-01 03:24:30', NULL, NULL, NULL, 0),
(60, 'ابواب', 'Room Doors', 5, NULL, '<p>ابواب</p>', '<p>Room Doors</p>', '16908459126IWl8Yt8x2.باب-9.jpg', 1, '[{\"value\":\"Room Doors\\r\\nابواب\"}]', 'Room Doors\r\nابواب', '2023-08-01 03:25:12', '2023-08-01 03:25:12', NULL, NULL, NULL, 0),
(61, 'ابواب', 'Room Doors', 5, NULL, '<p>ابواب</p>', '<p>Room Doors</p>', '1690845951oj1lPC7y3u.باب-10.jpg', 1, '[{\"value\":\"Room Doors\\r\\nابواب\"}]', 'Room Doors\r\nابواب', '2023-08-01 03:25:51', '2023-08-01 03:26:27', NULL, NULL, NULL, 0);

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

--
-- Dumping data for table `product_photos`
--

INSERT INTO `product_photos` (`id`, `product_id`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, '169073573864SY1mtmzZ.Ad.jpg', '2023-07-30 20:48:58', '2023-07-30 20:48:58'),
(2, 1, '1690735782utodBLaEvr.WhatsApp Image 2023-05-23 at 5.35.13 PM.jpeg', '2023-07-30 20:49:42', '2023-07-30 20:49:42'),
(3, 1, '169073578257CekepvMT.WhatsApp Image 2023-05-23 at 5.35.14 PM (1).jpeg', '2023-07-30 20:49:42', '2023-07-30 20:49:42'),
(4, 3, '16908110848ZLxe1z2SB.1.jpg', '2023-07-31 17:44:44', '2023-07-31 17:44:44'),
(5, 3, '1690811084OkfdZ66XYn.2.jpg', '2023-07-31 17:44:45', '2023-07-31 17:44:45'),
(6, 3, '1690811085K13Lys8vqR.3.jpg', '2023-07-31 17:44:45', '2023-07-31 17:44:45'),
(7, 3, '1690811085bHcQuSA0c2.4.jpg', '2023-07-31 17:44:45', '2023-07-31 17:44:45'),
(8, 3, '16908110858sbfSpjBr0.5.jpg', '2023-07-31 17:44:45', '2023-07-31 17:44:45'),
(9, 3, '1690811085u7X3kWkvW4.6.jpg', '2023-07-31 17:44:45', '2023-07-31 17:44:45'),
(10, 3, '1690811085v3LPSPXIyl.7.jpg', '2023-07-31 17:44:45', '2023-07-31 17:44:45'),
(11, 3, '1690811085gVjjgnwzQD.8.jpg', '2023-07-31 17:44:45', '2023-07-31 17:44:45'),
(12, 3, '1690811085SpvtPhnPwl.9.jpg', '2023-07-31 17:44:45', '2023-07-31 17:44:45'),
(13, 3, '1690811085kPMGWM88kh.10.jpg', '2023-07-31 17:44:46', '2023-07-31 17:44:46'),
(14, 3, '1690811086vuthnNzEIu.11.jpg', '2023-07-31 17:44:46', '2023-07-31 17:44:46');

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `code`, `name`, `customer_id`, `start_date`, `end_date`, `customer_cost`, `estimated_cost`, `created_at`, `updated_at`) VALUES
(1, 'sky-1', 'sky project', 2, '2023-02-01', '2024-05-31', 10000000.00, 9000000.00, '2024-05-08 09:01:39', '2024-05-08 09:01:39');

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

--
-- Dumping data for table `project_files`
--

INSERT INTO `project_files` (`id`, `name`, `file`, `project_id`, `created_at`, `updated_at`) VALUES
(2, 'محمد حسين 20', '663bdd01b4567.sql', 1, '2024-05-08 16:49:44', '2024-05-08 17:13:53'),
(3, 'index.html', '663bdd3b6cc31.png', 1, '2024-05-08 17:14:51', '2024-05-08 17:14:51');

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

--
-- Dumping data for table `project_items`
--

INSERT INTO `project_items` (`id`, `project_id`, `code`, `name`, `qty`, `cat`, `item_total`, `implement_qty`, `total_implement_qty`, `created_at`, `updated_at`) VALUES
(2, 4, 1, 'البند الاول 2', 1000.00, 5000.00, 1000.00, 500.00, 250.00, '2024-03-09 06:43:05', '2024-03-09 07:08:25'),
(3, 4, 2, 'البند الثاني', 50.00, 10.00, 50.00, 5.00, 25.00, '2024-03-09 07:07:56', '2024-03-09 07:07:56'),
(4, 1, 824318, 'محمد حسين', 50.00, 10.00, 50.00, 8.00, 40.00, '2024-05-08 11:34:14', '2024-05-09 03:19:41');

-- --------------------------------------------------------

--
-- Table structure for table `project_ptofits`
--

CREATE TABLE `project_ptofits` (
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
(1, 1, 7, '2024-05-08', '2024-05-31', 5000.00, '663f1be47103a.pdf', 'fed', '2024-05-08 11:31:30', '2024-05-11 05:30:00');

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
  `total_amount` double(8,2) NOT NULL,
  `safe_id` bigint(20) NOT NULL,
  `tax_type` enum('flat','percent') NOT NULL DEFAULT 'flat',
  `tax_amount` double(8,2) NOT NULL,
  `net_amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `revenues`
--

INSERT INTO `revenues` (`id`, `code`, `customer_id`, `project_id`, `date`, `file`, `total_amount`, `safe_id`, `tax_type`, `tax_amount`, `net_amount`, `created_at`, `updated_at`) VALUES
(3, 'rev-1', 2, 1, '2024-05-08', '663bbef8939ae.pdf', 100000.00, 4, 'flat', 0.00, 100000.00, '2024-05-08 14:53:16', '2024-05-08 15:10:41'),
(4, 'rev-4', 2, 1, '2024-05-08', '663bbdd4acb64.pdf', 10000.00, 4, 'flat', 1000.00, 9000.00, '2024-05-08 15:00:52', '2024-05-08 15:00:52');

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
(4, 'Sales', NULL, NULL, '2023-06-05 13:35:55', '2023-06-06 09:01:12');

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
(1, 3, 'App\\Models\\User');

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `safes`
--

INSERT INTO `safes` (`id`, `name`, `balance`, `type`, `descripton`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'محمد حسين', 5000.00, 'main', 'حفار لشغل اسوان', 2, '2024-03-23 03:33:58', '2024-05-11 12:15:14'),
(2, 'البنك الاهلي', 5000.00, 'main', 'خزنة البنك الاهلي', 2, '2024-03-23 05:02:12', '2024-05-11 12:11:29'),
(3, 'خزنة بنك مصر', 400.00, 'bank', 'خزنة البنك مصر', 2, '2024-03-23 05:02:37', '2024-05-11 11:54:35'),
(4, 'الخزنة الرئيسية', 0.00, 'main', 'الخزنة الرئيسية للشركة', 2, '2024-03-23 07:00:39', '2024-05-11 12:11:29'),
(5, 'حاتم', 50.00, 'custody', 'خزنة', 2, '2024-03-29 10:34:57', '2024-05-11 11:54:35');

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `safe_transfers`
--

INSERT INTO `safe_transfers` (`id`, `from_safe`, `to_safe`, `amount`, `safe_send_blance`, `safe_receive_blance`, `transfer_date`, `added_by`, `notes`, `created_at`, `updated_at`) VALUES
(1, 4, 5, 500.00, 500.00, 500.00, '2024-05-11 17:20:00', 1, NULL, '2024-05-11 11:21:19', '2024-05-11 11:21:19');

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

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title_en`, `title_ar`, `photo`, `description_en`, `description_ar`, `url`, `active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Modern Vision', 'مودرن فيجن', '1690734246ipJ4hcehJh.jpeg', 'UPVC windows and doors - rolling shutters - shower cabins - armored doors', 'شبابيك وأبواب UPVC - شيش حصيرة - كبائن الشاور - ابواب مصفحة', NULL, 1, 1, '2023-07-30 12:06:20', '2023-07-31 18:29:23'),
(3, '55', 'Reprehenderit minim', '1699809973CdcljzledJ.logo wasam final.png', 'Consequatur veniam', 'Dolorem quis et quae', NULL, 1, 1, '2023-11-12 15:26:14', '2023-11-12 15:26:33'),
(4, 'Facebook adds', '20test 52', '1703737717Mxnnj0FSer.home.jpg', 'rr', 'r', NULL, 1, 1, '2023-12-28 02:28:38', '2023-12-28 02:28:38');

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
(5, 'Erin Castaneda', 'cont-1', '+1 (233) 963-3482', 'Similique dolor quas', 0.00, 'Veniam soluta nesci', '659b9a04ef1ce.csv', '2024-01-08 04:39:17', '2024-01-08 04:45:24'),
(6, 'Skyler Bishop', 'cont-6', '+1 (706) 417-1139', 'Vitae nulla asperior', 0.00, 'Sunt magni eu enim o', '', '2024-01-08 08:12:53', '2024-01-08 08:12:53'),
(7, 'علي محمود', 'cont-7', '1235455555', 'علي عنتر', 0.00, 'الحي الاول مدينة العبور, الشباب مدينة العبور', '', '2024-01-09 07:36:19', '2024-01-09 07:36:19');

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
(1, 'admin', '01157809060', NULL, NULL, 1, NULL, NULL, NULL, NULL, 'super_admin@app.com', NULL, NULL, NULL, NULL, '$2y$12$SrC9IDnxL5f0tf.AMcEPc.1Pjjq1OaFPvMb93RTm.WgVig1debHEy', NULL, '2024-03-23 06:42:17', '2024-05-08 06:31:38'),
(2, 'محمد حسين', '01157809060', NULL, NULL, 1, 1, NULL, NULL, NULL, 'admin@app.com', NULL, NULL, NULL, NULL, '$2y$12$fJmWNFK.3eoEEQHYWIbBfOOG6Ir/M4RJ67GFus3d8Jlc7tH/JR8tm', NULL, '2024-05-08 06:32:54', '2024-05-08 06:32:54'),
(3, 'احمد عباس', '01157809060', NULL, NULL, 1, 1, NULL, NULL, NULL, 'dfrf@app.com', NULL, NULL, NULL, NULL, '$2y$12$RIAAor90jIXTqaqV0wbJWupiCCbPPRmF7v7s3mCabfi4KmhaRDLhS', NULL, '2024-05-08 08:58:48', '2024-05-08 08:58:48');

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
-- Indexes for table `project_ptofits`
--
ALTER TABLE `project_ptofits`
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
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `product_photos`
--
ALTER TABLE `product_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project_files`
--
ALTER TABLE `project_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project_items`
--
ALTER TABLE `project_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `project_ptofits`
--
ALTER TABLE `project_ptofits`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revenues`
--
ALTER TABLE `revenues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `safes`
--
ALTER TABLE `safes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `safe_transfers`
--
ALTER TABLE `safe_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subcontractors`
--
ALTER TABLE `subcontractors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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

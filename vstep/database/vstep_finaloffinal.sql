-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2020 at 06:48 AM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vstep`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_ranks`
--

DROP TABLE IF EXISTS `account_ranks`;
CREATE TABLE `account_ranks` (
  `id` int(10) UNSIGNED NOT NULL,
  `point` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_ranks`
--

INSERT INTO `account_ranks` (`id`, `point`, `title`, `color`, `created_at`, `updated_at`) VALUES
(1, 0, 'baby runner', 'black', '2020-01-12 05:27:00', '2020-01-12 05:29:45'),
(2, 100, 'Alan Walker', 'green', '2020-01-12 05:27:45', '2020-01-12 05:27:45'),
(3, 300, 'Mr. Stepper', 'red', '2020-01-12 05:28:20', '2020-01-12 05:28:20');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2020-01-11 02:55:21', '2020-01-11 02:55:21'),
(2, NULL, 1, 'Category 2', 'category-2', '2020-01-11 02:55:21', '2020-01-11 02:55:21');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'FPT Organization', '2020-01-11 08:59:39', '2020-01-11 08:59:39'),
(2, 'Act Brain Vietnam', '2020-01-11 08:59:51', '2020-01-11 08:59:51'),
(3, 'Tường Minh Organization', '2020-01-11 09:00:08', '2020-01-11 09:00:08');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 6),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 7),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 10),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 0, 0, 0, 0, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 14),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 15),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 12),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"column\":4}', 2),
(58, 7, 'location', 'text', 'Location', 1, 1, 1, 1, 1, 1, '{}', 3),
(59, 7, 'description', 'text', 'Description', 0, 0, 1, 1, 1, 1, '{}', 4),
(60, 7, 'type', 'select_dropdown', 'Type', 1, 1, 1, 1, 1, 1, '{\"options\":{\"step\":\"Step Counter\",\"time\":\"Marathon\"}}', 5),
(61, 7, 'start_time', 'time', 'Start Time', 1, 1, 1, 1, 1, 1, '{}', 7),
(63, 7, 'status', 'select_dropdown', 'Status', 1, 0, 1, 1, 1, 1, '{\"options\":{\"pending\":\"Pending\",\"started\":\"Started\",\"ended\":\"Ended\"}}', 11),
(64, 7, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 13),
(65, 7, 'company_id', 'text', 'Company Id', 0, 1, 1, 1, 1, 1, '{}', 14),
(66, 7, 'event_belongsto_user_relationship', 'relationship', 'Creator', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(67, 7, 'event_belongsto_company_relationship', 'relationship', 'Company', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Company\",\"table\":\"companies\",\"type\":\"belongsTo\",\"column\":\"company_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 17),
(68, 8, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(69, 8, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(70, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 16),
(71, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 18),
(72, 7, 'step_amount', 'number', 'Step Amount', 0, 0, 1, 1, 1, 1, '{}', 10),
(73, 1, 'user_belongstomany_event_relationship', 'relationship', 'Events', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Event\",\"table\":\"events\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"user_event\",\"pivot\":\"1\",\"taggable\":\"0\"}', 16),
(74, 1, 'phone', 'number', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 8),
(75, 1, 'birthdate', 'date', 'Birthdate', 0, 1, 1, 1, 1, 1, '{}', 5),
(76, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 0, 0, 0, 0, 1, '{}', 11),
(77, 7, 'event_belongstomany_user_relationship', 'relationship', 'Participants', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"user_event\",\"pivot\":\"1\",\"taggable\":\"0\"}', 19),
(78, 9, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(79, 9, 'event_id', 'number', 'Event Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(80, 9, 'user_id', 'number', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(81, 9, 'total_steps', 'number', 'Total Steps', 1, 1, 1, 1, 1, 1, '{}', 4),
(82, 9, 'step_belongsto_user_relationship', 'relationship', 'User', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(83, 9, 'step_belongsto_event_relationship', 'relationship', 'Event', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Event\",\"table\":\"events\",\"type\":\"belongsTo\",\"column\":\"event_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(84, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 1, 0, 1, '{}', 6),
(85, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(87, 7, 'start_date', 'date', 'Start Date', 1, 1, 1, 1, 1, 1, '{}', 6),
(88, 7, 'end_date', 'date', 'End Date', 1, 1, 1, 1, 1, 1, '{}', 8),
(89, 7, 'end_time', 'time', 'End Time', 1, 1, 1, 1, 1, 1, '{}', 9),
(90, 7, 'distance', 'number', 'Distance', 0, 1, 1, 1, 1, 1, '{}', 10),
(91, 7, 'images', 'multiple_images', 'Images', 0, 0, 1, 1, 1, 1, '{}', 2),
(92, 7, 'start_point', 'text', 'Start Point', 0, 0, 0, 0, 1, 1, '{}', 18),
(93, 7, 'end_point', 'text', 'End Point', 0, 0, 0, 0, 0, 1, '{}', 19),
(94, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(95, 11, 'point', 'text', 'Point', 0, 1, 1, 1, 1, 1, '{}', 2),
(96, 11, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 3),
(97, 11, 'color', 'text', 'Color', 0, 1, 1, 1, 1, 1, '{}', 4);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-01-11 02:55:15', '2020-01-11 09:36:57'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-01-11 02:55:15', '2020-01-11 02:55:15'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2020-01-11 02:55:15', '2020-01-11 02:55:15'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2020-01-11 02:55:21', '2020-01-11 02:55:21'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2020-01-11 02:55:21', '2020-01-11 02:55:21'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(7, 'events', 'events', 'Event', 'Events', NULL, 'App\\Event', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-01-11 08:54:34', '2020-01-12 01:47:27'),
(8, 'companies', 'companies', 'Company', 'Companies', NULL, 'App\\Company', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-01-11 08:57:53', '2020-01-11 08:57:53'),
(9, 'steps', 'steps', 'Step', 'Steps', NULL, 'App\\Step', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-01-11 09:45:16', '2020-01-11 09:48:15'),
(11, 'account_ranks', 'account-ranks', 'Account Rank', 'Account Ranks', NULL, 'App\\AccountRank', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-01-12 05:26:04', '2020-01-12 05:26:04');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `images` text,
  `name` varchar(255) NOT NULL,
  `location` text,
  `description` text,
  `type` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_date` date NOT NULL,
  `end_time` time NOT NULL,
  `distance` double DEFAULT NULL,
  `step_amount` bigint(20) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_point` text,
  `end_point` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `images`, `name`, `location`, `description`, `type`, `start_date`, `start_time`, `end_date`, `end_time`, `distance`, `step_amount`, `status`, `user_id`, `company_id`, `created_at`, `updated_at`, `start_point`, `end_point`) VALUES
(1, '[\"events\\\\January2020\\\\5JsfpkIcgZfwJoU6uxpK.jpg\",\"events\\\\January2020\\\\hGEuT26ETqxx5VnedKWq.jpg\",\"events\\\\January2020\\\\7g6rjQPEo7gKwo6T5ej4.jpg\"]', 'Event 1', 'Can Tho', 'this is the description number 1', 'step', '2020-01-20', '00:00:00', '2020-01-20', '13:00:00', NULL, 10000, 'pending', 1, NULL, '2020-01-11 09:15:00', '2020-01-11 08:52:12', NULL, NULL),
(2, '[\"events\\\\January2020\\\\ajTD48DS9ZkzoaF6D5oH.jpg\",\"events\\\\January2020\\\\LodmtVC0dJcSh1QX9TsS.jpg\",\"events\\\\January2020\\\\12BQAs9i5E0SZn02tp3W.jpg\"]', 'Run for the environment', 'Hoan Kiem, Ha Noi', 'Run for the environment', 'step', '2020-10-29', '07:00:00', '2019-11-03', '19:00:00', NULL, 10000, 'ended', 1, NULL, '2020-01-11 15:02:00', '2020-01-12 02:57:12', NULL, NULL),
(3, '[\"events\\\\January2020\\\\C4U2gkKieLAYlucOgZyK.jpg\",\"events\\\\January2020\\\\XkMo8ZNTTvX6CYC0a1mc.jpg\",\"events\\\\January2020\\\\vjbRFrmiC5U7vLKxvx25.jpg\"]', 'Green Step', 'Ba Dinh, Ha Noi', 'Make the world green', 'time', '2020-10-10', '07:00:00', '2019-11-15', '17:00:00', 20, NULL, 'ended', 2, 1, '2020-01-11 15:09:00', '2020-01-12 02:57:12', NULL, NULL),
(4, NULL, 'Testing', NULL, '<p>ZABSDA</p>', 'martathon', '2020-01-03', '13:00:00', '2020-01-04', '01:01:00', 200, NULL, 'ended', 1, NULL, '2020-01-12 04:30:21', '2020-01-12 04:39:24', NULL, NULL),
(5, NULL, 'Testing 2', NULL, '<p>Description</p>', 'step', '2020-01-14', '01:00:00', '2020-01-14', '01:57:00', NULL, 120000, 'pending', 4, NULL, '2020-01-12 04:52:01', '2020-01-12 04:52:01', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-01-11 02:55:16', '2020-01-11 02:55:16');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-01-11 02:55:16', '2020-01-11 02:55:16', 'voyager.dashboard', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 2, '2020-01-11 02:55:16', '2020-01-11 09:52:31', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 5, 2, '2020-01-11 02:55:17', '2020-01-11 09:52:36', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 6, '2020-01-11 02:55:17', '2020-01-11 09:52:36', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 3, '2020-01-11 02:55:17', '2020-01-11 09:52:36', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 4, '2020-01-11 02:55:17', '2020-01-11 09:52:36', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 5, '2020-01-11 02:55:17', '2020-01-11 09:52:36', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 6, '2020-01-11 02:55:17', '2020-01-11 09:52:36', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, 5, 1, '2020-01-11 02:55:17', '2020-01-11 09:52:36', 'voyager.settings.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 7, '2020-01-11 02:55:23', '2020-01-11 09:52:36', 'voyager.hooks', NULL),
(15, 1, 'Events', '', '_self', 'voyager-play', '#000000', NULL, 3, '2020-01-11 08:54:34', '2020-01-11 09:53:37', 'voyager.events.index', 'null'),
(16, 1, 'Companies', '', '_self', 'voyager-company', '#000000', NULL, 4, '2020-01-11 08:57:53', '2020-01-11 09:53:42', 'voyager.companies.index', 'null'),
(17, 1, 'Steps', '', '_self', 'voyager-paw', '#000000', NULL, 5, '2020-01-11 09:45:16', '2020-01-11 09:53:46', 'voyager.steps.index', 'null'),
(18, 1, 'Account Ranks', '', '_self', NULL, NULL, NULL, 7, '2020-01-12 05:26:04', '2020-01-12 05:26:04', 'voyager.account-ranks.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_01_01_000000_create_pages_table', 2),
(25, '2016_01_01_000000_create_posts_table', 2),
(26, '2016_02_15_204651_create_categories_table', 2),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-01-11 02:55:22', '2020-01-11 02:55:22');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(2, 'browse_bread', NULL, '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(3, 'browse_database', NULL, '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(4, 'browse_media', NULL, '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(5, 'browse_compass', NULL, '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(6, 'browse_menus', 'menus', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(7, 'read_menus', 'menus', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(8, 'edit_menus', 'menus', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(9, 'add_menus', 'menus', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(10, 'delete_menus', 'menus', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(11, 'browse_roles', 'roles', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(12, 'read_roles', 'roles', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(13, 'edit_roles', 'roles', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(14, 'add_roles', 'roles', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(15, 'delete_roles', 'roles', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(16, 'browse_users', 'users', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(17, 'read_users', 'users', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(18, 'edit_users', 'users', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(19, 'add_users', 'users', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(20, 'delete_users', 'users', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(21, 'browse_settings', 'settings', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(22, 'read_settings', 'settings', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(23, 'edit_settings', 'settings', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(24, 'add_settings', 'settings', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(25, 'delete_settings', 'settings', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(26, 'browse_categories', 'categories', '2020-01-11 02:55:21', '2020-01-11 02:55:21'),
(27, 'read_categories', 'categories', '2020-01-11 02:55:21', '2020-01-11 02:55:21'),
(28, 'edit_categories', 'categories', '2020-01-11 02:55:21', '2020-01-11 02:55:21'),
(29, 'add_categories', 'categories', '2020-01-11 02:55:21', '2020-01-11 02:55:21'),
(30, 'delete_categories', 'categories', '2020-01-11 02:55:21', '2020-01-11 02:55:21'),
(31, 'browse_posts', 'posts', '2020-01-11 02:55:21', '2020-01-11 02:55:21'),
(32, 'read_posts', 'posts', '2020-01-11 02:55:21', '2020-01-11 02:55:21'),
(33, 'edit_posts', 'posts', '2020-01-11 02:55:21', '2020-01-11 02:55:21'),
(34, 'add_posts', 'posts', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(35, 'delete_posts', 'posts', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(36, 'browse_pages', 'pages', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(37, 'read_pages', 'pages', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(38, 'edit_pages', 'pages', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(39, 'add_pages', 'pages', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(40, 'delete_pages', 'pages', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(41, 'browse_hooks', NULL, '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(42, 'browse_events', 'events', '2020-01-11 08:54:34', '2020-01-11 08:54:34'),
(43, 'read_events', 'events', '2020-01-11 08:54:34', '2020-01-11 08:54:34'),
(44, 'edit_events', 'events', '2020-01-11 08:54:34', '2020-01-11 08:54:34'),
(45, 'add_events', 'events', '2020-01-11 08:54:34', '2020-01-11 08:54:34'),
(46, 'delete_events', 'events', '2020-01-11 08:54:34', '2020-01-11 08:54:34'),
(47, 'browse_companies', 'companies', '2020-01-11 08:57:53', '2020-01-11 08:57:53'),
(48, 'read_companies', 'companies', '2020-01-11 08:57:53', '2020-01-11 08:57:53'),
(49, 'edit_companies', 'companies', '2020-01-11 08:57:53', '2020-01-11 08:57:53'),
(50, 'add_companies', 'companies', '2020-01-11 08:57:53', '2020-01-11 08:57:53'),
(51, 'delete_companies', 'companies', '2020-01-11 08:57:53', '2020-01-11 08:57:53'),
(52, 'browse_steps', 'steps', '2020-01-11 09:45:16', '2020-01-11 09:45:16'),
(53, 'read_steps', 'steps', '2020-01-11 09:45:16', '2020-01-11 09:45:16'),
(54, 'edit_steps', 'steps', '2020-01-11 09:45:16', '2020-01-11 09:45:16'),
(55, 'add_steps', 'steps', '2020-01-11 09:45:16', '2020-01-11 09:45:16'),
(56, 'delete_steps', 'steps', '2020-01-11 09:45:16', '2020-01-11 09:45:16'),
(57, 'browse_account_ranks', 'account_ranks', '2020-01-12 05:26:04', '2020-01-12 05:26:04'),
(58, 'read_account_ranks', 'account_ranks', '2020-01-12 05:26:04', '2020-01-12 05:26:04'),
(59, 'edit_account_ranks', 'account_ranks', '2020-01-12 05:26:04', '2020-01-12 05:26:04'),
(60, 'add_account_ranks', 'account_ranks', '2020-01-12 05:26:04', '2020-01-12 05:26:04'),
(61, 'delete_account_ranks', 'account_ranks', '2020-01-12 05:26:04', '2020-01-12 05:26:04');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

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
(61, 1);

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

DROP TABLE IF EXISTS `points`;
CREATE TABLE `points` (
  `id` int(10) UNSIGNED NOT NULL,
  `point` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`id`, `point`, `event_id`, `user_id`, `rank`, `created_at`, `updated_at`) VALUES
(3, 10, 2, 1, 1, NULL, NULL),
(6, 10, 2, 2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-01-11 02:55:22', '2020-01-11 02:55:22');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-01-11 02:55:17', '2020-01-11 02:55:17'),
(2, 'user', 'Normal User', '2020-01-11 02:55:17', '2020-01-11 02:55:17');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `steps`
--

DROP TABLE IF EXISTS `steps`;
CREATE TABLE `steps` (
  `id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_steps` int(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `finish_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `steps`
--

INSERT INTO `steps` (`id`, `event_id`, `user_id`, `total_steps`, `created_at`, `updated_at`, `finish_time`) VALUES
(4, 1, 1, 100, '2020-01-12 02:52:35', '2020-01-12 02:52:35', '2020-01-12 02:52:35'),
(5, 2, 1, 100, '2020-01-12 03:57:01', '2020-01-12 03:57:01', '2020-01-12 03:57:01'),
(6, 2, 2, 100, '2020-01-12 03:57:07', '2020-01-12 03:57:07', '2020-01-12 03:57:07'),
(7, 2, 3, 100, '2020-01-12 03:57:11', '2020-01-12 03:57:11', '2020-01-12 03:57:11'),
(8, 2, 4, 100, '2020-01-12 03:57:15', '2020-01-12 03:57:15', '2020-01-12 03:57:15'),
(9, 3, 1, 100, '2020-01-12 03:59:35', '2020-01-12 03:59:35', '2020-01-12 03:59:35'),
(10, 3, 2, 100, '2020-01-12 03:59:39', '2020-01-12 03:59:39', '2020-01-12 03:59:39'),
(11, 3, 3, 100, '2020-01-12 03:59:43', '2020-01-12 03:59:43', '2020-01-12 03:59:43');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-01-11 02:55:22', '2020-01-11 02:55:22'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-01-11 02:55:23', '2020-01-11 02:55:23'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2020-01-11 02:55:23', '2020-01-11 02:55:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `phone`, `birthdate`, `role_id`, `avatar`, `email_verified_at`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 'admin@admin.com', '$2y$10$OW37fmOUCOmNZwByp8aMOu2sFRwNjSzcPnfYu24ROl36iaXrFnhQO', 'Admin', '0913253199', '2020-01-18', 1, 'users/default.png', NULL, 'MJCoNNaw0MLfJ8yFt4cgobvQsh1bHdfZxfx8tqqwRiir5S1t35Qyo5i4qPQQ', '{\"locale\":\"en\"}', '2020-01-11 02:55:21', '2020-01-11 09:36:15'),
(2, 'user1@gmail.com', '$2y$10$.eAbVVXkKVdy/aZC3tHX3uBaQV3J2U8ea60kf7okx6mJIAtAfjYIq', 'User 1', '0826401666', '1999-01-02', 2, 'users/default.png', NULL, NULL, NULL, '2020-01-11 14:53:37', '2020-01-11 14:58:13'),
(3, 'user2@vstep.com', '$2y$10$3PmSV9iYXkl5cpRXR36Bbu04PoHe./ZALNSUuczuvIuuzpVspiU5e', 'User 2', '0824613545', '1998-01-01', 2, 'users/default.png', NULL, NULL, NULL, '2020-01-11 14:54:36', '2020-01-11 14:54:36'),
(4, 'user3@vstep.com', '$2y$10$o4f8xLIPtaoDEfqJ10Ts8.Qckiaea2pYF8BIHK49UfuFut0y3tqHu', 'User 3', '825431554', '1999-05-05', 2, 'users/default.png', NULL, NULL, NULL, '2020-01-11 14:55:31', '2020-01-11 14:55:31'),
(5, 'user4@vstep.com', '$2y$10$dTCBL7fkt.eoY6xeUX75t.zUXh4Cl4ySr8mPFOoeojoRsLwoRDpy.', 'User 4', '0624516465', '1996-05-04', 2, 'users/default.png', NULL, NULL, NULL, '2020-01-11 14:56:24', '2020-01-11 14:56:24'),
(6, 'user5@vstep.com', '$2y$10$ct4I8WAK15JwBgG9IkcMa.MsB9Jk8bYTTAS6wyRSEM2GT4Fb/utxa', 'User 5', '082631555', '1998-05-04', 2, 'users/default.png', NULL, NULL, NULL, '2020-01-11 14:56:58', '2020-01-11 14:56:58'),
(7, 'user6@vstep.com', '$2y$10$Rk2pkYcz/VsyHjJSzMWJ5uT4lrpUvyZu6f5rDamXPbpIOlLXwwmA2', 'User 6', '0625461555', '1997-02-02', 2, 'users/default.png', NULL, NULL, NULL, '2020-01-11 14:57:29', '2020-01-11 14:57:29'),
(8, 'user7@vstep.com', '$2y$10$uWGFnt1Min4YqdxLIGR/oukjSBuqoh2VMEKFX.9P8PZ.9NpZvX5rS', 'User 7', '0826412555', '2000-02-02', 2, 'users/default.png', NULL, NULL, NULL, '2020-01-11 14:58:01', '2020-01-11 14:58:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_event`
--

DROP TABLE IF EXISTS `user_event`;
CREATE TABLE `user_event` (
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user_event`
--

INSERT INTO `user_event` (`user_id`, `event_id`) VALUES
(1, 1),
(3, 2),
(4, 2),
(5, 2),
(1, 3),
(3, 3),
(5, 3),
(8, 3),
(4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_ranks`
--
ALTER TABLE `account_ranks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `menus_name_unique` (`name`) USING BTREE;

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `pages_slug_unique` (`slug`) USING BTREE;

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`) USING BTREE;

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `permissions_key_index` (`key`) USING BTREE;

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  ADD KEY `permission_role_permission_id_index` (`permission_id`) USING BTREE,
  ADD KEY `permission_role_role_id_index` (`role_id`) USING BTREE;

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `posts_slug_unique` (`slug`) USING BTREE;

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `roles_name_unique` (`name`) USING BTREE;

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `settings_key_unique` (`key`) USING BTREE;

--
-- Indexes for table `steps`
--
ALTER TABLE `steps`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE,
  ADD KEY `users_role_id_foreign` (`role_id`) USING BTREE;

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`) USING BTREE,
  ADD KEY `user_roles_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `user_roles_role_id_index` (`role_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_ranks`
--
ALTER TABLE `account_ranks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `steps`
--
ALTER TABLE `steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

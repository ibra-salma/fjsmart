-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 28, 2024 at 02:17 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `famous`
--

-- --------------------------------------------------------

--
-- Table structure for table `techaddresses`
--

CREATE TABLE `techaddresses` (
  `id` int UNSIGNED NOT NULL,
  `address_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_address_id` int UNSIGNED DEFAULT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int UNSIGNED DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int UNSIGNED DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'only for customer_addresses',
  `use_for_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techadmins`
--

CREATE TABLE `techadmins` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techadmins`
--

INSERT INTO `techadmins` (`id`, `name`, `email`, `password`, `api_token`, `status`, `role_id`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Famous', 'admin@example.com', '$2y$10$jE4vAxqnuOO3sOnAAlrlXujbBlcGWDN0GZZE.zyd.ZvwgMMGhxk8i', 'qeukaYYVaUBFQtft5WfdPeQimuD0qVU5aphf0rJtxiqLcjcNQ4L7O4PfSUz7wkXCRhZdt2x5KWd9qiy0', 1, 1, 'admins/1/NVmgrwivNNdfARApwX7xdk4StMmDNtJaD3Co6zOq.png', NULL, '2024-05-22 09:52:17', '2024-05-24 15:10:05'),
(2, 'Oscar Famous Darteh', 'oscarfamousdarteh@gmail.com', '$2y$10$18Xfso58/kmI3ctHK3Zx4ucCb2ycTZ6REKGrevCCKZIKpcifFl5s6', 'WcKDNmGROHWBB8vzfhh3UJb8JDBKeO4OoUIX6QGso7R0E9FAmR1H0qUOKgHphSRtfX4h1dNbhisiyyBi', 1, 2, NULL, NULL, '2024-05-22 10:38:28', '2024-05-22 10:38:28');

-- --------------------------------------------------------

--
-- Table structure for table `techadmin_password_resets`
--

CREATE TABLE `techadmin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techattributes`
--

CREATE TABLE `techattributes` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `swatch_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regex` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_comparable` tinyint(1) NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_locale` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_channel` tinyint(1) NOT NULL DEFAULT '0',
  `default_value` int DEFAULT NULL,
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techattributes`
--

INSERT INTO `techattributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES
(1, 'sku', 'SKU', 'text', NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(2, 'name', 'Name', 'text', NULL, NULL, NULL, 3, 1, 0, 0, 1, 0, 0, 0, 1, 1, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(3, 'url_key', 'URL Key', 'text', NULL, NULL, NULL, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(4, 'tax_category_id', 'Tax Category', 'select', NULL, NULL, NULL, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(5, 'new', 'New', 'boolean', NULL, NULL, NULL, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(6, 'featured', 'Featured', 'boolean', NULL, NULL, NULL, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(7, 'visible_individually', 'Visible Individually', 'boolean', NULL, NULL, NULL, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(8, 'status', 'Status', 'boolean', NULL, NULL, NULL, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(9, 'short_description', 'Short Description', 'textarea', NULL, NULL, NULL, 11, 1, 0, 0, 0, 0, 0, 0, 1, 1, NULL, 1, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(10, 'description', 'Description', 'textarea', NULL, NULL, NULL, 12, 1, 0, 0, 1, 0, 0, 0, 1, 1, NULL, 1, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(11, 'price', 'Price', 'price', NULL, 'decimal', NULL, 13, 1, 0, 1, 1, 0, 0, 0, 1, 1, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(12, 'cost', 'Cost', 'price', NULL, 'decimal', NULL, 14, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(13, 'special_price', 'Special Price', 'price', NULL, 'decimal', NULL, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(14, 'special_price_from', 'Special Price From', 'date', NULL, NULL, NULL, 16, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(15, 'special_price_to', 'Special Price To', 'date', NULL, NULL, NULL, 17, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(16, 'meta_title', 'Meta Title', 'textarea', NULL, NULL, NULL, 18, 0, 0, 0, 0, 0, 0, 0, 1, 1, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(17, 'meta_keywords', 'Meta Keywords', 'textarea', NULL, NULL, NULL, 20, 0, 0, 0, 0, 0, 0, 0, 1, 1, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(18, 'meta_description', 'Meta Description', 'textarea', NULL, NULL, NULL, 21, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(19, 'length', 'Length', 'text', NULL, 'decimal', NULL, 22, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(20, 'width', 'Width', 'text', NULL, 'decimal', NULL, 23, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(21, 'height', 'Height', 'text', NULL, 'decimal', NULL, 24, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(22, 'weight', 'Weight', 'text', NULL, 'decimal', NULL, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(23, 'color', 'Color', 'select', NULL, NULL, NULL, 26, 0, 0, 1, 0, 1, 1, 0, 0, 0, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(24, 'size', 'Size', 'select', NULL, NULL, NULL, 27, 0, 0, 1, 0, 1, 1, 0, 0, 0, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(25, 'brand', 'Brand', 'select', NULL, NULL, NULL, 28, 0, 0, 1, 0, 0, 1, 1, 0, 0, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(26, 'guest_checkout', 'Guest Checkout', 'boolean', NULL, NULL, NULL, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(27, 'product_number', 'Product Number', 'text', NULL, NULL, NULL, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(28, 'manage_stock', 'Manage Stock', 'boolean', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2024-05-22 09:52:17', '2024-05-22 09:52:17');

-- --------------------------------------------------------

--
-- Table structure for table `techattribute_families`
--

CREATE TABLE `techattribute_families` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techattribute_families`
--

INSERT INTO `techattribute_families` (`id`, `code`, `name`, `status`, `is_user_defined`) VALUES
(1, 'default', 'Default', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `techattribute_groups`
--

CREATE TABLE `techattribute_groups` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column` int NOT NULL DEFAULT '1',
  `position` int NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techattribute_groups`
--

INSERT INTO `techattribute_groups` (`id`, `code`, `attribute_family_id`, `name`, `column`, `position`, `is_user_defined`) VALUES
(1, 'general', 1, 'General', 1, 1, 0),
(2, 'description', 1, 'Description', 1, 2, 0),
(3, 'meta_description', 1, 'Meta Description', 1, 3, 0),
(4, 'price', 1, 'Price', 2, 1, 0),
(5, 'shipping', 1, 'Shipping', 2, 2, 0),
(6, 'settings', 1, 'Settings', 2, 3, 0),
(7, 'inventories', 1, 'Inventories', 2, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `techattribute_group_mappings`
--

CREATE TABLE `techattribute_group_mappings` (
  `attribute_id` int UNSIGNED NOT NULL,
  `attribute_group_id` int UNSIGNED NOT NULL,
  `position` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techattribute_group_mappings`
--

INSERT INTO `techattribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 1, 4),
(4, 1, 5),
(5, 6, 1),
(6, 6, 2),
(7, 6, 3),
(8, 6, 4),
(9, 2, 1),
(10, 2, 2),
(11, 4, 1),
(12, 4, 2),
(13, 4, 3),
(14, 4, 4),
(15, 4, 5),
(16, 3, 1),
(17, 3, 2),
(18, 3, 3),
(19, 5, 1),
(20, 5, 2),
(21, 5, 3),
(22, 5, 4),
(23, 1, 6),
(24, 1, 7),
(25, 1, 8),
(26, 6, 5),
(27, 1, 2),
(28, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `techattribute_options`
--

CREATE TABLE `techattribute_options` (
  `id` int UNSIGNED NOT NULL,
  `attribute_id` int UNSIGNED NOT NULL,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `swatch_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techattribute_options`
--

INSERT INTO `techattribute_options` (`id`, `attribute_id`, `admin_name`, `sort_order`, `swatch_value`) VALUES
(1, 23, 'Red', 1, NULL),
(2, 23, 'Green', 2, NULL),
(3, 23, 'Yellow', 3, NULL),
(4, 23, 'Black', 4, NULL),
(5, 23, 'White', 5, NULL),
(6, 24, 'S', 1, NULL),
(7, 24, 'M', 2, NULL),
(8, 24, 'L', 3, NULL),
(9, 24, 'XL', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `techattribute_option_translations`
--

CREATE TABLE `techattribute_option_translations` (
  `id` int UNSIGNED NOT NULL,
  `attribute_option_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techattribute_option_translations`
--

INSERT INTO `techattribute_option_translations` (`id`, `attribute_option_id`, `locale`, `label`) VALUES
(19, 1, 'en', 'Red'),
(20, 2, 'en', 'Green'),
(21, 3, 'en', 'Yellow'),
(22, 4, 'en', 'Black'),
(23, 5, 'en', 'White'),
(24, 6, 'en', 'S'),
(25, 7, 'en', 'M'),
(26, 8, 'en', 'L'),
(27, 9, 'en', 'XL');

-- --------------------------------------------------------

--
-- Table structure for table `techattribute_translations`
--

CREATE TABLE `techattribute_translations` (
  `id` int UNSIGNED NOT NULL,
  `attribute_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techattribute_translations`
--

INSERT INTO `techattribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES
(57, 1, 'en', 'SKU'),
(58, 2, 'en', 'Name'),
(59, 3, 'en', 'URL Key'),
(60, 4, 'en', 'Tax Category'),
(61, 5, 'en', 'New'),
(62, 6, 'en', 'Featured'),
(63, 7, 'en', 'Visible Individually'),
(64, 8, 'en', 'Status'),
(65, 9, 'en', 'Short Description'),
(66, 10, 'en', 'Description'),
(67, 11, 'en', 'Price'),
(68, 12, 'en', 'Cost'),
(69, 13, 'en', 'Special Price'),
(70, 14, 'en', 'Special Price From'),
(71, 15, 'en', 'Special Price To'),
(72, 16, 'en', 'Meta Title'),
(73, 17, 'en', 'Meta Keywords'),
(74, 18, 'en', 'Meta Description'),
(75, 19, 'en', 'Length'),
(76, 20, 'en', 'Width'),
(77, 21, 'en', 'Height'),
(78, 22, 'en', 'Weight'),
(79, 23, 'en', 'Color'),
(80, 24, 'en', 'Size'),
(81, 25, 'en', 'Brand'),
(82, 26, 'en', 'Guest Checkout'),
(83, 27, 'en', 'Product Number'),
(84, 28, 'en', 'Manage Stock');

-- --------------------------------------------------------

--
-- Table structure for table `techcart`
--

CREATE TABLE `techcart` (
  `id` int UNSIGNED NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `items_count` int DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `tax_total` decimal(12,4) DEFAULT '0.0000',
  `base_tax_total` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `checkout_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcart_items`
--

CREATE TABLE `techcart_items` (
  `id` int UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL DEFAULT '0',
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `custom_price` decimal(12,4) DEFAULT NULL,
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `parent_id` int UNSIGNED DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `cart_id` int UNSIGNED NOT NULL,
  `tax_category_id` int UNSIGNED DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcart_item_inventories`
--

CREATE TABLE `techcart_item_inventories` (
  `id` int UNSIGNED NOT NULL,
  `qty` int UNSIGNED NOT NULL DEFAULT '0',
  `inventory_source_id` int UNSIGNED DEFAULT NULL,
  `cart_item_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcart_payment`
--

CREATE TABLE `techcart_payment` (
  `id` int UNSIGNED NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcart_rules`
--

CREATE TABLE `techcart_rules` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_type` int NOT NULL DEFAULT '1',
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT '0',
  `usage_per_customer` int NOT NULL DEFAULT '0',
  `uses_per_coupon` int NOT NULL DEFAULT '0',
  `times_used` int UNSIGNED NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_quantity` int NOT NULL DEFAULT '1',
  `discount_step` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcart_rule_channels`
--

CREATE TABLE `techcart_rule_channels` (
  `cart_rule_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcart_rule_coupons`
--

CREATE TABLE `techcart_rule_coupons` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage_limit` int UNSIGNED NOT NULL DEFAULT '0',
  `usage_per_customer` int UNSIGNED NOT NULL DEFAULT '0',
  `times_used` int UNSIGNED NOT NULL DEFAULT '0',
  `type` int UNSIGNED NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcart_rule_coupon_usage`
--

CREATE TABLE `techcart_rule_coupon_usage` (
  `id` int UNSIGNED NOT NULL,
  `times_used` int NOT NULL DEFAULT '0',
  `cart_rule_coupon_id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcart_rule_customers`
--

CREATE TABLE `techcart_rule_customers` (
  `id` int UNSIGNED NOT NULL,
  `times_used` bigint UNSIGNED NOT NULL DEFAULT '0',
  `customer_id` int UNSIGNED NOT NULL,
  `cart_rule_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcart_rule_customer_groups`
--

CREATE TABLE `techcart_rule_customer_groups` (
  `cart_rule_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcart_rule_translations`
--

CREATE TABLE `techcart_rule_translations` (
  `id` int UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `cart_rule_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcart_shipping_rates`
--

CREATE TABLE `techcart_shipping_rates` (
  `id` int UNSIGNED NOT NULL,
  `carrier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `base_price` double DEFAULT '0',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT '1',
  `cart_address_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcatalog_rules`
--

CREATE TABLE `techcatalog_rules` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcatalog_rule_channels`
--

CREATE TABLE `techcatalog_rule_channels` (
  `catalog_rule_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcatalog_rule_customer_groups`
--

CREATE TABLE `techcatalog_rule_customer_groups` (
  `catalog_rule_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcatalog_rule_products`
--

CREATE TABLE `techcatalog_rule_products` (
  `id` int UNSIGNED NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL,
  `catalog_rule_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcatalog_rule_product_prices`
--

CREATE TABLE `techcatalog_rule_product_prices` (
  `id` int UNSIGNED NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL,
  `catalog_rule_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcategories`
--

CREATE TABLE `techcategories` (
  `id` int UNSIGNED NOT NULL,
  `position` int NOT NULL DEFAULT '0',
  `logo_path` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `display_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'products_and_description',
  `_lft` int UNSIGNED NOT NULL DEFAULT '0',
  `_rgt` int UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int UNSIGNED DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `banner_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techcategories`
--

INSERT INTO `techcategories` (`id`, `position`, `logo_path`, `status`, `display_mode`, `_lft`, `_rgt`, `parent_id`, `additional`, `banner_path`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 'products_and_description', 1, 16, NULL, NULL, NULL, '2024-05-22 09:52:16', '2024-05-22 09:52:16'),
(2, 1, 'category/2/jlzMfQ6CS95TVqFylPJYSUFEqnT8Nwu6Z9L7kRtz.webp', 1, 'products_and_description', 14, 15, 1, NULL, 'category/2/9mGypoXrr7xWtL7u2W6vGLh61bhywXjPXT9WmtdS.webp', '2024-05-22 10:56:07', '2024-05-22 11:01:37');

-- --------------------------------------------------------

--
-- Table structure for table `techcategory_filterable_attributes`
--

CREATE TABLE `techcategory_filterable_attributes` (
  `category_id` int UNSIGNED NOT NULL,
  `attribute_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techcategory_filterable_attributes`
--

INSERT INTO `techcategory_filterable_attributes` (`category_id`, `attribute_id`) VALUES
(2, 11),
(2, 23),
(2, 24),
(2, 25);

-- --------------------------------------------------------

--
-- Table structure for table `techcategory_translations`
--

CREATE TABLE `techcategory_translations` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_path` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale_id` int UNSIGNED DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techcategory_translations`
--

INSERT INTO `techcategory_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `locale_id`, `locale`) VALUES
(3, 1, 'Root', 'root', '', 'Root Category Description', '', '', '', NULL, 'en'),
(4, 2, 'Smart Switches', 'smart-switches', '', '<p>European standard, British standard, national standard connect Mijia Bluetooth mesh large button switch ( single fire zero fire universal, No need to connect the capacitor).</p>', '', '', '', 1, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `techchannels`
--

CREATE TABLE `techchannels` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_seo` json DEFAULT NULL,
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_ips` text COLLATE utf8mb4_unicode_ci,
  `root_category_id` int UNSIGNED DEFAULT NULL,
  `default_locale_id` int UNSIGNED NOT NULL,
  `base_currency_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techchannels`
--

INSERT INTO `techchannels` (`id`, `code`, `timezone`, `theme`, `hostname`, `logo`, `favicon`, `home_seo`, `is_maintenance_on`, `allowed_ips`, `root_category_id`, `default_locale_id`, `base_currency_id`, `created_at`, `updated_at`) VALUES
(1, 'default', NULL, 'default', 'http://localhost:8000', 'channel/1/FsUGtEOOKflrqun0r7ArBfImsZ3NedoAMB70v5be.png', 'channel/1/hL2RyoiohAUaNixMPg2EXPomfJN8ytAixfNyCKhp.png', NULL, 0, '', 1, 1, 1, '2024-05-22 09:52:17', '2024-05-24 16:03:29');

-- --------------------------------------------------------

--
-- Table structure for table `techchannel_currencies`
--

CREATE TABLE `techchannel_currencies` (
  `channel_id` int UNSIGNED NOT NULL,
  `currency_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techchannel_currencies`
--

INSERT INTO `techchannel_currencies` (`channel_id`, `currency_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `techchannel_inventory_sources`
--

CREATE TABLE `techchannel_inventory_sources` (
  `channel_id` int UNSIGNED NOT NULL,
  `inventory_source_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techchannel_inventory_sources`
--

INSERT INTO `techchannel_inventory_sources` (`channel_id`, `inventory_source_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `techchannel_locales`
--

CREATE TABLE `techchannel_locales` (
  `channel_id` int UNSIGNED NOT NULL,
  `locale_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techchannel_locales`
--

INSERT INTO `techchannel_locales` (`channel_id`, `locale_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `techchannel_translations`
--

CREATE TABLE `techchannel_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `maintenance_mode_text` text COLLATE utf8mb4_unicode_ci,
  `home_seo` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techchannel_translations`
--

INSERT INTO `techchannel_translations` (`id`, `channel_id`, `locale`, `name`, `description`, `maintenance_mode_text`, `home_seo`, `created_at`, `updated_at`) VALUES
(3, 1, 'en', 'Default', NULL, '', '{\"meta_title\": \"FJ Smart Tech & Machinery\", \"meta_keywords\": \"FJ Smart Tech & Machinery\", \"meta_description\": \"FJ Smart Tech & Machinery is your premier destination for cutting-edge technological solutions in the realm of smart living, lighting, security, energy, and machinery. Established in 2023, we have swiftly positioned ourselves as a pioneering force in the industry, dedicated to enhancing convenience, efficiency, and sustainability across various domains.\"}', NULL, '2024-05-24 16:03:29');

-- --------------------------------------------------------

--
-- Table structure for table `techcms_pages`
--

CREATE TABLE `techcms_pages` (
  `id` int UNSIGNED NOT NULL,
  `layout` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techcms_pages`
--

INSERT INTO `techcms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES
(1, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(2, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(3, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(4, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(5, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(6, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(7, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(8, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(9, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(10, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(11, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17');

-- --------------------------------------------------------

--
-- Table structure for table `techcms_page_channels`
--

CREATE TABLE `techcms_page_channels` (
  `cms_page_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcms_page_translations`
--

CREATE TABLE `techcms_page_translations` (
  `id` int UNSIGNED NOT NULL,
  `page_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` longtext COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_page_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techcms_page_translations`
--

INSERT INTO `techcms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES
(23, 'About Us', 'about-us', '<div class=\"static-container\"><div class=\"mb-5\">About Us Page Content</div></div>', 'about us', '', 'aboutus', 'en', 1),
(24, 'Return Policy', 'return-policy', '<div class=\"static-container\"><div class=\"mb-5\">Return Policy Page Content</div></div>', 'return policy', '', 'return, policy', 'en', 2),
(25, 'Refund Policy', 'refund-policy', '<div class=\"static-container\"><div class=\"mb-5\">Refund Policy Page Content</div></div>', 'Refund policy', '', 'refund, policy', 'en', 3),
(26, 'Terms & Conditions', 'terms-conditions', '<div class=\"static-container\"><div class=\"mb-5\">Terms & Conditions Page Content</div></div>', 'Terms & Conditions', '', 'term, conditions', 'en', 4),
(27, 'Terms of Use', 'terms-of-use', '<div class=\"static-container\"><div class=\"mb-5\">Terms of Use Page Content</div></div>', 'Terms of use', '', 'term, use', 'en', 5),
(28, 'Contact Us', 'contact-us', '<div class=\"static-container\"><div class=\"mb-5\">Contact Us Page Content</div></div>', 'Contact Us', '', 'contact, us', 'en', 6),
(29, 'Customer Service', 'customer-service', '<div class=\"static-container\"><div class=\"mb-5\">Customer Service Page Content</div></div>', 'Customer Service', '', 'customer, service', 'en', 7),
(30, 'What\'s New', 'whats-new', '<div class=\"static-container\"><div class=\"mb-5\">What\'s New page content</div></div>', 'What\'s New', '', 'new', 'en', 8),
(31, 'Payment Policy', 'payment-policy', '<div class=\"static-container\"><div class=\"mb-5\">Payment Policy Page Content</div></div>', 'Payment Policy', '', 'payment, policy', 'en', 9),
(32, 'Shipping Policy', 'shipping-policy', '<div class=\"static-container\"><div class=\"mb-5\">Shipping Policy Page Content</div></div>', 'Shipping Policy', '', 'shipping, policy', 'en', 10),
(33, 'Privacy Policy', 'privacy-policy', '<div class=\"static-container\"><div class=\"mb-5\">Privacy Policy Page Content</div></div>', 'Privacy Policy', '', 'privacy, policy', 'en', 11);

-- --------------------------------------------------------

--
-- Table structure for table `techcompare_items`
--

CREATE TABLE `techcompare_items` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcore_config`
--

CREATE TABLE `techcore_config` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techcore_config`
--

INSERT INTO `techcore_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES
(1, 'catalog.products.guest_checkout.allow_guest_checkout', '1', NULL, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(2, 'emails.general.notifications.emails.general.notifications.verification', '1', NULL, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(3, 'emails.general.notifications.emails.general.notifications.registration', '1', NULL, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(4, 'emails.general.notifications.emails.general.notifications.customer', '1', NULL, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(5, 'emails.general.notifications.emails.general.notifications.new_order', '1', NULL, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(6, 'emails.general.notifications.emails.general.notifications.new_admin', '1', NULL, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(7, 'emails.general.notifications.emails.general.notifications.new_invoice', '1', NULL, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(8, 'emails.general.notifications.emails.general.notifications.new_refund', '1', NULL, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(9, 'emails.general.notifications.emails.general.notifications.new_shipment', '1', NULL, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(10, 'emails.general.notifications.emails.general.notifications.new_inventory_source', '1', NULL, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(11, 'emails.general.notifications.emails.general.notifications.cancel_order', '1', NULL, NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(22, 'customer.settings.social_login.enable_facebook', '1', 'default', NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(23, 'customer.settings.social_login.enable_twitter', '1', 'default', NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(24, 'customer.settings.social_login.enable_google', '1', 'default', NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(25, 'customer.settings.social_login.enable_linkedin', '1', 'default', NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(26, 'customer.settings.social_login.enable_github', '1', 'default', NULL, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(27, 'general.design.admin_logo.logo_image', 'configuration/Zv6J7n3EycqzGCXnoWVX3DMVSjxAIxNxt2IaOgyg.png', NULL, NULL, '2024-05-23 12:14:32', '2024-05-23 12:14:32'),
(28, 'general.design.admin_logo.favicon', 'configuration/714Nvyq7ByUSAcG2mfMoP67NUwfL5lwU4Y0stMpf.ico', NULL, NULL, '2024-05-23 12:14:32', '2024-05-23 12:14:32'),
(29, 'general.content.shop.compare_option', '0', 'default', 'en', '2024-05-24 15:52:11', '2024-05-24 15:52:11'),
(30, 'general.content.shop.wishlist_option', '1', 'default', 'en', '2024-05-24 15:52:11', '2024-05-24 15:52:11'),
(31, 'general.content.shop.image_search', '1', 'default', 'en', '2024-05-24 15:52:11', '2024-05-24 15:52:11'),
(32, 'general.content.custom_scripts.custom_css', '<div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\">\r\n<ul type=\"none\">\r\n<li><a href=\"../../\">About Us</a></li>\r\n<li><a href=\"../../\">Customer Service</a></li>\r\n<li><a href=\"../../\">What’s New</a></li>\r\n<li><a href=\"../../\">Contact Us </a></li>\r\n</ul>\r\n</div>\r\n<div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\">\r\n<ul type=\"none\">\r\n<li><a href=\"../../\"> Order and Returns </a></li>\r\n<li><a href=\"../../\"> Payment Policy </a></li>\r\n<li><a href=\"../../\"> Shipping Policy</a></li>\r\n<li><a href=\"../../\"> Privacy and Cookies Policy </a></li>\r\n</ul>\r\n</div>', 'default', NULL, '2024-05-24 15:52:11', '2024-05-24 16:54:02'),
(33, 'general.content.custom_scripts.custom_javascript', '', 'default', NULL, '2024-05-24 15:52:11', '2024-05-24 15:52:11'),
(34, 'catalog.products.product_view_page.no_of_related_products', '', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(35, 'catalog.products.product_view_page.no_of_up_sells_products', '', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(36, 'catalog.products.cart_view_page.no_of_cross_sells_products', '', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(37, 'catalog.products.storefront.products_per_page', '', 'default', NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(38, 'catalog.products.storefront.buy_now_button_display', '0', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(39, 'catalog.products.cache_small_image.width', '', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(40, 'catalog.products.cache_small_image.height', '', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(41, 'catalog.products.cache_medium_image.width', '', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(42, 'catalog.products.cache_medium_image.height', '', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(43, 'catalog.products.cache_large_image.width', '', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(44, 'catalog.products.cache_large_image.height', '', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(45, 'catalog.products.review.guest_review', '1', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(46, 'catalog.products.attribute.image_attribute_upload_size', '', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(47, 'catalog.products.attribute.file_attribute_upload_size', '', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(48, 'catalog.products.social_share.enabled', '1', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(49, 'catalog.products.social_share.facebook', '1', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(50, 'catalog.products.social_share.twitter', '1', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(51, 'catalog.products.social_share.pinterest', '1', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(52, 'catalog.products.social_share.whatsapp', '1', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(53, 'catalog.products.social_share.linkedin', '1', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(54, 'catalog.products.social_share.email', '0', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(55, 'catalog.products.social_share.share_message', 'You can get this product at a very low price.', NULL, NULL, '2024-05-24 15:54:49', '2024-05-24 15:54:49'),
(56, 'taxes.catalogue.pricing.tax_inclusive', '0', NULL, NULL, '2024-05-24 15:56:47', '2024-05-24 15:56:47'),
(57, 'taxes.catalogue.default_location_calculation.country', 'GH', NULL, NULL, '2024-05-24 15:56:47', '2024-05-24 15:56:47'),
(58, 'taxes.catalogue.default_location_calculation.state', '', NULL, NULL, '2024-05-24 15:56:47', '2024-05-24 15:56:47'),
(59, 'taxes.catalogue.default_location_calculation.post_code', '', NULL, NULL, '2024-05-24 15:56:47', '2024-05-24 15:56:47'),
(60, 'emails.general.notifications.emails.general.notifications.customer_registration_confirmation_mail_to_admin', '1', NULL, NULL, '2024-05-24 16:40:18', '2024-05-24 16:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `techcountries`
--

CREATE TABLE `techcountries` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techcountries`
--

INSERT INTO `techcountries` (`id`, `code`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AX', 'Åland Islands'),
(3, 'AL', 'Albania'),
(4, 'DZ', 'Algeria'),
(5, 'AS', 'American Samoa'),
(6, 'AD', 'Andorra'),
(7, 'AO', 'Angola'),
(8, 'AI', 'Anguilla'),
(9, 'AQ', 'Antarctica'),
(10, 'AG', 'Antigua & Barbuda'),
(11, 'AR', 'Argentina'),
(12, 'AM', 'Armenia'),
(13, 'AW', 'Aruba'),
(14, 'AC', 'Ascension Island'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia & Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BR', 'Brazil'),
(32, 'IO', 'British Indian Ocean Territory'),
(33, 'VG', 'British Virgin Islands'),
(34, 'BN', 'Brunei'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CA', 'Canada'),
(41, 'IC', 'Canary Islands'),
(42, 'CV', 'Cape Verde'),
(43, 'BQ', 'Caribbean Netherlands'),
(44, 'KY', 'Cayman Islands'),
(45, 'CF', 'Central African Republic'),
(46, 'EA', 'Ceuta & Melilla'),
(47, 'TD', 'Chad'),
(48, 'CL', 'Chile'),
(49, 'CN', 'China'),
(50, 'CX', 'Christmas Island'),
(51, 'CC', 'Cocos (Keeling) Islands'),
(52, 'CO', 'Colombia'),
(53, 'KM', 'Comoros'),
(54, 'CG', 'Congo - Brazzaville'),
(55, 'CD', 'Congo - Kinshasa'),
(56, 'CK', 'Cook Islands'),
(57, 'CR', 'Costa Rica'),
(58, 'CI', 'Côte d’Ivoire'),
(59, 'HR', 'Croatia'),
(60, 'CU', 'Cuba'),
(61, 'CW', 'Curaçao'),
(62, 'CY', 'Cyprus'),
(63, 'CZ', 'Czechia'),
(64, 'DK', 'Denmark'),
(65, 'DG', 'Diego Garcia'),
(66, 'DJ', 'Djibouti'),
(67, 'DM', 'Dominica'),
(68, 'DO', 'Dominican Republic'),
(69, 'EC', 'Ecuador'),
(70, 'EG', 'Egypt'),
(71, 'SV', 'El Salvador'),
(72, 'GQ', 'Equatorial Guinea'),
(73, 'ER', 'Eritrea'),
(74, 'EE', 'Estonia'),
(75, 'ET', 'Ethiopia'),
(76, 'EZ', 'Eurozone'),
(77, 'FK', 'Falkland Islands'),
(78, 'FO', 'Faroe Islands'),
(79, 'FJ', 'Fiji'),
(80, 'FI', 'Finland'),
(81, 'FR', 'France'),
(82, 'GF', 'French Guiana'),
(83, 'PF', 'French Polynesia'),
(84, 'TF', 'French Southern Territories'),
(85, 'GA', 'Gabon'),
(86, 'GM', 'Gambia'),
(87, 'GE', 'Georgia'),
(88, 'DE', 'Germany'),
(89, 'GH', 'Ghana'),
(90, 'GI', 'Gibraltar'),
(91, 'GR', 'Greece'),
(92, 'GL', 'Greenland'),
(93, 'GD', 'Grenada'),
(94, 'GP', 'Guadeloupe'),
(95, 'GU', 'Guam'),
(96, 'GT', 'Guatemala'),
(97, 'GG', 'Guernsey'),
(98, 'GN', 'Guinea'),
(99, 'GW', 'Guinea-Bissau'),
(100, 'GY', 'Guyana'),
(101, 'HT', 'Haiti'),
(102, 'HN', 'Honduras'),
(103, 'HK', 'Hong Kong SAR China'),
(104, 'HU', 'Hungary'),
(105, 'IS', 'Iceland'),
(106, 'IN', 'India'),
(107, 'ID', 'Indonesia'),
(108, 'IR', 'Iran'),
(109, 'IQ', 'Iraq'),
(110, 'IE', 'Ireland'),
(111, 'IM', 'Isle of Man'),
(112, 'IL', 'Israel'),
(113, 'IT', 'Italy'),
(114, 'JM', 'Jamaica'),
(115, 'JP', 'Japan'),
(116, 'JE', 'Jersey'),
(117, 'JO', 'Jordan'),
(118, 'KZ', 'Kazakhstan'),
(119, 'KE', 'Kenya'),
(120, 'KI', 'Kiribati'),
(121, 'XK', 'Kosovo'),
(122, 'KW', 'Kuwait'),
(123, 'KG', 'Kyrgyzstan'),
(124, 'LA', 'Laos'),
(125, 'LV', 'Latvia'),
(126, 'LB', 'Lebanon'),
(127, 'LS', 'Lesotho'),
(128, 'LR', 'Liberia'),
(129, 'LY', 'Libya'),
(130, 'LI', 'Liechtenstein'),
(131, 'LT', 'Lithuania'),
(132, 'LU', 'Luxembourg'),
(133, 'MO', 'Macau SAR China'),
(134, 'MK', 'Macedonia'),
(135, 'MG', 'Madagascar'),
(136, 'MW', 'Malawi'),
(137, 'MY', 'Malaysia'),
(138, 'MV', 'Maldives'),
(139, 'ML', 'Mali'),
(140, 'MT', 'Malta'),
(141, 'MH', 'Marshall Islands'),
(142, 'MQ', 'Martinique'),
(143, 'MR', 'Mauritania'),
(144, 'MU', 'Mauritius'),
(145, 'YT', 'Mayotte'),
(146, 'MX', 'Mexico'),
(147, 'FM', 'Micronesia'),
(148, 'MD', 'Moldova'),
(149, 'MC', 'Monaco'),
(150, 'MN', 'Mongolia'),
(151, 'ME', 'Montenegro'),
(152, 'MS', 'Montserrat'),
(153, 'MA', 'Morocco'),
(154, 'MZ', 'Mozambique'),
(155, 'MM', 'Myanmar (Burma)'),
(156, 'NA', 'Namibia'),
(157, 'NR', 'Nauru'),
(158, 'NP', 'Nepal'),
(159, 'NL', 'Netherlands'),
(160, 'NC', 'New Caledonia'),
(161, 'NZ', 'New Zealand'),
(162, 'NI', 'Nicaragua'),
(163, 'NE', 'Niger'),
(164, 'NG', 'Nigeria'),
(165, 'NU', 'Niue'),
(166, 'NF', 'Norfolk Island'),
(167, 'KP', 'North Korea'),
(168, 'MP', 'Northern Mariana Islands'),
(169, 'NO', 'Norway'),
(170, 'OM', 'Oman'),
(171, 'PK', 'Pakistan'),
(172, 'PW', 'Palau'),
(173, 'PS', 'Palestinian Territories'),
(174, 'PA', 'Panama'),
(175, 'PG', 'Papua New Guinea'),
(176, 'PY', 'Paraguay'),
(177, 'PE', 'Peru'),
(178, 'PH', 'Philippines'),
(179, 'PN', 'Pitcairn Islands'),
(180, 'PL', 'Poland'),
(181, 'PT', 'Portugal'),
(182, 'PR', 'Puerto Rico'),
(183, 'QA', 'Qatar'),
(184, 'RE', 'Réunion'),
(185, 'RO', 'Romania'),
(186, 'RU', 'Russia'),
(187, 'RW', 'Rwanda'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'São Tomé & Príncipe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SX', 'Sint Maarten'),
(198, 'SK', 'Slovakia'),
(199, 'SI', 'Slovenia'),
(200, 'SB', 'Solomon Islands'),
(201, 'SO', 'Somalia'),
(202, 'ZA', 'South Africa'),
(203, 'GS', 'South Georgia & South Sandwich Islands'),
(204, 'KR', 'South Korea'),
(205, 'SS', 'South Sudan'),
(206, 'ES', 'Spain'),
(207, 'LK', 'Sri Lanka'),
(208, 'BL', 'St. Barthélemy'),
(209, 'SH', 'St. Helena'),
(210, 'KN', 'St. Kitts & Nevis'),
(211, 'LC', 'St. Lucia'),
(212, 'MF', 'St. Martin'),
(213, 'PM', 'St. Pierre & Miquelon'),
(214, 'VC', 'St. Vincent & Grenadines'),
(215, 'SD', 'Sudan'),
(216, 'SR', 'Suriname'),
(217, 'SJ', 'Svalbard & Jan Mayen'),
(218, 'SZ', 'Swaziland'),
(219, 'SE', 'Sweden'),
(220, 'CH', 'Switzerland'),
(221, 'SY', 'Syria'),
(222, 'TW', 'Taiwan'),
(223, 'TJ', 'Tajikistan'),
(224, 'TZ', 'Tanzania'),
(225, 'TH', 'Thailand'),
(226, 'TL', 'Timor-Leste'),
(227, 'TG', 'Togo'),
(228, 'TK', 'Tokelau'),
(229, 'TO', 'Tonga'),
(230, 'TT', 'Trinidad & Tobago'),
(231, 'TA', 'Tristan da Cunha'),
(232, 'TN', 'Tunisia'),
(233, 'TR', 'Turkey'),
(234, 'TM', 'Turkmenistan'),
(235, 'TC', 'Turks & Caicos Islands'),
(236, 'TV', 'Tuvalu'),
(237, 'UM', 'U.S. Outlying Islands'),
(238, 'VI', 'U.S. Virgin Islands'),
(239, 'UG', 'Uganda'),
(240, 'UA', 'Ukraine'),
(241, 'AE', 'United Arab Emirates'),
(242, 'GB', 'United Kingdom'),
(243, 'UN', 'United Nations'),
(244, 'US', 'United States'),
(245, 'UY', 'Uruguay'),
(246, 'UZ', 'Uzbekistan'),
(247, 'VU', 'Vanuatu'),
(248, 'VA', 'Vatican City'),
(249, 'VE', 'Venezuela'),
(250, 'VN', 'Vietnam'),
(251, 'WF', 'Wallis & Futuna'),
(252, 'EH', 'Western Sahara'),
(253, 'YE', 'Yemen'),
(254, 'ZM', 'Zambia'),
(255, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `techcountry_states`
--

CREATE TABLE `techcountry_states` (
  `id` int UNSIGNED NOT NULL,
  `country_id` int UNSIGNED DEFAULT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techcountry_states`
--

INSERT INTO `techcountry_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES
(1, 244, 'US', 'AL', 'Alabama'),
(2, 244, 'US', 'AK', 'Alaska'),
(3, 244, 'US', 'AS', 'American Samoa'),
(4, 244, 'US', 'AZ', 'Arizona'),
(5, 244, 'US', 'AR', 'Arkansas'),
(6, 244, 'US', 'AE', 'Armed Forces Africa'),
(7, 244, 'US', 'AA', 'Armed Forces Americas'),
(8, 244, 'US', 'AE', 'Armed Forces Canada'),
(9, 244, 'US', 'AE', 'Armed Forces Europe'),
(10, 244, 'US', 'AE', 'Armed Forces Middle East'),
(11, 244, 'US', 'AP', 'Armed Forces Pacific'),
(12, 244, 'US', 'CA', 'California'),
(13, 244, 'US', 'CO', 'Colorado'),
(14, 244, 'US', 'CT', 'Connecticut'),
(15, 244, 'US', 'DE', 'Delaware'),
(16, 244, 'US', 'DC', 'District of Columbia'),
(17, 244, 'US', 'FM', 'Federated States Of Micronesia'),
(18, 244, 'US', 'FL', 'Florida'),
(19, 244, 'US', 'GA', 'Georgia'),
(20, 244, 'US', 'GU', 'Guam'),
(21, 244, 'US', 'HI', 'Hawaii'),
(22, 244, 'US', 'ID', 'Idaho'),
(23, 244, 'US', 'IL', 'Illinois'),
(24, 244, 'US', 'IN', 'Indiana'),
(25, 244, 'US', 'IA', 'Iowa'),
(26, 244, 'US', 'KS', 'Kansas'),
(27, 244, 'US', 'KY', 'Kentucky'),
(28, 244, 'US', 'LA', 'Louisiana'),
(29, 244, 'US', 'ME', 'Maine'),
(30, 244, 'US', 'MH', 'Marshall Islands'),
(31, 244, 'US', 'MD', 'Maryland'),
(32, 244, 'US', 'MA', 'Massachusetts'),
(33, 244, 'US', 'MI', 'Michigan'),
(34, 244, 'US', 'MN', 'Minnesota'),
(35, 244, 'US', 'MS', 'Mississippi'),
(36, 244, 'US', 'MO', 'Missouri'),
(37, 244, 'US', 'MT', 'Montana'),
(38, 244, 'US', 'NE', 'Nebraska'),
(39, 244, 'US', 'NV', 'Nevada'),
(40, 244, 'US', 'NH', 'New Hampshire'),
(41, 244, 'US', 'NJ', 'New Jersey'),
(42, 244, 'US', 'NM', 'New Mexico'),
(43, 244, 'US', 'NY', 'New York'),
(44, 244, 'US', 'NC', 'North Carolina'),
(45, 244, 'US', 'ND', 'North Dakota'),
(46, 244, 'US', 'MP', 'Northern Mariana Islands'),
(47, 244, 'US', 'OH', 'Ohio'),
(48, 244, 'US', 'OK', 'Oklahoma'),
(49, 244, 'US', 'OR', 'Oregon'),
(50, 244, 'US', 'PW', 'Palau'),
(51, 244, 'US', 'PA', 'Pennsylvania'),
(52, 244, 'US', 'PR', 'Puerto Rico'),
(53, 244, 'US', 'RI', 'Rhode Island'),
(54, 244, 'US', 'SC', 'South Carolina'),
(55, 244, 'US', 'SD', 'South Dakota'),
(56, 244, 'US', 'TN', 'Tennessee'),
(57, 244, 'US', 'TX', 'Texas'),
(58, 244, 'US', 'UT', 'Utah'),
(59, 244, 'US', 'VT', 'Vermont'),
(60, 244, 'US', 'VI', 'Virgin Islands'),
(61, 244, 'US', 'VA', 'Virginia'),
(62, 244, 'US', 'WA', 'Washington'),
(63, 244, 'US', 'WV', 'West Virginia'),
(64, 244, 'US', 'WI', 'Wisconsin'),
(65, 244, 'US', 'WY', 'Wyoming'),
(66, 40, 'CA', 'AB', 'Alberta'),
(67, 40, 'CA', 'BC', 'British Columbia'),
(68, 40, 'CA', 'MB', 'Manitoba'),
(69, 40, 'CA', 'NL', 'Newfoundland and Labrador'),
(70, 40, 'CA', 'NB', 'New Brunswick'),
(71, 40, 'CA', 'NS', 'Nova Scotia'),
(72, 40, 'CA', 'NT', 'Northwest Territories'),
(73, 40, 'CA', 'NU', 'Nunavut'),
(74, 40, 'CA', 'ON', 'Ontario'),
(75, 40, 'CA', 'PE', 'Prince Edward Island'),
(76, 40, 'CA', 'QC', 'Quebec'),
(77, 40, 'CA', 'SK', 'Saskatchewan'),
(78, 40, 'CA', 'YT', 'Yukon Territory'),
(79, 88, 'DE', 'NDS', 'Niedersachsen'),
(80, 88, 'DE', 'BAW', 'Baden-Württemberg'),
(81, 88, 'DE', 'BAY', 'Bayern'),
(82, 88, 'DE', 'BER', 'Berlin'),
(83, 88, 'DE', 'BRG', 'Brandenburg'),
(84, 88, 'DE', 'BRE', 'Bremen'),
(85, 88, 'DE', 'HAM', 'Hamburg'),
(86, 88, 'DE', 'HES', 'Hessen'),
(87, 88, 'DE', 'MEC', 'Mecklenburg-Vorpommern'),
(88, 88, 'DE', 'NRW', 'Nordrhein-Westfalen'),
(89, 88, 'DE', 'RHE', 'Rheinland-Pfalz'),
(90, 88, 'DE', 'SAR', 'Saarland'),
(91, 88, 'DE', 'SAS', 'Sachsen'),
(92, 88, 'DE', 'SAC', 'Sachsen-Anhalt'),
(93, 88, 'DE', 'SCN', 'Schleswig-Holstein'),
(94, 88, 'DE', 'THE', 'Thüringen'),
(95, 16, 'AT', 'WI', 'Wien'),
(96, 16, 'AT', 'NO', 'Niederösterreich'),
(97, 16, 'AT', 'OO', 'Oberösterreich'),
(98, 16, 'AT', 'SB', 'Salzburg'),
(99, 16, 'AT', 'KN', 'Kärnten'),
(100, 16, 'AT', 'ST', 'Steiermark'),
(101, 16, 'AT', 'TI', 'Tirol'),
(102, 16, 'AT', 'BL', 'Burgenland'),
(103, 16, 'AT', 'VB', 'Vorarlberg'),
(104, 220, 'CH', 'AG', 'Aargau'),
(105, 220, 'CH', 'AI', 'Appenzell Innerrhoden'),
(106, 220, 'CH', 'AR', 'Appenzell Ausserrhoden'),
(107, 220, 'CH', 'BE', 'Bern'),
(108, 220, 'CH', 'BL', 'Basel-Landschaft'),
(109, 220, 'CH', 'BS', 'Basel-Stadt'),
(110, 220, 'CH', 'FR', 'Freiburg'),
(111, 220, 'CH', 'GE', 'Genf'),
(112, 220, 'CH', 'GL', 'Glarus'),
(113, 220, 'CH', 'GR', 'Graubünden'),
(114, 220, 'CH', 'JU', 'Jura'),
(115, 220, 'CH', 'LU', 'Luzern'),
(116, 220, 'CH', 'NE', 'Neuenburg'),
(117, 220, 'CH', 'NW', 'Nidwalden'),
(118, 220, 'CH', 'OW', 'Obwalden'),
(119, 220, 'CH', 'SG', 'St. Gallen'),
(120, 220, 'CH', 'SH', 'Schaffhausen'),
(121, 220, 'CH', 'SO', 'Solothurn'),
(122, 220, 'CH', 'SZ', 'Schwyz'),
(123, 220, 'CH', 'TG', 'Thurgau'),
(124, 220, 'CH', 'TI', 'Tessin'),
(125, 220, 'CH', 'UR', 'Uri'),
(126, 220, 'CH', 'VD', 'Waadt'),
(127, 220, 'CH', 'VS', 'Wallis'),
(128, 220, 'CH', 'ZG', 'Zug'),
(129, 220, 'CH', 'ZH', 'Zürich'),
(130, 206, 'ES', 'A Coruсa', 'A Coruña'),
(131, 206, 'ES', 'Alava', 'Alava'),
(132, 206, 'ES', 'Albacete', 'Albacete'),
(133, 206, 'ES', 'Alicante', 'Alicante'),
(134, 206, 'ES', 'Almeria', 'Almeria'),
(135, 206, 'ES', 'Asturias', 'Asturias'),
(136, 206, 'ES', 'Avila', 'Avila'),
(137, 206, 'ES', 'Badajoz', 'Badajoz'),
(138, 206, 'ES', 'Baleares', 'Baleares'),
(139, 206, 'ES', 'Barcelona', 'Barcelona'),
(140, 206, 'ES', 'Burgos', 'Burgos'),
(141, 206, 'ES', 'Caceres', 'Caceres'),
(142, 206, 'ES', 'Cadiz', 'Cadiz'),
(143, 206, 'ES', 'Cantabria', 'Cantabria'),
(144, 206, 'ES', 'Castellon', 'Castellon'),
(145, 206, 'ES', 'Ceuta', 'Ceuta'),
(146, 206, 'ES', 'Ciudad Real', 'Ciudad Real'),
(147, 206, 'ES', 'Cordoba', 'Cordoba'),
(148, 206, 'ES', 'Cuenca', 'Cuenca'),
(149, 206, 'ES', 'Girona', 'Girona'),
(150, 206, 'ES', 'Granada', 'Granada'),
(151, 206, 'ES', 'Guadalajara', 'Guadalajara'),
(152, 206, 'ES', 'Guipuzcoa', 'Guipuzcoa'),
(153, 206, 'ES', 'Huelva', 'Huelva'),
(154, 206, 'ES', 'Huesca', 'Huesca'),
(155, 206, 'ES', 'Jaen', 'Jaen'),
(156, 206, 'ES', 'La Rioja', 'La Rioja'),
(157, 206, 'ES', 'Las Palmas', 'Las Palmas'),
(158, 206, 'ES', 'Leon', 'Leon'),
(159, 206, 'ES', 'Lleida', 'Lleida'),
(160, 206, 'ES', 'Lugo', 'Lugo'),
(161, 206, 'ES', 'Madrid', 'Madrid'),
(162, 206, 'ES', 'Malaga', 'Malaga'),
(163, 206, 'ES', 'Melilla', 'Melilla'),
(164, 206, 'ES', 'Murcia', 'Murcia'),
(165, 206, 'ES', 'Navarra', 'Navarra'),
(166, 206, 'ES', 'Ourense', 'Ourense'),
(167, 206, 'ES', 'Palencia', 'Palencia'),
(168, 206, 'ES', 'Pontevedra', 'Pontevedra'),
(169, 206, 'ES', 'Salamanca', 'Salamanca'),
(170, 206, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 206, 'ES', 'Segovia', 'Segovia'),
(172, 206, 'ES', 'Sevilla', 'Sevilla'),
(173, 206, 'ES', 'Soria', 'Soria'),
(174, 206, 'ES', 'Tarragona', 'Tarragona'),
(175, 206, 'ES', 'Teruel', 'Teruel'),
(176, 206, 'ES', 'Toledo', 'Toledo'),
(177, 206, 'ES', 'Valencia', 'Valencia'),
(178, 206, 'ES', 'Valladolid', 'Valladolid'),
(179, 206, 'ES', 'Vizcaya', 'Vizcaya'),
(180, 206, 'ES', 'Zamora', 'Zamora'),
(181, 206, 'ES', 'Zaragoza', 'Zaragoza'),
(182, 81, 'FR', '1', 'Ain'),
(183, 81, 'FR', '2', 'Aisne'),
(184, 81, 'FR', '3', 'Allier'),
(185, 81, 'FR', '4', 'Alpes-de-Haute-Provence'),
(186, 81, 'FR', '5', 'Hautes-Alpes'),
(187, 81, 'FR', '6', 'Alpes-Maritimes'),
(188, 81, 'FR', '7', 'Ardèche'),
(189, 81, 'FR', '8', 'Ardennes'),
(190, 81, 'FR', '9', 'Ariège'),
(191, 81, 'FR', '10', 'Aube'),
(192, 81, 'FR', '11', 'Aude'),
(193, 81, 'FR', '12', 'Aveyron'),
(194, 81, 'FR', '13', 'Bouches-du-Rhône'),
(195, 81, 'FR', '14', 'Calvados'),
(196, 81, 'FR', '15', 'Cantal'),
(197, 81, 'FR', '16', 'Charente'),
(198, 81, 'FR', '17', 'Charente-Maritime'),
(199, 81, 'FR', '18', 'Cher'),
(200, 81, 'FR', '19', 'Corrèze'),
(201, 81, 'FR', '2A', 'Corse-du-Sud'),
(202, 81, 'FR', '2B', 'Haute-Corse'),
(203, 81, 'FR', '21', 'Côte-d\'Or'),
(204, 81, 'FR', '22', 'Côtes-d\'Armor'),
(205, 81, 'FR', '23', 'Creuse'),
(206, 81, 'FR', '24', 'Dordogne'),
(207, 81, 'FR', '25', 'Doubs'),
(208, 81, 'FR', '26', 'Drôme'),
(209, 81, 'FR', '27', 'Eure'),
(210, 81, 'FR', '28', 'Eure-et-Loir'),
(211, 81, 'FR', '29', 'Finistère'),
(212, 81, 'FR', '30', 'Gard'),
(213, 81, 'FR', '31', 'Haute-Garonne'),
(214, 81, 'FR', '32', 'Gers'),
(215, 81, 'FR', '33', 'Gironde'),
(216, 81, 'FR', '34', 'Hérault'),
(217, 81, 'FR', '35', 'Ille-et-Vilaine'),
(218, 81, 'FR', '36', 'Indre'),
(219, 81, 'FR', '37', 'Indre-et-Loire'),
(220, 81, 'FR', '38', 'Isère'),
(221, 81, 'FR', '39', 'Jura'),
(222, 81, 'FR', '40', 'Landes'),
(223, 81, 'FR', '41', 'Loir-et-Cher'),
(224, 81, 'FR', '42', 'Loire'),
(225, 81, 'FR', '43', 'Haute-Loire'),
(226, 81, 'FR', '44', 'Loire-Atlantique'),
(227, 81, 'FR', '45', 'Loiret'),
(228, 81, 'FR', '46', 'Lot'),
(229, 81, 'FR', '47', 'Lot-et-Garonne'),
(230, 81, 'FR', '48', 'Lozère'),
(231, 81, 'FR', '49', 'Maine-et-Loire'),
(232, 81, 'FR', '50', 'Manche'),
(233, 81, 'FR', '51', 'Marne'),
(234, 81, 'FR', '52', 'Haute-Marne'),
(235, 81, 'FR', '53', 'Mayenne'),
(236, 81, 'FR', '54', 'Meurthe-et-Moselle'),
(237, 81, 'FR', '55', 'Meuse'),
(238, 81, 'FR', '56', 'Morbihan'),
(239, 81, 'FR', '57', 'Moselle'),
(240, 81, 'FR', '58', 'Nièvre'),
(241, 81, 'FR', '59', 'Nord'),
(242, 81, 'FR', '60', 'Oise'),
(243, 81, 'FR', '61', 'Orne'),
(244, 81, 'FR', '62', 'Pas-de-Calais'),
(245, 81, 'FR', '63', 'Puy-de-Dôme'),
(246, 81, 'FR', '64', 'Pyrénées-Atlantiques'),
(247, 81, 'FR', '65', 'Hautes-Pyrénées'),
(248, 81, 'FR', '66', 'Pyrénées-Orientales'),
(249, 81, 'FR', '67', 'Bas-Rhin'),
(250, 81, 'FR', '68', 'Haut-Rhin'),
(251, 81, 'FR', '69', 'Rhône'),
(252, 81, 'FR', '70', 'Haute-Saône'),
(253, 81, 'FR', '71', 'Saône-et-Loire'),
(254, 81, 'FR', '72', 'Sarthe'),
(255, 81, 'FR', '73', 'Savoie'),
(256, 81, 'FR', '74', 'Haute-Savoie'),
(257, 81, 'FR', '75', 'Paris'),
(258, 81, 'FR', '76', 'Seine-Maritime'),
(259, 81, 'FR', '77', 'Seine-et-Marne'),
(260, 81, 'FR', '78', 'Yvelines'),
(261, 81, 'FR', '79', 'Deux-Sèvres'),
(262, 81, 'FR', '80', 'Somme'),
(263, 81, 'FR', '81', 'Tarn'),
(264, 81, 'FR', '82', 'Tarn-et-Garonne'),
(265, 81, 'FR', '83', 'Var'),
(266, 81, 'FR', '84', 'Vaucluse'),
(267, 81, 'FR', '85', 'Vendée'),
(268, 81, 'FR', '86', 'Vienne'),
(269, 81, 'FR', '87', 'Haute-Vienne'),
(270, 81, 'FR', '88', 'Vosges'),
(271, 81, 'FR', '89', 'Yonne'),
(272, 81, 'FR', '90', 'Territoire-de-Belfort'),
(273, 81, 'FR', '91', 'Essonne'),
(274, 81, 'FR', '92', 'Hauts-de-Seine'),
(275, 81, 'FR', '93', 'Seine-Saint-Denis'),
(276, 81, 'FR', '94', 'Val-de-Marne'),
(277, 81, 'FR', '95', 'Val-d\'Oise'),
(278, 185, 'RO', 'AB', 'Alba'),
(279, 185, 'RO', 'AR', 'Arad'),
(280, 185, 'RO', 'AG', 'Argeş'),
(281, 185, 'RO', 'BC', 'Bacău'),
(282, 185, 'RO', 'BH', 'Bihor'),
(283, 185, 'RO', 'BN', 'Bistriţa-Năsăud'),
(284, 185, 'RO', 'BT', 'Botoşani'),
(285, 185, 'RO', 'BV', 'Braşov'),
(286, 185, 'RO', 'BR', 'Brăila'),
(287, 185, 'RO', 'B', 'Bucureşti'),
(288, 185, 'RO', 'BZ', 'Buzău'),
(289, 185, 'RO', 'CS', 'Caraş-Severin'),
(290, 185, 'RO', 'CL', 'Călăraşi'),
(291, 185, 'RO', 'CJ', 'Cluj'),
(292, 185, 'RO', 'CT', 'Constanţa'),
(293, 185, 'RO', 'CV', 'Covasna'),
(294, 185, 'RO', 'DB', 'Dâmboviţa'),
(295, 185, 'RO', 'DJ', 'Dolj'),
(296, 185, 'RO', 'GL', 'Galaţi'),
(297, 185, 'RO', 'GR', 'Giurgiu'),
(298, 185, 'RO', 'GJ', 'Gorj'),
(299, 185, 'RO', 'HR', 'Harghita'),
(300, 185, 'RO', 'HD', 'Hunedoara'),
(301, 185, 'RO', 'IL', 'Ialomiţa'),
(302, 185, 'RO', 'IS', 'Iaşi'),
(303, 185, 'RO', 'IF', 'Ilfov'),
(304, 185, 'RO', 'MM', 'Maramureş'),
(305, 185, 'RO', 'MH', 'Mehedinţi'),
(306, 185, 'RO', 'MS', 'Mureş'),
(307, 185, 'RO', 'NT', 'Neamţ'),
(308, 185, 'RO', 'OT', 'Olt'),
(309, 185, 'RO', 'PH', 'Prahova'),
(310, 185, 'RO', 'SM', 'Satu-Mare'),
(311, 185, 'RO', 'SJ', 'Sălaj'),
(312, 185, 'RO', 'SB', 'Sibiu'),
(313, 185, 'RO', 'SV', 'Suceava'),
(314, 185, 'RO', 'TR', 'Teleorman'),
(315, 185, 'RO', 'TM', 'Timiş'),
(316, 185, 'RO', 'TL', 'Tulcea'),
(317, 185, 'RO', 'VS', 'Vaslui'),
(318, 185, 'RO', 'VL', 'Vâlcea'),
(319, 185, 'RO', 'VN', 'Vrancea'),
(320, 80, 'FI', 'Lappi', 'Lappi'),
(321, 80, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa'),
(322, 80, 'FI', 'Kainuu', 'Kainuu'),
(323, 80, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala'),
(324, 80, 'FI', 'Pohjois-Savo', 'Pohjois-Savo'),
(325, 80, 'FI', 'Etelä-Savo', 'Etelä-Savo'),
(326, 80, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa'),
(327, 80, 'FI', 'Pohjanmaa', 'Pohjanmaa'),
(328, 80, 'FI', 'Pirkanmaa', 'Pirkanmaa'),
(329, 80, 'FI', 'Satakunta', 'Satakunta'),
(330, 80, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa'),
(331, 80, 'FI', 'Keski-Suomi', 'Keski-Suomi'),
(332, 80, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi'),
(333, 80, 'FI', 'Etelä-Karjala', 'Etelä-Karjala'),
(334, 80, 'FI', 'Päijät-Häme', 'Päijät-Häme'),
(335, 80, 'FI', 'Kanta-Häme', 'Kanta-Häme'),
(336, 80, 'FI', 'Uusimaa', 'Uusimaa'),
(337, 80, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa'),
(338, 80, 'FI', 'Kymenlaakso', 'Kymenlaakso'),
(339, 80, 'FI', 'Ahvenanmaa', 'Ahvenanmaa'),
(340, 74, 'EE', 'EE-37', 'Harjumaa'),
(341, 74, 'EE', 'EE-39', 'Hiiumaa'),
(342, 74, 'EE', 'EE-44', 'Ida-Virumaa'),
(343, 74, 'EE', 'EE-49', 'Jõgevamaa'),
(344, 74, 'EE', 'EE-51', 'Järvamaa'),
(345, 74, 'EE', 'EE-57', 'Läänemaa'),
(346, 74, 'EE', 'EE-59', 'Lääne-Virumaa'),
(347, 74, 'EE', 'EE-65', 'Põlvamaa'),
(348, 74, 'EE', 'EE-67', 'Pärnumaa'),
(349, 74, 'EE', 'EE-70', 'Raplamaa'),
(350, 74, 'EE', 'EE-74', 'Saaremaa'),
(351, 74, 'EE', 'EE-78', 'Tartumaa'),
(352, 74, 'EE', 'EE-82', 'Valgamaa'),
(353, 74, 'EE', 'EE-84', 'Viljandimaa'),
(354, 74, 'EE', 'EE-86', 'Võrumaa'),
(355, 125, 'LV', 'LV-DGV', 'Daugavpils'),
(356, 125, 'LV', 'LV-JEL', 'Jelgava'),
(357, 125, 'LV', 'Jēkabpils', 'Jēkabpils'),
(358, 125, 'LV', 'LV-JUR', 'Jūrmala'),
(359, 125, 'LV', 'LV-LPX', 'Liepāja'),
(360, 125, 'LV', 'LV-LE', 'Liepājas novads'),
(361, 125, 'LV', 'LV-REZ', 'Rēzekne'),
(362, 125, 'LV', 'LV-RIX', 'Rīga'),
(363, 125, 'LV', 'LV-RI', 'Rīgas novads'),
(364, 125, 'LV', 'Valmiera', 'Valmiera'),
(365, 125, 'LV', 'LV-VEN', 'Ventspils'),
(366, 125, 'LV', 'Aglonas novads', 'Aglonas novads'),
(367, 125, 'LV', 'LV-AI', 'Aizkraukles novads'),
(368, 125, 'LV', 'Aizputes novads', 'Aizputes novads'),
(369, 125, 'LV', 'Aknīstes novads', 'Aknīstes novads'),
(370, 125, 'LV', 'Alojas novads', 'Alojas novads'),
(371, 125, 'LV', 'Alsungas novads', 'Alsungas novads'),
(372, 125, 'LV', 'LV-AL', 'Alūksnes novads'),
(373, 125, 'LV', 'Amatas novads', 'Amatas novads'),
(374, 125, 'LV', 'Apes novads', 'Apes novads'),
(375, 125, 'LV', 'Auces novads', 'Auces novads'),
(376, 125, 'LV', 'Babītes novads', 'Babītes novads'),
(377, 125, 'LV', 'Baldones novads', 'Baldones novads'),
(378, 125, 'LV', 'Baltinavas novads', 'Baltinavas novads'),
(379, 125, 'LV', 'LV-BL', 'Balvu novads'),
(380, 125, 'LV', 'LV-BU', 'Bauskas novads'),
(381, 125, 'LV', 'Beverīnas novads', 'Beverīnas novads'),
(382, 125, 'LV', 'Brocēnu novads', 'Brocēnu novads'),
(383, 125, 'LV', 'Burtnieku novads', 'Burtnieku novads'),
(384, 125, 'LV', 'Carnikavas novads', 'Carnikavas novads'),
(385, 125, 'LV', 'Cesvaines novads', 'Cesvaines novads'),
(386, 125, 'LV', 'Ciblas novads', 'Ciblas novads'),
(387, 125, 'LV', 'LV-CE', 'Cēsu novads'),
(388, 125, 'LV', 'Dagdas novads', 'Dagdas novads'),
(389, 125, 'LV', 'LV-DA', 'Daugavpils novads'),
(390, 125, 'LV', 'LV-DO', 'Dobeles novads'),
(391, 125, 'LV', 'Dundagas novads', 'Dundagas novads'),
(392, 125, 'LV', 'Durbes novads', 'Durbes novads'),
(393, 125, 'LV', 'Engures novads', 'Engures novads'),
(394, 125, 'LV', 'Garkalnes novads', 'Garkalnes novads'),
(395, 125, 'LV', 'Grobiņas novads', 'Grobiņas novads'),
(396, 125, 'LV', 'LV-GU', 'Gulbenes novads'),
(397, 125, 'LV', 'Iecavas novads', 'Iecavas novads'),
(398, 125, 'LV', 'Ikšķiles novads', 'Ikšķiles novads'),
(399, 125, 'LV', 'Ilūkstes novads', 'Ilūkstes novads'),
(400, 125, 'LV', 'Inčukalna novads', 'Inčukalna novads'),
(401, 125, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads'),
(402, 125, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads'),
(403, 125, 'LV', 'Jaunpils novads', 'Jaunpils novads'),
(404, 125, 'LV', 'LV-JL', 'Jelgavas novads'),
(405, 125, 'LV', 'LV-JK', 'Jēkabpils novads'),
(406, 125, 'LV', 'Kandavas novads', 'Kandavas novads'),
(407, 125, 'LV', 'Kokneses novads', 'Kokneses novads'),
(408, 125, 'LV', 'Krimuldas novads', 'Krimuldas novads'),
(409, 125, 'LV', 'Krustpils novads', 'Krustpils novads'),
(410, 125, 'LV', 'LV-KR', 'Krāslavas novads'),
(411, 125, 'LV', 'LV-KU', 'Kuldīgas novads'),
(412, 125, 'LV', 'Kārsavas novads', 'Kārsavas novads'),
(413, 125, 'LV', 'Lielvārdes novads', 'Lielvārdes novads'),
(414, 125, 'LV', 'LV-LM', 'Limbažu novads'),
(415, 125, 'LV', 'Lubānas novads', 'Lubānas novads'),
(416, 125, 'LV', 'LV-LU', 'Ludzas novads'),
(417, 125, 'LV', 'Līgatnes novads', 'Līgatnes novads'),
(418, 125, 'LV', 'Līvānu novads', 'Līvānu novads'),
(419, 125, 'LV', 'LV-MA', 'Madonas novads'),
(420, 125, 'LV', 'Mazsalacas novads', 'Mazsalacas novads'),
(421, 125, 'LV', 'Mālpils novads', 'Mālpils novads'),
(422, 125, 'LV', 'Mārupes novads', 'Mārupes novads'),
(423, 125, 'LV', 'Naukšēnu novads', 'Naukšēnu novads'),
(424, 125, 'LV', 'Neretas novads', 'Neretas novads'),
(425, 125, 'LV', 'Nīcas novads', 'Nīcas novads'),
(426, 125, 'LV', 'LV-OG', 'Ogres novads'),
(427, 125, 'LV', 'Olaines novads', 'Olaines novads'),
(428, 125, 'LV', 'Ozolnieku novads', 'Ozolnieku novads'),
(429, 125, 'LV', 'LV-PR', 'Preiļu novads'),
(430, 125, 'LV', 'Priekules novads', 'Priekules novads'),
(431, 125, 'LV', 'Priekuļu novads', 'Priekuļu novads'),
(432, 125, 'LV', 'Pārgaujas novads', 'Pārgaujas novads'),
(433, 125, 'LV', 'Pāvilostas novads', 'Pāvilostas novads'),
(434, 125, 'LV', 'Pļaviņu novads', 'Pļaviņu novads'),
(435, 125, 'LV', 'Raunas novads', 'Raunas novads'),
(436, 125, 'LV', 'Riebiņu novads', 'Riebiņu novads'),
(437, 125, 'LV', 'Rojas novads', 'Rojas novads'),
(438, 125, 'LV', 'Ropažu novads', 'Ropažu novads'),
(439, 125, 'LV', 'Rucavas novads', 'Rucavas novads'),
(440, 125, 'LV', 'Rugāju novads', 'Rugāju novads'),
(441, 125, 'LV', 'Rundāles novads', 'Rundāles novads'),
(442, 125, 'LV', 'LV-RE', 'Rēzeknes novads'),
(443, 125, 'LV', 'Rūjienas novads', 'Rūjienas novads'),
(444, 125, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads'),
(445, 125, 'LV', 'Salas novads', 'Salas novads'),
(446, 125, 'LV', 'Salaspils novads', 'Salaspils novads'),
(447, 125, 'LV', 'LV-SA', 'Saldus novads'),
(448, 125, 'LV', 'Saulkrastu novads', 'Saulkrastu novads'),
(449, 125, 'LV', 'Siguldas novads', 'Siguldas novads'),
(450, 125, 'LV', 'Skrundas novads', 'Skrundas novads'),
(451, 125, 'LV', 'Skrīveru novads', 'Skrīveru novads'),
(452, 125, 'LV', 'Smiltenes novads', 'Smiltenes novads'),
(453, 125, 'LV', 'Stopiņu novads', 'Stopiņu novads'),
(454, 125, 'LV', 'Strenču novads', 'Strenču novads'),
(455, 125, 'LV', 'Sējas novads', 'Sējas novads'),
(456, 125, 'LV', 'LV-TA', 'Talsu novads'),
(457, 125, 'LV', 'LV-TU', 'Tukuma novads'),
(458, 125, 'LV', 'Tērvetes novads', 'Tērvetes novads'),
(459, 125, 'LV', 'Vaiņodes novads', 'Vaiņodes novads'),
(460, 125, 'LV', 'LV-VK', 'Valkas novads'),
(461, 125, 'LV', 'LV-VM', 'Valmieras novads'),
(462, 125, 'LV', 'Varakļānu novads', 'Varakļānu novads'),
(463, 125, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads'),
(464, 125, 'LV', 'Vecumnieku novads', 'Vecumnieku novads'),
(465, 125, 'LV', 'LV-VE', 'Ventspils novads'),
(466, 125, 'LV', 'Viesītes novads', 'Viesītes novads'),
(467, 125, 'LV', 'Viļakas novads', 'Viļakas novads'),
(468, 125, 'LV', 'Viļānu novads', 'Viļānu novads'),
(469, 125, 'LV', 'Vārkavas novads', 'Vārkavas novads'),
(470, 125, 'LV', 'Zilupes novads', 'Zilupes novads'),
(471, 125, 'LV', 'Ādažu novads', 'Ādažu novads'),
(472, 125, 'LV', 'Ērgļu novads', 'Ērgļu novads'),
(473, 125, 'LV', 'Ķeguma novads', 'Ķeguma novads'),
(474, 125, 'LV', 'Ķekavas novads', 'Ķekavas novads'),
(475, 131, 'LT', 'LT-AL', 'Alytaus Apskritis'),
(476, 131, 'LT', 'LT-KU', 'Kauno Apskritis'),
(477, 131, 'LT', 'LT-KL', 'Klaipėdos Apskritis'),
(478, 131, 'LT', 'LT-MR', 'Marijampolės Apskritis'),
(479, 131, 'LT', 'LT-PN', 'Panevėžio Apskritis'),
(480, 131, 'LT', 'LT-SA', 'Šiaulių Apskritis'),
(481, 131, 'LT', 'LT-TA', 'Tauragės Apskritis'),
(482, 131, 'LT', 'LT-TE', 'Telšių Apskritis'),
(483, 131, 'LT', 'LT-UT', 'Utenos Apskritis'),
(484, 131, 'LT', 'LT-VL', 'Vilniaus Apskritis'),
(485, 31, 'BR', 'AC', 'Acre'),
(486, 31, 'BR', 'AL', 'Alagoas'),
(487, 31, 'BR', 'AP', 'Amapá'),
(488, 31, 'BR', 'AM', 'Amazonas'),
(489, 31, 'BR', 'BA', 'Bahia'),
(490, 31, 'BR', 'CE', 'Ceará'),
(491, 31, 'BR', 'ES', 'Espírito Santo'),
(492, 31, 'BR', 'GO', 'Goiás'),
(493, 31, 'BR', 'MA', 'Maranhão'),
(494, 31, 'BR', 'MT', 'Mato Grosso'),
(495, 31, 'BR', 'MS', 'Mato Grosso do Sul'),
(496, 31, 'BR', 'MG', 'Minas Gerais'),
(497, 31, 'BR', 'PA', 'Pará'),
(498, 31, 'BR', 'PB', 'Paraíba'),
(499, 31, 'BR', 'PR', 'Paraná'),
(500, 31, 'BR', 'PE', 'Pernambuco'),
(501, 31, 'BR', 'PI', 'Piauí'),
(502, 31, 'BR', 'RJ', 'Rio de Janeiro'),
(503, 31, 'BR', 'RN', 'Rio Grande do Norte'),
(504, 31, 'BR', 'RS', 'Rio Grande do Sul'),
(505, 31, 'BR', 'RO', 'Rondônia'),
(506, 31, 'BR', 'RR', 'Roraima'),
(507, 31, 'BR', 'SC', 'Santa Catarina'),
(508, 31, 'BR', 'SP', 'São Paulo'),
(509, 31, 'BR', 'SE', 'Sergipe'),
(510, 31, 'BR', 'TO', 'Tocantins'),
(511, 31, 'BR', 'DF', 'Distrito Federal'),
(512, 59, 'HR', 'HR-01', 'Zagrebačka županija'),
(513, 59, 'HR', 'HR-02', 'Krapinsko-zagorska županija'),
(514, 59, 'HR', 'HR-03', 'Sisačko-moslavačka županija'),
(515, 59, 'HR', 'HR-04', 'Karlovačka županija'),
(516, 59, 'HR', 'HR-05', 'Varaždinska županija'),
(517, 59, 'HR', 'HR-06', 'Koprivničko-križevačka županija'),
(518, 59, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija'),
(519, 59, 'HR', 'HR-08', 'Primorsko-goranska županija'),
(520, 59, 'HR', 'HR-09', 'Ličko-senjska županija'),
(521, 59, 'HR', 'HR-10', 'Virovitičko-podravska županija'),
(522, 59, 'HR', 'HR-11', 'Požeško-slavonska županija'),
(523, 59, 'HR', 'HR-12', 'Brodsko-posavska županija'),
(524, 59, 'HR', 'HR-13', 'Zadarska županija'),
(525, 59, 'HR', 'HR-14', 'Osječko-baranjska županija'),
(526, 59, 'HR', 'HR-15', 'Šibensko-kninska županija'),
(527, 59, 'HR', 'HR-16', 'Vukovarsko-srijemska županija'),
(528, 59, 'HR', 'HR-17', 'Splitsko-dalmatinska županija'),
(529, 59, 'HR', 'HR-18', 'Istarska županija'),
(530, 59, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija'),
(531, 59, 'HR', 'HR-20', 'Međimurska županija'),
(532, 59, 'HR', 'HR-21', 'Grad Zagreb'),
(533, 106, 'IN', 'AN', 'Andaman and Nicobar Islands'),
(534, 106, 'IN', 'AP', 'Andhra Pradesh'),
(535, 106, 'IN', 'AR', 'Arunachal Pradesh'),
(536, 106, 'IN', 'AS', 'Assam'),
(537, 106, 'IN', 'BR', 'Bihar'),
(538, 106, 'IN', 'CH', 'Chandigarh'),
(539, 106, 'IN', 'CT', 'Chhattisgarh'),
(540, 106, 'IN', 'DN', 'Dadra and Nagar Haveli'),
(541, 106, 'IN', 'DD', 'Daman and Diu'),
(542, 106, 'IN', 'DL', 'Delhi'),
(543, 106, 'IN', 'GA', 'Goa'),
(544, 106, 'IN', 'GJ', 'Gujarat'),
(545, 106, 'IN', 'HR', 'Haryana'),
(546, 106, 'IN', 'HP', 'Himachal Pradesh'),
(547, 106, 'IN', 'JK', 'Jammu and Kashmir'),
(548, 106, 'IN', 'JH', 'Jharkhand'),
(549, 106, 'IN', 'KA', 'Karnataka'),
(550, 106, 'IN', 'KL', 'Kerala'),
(551, 106, 'IN', 'LD', 'Lakshadweep'),
(552, 106, 'IN', 'MP', 'Madhya Pradesh'),
(553, 106, 'IN', 'MH', 'Maharashtra'),
(554, 106, 'IN', 'MN', 'Manipur'),
(555, 106, 'IN', 'ML', 'Meghalaya'),
(556, 106, 'IN', 'MZ', 'Mizoram'),
(557, 106, 'IN', 'NL', 'Nagaland'),
(558, 106, 'IN', 'OR', 'Odisha'),
(559, 106, 'IN', 'PY', 'Puducherry'),
(560, 106, 'IN', 'PB', 'Punjab'),
(561, 106, 'IN', 'RJ', 'Rajasthan'),
(562, 106, 'IN', 'SK', 'Sikkim'),
(563, 106, 'IN', 'TN', 'Tamil Nadu'),
(564, 106, 'IN', 'TG', 'Telangana'),
(565, 106, 'IN', 'TR', 'Tripura'),
(566, 106, 'IN', 'UP', 'Uttar Pradesh'),
(567, 106, 'IN', 'UT', 'Uttarakhand'),
(568, 106, 'IN', 'WB', 'West Bengal'),
(569, 176, 'PY', 'PY-16', 'Alto Paraguay'),
(570, 176, 'PY', 'PY-10', 'Alto Paraná'),
(571, 176, 'PY', 'PY-13', 'Amambay'),
(572, 176, 'PY', 'PY-ASU', 'Asunción'),
(573, 176, 'PY', 'PY-19', 'Boquerón'),
(574, 176, 'PY', 'PY-5', 'Caaguazú'),
(575, 176, 'PY', 'PY-6', 'Caazapá'),
(576, 176, 'PY', 'PY-14', 'Canindeyú'),
(577, 176, 'PY', 'PY-11', 'Central'),
(578, 176, 'PY', 'PY-1', 'Concepción'),
(579, 176, 'PY', 'PY-3', 'Cordillera'),
(580, 176, 'PY', 'PY-4', 'Guairá'),
(581, 176, 'PY', 'PY-7', 'Itapúa'),
(582, 176, 'PY', 'PY-8', 'Misiones'),
(583, 176, 'PY', 'PY-9', 'Paraguarí'),
(584, 176, 'PY', 'PY-15', 'Presidente Hayes'),
(585, 176, 'PY', 'PY-2', 'San Pedro'),
(586, 176, 'PY', 'PY-12', 'Ñeembucú');

-- --------------------------------------------------------

--
-- Table structure for table `techcountry_state_translations`
--

CREATE TABLE `techcountry_state_translations` (
  `id` int UNSIGNED NOT NULL,
  `country_state_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_name` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcountry_translations`
--

CREATE TABLE `techcountry_translations` (
  `id` int UNSIGNED NOT NULL,
  `country_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcurrencies`
--

CREATE TABLE `techcurrencies` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal` int UNSIGNED NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techcurrencies`
--

INSERT INTO `techcurrencies` (`id`, `code`, `name`, `symbol`, `decimal`, `created_at`, `updated_at`) VALUES
(1, 'USD', 'US Dollar', '$', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `techcurrency_exchange_rates`
--

CREATE TABLE `techcurrency_exchange_rates` (
  `id` int UNSIGNED NOT NULL,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcustomers`
--

CREATE TABLE `techcustomers` (
  `id` int UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int UNSIGNED DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT '0',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspended` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techcustomers`
--

INSERT INTO `techcustomers` (`id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `email`, `phone`, `image`, `status`, `password`, `api_token`, `customer_group_id`, `subscribed_to_news_letter`, `is_verified`, `is_suspended`, `token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'IBRAHIMA', 'BAH', NULL, NULL, '20205220003@nuist.edu.cn', NULL, NULL, 1, '$2y$10$hu0DJuRs1QDo/cXrAwPZZuI.5FGSJ9rLWX4gvE14ht2ZXSkFHPAqW', 'fCxzJZldrJQM86C3fqr8Fpxw7UQ1L2QF0UTHRfZ1r4mkhbunD5ECnhy51T8s0AenQ7GJy5j0jYGLDoEV', 2, 1, 1, 0, '44aec75bff76dcc94d6ebbf24771be22', NULL, '2024-05-22 10:01:26', '2024-05-22 10:01:26');

-- --------------------------------------------------------

--
-- Table structure for table `techcustomer_groups`
--

CREATE TABLE `techcustomer_groups` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techcustomer_groups`
--

INSERT INTO `techcustomer_groups` (`id`, `code`, `name`, `is_user_defined`, `created_at`, `updated_at`) VALUES
(1, 'guest', 'Guest', 0, NULL, NULL),
(2, 'general', 'General', 0, NULL, NULL),
(3, 'wholesale', 'Wholesale', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `techcustomer_notes`
--

CREATE TABLE `techcustomer_notes` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techcustomer_password_resets`
--

CREATE TABLE `techcustomer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techcustomer_password_resets`
--

INSERT INTO `techcustomer_password_resets` (`email`, `token`, `created_at`) VALUES
('20205220003@nuist.edu.cn', '$2y$10$wKG6e70/ncaClZxkq1j9Zu3YGknhTCJtsf3K6U6Y3tK8GOIkVGvVK', '2024-05-23 12:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `techcustomer_social_accounts`
--

CREATE TABLE `techcustomer_social_accounts` (
  `id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `provider_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techdownloadable_link_purchased`
--

CREATE TABLE `techdownloadable_link_purchased` (
  `id` int UNSIGNED NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_bought` int NOT NULL DEFAULT '0',
  `download_used` int NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `order_item_id` int UNSIGNED NOT NULL,
  `download_canceled` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techfailed_jobs`
--

CREATE TABLE `techfailed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techimports`
--

CREATE TABLE `techimports` (
  `id` int UNSIGNED NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `process_in_queue` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation_strategy` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_errors` int NOT NULL DEFAULT '0',
  `processed_rows_count` int NOT NULL DEFAULT '0',
  `invalid_rows_count` int NOT NULL DEFAULT '0',
  `errors_count` int NOT NULL DEFAULT '0',
  `errors` json DEFAULT NULL,
  `field_separator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images_directory_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `error_file_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` json DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techimport_batches`
--

CREATE TABLE `techimport_batches` (
  `id` int UNSIGNED NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `data` json NOT NULL,
  `summary` json DEFAULT NULL,
  `import_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techinventory_sources`
--

CREATE TABLE `techinventory_sources` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techinventory_sources`
--

INSERT INTO `techinventory_sources` (`id`, `code`, `name`, `description`, `contact_name`, `contact_email`, `contact_number`, `contact_fax`, `country`, `state`, `city`, `street`, `postcode`, `priority`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 'default', 'Default', NULL, 'Default', 'warehouse@example.com', '1234567899', NULL, 'US', 'MI', 'Detroit', '12th Street', '48127', 0, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `techinvoices`
--

CREATE TABLE `techinvoices` (
  `id` int UNSIGNED NOT NULL,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminders` int NOT NULL DEFAULT '0',
  `next_reminder_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techinvoice_items`
--

CREATE TABLE `techinvoice_items` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int UNSIGNED DEFAULT NULL,
  `invoice_id` int UNSIGNED DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techjobs`
--

CREATE TABLE `techjobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techjob_batches`
--

CREATE TABLE `techjob_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techlocales`
--

CREATE TABLE `techlocales` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `logo_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techlocales`
--

INSERT INTO `techlocales` (`id`, `code`, `name`, `direction`, `logo_path`, `created_at`, `updated_at`) VALUES
(1, 'en', 'English', 'ltr', 'locales/7OFvtsSlOqPnwyvF4QVGLEnkMYEdIvqLjK3QF1Dd.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `techmarketing_campaigns`
--

CREATE TABLE `techmarketing_campaigns` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spooling` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int UNSIGNED DEFAULT NULL,
  `customer_group_id` int UNSIGNED DEFAULT NULL,
  `marketing_template_id` int UNSIGNED DEFAULT NULL,
  `marketing_event_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techmarketing_events`
--

CREATE TABLE `techmarketing_events` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techmarketing_events`
--

INSERT INTO `techmarketing_events` (`id`, `name`, `description`, `date`, `created_at`, `updated_at`) VALUES
(1, 'Birthday', 'Birthday', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `techmarketing_templates`
--

CREATE TABLE `techmarketing_templates` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techmigrations`
--

CREATE TABLE `techmigrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techmigrations`
--

INSERT INTO `techmigrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_admin_password_resets_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2018_06_12_111907_create_admins_table', 1),
(5, '2018_06_13_055341_create_roles_table', 1),
(6, '2018_07_05_130148_create_attributes_table', 1),
(7, '2018_07_05_132854_create_attribute_translations_table', 1),
(8, '2018_07_05_135150_create_attribute_families_table', 1),
(9, '2018_07_05_135152_create_attribute_groups_table', 1),
(10, '2018_07_05_140832_create_attribute_options_table', 1),
(11, '2018_07_05_140856_create_attribute_option_translations_table', 1),
(12, '2018_07_05_142820_create_categories_table', 1),
(13, '2018_07_10_055143_create_locales_table', 1),
(14, '2018_07_20_054426_create_countries_table', 1),
(15, '2018_07_20_054502_create_currencies_table', 1),
(16, '2018_07_20_054542_create_currency_exchange_rates_table', 1),
(17, '2018_07_20_064849_create_channels_table', 1),
(18, '2018_07_21_142836_create_category_translations_table', 1),
(19, '2018_07_23_110040_create_inventory_sources_table', 1),
(20, '2018_07_24_082635_create_customer_groups_table', 1),
(21, '2018_07_24_082930_create_customers_table', 1),
(22, '2018_07_27_065727_create_products_table', 1),
(23, '2018_07_27_070011_create_product_attribute_values_table', 1),
(24, '2018_07_27_092623_create_product_reviews_table', 1),
(25, '2018_07_27_113941_create_product_images_table', 1),
(26, '2018_07_27_113956_create_product_inventories_table', 1),
(27, '2018_08_30_064755_create_tax_categories_table', 1),
(28, '2018_08_30_065042_create_tax_rates_table', 1),
(29, '2018_08_30_065840_create_tax_mappings_table', 1),
(30, '2018_09_05_150444_create_cart_table', 1),
(31, '2018_09_05_150915_create_cart_items_table', 1),
(32, '2018_09_11_064045_customer_password_resets', 1),
(33, '2018_09_19_093453_create_cart_payment', 1),
(34, '2018_09_19_093508_create_cart_shipping_rates_table', 1),
(35, '2018_09_20_060658_create_core_config_table', 1),
(36, '2018_09_27_113154_create_orders_table', 1),
(37, '2018_09_27_113207_create_order_items_table', 1),
(38, '2018_09_27_115022_create_shipments_table', 1),
(39, '2018_09_27_115029_create_shipment_items_table', 1),
(40, '2018_09_27_115135_create_invoices_table', 1),
(41, '2018_09_27_115144_create_invoice_items_table', 1),
(42, '2018_10_01_095504_create_order_payment_table', 1),
(43, '2018_10_03_025230_create_wishlist_table', 1),
(44, '2018_10_12_101803_create_country_translations_table', 1),
(45, '2018_10_12_101913_create_country_states_table', 1),
(46, '2018_10_12_101923_create_country_state_translations_table', 1),
(47, '2018_11_16_173504_create_subscribers_list_table', 1),
(48, '2018_11_21_144411_create_cart_item_inventories_table', 1),
(49, '2018_12_06_185202_create_product_flat_table', 1),
(50, '2018_12_24_123812_create_channel_inventory_sources_table', 1),
(51, '2018_12_26_165327_create_product_ordered_inventories_table', 1),
(52, '2019_05_13_024321_create_cart_rules_table', 1),
(53, '2019_05_13_024322_create_cart_rule_channels_table', 1),
(54, '2019_05_13_024323_create_cart_rule_customer_groups_table', 1),
(55, '2019_05_13_024324_create_cart_rule_translations_table', 1),
(56, '2019_05_13_024325_create_cart_rule_customers_table', 1),
(57, '2019_05_13_024326_create_cart_rule_coupons_table', 1),
(58, '2019_05_13_024327_create_cart_rule_coupon_usage_table', 1),
(59, '2019_06_17_180258_create_product_downloadable_samples_table', 1),
(60, '2019_06_17_180314_create_product_downloadable_sample_translations_table', 1),
(61, '2019_06_17_180325_create_product_downloadable_links_table', 1),
(62, '2019_06_17_180346_create_product_downloadable_link_translations_table', 1),
(63, '2019_06_21_202249_create_downloadable_link_purchased_table', 1),
(64, '2019_07_30_153530_create_cms_pages_table', 1),
(65, '2019_07_31_143339_create_category_filterable_attributes_table', 1),
(66, '2019_08_02_105320_create_product_grouped_products_table', 1),
(67, '2019_08_20_170510_create_product_bundle_options_table', 1),
(68, '2019_08_20_170520_create_product_bundle_option_translations_table', 1),
(69, '2019_08_20_170528_create_product_bundle_option_products_table', 1),
(70, '2019_09_11_184511_create_refunds_table', 1),
(71, '2019_09_11_184519_create_refund_items_table', 1),
(72, '2019_12_03_184613_create_catalog_rules_table', 1),
(73, '2019_12_03_184651_create_catalog_rule_channels_table', 1),
(74, '2019_12_03_184732_create_catalog_rule_customer_groups_table', 1),
(75, '2019_12_06_101110_create_catalog_rule_products_table', 1),
(76, '2019_12_06_110507_create_catalog_rule_product_prices_table', 1),
(77, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(78, '2020_01_14_191854_create_cms_page_translations_table', 1),
(79, '2020_01_15_130209_create_cms_page_channels_table', 1),
(80, '2020_04_16_185147_add_table_addresses', 1),
(81, '2020_05_06_171638_create_order_comments_table', 1),
(82, '2020_05_21_171500_create_product_customer_group_prices_table', 1),
(83, '2020_06_25_162154_create_customer_social_accounts_table', 1),
(84, '2020_11_19_112228_create_product_videos_table', 1),
(85, '2020_11_26_141455_create_marketing_templates_table', 1),
(86, '2020_11_26_150534_create_marketing_events_table', 1),
(87, '2020_11_26_150644_create_marketing_campaigns_table', 1),
(88, '2020_12_21_000200_create_channel_translations_table', 1),
(89, '2020_12_27_121950_create_jobs_table', 1),
(90, '2021_03_11_212124_create_order_transactions_table', 1),
(91, '2021_04_07_132010_create_product_review_images_table', 1),
(92, '2021_12_15_104544_notifications', 1),
(93, '2022_03_15_160510_create_failed_jobs_table', 1),
(94, '2022_04_01_094622_create_sitemaps_table', 1),
(95, '2022_10_03_144232_create_product_price_indices_table', 1),
(96, '2022_10_04_144444_create_job_batches_table', 1),
(97, '2022_10_08_134150_create_product_inventory_indices_table', 1),
(98, '2023_05_26_213105_create_wishlist_items_table', 1),
(99, '2023_05_26_213120_create_compare_items_table', 1),
(100, '2023_06_27_163529_rename_product_review_images_to_product_review_attachments', 1),
(101, '2023_07_06_140013_add_logo_path_column_to_locales', 1),
(102, '2023_07_10_184256_create_theme_customizations_table', 1),
(103, '2023_07_12_181722_remove_home_page_and_footer_content_column_from_channel_translations_table', 1),
(104, '2023_07_20_185324_add_column_column_in_attribute_groups_table', 1),
(105, '2023_07_25_145943_add_regex_column_in_attributes_table', 1),
(106, '2023_07_25_165945_drop_notes_column_from_customers_table', 1),
(107, '2023_07_25_171058_create_customer_notes_table', 1),
(108, '2023_07_31_125232_rename_image_and_category_banner_columns_from_categories_table', 1),
(109, '2023_09_15_170053_create_theme_customization_translations_table', 1),
(110, '2023_09_20_102031_add_default_value_column_in_attributes_table', 1),
(111, '2023_09_20_102635_add_inventories_group_in_attribute_groups_table', 1),
(112, '2023_10_05_163612_create_visits_table', 1),
(113, '2023_10_12_090446_add_tax_category_id_column_in_order_items_table', 1),
(114, '2023_11_08_054614_add_code_column_in_attribute_groups_table', 1),
(115, '2023_11_08_140116_create_search_terms_table', 1),
(116, '2023_11_09_162805_create_url_rewrites_table', 1),
(117, '2023_11_17_150401_create_search_synonyms_table', 1),
(118, '2023_12_11_054614_add_channel_id_column_in_product_price_indices_table', 1),
(119, '2024_01_11_154640_create_imports_table', 1),
(120, '2024_01_11_154741_create_import_batches_table', 1),
(121, '2024_01_19_170350_add_unique_id_column_in_product_attribute_values_table', 1),
(122, '2024_01_19_170350_add_unique_id_column_in_product_customer_group_prices_table', 1),
(123, '2024_01_22_170814_add_unique_index_in_mapping_tables', 1),
(124, '2024_02_26_153000_add_columns_to_addresses_table', 1),
(125, '2024_03_07_193421_rename_address1_column_in_addresses_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `technotifications`
--

CREATE TABLE `technotifications` (
  `id` int UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techorders`
--

CREATE TABLE `techorders` (
  `id` int UNSIGNED NOT NULL,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `total_item_count` int DEFAULT NULL,
  `total_qty_ordered` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `customer_id` int UNSIGNED DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int UNSIGNED DEFAULT NULL,
  `channel_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techorder_comments`
--

CREATE TABLE `techorder_comments` (
  `id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techorder_items`
--

CREATE TABLE `techorder_items` (
  `id` int UNSIGNED NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `total_weight` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` int DEFAULT '0',
  `qty_shipped` int DEFAULT '0',
  `qty_invoiced` int DEFAULT '0',
  `qty_canceled` int DEFAULT '0',
  `qty_refunded` int DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `product_id` int UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int UNSIGNED DEFAULT NULL,
  `tax_category_id` int UNSIGNED DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techorder_payment`
--

CREATE TABLE `techorder_payment` (
  `id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED DEFAULT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techorder_transactions`
--

CREATE TABLE `techorder_transactions` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT '0.0000',
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `invoice_id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techpassword_resets`
--

CREATE TABLE `techpassword_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techpersonal_access_tokens`
--

CREATE TABLE `techpersonal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproducts`
--

CREATE TABLE `techproducts` (
  `id` int UNSIGNED NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `attribute_family_id` int UNSIGNED DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_attribute_values`
--

CREATE TABLE `techproduct_attribute_values` (
  `id` int UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_value` text COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` json DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `attribute_id` int UNSIGNED NOT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_bundle_options`
--

CREATE TABLE `techproduct_bundle_options` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_bundle_option_products`
--

CREATE TABLE `techproduct_bundle_option_products` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `product_bundle_option_id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_bundle_option_translations`
--

CREATE TABLE `techproduct_bundle_option_translations` (
  `id` int UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_bundle_option_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_categories`
--

CREATE TABLE `techproduct_categories` (
  `product_id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_cross_sells`
--

CREATE TABLE `techproduct_cross_sells` (
  `parent_id` int UNSIGNED NOT NULL,
  `child_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_customer_group_prices`
--

CREATE TABLE `techproduct_customer_group_prices` (
  `id` bigint UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `value_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_downloadable_links`
--

CREATE TABLE `techproduct_downloadable_links` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sample_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloads` int NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_downloadable_link_translations`
--

CREATE TABLE `techproduct_downloadable_link_translations` (
  `id` int UNSIGNED NOT NULL,
  `product_downloadable_link_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_downloadable_samples`
--

CREATE TABLE `techproduct_downloadable_samples` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_downloadable_sample_translations`
--

CREATE TABLE `techproduct_downloadable_sample_translations` (
  `id` int UNSIGNED NOT NULL,
  `product_downloadable_sample_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_flat`
--

CREATE TABLE `techproduct_flat` (
  `id` int UNSIGNED NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `url_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int UNSIGNED DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_grouped_products`
--

CREATE TABLE `techproduct_grouped_products` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `associated_product_id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_images`
--

CREATE TABLE `techproduct_images` (
  `id` int UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `position` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_inventories`
--

CREATE TABLE `techproduct_inventories` (
  `id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED NOT NULL,
  `vendor_id` int NOT NULL DEFAULT '0',
  `inventory_source_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_inventory_indices`
--

CREATE TABLE `techproduct_inventory_indices` (
  `id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_ordered_inventories`
--

CREATE TABLE `techproduct_ordered_inventories` (
  `id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_price_indices`
--

CREATE TABLE `techproduct_price_indices` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED DEFAULT NULL,
  `channel_id` int UNSIGNED NOT NULL DEFAULT '1',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_relations`
--

CREATE TABLE `techproduct_relations` (
  `parent_id` int UNSIGNED NOT NULL,
  `child_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_reviews`
--

CREATE TABLE `techproduct_reviews` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_review_attachments`
--

CREATE TABLE `techproduct_review_attachments` (
  `id` int UNSIGNED NOT NULL,
  `review_id` int UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'image',
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_super_attributes`
--

CREATE TABLE `techproduct_super_attributes` (
  `product_id` int UNSIGNED NOT NULL,
  `attribute_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_up_sells`
--

CREATE TABLE `techproduct_up_sells` (
  `parent_id` int UNSIGNED NOT NULL,
  `child_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techproduct_videos`
--

CREATE TABLE `techproduct_videos` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techrefunds`
--

CREATE TABLE `techrefunds` (
  `id` int UNSIGNED NOT NULL,
  `increment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techrefund_items`
--

CREATE TABLE `techrefund_items` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int UNSIGNED DEFAULT NULL,
  `refund_id` int UNSIGNED DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techroles`
--

CREATE TABLE `techroles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techroles`
--

INSERT INTO `techroles` (`id`, `name`, `description`, `permission_type`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'This role users will have all the access', 'all', NULL, NULL, NULL),
(2, 'Vendor', 'The main Vendor of the platform', 'custom', '[\"dashboard\", \"sales\", \"sales.orders\", \"sales.orders.view\", \"sales.orders.cancel\", \"sales.invoices\", \"sales.invoices.view\", \"sales.invoices.create\", \"sales.shipments\", \"sales.shipments.view\", \"sales.shipments.create\", \"sales.refunds\", \"sales.refunds.view\", \"sales.refunds.create\", \"sales.transactions\", \"sales.transactions.view\", \"catalog\", \"catalog.products\", \"catalog.products.create\", \"catalog.products.copy\", \"catalog.products.edit\", \"catalog.products.delete\", \"catalog.categories\", \"catalog.categories.create\", \"catalog.categories.edit\", \"catalog.categories.delete\", \"catalog.attributes\", \"catalog.attributes.create\", \"catalog.attributes.edit\", \"catalog.attributes.delete\", \"catalog.families\", \"catalog.families.create\", \"catalog.families.edit\", \"catalog.families.delete\", \"customers\", \"customers.customers\", \"customers.customers.create\", \"customers.customers.edit\", \"customers.customers.delete\", \"customers.addresses\", \"customers.addresses.create\", \"customers.addresses.edit\", \"customers.addresses.delete\", \"customers.note\", \"customers.groups\", \"customers.groups.create\", \"customers.groups.edit\", \"customers.groups.delete\", \"customers.reviews\", \"customers.reviews.edit\", \"customers.reviews.delete\", \"marketing\", \"marketing.promotions\", \"marketing.promotions.cart_rules\", \"marketing.promotions.cart_rules.create\", \"marketing.promotions.cart_rules.copy\", \"marketing.promotions.cart_rules.edit\", \"marketing.promotions.cart_rules.delete\", \"marketing.promotions.catalog_rules\", \"marketing.promotions.catalog_rules.create\", \"marketing.promotions.catalog_rules.edit\", \"marketing.promotions.catalog_rules.delete\", \"marketing.communications\", \"marketing.communications.email_templates\", \"marketing.communications.email_templates.create\", \"marketing.communications.email_templates.edit\", \"marketing.communications.email_templates.delete\", \"marketing.communications.events\", \"marketing.communications.events.create\", \"marketing.communications.events.edit\", \"marketing.communications.events.delete\", \"marketing.communications.campaigns\", \"marketing.communications.campaigns.create\", \"marketing.communications.campaigns.edit\", \"marketing.communications.campaigns.delete\", \"marketing.communications.subscribers\", \"marketing.communications.subscribers.edit\", \"marketing.communications.subscribers.delete\", \"marketing.search_seo\", \"marketing.search_seo.url_rewrites\", \"marketing.search_seo.url_rewrites.create\", \"marketing.search_seo.url_rewrites.edit\", \"marketing.search_seo.url_rewrites.delete\", \"marketing.search_seo.search_terms\", \"marketing.search_seo.search_terms.create\", \"marketing.search_seo.search_terms.edit\", \"marketing.search_seo.search_terms.delete\", \"marketing.search_seo.search_synonyms\", \"marketing.search_seo.search_synonyms.create\", \"marketing.search_seo.search_synonyms.edit\", \"marketing.search_seo.search_synonyms.delete\", \"marketing.search_seo.sitemaps\", \"marketing.search_seo.sitemaps.create\", \"marketing.search_seo.sitemaps.edit\", \"marketing.search_seo.sitemaps.delete\", \"reporting\", \"reporting.sales\", \"reporting.customers\", \"reporting.products\", \"cms\", \"cms.create\", \"cms.edit\", \"cms.delete\"]', '2024-05-22 10:36:18', '2024-05-22 10:36:18');

-- --------------------------------------------------------

--
-- Table structure for table `techsearch_synonyms`
--

CREATE TABLE `techsearch_synonyms` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techsearch_terms`
--

CREATE TABLE `techsearch_terms` (
  `id` int UNSIGNED NOT NULL,
  `term` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` int NOT NULL DEFAULT '0',
  `uses` int NOT NULL DEFAULT '0',
  `redirect_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_in_suggested_terms` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techshipments`
--

CREATE TABLE `techshipments` (
  `id` int UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` int DEFAULT NULL,
  `total_weight` int DEFAULT NULL,
  `carrier_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_number` text COLLATE utf8mb4_unicode_ci,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int UNSIGNED DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `order_address_id` int UNSIGNED DEFAULT NULL,
  `inventory_source_id` int UNSIGNED DEFAULT NULL,
  `inventory_source_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techshipment_items`
--

CREATE TABLE `techshipment_items` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `base_price` decimal(12,4) DEFAULT '0.0000',
  `total` decimal(12,4) DEFAULT '0.0000',
  `base_total` decimal(12,4) DEFAULT '0.0000',
  `product_id` int UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int UNSIGNED DEFAULT NULL,
  `shipment_id` int UNSIGNED NOT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techsitemaps`
--

CREATE TABLE `techsitemaps` (
  `id` int UNSIGNED NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `generated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techsubscribers_list`
--

CREATE TABLE `techsubscribers_list` (
  `id` int UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techsubscribers_list`
--

INSERT INTO `techsubscribers_list` (`id`, `email`, `is_subscribed`, `token`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, '20205220003@nuist.edu.cn', 1, '664de59ee02ef', 1, 1, '2024-05-22 10:01:26', '2024-05-22 10:01:26');

-- --------------------------------------------------------

--
-- Table structure for table `techtax_categories`
--

CREATE TABLE `techtax_categories` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techtax_categories_tax_rates`
--

CREATE TABLE `techtax_categories_tax_rates` (
  `id` int UNSIGNED NOT NULL,
  `tax_category_id` int UNSIGNED NOT NULL,
  `tax_rate_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techtax_rates`
--

CREATE TABLE `techtax_rates` (
  `id` int UNSIGNED NOT NULL,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT '0',
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techtheme_customizations`
--

CREATE TABLE `techtheme_customizations` (
  `id` int UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techtheme_customizations`
--

INSERT INTO `techtheme_customizations` (`id`, `type`, `name`, `sort_order`, `status`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 'image_carousel', 'Image Carousel', 1, 1, 1, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(2, 'static_content', 'Offer Information', 2, 1, 1, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(3, 'category_carousel', 'Categories Collections', 3, 1, 1, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(4, 'product_carousel', 'New Products', 4, 1, 1, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(5, 'static_content', 'Top Collections', 5, 1, 1, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(6, 'static_content', 'Bold Collections', 6, 0, 1, '2024-05-22 09:52:17', '2024-05-24 16:09:09'),
(7, 'product_carousel', 'Featured Collections', 7, 1, 1, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(8, 'static_content', 'Game Container', 8, 0, 1, '2024-05-22 09:52:17', '2024-05-24 16:08:47'),
(9, 'product_carousel', 'All Products', 9, 1, 1, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(10, 'static_content', 'Bold Collections', 10, 0, 1, '2024-05-22 09:52:17', '2024-05-24 16:08:12'),
(11, 'footer_links', 'Footer Links', 11, 1, 1, '2024-05-22 09:52:17', '2024-05-24 16:31:08'),
(12, 'services_content', 'Services Content', 12, 1, 1, '2024-05-22 09:52:17', '2024-05-22 09:52:17'),
(13, 'footer_links', 'instagram', 1, 0, 1, '2024-05-24 16:35:16', '2024-05-24 16:35:16'),
(14, 'static_content', 'Social Media', 1, 0, 1, '2024-05-24 16:56:50', '2024-05-24 16:56:50');

-- --------------------------------------------------------

--
-- Table structure for table `techtheme_customization_translations`
--

CREATE TABLE `techtheme_customization_translations` (
  `id` int UNSIGNED NOT NULL,
  `theme_customization_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techtheme_customization_translations`
--

INSERT INTO `techtheme_customization_translations` (`id`, `theme_customization_id`, `locale`, `options`) VALUES
(25, 1, 'en', '{\"images\": [{\"link\": \"\", \"image\": \"storage/theme/1/JKdNEq8Z6d6sPcOaFg3D08vEuCngOeTLtMzz7FXV.webp\", \"title\": \"Get Ready For New Collection\"}, {\"link\": \"\", \"image\": \"storage/theme/1/McCHMFdwCUU7BnrUmRwtxxAL1fH6JK8ZGV1iok6N.webp\", \"title\": \"Get Ready For New Collection\"}, {\"link\": \"\", \"image\": \"storage/theme/1/xYbeTaA3BS9OFK3bsArWnBzBsoubPNJ8EKoogmyN.webp\", \"title\": \"Get Ready For New Collection\"}, {\"link\": \"\", \"image\": \"storage/theme/1/qDhlF7Xz7d4BTPldf4W0fTQ6XFjsWw1BVyXTaIbS.webp\", \"title\": \"Get Ready For New Collection\"}]}'),
(26, 2, 'en', '{\"css\": \".home-offer h1 {display: block;font-weight: 500;text-align: center;font-size: 22px;font-family: DM Serif Display;background-color: #E8EDFE;padding-top: 20px;padding-bottom: 20px;}@media (max-width:768px){.home-offer h1 {font-size:18px;}@media (max-width:525px) {.home-offer h1 {font-size:14px;}}\", \"html\": \"<div class=\\\"home-offer\\\"><h1>Get UPTO 40% OFF on your 1st order SHOP NOW</h1></div>\"}'),
(27, 3, 'en', '{\"filters\": {\"sort\": \"asc\", \"limit\": 10, \"parent_id\": 1}}'),
(28, 4, 'en', '{\"title\": \"New Products\", \"filters\": {\"new\": 1, \"sort\": \"asc\", \"limit\": 10}}'),
(29, 5, 'en', '{\"css\": \".top-collection-container {overflow: hidden;}.top-collection-header {padding-left: 15px;padding-right: 15px;text-align: center;font-size: 70px;line-height: 90px;color: #060C3B;margin-top: 80px;}.top-collection-header h2 {max-width: 595px;margin-left: auto;margin-right: auto;font-family: DM Serif Display;}.top-collection-grid {display: flex;flex-wrap: wrap;gap: 32px;justify-content: center;margin-top: 60px;width: 100%;margin-right: auto;margin-left: auto;padding-right: 90px;padding-left: 90px;}.top-collection-card {position: relative;background: #f9fafb;overflow:hidden;border-radius:20px;}.top-collection-card img {border-radius: 16px;max-width: 100%;text-indent:-9999px;}.top-collection-card:hover img {transform: scale(1.05);transition: all 300ms ease;}.top-collection-card h3 {color: #060C3B;font-size: 30px;font-family: DM Serif Display;transform: translateX(-50%);width: max-content;left: 50%;bottom: 30px;position: absolute;margin: 0;font-weight: inherit;}@media not all and (min-width: 525px) {.top-collection-header {margin-top: 30px;}.top-collection-header {font-size: 32px;line-height: 1.5;}.top-collection-grid {gap: 15px;}}@media not all and (min-width: 1024px) {.top-collection-grid {padding-left: 30px;padding-right: 30px;}}@media (max-width: 640px) {.top-collection-grid {margin-top: 20px;}}\", \"html\": \"<div class=\\\"top-collection-container\\\"><div class=\\\"top-collection-header\\\"><h2>The game with our new additions!</h2></div><div class=\\\"container top-collection-grid\\\"><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/ErTJiy1VLxNnWBK7kTb8cOq0k77HFyBYBHs6QrcW.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/YnSIrY2rRqe6RjUzTLckJzTMcFtPGxWiVkFZFuxQ.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/6fVhvmdQHAP9RCgJo3YO7OOkXiu8GPYbSgqa55dc.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/7xwbq8NFDHgYq4qxkEZ5ndOBML0lIIBmli4NdnlY.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/PuDmghiKihmwQkvnVyPuJHOXJSKbYDZCNzbGh4Q8.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage/theme/5/FokOXQuaCn6JMT0MajumK638UB0z1Zd2TzuVezzI.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections</h3></div></div></div>\"}'),
(30, 6, 'en', '{\"css\": \".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:30px;line-height:normal}}\", \"html\": \"<div class=\\\"container section-gap\\\"> <div class=\\\"inline-col-wrapper\\\"> <div class=\\\"inline-col-image-wrapper\\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/6/85b895tVxhCKbgLhLyQZ131WbJPkcqQkqHrlC1hW.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"Get Ready for our new Bold Collections!\\\"> </div> <div class=\\\"inline-col-content-wrapper\\\"> <h2 class=\\\"inline-col-title\\\"> Get Ready for our new Bold Collections! </h2> <p class=\\\"inline-col-description\\\">Introducing Our New Bold Collections! Elevate your style with daring designs and vibrant statements. Explore striking patterns and bold colors that redefine your wardrobe. Get ready to embrace the extraordinary!</p> <button class=\\\"primary-button\\\">View All</button> </div> </div> </div>\"}'),
(31, 7, 'en', '{\"title\": \"Featured Products\", \"filters\": {\"sort\": \"desc\", \"limit\": 10, \"featured\": 1}}'),
(32, 8, 'en', '{\"css\": \".section-game {overflow: hidden;}.section-title,.section-title h2{font-weight:400;font-family:DM Serif Display}.section-title{margin-top:80px;padding-left:15px;padding-right:15px;text-align:center;line-height:90px}.section-title h2{font-size:70px;color:#060c3b;max-width:595px;margin:auto}.collection-card-wrapper{display:flex;flex-wrap:wrap;justify-content:center;gap:30px}.collection-card-wrapper .single-collection-card{position:relative}.collection-card-wrapper .single-collection-card img{border-radius:16px;background-color:#f5f5f5;max-width:100%;height:auto;text-indent:-9999px}.collection-card-wrapper .single-collection-card .overlay-text{font-size:50px;font-weight:400;max-width:234px;font-style:italic;color:#060c3b;font-family:DM Serif Display;position:absolute;bottom:30px;left:30px;margin:0}@media (max-width:1024px){.section-title{padding:0 30px}}@media (max-width:991px){.collection-card-wrapper{flex-wrap:wrap}}@media (max-width:525px){.collection-card-wrapper .single-collection-card .overlay-text{font-size:30px}.container{padding:0 30px;margin-top:20px}.section-title{margin-top:30px}.section-title h2{font-size:30px;line-height:normal}}\", \"html\": \"<div class=\\\"section-game\\\"><div class=\\\"section-title\\\"> <h2>The game with our new additions!</h2> </div> <div class=\\\"container section-gap\\\"> <div class=\\\"collection-card-wrapper\\\"> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/8/yDr3YkZPsY10fKLJu4qmukBrY8S5A26pzj37GD6P.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"The game with our new additions!\\\"> <h3 class=\\\"overlay-text\\\">Our Collections</h3> </div> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/8/SVAPo0Wg5JUyUcuIJ5iB3gca1RLKdThy2FVldt2W.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"The game with our new additions!\\\"> <h3 class=\\\"overlay-text\\\"> Our Collections </h3> </div> </div> </div> </div>\"}'),
(33, 9, 'en', '{\"title\": \"All Products\", \"filters\": {\"sort\": \"desc\", \"limit\": 10}}'),
(34, 10, 'en', '{\"css\": \".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:30px;line-height:normal}}\", \"html\": \"<div class=\\\"container section-gap\\\"> <div class=\\\"inline-col-wrapper direction-rtl\\\"> <div class=\\\"inline-col-image-wrapper \\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/10/ydvPMTB3Tzjo48N1EcI6du9osV2fItj8NnIawrvb.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"Get Ready for our new Bold Collections!\\\"> </div> <div class=\\\"inline-col-content-wrapper direction-ltr\\\"> <h2 class=\\\"inline-col-title\\\"> Get Ready for our new Bold Collections! </h2> <p class=\\\"inline-col-description\\\">Introducing Our New Bold Collections! Elevate your style with daring designs and vibrant statements. Explore striking patterns and bold colors that redefine your wardrobe. Get ready to embrace the extraordinary!</p> <button class=\\\"primary-button\\\">View All</button> </div> </div> </div>\"}'),
(35, 11, 'en', '{\"column_1\": [{\"url\": \"http://localhost:8000/page/about-us\", \"title\": \"About Us\", \"sort_order\": \"1\"}, {\"url\": \"http://localhost/page/contact-us\", \"title\": \"Contact Us\", \"sort_order\": \"2\"}, {\"url\": \"http://localhost/page/customer-service\", \"title\": \"Customer Service\", \"sort_order\": \"3\"}, {\"url\": \"http://localhost/page/terms-of-use\", \"title\": \"Terms of Use\", \"sort_order\": \"5\"}, {\"url\": \"http://localhost/page/terms-conditions\", \"title\": \"Terms & Conditions\", \"sort_order\": \"6\"}], \"column_2\": [{\"url\": \"http://localhost/page/privacy-policy\", \"title\": \"Privacy Policy\", \"sort_order\": \"1\"}, {\"url\": \"http://localhost/page/payment-policy\", \"title\": \"Payment Policy\", \"sort_order\": \"2\"}, {\"url\": \"http://localhost/page/shipping-policy\", \"title\": \"Shipping Policy\", \"sort_order\": \"3\"}, {\"url\": \"http://localhost/page/refund-policy\", \"title\": \"Refund Policy\", \"sort_order\": \"4\"}, {\"url\": \"http://localhost/page/return-policy\", \"title\": \"Return Policy\", \"sort_order\": \"5\"}], \"column_3\": [{\"url\": \"https://www.facebook.com/linediangoloshop\", \"title\": \"facebook\", \"sort_order\": \"1\"}]}'),
(36, 12, 'en', '{\"services\": [{\"title\": \"Free Shipping\", \"description\": \"Enjoy free shipping on all orders\", \"service_icon\": \"icon-truck\"}, {\"title\": \"Product Replace\", \"description\": \"Easy Product Replacement Available!\", \"service_icon\": \"icon-product\"}, {\"title\": \"Emi Available\", \"description\": \"No cost EMI available on all major credit cards\", \"service_icon\": \"icon-dollar-sign\"}, {\"title\": \"24/7 Support\", \"description\": \"Dedicated 24/7 support via chat and email\", \"service_icon\": \"icon-support\"}]}');

-- --------------------------------------------------------

--
-- Table structure for table `techurl_rewrites`
--

CREATE TABLE `techurl_rewrites` (
  `id` int UNSIGNED NOT NULL,
  `entity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techusers`
--

CREATE TABLE `techusers` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techvisits`
--

CREATE TABLE `techvisits` (
  `id` bigint UNSIGNED NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request` mediumtext COLLATE utf8mb4_unicode_ci,
  `url` mediumtext COLLATE utf8mb4_unicode_ci,
  `referer` mediumtext COLLATE utf8mb4_unicode_ci,
  `languages` text COLLATE utf8mb4_unicode_ci,
  `useragent` text COLLATE utf8mb4_unicode_ci,
  `headers` text COLLATE utf8mb4_unicode_ci,
  `device` text COLLATE utf8mb4_unicode_ci,
  `platform` text COLLATE utf8mb4_unicode_ci,
  `browser` text COLLATE utf8mb4_unicode_ci,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitable_id` bigint UNSIGNED DEFAULT NULL,
  `visitor_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitor_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `techvisits`
--

INSERT INTO `techvisits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `created_at`, `updated_at`) VALUES
(1, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en\",\"fr\",\"en-gb\",\"en-us\",\"zh-cn\",\"zh\",\"fr-ca\",\"fr-fr\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 Edg\\/125.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,fr;q=0.9,en-GB;q=0.8,en-US;q=0.7,zh-CN;q=0.6,zh;q=0.5,fr-CA;q=0.4,fr-FR;q=0.3\"]}', 'WebKit', 'Windows', 'Edge', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-05-21 10:34:12', '2024-05-21 10:34:12'),
(2, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en\",\"fr\",\"en-gb\",\"en-us\",\"zh-cn\",\"zh\",\"fr-ca\",\"fr-fr\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 Edg\\/125.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,fr;q=0.9,en-GB;q=0.8,en-US;q=0.7,zh-CN;q=0.6,zh;q=0.5,fr-CA;q=0.4,fr-FR;q=0.3\"]}', 'WebKit', 'Windows', 'Edge', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-05-22 09:52:30', '2024-05-22 09:52:30'),
(3, 'GET', '[]', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000/customer/login', '[\"en\",\"fr\",\"en-gb\",\"en-us\",\"zh-cn\",\"zh\",\"fr-ca\",\"fr-fr\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 Edg\\/125.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,fr;q=0.9,en-GB;q=0.8,en-US;q=0.7,zh-CN;q=0.6,zh;q=0.5,fr-CA;q=0.4,fr-FR;q=0.3\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6ImQ3Ui9MUzBQQTUwMFcxeHF0TzlZM3c9PSIsInZhbHVlIjoibjJNRXc3WVRKcnVlZkdzSmhJVlB2S2FtQ1pJbjVncjRQTUd3bUxscXphK1UvRjVDa1h1VlJ1cFdBeEZSVUFLenplbUxSQ09lNzZkUU1SY3pWMDBwYklQQmhKdnpHR0pvVDJxQmZ0S1NyeEMzOVY5dEhSQjdvNWovdXl6WEVUODYiLCJtYWMiOiIxNWM1MTRmZWE2NmU5YTZiZTc4NGJiOTlkNTJhM2IyY2YxNDJjNGUxYjU1NTMwZDk1MWQzNTgxZTc5NjYxMzYzIiwidGFnIjoiIn0%3D; fjsmarttechmachinery_session=eyJpdiI6ImpwNWE1RFNoSTZFV2VETFFQSC9WQmc9PSIsInZhbHVlIjoieEljWGp3SXFHVVZlV3hXYmlQS1B5bzBYWkdhbC9uZVhqdGNhZUNnZTVRZ28vVko3QjhIY0ZOazh5R1Bpd2VrSlJyY0JPTzR0QmdDOURJalk4SXhONThpeGRFTzF0enJBQkdYK3gwUTY1TVV5WEFDRHFiZWxsV0VLQ0ZvdW9WSkEiLCJtYWMiOiIwY2RlMjI2ZDkxOTdjNDczMmU1NDkwNWUxZjhhMzYyY2MzNzYzYzM5MTJmYzAxMzRmMzUwNDU3NDQwYzhhZGY2IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Edge', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, '2024-05-22 10:01:44', '2024-05-22 10:01:44'),
(4, 'GET', '[]', 'http://127.0.0.1:8000/smart-switches', 'http://127.0.0.1:8000/', '[\"en\",\"fr\",\"en-gb\",\"en-us\",\"zh-cn\",\"zh\",\"fr-ca\",\"fr-fr\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 Edg\\/125.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,fr;q=0.9,en-GB;q=0.8,en-US;q=0.7,zh-CN;q=0.6,zh;q=0.5,fr-CA;q=0.4,fr-FR;q=0.3\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6InhwYkVpdG1Ca3BPdWZOcnhZQmlHenc9PSIsInZhbHVlIjoieFVzcUc3N29LZVlZRVRTMWQwd0FzY0d4L28rWUFEREVrNTZxbU9uT2twNjFnTm9Mc2E1eUdSTzdiN3doekN0cnI0Q3RMa2Rzc1JPT0dwVmpWY1hHa2NvdmUzTVljTldjMk0rWDMvSHg0bUhtVFZ1eEVDMlJFdWQrdGMvb2ZOTEEiLCJtYWMiOiIxNmZkZjFhNjU4YTI1OGY1NDg4MjY4MDM3NmYyYmZkNWJhNzM3NTJiZTM0NDc0MWZiNzQ1NDM0MDA5YzQ4MjBjIiwidGFnIjoiIn0%3D; fjsmarttechmachinery_session=eyJpdiI6InArRk9FNkJPdGRja3BuNzNkNVlCTVE9PSIsInZhbHVlIjoiWUdMbHZhN1F4TUdYakxkRzFSdktnMCt6UTdNN2ZCZnY4eXZLQytKMjhaOWZKV05wcXBlalRac3lWRjV3VlJ3dkUxbytXdVJxT0E5WVFsbVZOZmpxbk9WQWRSVHdsNGVpaGNFaDk5R2dIb09GK0M2YlRjL3VyK2VUV2NuTE12c3UiLCJtYWMiOiJlMGUxNmQ3NzhlNTJjYzEwMzRkZjQ4MTAwMjhhODJlZGE1ZjVlNTY1ZjJmZDc1ZjdkMGUzZWMyZjBkNjg3NzE1IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Edge', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, 'Webkul\\Customer\\Models\\Customer', 1, '2024-05-22 10:56:35', '2024-05-22 10:56:35'),
(5, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en\",\"fr\",\"en-gb\",\"en-us\",\"zh-cn\",\"zh\",\"fr-ca\",\"fr-fr\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 Edg\\/125.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,fr;q=0.9,en-GB;q=0.8,en-US;q=0.7,zh-CN;q=0.6,zh;q=0.5,fr-CA;q=0.4,fr-FR;q=0.3\"],\"cookie\":[\"fjsmarttechmachinery_session=eyJpdiI6IkRNUmRtWnpEY0dUd1FCSWxnUjVLUUE9PSIsInZhbHVlIjoiWXRHTmJ3RlRtbTNLQURoUkdxUmxzd1dlQS9WVWU4ZWw1MU5WMkRZZTA3Y1dmd2tsNWVPWEFTb3gvSFN2TFd1T3ZZakFSTlRPYnk2dXh4V0d3aUoyZThCbGYyWGh1OW50SGxCL0pxS2tKSXNwaUJuMVlxQWlHQmhEQWRZVTgyaWkiLCJtYWMiOiI2YzYwNjJiZDY2YTZkODJjYWZjMDkwZDUwZjkxY2JiODM3YjlkOGIyMWU2OWIzZTVkMjIwNGRkMDlmYzI4MTg5IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Edge', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-05-23 11:50:03', '2024-05-23 11:50:03'),
(6, 'GET', '[]', 'http://127.0.0.1:8000/smart-switches', 'http://127.0.0.1:8000/', '[\"en\",\"fr\",\"en-gb\",\"en-us\",\"zh-cn\",\"zh\",\"fr-ca\",\"fr-fr\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 Edg\\/125.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,fr;q=0.9,en-GB;q=0.8,en-US;q=0.7,zh-CN;q=0.6,zh;q=0.5,fr-CA;q=0.4,fr-FR;q=0.3\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IkUwY2FjOTNOZEZLVkVjWTdCenZ4Umc9PSIsInZhbHVlIjoiK0RoOHREZkJYNWlmYUNObFdrYWVCTWtPaW9qMW5EMDI5cWdKbi9VbmprclJIV3E4eWFtd2ZFSkpYb0VCVDVlU3F3dXp4anNkTHVqNnoycDh0QStrN0pEb3VVclc4R0pvS2YyRHVKUTA3Rml0aGo4L2srUllkcldrQ2JUSTlEeWkiLCJtYWMiOiI3MGEzYTA5OWViOTE3MDBlYjk2NTMwZjEwNDNkNTQ5ZmI2NmFhMzI2M2VlMGIwMjUyN2NkZWE0ZmJjYmNiMDQ0IiwidGFnIjoiIn0%3D; fjsmarttechmachinery_session=eyJpdiI6ImFCMVR6VDEyMG9jd29qYUptbzhtU1E9PSIsInZhbHVlIjoiZDBtc1ZLN3RUcDBVWitaM2syaVMvVlplQm1BMTAyQ2hyVWlkMDNnc1RGVkcyK1BYREV3bHp4K2dpdTFQcVFURzV6b0ViMVVxUW5ITlpyakpXc283QlgxVGlVRkhXRVdWWFVsRjN1OVNrZk1FRUw5VDFVRm5EaExkN0FLdHFZZDYiLCJtYWMiOiI4ZjFhZmQ0OGFkNjc5OWVjN2JhN2I1NDc5N2UyN2YxMmU5Yjg1YWNjY2ZmZTYxMWQyYWNjMjMxNmU0M2Q0ZDFkIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Edge', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, NULL, NULL, '2024-05-23 12:18:05', '2024-05-23 12:18:05'),
(7, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en\",\"fr\",\"en-gb\",\"en-us\",\"zh-cn\",\"zh\",\"fr-ca\",\"fr-fr\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 Edg\\/125.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,fr;q=0.9,en-GB;q=0.8,en-US;q=0.7,zh-CN;q=0.6,zh;q=0.5,fr-CA;q=0.4,fr-FR;q=0.3\"],\"cookie\":[\"fjsmarttechmachinery_session=eyJpdiI6Ii83SDJWNHdORTI4bHJkQ0k3SFpLbFE9PSIsInZhbHVlIjoiWmJzc2s0eUs5V0lSdGdmQ2E1ZzZSOVZSTkxHZHo3SFBCZjA1NjJBeGp2SEo2anBpK1VyamNxUnpPcFR3VDgvYm9BRGFuNHo2eHM5SzlDQUNBbE91UmFiSWU1UkI1OGFDMmt4TXBBYVM0YmlIVEtrSlRlWkpGOXJTUllUQ3poNjQiLCJtYWMiOiJjOGVhOTkzZjExYzZiNGI4YmE3MzczZjI4Mzg4NDcxMjA1MTg2Mjk3YjUzY2NhZjc0MWZmODAxYjMwOWU1MzliIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Edge', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-05-24 15:08:54', '2024-05-24 15:08:54'),
(8, 'GET', '[]', 'http://127.0.0.1:8000/smart-switches', 'http://127.0.0.1:8000/', '[\"en\",\"fr\",\"en-gb\",\"en-us\",\"zh-cn\",\"zh\",\"fr-ca\",\"fr-fr\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 Edg\\/125.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,fr;q=0.9,en-GB;q=0.8,en-US;q=0.7,zh-CN;q=0.6,zh;q=0.5,fr-CA;q=0.4,fr-FR;q=0.3\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IlY3WlFFN0ZZaHFic1Rnem5uM0hQaVE9PSIsInZhbHVlIjoiLzh5dklyYUJqOHNWT3BIbk1temNVUWVkQzRTeThHOFFYVmNwZmNBSVRxa3JQZitaS2xoSnp1TXlXL1NVa1p3WGxEMnFUWGxVU1J6Y3g4QzRTcEo1R1dpaW5hSVNSWFpIMnNaR0lKU25YYXU0MmVoZEFqbkxvYVR6K0R4L1BKQXkiLCJtYWMiOiJjYmUwY2E0ZDI2NmIzY2RiZmMyNDgyYzlmMGI4OGMzNzliM2Q3ZjUyMjE4YjJmYzhlYWE3MWRiNjZmM2RhZWU4IiwidGFnIjoiIn0%3D; fjsmarttechmachinery_session=eyJpdiI6IlRXVWFtUGhBRHpKWUQ5eDR1R3Rja3c9PSIsInZhbHVlIjoiM014MVluWlk1c05DWSticUtsNGN6ZTQ5cm5CWTl1NFpNdjFkeVl2QTJQRmc4TTJRdFdGNHhIalRldTRoMWJwSzNZa1NlWW1hQnBHUTErYlV1Q1psQVE0TjhKekVEQk1PNTYyTXFBSHl6bTFEMGFVRXM0RFpPbWtjMlJBL04rL0YiLCJtYWMiOiIyMzk2ZjVhNjg4NTYxMGYyMTQ3ZTJhNTUxNDBlZjc0YjZjYjBlYjA2OTEwZTIzZjdhZmJlMGQxMjE5OWU1MGY2IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Edge', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, NULL, NULL, '2024-05-24 15:14:24', '2024-05-24 15:14:24'),
(9, 'GET', '[]', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000/smart-switches', '[\"en\",\"fr\",\"en-gb\",\"en-us\",\"zh-cn\",\"zh\",\"fr-ca\",\"fr-fr\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 Edg\\/125.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/smart-switches\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,fr;q=0.9,en-GB;q=0.8,en-US;q=0.7,zh-CN;q=0.6,zh;q=0.5,fr-CA;q=0.4,fr-FR;q=0.3\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IjFnNVpYeElKWGR5WE4ySUM2T24rbnc9PSIsInZhbHVlIjoiTW82WUphOTdXTU9yVWhGYlFOY1NRUThlc092ekZHNDZ3ZmY0bEpyT3p4dVNVTzBCMEt5RHBKdXdOckZFZCtmdkN3ZjMxZWJRSUNkaXg1R3ZURmlveUtMVU9meHcxQWE0clVHMEZsbkh5M2VhZElYcTJYS2lHcTBsc2JOKzh6VmciLCJtYWMiOiJjYzZkMGEwNDVmNTViYmJiMGIyMjU5ZDg2ODI4OTc2ZTJiMjUwZTNkN2QwYjdmOGMwOWZkZTdhODQ3M2Y0ZTdmIiwidGFnIjoiIn0%3D; fjsmarttechmachinery_session=eyJpdiI6Ik0wVXRSeG1vMDRsayszNFpQOHhuWFE9PSIsInZhbHVlIjoiUHdjeGRtTW9DK3pyTVczdXI1VHpkWG5ab2dXVWtZbVp1Z2Q5NWJLV2F0QzQvaE1wbUJyUktFR1R1Zi9MU2NJcVRIekxZQm9YTEkxQ2VVSEZXNTYwTGYzWXF5dGVJUTRhOURsa2tmaEhDY3pOT1FMdGhGckU3RkdZdjNxNWVJQ2siLCJtYWMiOiJmOTY4OTlmMDFiN2I2Y2UwZDhjMmFkMWVjN2VmNWZjNTg5ODI4YzM1Zjk5YmZjZjRhOGNhMmNhMThmZGJhZTI4IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Edge', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-05-24 16:00:51', '2024-05-24 16:00:51'),
(10, 'GET', '[]', 'http://localhost:8000', 'http://localhost:8000/page/about-us', '[\"en\",\"fr\",\"en-gb\",\"en-us\",\"zh-cn\",\"zh\",\"fr-ca\",\"fr-fr\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 Edg\\/125.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/localhost:8000\\/page\\/about-us\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,fr;q=0.9,en-GB;q=0.8,en-US;q=0.7,zh-CN;q=0.6,zh;q=0.5,fr-CA;q=0.4,fr-FR;q=0.3\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IklaYW41dUNHS3R5d1dQSzJHajBvNUE9PSIsInZhbHVlIjoiTTUxTGtaVWZhTlFpcWhZbGVoYjFNOVFseVNNK0Y2aExhMDBjQmU1SDJ0TDBSU0VoYmJxM0YvRTdkOTJ1N29lOEl6QXBBNnNLTFZEN0Z4UnNPaTlVVXJ0S2xCazJPNTdTZnpCcm5OWU1VZVhhWS9SbWMwYkFPeGg5QkRDY0FOdmUiLCJtYWMiOiIxNzk3NmI3OGE3OGMxNWJlNzZmNDljYzgzYzNjYjZkODlhMzE4YTJiNDE1NGQ0YzIxZjViOWEyZmI0MzAwZjU4IiwidGFnIjoiIn0%3D; fjsmarttechmachinery_session=eyJpdiI6Inp5QjBCZ0Z4aHBldVdseTd5UkpTT1E9PSIsInZhbHVlIjoiaEdaR3NQc3lzZzh6WTlvbWw5MnlWcFdWd0Jza0EvTHUybVh6YUJYYUp5dmJPYWR4NUZOZURqTXRXWXlCU3N4OUlUZ3NIeWd1a0JNeFg4ZGVaaE82dFpWMG9YbWFXbjhOZDZNOW13aitRME9oTnJkZ3ppYVRKZjlYNm8vSWRyV1AiLCJtYWMiOiJmN2VlMWQ2MzFmNWFjNjg3YjY5M2FiMTY2MDAyYjQ0ODMyMTVhZDEwYTc4MGM1M2VmNDdhOGZkMWVjYjQwYmZlIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Edge', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-05-24 16:54:15', '2024-05-24 16:54:15'),
(11, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"en\",\"fr\",\"en-gb\",\"en-us\",\"zh-cn\",\"zh\",\"fr-ca\",\"fr-fr\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Microsoft Edge\\\";v=\\\"125\\\", \\\"Chromium\\\";v=\\\"125\\\", \\\"Not.A\\/Brand\\\";v=\\\"24\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/125.0.0.0 Safari\\/537.36 Edg\\/125.0.0.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,fr;q=0.9,en-GB;q=0.8,en-US;q=0.7,zh-CN;q=0.6,zh;q=0.5,fr-CA;q=0.4,fr-FR;q=0.3\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IlowOXFnVUJPUnl3MWR4T0gvZC9vemc9PSIsInZhbHVlIjoibTB3a0EzK3hFUWUvaDYyUVhDckRXa2NiZm1vUmdhZkl3R001TWxBSk9YZDlSZ2J6dXptU2lKYmppWHNUQVRadWVET0duYkM2em8ydkYyb21NcGt0R1hyQm9CbUdsWFVhVUR3bmFCUmhwcUU5TTh1ZmxoMHhSWTZsYXFUYTRpOXkiLCJtYWMiOiJkMWJiYmU5MzUzNjJmODdmYjM0NzgzZTM3NTU0ZGFlYjhjMjJiODZmYzRlZDAzOWNmYmI3NzY3ODgwZTBmMzMyIiwidGFnIjoiIn0%3D; ezfolio_session=eyJpdiI6IkpyL0FVc3c0NHY5eWxlNXIrQzZNMWc9PSIsInZhbHVlIjoiMDlSelRreCtZZWRHOTV5d2Rsc3pVRWlqWnR1RUp4UzRMa0ROdExadzB6amg2c1ZWbzZCWFFSV0xzZWhxMURZME1ybzBlUUtOU21ZYVcwQ0RUMGpqak5nVytVczIzZjdGMkplejhQUEx5NW5XNW8xZ3hrUDRFVmVpMlNHaGVmRUsiLCJtYWMiOiI4NDk5YTU3YmM3MmEyYzYxZjM3ZjIwNTYwMDRmODgzODAwYTlmODYzODdlZDQyODJkMWUxODNhNDE2YmRlYTFiIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Edge', '127.0.0.1', NULL, NULL, NULL, NULL, '2024-05-28 11:19:22', '2024-05-28 11:19:22');

-- --------------------------------------------------------

--
-- Table structure for table `techwishlist`
--

CREATE TABLE `techwishlist` (
  `id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `item_options` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `techwishlist_items`
--

CREATE TABLE `techwishlist_items` (
  `id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `additional` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `techaddresses`
--
ALTER TABLE `techaddresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_customer_id_foreign` (`customer_id`),
  ADD KEY `addresses_cart_id_foreign` (`cart_id`),
  ADD KEY `addresses_order_id_foreign` (`order_id`),
  ADD KEY `addresses_parent_address_id_foreign` (`parent_address_id`);

--
-- Indexes for table `techadmins`
--
ALTER TABLE `techadmins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_api_token_unique` (`api_token`);

--
-- Indexes for table `techadmin_password_resets`
--
ALTER TABLE `techadmin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Indexes for table `techattributes`
--
ALTER TABLE `techattributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_code_unique` (`code`);

--
-- Indexes for table `techattribute_families`
--
ALTER TABLE `techattribute_families`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `techattribute_groups`
--
ALTER TABLE `techattribute_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`);

--
-- Indexes for table `techattribute_group_mappings`
--
ALTER TABLE `techattribute_group_mappings`
  ADD PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  ADD KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`);

--
-- Indexes for table `techattribute_options`
--
ALTER TABLE `techattribute_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_options_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `techattribute_option_translations`
--
ALTER TABLE `techattribute_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_option_translations_attribute_option_id_locale_unique` (`attribute_option_id`,`locale`);

--
-- Indexes for table `techattribute_translations`
--
ALTER TABLE `techattribute_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`);

--
-- Indexes for table `techcart`
--
ALTER TABLE `techcart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_customer_id_foreign` (`customer_id`),
  ADD KEY `cart_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `techcart_items`
--
ALTER TABLE `techcart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_parent_id_foreign` (`parent_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_tax_category_id_foreign` (`tax_category_id`);

--
-- Indexes for table `techcart_item_inventories`
--
ALTER TABLE `techcart_item_inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `techcart_payment`
--
ALTER TABLE `techcart_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_payment_cart_id_foreign` (`cart_id`);

--
-- Indexes for table `techcart_rules`
--
ALTER TABLE `techcart_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `techcart_rule_channels`
--
ALTER TABLE `techcart_rule_channels`
  ADD PRIMARY KEY (`cart_rule_id`,`channel_id`),
  ADD KEY `cart_rule_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `techcart_rule_coupons`
--
ALTER TABLE `techcart_rule_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`);

--
-- Indexes for table `techcart_rule_coupon_usage`
--
ALTER TABLE `techcart_rule_coupon_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  ADD KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `techcart_rule_customers`
--
ALTER TABLE `techcart_rule_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  ADD KEY `cart_rule_customers_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `techcart_rule_customer_groups`
--
ALTER TABLE `techcart_rule_customer_groups`
  ADD PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  ADD KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `techcart_rule_translations`
--
ALTER TABLE `techcart_rule_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`);

--
-- Indexes for table `techcart_shipping_rates`
--
ALTER TABLE `techcart_shipping_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `techcatalog_rules`
--
ALTER TABLE `techcatalog_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `techcatalog_rule_channels`
--
ALTER TABLE `techcatalog_rule_channels`
  ADD PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  ADD KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `techcatalog_rule_customer_groups`
--
ALTER TABLE `techcatalog_rule_customer_groups`
  ADD PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  ADD KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `techcatalog_rule_products`
--
ALTER TABLE `techcatalog_rule_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  ADD KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  ADD KEY `catalog_rule_products_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `techcatalog_rule_product_prices`
--
ALTER TABLE `techcatalog_rule_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  ADD KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  ADD KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `techcategories`
--
ALTER TABLE `techcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Indexes for table `techcategory_filterable_attributes`
--
ALTER TABLE `techcategory_filterable_attributes`
  ADD KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  ADD KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `techcategory_translations`
--
ALTER TABLE `techcategory_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  ADD KEY `category_translations_locale_id_foreign` (`locale_id`);

--
-- Indexes for table `techchannels`
--
ALTER TABLE `techchannels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channels_root_category_id_foreign` (`root_category_id`),
  ADD KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  ADD KEY `channels_base_currency_id_foreign` (`base_currency_id`);

--
-- Indexes for table `techchannel_currencies`
--
ALTER TABLE `techchannel_currencies`
  ADD PRIMARY KEY (`channel_id`,`currency_id`),
  ADD KEY `channel_currencies_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `techchannel_inventory_sources`
--
ALTER TABLE `techchannel_inventory_sources`
  ADD UNIQUE KEY `channel_inventory_sources_channel_id_inventory_source_id_unique` (`channel_id`,`inventory_source_id`),
  ADD KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Indexes for table `techchannel_locales`
--
ALTER TABLE `techchannel_locales`
  ADD PRIMARY KEY (`channel_id`,`locale_id`),
  ADD KEY `channel_locales_locale_id_foreign` (`locale_id`);

--
-- Indexes for table `techchannel_translations`
--
ALTER TABLE `techchannel_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  ADD KEY `channel_translations_locale_index` (`locale`);

--
-- Indexes for table `techcms_pages`
--
ALTER TABLE `techcms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `techcms_page_channels`
--
ALTER TABLE `techcms_page_channels`
  ADD UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  ADD KEY `cms_page_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `techcms_page_translations`
--
ALTER TABLE `techcms_page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`);

--
-- Indexes for table `techcompare_items`
--
ALTER TABLE `techcompare_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compare_items_product_id_foreign` (`product_id`),
  ADD KEY `compare_items_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `techcore_config`
--
ALTER TABLE `techcore_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `techcountries`
--
ALTER TABLE `techcountries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `techcountry_states`
--
ALTER TABLE `techcountry_states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_states_country_id_foreign` (`country_id`);

--
-- Indexes for table `techcountry_state_translations`
--
ALTER TABLE `techcountry_state_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_state_translations_country_state_id_foreign` (`country_state_id`);

--
-- Indexes for table `techcountry_translations`
--
ALTER TABLE `techcountry_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_translations_country_id_foreign` (`country_id`);

--
-- Indexes for table `techcurrencies`
--
ALTER TABLE `techcurrencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `techcurrency_exchange_rates`
--
ALTER TABLE `techcurrency_exchange_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`);

--
-- Indexes for table `techcustomers`
--
ALTER TABLE `techcustomers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`),
  ADD UNIQUE KEY `customers_phone_unique` (`phone`),
  ADD UNIQUE KEY `customers_api_token_unique` (`api_token`),
  ADD KEY `customers_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `techcustomer_groups`
--
ALTER TABLE `techcustomer_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_groups_code_unique` (`code`);

--
-- Indexes for table `techcustomer_notes`
--
ALTER TABLE `techcustomer_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_notes_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `techcustomer_password_resets`
--
ALTER TABLE `techcustomer_password_resets`
  ADD KEY `customer_password_resets_email_index` (`email`);

--
-- Indexes for table `techcustomer_social_accounts`
--
ALTER TABLE `techcustomer_social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  ADD KEY `customer_social_accounts_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `techdownloadable_link_purchased`
--
ALTER TABLE `techdownloadable_link_purchased`
  ADD PRIMARY KEY (`id`),
  ADD KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  ADD KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  ADD KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `techfailed_jobs`
--
ALTER TABLE `techfailed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `techimports`
--
ALTER TABLE `techimports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `techimport_batches`
--
ALTER TABLE `techimport_batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `import_batches_import_id_foreign` (`import_id`);

--
-- Indexes for table `techinventory_sources`
--
ALTER TABLE `techinventory_sources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventory_sources_code_unique` (`code`);

--
-- Indexes for table `techinvoices`
--
ALTER TABLE `techinvoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_order_id_foreign` (`order_id`);

--
-- Indexes for table `techinvoice_items`
--
ALTER TABLE `techinvoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_items_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `techjobs`
--
ALTER TABLE `techjobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `techjob_batches`
--
ALTER TABLE `techjob_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `techlocales`
--
ALTER TABLE `techlocales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `locales_code_unique` (`code`);

--
-- Indexes for table `techmarketing_campaigns`
--
ALTER TABLE `techmarketing_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  ADD KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  ADD KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`);

--
-- Indexes for table `techmarketing_events`
--
ALTER TABLE `techmarketing_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `techmarketing_templates`
--
ALTER TABLE `techmarketing_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `techmigrations`
--
ALTER TABLE `techmigrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technotifications`
--
ALTER TABLE `technotifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_order_id_foreign` (`order_id`);

--
-- Indexes for table `techorders`
--
ALTER TABLE `techorders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `techorder_comments`
--
ALTER TABLE `techorder_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_comments_order_id_foreign` (`order_id`);

--
-- Indexes for table `techorder_items`
--
ALTER TABLE `techorder_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_parent_id_foreign` (`parent_id`),
  ADD KEY `order_items_tax_category_id_foreign` (`tax_category_id`);

--
-- Indexes for table `techorder_payment`
--
ALTER TABLE `techorder_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_payment_order_id_foreign` (`order_id`);

--
-- Indexes for table `techorder_transactions`
--
ALTER TABLE `techorder_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `techpassword_resets`
--
ALTER TABLE `techpassword_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `techpersonal_access_tokens`
--
ALTER TABLE `techpersonal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `techproducts`
--
ALTER TABLE `techproducts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  ADD KEY `products_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `techproduct_attribute_values`
--
ALTER TABLE `techproduct_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  ADD UNIQUE KEY `product_attribute_values_unique_id_unique` (`unique_id`),
  ADD KEY `product_attribute_values_product_id_foreign` (`product_id`),
  ADD KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `techproduct_bundle_options`
--
ALTER TABLE `techproduct_bundle_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_bundle_options_product_id_foreign` (`product_id`);

--
-- Indexes for table `techproduct_bundle_option_products`
--
ALTER TABLE `techproduct_bundle_option_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bundle_option_products_product_id_bundle_option_id_unique` (`product_id`,`product_bundle_option_id`),
  ADD KEY `product_bundle_option_products_product_bundle_option_id_foreign` (`product_bundle_option_id`);

--
-- Indexes for table `techproduct_bundle_option_translations`
--
ALTER TABLE `techproduct_bundle_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  ADD UNIQUE KEY `bundle_option_translations_locale_label_bundle_option_id_unique` (`locale`,`label`,`product_bundle_option_id`);

--
-- Indexes for table `techproduct_categories`
--
ALTER TABLE `techproduct_categories`
  ADD UNIQUE KEY `product_categories_product_id_category_id_unique` (`product_id`,`category_id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `techproduct_cross_sells`
--
ALTER TABLE `techproduct_cross_sells`
  ADD UNIQUE KEY `product_cross_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  ADD KEY `product_cross_sells_child_id_foreign` (`child_id`);

--
-- Indexes for table `techproduct_customer_group_prices`
--
ALTER TABLE `techproduct_customer_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_customer_group_prices_unique_id_unique` (`unique_id`),
  ADD KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  ADD KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `techproduct_downloadable_links`
--
ALTER TABLE `techproduct_downloadable_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_downloadable_links_product_id_foreign` (`product_id`);

--
-- Indexes for table `techproduct_downloadable_link_translations`
--
ALTER TABLE `techproduct_downloadable_link_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`);

--
-- Indexes for table `techproduct_downloadable_samples`
--
ALTER TABLE `techproduct_downloadable_samples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_downloadable_samples_product_id_foreign` (`product_id`);

--
-- Indexes for table `techproduct_downloadable_sample_translations`
--
ALTER TABLE `techproduct_downloadable_sample_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`);

--
-- Indexes for table `techproduct_flat`
--
ALTER TABLE `techproduct_flat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  ADD KEY `product_flat_attribute_family_id_foreign` (`attribute_family_id`),
  ADD KEY `product_flat_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `techproduct_grouped_products`
--
ALTER TABLE `techproduct_grouped_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_grouped_products_product_id_associated_product_id_unique` (`product_id`,`associated_product_id`),
  ADD KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`);

--
-- Indexes for table `techproduct_images`
--
ALTER TABLE `techproduct_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `techproduct_inventories`
--
ALTER TABLE `techproduct_inventories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  ADD KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Indexes for table `techproduct_inventory_indices`
--
ALTER TABLE `techproduct_inventory_indices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_inventory_indices_product_id_channel_id_unique` (`product_id`,`channel_id`),
  ADD KEY `product_inventory_indices_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `techproduct_ordered_inventories`
--
ALTER TABLE `techproduct_ordered_inventories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  ADD KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `techproduct_price_indices`
--
ALTER TABLE `techproduct_price_indices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `price_indices_product_id_customer_group_id_channel_id_unique` (`product_id`,`customer_group_id`,`channel_id`),
  ADD KEY `product_price_indices_channel_id_foreign` (`channel_id`),
  ADD KEY `product_price_indices_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `techproduct_relations`
--
ALTER TABLE `techproduct_relations`
  ADD UNIQUE KEY `product_relations_parent_id_child_id_unique` (`parent_id`,`child_id`),
  ADD KEY `product_relations_child_id_foreign` (`child_id`);

--
-- Indexes for table `techproduct_reviews`
--
ALTER TABLE `techproduct_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `techproduct_review_attachments`
--
ALTER TABLE `techproduct_review_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_review_images_review_id_foreign` (`review_id`);

--
-- Indexes for table `techproduct_super_attributes`
--
ALTER TABLE `techproduct_super_attributes`
  ADD UNIQUE KEY `product_super_attributes_product_id_attribute_id_unique` (`product_id`,`attribute_id`),
  ADD KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `techproduct_up_sells`
--
ALTER TABLE `techproduct_up_sells`
  ADD UNIQUE KEY `product_up_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  ADD KEY `product_up_sells_child_id_foreign` (`child_id`);

--
-- Indexes for table `techproduct_videos`
--
ALTER TABLE `techproduct_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_videos_product_id_foreign` (`product_id`);

--
-- Indexes for table `techrefunds`
--
ALTER TABLE `techrefunds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refunds_order_id_foreign` (`order_id`);

--
-- Indexes for table `techrefund_items`
--
ALTER TABLE `techrefund_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refund_items_parent_id_foreign` (`parent_id`),
  ADD KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  ADD KEY `refund_items_refund_id_foreign` (`refund_id`);

--
-- Indexes for table `techroles`
--
ALTER TABLE `techroles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `techsearch_synonyms`
--
ALTER TABLE `techsearch_synonyms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `techsearch_terms`
--
ALTER TABLE `techsearch_terms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `search_terms_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `techshipments`
--
ALTER TABLE `techshipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipments_order_id_foreign` (`order_id`),
  ADD KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Indexes for table `techshipment_items`
--
ALTER TABLE `techshipment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipment_items_shipment_id_foreign` (`shipment_id`);

--
-- Indexes for table `techsitemaps`
--
ALTER TABLE `techsitemaps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `techsubscribers_list`
--
ALTER TABLE `techsubscribers_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  ADD KEY `subscribers_list_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `techtax_categories`
--
ALTER TABLE `techtax_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_categories_code_unique` (`code`);

--
-- Indexes for table `techtax_categories_tax_rates`
--
ALTER TABLE `techtax_categories_tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  ADD KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`);

--
-- Indexes for table `techtax_rates`
--
ALTER TABLE `techtax_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_rates_identifier_unique` (`identifier`);

--
-- Indexes for table `techtheme_customizations`
--
ALTER TABLE `techtheme_customizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_customizations_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `techtheme_customization_translations`
--
ALTER TABLE `techtheme_customization_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_customization_translations_theme_customization_id_foreign` (`theme_customization_id`);

--
-- Indexes for table `techurl_rewrites`
--
ALTER TABLE `techurl_rewrites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `techusers`
--
ALTER TABLE `techusers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `techvisits`
--
ALTER TABLE `techvisits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visits_visitable_type_visitable_id_index` (`visitable_type`,`visitable_id`),
  ADD KEY `visits_visitor_type_visitor_id_index` (`visitor_type`,`visitor_id`);

--
-- Indexes for table `techwishlist`
--
ALTER TABLE `techwishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_channel_id_foreign` (`channel_id`),
  ADD KEY `wishlist_product_id_foreign` (`product_id`),
  ADD KEY `wishlist_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `techwishlist_items`
--
ALTER TABLE `techwishlist_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_items_channel_id_foreign` (`channel_id`),
  ADD KEY `wishlist_items_product_id_foreign` (`product_id`),
  ADD KEY `wishlist_items_customer_id_foreign` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `techaddresses`
--
ALTER TABLE `techaddresses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techadmins`
--
ALTER TABLE `techadmins`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `techattributes`
--
ALTER TABLE `techattributes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `techattribute_families`
--
ALTER TABLE `techattribute_families`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `techattribute_groups`
--
ALTER TABLE `techattribute_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `techattribute_options`
--
ALTER TABLE `techattribute_options`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `techattribute_option_translations`
--
ALTER TABLE `techattribute_option_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `techattribute_translations`
--
ALTER TABLE `techattribute_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `techcart`
--
ALTER TABLE `techcart`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcart_items`
--
ALTER TABLE `techcart_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcart_item_inventories`
--
ALTER TABLE `techcart_item_inventories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcart_payment`
--
ALTER TABLE `techcart_payment`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcart_rules`
--
ALTER TABLE `techcart_rules`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcart_rule_coupons`
--
ALTER TABLE `techcart_rule_coupons`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcart_rule_coupon_usage`
--
ALTER TABLE `techcart_rule_coupon_usage`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcart_rule_customers`
--
ALTER TABLE `techcart_rule_customers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcart_rule_translations`
--
ALTER TABLE `techcart_rule_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcart_shipping_rates`
--
ALTER TABLE `techcart_shipping_rates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcatalog_rules`
--
ALTER TABLE `techcatalog_rules`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcatalog_rule_products`
--
ALTER TABLE `techcatalog_rule_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcatalog_rule_product_prices`
--
ALTER TABLE `techcatalog_rule_product_prices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcategories`
--
ALTER TABLE `techcategories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `techcategory_translations`
--
ALTER TABLE `techcategory_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `techchannels`
--
ALTER TABLE `techchannels`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `techchannel_translations`
--
ALTER TABLE `techchannel_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `techcms_pages`
--
ALTER TABLE `techcms_pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `techcms_page_translations`
--
ALTER TABLE `techcms_page_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `techcompare_items`
--
ALTER TABLE `techcompare_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcore_config`
--
ALTER TABLE `techcore_config`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `techcountries`
--
ALTER TABLE `techcountries`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `techcountry_states`
--
ALTER TABLE `techcountry_states`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=587;

--
-- AUTO_INCREMENT for table `techcountry_state_translations`
--
ALTER TABLE `techcountry_state_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcountry_translations`
--
ALTER TABLE `techcountry_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcurrencies`
--
ALTER TABLE `techcurrencies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `techcurrency_exchange_rates`
--
ALTER TABLE `techcurrency_exchange_rates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcustomers`
--
ALTER TABLE `techcustomers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `techcustomer_groups`
--
ALTER TABLE `techcustomer_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `techcustomer_notes`
--
ALTER TABLE `techcustomer_notes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techcustomer_social_accounts`
--
ALTER TABLE `techcustomer_social_accounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techdownloadable_link_purchased`
--
ALTER TABLE `techdownloadable_link_purchased`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techfailed_jobs`
--
ALTER TABLE `techfailed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techimports`
--
ALTER TABLE `techimports`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techimport_batches`
--
ALTER TABLE `techimport_batches`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techinventory_sources`
--
ALTER TABLE `techinventory_sources`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `techinvoices`
--
ALTER TABLE `techinvoices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techinvoice_items`
--
ALTER TABLE `techinvoice_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techjobs`
--
ALTER TABLE `techjobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techlocales`
--
ALTER TABLE `techlocales`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `techmarketing_campaigns`
--
ALTER TABLE `techmarketing_campaigns`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techmarketing_events`
--
ALTER TABLE `techmarketing_events`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `techmarketing_templates`
--
ALTER TABLE `techmarketing_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techmigrations`
--
ALTER TABLE `techmigrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `technotifications`
--
ALTER TABLE `technotifications`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techorders`
--
ALTER TABLE `techorders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techorder_comments`
--
ALTER TABLE `techorder_comments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techorder_items`
--
ALTER TABLE `techorder_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techorder_payment`
--
ALTER TABLE `techorder_payment`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techorder_transactions`
--
ALTER TABLE `techorder_transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techpersonal_access_tokens`
--
ALTER TABLE `techpersonal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproducts`
--
ALTER TABLE `techproducts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_attribute_values`
--
ALTER TABLE `techproduct_attribute_values`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_bundle_options`
--
ALTER TABLE `techproduct_bundle_options`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_bundle_option_products`
--
ALTER TABLE `techproduct_bundle_option_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_bundle_option_translations`
--
ALTER TABLE `techproduct_bundle_option_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_customer_group_prices`
--
ALTER TABLE `techproduct_customer_group_prices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_downloadable_links`
--
ALTER TABLE `techproduct_downloadable_links`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_downloadable_link_translations`
--
ALTER TABLE `techproduct_downloadable_link_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_downloadable_samples`
--
ALTER TABLE `techproduct_downloadable_samples`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_downloadable_sample_translations`
--
ALTER TABLE `techproduct_downloadable_sample_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_flat`
--
ALTER TABLE `techproduct_flat`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_grouped_products`
--
ALTER TABLE `techproduct_grouped_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_images`
--
ALTER TABLE `techproduct_images`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_inventories`
--
ALTER TABLE `techproduct_inventories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_inventory_indices`
--
ALTER TABLE `techproduct_inventory_indices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_ordered_inventories`
--
ALTER TABLE `techproduct_ordered_inventories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_price_indices`
--
ALTER TABLE `techproduct_price_indices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_reviews`
--
ALTER TABLE `techproduct_reviews`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_review_attachments`
--
ALTER TABLE `techproduct_review_attachments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techproduct_videos`
--
ALTER TABLE `techproduct_videos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techrefunds`
--
ALTER TABLE `techrefunds`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techrefund_items`
--
ALTER TABLE `techrefund_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techroles`
--
ALTER TABLE `techroles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `techsearch_synonyms`
--
ALTER TABLE `techsearch_synonyms`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techsearch_terms`
--
ALTER TABLE `techsearch_terms`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techshipments`
--
ALTER TABLE `techshipments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techshipment_items`
--
ALTER TABLE `techshipment_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techsitemaps`
--
ALTER TABLE `techsitemaps`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techsubscribers_list`
--
ALTER TABLE `techsubscribers_list`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `techtax_categories`
--
ALTER TABLE `techtax_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techtax_categories_tax_rates`
--
ALTER TABLE `techtax_categories_tax_rates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techtax_rates`
--
ALTER TABLE `techtax_rates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techtheme_customizations`
--
ALTER TABLE `techtheme_customizations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `techtheme_customization_translations`
--
ALTER TABLE `techtheme_customization_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `techurl_rewrites`
--
ALTER TABLE `techurl_rewrites`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techusers`
--
ALTER TABLE `techusers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techvisits`
--
ALTER TABLE `techvisits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `techwishlist`
--
ALTER TABLE `techwishlist`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `techwishlist_items`
--
ALTER TABLE `techwishlist_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `techaddresses`
--
ALTER TABLE `techaddresses`
  ADD CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `techcart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `techcustomers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `techorders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_parent_address_id_foreign` FOREIGN KEY (`parent_address_id`) REFERENCES `techaddresses` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `techattribute_groups`
--
ALTER TABLE `techattribute_groups`
  ADD CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `techattribute_families` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techattribute_group_mappings`
--
ALTER TABLE `techattribute_group_mappings`
  ADD CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `techattribute_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `techattributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techattribute_options`
--
ALTER TABLE `techattribute_options`
  ADD CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `techattributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techattribute_option_translations`
--
ALTER TABLE `techattribute_option_translations`
  ADD CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `techattribute_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techattribute_translations`
--
ALTER TABLE `techattribute_translations`
  ADD CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `techattributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcart`
--
ALTER TABLE `techcart`
  ADD CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `techcustomers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcart_items`
--
ALTER TABLE `techcart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `techcart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `techcart_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `techtax_categories` (`id`);

--
-- Constraints for table `techcart_payment`
--
ALTER TABLE `techcart_payment`
  ADD CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `techcart` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcart_rule_channels`
--
ALTER TABLE `techcart_rule_channels`
  ADD CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `techcart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcart_rule_coupons`
--
ALTER TABLE `techcart_rule_coupons`
  ADD CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `techcart_rules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcart_rule_coupon_usage`
--
ALTER TABLE `techcart_rule_coupon_usage`
  ADD CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `techcart_rule_coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `techcustomers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcart_rule_customers`
--
ALTER TABLE `techcart_rule_customers`
  ADD CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `techcart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `techcustomers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcart_rule_customer_groups`
--
ALTER TABLE `techcart_rule_customer_groups`
  ADD CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `techcart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `techcustomer_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcart_rule_translations`
--
ALTER TABLE `techcart_rule_translations`
  ADD CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `techcart_rules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcatalog_rule_channels`
--
ALTER TABLE `techcatalog_rule_channels`
  ADD CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `techcatalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcatalog_rule_customer_groups`
--
ALTER TABLE `techcatalog_rule_customer_groups`
  ADD CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `techcatalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `techcustomer_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcatalog_rule_products`
--
ALTER TABLE `techcatalog_rule_products`
  ADD CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `techcatalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `techcustomer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcatalog_rule_product_prices`
--
ALTER TABLE `techcatalog_rule_product_prices`
  ADD CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `techcatalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `techcustomer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcategory_filterable_attributes`
--
ALTER TABLE `techcategory_filterable_attributes`
  ADD CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `techattributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `techcategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcategory_translations`
--
ALTER TABLE `techcategory_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `techcategories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `techlocales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techchannels`
--
ALTER TABLE `techchannels`
  ADD CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `techcurrencies` (`id`),
  ADD CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `techlocales` (`id`),
  ADD CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `techcategories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `techchannel_currencies`
--
ALTER TABLE `techchannel_currencies`
  ADD CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `techcurrencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techchannel_inventory_sources`
--
ALTER TABLE `techchannel_inventory_sources`
  ADD CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `techinventory_sources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techchannel_locales`
--
ALTER TABLE `techchannel_locales`
  ADD CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `techlocales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techchannel_translations`
--
ALTER TABLE `techchannel_translations`
  ADD CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcms_page_channels`
--
ALTER TABLE `techcms_page_channels`
  ADD CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `techcms_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcms_page_translations`
--
ALTER TABLE `techcms_page_translations`
  ADD CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `techcms_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcompare_items`
--
ALTER TABLE `techcompare_items`
  ADD CONSTRAINT `compare_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `techcustomers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compare_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `techcountry_states`
--
ALTER TABLE `techcountry_states`
  ADD CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `techcountries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcountry_state_translations`
--
ALTER TABLE `techcountry_state_translations`
  ADD CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `techcountry_states` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcountry_translations`
--
ALTER TABLE `techcountry_translations`
  ADD CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `techcountries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcurrency_exchange_rates`
--
ALTER TABLE `techcurrency_exchange_rates`
  ADD CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `techcurrencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcustomers`
--
ALTER TABLE `techcustomers`
  ADD CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `techcustomer_groups` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `techcustomer_notes`
--
ALTER TABLE `techcustomer_notes`
  ADD CONSTRAINT `customer_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `techcustomers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techcustomer_social_accounts`
--
ALTER TABLE `techcustomer_social_accounts`
  ADD CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `techcustomers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techdownloadable_link_purchased`
--
ALTER TABLE `techdownloadable_link_purchased`
  ADD CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `techcustomers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `techorders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `techorder_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techimport_batches`
--
ALTER TABLE `techimport_batches`
  ADD CONSTRAINT `import_batches_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `techimports` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techinvoices`
--
ALTER TABLE `techinvoices`
  ADD CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `techorders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techinvoice_items`
--
ALTER TABLE `techinvoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `techinvoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `techinvoice_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techmarketing_campaigns`
--
ALTER TABLE `techmarketing_campaigns`
  ADD CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `techcustomer_groups` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `techmarketing_events` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `techmarketing_templates` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `technotifications`
--
ALTER TABLE `technotifications`
  ADD CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `techorders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techorders`
--
ALTER TABLE `techorders`
  ADD CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `techcustomers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `techorder_comments`
--
ALTER TABLE `techorder_comments`
  ADD CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `techorders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techorder_items`
--
ALTER TABLE `techorder_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `techorders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `techorder_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `techtax_categories` (`id`);

--
-- Constraints for table `techorder_payment`
--
ALTER TABLE `techorder_payment`
  ADD CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `techorders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techorder_transactions`
--
ALTER TABLE `techorder_transactions`
  ADD CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `techorders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproducts`
--
ALTER TABLE `techproducts`
  ADD CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `techattribute_families` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_attribute_values`
--
ALTER TABLE `techproduct_attribute_values`
  ADD CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `techattributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_bundle_options`
--
ALTER TABLE `techproduct_bundle_options`
  ADD CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_bundle_option_products`
--
ALTER TABLE `techproduct_bundle_option_products`
  ADD CONSTRAINT `product_bundle_option_products_product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `techproduct_bundle_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_bundle_option_translations`
--
ALTER TABLE `techproduct_bundle_option_translations`
  ADD CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `techproduct_bundle_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_categories`
--
ALTER TABLE `techproduct_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `techcategories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_cross_sells`
--
ALTER TABLE `techproduct_cross_sells`
  ADD CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_customer_group_prices`
--
ALTER TABLE `techproduct_customer_group_prices`
  ADD CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `techcustomer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_downloadable_links`
--
ALTER TABLE `techproduct_downloadable_links`
  ADD CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_downloadable_link_translations`
--
ALTER TABLE `techproduct_downloadable_link_translations`
  ADD CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `techproduct_downloadable_links` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_downloadable_samples`
--
ALTER TABLE `techproduct_downloadable_samples`
  ADD CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_downloadable_sample_translations`
--
ALTER TABLE `techproduct_downloadable_sample_translations`
  ADD CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `techproduct_downloadable_samples` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_flat`
--
ALTER TABLE `techproduct_flat`
  ADD CONSTRAINT `product_flat_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `techattribute_families` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `techproduct_flat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_grouped_products`
--
ALTER TABLE `techproduct_grouped_products`
  ADD CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_images`
--
ALTER TABLE `techproduct_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_inventories`
--
ALTER TABLE `techproduct_inventories`
  ADD CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `techinventory_sources` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_inventory_indices`
--
ALTER TABLE `techproduct_inventory_indices`
  ADD CONSTRAINT `product_inventory_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_inventory_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_ordered_inventories`
--
ALTER TABLE `techproduct_ordered_inventories`
  ADD CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_price_indices`
--
ALTER TABLE `techproduct_price_indices`
  ADD CONSTRAINT `product_price_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_price_indices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `techcustomer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_price_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_relations`
--
ALTER TABLE `techproduct_relations`
  ADD CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_reviews`
--
ALTER TABLE `techproduct_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_review_attachments`
--
ALTER TABLE `techproduct_review_attachments`
  ADD CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `techproduct_reviews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_super_attributes`
--
ALTER TABLE `techproduct_super_attributes`
  ADD CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `techattributes` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_up_sells`
--
ALTER TABLE `techproduct_up_sells`
  ADD CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techproduct_videos`
--
ALTER TABLE `techproduct_videos`
  ADD CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techrefunds`
--
ALTER TABLE `techrefunds`
  ADD CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `techorders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techrefund_items`
--
ALTER TABLE `techrefund_items`
  ADD CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `techorder_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `techrefund_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `techrefunds` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techsearch_terms`
--
ALTER TABLE `techsearch_terms`
  ADD CONSTRAINT `search_terms_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techshipments`
--
ALTER TABLE `techshipments`
  ADD CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `techinventory_sources` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `techorders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techshipment_items`
--
ALTER TABLE `techshipment_items`
  ADD CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `techshipments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techsubscribers_list`
--
ALTER TABLE `techsubscribers_list`
  ADD CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `techcustomers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `techtax_categories_tax_rates`
--
ALTER TABLE `techtax_categories_tax_rates`
  ADD CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `techtax_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `techtax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techtheme_customizations`
--
ALTER TABLE `techtheme_customizations`
  ADD CONSTRAINT `theme_customizations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techtheme_customization_translations`
--
ALTER TABLE `techtheme_customization_translations`
  ADD CONSTRAINT `theme_customization_translations_theme_customization_id_foreign` FOREIGN KEY (`theme_customization_id`) REFERENCES `techtheme_customizations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techwishlist`
--
ALTER TABLE `techwishlist`
  ADD CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `techcustomers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `techwishlist_items`
--
ALTER TABLE `techwishlist_items`
  ADD CONSTRAINT `wishlist_items_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `techchannels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `techcustomers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `techproducts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

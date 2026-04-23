-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2026 at 06:34 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `supply_office_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `description`, `ip_address`, `user_agent`, `url`, `method`, `created_at`, `updated_at`) VALUES
(1, 2, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-03 00:58:33', '2026-03-03 00:58:33'),
(2, 2, 'block_user', 'Blocked user ID 3', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=block_user&id=3&panel=security', 'GET', '2026-03-03 00:59:28', '2026-03-03 00:59:28'),
(3, 2, 'unblock_user', 'Unblocked user ID 3', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=unblock_user&id=3&panel=security', 'GET', '2026-03-03 00:59:33', '2026-03-03 00:59:33'),
(4, 2, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-03 23:15:07', '2026-03-03 23:15:07'),
(5, 2, 'login', 'User logged in.', '192.168.0.238', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'http://192.168.0.160:8000/login', 'POST', '2026-03-03 23:24:14', '2026-03-03 23:24:14'),
(6, 2, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-03 23:25:24', '2026-03-03 23:25:24'),
(7, 2, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-03 23:26:11', '2026-03-03 23:26:11'),
(8, 2, 'update_user', 'Updated user ID 3 (nkmagno@cpsu.edu.ph).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_user&email=nkmagno%40cpsu.edu.ph&id=3&name=niel%20kevin%20magno&panel=accounts&password=magno29..&role=staff', 'GET', '2026-03-03 23:26:43', '2026-03-03 23:26:43'),
(9, 2, 'logout', 'User logged out.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/logout', 'POST', '2026-03-03 23:26:50', '2026-03-03 23:26:50'),
(10, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-03 23:26:54', '2026-03-03 23:26:54'),
(11, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=Paper&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=REAM&items%5B0%5D%5Bbrand%5D=A%2B&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-03 23:30:10', '2026-03-03 23:30:10'),
(12, 3, 'add_client', 'Added client john colin d. generillo (supply office).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=john%20colin%20d.%20generillo&panel=clients&workplace=supply%20office', 'GET', '2026-03-03 23:30:45', '2026-03-03 23:30:45'),
(13, 3, 'stock_in', 'Stock In: john colin d. generillo at supply office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=1&items%5B0%5D%5Bname%5D=Paper&items%5B0%5D%5Bid%5D=1&items%5B0%5D%5Bqty%5D=10&items%5B0%5D%5Bprice%5D=400&panel=stock-in&person_name=john%20colin%20d.%20generillo&workplace=supply%20office', 'GET', '2026-03-03 23:30:59', '2026-03-03 23:30:59'),
(14, 3, 'stock_out', 'Stock Out: john colin d. generillo at supply office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&client_id=1&items%5B0%5D%5Bname%5D=Paper&items%5B0%5D%5Bid%5D=1&items%5B0%5D%5Bqty%5D=1&panel=stock-out&person_name=john%20colin%20d.%20generillo&remarks=try%20lang&workplace=supply%20office', 'GET', '2026-03-03 23:31:20', '2026-03-03 23:31:20'),
(15, 2, 'login', 'User logged in.', '192.168.0.237', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'http://192.168.0.160:8000/login', 'POST', '2026-03-05 23:07:11', '2026-03-05 23:07:11'),
(16, 2, 'login', 'User logged in.', '192.168.0.237', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'http://192.168.0.160:8000/login', 'POST', '2026-03-05 23:08:33', '2026-03-05 23:08:33'),
(17, 2, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-05 23:10:23', '2026-03-05 23:10:23'),
(18, 2, 'send_warning', 'Sent warning to session vZUZwJCC7D6FFDgIObk6fZXcAaiITwuIaFh49EUX', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=send_warning&message=HELLO%20WORLD%20BOSS&panel=security&sid=vZUZwJCC7D6FFDgIObk6fZXcAaiITwuIaFh49EUX', 'GET', '2026-03-05 23:22:03', '2026-03-05 23:22:03'),
(19, 4, 'login', 'User logged in.', '192.168.0.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-05 23:29:26', '2026-03-05 23:29:26'),
(20, 4, 'logout', 'User logged out.', '192.168.0.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/logout', 'POST', '2026-03-05 23:29:38', '2026-03-05 23:29:38'),
(21, 4, 'login', 'User logged in.', '192.168.0.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-05 23:29:41', '2026-03-05 23:29:41'),
(22, 4, 'add_client', 'Added client jonel junsay (Supply Office).', '192.168.0.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'http://192.168.0.160:8000/inventory?action=add_client&name=jonel%20junsay&panel=clients&workplace=Supply%20Office', 'GET', '2026-03-05 23:31:57', '2026-03-05 23:31:57'),
(23, 4, 'stock_in', 'Stock In: jonel junsay at Supply Office. Rows: 1', '192.168.0.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=BALL%20PEN%20Fine%20Tech&items%5B0%5D%5Bid%5D=2&items%5B0%5D%5Bqty%5D=100&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=jonel%20junsay&workplace=Supply%20Office', 'GET', '2026-03-05 23:32:17', '2026-03-05 23:32:17'),
(24, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-08 16:29:09', '2026-03-08 16:29:09'),
(25, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-08 16:29:21', '2026-03-08 16:29:21'),
(26, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=Brown%20envelope&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=long%20&panel=add-item', 'GET', '2026-03-08 16:30:30', '2026-03-08 16:30:30'),
(27, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=METAL%20TRAY%20&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=SET&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=4LAYER&panel=add-item', 'GET', '2026-03-08 17:06:06', '2026-03-08 17:06:06'),
(28, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=METAL%20TRAY%20&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=SET&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=4LAYER&panel=add-item', 'GET', '2026-03-08 17:06:09', '2026-03-08 17:06:09'),
(29, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=METAL%20TRAY%20&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=SET&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=3%20LAYER&panel=add-item', 'GET', '2026-03-08 17:06:43', '2026-03-08 17:06:43'),
(30, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=%20PLASTIC%20TRAY%20&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=SET&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=%2010&panel=add-item', 'GET', '2026-03-08 17:07:37', '2026-03-08 17:07:37'),
(31, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=GLUE%20&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=BOTTLE&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=250G%20ALL%20PURPOSE%20GLUE&panel=add-item', 'GET', '2026-03-08 17:10:04', '2026-03-08 17:10:04'),
(32, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=STAPLER&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=KANGARO&items%5B0%5D%5Bdescription%5D=HEAVY%20DUTY&panel=add-item', 'GET', '2026-03-08 17:10:53', '2026-03-08 17:10:53'),
(33, 3, 'stock_in', 'Stock In: jonel junsay at Supply Office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=METAL%20TRAY&items%5B0%5D%5Bid%5D=4&items%5B0%5D%5Bqty%5D=2&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=jonel%20junsay&workplace=Supply%20Office', 'GET', '2026-03-08 17:18:15', '2026-03-08 17:18:15'),
(34, 3, 'stock_in', 'Stock In: jonel junsay at Supply Office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=METAL%20TRAY&items%5B0%5D%5Bid%5D=4&items%5B0%5D%5Bqty%5D=31&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=jonel%20junsay&workplace=Supply%20Office', 'GET', '2026-03-08 17:18:42', '2026-03-08 17:18:42'),
(35, 3, 'stock_in', 'Stock In: jonel junsay at Supply Office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=PLASTIC%20TRAY&items%5B0%5D%5Bid%5D=7&items%5B0%5D%5Bqty%5D=10&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=jonel%20junsay&workplace=Supply%20Office', 'GET', '2026-03-08 17:19:43', '2026-03-08 17:19:43'),
(36, 3, 'stock_in', 'Stock In: jonel junsay at Supply Office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=METAL%20TRAY&items%5B0%5D%5Bid%5D=4&items%5B0%5D%5Bqty%5D=31&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=jonel%20junsay&workplace=Supply%20Office', 'GET', '2026-03-08 17:20:44', '2026-03-08 17:20:44'),
(37, 3, 'stock_in', 'Stock In: jonel junsay at Supply Office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=GLUE&items%5B0%5D%5Bid%5D=8&items%5B0%5D%5Bqty%5D=140&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=jonel%20junsay&workplace=Supply%20Office', 'GET', '2026-03-08 17:23:18', '2026-03-08 17:23:18'),
(38, 3, 'stock_in', 'Stock In: jonel junsay at Supply Office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=STAPLER&items%5B0%5D%5Bid%5D=9&items%5B0%5D%5Bqty%5D=17&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=jonel%20junsay&workplace=Supply%20Office', 'GET', '2026-03-08 17:23:40', '2026-03-08 17:23:40'),
(39, 3, 'stock_in', 'Stock In: jonel junsay at Supply Office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=STAPLER&items%5B0%5D%5Bid%5D=9&items%5B0%5D%5Bqty%5D=17&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=jonel%20junsay&workplace=Supply%20Office', 'GET', '2026-03-08 17:23:41', '2026-03-08 17:23:41'),
(40, 3, 'stock_in', 'Stock In: jonel junsay at Supply Office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=CORRECTION%20TAPE&items%5B0%5D%5Bid%5D=10&items%5B0%5D%5Bqty%5D=510&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=jonel%20junsay&workplace=Supply%20Office', 'GET', '2026-03-08 17:24:28', '2026-03-08 17:24:28'),
(41, 3, 'stock_in', 'Stock In: jonel junsay at Supply Office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=PUNCHER&items%5B0%5D%5Bid%5D=11&items%5B0%5D%5Bqty%5D=4&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=jonel%20junsay&workplace=Supply%20Office', 'GET', '2026-03-08 17:24:54', '2026-03-08 17:24:54'),
(42, 3, 'stock_in', 'Stock In: jonel junsay at Supply Office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=STAPLE%20WIRE&items%5B0%5D%5Bid%5D=12&items%5B0%5D%5Bqty%5D=54&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=jonel%20junsay&workplace=Supply%20Office', 'GET', '2026-03-08 17:25:09', '2026-03-08 17:25:09'),
(43, 3, 'stock_in', 'Stock In: jonel junsay at Supply Office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=TAPE%20DISPENSER&items%5B0%5D%5Bid%5D=13&items%5B0%5D%5Bqty%5D=12&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=jonel%20junsay&workplace=Supply%20Office', 'GET', '2026-03-08 17:25:37', '2026-03-08 17:25:37'),
(44, 3, 'stock_in', 'Stock In: jonel junsay at Supply Office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=FRAME&items%5B0%5D%5Bid%5D=14&items%5B0%5D%5Bqty%5D=39&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=jonel%20junsay&workplace=Supply%20Office', 'GET', '2026-03-08 17:25:58', '2026-03-08 17:25:58'),
(45, 3, 'stock_in', 'Stock In: jonel junsay at Supply Office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=DIPLOMA%20HOLDER&items%5B0%5D%5Bid%5D=15&items%5B0%5D%5Bqty%5D=62&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=jonel%20junsay&workplace=Supply%20Office', 'GET', '2026-03-08 17:26:11', '2026-03-08 17:26:11'),
(46, 3, 'stock_in', 'Stock In: jonel junsay at Supply Office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=BONDPAPER%20A4&items%5B0%5D%5Bid%5D=16&items%5B0%5D%5Bqty%5D=233&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=jonel%20junsay&workplace=Supply%20Office', 'GET', '2026-03-08 17:26:42', '2026-03-08 17:26:42'),
(47, 3, 'stock_in', 'Stock In: jonel junsay at Supply Office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=BONDPAPER%20LEGAL&items%5B0%5D%5Bid%5D=17&items%5B0%5D%5Bqty%5D=60&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=jonel%20junsay&workplace=Supply%20Office', 'GET', '2026-03-08 17:26:57', '2026-03-08 17:26:57'),
(48, 3, 'stock_in', 'Stock In: jonel junsay at Supply Office. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=BONDPAPER%20LETTER&items%5B0%5D%5Bid%5D=18&items%5B0%5D%5Bqty%5D=3&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=jonel%20junsay&workplace=Supply%20Office', 'GET', '2026-03-08 17:27:08', '2026-03-08 17:27:08'),
(49, 2, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-09 22:44:42', '2026-03-09 22:44:42'),
(50, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-10 23:20:44', '2026-03-10 23:20:44'),
(51, 2, 'login', 'User logged in.', '192.168.0.238', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'http://192.168.0.160:8000/login', 'POST', '2026-03-10 23:22:29', '2026-03-10 23:22:29'),
(52, 2, 'update_user', 'Updated user ID 3 (nkmagno@cpsu.edu.ph).', '192.168.0.238', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'http://192.168.0.160:8000/inventory?action=update_user&email=nkmagno%40cpsu.edu.ph&id=3&name=niel%20kevin%20magno&panel=accounts&password=&role=admin', 'GET', '2026-03-10 23:23:20', '2026-03-10 23:23:20'),
(53, 3, 'add_client', 'Added client RYAN GARCIA (MIS).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=RYAN%20GARCIA&panel=clients&workplace=MIS', 'GET', '2026-03-10 23:26:04', '2026-03-10 23:26:04'),
(54, 3, 'update_client', 'Updated client ID 3 (RYAN  B. GARCIA).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=3&name=RYAN%20%20B.%20GARCIA&panel=clients&workplace=MIS', 'GET', '2026-03-10 23:30:30', '2026-03-10 23:30:30'),
(55, 3, 'add_client', 'Added client MARY JANICE L. MANDIA (CAMPUS-LIBRARIAN).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=MARY%20JANICE%20L.%20MANDIA&panel=clients&workplace=CAMPUS-LIBRARIAN', 'GET', '2026-03-10 23:32:36', '2026-03-10 23:32:36'),
(56, 3, 'add_client', 'Added client SHEILA MAE V. ANABO (ADMINISTRATIVE OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=SHEILA%20MAE%20V.%20ANABO&panel=clients&workplace=ADMINISTRATIVE%20OFFICE', 'GET', '2026-03-10 23:33:38', '2026-03-10 23:33:38'),
(57, 3, 'update_client', 'Updated client ID 4 (MARY JANICE L. MANDIA).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=4&name=MARY%20JANICE%20L.%20MANDIA&panel=clients&workplace=LIBRARIAN%20OFFICE', 'GET', '2026-03-10 23:33:52', '2026-03-10 23:33:52'),
(58, 3, 'update_client', 'Updated client ID 4 (MARY JANICE L. MANDIA).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=4&name=MARY%20JANICE%20L.%20MANDIA&panel=clients&workplace=LIBRARY', 'GET', '2026-03-10 23:34:27', '2026-03-10 23:34:27'),
(59, 3, 'add_client', 'Added client NOEL B. FORDENTE (ADMIN OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=NOEL%20B.%20FORDENTE&panel=clients&workplace=ADMIN%20OFFICE', 'GET', '2026-03-10 23:34:52', '2026-03-10 23:34:52'),
(60, 3, 'add_client', 'Added client ERWIN C. OYEMAN (MIS).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=ERWIN%20C.%20OYEMAN&panel=clients&workplace=MIS', 'GET', '2026-03-10 23:36:35', '2026-03-10 23:36:35'),
(61, 3, 'add_client', 'Added client ROGEN A. NONATO (HM DEPARMENT).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=ROGEN%20A.%20NONATO&panel=clients&workplace=HM%20DEPARMENT', 'GET', '2026-03-10 23:37:43', '2026-03-10 23:37:43'),
(62, 3, 'add_client', 'Added client SHAIRADEAN J. DUNGON (ASSESSMENT OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=SHAIRADEAN%20J.%20DUNGON&panel=clients&workplace=ASSESSMENT%20OFFICE', 'GET', '2026-03-10 23:39:14', '2026-03-10 23:39:14'),
(63, 3, 'update_client', 'Updated client ID 2 (JONEL M. JUNSAY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=2&name=JONEL%20M.%20JUNSAY&panel=clients&workplace=SUPPLY%20OFFICE', 'GET', '2026-03-10 23:40:01', '2026-03-10 23:40:01'),
(64, 3, 'delete_client', 'Deleted client ID 1 (john colin d. generillo).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=delete_client&id=1&panel=clients', 'GET', '2026-03-10 23:40:07', '2026-03-10 23:40:07'),
(65, 3, 'add_client', 'Added client CHRISTIAN ANTHONY SEFENO (BSHM FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=CHRISTIAN%20ANTHONY%20SEFENO&panel=clients&workplace=BSHM%20FACULTY', 'GET', '2026-03-10 23:41:23', '2026-03-10 23:41:23'),
(66, 3, 'add_client', 'Added client RICO D. JORNADAL (RESEARCH OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=RICO%20D.%20JORNADAL&panel=clients&workplace=RESEARCH%20OFFICE', 'GET', '2026-03-10 23:42:17', '2026-03-10 23:42:17'),
(67, 3, 'add_client', 'Added client MAY TRESIA JAMON (BSHM FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=MAY%20TRESIA%20JAMON&panel=clients&workplace=BSHM%20FACULTY', 'GET', '2026-03-10 23:43:29', '2026-03-10 23:43:29'),
(68, 3, 'update_client', 'Updated client ID 8 (ROGEN A. NONATO).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=8&name=ROGEN%20A.%20NONATO&panel=clients&workplace=BSHM%20DEPARMENT', 'GET', '2026-03-10 23:43:45', '2026-03-10 23:43:45'),
(69, 3, 'add_client', 'Added client JOSEPH CRIS JAO (GUIDANCE OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=JOSEPH%20CRIS%20JAO&panel=clients&workplace=GUIDANCE%20OFFICE', 'GET', '2026-03-10 23:44:43', '2026-03-10 23:44:43'),
(70, 3, 'add_client', 'Added client ROSE-ANN LAUREZO (HR OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=ROSE-ANN%20LAUREZO&panel=clients&workplace=HR%20OFFICE', 'GET', '2026-03-10 23:46:01', '2026-03-10 23:46:01'),
(71, 3, 'add_client', 'Added client RUEL JOHN CLAMIANO (BEED FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=RUEL%20JOHN%20CLAMIANO&panel=clients&workplace=BEED%20FACULTY', 'GET', '2026-03-10 23:46:44', '2026-03-10 23:46:44'),
(72, 3, 'add_client', 'Added client NONILO  AUJERO (BSIT FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=NONILO%20%20AUJERO&panel=clients&workplace=BSIT%20FACULTY', 'GET', '2026-03-10 23:47:36', '2026-03-10 23:47:36'),
(73, 3, 'add_client', 'Added client JERICO A. PONTINO (MAINTENANCE OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=JERICO%20A.%20PONTINO&panel=clients&workplace=MAINTENANCE%20OFFICE', 'GET', '2026-03-10 23:48:21', '2026-03-10 23:48:21'),
(74, 3, 'add_client', 'Added client MA. JERALDEN NAVALUNA (ADMIN OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=MA.%20JERALDEN%20NAVALUNA&panel=clients&workplace=ADMIN%20OFFICE', 'GET', '2026-03-10 23:48:54', '2026-03-10 23:48:54'),
(75, 3, 'add_client', 'Added client AN MAE ERVITE (CASHIER OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=AN%20MAE%20ERVITE&panel=clients&workplace=CASHIER%20OFFICE', 'GET', '2026-03-10 23:49:26', '2026-03-10 23:49:26'),
(76, 3, 'update_client', 'Updated client ID 19 (AN MAE ERVITE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=19&name=AN%20MAE%20ERVITE&panel=clients&workplace=CASHIER%27S%20OFFICE', 'GET', '2026-03-10 23:50:04', '2026-03-10 23:50:04'),
(77, 3, 'add_client', 'Added client RAYMON BADAYOS (OSSA OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=RAYMON%20BADAYOS&panel=clients&workplace=OSSA%20OFFICE', 'GET', '2026-03-10 23:51:02', '2026-03-10 23:51:02'),
(78, 3, 'add_client', 'Added client APRIL JOY G. DOMINGUEZ (REGISTIAL\'S OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=APRIL%20JOY%20G.%20DOMINGUEZ&panel=clients&workplace=REGISTIAL%27S%20OFFICE', 'GET', '2026-03-10 23:52:02', '2026-03-10 23:52:02'),
(79, 3, 'update_client', 'Updated client ID 21 (APRIL JOY G. DOMINGUEZ).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=21&name=APRIL%20JOY%20G.%20DOMINGUEZ&panel=clients&workplace=REGISTRIAL%27S%20OFFICE', 'GET', '2026-03-10 23:52:18', '2026-03-10 23:52:18'),
(80, 3, 'update_client', 'Updated client ID 21 (APRIL JOY G. DOMINGUEZ).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=21&name=APRIL%20JOY%20G.%20DOMINGUEZ&panel=clients&workplace=REGISTRAR%27S%20OFFICE', 'GET', '2026-03-10 23:52:47', '2026-03-10 23:52:47'),
(81, 3, 'add_client', 'Added client JAIRUS ZAPANTA (MAINTENANCE OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=JAIRUS%20ZAPANTA&panel=clients&workplace=MAINTENANCE%20OFFICE', 'GET', '2026-03-10 23:53:45', '2026-03-10 23:53:45'),
(82, 3, 'add_client', 'Added client RONELO V. GASATAYA JR. (RESEARCH OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=RONELO%20V.%20GASATAYA%20JR.&panel=clients&workplace=RESEARCH%20OFFICE', 'GET', '2026-03-10 23:54:28', '2026-03-10 23:54:28'),
(83, 3, 'add_client', 'Added client MELDY S. LUBRICO (BEED FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=MELDY%20S.%20LUBRICO&panel=clients&workplace=BEED%20FACULTY', 'GET', '2026-03-10 23:55:04', '2026-03-10 23:55:04'),
(84, 3, 'add_client', 'Added client RICKY E. BARRIDO JR. (BSIT FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=RICKY%20E.%20BARRIDO%20JR.&panel=clients&workplace=BSIT%20FACULTY', 'GET', '2026-03-10 23:55:41', '2026-03-10 23:55:41'),
(85, 3, 'add_client', 'Added client AROLD MANAQUIL (BSHM FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=AROLD%20MANAQUIL&panel=clients&workplace=BSHM%20FACULTY', 'GET', '2026-03-10 23:56:27', '2026-03-10 23:56:27'),
(86, 3, 'update_client', 'Updated client ID 13 (JOSEPH CRIS D. JAO).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=13&name=JOSEPH%20CRIS%20D.%20JAO&panel=clients&workplace=GUIDANCE%20OFFICE', 'GET', '2026-03-10 23:56:53', '2026-03-10 23:56:53'),
(87, 3, 'add_client', 'Added client JOALYN DE ASIS (CAF FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=JOALYN%20DE%20ASIS&panel=clients&workplace=CAF%20FACULTY', 'GET', '2026-03-10 23:57:40', '2026-03-10 23:57:40'),
(88, 3, 'update_client', 'Updated client ID 7 (ERWIN C. OYEMAN).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=7&name=ERWIN%20C.%20OYEMAN&panel=clients&workplace=MIS%20OFFICE', 'GET', '2026-03-10 23:57:54', '2026-03-10 23:57:54'),
(89, 3, 'update_client', 'Updated client ID 16 (NONILO  AUJERO).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=16&name=NONILO%20%20AUJERO&panel=clients&workplace=CSS%20FACULTY', 'GET', '2026-03-10 23:58:12', '2026-03-10 23:58:12'),
(90, 3, 'update_client', 'Updated client ID 16 (NONILO  AUJERO).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=16&name=NONILO%20%20AUJERO&panel=clients&workplace=CCS%20FACULTY', 'GET', '2026-03-10 23:58:24', '2026-03-10 23:58:24'),
(91, 3, 'update_client', 'Updated client ID 25 (RICKY E. BARRIDO JR.).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=25&name=RICKY%20E.%20BARRIDO%20JR.&panel=clients&workplace=CCS%20FACULTY', 'GET', '2026-03-10 23:58:51', '2026-03-10 23:58:51'),
(92, 3, 'add_client', 'Added client ROSE MAE RIVERA (HR OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=ROSE%20MAE%20RIVERA&panel=clients&workplace=HR%20OFFICE', 'GET', '2026-03-11 00:00:01', '2026-03-11 00:00:01'),
(93, 3, 'add_client', 'Added client ZHEA LIBERRE (REGISTRAR\'S OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=ZHEA%20LIBERRE&panel=clients&workplace=REGISTRAR%27S%20OFFICE', 'GET', '2026-03-11 00:01:34', '2026-03-11 00:01:34'),
(94, 3, 'add_client', 'Added client MA. MAE KENDRA CANALES (COTED FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=MA.%20MAE%20KENDRA%20CANALES&panel=clients&workplace=COTED%20FACULTY', 'GET', '2026-03-11 00:03:04', '2026-03-11 00:03:04'),
(95, 3, 'update_client', 'Updated client ID 26 (AROLD MANAQUIL).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=26&name=AROLD%20MANAQUIL&panel=clients&workplace=CHM%20FACULTY', 'GET', '2026-03-11 00:03:16', '2026-03-11 00:03:16'),
(96, 3, 'update_client', 'Updated client ID 10 (CHRISTIAN ANTHONY SEFENO).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=10&name=CHRISTIAN%20ANTHONY%20SEFENO&panel=clients&workplace=CHM%20FACULTY', 'GET', '2026-03-11 00:03:28', '2026-03-11 00:03:28'),
(97, 3, 'update_client', 'Updated client ID 12 (MAY TRESIA JAMON).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=12&name=MAY%20TRESIA%20JAMON&panel=clients&workplace=CHM%20FACULTY', 'GET', '2026-03-11 00:03:40', '2026-03-11 00:03:40'),
(98, 3, 'update_client', 'Updated client ID 24 (MELDY S. LUBRICO).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=24&name=MELDY%20S.%20LUBRICO&panel=clients&workplace=COTED%20FACULTY', 'GET', '2026-03-11 00:03:51', '2026-03-11 00:03:51'),
(99, 3, 'update_client', 'Updated client ID 15 (RUEL JOHN CLAMIANO).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=15&name=RUEL%20JOHN%20CLAMIANO&panel=clients&workplace=COTED%20FACULTY', 'GET', '2026-03-11 00:04:01', '2026-03-11 00:04:01'),
(100, 3, 'update_client', 'Updated client ID 8 (ROGEN A. NONATO).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=8&name=ROGEN%20A.%20NONATO&panel=clients&workplace=COTED%20DEPARMENT', 'GET', '2026-03-11 00:04:11', '2026-03-11 00:04:11'),
(101, 3, 'update_client', 'Updated client ID 8 (ROGEN A. NONATO).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=8&name=ROGEN%20A.%20NONATO&panel=clients&workplace=CHM%5C%20DEPARMENT', 'GET', '2026-03-11 00:04:23', '2026-03-11 00:04:23'),
(102, 3, 'update_client', 'Updated client ID 8 (ROGEN A. NONATO).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=8&name=ROGEN%20A.%20NONATO&panel=clients&workplace=CHM%20DEPARMENT', 'GET', '2026-03-11 00:04:30', '2026-03-11 00:04:30'),
(103, 3, 'add_client', 'Added client MA. JANESA CAWALING (FACULTY OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=MA.%20JANESA%20CAWALING&panel=clients&workplace=FACULTY%20OFFICE', 'GET', '2026-03-11 00:05:12', '2026-03-11 00:05:12'),
(104, 3, 'update_client', 'Updated client ID 9 (SHAIRADEAN D. JUNSAY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=9&name=SHAIRADEAN%20D.%20JUNSAY&panel=clients&workplace=ASSESSMENT%20OFFICE', 'GET', '2026-03-11 00:06:33', '2026-03-11 00:06:33'),
(105, 3, 'add_client', 'Added client LEOMAR ROGER CAGADAS (CHM FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=LEOMAR%20ROGER%20CAGADAS&panel=clients&workplace=CHM%20FACULTY', 'GET', '2026-03-11 00:08:25', '2026-03-11 00:08:25'),
(106, 3, 'add_client', 'Added client CHRISTIAN M. SABANDO (CLINIC OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=CHRISTIAN%20M.%20SABANDO&panel=clients&workplace=CLINIC%20OFFICE', 'GET', '2026-03-11 00:09:04', '2026-03-11 00:09:04'),
(107, 3, 'add_client', 'Added client EUGEIN GRULLIO (COTED FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=EUGEIN%20GRULLIO&panel=clients&workplace=COTED%20FACULTY', 'GET', '2026-03-11 00:10:02', '2026-03-11 00:10:02'),
(108, 3, 'add_client', 'Added client JORYN MARIE JUDADAN (CAF FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=JORYN%20MARIE%20JUDADAN&panel=clients&workplace=CAF%20FACULTY', 'GET', '2026-03-11 00:11:33', '2026-03-11 00:11:33'),
(109, 3, 'add_client', 'Added client JENELYN C. GANTALAO (PRODUCTON OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=JENELYN%20C.%20GANTALAO&panel=clients&workplace=PRODUCTON%20OFFICE', 'GET', '2026-03-11 00:12:03', '2026-03-11 00:12:03'),
(110, 3, 'update_client', 'Updated client ID 36 (JENELYN C. GANTALAO).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=36&name=JENELYN%20C.%20GANTALAO&panel=clients&workplace=PRODUCTION%20OFFICE', 'GET', '2026-03-11 00:12:15', '2026-03-11 00:12:15'),
(111, 3, 'add_client', 'Added client PETER GERALD L. JUNSAY (CAF FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=PETER%20GERALD%20L.%20JUNSAY&panel=clients&workplace=CAF%20FACULTY', 'GET', '2026-03-11 00:12:43', '2026-03-11 00:12:43'),
(112, 3, 'add_client', 'Added client JEMAICA SAGUIRRE (LIBRARY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=JEMAICA%20SAGUIRRE&panel=clients&workplace=LIBRARY', 'GET', '2026-03-11 00:13:36', '2026-03-11 00:13:36'),
(113, 3, 'update_client', 'Updated client ID 33 (CHRISTIAN M. SABANDO).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=33&name=CHRISTIAN%20M.%20SABANDO&panel=clients&workplace=CLINIC', 'GET', '2026-03-11 00:13:44', '2026-03-11 00:13:44'),
(114, 3, 'add_client', 'Added client REDGIE MABILOG (FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=REDGIE%20MABILOG&panel=clients&workplace=FACULTY', 'GET', '2026-03-11 00:14:26', '2026-03-11 00:14:26'),
(115, 3, 'add_client', 'Added client CHRISTAIN PLAZA (COTED FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=CHRISTAIN%20PLAZA&panel=clients&workplace=COTED%20FACULTY', 'GET', '2026-03-11 00:15:04', '2026-03-11 00:15:04'),
(116, 3, 'add_client', 'Added client JERRY JARDELIZA (CCS FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=JERRY%20JARDELIZA&panel=clients&workplace=CCS%20FACULTY', 'GET', '2026-03-11 00:16:32', '2026-03-11 00:16:32'),
(117, 3, 'add_client', 'Added client WILROSE SANDRINO (CCS FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=WILROSE%20SANDRINO&panel=clients&workplace=CCS%20FACULTY', 'GET', '2026-03-11 00:17:29', '2026-03-11 00:17:29'),
(118, 3, 'add_client', 'Added client ELMER L. FUENTES (PRODUCTION OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=ELMER%20L.%20FUENTES&panel=clients&workplace=PRODUCTION%20OFFICE', 'GET', '2026-03-11 00:18:19', '2026-03-11 00:18:19'),
(119, 3, 'add_client', 'Added client JAYSON MACOLADO (CCS FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=JAYSON%20MACOLADO&panel=clients&workplace=CCS%20FACULTY', 'GET', '2026-03-11 00:18:49', '2026-03-11 00:18:49'),
(120, 3, 'add_client', 'Added client THERESA JANE GUTIEREZ (CAF FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=THERESA%20JANE%20GUTIEREZ&panel=clients&workplace=CAF%20FACULTY', 'GET', '2026-03-11 00:19:33', '2026-03-11 00:19:33'),
(121, 3, 'add_client', 'Added client STROLL C. ESPAÑOLA (CCS FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=STROLL%20C.%20ESPA%C3%91OLA&panel=clients&workplace=CCS%20FACULTY', 'GET', '2026-03-11 00:20:32', '2026-03-11 00:20:32'),
(122, 3, 'add_client', 'Added client ULDERICO BAYONA (CAF FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=ULDERICO%20BAYONA&panel=clients&workplace=CAF%20FACULTY', 'GET', '2026-03-11 00:21:10', '2026-03-11 00:21:10'),
(123, 3, 'add_client', 'Added client ROSANNA QUINCO (CSS FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=ROSANNA%20QUINCO&panel=clients&workplace=CSS%20FACULTY', 'GET', '2026-03-11 01:29:45', '2026-03-11 01:29:45'),
(124, 3, 'update_client', 'Updated client ID 20 (RAYMON LLOYD BADAYOS).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=20&name=RAYMON%20LLOYD%20BADAYOS&panel=clients&workplace=OSSA%20OFFICE', 'GET', '2026-03-11 01:30:18', '2026-03-11 01:30:18');
INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `description`, `ip_address`, `user_agent`, `url`, `method`, `created_at`, `updated_at`) VALUES
(125, 3, 'update_client', 'Updated client ID 40 (CHRISTAIN M. PLAZA).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=40&name=CHRISTAIN%20M.%20PLAZA&panel=clients&workplace=COTED%20FACULTY', 'GET', '2026-03-11 01:30:35', '2026-03-11 01:30:35'),
(126, 3, 'stock_out', 'Stock Out: ROSE-ANN LAUREZO at HR OFFICE. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&client_id=14&items%5B0%5D%5Bname%5D=BONDPAPER%20LEGAL&items%5B0%5D%5Bid%5D=17&items%5B0%5D%5Bqty%5D=1&panel=stock-out&person_name=ROSE-ANN%20LAUREZO&remarks=FOR%20SCHOLARSHIP&workplace=HR%20OFFICE', 'GET', '2026-03-11 01:32:51', '2026-03-11 01:32:51'),
(127, 3, 'stock_out', 'Stock Out: ROSANNA QUINCO at CSS FACULTY. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&client_id=48&items%5B0%5D%5Bname%5D=BONDPAPER%20LEGAL&items%5B0%5D%5Bid%5D=17&items%5B0%5D%5Bqty%5D=1&panel=stock-out&person_name=ROSANNA%20QUINCO&remarks=FOR%20CSS%20FACULTY&workplace=CSS%20FACULTY', 'GET', '2026-03-11 01:37:18', '2026-03-11 01:37:18'),
(128, 3, 'stock_out', 'Stock Out: ROSE MAE RIVERA at HR OFFICE. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&client_id=28&items%5B0%5D%5Bname%5D=BONDPAPER%20LEGAL&items%5B0%5D%5Bid%5D=17&items%5B0%5D%5Bqty%5D=1&panel=stock-out&person_name=ROSE%20MAE%20RIVERA&remarks=FOR%20DTR%20PRINTING&workplace=HR%20OFFICE', 'GET', '2026-03-11 01:39:30', '2026-03-11 01:39:30'),
(129, 3, 'stock_out', 'Stock Out: MAY TRESIA JAMON at CHM FACULTY. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&client_id=12&items%5B0%5D%5Bname%5D=BONDPAPER%20A4&items%5B0%5D%5Bid%5D=16&items%5B0%5D%5Bqty%5D=1&panel=stock-out&person_name=MAY%20TRESIA%20JAMON&remarks=FOR%20EXAM&workplace=CHM%20FACULTY', 'GET', '2026-03-11 01:43:14', '2026-03-11 01:43:14'),
(130, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-11 16:22:06', '2026-03-11 16:22:06'),
(131, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-11 16:24:45', '2026-03-11 16:24:45'),
(132, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-11 16:25:14', '2026-03-11 16:25:14'),
(133, 3, 'add_client', 'Added client JOL T. GUMAWA (OSSA OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=JOL%20T.%20GUMAWA&panel=clients&workplace=OSSA%20OFFICE', 'GET', '2026-03-11 16:35:00', '2026-03-11 16:35:00'),
(134, 3, 'add_client', 'Added client JONAS D. SINGSON (REGISTRAR\'S OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=JONAS%20D.%20SINGSON&panel=clients&workplace=REGISTRAR%27S%20OFFICE', 'GET', '2026-03-11 16:37:31', '2026-03-11 16:37:31'),
(135, 3, 'update_client', 'Updated client ID 16 (NONILO B. AUJERO JR.).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=16&name=NONILO%20B.%20AUJERO%20JR.&panel=clients&workplace=CCS%20FACULTY', 'GET', '2026-03-11 16:45:10', '2026-03-11 16:45:10'),
(136, 3, 'update_client', 'Updated client ID 19 (AN MAE D. ERVITE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=19&name=AN%20MAE%20D.%20ERVITE&panel=clients&workplace=CASHIER%27S%20OFFICE', 'GET', '2026-03-11 16:45:36', '2026-03-11 16:45:36'),
(137, 3, 'add_client', 'Added client GEORGE P. GUMAWA JR. (CAF FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=GEORGE%20P.%20GUMAWA%20JR.&panel=clients&workplace=CAF%20FACULTY', 'GET', '2026-03-11 16:47:01', '2026-03-11 16:47:01'),
(138, 3, 'add_client', 'Added client EMMANUEL M. SALAZA (CHM FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=EMMANUEL%20M.%20SALAZA&panel=clients&workplace=CHM%20FACULTY', 'GET', '2026-03-11 16:47:38', '2026-03-11 16:47:38'),
(139, 3, 'add_client', 'Added client JAYLEN SALURIA-ROBLES (FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=JAYLEN%20SALURIA-ROBLES&panel=clients&workplace=FACULTY', 'GET', '2026-03-11 16:48:59', '2026-03-11 16:48:59'),
(140, 3, 'update_client', 'Updated client ID 10 (CHRISTIAN ANTHONY G. SEFINO).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=10&name=CHRISTIAN%20ANTHONY%20G.%20SEFINO&panel=clients&workplace=CHM%20FACULTY', 'GET', '2026-03-11 16:49:31', '2026-03-11 16:49:31'),
(141, 3, 'update_client', 'Updated client ID 20 (RAYMON L. BADAYOS).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=20&name=RAYMON%20L.%20BADAYOS&panel=clients&workplace=OSSA%20OFFICE', 'GET', '2026-03-11 16:50:00', '2026-03-11 16:50:00'),
(142, 3, 'update_client', 'Updated client ID 9 (SHAIRADENE M. JUNSAY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=9&name=SHAIRADENE%20M.%20JUNSAY&panel=clients&workplace=ASSESSMENT%20OFFICE', 'GET', '2026-03-11 16:51:29', '2026-03-11 16:51:29'),
(143, 3, 'update_client', 'Updated client ID 14 (ROSE ANN E. LAUREZO).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=14&name=ROSE%20ANN%20E.%20LAUREZO&panel=clients&workplace=HR%20OFFICE', 'GET', '2026-03-11 16:52:00', '2026-03-11 16:52:00'),
(144, 3, 'add_client', 'Added client NIEL KEVIN C. MAGNO (SUPPLY OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=NIEL%20KEVIN%20C.%20MAGNO&panel=clients&workplace=SUPPLY%20OFFICE', 'GET', '2026-03-11 16:52:38', '2026-03-11 16:52:38'),
(145, 3, 'add_client', 'Added client JADE E. MATTI (DRIVER\'S OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=JADE%20E.%20MATTI&panel=clients&workplace=DRIVER%27S%20OFFICE', 'GET', '2026-03-11 16:53:42', '2026-03-11 16:53:42'),
(146, 3, 'update_client', 'Updated client ID 8 (ROGEN O. NONATO).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=8&name=ROGEN%20O.%20NONATO&panel=clients&workplace=CHM%20DEPARMENT', 'GET', '2026-03-11 16:54:06', '2026-03-11 16:54:06'),
(147, 3, 'update_client', 'Updated client ID 29 (ZHEA LIBERIE F. SALEM).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=29&name=ZHEA%20LIBERIE%20F.%20SALEM&panel=clients&workplace=REGISTRAR%27S%20OFFICE', 'GET', '2026-03-11 16:54:55', '2026-03-11 16:54:55'),
(148, 3, 'add_client', 'Added client RIA SULON (ADMISSION OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=RIA%20SULON&panel=clients&workplace=ADMISSION%20OFFICE', 'GET', '2026-03-11 16:55:32', '2026-03-11 16:55:32'),
(149, 3, 'add_client', 'Added client JO HANNAH S. TORREMOCHA (CLINIC).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=JO%20HANNAH%20S.%20TORREMOCHA&panel=clients&workplace=CLINIC', 'GET', '2026-03-11 16:56:13', '2026-03-11 16:56:13'),
(150, 3, 'update_client', 'Updated client ID 22 (JAIRUS D. ZAPANTA).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=22&name=JAIRUS%20D.%20ZAPANTA&panel=clients&workplace=MAINTENANCE%20OFFICE', 'GET', '2026-03-11 16:56:30', '2026-03-11 16:56:30'),
(151, 3, 'update_client', 'Updated client ID 47 (ULDARICO BAYONA).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=47&name=ULDARICO%20BAYONA&panel=clients&workplace=CAF%20FACULTY', 'GET', '2026-03-11 16:57:35', '2026-03-11 16:57:35'),
(152, 3, 'update_client', 'Updated client ID 34 (EUGEMY GRULLO).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=34&name=EUGEMY%20GRULLO&panel=clients&workplace=COTED%20FACULTY', 'GET', '2026-03-11 16:59:02', '2026-03-11 16:59:02'),
(153, 3, 'update_client', 'Updated client ID 41 (JERRY JARDELIZA JR.).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=41&name=JERRY%20JARDELIZA%20JR.&panel=clients&workplace=CCS%20FACULTY', 'GET', '2026-03-11 16:59:47', '2026-03-11 16:59:47'),
(154, 3, 'update_client', 'Updated client ID 35 (JORLYN MARIE JUDIADAN).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_client&id=35&name=JORLYN%20MARIE%20JUDIADAN&panel=clients&workplace=CAF%20FACULTY', 'GET', '2026-03-11 17:00:22', '2026-03-11 17:00:22'),
(155, 3, 'add_client', 'Added client NELSON LIBREL JR. (CCS FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=NELSON%20LIBREL%20JR.&panel=clients&workplace=CCS%20FACULTY', 'GET', '2026-03-11 17:01:00', '2026-03-11 17:01:00'),
(156, 3, 'add_client', 'Added client AILYN MISSION (COTED FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=AILYN%20MISSION&panel=clients&workplace=COTED%20FACULTY', 'GET', '2026-03-11 17:01:48', '2026-03-11 17:01:48'),
(157, 3, 'add_client', 'Added client KRISHA MAY NUÑEZ (CHM FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=KRISHA%20MAY%20NU%C3%91EZ&panel=clients&workplace=CHM%20FACULTY', 'GET', '2026-03-11 17:02:30', '2026-03-11 17:02:30'),
(158, 3, 'add_client', 'Added client CLAIRE C. NULLAS (CCS FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=CLAIRE%20C.%20NULLAS&panel=clients&workplace=CCS%20FACULTY', 'GET', '2026-03-11 17:02:59', '2026-03-11 17:02:59'),
(159, 3, 'add_client', 'Added client JOHN MARK PARREÑO (CAF FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=JOHN%20MARK%20PARRE%C3%91O&panel=clients&workplace=CAF%20FACULTY', 'GET', '2026-03-11 17:03:31', '2026-03-11 17:03:31'),
(160, 3, 'add_client', 'Added client FRANCIS JOHN SABANDO (CHM FACULTY).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=FRANCIS%20JOHN%20SABANDO&panel=clients&workplace=CHM%20FACULTY', 'GET', '2026-03-11 17:04:14', '2026-03-11 17:04:14'),
(161, 3, 'add_client', 'Added client JOHN COLIN D. GENERILLO (SUPPLY OFFICE).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_client&name=JOHN%20COLIN%20D.%20GENERILLO&panel=clients&workplace=SUPPLY%20OFFICE', 'GET', '2026-03-11 19:02:48', '2026-03-11 19:02:48'),
(162, 3, 'delete_stock_out_history', 'Deleted stock-out history. Person: JOHN COLIN D. GENERILLO. Date: ALL. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=delete_stock_out_history&panel=stock-out-history&person_name=JOHN%20COLIN%20D.%20GENERILLO', 'GET', '2026-03-11 19:18:26', '2026-03-11 19:18:26'),
(163, 3, 'delete_stock_in_history', 'Deleted stock-in history. Person: JOHN COLIN D. GENERILLO. Date: ALL. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=delete_stock_in_history&panel=stock-in-history&person_name=JOHN%20COLIN%20D.%20GENERILLO', 'GET', '2026-03-11 19:29:44', '2026-03-11 19:29:44'),
(164, 2, 'login', 'User logged in.', '192.168.0.237', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'http://192.168.0.160:8000/login', 'POST', '2026-03-11 20:22:29', '2026-03-11 20:22:29'),
(165, 3, 'delete_stock_in_history', 'Deleted stock-in history. Person: jonel junsay. Date: ALL. Rows: 17', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=delete_stock_in_history&panel=stock-in&person_name=jonel%20junsay', 'GET', '2026-03-11 21:02:10', '2026-03-11 21:02:10'),
(166, 3, 'stock_in', 'Stock In: JONEL M. JUNSAY at SUPPLY OFFICE. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=METAL%20TRAY&items%5B0%5D%5Bid%5D=5&items%5B0%5D%5Bqty%5D=100&items%5B0%5D%5Bprice%5D=300&panel=stock-in&person_name=JONEL%20M.%20JUNSAY&workplace=SUPPLY%20OFFICE', 'GET', '2026-03-11 21:02:42', '2026-03-11 21:02:42'),
(167, 2, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-11 21:14:39', '2026-03-11 21:14:39'),
(168, 2, 'login', 'User logged in.', '192.168.0.237', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'http://192.168.0.160:8000/login', 'POST', '2026-03-12 00:02:10', '2026-03-12 00:02:10'),
(169, 2, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=BROWN%20ENVELOPE%20LONG&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=LONG&panel=add-item', 'GET', '2026-03-12 00:47:45', '2026-03-12 00:47:45'),
(170, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-12 01:18:38', '2026-03-12 01:18:38'),
(171, 3, 'delete_user', 'Deleted user ID 1 (test@example.com).', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=delete_user&id=1&panel=accounts', 'GET', '2026-03-12 01:23:55', '2026-03-12 01:23:55'),
(172, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-15 16:54:28', '2026-03-15 16:54:28'),
(173, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-15 16:56:59', '2026-03-15 16:56:59'),
(174, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-15 18:40:03', '2026-03-15 18:40:03'),
(175, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-15 21:26:30', '2026-03-15 21:26:30'),
(176, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-15 21:27:16', '2026-03-15 21:27:16'),
(177, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-16 17:48:06', '2026-03-16 17:48:06'),
(178, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=INK%20003%20B&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=Epson%20003&panel=add-item', 'GET', '2026-03-16 17:52:32', '2026-03-16 17:52:32'),
(179, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=INK%20003%20B&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=Epson%20003&panel=add-item', 'GET', '2026-03-16 17:52:32', '2026-03-16 17:52:32'),
(180, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=BONDPAPER%20F4%20&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=REAM&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=F4%20BONDPAPER&panel=add-item', 'GET', '2026-03-16 17:53:38', '2026-03-16 17:53:38'),
(181, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=I%20AICON%20664%20C&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=BOTTLE&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 17:57:20', '2026-03-16 17:57:20'),
(182, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=EXPANDED%20FOLDER%20RED&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 17:58:07', '2026-03-16 17:58:07'),
(183, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=INK%20003%20C&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=BOTTLE&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:00:22', '2026-03-16 18:00:22'),
(184, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=BROWN%20ENVELOP%20SHORT&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:00:42', '2026-03-16 18:00:42'),
(185, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=BROWN%20ENVELOP%20LONG&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:01:03', '2026-03-16 18:01:03'),
(186, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=DUSTLESS%20CHALK%20TOP&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=BOX&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:01:45', '2026-03-16 18:01:45'),
(187, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=BLUEBOOK%20500%20PAGES&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:05:03', '2026-03-16 18:05:03'),
(188, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=SPECIAL%20PAPER&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=REAM&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:06:20', '2026-03-16 18:06:20'),
(189, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=PHOTO%20PAPER%20LONG&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=REAM&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:06:38', '2026-03-16 18:06:38'),
(190, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=SPECIAL%20PAPER%20CREAM%20SHORT&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=REAM&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:07:02', '2026-03-16 18:07:02'),
(191, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=SLIDING%20FOLDER%20RED&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:07:23', '2026-03-16 18:07:23'),
(192, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=SLIDING%20FOLDER%20ORANGE&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:07:48', '2026-03-16 18:07:48'),
(193, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=SLIDING%20FOLDER%20VIOLET&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:08:08', '2026-03-16 18:08:08'),
(194, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=CONSTRUCTION%20PAPER%20ASSORTED&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PACK&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:08:44', '2026-03-16 18:08:44'),
(195, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=RED%20BALLPEN&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:09:20', '2026-03-16 18:09:20'),
(196, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=BLUE%20BALLPEN&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:09:37', '2026-03-16 18:09:37'),
(197, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=BLACK%20BALLPEN&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:09:51', '2026-03-16 18:09:51'),
(198, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=BLACK%20MARKER&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:10:10', '2026-03-16 18:10:10'),
(199, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=PERMANENT%20MARKER&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:10:25', '2026-03-16 18:10:25'),
(200, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=STAMPAD%20INK&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=BOTTLE&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:10:48', '2026-03-16 18:10:48'),
(201, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=PAPER%20CLIP&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=BOX&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:11:18', '2026-03-16 18:11:18'),
(202, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=STAMP%20PAD%20&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:11:45', '2026-03-16 18:11:45'),
(203, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=YELLOW%20FOLDER&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:12:07', '2026-03-16 18:12:07'),
(204, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=GREEN%20FOLDER&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:12:24', '2026-03-16 18:12:24'),
(205, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=RED%20FOLDER%20&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:12:37', '2026-03-16 18:12:37'),
(206, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=MASKING%20TAPE&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:12:53', '2026-03-16 18:12:53'),
(207, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=TRANSPARENT%20TAPE&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:13:06', '2026-03-16 18:13:06'),
(208, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=DUCT%20TAPE&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-16 18:13:24', '2026-03-16 18:13:24'),
(209, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-17 16:57:23', '2026-03-17 16:57:23'),
(210, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-17 17:01:53', '2026-03-17 17:01:53'),
(211, 3, 'stock_in', 'Stock In: JONEL M. JUNSAY at SUPPLY OFFICE. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=BONDPAPER%20LEGAL&items%5B0%5D%5Bid%5D=17&items%5B0%5D%5Bqty%5D=90&items%5B0%5D%5Bprice%5D=&panel=stock-in&person_name=JONEL%20M.%20JUNSAY&workplace=SUPPLY%20OFFICE', 'GET', '2026-03-17 17:05:39', '2026-03-17 17:05:39'),
(212, 3, 'stock_in', 'Stock In: JONEL M. JUNSAY at SUPPLY OFFICE. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=BLUE%20BALLPEN&items%5B0%5D%5Bid%5D=47&items%5B0%5D%5Bqty%5D=150&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=JONEL%20M.%20JUNSAY&workplace=SUPPLY%20OFFICE', 'GET', '2026-03-17 17:06:16', '2026-03-17 17:06:16'),
(213, 3, 'stock_in', 'Stock In: JONEL M. JUNSAY at SUPPLY OFFICE. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&client_id=2&items%5B0%5D%5Bname%5D=MASKING%20TAPE&items%5B0%5D%5Bid%5D=57&items%5B0%5D%5Bqty%5D=49&items%5B0%5D%5Bprice%5D=0&panel=stock-in&person_name=JONEL%20M.%20JUNSAY&workplace=SUPPLY%20OFFICE', 'GET', '2026-03-17 17:07:10', '2026-03-17 17:07:10'),
(214, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=INK%20REFILL%20%28%20MARKER%29&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=BOTTLE&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-17 17:07:54', '2026-03-17 17:07:54'),
(215, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=CERTIFICATE%20FRAME%20A4%20BROWN%20&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-17 17:09:07', '2026-03-17 17:09:07'),
(216, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=METAL%20FASTENER&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-17 17:16:31', '2026-03-17 17:16:31'),
(217, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=PLASTIC%20FASTERNER&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-17 17:17:01', '2026-03-17 17:17:01'),
(218, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-17 22:57:49', '2026-03-17 22:57:49'),
(219, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=PINK%20POWDER%20%281KG%29&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PACK&items%5B0%5D%5Bbrand%5D=MIGHTY%20CLEAN&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-17 23:07:24', '2026-03-17 23:07:24'),
(220, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=POWDER%20ORDINARY%20%281KG%29&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PACK&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-17 23:07:56', '2026-03-17 23:07:56'),
(221, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=Zim%20Cleaner&items%5B0%5D%5Bcategory%5D=cleaning&items%5B0%5D%5Bunit%5D=BOTTLE&items%5B0%5D%5Bbrand%5D=Zim%20Cleaner&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-18 00:59:38', '2026-03-18 00:59:38'),
(222, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-18 16:22:24', '2026-03-18 16:22:24'),
(223, 3, 'stock_out', 'Stock Out: GEORGE P. GUMAWA JR. at CAF FACULTY. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&client_id=51&items%5B0%5D%5Bname%5D=Zim%20Cleaner&items%5B0%5D%5Bid%5D=68&items%5B0%5D%5Bqty%5D=1&panel=stock-out&person_name=GEORGE%20P.%20GUMAWA%20JR.&remarks=CLEANING&workplace=CAF%20FACULTY', 'GET', '2026-03-18 18:51:16', '2026-03-18 18:51:16'),
(224, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-22 17:36:59', '2026-03-22 17:36:59'),
(225, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-22 17:37:58', '2026-03-22 17:37:58'),
(226, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-22 21:20:52', '2026-03-22 21:20:52'),
(227, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-23 01:43:55', '2026-03-23 01:43:55'),
(228, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-23 17:06:38', '2026-03-23 17:06:38'),
(229, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-23 17:07:17', '2026-03-23 17:07:17'),
(230, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=MURIATIC%20ACID&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=BOTTLE&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-23 18:50:34', '2026-03-23 18:50:34'),
(231, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-24 16:38:54', '2026-03-24 16:38:54'),
(232, 3, 'stock_out', 'Stock Out: MAY TRESIA JAMON at FACULTY. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&client_id=12&items%5B0%5D%5Bname%5D=BLACK%20BALLPEN&items%5B0%5D%5Bid%5D=48&items%5B0%5D%5Bqty%5D=2&panel=stock-out&person_name=MAY%20TRESIA%20JAMON&remarks=for%20faculty%20purposes&workplace=FACULTY', 'GET', '2026-03-24 16:59:53', '2026-03-24 16:59:53'),
(233, 3, 'stock_out', 'Stock Out: MAY TRESIA JAMON at FACULTY. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&client_id=12&items%5B0%5D%5Bname%5D=RED%20BALLPEN&items%5B0%5D%5Bid%5D=46&items%5B0%5D%5Bqty%5D=2&panel=stock-out&person_name=MAY%20TRESIA%20JAMON&remarks=for%20faculty%20purposes&workplace=FACULTY', 'GET', '2026-03-24 17:00:18', '2026-03-24 17:00:18'),
(234, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=PENCIL&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=HVW&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-24 17:29:26', '2026-03-24 17:29:26'),
(235, 3, 'stock_out', 'Stock Out: PETER GERALD L. JUNSAY at CAF FACULTY. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&client_id=37&items%5B0%5D%5Bname%5D=PENCIL&items%5B0%5D%5Bid%5D=70&items%5B0%5D%5Bqty%5D=4&panel=stock-out&person_name=PETER%20GERALD%20L.%20JUNSAY&remarks=FOR%20FACULTY%20USE&workplace=CAF%20FACULTY', 'GET', '2026-03-24 17:30:28', '2026-03-24 17:30:28'),
(236, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-24 20:53:43', '2026-03-24 20:53:43'),
(237, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=POT%20HOLDER&items%5B0%5D%5Bcategory%5D=cleaning&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-03-24 20:58:53', '2026-03-24 20:58:53'),
(238, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-25 00:40:12', '2026-03-25 00:40:12'),
(239, 3, 'stock_out', 'Stock Out: RAYMON L. BADAYOS at OSSA OFFICE. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&client_id=20&items%5B0%5D%5Bname%5D=CORRECTION%20TAPE&items%5B0%5D%5Bid%5D=10&items%5B0%5D%5Bqty%5D=1&panel=stock-out&person_name=RAYMON%20L.%20BADAYOS&remarks=FOR%20OSSA%20USE.&workplace=OSSA%20OFFICE', 'GET', '2026-03-25 00:40:51', '2026-03-25 00:40:51'),
(240, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-25 16:02:47', '2026-03-25 16:02:47'),
(241, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-25 23:35:01', '2026-03-25 23:35:01'),
(242, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-25 23:35:29', '2026-03-25 23:35:29'),
(243, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-29 16:10:48', '2026-03-29 16:10:48');
INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `description`, `ip_address`, `user_agent`, `url`, `method`, `created_at`, `updated_at`) VALUES
(244, 3, 'stock_out', 'Stock Out: RAYMON L. BADAYOS at OSSA OFFICE. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&client_id=20&items%5B0%5D%5Bname%5D=BONDPAPER%20LEGAL&items%5B0%5D%5Bid%5D=17&items%5B0%5D%5Bqty%5D=2&panel=stock-out&person_name=RAYMON%20L.%20BADAYOS&remarks=for%20graduation&workplace=OSSA%20OFFICE', 'GET', '2026-03-29 16:48:19', '2026-03-29 16:48:19'),
(245, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-29 22:38:43', '2026-03-29 22:38:43'),
(246, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-03-30 18:07:17', '2026-03-30 18:07:17'),
(247, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-05 16:33:21', '2026-04-05 16:33:21'),
(248, 3, 'stock_out', 'Stock Out: ROSE ANN E. LAUREZO at HR OFFICE. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&client_id=14&items%5B0%5D%5Bname%5D=BONDPAPER%20LEGAL&items%5B0%5D%5Bid%5D=17&items%5B0%5D%5Bqty%5D=1&panel=stock-out&person_name=ROSE%20ANN%20E.%20LAUREZO&remarks=for%20DTR%20&workplace=HR%20OFFICE', 'GET', '2026-04-05 16:34:15', '2026-04-05 16:34:15'),
(249, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-06 21:32:18', '2026-04-06 21:32:18'),
(250, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-06 21:33:44', '2026-04-06 21:33:44'),
(251, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-06 22:39:33', '2026-04-06 22:39:33'),
(252, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-06 23:08:22', '2026-04-06 23:08:22'),
(253, 2, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'http://192.168.0.160:8000/login', 'POST', '2026-04-06 23:19:26', '2026-04-06 23:19:26'),
(254, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-06 23:41:50', '2026-04-06 23:41:50'),
(255, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-07 00:28:57', '2026-04-07 00:28:57'),
(256, 2, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-07 20:18:01', '2026-04-07 20:18:01'),
(257, 2, 'logout', 'User logged out.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/logout', 'POST', '2026-04-07 20:26:08', '2026-04-07 20:26:08'),
(258, 2, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-07 20:27:24', '2026-04-07 20:27:24'),
(259, 2, 'logout', 'User logged out.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/logout', 'POST', '2026-04-07 20:34:06', '2026-04-07 20:34:06'),
(260, 2, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-07 20:38:49', '2026-04-07 20:38:49'),
(261, 2, 'logout', 'User logged out.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/logout', 'POST', '2026-04-07 20:44:45', '2026-04-07 20:44:45'),
(262, 2, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-07 20:47:19', '2026-04-07 20:47:19'),
(263, 2, 'logout', 'User logged out.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/logout', 'POST', '2026-04-07 20:53:09', '2026-04-07 20:53:09'),
(264, 2, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-07 20:53:32', '2026-04-07 20:53:32'),
(265, 2, 'logout', 'User logged out.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/logout', 'POST', '2026-04-07 21:10:48', '2026-04-07 21:10:48'),
(266, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-07 21:13:12', '2026-04-07 21:13:12'),
(267, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-12 16:22:14', '2026-04-12 16:22:14'),
(268, 3, 'delete_stock_out_history', 'Deleted stock-out history. Person: JONEL M. JUNSAY. Date: ALL. Rows: 1', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=delete_stock_out_history&panel=stock-out&person_name=JONEL%20M.%20JUNSAY', 'GET', '2026-04-12 17:03:49', '2026-04-12 17:03:49'),
(269, 3, 'add_item', 'Added 1 item row(s) to catalog.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=add_item&items%5B0%5D%5Bitem_name%5D=SLIDING%20FOLDER%20CLEAR%20LONG&items%5B0%5D%5Bcategory%5D=office&items%5B0%5D%5Bunit%5D=PCS&items%5B0%5D%5Bbrand%5D=n%2Fa&items%5B0%5D%5Bdescription%5D=&panel=add-item', 'GET', '2026-04-12 18:36:37', '2026-04-12 18:36:37'),
(270, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-12 19:18:44', '2026-04-12 19:18:44'),
(271, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-12 19:19:33', '2026-04-12 19:19:33'),
(272, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-12 19:20:28', '2026-04-12 19:20:28'),
(273, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-12 19:26:55', '2026-04-12 19:26:55'),
(274, 3, 'delete_item', 'Deleted item: try.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=delete_item&id=74&panel=current_stocks', 'GET', '2026-04-12 20:34:42', '2026-04-12 20:34:42'),
(275, 3, 'delete_item', 'Deleted item: try.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=delete_item&id=75&panel=current_stocks', 'GET', '2026-04-12 20:35:12', '2026-04-12 20:35:12'),
(276, 3, 'stock_out', 'Stock Out by CLAIRE C. NULLAS at CCS FACULTY.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&items%5B0%5D%5Bid%5D=42&items%5B0%5D%5Bname%5D=SLIDING%20FOLDER%20RED&items%5B0%5D%5Bqty%5D=10&panel=stock_out&person_name=CLAIRE%20C.%20NULLAS&remarks=For%20CHED%20Monitoring&workplace=CCS%20FACULTY', 'GET', '2026-04-12 22:25:10', '2026-04-12 22:25:10'),
(277, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-13 16:16:15', '2026-04-13 16:16:15'),
(278, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-13 16:33:18', '2026-04-13 16:33:18'),
(279, 3, 'stock_in', 'Stock In by JONEL M. JUNSAY at SUPPLY OFFICE.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&items%5B0%5D%5Bid%5D=76&items%5B0%5D%5Bname%5D=WHITE%20LONG%20FOLDER&items%5B0%5D%5Bqty%5D=500&items%5B0%5D%5Bprice%5D=0&panel=stock_in&person_name=JONEL%20M.%20JUNSAY&workplace=SUPPLY%20OFFICE', 'GET', '2026-04-13 16:34:22', '2026-04-13 16:34:22'),
(280, 3, 'delete_item', 'Deleted item: REFILL IINK.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=delete_item&id=77&panel=current_stocks', 'GET', '2026-04-13 16:42:15', '2026-04-13 16:42:15'),
(281, 3, 'stock_in', 'Stock In by JONEL M. JUNSAY at SUPPLY OFFICE.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&items%5B0%5D%5Bid%5D=62&items%5B0%5D%5Bname%5D=INK%20REFILL%20%28%20MARKER%29&items%5B0%5D%5Bqty%5D=432&items%5B0%5D%5Bprice%5D=0&panel=stock_in&person_name=JONEL%20M.%20JUNSAY&workplace=SUPPLY%20OFFICE', 'GET', '2026-04-13 16:43:08', '2026-04-13 16:43:08'),
(282, 3, 'stock_in', 'Stock In by JONEL M. JUNSAY at SUPPLY OFFICE.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_in&items%5B0%5D%5Bid%5D=78&items%5B0%5D%5Bname%5D=VERTICAL%20MAGAZINE%20FILE&items%5B0%5D%5Bqty%5D=30&items%5B0%5D%5Bprice%5D=0&panel=stock_in&person_name=JONEL%20M.%20JUNSAY&workplace=SUPPLY%20OFFICE', 'GET', '2026-04-13 16:46:22', '2026-04-13 16:46:22'),
(283, 3, 'update_item', 'Updated item: HDMI 10M.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_item&brand=N%2FA&category=ict&description=&id=61&item_name=HDMI%2010M&model=&panel=current_stocks&price=0.00&quantity=8&serial_number=&unit=PCS', 'GET', '2026-04-13 18:07:16', '2026-04-13 18:07:16'),
(284, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-13 21:57:52', '2026-04-13 21:57:52'),
(285, 3, 'update_item', 'Updated item: SPECIAL PAPER CREAM SHORT.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_item&brand=n%2Fa&category=office&description=&id=41&item_name=SPECIAL%20PAPER%20CREAM%20SHORT&model=&panel=current_stocks&price=0.00&quantity=98&serial_number=&unit=REAM', 'GET', '2026-04-13 22:11:00', '2026-04-13 22:11:00'),
(286, 3, 'update_item', 'Updated item: SPECIAL PAPER.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_item&brand=n%2Fa&category=office&description=&id=39&item_name=SPECIAL%20PAPER&model=&panel=current_stocks&price=0.00&quantity=31&serial_number=&unit=REAM', 'GET', '2026-04-13 22:13:18', '2026-04-13 22:13:18'),
(287, 3, 'stock_out', 'Stock Out by RAYMON L. BADAYOS at OSSA OFFICE.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&items%5B0%5D%5Bid%5D=39&items%5B0%5D%5Bname%5D=SPECIAL%20PAPER&items%5B0%5D%5Bqty%5D=20&panel=stock_out&person_name=RAYMON%20L.%20BADAYOS&remarks=FOR%20GRADUATION%20PURPOSES&workplace=OSSA%20OFFICE', 'GET', '2026-04-13 22:38:01', '2026-04-13 22:38:01'),
(288, 3, 'update_item', 'Updated item: EPSON INK 003 C.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_item&brand=n%2Fa&category=office&description=&id=32&item_name=EPSON%20INK%20003%20C&model=&panel=current_stocks&price=0.00&quantity=102&serial_number=&unit=PCS', 'GET', '2026-04-13 22:40:44', '2026-04-13 22:40:44'),
(289, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-14 17:58:41', '2026-04-14 17:58:41'),
(290, 3, 'stock_out', 'Stock Out by MAY TRESIA JAMON at FACULTY.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&items%5B0%5D%5Bid%5D=17&items%5B0%5D%5Bname%5D=BONDPAPER%20LEGAL&items%5B0%5D%5Bqty%5D=1&panel=stock_out&person_name=MAY%20TRESIA%20JAMON&remarks=For%20Faculty%20Office%20Use&workplace=FACULTY', 'GET', '2026-04-15 01:33:15', '2026-04-15 01:33:15'),
(291, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-15 19:40:13', '2026-04-15 19:40:13'),
(292, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-15 23:35:04', '2026-04-15 23:35:04'),
(293, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-16 00:08:32', '2026-04-16 00:08:32'),
(294, 3, 'stock_out', 'Stock Out by MAY TRESIA JAMON at CHM FACULTY.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&items%5B0%5D%5Bid%5D=34&items%5B0%5D%5Bname%5D=BROWN%20ENVELOP%20LONG&items%5B0%5D%5Bqty%5D=1&panel=stock_out&person_name=MAY%20TRESIA%20JAMON&remarks=FOR%20CHM%20FACULTY%20USE.&workplace=CHM%20FACULTY', 'GET', '2026-04-16 00:09:10', '2026-04-16 00:09:10'),
(295, 3, 'stock_out', 'Stock Out by EMMANUEL M. SALAZA at CHM FACULTY.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&items%5B0%5D%5Bid%5D=16&items%5B0%5D%5Bname%5D=BONDPAPER%20A4&items%5B0%5D%5Bqty%5D=1&panel=stock_out&person_name=EMMANUEL%20M.%20SALAZA&remarks=FOR%20BSHM%20OJT%20USE&workplace=CHM%20FACULTY', 'GET', '2026-04-16 00:24:39', '2026-04-16 00:24:39'),
(296, 3, 'stock_out', 'Stock Out by AN MAE D. ERVITE at SSG.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&items%5B0%5D%5Bid%5D=17&items%5B0%5D%5Bname%5D=BONDPAPER%20LEGAL&items%5B0%5D%5Bqty%5D=1&panel=stock_out&person_name=AN%20MAE%20D.%20ERVITE&remarks=For%20SSG%20Office%20Use&workplace=SSG', 'GET', '2026-04-16 00:40:08', '2026-04-16 00:40:08'),
(297, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-19 16:55:27', '2026-04-19 16:55:27'),
(298, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-19 16:55:54', '2026-04-19 16:55:54'),
(299, 3, 'stock_out', 'Stock Out by MA. JERALDEN NAVALUNA at ADMIN OFFICE.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&items%5B0%5D%5Bid%5D=71&items%5B0%5D%5Bname%5D=POT%20HOLDER&items%5B0%5D%5Bqty%5D=1&panel=stock_out&person_name=MA.%20JERALDEN%20NAVALUNA&remarks=FOR%20ADMIN%20OFFICE%20USE&workplace=ADMIN%20OFFICE', 'GET', '2026-04-19 16:56:30', '2026-04-19 16:56:30'),
(300, 3, 'update_item', 'Updated item: EPSON INK 003 B.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_item&brand=n%2Fa&category=office&description=Epson%20003&id=26&item_name=EPSON%20INK%20003%20B&model=&panel=current_stocks&price=0.00&quantity=180&serial_number=&unit=PCS', 'GET', '2026-04-19 17:43:32', '2026-04-19 17:43:32'),
(301, 3, 'update_item', 'Updated item: EPSON 664 C.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_item&brand=n%2Fa&category=office&description=&id=28&item_name=EPSON%20664%20C&model=&panel=current_stocks&price=0.00&quantity=157&serial_number=&unit=PCS', 'GET', '2026-04-19 17:43:59', '2026-04-19 17:43:59'),
(302, 3, 'update_item', 'Updated item: EPSON INK 664 C.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_item&brand=n%2Fa&category=office&description=&id=28&item_name=EPSON%20INK%20664%20C&model=&panel=current_stocks&price=0.00&quantity=156&serial_number=&unit=PCS', 'GET', '2026-04-19 17:46:18', '2026-04-19 17:46:18'),
(303, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-19 21:15:06', '2026-04-19 21:15:06'),
(304, 3, 'stock_out', 'Stock Out by LEOMAR ROGER CAGADAS at CHM FACULTY.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&items%5B0%5D%5Bid%5D=70&items%5B0%5D%5Bname%5D=PENCIL&items%5B0%5D%5Bqty%5D=12&panel=stock_out&person_name=LEOMAR%20ROGER%20CAGADAS&remarks=FOR%20CHM%20EVENT%20USE.&workplace=CHM%20FACULTY', 'GET', '2026-04-19 21:16:00', '2026-04-19 21:16:00'),
(305, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-20 16:10:39', '2026-04-20 16:10:39'),
(306, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-20 21:47:18', '2026-04-20 21:47:18'),
(307, 3, 'stock_out', 'Stock Out by REDGIE MABILOG at FACULTY.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&items%5B0%5D%5Bid%5D=17&items%5B0%5D%5Bname%5D=BONDPAPER%20LEGAL&items%5B0%5D%5Bqty%5D=1&panel=stock_out&person_name=REDGIE%20MABILOG&remarks=FOR%20FACULTY%20USE.&workplace=FACULTY', 'GET', '2026-04-20 21:47:59', '2026-04-20 21:47:59'),
(308, 3, 'stock_out', 'Stock Out by JERRY JARDELIZA JR. at CCS FACULTY.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&items%5B0%5D%5Bid%5D=17&items%5B0%5D%5Bname%5D=BONDPAPER%20LEGAL&items%5B0%5D%5Bqty%5D=1&panel=stock_out&person_name=JERRY%20JARDELIZA%20JR.&remarks=FOR%20CSS%20FACULTY%20USE&workplace=CCS%20FACULTY', 'GET', '2026-04-20 22:08:50', '2026-04-20 22:08:50'),
(309, 3, 'stock_out', 'Stock Out by CLAIRE C. NULLAS at CCS FACULTY.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&items%5B0%5D%5Bid%5D=16&items%5B0%5D%5Bname%5D=BONDPAPER%20A4&items%5B0%5D%5Bqty%5D=1&panel=stock_out&person_name=CLAIRE%20C.%20NULLAS&remarks=For%20CCS%20Faculty%20Use&workplace=CCS%20FACULTY', 'GET', '2026-04-21 00:04:09', '2026-04-21 00:04:09'),
(310, 3, 'stock_out', 'Stock Out by ROGEN O. NONATO at CHM DEPARMENT.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&items%5B0%5D%5Bid%5D=12&items%5B0%5D%5Bname%5D=STAPLE%20WIRE&items%5B0%5D%5Bqty%5D=1&panel=stock_out&person_name=ROGEN%20O.%20NONATO&remarks=For%20BSHM%20Week%20Use&workplace=CHM%20DEPARMENT', 'GET', '2026-04-21 01:05:13', '2026-04-21 01:05:13'),
(311, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-21 16:17:05', '2026-04-21 16:17:05'),
(312, 3, 'stock_out', 'Stock Out by NONILO B. AUJERO JR. at CCS FACULTY.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&items%5B0%5D%5Bid%5D=17&items%5B0%5D%5Bname%5D=BONDPAPER%20LEGAL&items%5B0%5D%5Bqty%5D=1&panel=stock_out&person_name=NONILO%20B.%20AUJERO%20JR.&remarks=FOR%20EXAM&workplace=CCS%20FACULTY', 'GET', '2026-04-21 16:18:47', '2026-04-21 16:18:47'),
(313, 3, 'stock_out', 'Stock Out by JAYSON MACOLADO at CCS FACULTY.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&items%5B0%5D%5Bid%5D=&items%5B0%5D%5Bname%5D=&items%5B0%5D%5Bqty%5D=1&panel=stock_out&person_name=JAYSON%20MACOLADO&remarks=FOR%20FINAL%20EXAM&workplace=CCS%20FACULTY', 'GET', '2026-04-21 17:03:59', '2026-04-21 17:03:59'),
(314, 3, 'stock_out', 'Stock Out by JONEL M. JUNSAY at SUPPLY OFFICE.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&items%5B0%5D%5Bid%5D=17&items%5B0%5D%5Bname%5D=BONDPAPER%20LEGAL&items%5B0%5D%5Bqty%5D=1&panel=stock_out&person_name=JONEL%20M.%20JUNSAY&remarks=FOR%20SUPPLY%20OFFICE%20USE&workplace=SUPPLY%20OFFICE', 'GET', '2026-04-21 20:22:34', '2026-04-21 20:22:34'),
(315, 3, 'stock_out', 'Stock Out by AN MAE D. ERVITE at CASHIER\'S OFFICE.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&items%5B0%5D%5Bid%5D=&items%5B0%5D%5Bname%5D=&items%5B0%5D%5Bqty%5D=1&panel=stock_out&person_name=AN%20MAE%20D.%20ERVITE&remarks=For%20Cashier%27s%20Office%20Use&workplace=CASHIER%27S%20OFFICE', 'GET', '2026-04-22 00:28:07', '2026-04-22 00:28:07'),
(316, 3, 'update_item', 'Updated item: calculator.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'http://192.168.0.160:8000/inventory?action=update_item&brand=&category=office&description=&id=80&item_name=calculator&model=&panel=current_stocks&price=0.00&quantity=3&serial_number=&unit=PCS', 'GET', '2026-04-22 00:28:38', '2026-04-22 00:28:38'),
(317, 3, 'login', 'User logged in.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'http://192.168.0.160:8000/login', 'POST', '2026-04-22 18:15:33', '2026-04-22 18:15:33'),
(318, 3, 'stock_out', 'Stock Out by RICO D. JORNADAL at RESEARCH OFFICE.', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'http://192.168.0.160:8000/inventory?action=stock_out&items%5B0%5D%5Bid%5D=59&items%5B0%5D%5Bname%5D=DUCT%20TAPE&items%5B0%5D%5Bqty%5D=1&panel=stock_out&person_name=RICO%20D.%20JORNADAL&remarks=FOR%20RESEARCH%20OFFICE%20USE&workplace=RESEARCH%20OFFICE', 'GET', '2026-04-22 18:30:34', '2026-04-22 18:30:34'),
(319, 3, 'db_backup', 'Database backup created: supply_office_inventory_20260423_040248.sql', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'http://192.168.0.160:8000/inventory?action=db_backup&panel=security', 'GET', '2026-04-22 20:02:48', '2026-04-22 20:02:48'),
(320, 3, 'db_export', 'Downloaded backup: supply_office_inventory_20260423_040248.sql', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'http://192.168.0.160:8000/inventory?action=db_export&file=supply_office_inventory_20260423_040248.sql&panel=security', 'GET', '2026-04-22 20:02:58', '2026-04-22 20:02:58'),
(321, 3, 'db_backup', 'Database backup created: supply_office_inventory_20260423_041848.sql', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'http://192.168.0.160:8000/inventory?action=db_backup&panel=security', 'GET', '2026-04-22 20:18:49', '2026-04-22 20:18:49'),
(322, 3, 'db_export', 'Downloaded backup: supply_office_inventory_20260423_041848.sql', '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'http://192.168.0.160:8000/inventory?action=db_export&file=supply_office_inventory_20260423_041848.sql&panel=security', 'GET', '2026-04-22 20:18:54', '2026-04-22 20:18:54');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `workplace` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `workplace`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'john colin d. generillo', 'supply office', '2026-03-03 23:30:45', '2026-03-10 23:40:07', '2026-03-10 23:40:07'),
(2, 'JONEL M. JUNSAY', 'SUPPLY OFFICE', '2026-03-05 23:31:56', '2026-03-10 23:40:01', NULL),
(3, 'RYAN  B. GARCIA', 'MIS', '2026-03-10 23:26:04', '2026-03-10 23:30:30', NULL),
(4, 'MARY JANICE L. MANDIA', 'LIBRARY', '2026-03-10 23:32:36', '2026-03-10 23:34:27', NULL),
(5, 'SHEILA MAE V. ANABO', 'ADMINISTRATIVE OFFICE', '2026-03-10 23:33:38', '2026-03-10 23:33:38', NULL),
(6, 'NOEL B. FORDENTE', 'ADMIN OFFICE', '2026-03-10 23:34:52', '2026-03-10 23:34:52', NULL),
(7, 'ERWIN C. OYEMAN', 'MIS OFFICE', '2026-03-10 23:36:34', '2026-03-10 23:57:54', NULL),
(8, 'ROGEN O. NONATO', 'CHM DEPARMENT', '2026-03-10 23:37:43', '2026-03-11 16:54:06', NULL),
(9, 'SHAIRADENE M. JUNSAY', 'ASSESSMENT OFFICE', '2026-03-10 23:39:14', '2026-03-11 16:51:29', NULL),
(10, 'CHRISTIAN ANTHONY G. SEFINO', 'CHM FACULTY', '2026-03-10 23:41:23', '2026-03-11 16:49:31', NULL),
(11, 'RICO D. JORNADAL', 'RESEARCH OFFICE', '2026-03-10 23:42:16', '2026-03-10 23:42:16', NULL),
(12, 'MAY TRESIA JAMON', 'CHM FACULTY', '2026-03-10 23:43:29', '2026-03-11 00:03:40', NULL),
(13, 'JOSEPH CRIS D. JAO', 'GUIDANCE OFFICE', '2026-03-10 23:44:43', '2026-03-10 23:56:53', NULL),
(14, 'ROSE ANN E. LAUREZO', 'HR OFFICE', '2026-03-10 23:46:01', '2026-03-11 16:52:00', NULL),
(15, 'RUEL JOHN CLAMIANO', 'COTED FACULTY', '2026-03-10 23:46:44', '2026-03-11 00:04:01', NULL),
(16, 'NONILO B. AUJERO JR.', 'CCS FACULTY', '2026-03-10 23:47:35', '2026-03-11 16:45:10', NULL),
(17, 'JERICO A. PONTINO', 'MAINTENANCE OFFICE', '2026-03-10 23:48:21', '2026-03-10 23:48:21', NULL),
(18, 'MA. JERALDEN NAVALUNA', 'ADMIN OFFICE', '2026-03-10 23:48:54', '2026-03-10 23:48:54', NULL),
(19, 'AN MAE D. ERVITE', 'CASHIER\'S OFFICE', '2026-03-10 23:49:26', '2026-03-11 16:45:36', NULL),
(20, 'RAYMON L. BADAYOS', 'OSSA OFFICE', '2026-03-10 23:51:02', '2026-03-11 16:50:00', NULL),
(21, 'APRIL JOY G. DOMINGUEZ', 'REGISTRAR\'S OFFICE', '2026-03-10 23:52:02', '2026-03-10 23:52:47', NULL),
(22, 'JAIRUS D. ZAPANTA', 'MAINTENANCE OFFICE', '2026-03-10 23:53:44', '2026-03-11 16:56:29', NULL),
(23, 'RONELO V. GASATAYA JR.', 'RESEARCH OFFICE', '2026-03-10 23:54:28', '2026-03-10 23:54:28', NULL),
(24, 'MELDY S. LUBRICO', 'COTED FACULTY', '2026-03-10 23:55:04', '2026-03-11 00:03:51', NULL),
(25, 'RICKY E. BARRIDO JR.', 'CCS FACULTY', '2026-03-10 23:55:41', '2026-03-10 23:58:51', NULL),
(26, 'AROLD MANAQUIL', 'CHM FACULTY', '2026-03-10 23:56:27', '2026-03-11 00:03:16', NULL),
(27, 'JOALYN DE ASIS', 'CAF FACULTY', '2026-03-10 23:57:40', '2026-03-10 23:57:40', NULL),
(28, 'ROSE MAE RIVERA', 'HR OFFICE', '2026-03-11 00:00:01', '2026-03-11 00:00:01', NULL),
(29, 'ZHEA LIBERIE F. SALEM', 'REGISTRAR\'S OFFICE', '2026-03-11 00:01:34', '2026-03-11 16:54:55', NULL),
(30, 'MA. MAE KENDRA CANALES', 'COTED FACULTY', '2026-03-11 00:03:04', '2026-03-11 00:03:04', NULL),
(31, 'MA. JANESA CAWALING', 'FACULTY OFFICE', '2026-03-11 00:05:12', '2026-03-11 00:05:12', NULL),
(32, 'LEOMAR ROGER CAGADAS', 'CHM FACULTY', '2026-03-11 00:08:24', '2026-03-11 00:08:24', NULL),
(33, 'CHRISTIAN M. SABANDO', 'CLINIC', '2026-03-11 00:09:04', '2026-03-11 00:13:43', NULL),
(34, 'EUGEMY GRULLO', 'COTED FACULTY', '2026-03-11 00:10:02', '2026-03-11 16:59:01', NULL),
(35, 'JORLYN MARIE JUDIADAN', 'CAF FACULTY', '2026-03-11 00:11:33', '2026-03-11 17:00:22', NULL),
(36, 'JENELYN C. GANTALAO', 'PRODUCTION OFFICE', '2026-03-11 00:12:03', '2026-03-11 00:12:15', NULL),
(37, 'PETER GERALD L. JUNSAY', 'CAF FACULTY', '2026-03-11 00:12:43', '2026-03-11 00:12:43', NULL),
(38, 'JEMAICA SAGUIRRE', 'LIBRARY', '2026-03-11 00:13:36', '2026-03-11 00:13:36', NULL),
(39, 'REDGIE MABILOG', 'FACULTY', '2026-03-11 00:14:26', '2026-03-11 00:14:26', NULL),
(40, 'CHRISTAIN M. PLAZA', 'COTED FACULTY', '2026-03-11 00:15:04', '2026-03-11 01:30:35', NULL),
(41, 'JERRY JARDELIZA JR.', 'CCS FACULTY', '2026-03-11 00:16:32', '2026-03-11 16:59:47', NULL),
(42, 'WILROSE SANDRINO', 'CCS FACULTY', '2026-03-11 00:17:29', '2026-03-11 00:17:29', NULL),
(43, 'ELMER L. FUENTES', 'PRODUCTION OFFICE', '2026-03-11 00:18:19', '2026-03-11 00:18:19', NULL),
(44, 'JAYSON MACOLADO', 'CCS FACULTY', '2026-03-11 00:18:49', '2026-03-11 00:18:49', NULL),
(45, 'THERESA JANE GUTIEREZ', 'CAF FACULTY', '2026-03-11 00:19:33', '2026-03-11 00:19:33', NULL),
(46, 'STROLL C. ESPAÑOLA', 'CCS FACULTY', '2026-03-11 00:20:32', '2026-03-11 00:20:32', NULL),
(47, 'ULDARICO BAYONA', 'CAF FACULTY', '2026-03-11 00:21:10', '2026-03-11 16:57:35', NULL),
(48, 'ROSANNA QUINCO', 'CSS FACULTY', '2026-03-11 01:29:45', '2026-03-11 01:29:45', NULL),
(49, 'JOL T. GUMAWA', 'OSSA OFFICE', '2026-03-11 16:35:00', '2026-03-11 16:35:00', NULL),
(50, 'JONAS D. SINGSON', 'REGISTRAR\'S OFFICE', '2026-03-11 16:37:31', '2026-03-11 16:37:31', NULL),
(51, 'GEORGE P. GUMAWA JR.', 'CAF FACULTY', '2026-03-11 16:47:01', '2026-03-11 16:47:01', NULL),
(52, 'EMMANUEL M. SALAZA', 'CHM FACULTY', '2026-03-11 16:47:38', '2026-03-11 16:47:38', NULL),
(53, 'JAYLEN SALURIA-ROBLES', 'FACULTY', '2026-03-11 16:48:59', '2026-03-11 16:48:59', NULL),
(54, 'NIEL KEVIN C. MAGNO', 'SUPPLY OFFICE', '2026-03-11 16:52:38', '2026-03-11 16:52:38', NULL),
(55, 'JADE E. MATTI', 'DRIVER\'S OFFICE', '2026-03-11 16:53:42', '2026-03-11 16:53:42', NULL),
(56, 'RIA SULON', 'ADMISSION OFFICE', '2026-03-11 16:55:32', '2026-03-11 16:55:32', NULL),
(57, 'JO HANNAH S. TORREMOCHA', 'CLINIC', '2026-03-11 16:56:13', '2026-03-11 16:56:13', NULL),
(58, 'NELSON LIBREL JR.', 'CCS FACULTY', '2026-03-11 17:01:00', '2026-03-11 17:01:00', NULL),
(59, 'AILYN MISSION', 'COTED FACULTY', '2026-03-11 17:01:48', '2026-03-11 17:01:48', NULL),
(60, 'KRISHA MAY NUÑEZ', 'CHM FACULTY', '2026-03-11 17:02:30', '2026-03-11 17:02:30', NULL),
(61, 'CLAIRE C. NULLAS', 'CCS FACULTY', '2026-03-11 17:02:59', '2026-03-11 17:02:59', NULL),
(62, 'JOHN MARK PARREÑO', 'CAF FACULTY', '2026-03-11 17:03:31', '2026-03-11 17:03:31', NULL),
(63, 'FRANCIS JOHN SABANDO', 'CHM FACULTY', '2026-03-11 17:04:14', '2026-03-11 17:04:14', NULL),
(64, 'JOHN COLIN D. GENERILLO', 'SUPPLY OFFICE', '2026-03-11 19:02:48', '2026-03-11 19:02:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `confirmation_codes`
--

CREATE TABLE `confirmation_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `confirmation_codes`
--

INSERT INTO `confirmation_codes` (`id`, `role`, `code`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'cpsuadmin@2026', 'Default admin confirmation code for creating admin accounts', 1, '2026-03-03 23:21:30', '2026-04-12 19:20:28'),
(2, 'developer', 'cpsudeveloper@2026', 'Default developer confirmation code for creating developer accounts', 1, '2026-03-03 23:21:30', '2026-04-12 19:20:28');

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
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_number` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `category` enum('office_supplies','ict_office_supplies','cleaning_supplies','agronomic_supplies') NOT NULL,
  `unit` enum('PCS','REAM','BOX','SET','BOTTLE','PACK','LITER','MILLILITER','GALLON','METER','CENTIMETER','KILOGRAM','GRAM','ROLL','CAN','TUBE','BAG','SACK') DEFAULT 'PCS',
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `stock_number`, `item_name`, `brand`, `model`, `serial_number`, `category`, `unit`, `description`, `price`, `quantity`, `date_added`, `created_at`, `updated_at`, `added_by`) VALUES
(2, '0001', 'BALL PEN Fine Tech', 'DONG-A', NULL, NULL, 'office_supplies', 'PCS', '0.4 Fine tech ballpen', 0.00, 97, '2026-03-05 23:31:24', '2026-03-05 23:31:24', '2026-04-22 18:27:38', 4),
(3, '0003', 'TISSUE', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 23, '2026-03-08 16:30:30', '2026-03-08 16:30:30', '2026-04-12 16:32:15', 3),
(4, '0004', 'METAL TRAY 4LAYER', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 64, '2026-03-08 17:06:06', '2026-03-08 17:06:06', '2026-03-11 16:32:41', 3),
(5, '0005', 'METAL TRAY', 'n/a', NULL, NULL, 'office_supplies', 'PCS', '4LAYER', 300.00, 100, '2026-03-08 17:06:09', '2026-03-08 17:06:09', '2026-03-11 21:02:42', 3),
(6, '0006', 'METAL TRAY 3 LAYER', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 31, '2026-03-08 17:06:43', '2026-03-08 17:06:43', '2026-03-12 00:44:43', 3),
(7, '0007', 'PLASTIC TRAY', 'n/a', NULL, NULL, 'office_supplies', 'PCS', '10', 0.00, 10, '2026-03-08 17:07:37', '2026-03-08 17:07:37', '2026-03-08 17:19:43', 3),
(8, '0008', 'GLUE', 'n/a', NULL, NULL, 'office_supplies', 'PCS', '250G ALL PURPOSE GLUE', 0.00, 139, '2026-03-08 17:10:04', '2026-03-08 17:10:04', '2026-04-12 21:32:11', 3),
(9, '0009', 'STAPLER', 'KANGARO', NULL, NULL, 'office_supplies', 'PCS', 'HEAVY DUTY', 0.00, 16, '2026-03-08 17:10:53', '2026-03-08 17:10:53', '2026-03-12 00:40:40', 3),
(10, '0010', 'CORRECTION TAPE', 'n/a', NULL, NULL, 'office_supplies', 'PCS', '1.5METER', 0.00, 595, '2026-03-08 17:16:16', '2026-03-08 17:16:16', '2026-04-13 17:17:34', 3),
(11, '0011', 'PUNCHER', 'N/A', NULL, NULL, 'office_supplies', 'PCS', 'HEAVY DUTY', 0.00, 4, '2026-03-08 17:16:16', '2026-03-08 17:16:16', '2026-03-08 17:24:54', 3),
(12, '0012', 'STAPLE WIRE', 'N/A', NULL, NULL, 'office_supplies', 'BOX', 'NUMBER 35', 0.00, 50, '2026-03-08 17:16:16', '2026-03-08 17:16:16', '2026-04-22 18:29:52', 3),
(13, '0013', 'TAPE DISPENSER', 'N/A', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 12, '2026-03-08 17:16:16', '2026-03-08 17:16:16', '2026-03-08 17:25:37', 3),
(14, '0014', 'PANDA SIGNPEN', 'N/A', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 43, '2026-03-08 17:16:17', '2026-03-08 17:16:17', '2026-03-17 17:14:43', 3),
(15, '0015', 'DIPLOMA HOLDER', 'N/A', NULL, NULL, 'office_supplies', 'PCS', 'A4', 0.00, 57, '2026-03-08 17:16:17', '2026-03-08 17:16:17', '2026-04-12 16:41:37', 3),
(16, '0016', 'BONDPAPER A4', 'N/A', NULL, NULL, 'office_supplies', 'REAM', 'A4', 0.00, 131, '2026-03-08 17:16:17', '2026-03-08 17:16:17', '2026-04-22 18:21:34', 3),
(17, '0017', 'BONDPAPER LEGAL', 'N/A', NULL, NULL, 'office_supplies', 'REAM', 'LONG', 0.00, 60, '2026-03-08 17:16:17', '2026-03-08 17:16:17', '2026-04-22 18:33:28', 3),
(18, '0018', 'BONDPAPER LETTER', 'N/A', NULL, NULL, 'office_supplies', 'REAM', 'LETTER', 0.00, 2, '2026-03-08 17:16:17', '2026-03-08 17:16:17', '2026-03-11 01:41:05', 3),
(19, '0019', 'EPSON INK 664 B', 'EPSON', 'N/A', 'N/A', 'ict_office_supplies', 'PCS', 'EPSON 664 BLACK INK', 0.00, 120, '2026-03-11 21:22:15', '2026-03-11 21:22:15', '2026-04-22 18:33:03', 2),
(20, '0020', 'EPSON INK 664 M', 'EPSON', NULL, NULL, 'ict_office_supplies', 'PCS', 'EEPSON 664 MAGENTA', 0.00, 63, '2026-03-11 21:25:55', '2026-03-11 21:25:55', '2026-04-19 17:45:56', 2),
(21, '0021', 'EPSON INK 664 Y', 'EPSON', NULL, NULL, 'ict_office_supplies', 'PCS', 'EPSON INK 664 YELLOW', 0.00, 66, '2026-03-12 00:39:15', '2026-03-12 00:39:15', '2026-04-19 17:45:56', 2),
(22, '0022', 'EPSON INK 003 Y', 'EPSON', NULL, NULL, 'ict_office_supplies', 'PCS', 'EPSON INK 003 YELLOW', 0.00, 87, '2026-03-12 00:39:15', '2026-03-12 00:39:15', '2026-04-21 01:06:25', 2),
(23, '0023', 'EPSON INK 003 M', 'EPSON', NULL, NULL, 'ict_office_supplies', 'PCS', 'EPSON INK 003 MAGENTA', 0.00, 129, '2026-03-12 00:39:15', '2026-03-12 00:39:15', '2026-04-21 01:06:25', 2),
(24, '0024', 'MOP HEAD', 'n/a', NULL, NULL, 'cleaning_supplies', 'PCS', NULL, 0.00, 5, '2026-03-12 00:47:45', '2026-03-12 00:47:45', '2026-04-06 23:46:12', 2),
(25, '0025', 'VENUS CHAKL', 'n/a', NULL, NULL, 'office_supplies', 'BOX', 'CHALK', 0.00, 40, '2026-03-16 17:52:31', '2026-03-16 17:52:31', '2026-03-16 17:55:02', 3),
(26, '0026', 'EPSON INK 003 B', 'n/a', NULL, NULL, 'office_supplies', 'PCS', 'Epson 003', 0.00, 179, '2026-03-16 17:52:32', '2026-03-16 17:52:32', '2026-04-21 01:06:25', 3),
(27, '0027', 'BONDPAPER F4', 'n/a', NULL, NULL, 'office_supplies', 'REAM', 'F4 BONDPAPER', 0.00, 4, '2026-03-16 17:53:38', '2026-03-16 17:53:38', '2026-03-16 17:55:51', 3),
(28, '0028', 'EPSON INK 664 C', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 156, '2026-03-16 17:57:20', '2026-03-16 17:57:20', '2026-04-19 17:46:18', 3),
(29, '0029', 'EXPANDED FOLDER RED', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 186, '2026-03-16 17:58:07', '2026-03-16 17:58:07', '2026-04-12 16:51:09', 3),
(30, '0030', 'LAMINITING FILM', 'n/a', NULL, NULL, 'office_supplies', 'BOX', NULL, 0.00, 339, '2026-03-16 17:59:46', '2026-03-16 17:59:46', '2026-03-25 16:55:09', 3),
(31, '0031', 'WHITE FOLDER SMALL', 'N/A', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 3498, '2026-03-16 17:59:46', '2026-03-16 17:59:46', '2026-03-24 22:54:00', 3),
(32, '0032', 'EPSON INK 003 C', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 100, '2026-03-16 18:00:22', '2026-03-16 18:00:22', '2026-04-21 01:06:25', 3),
(33, '0033', 'BROWN ENVELOP SHORT', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 4481, '2026-03-16 18:00:42', '2026-03-16 18:00:42', '2026-04-15 02:03:44', 3),
(34, '0034', 'BROWN ENVELOP LONG', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 1109, '2026-03-16 18:01:02', '2026-03-16 18:01:02', '2026-04-16 00:09:10', 3),
(35, '0035', 'DUSTLESS CHALK TOP', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 4098, '2026-03-16 18:01:45', '2026-03-16 18:01:45', '2026-03-17 22:55:54', 3),
(36, '0036', 'BLUEBOOK 500 PAGES', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 5, '2026-03-16 18:05:03', '2026-03-16 18:05:03', '2026-03-16 18:14:29', 3),
(37, '0037', 'BLUE BOOK 300 PAGES', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 15, '2026-03-16 18:05:57', '2026-03-16 18:05:57', '2026-03-16 18:14:40', 3),
(38, '0038', 'CARBON', NULL, NULL, NULL, 'office_supplies', 'PCS', '2PACKS', 0.00, 2, '2026-03-16 18:05:57', '2026-03-16 18:05:57', '2026-03-16 18:14:48', 3),
(39, '0039', 'SPECIAL PAPER', 'n/a', NULL, NULL, 'office_supplies', 'REAM', NULL, 0.00, 11, '2026-03-16 18:06:20', '2026-03-16 18:06:20', '2026-04-13 22:38:01', 3),
(40, '0040', 'PHOTO PAPER LONG GLOSSY', 'n/a', NULL, NULL, 'office_supplies', 'REAM', NULL, 0.00, 7, '2026-03-16 18:06:38', '2026-03-16 18:06:38', '2026-04-14 18:16:41', 3),
(41, '0041', 'SPECIAL PAPER CREAM SHORT', 'n/a', NULL, NULL, 'office_supplies', 'REAM', NULL, 0.00, 98, '2026-03-16 18:07:02', '2026-03-16 18:07:02', '2026-04-13 22:11:00', 3),
(42, '0042', 'SLIDING FOLDER RED', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 164, '2026-03-16 18:07:23', '2026-03-16 18:07:23', '2026-04-12 22:25:10', 3),
(43, '0043', 'SLIDING FOLDER ORANGE', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 29, '2026-03-16 18:07:47', '2026-03-16 18:07:47', '2026-04-12 18:41:09', 3),
(44, '0044', 'SLIDING FOLDER VIOLET', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 75, '2026-03-16 18:08:08', '2026-03-16 18:08:08', '2026-04-12 22:16:38', 3),
(45, '0045', 'CONSTRUCTION PAPER ASSORTED', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 0, '2026-03-16 18:08:44', '2026-03-16 18:08:44', '2026-03-16 18:08:44', 3),
(46, '0046', 'RED BALLPEN', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 98, '2026-03-16 18:09:20', '2026-03-16 18:09:20', '2026-03-24 17:00:18', 3),
(47, '0047', 'BLUE BALLPEN', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 1100, '2026-03-16 18:09:37', '2026-03-16 18:09:37', '2026-03-17 17:06:16', 3),
(48, '0048', 'BLACK BALLPEN', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 415, '2026-03-16 18:09:51', '2026-03-16 18:09:51', '2026-04-22 18:27:38', 3),
(49, '0049', 'BLACK MARKER', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 26, '2026-03-16 18:10:10', '2026-03-16 18:10:10', '2026-03-16 18:18:19', 3),
(50, '0050', 'PERMANENT MARKER', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 46, '2026-03-16 18:10:25', '2026-03-16 18:10:25', '2026-03-18 17:52:42', 3),
(51, '0051', 'STAMPAD INK', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 73, '2026-03-16 18:10:48', '2026-03-16 18:10:48', '2026-03-16 18:18:47', 3),
(52, '0052', 'PAPER CLIP', 'n/a', NULL, NULL, 'office_supplies', 'BOX', NULL, 0.00, 226, '2026-03-16 18:11:17', '2026-03-16 18:11:17', '2026-04-22 18:28:58', 3),
(53, '0053', 'STAMP PAD', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 11, '2026-03-16 18:11:45', '2026-03-16 18:11:45', '2026-03-17 16:57:25', 3),
(54, '0054', 'YELLOW FOLDER', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 280, '2026-03-16 18:12:07', '2026-03-16 18:12:07', '2026-03-16 18:19:41', 3),
(55, '0055', 'GREEN FOLDER', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 272, '2026-03-16 18:12:24', '2026-03-16 18:12:24', '2026-04-06 22:41:35', 3),
(56, '0056', 'RED FOLDER', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 65, '2026-03-16 18:12:37', '2026-03-16 18:12:37', '2026-03-16 18:20:12', 3),
(57, '0057', 'MASKING TAPE', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 228, '2026-03-16 18:12:53', '2026-03-16 18:12:53', '2026-03-29 22:41:10', 3),
(58, '0058', 'TRANSPARENT TAPE', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 54, '2026-03-16 18:13:06', '2026-03-16 18:13:06', '2026-04-12 18:41:09', 3),
(59, '0059', 'DUCT TAPE', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 132, '2026-03-16 18:13:24', '2026-03-16 18:13:24', '2026-04-22 18:30:34', 3),
(60, '0060', 'DOUBLE SIDED TAPE', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 106, '2026-03-16 18:14:11', '2026-03-16 18:14:11', '2026-04-12 21:04:10', 3),
(61, '0061', 'HDMI 10M', 'N/A', NULL, NULL, 'ict_office_supplies', 'PCS', NULL, 0.00, 7, '2026-03-16 18:14:12', '2026-03-16 18:14:12', '2026-04-13 18:08:20', 3),
(62, '0062', 'INK REFILL ( MARKER)', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 451, '2026-03-17 17:07:54', '2026-03-17 17:07:54', '2026-04-13 16:43:08', 3),
(63, '0063', 'CERTIFICATE FRAME A4 BROWN', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 76, '2026-03-17 17:09:07', '2026-03-17 17:09:07', '2026-04-13 22:01:24', 3),
(64, '0064', 'METAL FASTENER', NULL, NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 22, '2026-03-17 17:16:31', '2026-03-17 17:16:31', '2026-03-17 17:17:15', 3),
(65, '0065', 'PLASTIC FASTERNER', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 29, '2026-03-17 17:17:01', '2026-03-17 17:17:01', '2026-03-17 17:17:26', 3),
(66, '0066', 'PINK POWDER (1KG)', 'MIGHTY CLEAN', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 75, '2026-03-17 23:07:24', '2026-03-17 23:07:24', '2026-03-17 23:08:56', 3),
(67, '0067', 'POWDER ORDINARY (1KG)', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 4, '2026-03-17 23:07:56', '2026-03-17 23:07:56', '2026-04-13 22:10:35', 3),
(68, '0068', 'Zim Cleaner', 'Zim Cleaner', NULL, NULL, 'cleaning_supplies', 'PCS', NULL, 0.00, 2, '2026-03-18 00:59:38', '2026-03-18 00:59:38', '2026-03-18 18:51:16', 3),
(69, '0069', 'MURIATIC ACID 1LTER', 'n/a', NULL, NULL, 'office_supplies', 'LITER', NULL, 0.00, 172, '2026-03-23 18:50:33', '2026-03-23 18:50:33', '2026-04-06 23:28:47', 3),
(70, '0070', 'PENCIL', 'HVW', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 402, '2026-03-24 17:29:26', '2026-03-24 17:29:26', '2026-04-19 21:16:00', 3),
(71, '0071', 'POT HOLDER', 'n/a', NULL, NULL, 'cleaning_supplies', 'PCS', NULL, 0.00, 324, '2026-03-24 20:58:53', '2026-03-24 20:58:53', '2026-04-19 16:56:30', 3),
(73, '0072', 'SLIDING FOLDER CLEAR LONG', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 370, '2026-04-12 18:36:37', '2026-04-12 18:36:37', '2026-04-13 16:17:10', 3),
(76, 'STK-0074', 'WHITE LONG FOLDER', 'LASER', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 480, '2026-04-14 00:33:56', '2026-04-13 16:33:56', '2026-04-15 19:41:02', 3),
(78, 'STK-0077', 'VERTICAL MAGAZINE FILE', 'n/a', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 30, '2026-04-14 00:46:06', '2026-04-13 16:46:06', '2026-04-13 16:46:22', 3),
(79, 'STK-0079', 'EPSON INK 003 C', 'EPSON', NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 0, '2026-04-14 06:39:57', '2026-04-13 22:39:57', '2026-04-13 22:39:57', 3),
(80, 'STK-0080', 'calculator', NULL, NULL, NULL, 'office_supplies', 'PCS', NULL, 0.00, 2, '2026-04-22 08:28:23', '2026-04-22 00:28:23', '2026-04-22 00:29:18', 3);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_17_030400_create_items_table', 1),
(5, '2025_10_17_030400_create_stock_ins_table', 1),
(6, '2025_10_17_030400_create_stock_outs_table', 1),
(7, '2025_10_17_030409_add_role_to_users_table', 1),
(8, '2025_10_24_000001_add_added_by_to_items_table', 1),
(9, '2025_10_24_000002_update_stock_ins_add_totals_and_recorded_by', 1),
(10, '2025_10_24_000003_update_stock_outs_add_recorded_by_and_remarks', 1),
(11, '2025_10_28_195941_create_clients_table', 1),
(12, '2025_10_28_200336_fix_clients_table', 1),
(13, '2025_10_30_101200_add_remarks_to_stock_outs_table', 1),
(14, '2025_12_16_024626_add_profile_picture_column_to_users_table', 1),
(15, '2025_12_19_000000_create_activity_logs_table', 1),
(16, '2026_01_05_111248_create_confirmation_codes_table', 1);

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
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('k2E0F4xeVdlBMLJ5UylBX9iIqxhUYLeaHzu7G9LX', 3, '192.168.0.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiblE2YWE0aUZCaWZROElkNG9UV0F0bW5rVkFjM3piUzh2OXZIc3JrUCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1NToiaHR0cDovLzE5Mi4xNjguMC4xNjA6ODAwMC9pbnZlbnRvcnk/cGFuZWw9ZGFpbHlfcmVwb3J0cyI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjk5OiJodHRwOi8vMTkyLjE2OC4wLjE2MDo4MDAwL2ludmVudG9yeT9hY3Rpb249Z2V0X3dhcm5pbmcmc2lkPWsyRTBGNHhlVmRsQk1MSjVVeWxCWDlpSXF4aFVZTGVhSHp1N0c5TFgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO30=', 1776918859);

-- --------------------------------------------------------

--
-- Table structure for table `stock_ins`
--

CREATE TABLE `stock_ins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `person_name` varchar(255) NOT NULL,
  `workplace` varchar(255) NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `total_cost` decimal(12,2) DEFAULT NULL,
  `recorded_by` bigint(20) UNSIGNED DEFAULT NULL,
  `stock_in_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_ins`
--

INSERT INTO `stock_ins` (`id`, `person_name`, `workplace`, `item_id`, `quantity`, `price`, `total_cost`, `recorded_by`, `stock_in_date`, `created_at`, `updated_at`) VALUES
(20, 'JONEL M. JUNSAY', 'SUPPLY OFFICE', 2, 2, 0.00, NULL, 3, '2026-03-12 04:20:30', '2026-03-11 20:20:30', '2026-03-11 20:20:30'),
(21, 'JONEL M. JUNSAY', 'SUPPLY OFFICE', 5, 100, 300.00, 30000.00, 3, '2026-03-12 05:02:42', '2026-03-11 21:02:42', '2026-03-11 21:02:42'),
(22, 'JONEL M. JUNSAY', 'SUPPLY OFFICE', 19, 124, 0.00, NULL, 2, '2026-03-12 05:23:09', '2026-03-11 21:23:09', '2026-03-11 21:23:09'),
(23, 'JONEL M. JUNSAY', 'SUPPLY OFFICE', 19, 124, 0.00, NULL, 2, '2026-03-12 05:23:10', '2026-03-11 21:23:10', '2026-03-11 21:23:10'),
(24, 'JONEL M. JUNSAY', 'SUPPLY OFFICE', 17, 90, 0.00, NULL, 3, '2026-03-18 01:05:39', '2026-03-17 17:05:39', '2026-03-17 17:05:39'),
(25, 'JONEL M. JUNSAY', 'SUPPLY OFFICE', 47, 150, 0.00, NULL, 3, '2026-03-18 01:06:16', '2026-03-17 17:06:16', '2026-03-17 17:06:16'),
(26, 'JONEL M. JUNSAY', 'SUPPLY OFFICE', 57, 49, 0.00, NULL, 3, '2026-03-18 01:07:10', '2026-03-17 17:07:10', '2026-03-17 17:07:10'),
(27, 'JONEL M. JUNSAY', 'SUPPLY OFFICE', 62, 19, 0.00, NULL, 3, '2026-03-18 01:08:19', '2026-03-17 17:08:19', '2026-03-17 17:08:19'),
(28, 'JONEL M. JUNSAY', 'SUPPLY OFFICE', 63, 50, 0.00, NULL, 3, '2026-03-18 01:09:35', '2026-03-17 17:09:35', '2026-03-17 17:09:35'),
(29, 'JONEL M. JUNSAY', 'SUPPLY OFFICE', 73, 384, 0.00, NULL, 3, '2026-04-13 02:37:08', '2026-04-12 18:37:08', '2026-04-12 18:37:08'),
(30, 'JONEL M. JUNSAY', 'SUPPLY OFFICE', 76, 500, 0.00, NULL, 3, '2026-04-14 00:34:22', '2026-04-13 16:34:22', '2026-04-13 16:34:22'),
(31, 'JONEL M. JUNSAY', 'SUPPLY OFFICE', 62, 432, 0.00, NULL, 3, '2026-04-14 00:43:08', '2026-04-13 16:43:08', '2026-04-13 16:43:08'),
(32, 'JONEL M. JUNSAY', 'SUPPLY OFFICE', 78, 30, 0.00, NULL, 3, '2026-04-14 00:46:22', '2026-04-13 16:46:22', '2026-04-13 16:46:22');

-- --------------------------------------------------------

--
-- Table structure for table `stock_outs`
--

CREATE TABLE `stock_outs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `person_name` varchar(255) NOT NULL,
  `workplace` varchar(255) NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `recorded_by` bigint(20) UNSIGNED DEFAULT NULL,
  `stock_out_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_outs`
--

INSERT INTO `stock_outs` (`id`, `person_name`, `workplace`, `item_id`, `quantity`, `remarks`, `recorded_by`, `stock_out_date`, `created_at`, `updated_at`) VALUES
(2, 'jonel junsay', 'Supply Office', 2, 2, 'for office used', 4, '2026-03-06 07:32:47', '2026-03-05 23:32:47', '2026-03-05 23:32:47'),
(3, 'ROSE-ANN LAUREZO', 'HR OFFICE', 17, 1, 'FOR SCHOLARSHIP', 3, '2026-03-11 09:32:51', '2026-03-11 01:32:51', '2026-03-11 01:32:51'),
(4, 'ROSANNA QUINCO', 'CSS FACULTY', 17, 1, 'FOR CSS FACULTY', 3, '2026-03-11 09:37:17', '2026-03-11 01:37:17', '2026-03-11 01:37:17'),
(5, 'ROSE MAE RIVERA', 'HR OFFICE', 17, 1, 'FOR DTR PRINTING', 3, '2026-03-11 09:39:30', '2026-03-11 01:39:30', '2026-03-11 01:39:30'),
(6, 'SHAIRADEAN D. JUNSAY', 'ASSESSMENT OFFICE', 17, 1, 'FOR ASSESSMENT OFFICE USE', 3, '2026-03-11 09:40:21', '2026-03-11 01:40:21', '2026-03-11 01:40:21'),
(7, 'RICO D. JORNADAL', 'RESEARCH OFFICE', 17, 1, 'FOR RESEARCH OFFICE USE', 3, '2026-03-11 09:41:05', '2026-03-11 01:41:05', '2026-03-11 01:41:05'),
(8, 'RICO D. JORNADAL', 'RESEARCH OFFICE', 18, 1, 'FOR RESEARCH OFFICE USE', 3, '2026-03-11 09:41:05', '2026-03-11 01:41:05', '2026-03-11 01:41:05'),
(9, 'MA. JERALDEN NAVALUNA', 'ADMIN OFFICE', 17, 1, 'FOR ADMIN OFFICE USE', 3, '2026-03-11 09:42:10', '2026-03-11 01:42:10', '2026-03-11 01:42:10'),
(10, 'MAY TRESIA JAMON', 'CHM FACULTY', 16, 1, 'FOR EXAM', 3, '2026-03-11 09:43:14', '2026-03-11 01:43:14', '2026-03-11 01:43:14'),
(11, 'JENELYN C. GANTALAO', 'PRODUCTION OFFICE', 17, 1, 'FOR PRODUCTION OFFICE USE', 3, '2026-03-11 09:43:48', '2026-03-11 01:43:48', '2026-03-11 01:43:48'),
(12, 'MAY TRESIA JAMON', 'CHM FACULTY', 17, 1, 'for Faculty Office use', 3, '2026-03-12 00:26:29', '2026-03-11 16:26:29', '2026-03-11 16:26:29'),
(15, 'GEORGE P. GUMAWA JR.', 'CAF FACULTY', 17, 2, 'for CAF Faculty Office use', 2, '2026-03-12 05:20:26', '2026-03-11 21:20:26', '2026-03-11 21:20:26'),
(16, 'JENELYN C. GANTALAO', 'PRODUCTION OFFICE', 16, 1, 'FOR PRODUCTION OFFICE USE', 3, '2026-03-16 00:55:09', '2026-03-15 16:55:09', '2026-03-15 16:55:09'),
(17, 'JENELYN C. GANTALAO', 'PRODUCTION OFFICE', 16, 1, 'FOR PRODUCTION OFFICE USE', 3, '2026-03-16 00:55:55', '2026-03-15 16:55:55', '2026-03-15 16:55:55'),
(18, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 53, 1, 'for ossa office use', 3, '2026-03-18 00:57:25', '2026-03-17 16:57:25', '2026-03-17 16:57:25'),
(19, 'NIEL KEVIN C. MAGNO', 'SUPPLY OFFICE', 17, 1, 'supply office use', 3, '2026-03-18 01:03:12', '2026-03-17 17:03:12', '2026-03-17 17:03:12'),
(20, 'SHAIRADENE M. JUNSAY', 'ASSESSMENT OFFICE', 31, 2, 'FOR ASSESSMENT USED', 3, '2026-03-18 03:09:30', '2026-03-17 19:09:30', '2026-03-17 19:09:30'),
(21, 'CHRISTIAN M. SABANDO', 'CLINIC', 35, 2, 'for teaching use', 3, '2026-03-18 06:55:54', '2026-03-17 22:55:54', '2026-03-17 22:55:54'),
(22, 'ROGEN O. NONATO', 'CHM DEPARMENT', 66, 1, 'FOR CLEANING', 3, '2026-03-18 07:08:56', '2026-03-17 23:08:56', '2026-03-17 23:08:56'),
(23, 'MAY TRESIA JAMON', 'CHM FACULTY', 68, 1, 'for Faculty Office Use', 3, '2026-03-18 09:01:36', '2026-03-18 01:01:36', '2026-03-18 01:01:36'),
(24, 'RIA SULON', 'ADMISSION OFFICE', 34, 5, 'for  Guidance office use', 3, '2026-03-19 01:52:42', '2026-03-18 17:52:42', '2026-03-18 17:52:42'),
(25, 'RIA SULON', 'ADMISSION OFFICE', 50, 2, 'for  Guidance office use', 3, '2026-03-19 01:52:42', '2026-03-18 17:52:42', '2026-03-18 17:52:42'),
(26, 'GEORGE P. GUMAWA JR.', 'CAF FACULTY', 17, 2, 'PRINTING USE.', 3, '2026-03-19 02:40:39', '2026-03-18 18:40:39', '2026-03-18 18:40:39'),
(27, 'GEORGE P. GUMAWA JR.', 'CAF FACULTY', 68, 1, 'CLEANING', 3, '2026-03-19 02:51:16', '2026-03-18 18:51:16', '2026-03-18 18:51:16'),
(28, 'RIA SULON', 'ADMISSION OFFICE', 17, 2, 'fOR ADMISSION PURPOSES', 3, '2026-03-19 05:49:13', '2026-03-18 21:49:13', '2026-03-18 21:49:13'),
(29, 'JERICO A. PONTINO', 'MAINTENANCE OFFICE', 67, 1, 'FOR CLEANING PURPOSES', 3, '2026-03-19 06:10:22', '2026-03-18 22:10:22', '2026-03-18 22:10:22'),
(30, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 52, 3, 'for OSSA Office use', 3, '2026-03-23 07:02:52', '2026-03-22 23:02:52', '2026-03-22 23:02:52'),
(31, 'PETER GERALD L. JUNSAY', 'CAF FACULTY', 58, 2, 'for CAF Faculty Use', 3, '2026-03-24 01:08:47', '2026-03-23 17:08:47', '2026-03-23 17:08:47'),
(32, 'JERICO A. PONTINO', 'MAINTENANCE OFFICE', 69, 1, 'FOR CLEANING', 3, '2026-03-24 02:51:34', '2026-03-23 18:51:34', '2026-03-23 18:51:34'),
(33, 'JERICO A. PONTINO', 'MAINTENANCE OFFICE', 69, 1, 'FOR CLEANING PURPOSES', 3, '2026-03-24 03:11:03', '2026-03-23 19:11:03', '2026-03-23 19:11:03'),
(34, 'JONAS D. SINGSON', 'REGISTRAR\'S OFFICE', 42, 1, 'FOR REGISTRAR USE.', 3, '2026-03-24 03:22:05', '2026-03-23 19:22:05', '2026-03-23 19:22:05'),
(35, 'JONAS D. SINGSON', 'REGISTRAR\'S OFFICE', 34, 1, 'FOR REGISTRAR USE.', 3, '2026-03-24 03:24:16', '2026-03-23 19:24:16', '2026-03-23 19:24:16'),
(36, 'JO HANNAH S. TORREMOCHA', 'CLINIC', 40, 1, 'for clinic purposes.', 3, '2026-03-25 00:40:35', '2026-03-24 16:40:35', '2026-03-24 16:40:35'),
(37, 'MAY TRESIA JAMON', 'FACULTY', 67, 1, 'for cleaning of faculty office', 3, '2026-03-25 00:59:10', '2026-03-24 16:59:10', '2026-03-24 16:59:10'),
(38, 'MAY TRESIA JAMON', 'FACULTY', 48, 2, 'for faculty purposes', 3, '2026-03-25 00:59:52', '2026-03-24 16:59:52', '2026-03-24 16:59:52'),
(39, 'MAY TRESIA JAMON', 'FACULTY', 46, 2, 'for faculty purposes', 3, '2026-03-25 01:00:18', '2026-03-24 17:00:18', '2026-03-24 17:00:18'),
(40, 'RYAN  B. GARCIA', 'MIS', 22, 1, 'for MIS office use', 3, '2026-03-25 01:06:03', '2026-03-24 17:06:03', '2026-03-24 17:06:03'),
(41, 'RYAN  B. GARCIA', 'MIS', 23, 1, 'for MIS office use', 3, '2026-03-25 01:06:03', '2026-03-24 17:06:03', '2026-03-24 17:06:03'),
(42, 'RYAN  B. GARCIA', 'MIS', 26, 1, 'for MIS office use', 3, '2026-03-25 01:06:03', '2026-03-24 17:06:03', '2026-03-24 17:06:03'),
(43, 'RYAN  B. GARCIA', 'MIS', 32, 1, 'for MIS office use', 3, '2026-03-25 01:06:04', '2026-03-24 17:06:04', '2026-03-24 17:06:04'),
(44, 'PETER GERALD L. JUNSAY', 'CAF FACULTY', 31, 4, 'for CAF FACULTY USE', 3, '2026-03-25 01:28:47', '2026-03-24 17:28:47', '2026-03-24 17:28:47'),
(45, 'PETER GERALD L. JUNSAY', 'CAF FACULTY', 70, 4, 'FOR FACULTY USE', 3, '2026-03-25 01:30:28', '2026-03-24 17:30:28', '2026-03-24 17:30:28'),
(46, 'JONAS D. SINGSON', 'REGISTRAR\'S OFFICE', 33, 3, 'for registrar use.', 3, '2026-03-25 04:53:44', '2026-03-24 20:53:44', '2026-03-24 20:53:44'),
(47, 'RICO D. JORNADAL', 'RESEARCH OFFICE', 17, 1, 'FOR RESEARCH USE', 3, '2026-03-25 05:39:47', '2026-03-24 21:39:47', '2026-03-24 21:39:47'),
(48, 'MARY JANICE L. MANDIA', 'LIBRARY', 17, 1, 'FOR LIBRARY USE.', 3, '2026-03-25 06:15:28', '2026-03-24 22:15:28', '2026-03-24 22:15:28'),
(49, 'JOALYN DE ASIS', 'CAF FACULTY', 31, 2, 'FOR CAF FACULTY USE', 3, '2026-03-25 06:54:00', '2026-03-24 22:54:00', '2026-03-24 22:54:00'),
(50, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 10, 1, 'FOR OSSA USE.', 3, '2026-03-25 08:40:51', '2026-03-25 00:40:51', '2026-03-25 00:40:51'),
(51, 'JOHN MARK PARREÑO', 'CAF FACULTY', 63, 1, 'FOR CAF FACULTY USE', 3, '2026-03-26 00:04:22', '2026-03-25 16:04:22', '2026-03-25 16:04:22'),
(52, 'NIEL KEVIN C. MAGNO', 'SUPPLY OFFICE', 3, 1, 'FOR SUPPLY OFFICE USE.', 3, '2026-03-26 00:07:08', '2026-03-25 16:07:08', '2026-03-25 16:07:08'),
(53, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 30, 1, 'FOR OSSA OFFICE USE.', 3, '2026-03-26 00:55:08', '2026-03-25 16:55:08', '2026-03-25 16:55:08'),
(54, 'JO HANNAH S. TORREMOCHA', 'CLINIC', 58, 1, 'FOR CLINIC USE', 3, '2026-03-26 07:36:08', '2026-03-25 23:36:08', '2026-03-25 23:36:08'),
(55, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 17, 2, 'for graduation', 3, '2026-03-30 00:48:19', '2026-03-29 16:48:19', '2026-03-29 16:48:19'),
(56, 'JAIRUS D. ZAPANTA', 'MAINTENANCE OFFICE', 57, 1, 'FOR MAINTENACE OFFICE USE.', 3, '2026-03-30 06:41:10', '2026-03-29 22:41:10', '2026-03-29 22:41:10'),
(57, 'ROGEN O. NONATO', 'CHM DEPARMENT', 67, 1, 'for chm department use', 3, '2026-03-30 07:21:31', '2026-03-29 23:21:31', '2026-03-29 23:21:31'),
(58, 'ROGEN O. NONATO', 'CHM DEPARMENT', 59, 1, 'for CHM DEPARTMENT USE', 3, '2026-03-31 02:08:08', '2026-03-30 18:08:08', '2026-03-30 18:08:08'),
(59, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 12, 1, 'FOR OSSA OFFICE USE', 3, '2026-03-31 02:09:12', '2026-03-30 18:09:12', '2026-03-30 18:09:12'),
(60, 'JERICO A. PONTINO', 'MAINTENANCE OFFICE', 69, 2, 'for maintenance office', 3, '2026-03-31 02:25:01', '2026-03-30 18:25:01', '2026-03-30 18:25:01'),
(61, 'JOSEPH CRIS D. JAO', 'GUIDANCE OFFICE', 55, 5, 'for guidance office use', 3, '2026-03-31 06:32:48', '2026-03-30 22:32:48', '2026-03-30 22:32:48'),
(62, 'ROSE ANN E. LAUREZO', 'HR OFFICE', 17, 1, 'for DTR', 3, '2026-04-06 00:34:15', '2026-04-05 16:34:15', '2026-04-05 16:34:15'),
(63, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 34, 20, 'for ossa  office use', 3, '2026-04-07 06:40:33', '2026-04-06 22:40:33', '2026-04-06 22:40:33'),
(64, 'AILYN MISSION', 'COTED FACULTY', 34, 3, 'for coted faculty use', 3, '2026-04-07 06:41:35', '2026-04-06 22:41:35', '2026-04-06 22:41:35'),
(65, 'AILYN MISSION', 'COTED FACULTY', 55, 3, 'for coted faculty use', 3, '2026-04-07 06:41:35', '2026-04-06 22:41:35', '2026-04-06 22:41:35'),
(66, 'AILYN MISSION', 'COTED FACULTY', 52, 1, 'for coted faculty use', 3, '2026-04-07 06:41:35', '2026-04-06 22:41:35', '2026-04-06 22:41:35'),
(67, 'CHRISTAIN M. PLAZA', 'COTED FACULTY', 16, 1, 'for coted faculty use', 3, '2026-04-07 06:42:54', '2026-04-06 22:42:54', '2026-04-06 22:42:54'),
(68, 'CHRISTAIN M. PLAZA', 'COTED FACULTY', 17, 1, 'for coted faculty use', 3, '2026-04-07 06:42:54', '2026-04-06 22:42:54', '2026-04-06 22:42:54'),
(69, 'CHRISTAIN M. PLAZA', 'COTED FACULTY', 26, 1, 'for coted faculty use', 3, '2026-04-07 06:42:54', '2026-04-06 22:42:54', '2026-04-06 22:42:54'),
(70, 'RICO D. JORNADAL', 'RESEARCH OFFICE', 16, 1, 'for research office use', 3, '2026-04-07 06:43:20', '2026-04-06 22:43:20', '2026-04-06 22:43:20'),
(71, 'SHAIRADENE M. JUNSAY', 'ASSESSMENT OFFICE', 17, 1, 'for assessment use', 3, '2026-04-07 07:42:23', '2026-04-06 23:42:23', '2026-04-06 23:42:23'),
(72, 'JENELYN C. GANTALAO', 'PRODUCTION OFFICE', 24, 1, 'for production office use', 3, '2026-04-07 07:46:12', '2026-04-06 23:46:12', '2026-04-06 23:46:12'),
(73, 'RICO D. JORNADAL', 'RESEARCH OFFICE', 42, 10, 'FOR RESEARCH OFFICE USE', 3, '2026-04-08 07:03:23', '2026-04-07 23:03:23', '2026-04-07 23:03:23'),
(74, 'RYAN  B. GARCIA', 'MIS', 23, 1, 'FOR MIS USE', 3, '2026-04-08 07:05:03', '2026-04-07 23:05:03', '2026-04-07 23:05:03'),
(75, 'RYAN  B. GARCIA', 'MIS', 22, 1, 'FOR MIS USE', 3, '2026-04-08 07:05:04', '2026-04-07 23:05:04', '2026-04-07 23:05:04'),
(76, 'RYAN  B. GARCIA', 'MIS', 26, 1, 'FOR MIS USE', 3, '2026-04-08 07:05:04', '2026-04-07 23:05:04', '2026-04-07 23:05:04'),
(77, 'RYAN  B. GARCIA', 'MIS', 32, 1, 'FOR MIS USE', 3, '2026-04-08 07:05:04', '2026-04-07 23:05:04', '2026-04-07 23:05:04'),
(78, 'MA. JERALDEN NAVALUNA', 'ADMIN OFFICE', 3, 1, 'FOR ADMIN OFFICE USE.', 3, '2026-04-13 00:32:15', '2026-04-12 16:32:15', '2026-04-12 16:32:15'),
(79, 'JERRY JARDELIZA JR.', 'CCS FACULTY', 34, 10, 'FOR CSS FACULTY USE.', 3, '2026-04-13 00:32:58', '2026-04-12 16:32:58', '2026-04-12 16:32:58'),
(80, 'ERWIN C. OYEMAN', 'MIS OFFICE', 17, 1, 'For MIS office use', 3, '2026-04-13 00:36:16', '2026-04-12 16:36:16', '2026-04-12 16:36:16'),
(81, 'RICO D. JORNADAL', 'RESEARCH OFFICE', 17, 1, 'for research office purposes', 3, '2026-04-13 00:41:36', '2026-04-12 16:41:36', '2026-04-12 16:41:36'),
(82, 'RICO D. JORNADAL', 'RESEARCH OFFICE', 16, 1, 'for research office purposes', 3, '2026-04-13 00:41:36', '2026-04-12 16:41:36', '2026-04-12 16:41:36'),
(83, 'RICO D. JORNADAL', 'RESEARCH OFFICE', 15, 5, 'for research office purposes', 3, '2026-04-13 00:41:36', '2026-04-12 16:41:36', '2026-04-12 16:41:36'),
(84, 'JAYSON MACOLADO', 'CCS FACULTY', 29, 1, 'FOR CCS FACULTY USE', 3, '2026-04-13 00:51:09', '2026-04-12 16:51:09', '2026-04-12 16:51:09'),
(85, 'AN MAE D. ERVITE', 'CASHIER\'S OFFICE', 60, 1, 'FOR SSG OFFICE USE', 3, '2026-04-13 01:17:16', '2026-04-12 17:17:16', '2026-04-12 17:17:16'),
(86, 'CHRISTAIN M. PLAZA', 'COTED FACULTY', 73, 12, 'FOR SSG OFFICE USE', 3, '2026-04-13 02:37:59', '2026-04-12 18:37:59', '2026-04-12 18:37:59'),
(87, 'CHRISTAIN M. PLAZA', 'COTED FACULTY', 16, 1, 'FOR SSG USE.', 3, '2026-04-13 02:39:30', '2026-04-12 18:39:30', '2026-04-12 18:39:30'),
(88, 'CHRISTAIN M. PLAZA', 'COTED FACULTY', 17, 1, 'FOR SSG USE.', 3, '2026-04-13 02:39:30', '2026-04-12 18:39:30', '2026-04-12 18:39:30'),
(89, 'JOL T. GUMAWA', 'OSSA OFFICE', 43, 3, 'OSSA USE.', 3, '2026-04-13 02:41:09', '2026-04-12 18:41:09', '2026-04-12 18:41:09'),
(90, 'JOL T. GUMAWA', 'OSSA OFFICE', 58, 1, 'OSSA USE.', 3, '2026-04-13 02:41:09', '2026-04-12 18:41:09', '2026-04-12 18:41:09'),
(91, 'AN MAE D. ERVITE', 'CASHIER\'S OFFICE', 60, 1, 'for SSG office use', 3, '2026-04-13 05:04:10', '2026-04-12 21:04:10', '2026-04-12 21:04:10'),
(92, 'CLAIRE C. NULLAS', 'CCS FACULTY', 17, 2, 'for CCS department use', 3, '2026-04-13 05:32:11', '2026-04-12 21:32:11', '2026-04-12 21:32:11'),
(93, 'CLAIRE C. NULLAS', 'CCS FACULTY', 8, 1, 'for CCS department use', 3, '2026-04-13 05:32:11', '2026-04-12 21:32:11', '2026-04-12 21:32:11'),
(94, 'JONAS D. SINGSON', 'REGISTRAR\'S OFFICE', 44, 3, 'for Registrar\'s office use', 3, '2026-04-13 06:16:38', '2026-04-12 22:16:38', '2026-04-12 22:16:38'),
(95, 'CLAIRE C. NULLAS', 'CCS FACULTY', 42, 10, 'For CHED Monitoring', 3, '2026-04-13 06:25:10', '2026-04-12 22:25:10', '2026-04-12 22:25:10'),
(96, 'JONAS D. SINGSON', 'REGISTRAR\'S OFFICE', 73, 2, 'FOR REGISTRAR OFFICE USE', 3, '2026-04-14 00:17:10', '2026-04-13 16:17:10', '2026-04-13 16:17:10'),
(97, 'APRIL JOY G. DOMINGUEZ', 'REGISTRAR\'S OFFICE', 10, 2, 'FOR REGISTRAR OFFICE USE', 3, '2026-04-14 00:44:31', '2026-04-13 16:44:31', '2026-04-13 16:44:31'),
(98, 'RIA SULON', 'ADMISSION OFFICE', 17, 1, 'FOR ADMISSION PURPOSE', 3, '2026-04-14 01:17:34', '2026-04-13 17:17:34', '2026-04-13 17:17:34'),
(99, 'RIA SULON', 'ADMISSION OFFICE', 16, 1, 'FOR ADMISSION PURPOSE', 3, '2026-04-14 01:17:34', '2026-04-13 17:17:34', '2026-04-13 17:17:34'),
(100, 'RIA SULON', 'ADMISSION OFFICE', 34, 5, 'FOR ADMISSION PURPOSE', 3, '2026-04-14 01:17:34', '2026-04-13 17:17:34', '2026-04-13 17:17:34'),
(101, 'RIA SULON', 'ADMISSION OFFICE', 10, 2, 'FOR ADMISSION PURPOSE', 3, '2026-04-14 01:17:34', '2026-04-13 17:17:34', '2026-04-13 17:17:34'),
(102, 'RIA SULON', 'ADMISSION OFFICE', 12, 1, 'FOR ADMISSION PURPOSE', 3, '2026-04-14 01:17:35', '2026-04-13 17:17:35', '2026-04-13 17:17:35'),
(103, 'RONELO V. GASATAYA JR.', 'RESEARCH OFFICE', 61, 1, 'FOR RESEARCH OFFICE USE', 3, '2026-04-14 02:08:20', '2026-04-13 18:08:20', '2026-04-13 18:08:20'),
(104, 'JENELYN C. GANTALAO', 'PRODUCTION OFFICE', 63, 10, 'FOR PRODUCTION OFFICE USE', 3, '2026-04-14 06:01:23', '2026-04-13 22:01:23', '2026-04-13 22:01:23'),
(105, 'JENELYN C. GANTALAO', 'PRODUCTION OFFICE', 17, 1, 'FOR PRODUCTION OFFICE USE', 3, '2026-04-14 06:01:24', '2026-04-13 22:01:24', '2026-04-13 22:01:24'),
(106, 'JERICO A. PONTINO', 'MAINTENANCE OFFICE', 67, 1, 'FOR CLEANING PURPOSES', 3, '2026-04-14 06:10:35', '2026-04-13 22:10:35', '2026-04-13 22:10:35'),
(107, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 39, 20, 'FOR GRADUATION PURPOSES', 3, '2026-04-14 06:38:01', '2026-04-13 22:38:01', '2026-04-13 22:38:01'),
(108, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 22, 1, 'FOR GRADUATION PURPOSES', 3, '2026-04-14 06:42:06', '2026-04-13 22:42:06', '2026-04-13 22:42:06'),
(109, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 23, 1, 'FOR GRADUATION PURPOSES', 3, '2026-04-14 06:42:06', '2026-04-13 22:42:06', '2026-04-13 22:42:06'),
(110, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 26, 1, 'FOR GRADUATION PURPOSES', 3, '2026-04-14 06:42:06', '2026-04-13 22:42:06', '2026-04-13 22:42:06'),
(111, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 32, 1, 'FOR GRADUATION PURPOSES', 3, '2026-04-14 06:42:06', '2026-04-13 22:42:06', '2026-04-13 22:42:06'),
(112, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 16, 5, 'FOR GRADUATION PURPOSES', 3, '2026-04-14 06:42:06', '2026-04-13 22:42:06', '2026-04-13 22:42:06'),
(113, 'MA. JERALDEN NAVALUNA', 'ADMIN OFFICE', 40, 1, 'FOR ADMIN OFFICE USE', 3, '2026-04-15 02:16:41', '2026-04-14 18:16:41', '2026-04-14 18:16:41'),
(114, 'MAY TRESIA JAMON', 'FACULTY', 17, 1, 'For Faculty Office Use', 3, '2026-04-15 09:33:15', '2026-04-15 01:33:15', '2026-04-15 01:33:15'),
(115, 'APRIL JOY G. DOMINGUEZ', 'REGISTRAR\'S OFFICE', 33, 2, 'For Registrar\'s Office Use', 3, '2026-04-15 10:03:44', '2026-04-15 02:03:44', '2026-04-15 02:03:44'),
(116, 'LEOMAR ROGER CAGADAS', 'CHM FACULTY', 76, 20, 'For BSHM Week Program Use', 3, '2026-04-16 03:41:02', '2026-04-15 19:41:02', '2026-04-15 19:41:02'),
(117, 'MAY TRESIA JAMON', 'CHM FACULTY', 34, 1, 'FOR CHM FACULTY USE.', 3, '2026-04-16 08:09:10', '2026-04-16 00:09:10', '2026-04-16 00:09:10'),
(118, 'EMMANUEL M. SALAZA', 'CHM FACULTY', 16, 1, 'FOR BSHM OJT USE', 3, '2026-04-16 08:24:39', '2026-04-16 00:24:39', '2026-04-16 00:24:39'),
(119, 'AN MAE D. ERVITE', 'SSG', 17, 1, 'For SSG Office Use', 3, '2026-04-16 08:40:08', '2026-04-16 00:40:08', '2026-04-16 00:40:08'),
(120, 'MA. JERALDEN NAVALUNA', 'ADMIN OFFICE', 71, 1, 'FOR ADMIN OFFICE USE', 3, '2026-04-20 00:56:30', '2026-04-19 16:56:30', '2026-04-19 16:56:30'),
(121, 'ZHEA LIBERIE F. SALEM', 'REGISTRAR\'S OFFICE', 19, 1, 'FOR REGISTRAR\'S OFFICE USE', 3, '2026-04-20 01:45:56', '2026-04-19 17:45:56', '2026-04-19 17:45:56'),
(122, 'ZHEA LIBERIE F. SALEM', 'REGISTRAR\'S OFFICE', 28, 1, 'FOR REGISTRAR\'S OFFICE USE', 3, '2026-04-20 01:45:56', '2026-04-19 17:45:56', '2026-04-19 17:45:56'),
(123, 'ZHEA LIBERIE F. SALEM', 'REGISTRAR\'S OFFICE', 20, 1, 'FOR REGISTRAR\'S OFFICE USE', 3, '2026-04-20 01:45:56', '2026-04-19 17:45:56', '2026-04-19 17:45:56'),
(124, 'ZHEA LIBERIE F. SALEM', 'REGISTRAR\'S OFFICE', 21, 1, 'FOR REGISTRAR\'S OFFICE USE', 3, '2026-04-20 01:45:56', '2026-04-19 17:45:56', '2026-04-19 17:45:56'),
(125, 'LEOMAR ROGER CAGADAS', 'CHM FACULTY', 70, 12, 'FOR CHM EVENT USE.', 3, '2026-04-20 05:16:00', '2026-04-19 21:16:00', '2026-04-19 21:16:00'),
(126, 'RIA SULON', 'ADMISSION OFFICE', 23, 1, 'FOR ADMISSION OFFICE USE', 3, '2026-04-20 05:24:18', '2026-04-19 21:24:18', '2026-04-19 21:24:18'),
(127, 'RIA SULON', 'ADMISSION OFFICE', 22, 1, 'FOR ADMISSION OFFICE USE', 3, '2026-04-20 05:24:18', '2026-04-19 21:24:18', '2026-04-19 21:24:18'),
(128, 'ROSANNA QUINCO', 'CSS FACULTY', 17, 4, 'FOR FACULTY USE', 3, '2026-04-20 06:45:14', '2026-04-19 22:45:14', '2026-04-19 22:45:14'),
(129, 'ROSANNA QUINCO', 'CSS FACULTY', 19, 1, 'FOR FACULTY USE', 3, '2026-04-20 06:45:14', '2026-04-19 22:45:14', '2026-04-19 22:45:14'),
(130, 'REDGIE MABILOG', 'FACULTY', 17, 1, 'FOR FACULTY USE.', 3, '2026-04-21 05:47:59', '2026-04-20 21:47:59', '2026-04-20 21:47:59'),
(131, 'JERRY JARDELIZA JR.', 'CCS FACULTY', 17, 1, 'FOR CSS FACULTY USE', 3, '2026-04-21 06:08:50', '2026-04-20 22:08:50', '2026-04-20 22:08:50'),
(132, 'CLAIRE C. NULLAS', 'CCS FACULTY', 16, 1, 'For CCS Faculty Use', 3, '2026-04-21 08:04:08', '2026-04-21 00:04:08', '2026-04-21 00:04:08'),
(133, 'ROGEN O. NONATO', 'CHM DEPARMENT', 12, 1, 'For BSHM Week Use', 3, '2026-04-21 09:05:13', '2026-04-21 01:05:13', '2026-04-21 01:05:13'),
(134, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 16, 5, 'For Graduation 2026', 3, '2026-04-21 09:06:25', '2026-04-21 01:06:25', '2026-04-21 01:06:25'),
(135, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 22, 1, 'For Graduation 2026', 3, '2026-04-21 09:06:25', '2026-04-21 01:06:25', '2026-04-21 01:06:25'),
(136, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 26, 1, 'For Graduation 2026', 3, '2026-04-21 09:06:25', '2026-04-21 01:06:25', '2026-04-21 01:06:25'),
(137, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 23, 1, 'For Graduation 2026', 3, '2026-04-21 09:06:25', '2026-04-21 01:06:25', '2026-04-21 01:06:25'),
(138, 'RAYMON L. BADAYOS', 'OSSA OFFICE', 32, 1, 'For Graduation 2026', 3, '2026-04-21 09:06:25', '2026-04-21 01:06:25', '2026-04-21 01:06:25'),
(139, 'NONILO B. AUJERO JR.', 'CCS FACULTY', 17, 1, 'FOR EXAM', 3, '2026-04-22 00:18:47', '2026-04-21 16:18:47', '2026-04-21 16:18:47'),
(140, 'MAY TRESIA JAMON', 'CHM FACULTY', 17, 2, 'FOR FINAL EXAM S.Y. 2025-2026', 3, '2026-04-22 03:33:36', '2026-04-21 19:33:36', '2026-04-21 19:33:36'),
(141, 'AILYN MISSION', 'COTED FACULTY', 17, 2, 'FOR FINAL EXAM S.Y. 2025-2026', 3, '2026-04-22 03:34:19', '2026-04-21 19:34:19', '2026-04-21 19:34:19'),
(142, 'AILYN MISSION', 'COTED FACULTY', 17, 2, 'FOR FINAL EXAM S.Y. 2025-2026', 3, '2026-04-22 03:34:42', '2026-04-21 19:34:42', '2026-04-21 19:34:42'),
(143, 'CHRISTAIN M. PLAZA', 'COTED FACULTY', 17, 2, 'FOR FINAL EXAM S.Y. 2025-2026', 3, '2026-04-22 03:35:32', '2026-04-21 19:35:32', '2026-04-21 19:35:32'),
(144, 'MA. MAE KENDRA CANALES', 'COTED FACULTY', 17, 2, 'FOR FINAL EXAM S.Y. 2025-2026', 3, '2026-04-22 03:35:54', '2026-04-21 19:35:54', '2026-04-21 19:35:54'),
(145, 'JONEL M. JUNSAY', 'SUPPLY OFFICE', 17, 1, 'FOR SUPPLY OFFICE USE', 3, '2026-04-22 04:22:34', '2026-04-21 20:22:34', '2026-04-21 20:22:34'),
(146, 'AN MAE D. ERVITE', 'CASHIER\'S OFFICE', 80, 1, 'For Cashier\'s Office Use', 3, '2026-04-22 08:29:18', '2026-04-22 00:29:18', '2026-04-22 00:29:18'),
(147, 'RUEL JOHN CLAMIANO', 'COTED FACULTY', 16, 2, 'For Final Exam S.Y. 2025-2026', 3, '2026-04-23 02:21:34', '2026-04-22 18:21:34', '2026-04-22 18:21:34'),
(148, 'LEOMAR ROGER CAGADAS', 'CHM FACULTY', 17, 2, 'For Final Exam S.Y. 2025-2026', 3, '2026-04-23 02:22:18', '2026-04-22 18:22:18', '2026-04-22 18:22:18'),
(149, 'EUGEMY GRULLO', 'COTED FACULTY', 17, 2, 'For Final Exam S.Y. 2025-2026', 3, '2026-04-23 02:23:24', '2026-04-22 18:23:24', '2026-04-22 18:23:24'),
(150, 'MA. JERALDEN NAVALUNA', 'ADMIN OFFICE', 17, 1, 'For Final Exam S.Y. 2025-2026', 3, '2026-04-23 02:27:38', '2026-04-22 18:27:38', '2026-04-22 18:27:38'),
(151, 'MA. JERALDEN NAVALUNA', 'ADMIN OFFICE', 52, 1, 'For Final Exam S.Y. 2025-2026', 3, '2026-04-23 02:27:38', '2026-04-22 18:27:38', '2026-04-22 18:27:38'),
(152, 'MA. JERALDEN NAVALUNA', 'ADMIN OFFICE', 48, 3, 'For Final Exam S.Y. 2025-2026', 3, '2026-04-23 02:27:38', '2026-04-22 18:27:38', '2026-04-22 18:27:38'),
(153, 'MA. JERALDEN NAVALUNA', 'ADMIN OFFICE', 2, 3, 'For Final Exam S.Y. 2025-2026', 3, '2026-04-23 02:27:38', '2026-04-22 18:27:38', '2026-04-22 18:27:38'),
(154, 'MAY TRESIA JAMON', 'CHM FACULTY', 52, 1, 'For Final Exam S.Y. 2025-2026', 3, '2026-04-23 02:28:58', '2026-04-22 18:28:58', '2026-04-22 18:28:58'),
(155, 'MAY TRESIA JAMON', 'CHM FACULTY', 19, 1, 'For Final Exam S.Y. 2025-2026', 3, '2026-04-23 02:28:59', '2026-04-22 18:28:59', '2026-04-22 18:28:59'),
(156, 'MELDY S. LUBRICO', 'COTED FACULTY', 17, 2, 'For Final Exam S.Y. 2025-2026', 3, '2026-04-23 02:29:52', '2026-04-22 18:29:52', '2026-04-22 18:29:52'),
(157, 'MELDY S. LUBRICO', 'COTED FACULTY', 12, 1, 'For Final Exam S.Y. 2025-2026', 3, '2026-04-23 02:29:52', '2026-04-22 18:29:52', '2026-04-22 18:29:52'),
(158, 'RICO D. JORNADAL', 'RESEARCH OFFICE', 59, 1, 'FOR RESEARCH OFFICE USE', 3, '2026-04-23 02:30:34', '2026-04-22 18:30:34', '2026-04-22 18:30:34'),
(159, 'EMMANUEL M. SALAZA', 'CHM FACULTY', 17, 2, 'For Final Exam S.Y. 2025-2026', 3, '2026-04-23 02:31:00', '2026-04-22 18:31:00', '2026-04-22 18:31:00'),
(160, 'JONAS D. SINGSON', 'REGISTRAR\'S OFFICE', 17, 1, 'For Final Exam S.Y. 2025-2026', 3, '2026-04-23 02:31:19', '2026-04-22 18:31:19', '2026-04-22 18:31:19'),
(161, 'WILROSE SANDRINO', 'CCS FACULTY', 17, 2, 'For Final Exam S.Y. 2025-2026', 3, '2026-04-23 02:33:03', '2026-04-22 18:33:03', '2026-04-22 18:33:03'),
(162, 'WILROSE SANDRINO', 'CCS FACULTY', 19, 1, 'For Final Exam S.Y. 2025-2026', 3, '2026-04-23 02:33:03', '2026-04-22 18:33:03', '2026-04-22 18:33:03'),
(163, 'NELSON LIBREL JR.', 'CCS FACULTY', 17, 1, 'For Final Exam S.Y. 2025-2026', 3, '2026-04-23 02:33:28', '2026-04-22 18:33:28', '2026-04-22 18:33:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'staff',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `profile_picture`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'john colin d. generillo', 'johncolingenerillo101@gmail.com', NULL, NULL, '$2y$12$Y7w7/tTTSr.8rFQzKIMRVOU7EGEtelixkM3X/zUvx9aJdyc5YxUsW', 'admin', NULL, '2026-03-03 00:41:48', '2026-03-03 00:41:48'),
(3, 'niel kevin magno', 'nkmagno@cpsu.edu.ph', NULL, NULL, '$2y$12$o09WhNZNm4t3oe7JlhHr1OEdw.kI.HGyAbp2wZBMhMiblKCxowHfO', 'admin', NULL, '2026-03-03 00:57:17', '2026-03-10 23:23:19'),
(4, 'jonel junsay', 'jonel.junsay@cpsu.edu.ph', NULL, NULL, '$2y$12$lUwLuA0jZdXrlEWwbtgC1.UH3Kft08xpurvTVyA.1c4xjMo4.2EVu', 'admin', NULL, '2026-03-05 23:18:25', '2026-03-05 23:18:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `confirmation_codes`
--
ALTER TABLE `confirmation_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `confirmation_codes_role_unique` (`role`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `items_stock_number_unique` (`stock_number`),
  ADD KEY `items_added_by_foreign` (`added_by`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `stock_ins`
--
ALTER TABLE `stock_ins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_ins_item_id_foreign` (`item_id`),
  ADD KEY `stock_ins_recorded_by_foreign` (`recorded_by`);

--
-- Indexes for table `stock_outs`
--
ALTER TABLE `stock_outs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_outs_item_id_foreign` (`item_id`),
  ADD KEY `stock_outs_recorded_by_foreign` (`recorded_by`);

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
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `confirmation_codes`
--
ALTER TABLE `confirmation_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `stock_ins`
--
ALTER TABLE `stock_ins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `stock_outs`
--
ALTER TABLE `stock_outs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `stock_ins`
--
ALTER TABLE `stock_ins`
  ADD CONSTRAINT `stock_ins_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_ins_recorded_by_foreign` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `stock_outs`
--
ALTER TABLE `stock_outs`
  ADD CONSTRAINT `stock_outs_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_outs_recorded_by_foreign` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

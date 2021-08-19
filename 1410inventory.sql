-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2021 at 11:54 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `1410inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(3) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile1` varchar(15) NOT NULL,
  `mobile2` varchar(15) NOT NULL,
  `password` char(60) NOT NULL,
  `role` char(5) NOT NULL,
  `created_on` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `last_seen` datetime NOT NULL,
  `last_edited` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `account_status` char(1) NOT NULL DEFAULT '1',
  `deleted` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `first_name`, `last_name`, `email`, `mobile1`, `mobile2`, `password`, `role`, `created_on`, `last_login`, `last_seen`, `last_edited`, `account_status`, `deleted`) VALUES
(2, 'Kalisa', 'Claude', 'kalisa.claude@gmail.com', '250788693689', '250733286321', '$2y$10$Xzd1nS9TL3xgLWU0FC75NeICUqeiKxkPOM0zNNFhg0xCJxdXVhvja', 'Basic', '2021-04-02 11:52:54', '2021-04-02 12:54:32', '2021-04-02 13:03:17', '2021-04-02 11:03:17', '1', '0'),
(3, 'Jean damour', 'Niringiyimana', 'jdam600@gmail.com', '+250788255264', '', '$2y$10$2Iec1CQkV0XeTkb7lZM8h.DpbuJ/YVn5OZUflZuu8MiS2eckxzn66', 'Super', '2021-04-02 12:52:38', '2021-06-18 20:23:46', '2021-06-18 10:04:19', '2021-06-18 18:23:46', '1', '0'),
(4, 'Chris', 'Ishimwe', 'chris@gmail.com', '+250788345538', '', '$2y$10$8skeKLVgk/Zln3p.DHeLI.5kwC1XbvE4HrSqC.gvqEivjAeUlU2tu', 'Super', '2021-06-18 20:25:34', '2021-08-12 07:27:15', '2021-08-12 07:32:23', '2021-08-12 05:32:23', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `damages`
--

CREATE TABLE `damages` (
  `id` int(11) NOT NULL,
  `item_code` varchar(255) NOT NULL,
  `qty_damaged` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `damages`
--

INSERT INTO `damages` (`id`, `item_code`, `qty_damaged`, `date`) VALUES
(5, '86', 9, '0000-00-00 00:00:00'),
(6, '81', 50, '0000-00-00 00:00:00'),
(7, '43', 11, '2021-08-12 05:29:03');

-- --------------------------------------------------------

--
-- Table structure for table `eventlog`
--

CREATE TABLE `eventlog` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event` varchar(200) NOT NULL,
  `eventRowIdOrRef` varchar(20) DEFAULT NULL,
  `eventDesc` text,
  `eventTable` varchar(20) DEFAULT NULL,
  `staffInCharge` bigint(20) UNSIGNED NOT NULL,
  `eventTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventlog`
--

INSERT INTO `eventlog` (`id`, `event`, `eventRowIdOrRef`, `eventDesc`, `eventTable`, `staffInCharge`, `eventTime`) VALUES
(1, 'Creation of new item', '1', 'Addition of 20 quantities of a new item \'Renovo T480 i7\' with a unit price of &#8358;800,000.00 to stock', 'items', 1, '2021-04-02 07:30:01'),
(2, 'Creation of new item', '2', 'Addition of 15 quantities of a new item \'Macbook Pro 2020\' with a unit price of &#8358;1,500,000.00 to stock', 'items', 1, '2021-04-02 07:30:58'),
(3, 'Creation of new item', '3', 'Addition of 30 quantities of a new item \'Hp Envy x360 i7\' with a unit price of &#8358;1,200,000.00 to stock', 'items', 1, '2021-04-02 07:32:37'),
(4, 'New Transaction', '949760283', '2 items totalling &#8358;7,847,000.00 with reference number 949760283 was purchased', 'transactions', 1, '2021-04-02 07:39:02'),
(5, 'New Transaction', '291162485', '1 items totalling &#8358;8,496,000.00 with reference number 291162485 was purchased', 'transactions', 2, '2021-04-02 09:57:17'),
(6, 'New Transaction', '138062', '1 items totalling Rwf 2,832,000.00 with reference number 138062 was purchased', 'transactions', 3, '2021-04-02 11:24:20'),
(7, 'Stock Update (Deficit)', '3', '<p>6 quantities of Hp Envy x360 i7 was removed from stock</p>\n                Reason: <p>All the 6 laptop is broken</p>', 'items', 3, '2021-04-02 11:26:13'),
(8, 'New Transaction', '9987035', '1 items totalling Rwf 21,600,000.00 with reference number 9987035 was purchased', 'transactions', 3, '2021-06-09 08:36:29'),
(9, 'Creation of new item', '4', 'Addition of 100 quantities of a new item \'chair\' with a unit price of Rwf 500.00 to stock', 'items', 4, '2021-06-18 18:26:57'),
(10, 'New Transaction', '33298671', '1 items totalling Rwf 5,000.00 with reference number 33298671 was purchased', 'transactions', 4, '2021-06-18 18:33:21'),
(11, 'New Transaction', '135068273', '3 items totalling Rwf 2,300,500.00 with reference number 135068273 was purchased', 'transactions', 4, '2021-06-18 18:36:09'),
(12, 'Creation of new item', '5', 'Addition of 12 quantities of a new item \'liter\' with a unit price of Rwf 100.00 to stock', 'items', 4, '2021-06-20 14:43:11'),
(13, 'Creation of new item', '6', 'Addition of 20 quantities of a new item \'jordan\' with a unit price of Rwf 450.00 to stock', 'items', 4, '2021-06-20 14:45:14'),
(14, 'Creation of new item', '7', 'Addition of 11 quantities of a new item \'ww3\' with a unit price of Rwf 11.00 to stock', 'items', 4, '2021-06-20 14:45:50'),
(15, 'Creation of new item', '8', 'Addition of 12 quantities of a new item \'leda\' with a unit price of Rwf 21.00 to stock', 'items', 4, '2021-06-20 14:55:50'),
(16, 'Creation of new item', '9', 'Addition of 11 quantities of a new item \'44q\' with a unit price of Rwf 11.00 to stock', 'items', 4, '2021-06-20 15:05:03'),
(17, 'Creation of new item', '10', 'Addition of 80 quantities of a new item \'hut\' with a unit price of Rwf 45.00 to stock', 'items', 4, '2021-06-20 15:08:06'),
(18, 'Creation of new item', '11', 'Addition of 11 quantities of a new item \'Jet\' with a unit price of Rwf 11.00 to stock', 'items', 4, '2021-06-20 15:29:41'),
(19, 'Creation of new item', '12', 'Addition of 22 quantities of a new item \'biul\' with a unit price of Rwf 116.00 to stock', 'items', 4, '2021-06-20 15:31:14'),
(20, 'Creation of new item', '13', 'Addition of 105 quantities of a new item \'Lira\' with a unit price of Rwf 50.00 to stock', 'items', 4, '2021-06-20 15:54:10'),
(21, 'Creation of new item', '14', 'Addition of 232 quantities of a new item \'gg\' with a unit price of Rwf 31.00 to stock', 'items', 4, '2021-06-20 16:02:40'),
(22, 'Creation of new item', '15', 'Addition of 11 quantities of a new item \'f43\' with a unit price of Rwf 33.00 to stock', 'items', 4, '2021-06-20 16:08:24'),
(23, 'Creation of new item', '16', 'Addition of 422 quantities of a new item \'ledop\' with a unit price of Rwf 30.00 to stock', 'items', 4, '2021-06-20 16:23:32'),
(24, 'Creation of new item', '17', 'Addition of 21 quantities of a new item \'kip\' with a unit price of Rwf 12.00 to stock', 'items', 4, '2021-06-20 16:39:28'),
(25, 'Creation of new item', '18', 'Addition of 79 quantities of a new item \'fadno\' with a unit price of Rwf 800.00 to stock', 'items', 4, '2021-06-20 17:14:28'),
(26, 'Creation of new item', '19', 'Addition of 434 quantities of a new item \'tipp\' with a unit price of Rwf 32.00 to stock', 'items', 4, '2021-06-20 17:17:20'),
(27, 'Creation of new item', '21', 'Addition of 21 quantities of a new item \'vvo\' with a unit price of Rwf 10.00 to stock', 'items', 4, '2021-06-20 17:19:03'),
(28, 'Creation of new item', '22', 'Addition of 11 quantities of a new item \'fadeeer\' with a unit price of Rwf 11.00 to stock', 'items', 4, '2021-06-20 17:19:42'),
(29, 'Creation of new item', '23', 'Addition of 11 quantities of a new item \'qq\' with a unit price of Rwf 11.00 to stock', 'items', 4, '2021-06-20 17:20:33'),
(30, 'Creation of new item', '24', 'Addition of 909 quantities of a new item \'fadllll\' with a unit price of Rwf 6,643.00 to stock', 'items', 4, '2021-06-20 17:27:29'),
(31, 'Creation of new item', '25', 'Addition of 11 quantities of a new item \'dfsppppp\' with a unit price of Rwf 11.00 to stock', 'items', 4, '2021-06-20 17:28:00'),
(32, 'Creation of new item', '26', 'Addition of 22 quantities of a new item \'wewd3wdw\' with a unit price of Rwf 11.00 to stock', 'items', 4, '2021-06-20 17:29:17'),
(33, 'Creation of new item', '27', 'Addition of 1 quantities of a new item \'gdjio\' with a unit price of Rwf 11.00 to stock', 'items', 4, '2021-06-20 17:29:44'),
(34, 'Creation of new item', '28', 'Addition of 11 quantities of a new item \'nniiooopp\' with a unit price of Rwf 111.00 to stock', 'items', 4, '2021-06-20 17:44:55'),
(35, 'Creation of new item', '29', 'Addition of 89 quantities of a new item \'nnknkn\' with a unit price of Rwf 89.00 to stock', 'items', 4, '2021-06-20 17:53:32'),
(36, 'Creation of new item', '35', 'Addition of 10 quantities of a new item \'fresa\' with a unit price of &#8358;500.00 to stock', 'items', 4, '2021-06-20 20:51:58'),
(37, 'Creation of new item', '36', 'Addition of 10 quantities of a new item \'fdaaaaaa\' with a unit price of Rwf 10.00 to stock', 'items', 4, '2021-06-20 21:10:10'),
(38, 'New Transaction', '16492017', '2 items totalling Rwf 21,500.00 with reference number 16492017 was purchased', 'transactions', 4, '2021-06-25 19:27:30'),
(39, 'New Transaction', '579154', '2 items totalling Rwf 85,000.00 with reference number 579154 was purchased', 'transactions', 4, '2021-06-26 08:41:33'),
(40, 'Item Update', '40', 'Details of item with code \'sd23412l\' was updated', 'items', 4, '2021-07-09 15:22:27'),
(41, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-09 15:51:13'),
(42, 'Stock Update (New Stock)', '45', '<p>600 quantities of toolfine was added to stock</p>\n                Reason: <p>New items were purchased</p>', 'items', 4, '2021-07-09 16:09:36'),
(43, 'New Transaction', '4506473', '1 items totalling Rwf 18,000.00 with reference number 4506473 was purchased', 'transactions', 4, '2021-07-10 20:21:30'),
(44, 'Stock Update (Deficit)', '44', '<p>300 quantities of bobite was removed from stock</p>\n                Reason: <p>Lost</p>', 'items', 4, '2021-07-10 23:53:53'),
(45, 'Stock Update (Deficit)', '66', '<p>2 quantities of pro book was removed from stock</p>\n                Reason: <p>yarameneste</p>', 'items', 4, '2021-07-11 11:36:30'),
(46, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-11 12:09:17'),
(47, 'New Transaction', '509168458', '3 items totalling Rwf 634,500.00 with reference number 509168458 was purchased', 'transactions', 4, '2021-07-11 12:18:08'),
(48, 'New Transaction', '6175298', '1 items totalling Rwf 212,400.00 with reference number 6175298 was purchased', 'transactions', 4, '2021-07-11 12:41:21'),
(49, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:00:53'),
(50, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:02:38'),
(51, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:03:08'),
(52, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:09:32'),
(53, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:12:35'),
(54, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:17:50'),
(55, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:18:02'),
(56, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:33:54'),
(57, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:36:54'),
(58, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:38:46'),
(59, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:40:20'),
(60, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:40:50'),
(61, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:42:41'),
(62, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:44:03'),
(63, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:45:28'),
(64, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:46:32'),
(65, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:49:24'),
(66, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:54:31'),
(67, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 13:57:41'),
(68, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 14:09:25'),
(69, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 14:11:22'),
(70, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 14:13:04'),
(71, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 14:16:06'),
(72, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 14:18:08'),
(73, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 14:22:02'),
(74, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 14:23:32'),
(75, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 14:26:24'),
(76, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-13 14:26:24'),
(77, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-13 14:38:20'),
(78, 'Item Update', NULL, 'Details of item with code \'\' was updated', 'items', 4, '2021-07-13 15:02:21'),
(79, 'Item Update', NULL, 'Details of item with code \'\' was updated', 'items', 4, '2021-07-13 15:04:30'),
(80, 'Item Update', NULL, 'Details of item with code \'\' was updated', 'items', 4, '2021-07-13 15:04:39'),
(81, 'Item Update', NULL, 'Details of item with code \'\' was updated', 'items', 4, '2021-07-13 15:04:43'),
(82, 'Item Update', NULL, 'Details of item with code \'\' was updated', 'items', 4, '2021-07-13 15:05:03'),
(83, 'Item Update', NULL, 'Details of item with code \'\' was updated', 'items', 4, '2021-07-13 16:11:37'),
(84, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 16:14:53'),
(85, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 16:16:42'),
(86, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-13 16:16:42'),
(87, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 16:30:00'),
(88, 'Item Update', NULL, 'Details of item with code \'\' was updated', 'items', 4, '2021-07-13 16:30:00'),
(89, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 16:31:06'),
(90, 'Item Update', NULL, 'Details of item with code \'\' was updated', 'items', 4, '2021-07-13 16:31:06'),
(91, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 16:39:00'),
(92, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 16:42:19'),
(93, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 17:13:27'),
(94, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 17:15:04'),
(95, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 17:19:49'),
(96, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 17:22:43'),
(97, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 17:23:57'),
(98, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 17:24:12'),
(99, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 17:24:58'),
(100, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 17:37:37'),
(101, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 17:42:35'),
(102, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 17:44:24'),
(103, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 17:45:51'),
(104, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 17:47:04'),
(105, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 17:55:12'),
(106, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 18:21:14'),
(107, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 18:22:01'),
(108, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 18:32:28'),
(109, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 18:50:51'),
(110, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 18:52:13'),
(111, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 18:53:36'),
(112, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 18:58:13'),
(113, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 19:03:30'),
(114, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 19:19:13'),
(115, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 19:21:06'),
(116, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-13 19:50:34'),
(117, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-13 19:50:58'),
(118, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-13 19:55:45'),
(119, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-13 19:57:03'),
(120, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-13 19:59:41'),
(121, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-13 20:00:34'),
(122, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-13 20:01:21'),
(123, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-14 00:14:29'),
(124, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-14 00:19:13'),
(125, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-14 00:22:00'),
(126, 'Item Update', '44', 'Details of item with code \'rr2ewew111\' was updated', 'items', 4, '2021-07-14 00:27:21'),
(127, 'New Transaction', '963762530', '3 items totalling Rwf 22,000.00 with reference number 963762530 was purchased', 'transactions', 4, '2021-07-15 14:16:10'),
(128, 'New Transaction', '429683072', '2 items totalling Rwf 45,001.00 with reference number 429683072 was purchased', 'transactions', 4, '2021-07-16 20:55:10'),
(129, 'Stock Update (Deficit)', '42', '<p>57 quantities of Borat was removed from stock</p>\n                Reason: <p>Stolen</p>', 'items', 4, '2021-07-18 16:25:50'),
(130, 'Stock Update (Deficit)', '37', '<p>3 quantities of bye was removed from stock</p>\n                Reason: <p>Test</p>', 'items', 4, '2021-07-18 16:34:27'),
(131, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-19 17:27:21'),
(132, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-19 17:30:15'),
(133, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-19 17:33:31'),
(134, 'Item Update', '42', 'Details of item with code \'fffoo111pp21\' was updated', 'items', 4, '2021-07-19 17:33:49'),
(135, 'Item Update', '42', 'Details of item with code \'ffff0000\' was updated', 'items', 4, '2021-07-19 17:34:07'),
(136, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-19 17:34:28'),
(137, 'Item Update', '42', 'Details of item with code \'ffff0000\' was updated', 'items', 4, '2021-07-19 17:38:00'),
(138, 'Item Update', '42', 'Details of item with code \'ffff0000\' was updated', 'items', 4, '2021-07-19 17:39:27'),
(139, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-19 17:39:49'),
(140, 'Item Update', '42', 'Details of item with code \'ffff0000\' was updated', 'items', 4, '2021-07-19 17:42:36'),
(141, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-19 17:42:59'),
(142, 'Item Update', '42', 'Details of item with code \'fsvmk1111111\' was updated', 'items', 4, '2021-07-19 17:43:12'),
(143, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-19 17:44:05'),
(144, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-19 17:44:15'),
(145, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-19 17:49:38'),
(146, 'Item Update', '42', 'Details of item with code \'fsvmk0112\' was updated', 'items', 4, '2021-07-19 17:50:58'),
(147, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-19 17:54:06'),
(148, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-19 17:54:24'),
(149, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-19 17:56:13'),
(150, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-19 17:56:25'),
(151, 'Item Update', '42', 'Details of item with code \'fsvmk01121\' was updated', 'items', 4, '2021-07-19 17:56:32'),
(152, 'Item Update', '42', 'Details of item with code \'ffff0000\' was updated', 'items', 4, '2021-07-19 17:58:26'),
(153, 'Item Update', '40', 'Details of item with code \'ff23412l\' was updated', 'items', 4, '2021-07-19 18:00:06'),
(154, 'Item Update', '37', 'Details of item with code \'23412lqwcsa\' was updated', 'items', 4, '2021-07-19 18:00:47'),
(155, 'Item Update', '37', 'Details of item with code \'23412lqwcsa\' was updated', 'items', 4, '2021-07-19 18:01:59'),
(156, 'Item Update', '37', 'Details of item with code \'23412lqwcsa\' was updated', 'items', 4, '2021-07-19 18:02:37'),
(157, 'Item Update', '37', 'Details of item with code \'bye\' was updated', 'items', 4, '2021-07-19 18:04:19'),
(158, 'Item Update', '37', 'Details of item with code \'bye\' was updated', 'items', 4, '2021-07-19 18:04:38'),
(159, 'Item Update', '37', 'Details of item with code \'bye\' was updated', 'items', 4, '2021-07-19 18:05:23'),
(160, 'Item Update', '37', 'Details of item with code \'431kio\' was updated', 'items', 4, '2021-07-19 18:06:46'),
(161, 'Item Update', '37', 'Details of item with code \'431456\' was updated', 'items', 4, '2021-07-19 18:07:29'),
(162, 'Item Update', '37', 'Details of item with code \'431456\' was updated', 'items', 4, '2021-07-19 20:50:40'),
(163, 'Item Update', '40', 'Details of item with code \'nnnn88888\' was updated', 'items', 4, '2021-07-19 20:55:32'),
(164, 'Item Update', '40', 'Details of item with code \'nnnn88888\' was updated', 'items', 4, '2021-07-19 20:57:16'),
(165, 'Item Update', '37', 'Details of item with code \'431456\' was updated', 'items', 4, '2021-07-19 20:57:55'),
(166, 'Item Update', '42', 'Details of item with code \'ffooo22211\' was updated', 'items', 4, '2021-07-19 20:59:57'),
(167, 'Item Update', '42', 'Details of item with code \'ffooo22211\' was updated', 'items', 4, '2021-07-19 21:01:36'),
(168, 'Item Update', '56', 'Details of item with code \'de1232\' was updated', 'items', 4, '2021-07-19 21:23:37'),
(169, 'Item Update', '40', 'Details of item with code \'Wnnnn88888\' was updated', 'items', 4, '2021-07-19 21:47:06'),
(170, 'Item Update', '40', 'Details of item with code \'nnnn88888\' was updated', 'items', 4, '2021-07-19 21:49:35'),
(171, 'Item Update', '40', 'Details of item with code \'nnnn88889\' was updated', 'items', 4, '2021-07-19 21:52:48'),
(172, 'Item Update', '40', 'Details of item with code \'nnnn8888\' was updated', 'items', 4, '2021-07-19 21:53:17'),
(173, 'Item Update', '40', 'Details of item with code \'nnnn8888\' was updated', 'items', 4, '2021-07-19 22:00:53'),
(174, 'Item Update', '40', 'Details of item with code \'nnnn8888\' was updated', 'items', 4, '2021-07-19 22:01:05'),
(175, 'Item Update', '40', 'Details of item with code \'llnn8888\' was updated', 'items', 4, '2021-07-19 22:30:47'),
(176, 'Item Update', '40', 'Details of item with code \'llnn8888\' was updated', 'items', 4, '2021-07-19 22:34:20'),
(177, 'Item Update', '40', 'Details of item with code \'llnn8888\' was updated', 'items', 4, '2021-07-19 22:40:47'),
(178, 'Item Update', '40', 'Details of item with code \'llnn8888\' was updated', 'items', 4, '2021-07-19 22:48:51'),
(179, 'Item Update', '40', 'Details of item with code \'llnn8888\' was updated', 'items', 4, '2021-07-19 22:49:38'),
(180, 'Item Update', '40', 'Details of item with code \'llnn8888\' was updated', 'items', 4, '2021-07-19 22:50:28'),
(181, 'Item Update', '40', 'Details of item with code \'llnn8888\' was updated', 'items', 4, '2021-07-19 22:50:52'),
(182, 'Item Update', '40', 'Details of item with code \'llnn8888\' was updated', 'items', 4, '2021-07-19 22:52:39'),
(183, 'Item Update', '40', 'Details of item with code \'llnn8888\' was updated', 'items', 4, '2021-07-19 22:55:13'),
(184, 'Item Update', '40', 'Details of item with code \'llnn8888\' was updated', 'items', 4, '2021-07-19 22:56:02'),
(185, 'Item Update', '40', 'Details of item with code \'llnn8888\' was updated', 'items', 4, '2021-07-19 22:57:11'),
(186, 'Item Update', '40', 'Details of item with code \'llnn8888\' was updated', 'items', 4, '2021-07-19 22:59:42'),
(187, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-19 22:59:42'),
(188, 'Item Update', '40', 'Details of item with code \'llnn8888\' was updated', 'items', 4, '2021-07-19 23:00:53'),
(189, 'Item Update', '40', 'Details of item with code \'llnn8888\' was updated', 'items', 4, '2021-07-19 23:00:54'),
(190, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-19 23:00:54'),
(191, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-19 23:00:54'),
(192, 'Item Update', '40', 'Details of item with code \'llnn8888\' was updated', 'items', 4, '2021-07-19 23:04:17'),
(193, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-19 23:04:17'),
(194, 'Item Update', '40', 'Details of item with code \'llnn8888\' was updated', 'items', 4, '2021-07-19 23:05:26'),
(195, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-19 23:05:26'),
(196, 'Item Update', '40', 'Details of item with code \'llnn8889\' was updated', 'items', 4, '2021-07-19 23:07:21'),
(197, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-19 23:07:22'),
(198, 'Item Update', '40', 'Details of item with code \'llnn8889\' was updated', 'items', 4, '2021-07-19 23:08:46'),
(199, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-19 23:08:46'),
(200, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-19 23:11:39'),
(201, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-19 23:12:08'),
(202, 'Item Update', '40', 'Details of item with code \'llnn8889\' was updated', 'items', 4, '2021-07-19 23:15:39'),
(203, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-19 23:15:40'),
(204, 'Item Update', '40', 'Details of item with code \'llnn8889\' was updated', 'items', 4, '2021-07-19 23:16:57'),
(205, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-19 23:16:58'),
(206, 'Item Update', '40', 'Details of item with code \'llnn8889\' was updated', 'items', 4, '2021-07-19 23:17:46'),
(207, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-19 23:17:46'),
(208, 'Item Update', '40', 'Details of item with code \'llnn8889\' was updated', 'items', 4, '2021-07-19 23:19:17'),
(209, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-19 23:19:17'),
(210, 'Item Update', '56', 'Details of item with code \'de1232\' was updated', 'items', 4, '2021-07-19 23:23:00'),
(211, 'Item Update', '56', 'Details of item with code \'de1232\' was updated', 'items', 4, '2021-07-19 23:24:44'),
(212, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-19 23:24:44'),
(213, 'Item Update', '56', 'Details of item with code \'de1232\' was updated', 'items', 4, '2021-07-19 23:37:23'),
(214, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-19 23:37:24'),
(215, 'Item Update', '56', 'Details of item with code \'de1232\' was updated', 'items', 4, '2021-07-19 23:38:11'),
(216, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-19 23:38:11'),
(217, 'Item Update', '56', 'Details of item with code \'de1232\' was updated', 'items', 4, '2021-07-19 23:42:40'),
(218, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-19 23:42:40'),
(219, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-20 10:12:32'),
(220, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-20 10:12:49'),
(221, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-20 10:13:32'),
(222, 'Item Update', '', 'Details of item with code \'\' was updated', 'items', 4, '2021-07-20 10:16:12'),
(223, 'Item Update', '76', 'Details of item with code \'98765\' was updated', 'items', 4, '2021-07-20 10:34:09'),
(224, 'Item Update', '76', 'Details of item with code \'98765\' was updated', 'items', 4, '2021-07-20 10:36:25'),
(225, 'Item Update', '76', 'Details of item with code \'987651\' was updated', 'items', 4, '2021-07-20 10:36:52'),
(226, 'Item Update', '76', 'Details of item with code \'987651\' was updated', 'items', 4, '2021-07-20 10:39:12'),
(227, 'Item Update', '76', 'Details of item with code \'987651\' was updated', 'items', 4, '2021-07-20 10:41:56'),
(228, 'Item Update', '76', 'Details of item with code \'15000\' was updated', 'items', 4, '2021-07-20 10:42:10'),
(229, 'Item Update', '76', 'Details of item with code \'310\' was updated', 'items', 4, '2021-07-20 10:42:27'),
(230, 'Item Update', '76', 'Details of item with code \'K987651\' was updated', 'items', 4, '2021-07-20 10:43:07'),
(231, 'Item Update', '76', 'Details of item with code \'25000\' was updated', 'items', 4, '2021-07-20 10:43:31'),
(232, 'Item Update', '76', 'Details of item with code \'Kooo0\' was updated', 'items', 4, '2021-07-20 10:44:23'),
(233, 'Item Update', '76', 'Details of item with code \'Kooo0\' was updated', 'items', 4, '2021-07-20 10:46:26'),
(234, 'Item Update', '76', 'Details of item with code \'Kooo0\' was updated', 'items', 4, '2021-07-20 10:47:52'),
(235, 'Item Update', '86', 'Details of item with code \'1234556789\' was updated', 'items', 4, '2021-07-22 08:55:57'),
(236, 'Item Update', '86', 'Details of item with code \'1234556789\' was updated', 'items', 4, '2021-07-22 08:58:15'),
(237, 'Item Update', '86', 'Details of item with code \'1234556789\' was updated', 'items', 4, '2021-07-22 08:58:31'),
(238, 'Item Update', '86', 'Details of item with code \'1234556789\' was updated', 'items', 4, '2021-07-22 08:58:47'),
(239, 'Stock Update (Deficit)', '86', '<p>9 quantities of Confortable Chair was removed from stock</p>\n                Reason: <p>lost</p>', 'items', 4, '2021-07-22 09:02:56'),
(240, 'Item Update', '61', 'Details of item with code \'ew53fdf\' was updated', 'items', 4, '2021-07-22 09:12:19'),
(241, 'Item Update', '61', 'Details of item with code \'ew53fdf\' was updated', 'items', 4, '2021-07-22 09:12:37'),
(242, 'Item Update', '61', 'Details of item with code \'ew53fdf1\' was updated', 'items', 4, '2021-07-22 09:12:51'),
(243, 'Item Update', '61', 'Details of item with code \'ew53fdf\' was updated', 'items', 4, '2021-07-22 09:15:57'),
(244, 'Item Update', '61', 'Details of item with code \'ew53fdf\' was updated', 'items', 4, '2021-07-22 09:16:08'),
(245, 'Item Update', '61', 'Details of item with code \'ew53fdf\' was updated', 'items', 4, '2021-07-22 09:16:27'),
(246, 'Item Update', '61', 'Details of item with code \'ew53fdf1\' was updated', 'items', 4, '2021-07-22 09:16:37'),
(247, 'Item Update', '81', 'Details of item with code \'kio0902121\' was updated', 'items', 4, '2021-07-22 09:22:02'),
(248, 'Item Update', '81', 'Details of item with code \'0kio0902121\' was updated', 'items', 4, '2021-07-22 09:22:41'),
(249, 'Item Update', '61', 'Details of item with code \'ew53fdf1\' was updated', 'items', 4, '2021-07-22 09:33:45'),
(250, 'Item Update', '61', 'Details of item with code \'ew53fdf1\' was updated', 'items', 4, '2021-07-22 09:35:46'),
(251, 'Item Update', '65', 'Details of item with code \'de12fs\' was updated', 'items', 4, '2021-07-22 15:16:35'),
(252, 'Item Update', '81', 'Details of item with code \'0kio0902121\' was updated', 'items', 4, '2021-07-22 15:23:25'),
(253, 'Item Update', '81', 'Details of item with code \'0kio0902121\' was updated', 'items', 4, '2021-07-22 15:24:29'),
(254, 'Item Update', '81', 'Details of item with code \'0kio0902121\' was updated', 'items', 4, '2021-07-22 15:25:37'),
(255, 'Item Update', '61', 'Details of item with code \'ew53fdf1\' was updated', 'items', 4, '2021-07-22 15:26:55'),
(256, 'Item Update', '61', 'Details of item with code \'ew53fdf1\' was updated', 'items', 4, '2021-07-22 15:29:03'),
(257, 'Item Update', '38', 'Details of item with code \'1wmoo31\' was updated', 'items', 4, '2021-07-22 15:44:16'),
(258, 'Item Update', '38', 'Details of item with code \'1wmoo32\' was updated', 'items', 4, '2021-07-22 15:44:45'),
(259, 'Item Update', '65', 'Details of item with code \'123123\' was updated', 'items', 4, '2021-07-22 15:46:23'),
(260, 'Item Update', '59', 'Details of item with code \'123r11\' was updated', 'items', 4, '2021-07-22 15:48:47'),
(261, 'Item Update', '59', 'Details of item with code \'123r45\' was updated', 'items', 4, '2021-07-22 15:50:34'),
(262, 'Item Update', '59', 'Details of item with code \'123r45\' was updated', 'items', 4, '2021-07-22 15:51:49'),
(263, 'Item Update', '59', 'Details of item with code \'123r5\' was updated', 'items', 4, '2021-07-22 16:07:03'),
(264, 'Item Update', '59', 'Details of item with code \'1234578\' was updated', 'items', 4, '2021-07-22 16:20:07'),
(265, 'Item Update', '59', 'Details of item with code \'1234578\' was updated', 'items', 4, '2021-07-22 16:20:28'),
(266, 'Item Update', '91', 'Details of item with code \'1190099\' was updated', 'items', 4, '2021-07-22 16:25:51'),
(267, 'Item Update', '59', 'Details of item with code \'k1234578\' was updated', 'items', 4, '2021-07-22 16:32:41'),
(268, 'Item Update', '59', 'Details of item with code \'1234578\' was updated', 'items', 4, '2021-07-22 16:33:32'),
(269, 'Item Update', '59', 'Details of item with code \'1230578\' was updated', 'items', 4, '2021-07-23 08:40:20'),
(270, 'Item Update', '59', 'Details of item with code \'1239578\' was updated', 'items', 4, '2021-07-23 08:41:07'),
(271, 'Item Update', '59', 'Details of item with code \'1230578\' was updated', 'items', 4, '2021-07-23 08:44:16'),
(272, 'Item Update', '59', 'Details of item with code \'1230578\' was updated', 'items', 4, '2021-07-23 11:32:23'),
(273, 'Item Update', '61', 'Details of item with code \'ew53fdf2\' was updated', 'items', 4, '2021-07-31 16:42:09'),
(274, 'Item Update', '59', 'Details of item with code \'2230578\' was updated', 'items', 4, '2021-07-31 17:00:21'),
(275, 'Item Update', '65', 'Details of item with code \'7123123\' was updated', 'items', 4, '2021-08-01 07:07:30'),
(276, 'Item Update', '65', 'Details of item with code \'7123123\' was updated', 'items', 4, '2021-08-01 07:52:40'),
(277, 'Item Update', '43', 'Details of item with code \'Sports123\' was updated', 'items', 4, '2021-08-01 09:24:41'),
(278, 'Item Update', '61', 'Details of item with code \'1235645Shoe\' was updated', 'items', 4, '2021-08-01 09:27:03'),
(279, 'Item Update', '43', 'Details of item with code \'Sports1234\' was updated', 'items', 4, '2021-08-02 10:16:59'),
(280, 'Item Update', '43', 'Details of item with code \'Sports1234\' was updated', 'items', 4, '2021-08-02 10:23:59'),
(281, 'Item Update', '43', 'Details of item with code \'Sports1234\' was updated', 'items', 4, '2021-08-02 10:25:36'),
(282, 'Item Update', '43', 'Details of item with code \'Sports1234\' was updated', 'items', 4, '2021-08-02 10:25:50'),
(283, 'Item Update', '68', 'Details of item with code \'k1234567\' was updated', 'items', 4, '2021-08-02 10:45:40'),
(284, 'Item Update', '38', 'Details of item with code \'1wmoo32\' was updated', 'items', 4, '2021-08-02 11:52:20'),
(285, 'Item Update', '81', 'Details of item with code \'0kio0902121\' was updated', 'items', 4, '2021-08-02 11:57:59'),
(286, 'Item Update', '94', 'Details of item with code \'121311221313\' was updated', 'items', 4, '2021-08-02 11:58:13'),
(287, 'Item Update', '39', 'Details of item with code \'loep\' was updated', 'items', 4, '2021-08-02 11:58:26'),
(288, 'Item Update', '94', 'Details of item with code \'1213112214\' was updated', 'items', 4, '2021-08-02 11:58:43'),
(289, 'Item Update', '94', 'Details of item with code \'1213112214\' was updated', 'items', 4, '2021-08-02 11:58:55'),
(290, 'Item Update', '94', 'Details of item with code \'1213112214\' was updated', 'items', 4, '2021-08-02 11:59:06'),
(291, 'Stock Update (Deficit)', '81', '<p>50 quantities of Duplicated was removed from stock</p>\n                Reason: <p>lost</p>', 'items', 4, '2021-08-02 12:23:54'),
(292, 'New Transaction', '627694', '3 items totalling Rwf 300,300.00 with reference number 627694 was purchased', 'transactions', 4, '2021-08-02 12:31:25'),
(293, 'Item Update', '43', 'Details of item with code \'Sports1234\' was updated', 'items', 4, '2021-08-02 12:35:00'),
(294, 'New Transaction', '83187243', '3 items totalling Rwf 6,000.00 with reference number 83187243 was purchased', 'transactions', 4, '2021-08-02 12:41:36'),
(295, 'Item Update', '90', 'Details of item with code \'90099089\' was updated', 'items', 4, '2021-08-02 13:28:52'),
(296, 'Item Update', '89', 'Details of item with code \'123bk\' was updated', 'items', 4, '2021-08-02 13:31:15'),
(297, 'New Transaction', '6915070', '1 items totalling Rwf 3,000.00 with reference number 6915070 was purchased', 'transactions', 4, '2021-08-03 15:06:46'),
(298, 'New Transaction', '10967484', '1 items totalling Rwf 33,220.00 with reference number 10967484 was purchased', 'transactions', 4, '2021-08-03 15:28:42'),
(299, 'New Transaction', '791813645', '2 items totalling Rwf 48,000.00 with reference number 791813645 was purchased', 'transactions', 4, '2021-08-03 15:44:40'),
(300, 'New Transaction', '908736421', '1 items totalling Rwf 25,000.00 with reference number 908736421 was purchased', 'transactions', 4, '2021-08-03 15:51:23'),
(301, 'New Transaction', '734510672', '1 items totalling Rwf 5,000.00 with reference number 734510672 was purchased', 'transactions', 4, '2021-08-03 16:39:15'),
(302, 'New Transaction', '950105', '1 items totalling Rwf 15,000.00 with reference number 950105 was purchased', 'transactions', 4, '2021-08-03 17:31:09'),
(303, 'New Transaction', '2982130', '2 items totalling Rwf 125,000.00 with reference number 2982130 was purchased', 'transactions', 4, '2021-08-03 18:53:11'),
(304, 'New Transaction', '9764321', '1 items totalling Rwf 33,220.00 with reference number 9764321 was purchased', 'transactions', 4, '2021-08-03 20:00:46'),
(305, 'New Transaction', '32907546', '1 items totalling Rwf 100.00 with reference number 32907546 was purchased', 'transactions', 4, '2021-08-03 20:01:53'),
(306, 'Item Update', '81', 'Details of item with code \'k0kio0902121\' was updated', 'items', 4, '2021-08-03 20:06:01'),
(307, 'Item Update', '65', 'Details of item with code \'7123123\' was updated', 'items', 4, '2021-08-04 07:07:55'),
(308, 'Item Update', '65', 'Details of item with code \'07123123\' was updated', 'items', 4, '2021-08-04 07:08:08'),
(309, 'New Transaction', '79401219', '2 items totalling Rwf 28,000.00 with reference number 79401219 was purchased', 'transactions', 4, '2021-08-04 08:15:13'),
(310, 'New Transaction', '959072', '2 items totalling Rwf 25,200.00 with reference number 959072 was purchased', 'transactions', 4, '2021-08-04 08:25:24'),
(311, 'New Transaction', '58962948', '1 items totalling Rwf 3,363.00 with reference number 58962948 was purchased', 'transactions', 4, '2021-08-04 08:30:40'),
(312, 'New Transaction', '0816579', '1 items totalling Rwf 27,000.00 with reference number 0816579 was purchased', 'transactions', 4, '2021-08-04 08:36:06'),
(313, 'Item Update', '43', 'Details of item with code \'Sports1234\' was updated', 'items', 4, '2021-08-10 07:54:10'),
(314, 'Item Update', '43', 'Details of item with code \'Sports1234\' was updated', 'items', 4, '2021-08-10 07:54:21'),
(315, 'Stock Update (Deficit)', '43', '<p>11 quantities of Basket-Balls was removed from stock</p>\n                Reason: <p>Stolen</p>', 'items', 4, '2021-08-12 05:29:03');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `item_image` varchar(255) NOT NULL,
  `description` text,
  `unitPrice` decimal(10,2) NOT NULL,
  `quantity` int(6) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `code`, `item_image`, `description`, `unitPrice`, `quantity`, `dateAdded`, `lastUpdated`) VALUES
(32, 'Iter 3130', 'op21', '19257.jpg', 'sf', '5000.00', 197, '0000-00-00 00:00:00', '2021-06-26 08:41:33'),
(38, 'Styles', '1wmoo32', 'muse-for-you-unsplash-image-clothes-4.jpeg', '', '15000.00', 7, '0000-00-00 00:00:00', '2021-08-03 17:31:09'),
(39, 'fineamo', 'loep', 'images.jpg', 'None', '500.00', 14, '0000-00-00 00:00:00', '2021-08-10 07:55:59'),
(41, 'Torch', 'M23412l', 'calc.PNG', '', '500.00', 25, '0000-00-00 00:00:00', '2021-07-09 15:14:51'),
(43, 'Basket-Balls', 'Sports1234', 'yu.PNG', 'sports', '25000.00', 800, '0000-00-00 00:00:00', '2021-08-12 05:29:03'),
(45, 'toolfine', '43200', 'qqq.jpeg', '', '33220.00', 1498, '2021-07-09 15:54:05', '2021-08-03 20:00:46'),
(47, 'tufad', 'h88ewew111', 'google_place_photo.jpg', '', '500.00', 800, '2021-07-10 20:26:41', '2021-07-10 20:26:41'),
(48, 'Proto', 'nunu22', 'ubumwe.jpg', '', '40000.00', 500, '2021-07-10 22:02:16', '2021-07-10 22:02:16'),
(51, 'lolly', 'nr4222', 'cris.jpg', '', '3000.00', 498, '2021-07-10 22:23:59', '2021-08-03 15:06:46'),
(59, 'Ipad  Pro Max', '2230578', 'honest.PNG', 'Work-ish', '2500.00', 320, '2021-07-10 23:08:46', '2021-08-02 12:41:36'),
(61, 'Sneakers', '1235645Shoe', 'tup.png', 'Tests', '15000.00', 31, '2021-07-10 23:17:29', '2021-08-01 09:27:03'),
(65, 'fillers prod', '07123123', 'images.jpg', 'Dop', '1500.00', 32, '2021-07-10 23:27:17', '2021-08-10 07:55:05'),
(66, 'pro book', '12345', 'weed.jpg', 'mac book  pro', '100000.00', 0, '2021-07-11 11:26:47', '2021-08-03 18:53:11'),
(68, 'loop', 'k1234567', 'muse-for-you-unsplash-image-8.jpeg', 'test', '1500.00', 110, '2021-07-11 12:07:23', '2021-08-02 11:43:52'),
(75, 'Reverse ', '54321', 'kigla.jpg', '', '3000.00', 39, '2021-07-13 09:22:17', '2021-08-03 15:44:40'),
(76, 'Kooo0', 'CLaved', 'bk.png', '', '25000.00', 300, '2021-07-13 09:25:23', '2021-08-10 07:56:29'),
(79, 'Ipro', '3e21111', 'banner-mixing-kit.jpg', '', '500.00', 3299, '2021-07-13 17:57:16', '2021-08-02 12:41:36'),
(81, 'Photo', 'k0kio0902121', 'B0LW8hY.jpg', 'Tests', '25000.00', 250, '2021-07-13 18:18:29', '2021-08-03 20:07:50'),
(86, 'Confortable Chair', '1234556789', '20210711_134322.jpg', 'Confortable chair', '5000.00', 89, '2021-07-16 20:50:03', '2021-08-03 16:39:15'),
(88, 'Max', '5671239', 'images.jpeg', '', '3000.00', 15, '2021-07-19 21:19:09', '2021-07-19 21:19:09'),
(89, 'Burger King', '123bk', 'bk.png', 'restaurants', '45000.00', 29, '2021-07-20 10:29:18', '2021-08-03 15:44:40'),
(90, 'Volvo Car', '90099089', 'vlcsnap-2018-12-13-09h45m34s228.png', '', '25000.00', 60, '2021-07-22 09:06:43', '2021-08-02 13:28:52'),
(91, 'Lite', '1190099', 'Screenshot_2017-09-18-12-50-43.png', 'savb', '100.00', 26, '2021-07-22 16:24:55', '2021-08-03 20:01:53'),
(93, 'voiture', '991234556789', 'ADjeep.png', '', '150000.00', 80, '2021-08-01 08:45:08', '2021-08-01 08:52:58'),
(94, 'Go pro', '1213112214', 'vlcsnap-2018-11-13-01h49m39s308.png', 'Tests', '23000.00', 78, '2021-08-02 11:57:26', '2021-08-02 11:59:53'),
(95, 'Laptop', '12345678912', '20210804_100324.jpg', 'MAcbook', '3000.00', 37, '2021-08-04 08:10:53', '2021-08-04 08:36:05');

-- --------------------------------------------------------

--
-- Table structure for table `lk_sess`
--

CREATE TABLE `lk_sess` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transId` bigint(20) UNSIGNED NOT NULL,
  `ref` varchar(10) NOT NULL,
  `itemName` varchar(50) NOT NULL,
  `itemCode` varchar(50) NOT NULL,
  `description` text,
  `quantity` int(6) NOT NULL,
  `unitPrice` decimal(10,2) NOT NULL,
  `totalPrice` decimal(10,2) NOT NULL,
  `totalMoneySpent` decimal(10,2) NOT NULL,
  `amountTendered` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `discount_percentage` decimal(10,2) NOT NULL,
  `vatPercentage` decimal(10,2) NOT NULL,
  `vatAmount` decimal(10,2) NOT NULL,
  `changeDue` decimal(10,2) NOT NULL,
  `modeOfPayment` varchar(20) NOT NULL,
  `cust_name` varchar(20) DEFAULT NULL,
  `cust_phone` varchar(15) DEFAULT NULL,
  `cust_email` varchar(50) DEFAULT NULL,
  `transType` char(1) NOT NULL,
  `staffId` bigint(20) UNSIGNED NOT NULL,
  `transDate` datetime NOT NULL,
  `lastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cancelled` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transId`, `ref`, `itemName`, `itemCode`, `description`, `quantity`, `unitPrice`, `totalPrice`, `totalMoneySpent`, `amountTendered`, `discount_amount`, `discount_percentage`, `vatPercentage`, `vatAmount`, `changeDue`, `modeOfPayment`, `cust_name`, `cust_phone`, `cust_email`, `transType`, `staffId`, `transDate`, `lastUpdated`, `cancelled`) VALUES
(10, '16492017', 'fineamo', 'loep', '', 3, '500.00', '1500.00', '21500.00', '22000.00', '0.00', '0.00', '0.00', '0.00', '500.00', 'Cash', 'joly', '+250788989838', 'ishimwko@gmail.com', '1', 4, '2021-06-25 21:27:30', '2021-06-25 19:27:30', '0'),
(11, '16492017', 'hitedwm', 'wmoo31', '', 2, '10000.00', '20000.00', '21500.00', '22000.00', '0.00', '0.00', '0.00', '0.00', '500.00', 'Cash', 'joly', '+250788989838', 'ishimwko@gmail.com', '1', 4, '2021-06-25 21:27:30', '2021-06-25 19:27:30', '0'),
(12, '579154', 'Iter 3130', 'op21', '', 3, '5000.00', '15000.00', '85000.00', '85000.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'Cash', 'milo', '0781234567', '', '1', 4, '2021-06-26 10:41:33', '2021-06-26 08:41:33', '0'),
(13, '579154', 'bye', '23412lqwcsa', '', 7, '10000.00', '70000.00', '85000.00', '85000.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'Cash', 'milo', '0781234567', '', '1', 4, '2021-06-26 10:41:33', '2021-06-26 08:41:33', '0'),
(15, '509168458', 'pro book', '12345', '', 3, '100000.00', '300000.00', '634500.00', '700000.00', '70500.00', '10.00', '0.00', '0.00', '65500.00', 'Cash', 'riri', '+250788345530', '', '1', 4, '2021-07-11 14:18:03', '2021-07-11 12:18:03', '0'),
(16, '509168458', 'Chair', '123456', '', 10, '500.00', '5000.00', '634500.00', '700000.00', '70500.00', '10.00', '0.00', '0.00', '65500.00', 'Cash', 'riri', '+250788345530', '', '1', 4, '2021-07-11 14:18:05', '2021-07-11 12:18:05', '0'),
(17, '509168458', 'Bolat', 'fsvmk01121', '', 40, '10000.00', '400000.00', '634500.00', '700000.00', '70500.00', '10.00', '0.00', '0.00', '65500.00', 'Cash', 'riri', '+250788345530', '', '1', 4, '2021-07-11 14:18:05', '2021-07-11 12:18:05', '0'),
(18, '6175298', 'pro book', '12345', '', 2, '100000.00', '200000.00', '212400.00', '250000.00', '20000.00', '10.00', '18.00', '32400.00', '37600.00', 'Cash', 'rert', '', '', '1', 4, '2021-07-11 14:41:21', '2021-07-11 12:41:21', '0'),
(22, '429683072', 'Confortable Chair', '1234556789', '', 1, '5000.00', '5000.00', '45001.00', '45500.00', '0.00', '0.00', '0.00', '0.00', '499.00', 'Cash and POS', 'Dave', '+250734885538', 'Dave@gmail.com', '1', 4, '2021-07-16 22:55:10', '2021-07-16 20:55:10', '0'),
(23, '429683072', 'Borat', 'fsvmk01121', '', 1, '40001.00', '40001.00', '45001.00', '45500.00', '0.00', '0.00', '0.00', '0.00', '499.00', 'Cash and POS', 'Dave', '+250734885538', 'Dave@gmail.com', '1', 4, '2021-07-16 22:55:10', '2021-07-16 20:55:10', '0'),
(24, '627694', 'pro book', '12345', '', 2, '100000.00', '200000.00', '300300.00', '300500.00', '0.00', '0.00', '0.00', '0.00', '200.00', 'Cash', 'Rocky Balboa', '0781234567', 'rocky@gmail.com', '1', 4, '2021-08-02 14:31:25', '2021-08-02 12:31:25', '0'),
(25, '627694', 'Lite', '1190099', '', 3, '100.00', '300.00', '300300.00', '300500.00', '0.00', '0.00', '0.00', '0.00', '200.00', 'Cash', 'Rocky Balboa', '0781234567', 'rocky@gmail.com', '1', 4, '2021-08-02 14:31:25', '2021-08-02 12:31:25', '0'),
(26, '627694', 'Basket-Balls', 'Sports1234', '', 4, '25000.00', '100000.00', '300300.00', '300500.00', '0.00', '0.00', '0.00', '0.00', '200.00', 'Cash', 'Rocky Balboa', '0781234567', 'rocky@gmail.com', '1', 4, '2021-08-02 14:31:25', '2021-08-02 12:31:25', '0'),
(27, '83187243', 'Ipad  Pro Max', '2230578', '', 1, '2500.00', '2500.00', '6000.00', '6000.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'Cash and POS', 'Rocky Balboa', '0788123456', 'rocky@gmail.com', '1', 4, '2021-08-02 14:41:36', '2021-08-02 12:41:36', '0'),
(28, '83187243', 'lolly', 'nr4222', '', 1, '3000.00', '3000.00', '6000.00', '6000.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'Cash and POS', 'Rocky Balboa', '0788123456', 'rocky@gmail.com', '1', 4, '2021-08-02 14:41:36', '2021-08-02 12:41:36', '0'),
(29, '83187243', 'Ipro', '3e21111', '', 1, '500.00', '500.00', '6000.00', '6000.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'Cash and POS', 'Rocky Balboa', '0788123456', 'rocky@gmail.com', '1', 4, '2021-08-02 14:41:36', '2021-08-02 12:41:36', '0'),
(30, '6915070', 'lolly', 'nr4222', '', 1, '3000.00', '3000.00', '3000.00', '3000.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'POS', 'Rocky Balboa', '0781234567', 'rocky@gmail.com', '1', 4, '2021-08-03 17:06:46', '2021-08-03 15:06:46', '0'),
(31, '10967484', 'toolfine', '43200', '', 1, '33220.00', '33220.00', '33220.00', '33220.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'MOMO', 'visitor', '0781234567', 'rocky@gmail.com', '1', 4, '2021-08-03 17:28:42', '2021-08-03 15:28:42', '0'),
(32, '791813645', 'Reverse ', '54321', '', 1, '3000.00', '3000.00', '48000.00', '50000.00', '0.00', '0.00', '0.00', '0.00', '2000.00', 'Cash and POS', 'visitor', '0788123456', 'chris@gmail.com', '1', 4, '2021-08-03 17:44:40', '2021-08-03 15:44:40', '0'),
(33, '791813645', 'Burger King', '123bk', '', 1, '45000.00', '45000.00', '48000.00', '50000.00', '0.00', '0.00', '0.00', '0.00', '2000.00', 'Cash and POS', 'visitor', '0788123456', 'chris@gmail.com', '1', 4, '2021-08-03 17:44:40', '2021-08-03 15:44:40', '0'),
(34, '908736421', 'Basket-Ball', 'Sports1234', '', 1, '25000.00', '25000.00', '25000.00', '25000.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'MOMO', 'Rocky Balboa', '0781234567', 'rocky@gmail.com', '1', 4, '2021-08-03 17:51:22', '2021-08-03 15:51:22', '0'),
(35, '734510672', 'Confortable Chair', '1234556789', '', 1, '5000.00', '5000.00', '5000.00', '6000.00', '0.00', '0.00', '0.00', '0.00', '1000.00', 'Cash and MOMO', 'visitor', '0781234567', 'chris@gmail.com', '1', 4, '2021-08-03 18:39:15', '2021-08-03 16:39:15', '0'),
(36, '950105', 'Styles', '1wmoo32', '', 1, '15000.00', '15000.00', '15000.00', '17000.00', '0.00', '0.00', '0.00', '0.00', '2000.00', 'MOMO and POS', 'Balboa', '0781234567', 'rocky@gmail.com', '1', 4, '2021-08-03 19:31:09', '2021-08-03 17:31:09', '0'),
(37, '2982130', 'pro book', '12345', '', 1, '100000.00', '100000.00', '125000.00', '127000.00', '0.00', '0.00', '0.00', '0.00', '2000.00', 'CASH MOMO and POS', 'Rocky', '0788123456', 'rocky@gmail.com', '1', 4, '2021-08-03 20:53:11', '2021-08-03 18:53:11', '0'),
(38, '2982130', 'Basket-Ball', 'Sports1234', '', 1, '25000.00', '25000.00', '125000.00', '127000.00', '0.00', '0.00', '0.00', '0.00', '2000.00', 'CASH MOMO and POS', 'Rocky', '0788123456', 'rocky@gmail.com', '1', 4, '2021-08-03 20:53:11', '2021-08-03 18:53:11', '0'),
(39, '9764321', 'toolfine', '43200', '', 1, '33220.00', '33220.00', '33220.00', '35000.00', '0.00', '0.00', '0.00', '0.00', '1780.00', 'Cash', 'Rocky Balboa', '0788123456', 'rocky@gmail.com', '1', 4, '2021-08-03 22:00:46', '2021-08-03 20:00:46', '0'),
(40, '32907546', 'Lite', '1190099', '', 1, '100.00', '100.00', '100.00', '130.00', '0.00', '0.00', '0.00', '0.00', '30.00', 'Cash and MOMO', 'Rocky Balboa', '0781234567', 'rocky@gmail.com', '1', 4, '2021-08-03 22:01:53', '2021-08-03 20:01:53', '0'),
(41, '79401219', 'Laptop', '12345678912', '', 1, '3000.00', '3000.00', '28000.00', '30000.00', '0.00', '0.00', '0.00', '0.00', '2000.00', 'CASH MOMO and POS', 'Rocky Balboa', '0781234567', 'rocky@gmail.com', '1', 4, '2021-08-04 10:15:13', '2021-08-04 08:15:13', '0'),
(42, '79401219', 'Basket-Ball', 'Sports1234', '', 1, '25000.00', '25000.00', '28000.00', '30000.00', '0.00', '0.00', '0.00', '0.00', '2000.00', 'CASH MOMO and POS', 'Rocky Balboa', '0781234567', 'rocky@gmail.com', '1', 4, '2021-08-04 10:15:13', '2021-08-04 08:15:13', '0'),
(43, '959072', 'Laptop', '12345678912', '', 1, '3000.00', '3000.00', '25200.00', '25200.00', '2800.00', '10.00', '0.00', '0.00', '0.00', 'Cash', 'visitor', '0788123456', 'chris@gmail.com', '1', 4, '2021-08-04 10:25:24', '2021-08-04 08:25:24', '0'),
(44, '959072', 'Basket-Ball', 'Sports1234', '', 1, '25000.00', '25000.00', '25200.00', '25200.00', '2800.00', '10.00', '0.00', '0.00', '0.00', 'Cash', 'visitor', '0788123456', 'chris@gmail.com', '1', 4, '2021-08-04 10:25:24', '2021-08-04 08:25:24', '0'),
(45, '58962948', 'Laptop', '12345678912', '', 1, '3000.00', '3000.00', '3363.00', '4000.00', '150.00', '5.00', '18.00', '513.00', '637.00', 'Cash', 'Rocky Balboa', '0781234567', 'rocky@gmail.com', '1', 4, '2021-08-04 10:30:39', '2021-08-04 08:30:39', '0'),
(46, '0816579', 'Laptop', '12345678912', '', 10, '3000.00', '30000.00', '27000.00', '30000.00', '3000.00', '10.00', '0.00', '0.00', '3000.00', 'Cash', 'Rocky Balboa', '0781234567', 'rocky@gmail.com', '1', 4, '2021-08-04 10:36:05', '2021-08-04 08:36:05', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile1` (`mobile1`);

--
-- Indexes for table `damages`
--
ALTER TABLE `damages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eventlog`
--
ALTER TABLE `eventlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `damages`
--
ALTER TABLE `damages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `eventlog`
--
ALTER TABLE `eventlog`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transId` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

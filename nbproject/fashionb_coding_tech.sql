-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2021 at 09:13 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `last_edited` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `account_status` char(1) NOT NULL DEFAULT '1',
  `deleted` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `first_name`, `last_name`, `email`, `mobile1`, `mobile2`, `password`, `role`, `created_on`, `last_login`, `last_seen`, `last_edited`, `account_status`, `deleted`) VALUES
(1, 'Admin', 'Demo', 'demo@1410inc.xyz', '08021111111', '07032222222', '$2y$10$xv9I14OlR36kPCjlTv.wEOX/6Dl7VMuWCl4vCxAVWP1JwYIaw4J2C', 'Super', '2017-01-04 22:19:16', '2021-04-02 12:48:57', '2021-04-02 11:54:01', '2021-04-02 10:48:57', '1', '0'),
(2, 'Kalisa', 'Claude', 'kalisa.claude@gmail.com', '250788693689', '250733286321', '$2y$10$Xzd1nS9TL3xgLWU0FC75NeICUqeiKxkPOM0zNNFhg0xCJxdXVhvja', 'Basic', '2021-04-02 11:52:54', '2021-04-02 12:54:32', '2021-04-02 13:03:17', '2021-04-02 11:03:17', '1', '0'),
(3, 'Jean damour', 'Niringiyimana', 'jdam600@gmail.com', '+250788255264', '', '$2y$10$2Iec1CQkV0XeTkb7lZM8h.DpbuJ/YVn5OZUflZuu8MiS2eckxzn66', 'Super', '2021-04-02 12:52:38', '2021-04-03 19:13:51', '2021-04-03 21:12:40', '2021-04-03 19:12:40', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `eventlog`
--

CREATE TABLE `eventlog` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event` varchar(200) NOT NULL,
  `eventRowIdOrRef` varchar(20) DEFAULT NULL,
  `eventDesc` text DEFAULT NULL,
  `eventTable` varchar(20) DEFAULT NULL,
  `staffInCharge` bigint(20) UNSIGNED NOT NULL,
  `eventTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
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
(7, 'Stock Update (Deficit)', '3', '<p>6 quantities of Hp Envy x360 i7 was removed from stock</p>\n                Reason: <p>All the 6 laptop is broken</p>', 'items', 3, '2021-04-02 11:26:13');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `unitPrice` decimal(10,2) NOT NULL,
  `quantity` int(6) NOT NULL,
  `dateAdded` datetime NOT NULL,
  `lastUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `code`, `description`, `unitPrice`, `quantity`, `dateAdded`, `lastUpdated`) VALUES
(1, 'Renovo T480 i7', '1001', 'This the laptop brought from Dubai', '800000.00', 12, '2021-04-02 09:30:01', '2021-04-02 11:24:20'),
(2, 'Macbook Pro 2020', '1002', 'Macbook pro from usa', '1500000.00', 13, '2021-04-02 09:30:58', '2021-04-02 07:39:02'),
(3, 'Hp Envy x360 i7', '1003', 'Best laptop with high processing power', '1200000.00', 18, '2021-04-02 09:32:37', '2021-04-02 11:26:13');

-- --------------------------------------------------------

--
-- Table structure for table `lk_sess`
--

CREATE TABLE `lk_sess` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
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
  `description` text DEFAULT NULL,
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
  `lastUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cancelled` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transId`, `ref`, `itemName`, `itemCode`, `description`, `quantity`, `unitPrice`, `totalPrice`, `totalMoneySpent`, `amountTendered`, `discount_amount`, `discount_percentage`, `vatPercentage`, `vatAmount`, `changeDue`, `modeOfPayment`, `cust_name`, `cust_phone`, `cust_email`, `transType`, `staffId`, `transDate`, `lastUpdated`, `cancelled`) VALUES
(1, '949760283', 'Renovo T480 i7', '1001', '', 5, '800000.00', '4000000.00', '7847000.00', '7850000.00', '350000.00', '5.00', '18.00', '1197000.00', '3000.00', 'Cash', 'Jean Damour', '0788255264', 'jdam600@gmail.com', '1', 1, '2021-04-02 09:39:02', '2021-04-02 07:39:02', '0'),
(2, '949760283', 'Macbook Pro 2020', '1002', '', 2, '1500000.00', '3000000.00', '7847000.00', '7850000.00', '350000.00', '5.00', '18.00', '1197000.00', '3000.00', 'Cash', 'Jean Damour', '0788255264', 'jdam600@gmail.com', '1', 1, '2021-04-02 09:39:02', '2021-04-02 07:39:02', '0'),
(3, '291162485', 'Hp Envy x360 i7', '1003', '', 6, '1200000.00', '7200000.00', '8496000.00', '8496000.00', '0.00', '0.00', '18.00', '1296000.00', '0.00', 'POS', 'Rwabuhihi', '250788965421', 'Rwabuhihi@gmail.com', '1', 2, '2021-04-02 11:57:17', '2021-04-02 09:57:17', '0'),
(4, '138062', 'Renovo T480 i7', '1001', '', 3, '800000.00', '2400000.00', '2832000.00', '2832000.00', '0.00', '0.00', '18.00', '432000.00', '0.00', 'Cash and POS', 'Rwabugiri Christophe', '+250 786 254 78', 'Rwabugiri@gmail.com', '1', 3, '2021-04-02 13:24:20', '2021-04-02 11:24:20', '0');

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
-- Indexes for table `eventlog`
--
ALTER TABLE `eventlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
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
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `eventlog`
--
ALTER TABLE `eventlog`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transId` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2023 at 06:01 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `billing`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` bigint(20) NOT NULL,
  `added_date` datetime NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `added_date`, `email`, `password`, `name`) VALUES
(1, '2023-05-16 00:46:08', 'admin@gmail.com', '123456', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tblcaptcha`
--

CREATE TABLE `tblcaptcha` (
  `captcha` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcaptcha`
--

INSERT INTO `tblcaptcha` (`captcha`) VALUES
('15111');

-- --------------------------------------------------------

--
-- Table structure for table `tblcart`
--

CREATE TABLE `tblcart` (
  `id` bigint(20) NOT NULL,
  `discount_price` varchar(200) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` varchar(200) DEFAULT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `mrp_price` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcontact`
--

CREATE TABLE `tblcontact` (
  `id` bigint(20) NOT NULL,
  `contact_date` timestamp NULL DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `name` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcontact`
--

INSERT INTO `tblcontact` (`id`, `contact_date`, `email`, `message`, `name`, `subject`) VALUES
(1, '2023-07-25 14:15:20', 'ar@gmail.com', 'Hi, This is testing email contacts.', 'Ardent', 'Testing'),
(4, '2023-10-06 04:01:28', 'ardent@gmail.com', 'This is awesome online billing website.', 'Ardent Computech', 'About website');

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomer`
--

CREATE TABLE `tblcustomer` (
  `id` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `added_date` timestamp NULL DEFAULT current_timestamp(),
  `email` varchar(100) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `valid` varchar(50) DEFAULT NULL,
  `pin_code` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tblcustomer`
--

INSERT INTO `tblcustomer` (`id`, `address`, `added_date`, `email`, `gender`, `name`, `password`, `phone`, `valid`, `pin_code`) VALUES
(13962, 'Durgapur', '2023-09-27 04:01:00', 'ardent@gmail.com', 'Male', 'Ardent Computech', '123456', '+911234567890', '6T6', '414103');

-- --------------------------------------------------------

--
-- Table structure for table `tblorders`
--

CREATE TABLE `tblorders` (
  `id` int(11) NOT NULL,
  `order_no` int(11) DEFAULT NULL,
  `customer_name` varchar(200) DEFAULT NULL,
  `mobile_number` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `address` varchar(400) DEFAULT NULL,
  `address_type` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `product_name` varchar(400) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_price` varchar(100) DEFAULT NULL,
  `product_selling_price` varchar(100) DEFAULT NULL,
  `product_total_price` varchar(100) DEFAULT NULL,
  `order_status` varchar(100) DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT current_timestamp(),
  `payment_mode` varchar(100) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct`
--

CREATE TABLE `tblproduct` (
  `id` bigint(20) NOT NULL,
  `active` varchar(100) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `image_name` varchar(400) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `price` varchar(200) DEFAULT NULL,
  `mrp_price` varchar(200) DEFAULT NULL,
  `product_category` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_c0r9atamxvbhjjvy5j8da1kam` (`email`);

--
-- Indexes for table `tblcart`
--
ALTER TABLE `tblcart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CART_CUST_FK` (`customer_id`),
  ADD KEY `CART_PROD_FK` (`product_id`);

--
-- Indexes for table `tblcontact`
--
ALTER TABLE `tblcontact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  ADD UNIQUE KEY `UK_dwk6cx0afu8bs9o4t536v1j5v` (`email`),
  ADD UNIQUE KEY `UK_o3uty20c6csmx5y4uk2tc5r4m` (`phone`);

--
-- Indexes for table `tblorders`
--
ALTER TABLE `tblorders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblproduct`
--
ALTER TABLE `tblproduct`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_h3w5r1mx6d0e5c6um32dgyjej` (`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcart`
--
ALTER TABLE `tblcart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblcontact`
--
ALTER TABLE `tblcontact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblorders`
--
ALTER TABLE `tblorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblproduct`
--
ALTER TABLE `tblproduct`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

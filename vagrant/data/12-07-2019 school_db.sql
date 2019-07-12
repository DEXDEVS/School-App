-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2019 at 08:10 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_nature`
--

CREATE TABLE `account_nature` (
  `account_nature_id` int(11) NOT NULL,
  `account_nature_name` varchar(64) NOT NULL,
  `account_nature_status` enum('+ve','-ve') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_nature`
--

INSERT INTO `account_nature` (`account_nature_id`, `account_nature_name`, `account_nature_status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Expense', '-ve', '2016-03-12 00:00:00', '2016-03-12 00:00:00', 1, 1),
(2, 'Income', '+ve', '2016-03-12 00:00:00', '2016-03-12 00:00:00', 1, 1),
(3, 'Capital', '+ve', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(4, 'Liability', '-ve', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(5, 'Assets', '+ve', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `account_register`
--

CREATE TABLE `account_register` (
  `account_register_id` int(11) NOT NULL,
  `account_nature_id` int(11) NOT NULL,
  `account_name` varchar(64) NOT NULL,
  `account_description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_register`
--

INSERT INTO `account_register` (`account_register_id`, `account_nature_id`, `account_name`, `account_description`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(2, 1, 'Utility Bill', 'dfghjjhbgvvgh', '2018-10-02 14:06:50', '0000-00-00 00:00:00', 2, 0),
(3, 1, 'Refreshment', 'dfghjkjhgfdfgh', '2018-10-02 14:09:42', '0000-00-00 00:00:00', 2, 0),
(4, 1, 'Internet Bill', 'dfghjkjhcvb', '2018-10-02 14:14:21', '0000-00-00 00:00:00', 2, 0),
(5, 2, 'Student Fee', 'Student Tuition Fee ', '2019-03-07 17:02:36', '0000-00-00 00:00:00', 3, 0),
(6, 1, 'Furniture', 'Purchase Chair', '2019-04-06 14:15:39', '2019-04-26 20:49:14', 1, 4),
(7, 3, 'Building', 'Institute own building.', '2019-04-15 12:06:06', '0000-00-00 00:00:00', 3, 0),
(8, 2, 'Fun Fair', 'Student fun fair annual party', '2019-04-26 21:12:16', '0000-00-00 00:00:00', 1, 0),
(9, 5, 'Furniture', 'Furniture', '2019-07-03 13:17:34', '0000-00-00 00:00:00', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `trans_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `account_nature` varchar(11) NOT NULL,
  `account_register_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(200) NOT NULL,
  `total_amount` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_transactions`
--

INSERT INTO `account_transactions` (`trans_id`, `branch_id`, `account_nature`, `account_register_id`, `date`, `description`, `total_amount`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 6, 'Expense', 2, '2019-04-26 01:47:44', 'Utility Bill', 123, '2019-04-26 13:48:00', '0000-00-00 00:00:00', 4, 0),
(3, 6, 'Income', 5, '2019-04-26 14:16:17', 'Amount P By Voucher #: 1008', 1000, '2019-04-26 14:16:17', '0000-00-00 00:00:00', 4, 0),
(4, 6, 'Income', 5, '2019-04-26 14:17:41', 'Amount Partially Paid By Voucher #: 1008', 1000, '2019-04-26 14:17:41', '0000-00-00 00:00:00', 4, 0),
(5, 6, 'Income', 5, '2019-04-26 14:21:13', 'Amount Partially Paid By Voucher #: 1008', 10000, '2019-04-26 14:21:13', '0000-00-00 00:00:00', 4, 0),
(6, 6, 'Expense', 6, '2019-05-12 08:45:30', 'Purchase 10 student chairs', 2000, '2019-04-26 20:50:20', '0000-00-00 00:00:00', 4, 0),
(7, 5, 'Expense', 2, '2019-04-26 08:54:08', 'Utility Bill', 10000, '2019-04-26 20:54:27', '0000-00-00 00:00:00', 1, 0),
(8, 5, 'Income', 8, '2019-04-26 09:12:36', 'Fun fair amount of main campus', 5000, '2019-04-26 21:13:13', '0000-00-00 00:00:00', 1, 0),
(9, 5, 'Expense', 4, '2019-05-07 09:10:27', 'Internet Bill', 1000, '2019-04-26 21:14:18', '0000-00-00 00:00:00', 1, 0),
(10, 5, 'Income', 5, '2019-04-26 22:02:34', 'Amount Paid By Voucher #: 1014', 3000, '2019-04-26 22:02:34', '0000-00-00 00:00:00', 1, 0),
(11, 6, 'Income', 5, '2019-07-03 13:45:26', 'Amount Partially Paid By Voucher #: 1001', 2000, '2019-07-03 13:45:26', '0000-00-00 00:00:00', 4, 0),
(13, 6, 'Expense', 4, '2019-07-06 10:11:24', 'Internet bill', 4000, '2019-07-06 10:11:50', '2019-07-06 10:12:14', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Accountant', '121', NULL),
('dexdevs', '1', NULL),
('dexdevs2', '4', NULL),
('Inquiry Head', '48', NULL),
('Principal', '7', NULL),
('Superadmin', '3', NULL),
('Vice Principal', '5', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('Accountant', 1, 'can login', NULL, NULL, NULL, NULL),
('add-institute', 1, 'create institute Name', NULL, NULL, NULL, NULL),
('delete branch', 1, 'Only superadmin can delete branch', NULL, NULL, NULL, NULL),
('dexdevs', 1, 'Admin of the application', NULL, NULL, NULL, NULL),
('dexdevs2', 1, NULL, NULL, NULL, NULL, NULL),
('fee-nav', 1, 'User can manage the fee module,\r\nAccounts,', NULL, NULL, NULL, NULL),
('Inquiry Head', 1, 'Inquiry Head can manage activities of student inquiries only.', NULL, NULL, NULL, NULL),
('inquiry-nav', 1, 'can access this nav', NULL, NULL, NULL, NULL),
('login', 1, 'The user can login in the admin panel.', NULL, NULL, NULL, NULL),
('navigation ', 1, 'Navigation can be access authorized users only.', NULL, NULL, NULL, NULL),
('Principal', 1, 'Principal can manage whole activities in the application except account department', NULL, NULL, NULL, NULL),
('Superadmin', 1, 'Superadmin can manage whole activities in the application.', NULL, NULL, NULL, NULL),
('update-institute-name', 1, 'can update the institute name.', NULL, NULL, NULL, NULL),
('Vice Principal', 1, 'Can view whole reports.', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('Accountant', 'fee-nav'),
('Accountant', 'login'),
('dexdevs', 'login'),
('dexdevs', 'navigation '),
('dexdevs2', 'login'),
('dexdevs2', 'navigation '),
('Inquiry Head', 'add-institute'),
('Inquiry Head', 'inquiry-nav'),
('Inquiry Head', 'login'),
('Principal', 'login'),
('Principal', 'navigation '),
('Superadmin', 'delete branch'),
('Superadmin', 'login'),
('Superadmin', 'navigation '),
('Vice Principal', 'login'),
('Vice Principal', 'navigation ');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL,
  `institute_id` int(11) NOT NULL,
  `branch_code` varchar(32) NOT NULL,
  `branch_name` varchar(32) NOT NULL,
  `branch_type` enum('Franchise','Group') NOT NULL,
  `branch_location` varchar(50) NOT NULL,
  `branch_contact_no` varchar(32) NOT NULL,
  `branch_email` varchar(100) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `branch_head_name` varchar(50) NOT NULL,
  `branch_head_contact_no` varchar(15) NOT NULL,
  `branch_head_email` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `institute_id`, `branch_code`, `branch_name`, `branch_type`, `branch_location`, `branch_contact_no`, `branch_email`, `status`, `branch_head_name`, `branch_head_contact_no`, `branch_head_email`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(5, 2, 'RYK01', 'Primary Branch', 'Group', 'Abbasia Town, RYK', '923-00-00000', 'primary@abcls.edu.pk', 'Active', 'Miss Noreen', '+92-301-2989965', 'noreen@abcls.edu.pk', '2019-06-18 10:07:09', '2019-06-18 10:07:09', 1, 1, 1),
(6, 2, 'RYK02', 'High Campus', 'Group', 'Trust Colony', '030-00-00000', 'high@abcls.edu.pk', 'Active', 'Miss Mariam', '+92-335-1825578', 'mariam@abcls.edu.pk', '2019-06-18 10:15:50', '2019-06-18 10:15:50', 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `concession`
--

CREATE TABLE `concession` (
  `concession_id` int(11) NOT NULL,
  `concession_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `concession`
--

INSERT INTO `concession` (`concession_id`, `concession_name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, '100% Concession ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1, 1),
(2, '90% Concession ', '2019-01-10 08:16:15', '0000-00-00 00:00:00', 1, 1, 1),
(3, '80% Concession', '2019-01-10 08:16:39', '2019-01-10 08:16:39', 1, 1, 1),
(4, '70% Concession', '2019-01-10 08:16:54', '2019-01-10 08:16:54', 1, 1, 1),
(5, '60% Concession', '2019-01-10 08:17:28', '0000-00-00 00:00:00', 1, 0, 1),
(6, '50% Concession', '2019-01-10 08:17:47', '0000-00-00 00:00:00', 1, 0, 1),
(7, '40% Concession ', '2019-01-10 08:18:40', '2019-01-10 08:18:40', 1, 1, 1),
(8, '30% Concession', '2019-01-10 08:18:08', '0000-00-00 00:00:00', 1, 0, 1),
(9, '25% Concession', '2019-01-10 08:18:19', '0000-00-00 00:00:00', 1, 0, 1),
(10, 'Kinship', '2019-01-10 08:18:27', '0000-00-00 00:00:00', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `custom_sms`
--

CREATE TABLE `custom_sms` (
  `id` int(11) NOT NULL,
  `send_to` text NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custom_sms`
--

INSERT INTO `custom_sms` (`id`, `send_to`, `message`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, '923063772105', '<p>Hello,</p><p>This is testing <b><i>SMS.</i></b></p>', '2019-03-08 15:24:28', '0000-00-00 00:00:00', 8, 0),
(2, '923063772106', '<p>\r\n\r\nTesting <b><i>SMS.</i></b>\r\n\r\n<br></p>', '2019-03-08 16:02:54', '0000-00-00 00:00:00', 8, 0),
(3, '923317375027', '<p>Testing SMS from web application.</p>', '2019-03-08 16:08:41', '0000-00-00 00:00:00', 8, 0),
(4, '923063772106', 'This is testing SMS from Brookfield.', '2019-03-08 16:14:43', '0000-00-00 00:00:00', 8, 0),
(5, '923063772105', 'Testing SMS.', '2019-03-08 16:23:59', '0000-00-00 00:00:00', 8, 0),
(6, '923063772106', 'Testing SMS.', '2019-03-08 16:26:31', '0000-00-00 00:00:00', 8, 0),
(8, '923063772106', 'Testing SMS.', '2019-03-08 16:36:02', '0000-00-00 00:00:00', 8, 0),
(9, '923041422508', 'This is testing SMS by DEXDEVS from Brookfield web application.', '2019-03-08 16:37:40', '0000-00-00 00:00:00', 8, 0),
(10, '923063772105', 'This is testing SMS by DEXDEVS from Brookfield web application.', '2019-03-08 16:39:10', '0000-00-00 00:00:00', 8, 0),
(11, '923356383287', 'This is testing SMS by DEXDEVS from Brookfield web application.', '2019-03-08 16:40:13', '0000-00-00 00:00:00', 8, 0),
(12, '923006773327', 'This is testing SMS by DEXDEVS from Brookfield web application.', '2019-03-08 16:41:07', '0000-00-00 00:00:00', 8, 0),
(13, '923006999824', 'This is testing SMS by DEXDEVS from Brookfield web application.\r\n\r\nTask completed by Nauman & Anas.', '2019-03-08 16:42:14', '0000-00-00 00:00:00', 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `department_description` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `department_description`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Computer Science Department', 'Computer Science Department', '2019-02-19 05:42:48', '0000-00-00 00:00:00', 3, 0),
(2, 'Biology Department', 'Biology Department', '2019-02-19 05:43:07', '0000-00-00 00:00:00', 3, 0),
(3, 'Chemistry Department', 'Chemistry Department', '2019-02-19 05:43:25', '0000-00-00 00:00:00', 3, 0),
(4, 'Physics Department', 'Physics Department', '2019-02-19 05:43:44', '0000-00-00 00:00:00', 3, 0),
(5, 'Mathematics Department', 'Mathematics Department', '2019-02-19 05:44:16', '0000-00-00 00:00:00', 3, 0),
(6, 'Urdu Department', 'Urdu Department', '2019-02-19 05:44:42', '0000-00-00 00:00:00', 3, 0),
(7, 'English Department', 'English Department', '2019-02-19 05:45:05', '0000-00-00 00:00:00', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `designation_id` int(11) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`designation_id`, `designation`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(2, 'Vice Principal', '2019-04-27 08:49:01', '2018-10-31 08:17:30', 1, 1, 1),
(3, 'Coordinator', '2018-10-31 08:23:02', '0000-00-00 00:00:00', 1, 0, 1),
(4, 'Teacher', '2018-10-31 08:23:21', '0000-00-00 00:00:00', 1, 0, 1),
(5, 'Security Gaurd', '2018-10-31 09:55:43', '2018-10-31 09:55:43', 1, 1, 1),
(6, 'Accountant', '2018-12-07 06:29:32', '0000-00-00 00:00:00', 1, 0, 1),
(7, 'Librarian', '2019-01-14 17:59:26', '0000-00-00 00:00:00', 0, 0, 1),
(8, 'Office Boy', '2019-02-20 13:33:12', '0000-00-00 00:00:00', 9, 0, 1),
(9, 'HOD', '2019-02-22 07:33:33', '2019-02-22 07:33:33', 9, 8, 1),
(10, 'Clerical Staff', '2019-05-02 09:30:04', '0000-00-00 00:00:00', 1, 0, 1),
(11, 'Executive Administrator', '2019-06-18 11:19:34', '0000-00-00 00:00:00', 0, 0, 1),
(12, 'Computer Operator', '2019-06-18 11:21:50', '0000-00-00 00:00:00', 1, 0, 1),
(13, 'Maid', '2019-06-18 11:22:14', '0000-00-00 00:00:00', 1, 0, 1),
(14, 'Campus Head', '2019-06-18 11:22:43', '0000-00-00 00:00:00', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `emial_id` int(11) NOT NULL,
  `receiver_name` varchar(60) NOT NULL,
  `receiver_email` varchar(120) NOT NULL,
  `email_subject` varchar(255) NOT NULL,
  `email_content` text NOT NULL,
  `email_attachment` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`emial_id`, `receiver_name`, `receiver_email`, `email_subject`, `email_content`, `email_attachment`, `created_at`, `created_by`, `updated_at`, `updated_by`, `delete_status`) VALUES
(1, 'Anas', 'anasshafqat01@gmail.com', 'Welcome', 'This is testing email from yii2...!', 'attachments/1545482896.png', '2018-12-22 12:48:24', 0, '0000-00-00 00:00:00', 0, 1),
(3, 'Anas Shafqat', 'anasshafqat01@gmail.com', 'Wellcome to DEXDEVS', 'This is testing email from Yii2...!', 'attachments/1545483278.png', '2018-12-22 12:54:44', 1, '0000-00-00 00:00:00', 0, 1),
(4, 'Saif ur Rehman', 'saifarshad.6987@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email from Yii2...!', 'attachments/1545483348.png', '2018-12-22 12:55:52', 1, '0000-00-00 00:00:00', 0, 1),
(5, 'Nauman Shahid', 'hwhasmhi1625@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email from Yii2...!', 'attachments/1545483409.png', '2018-12-22 12:56:55', 1, '0000-00-00 00:00:00', 0, 1),
(6, 'Nauman Shahid', 'hwhashmi1625@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email with file attachment from Yii2...!', 'attachments/1545483610.png', '2018-12-22 13:00:16', 1, '0000-00-00 00:00:00', 0, 1),
(7, 'Nadia Gull', 'nadiagull285@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email with file attachment from Yii2...!', 'attachments/1545483685.png', '2018-12-22 13:01:39', 1, '0000-00-00 00:00:00', 0, 1),
(8, 'Kinza Fatima', 'kinza.fatima522@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email with file attachment from Yii2...!', 'attachments/1545483773.png', '2018-12-22 13:02:59', 1, '0000-00-00 00:00:00', 0, 1),
(9, 'Rana Faraz', 'ranafarazahmed@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email with file attachment from Yii2...!	', 'attachments/1545484174.png', '2018-12-22 13:09:38', 1, '0000-00-00 00:00:00', 0, 1),
(10, 'Anas Shafqat', 'anasshafqat01@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email with file attachment from Yii2...!', 'attachments/1545484846.jpg', '2018-12-31 10:46:04', 1, '2018-12-31 10:46:04', 1, 0),
(11, 'anas', 'anasshafqat01@gmail.com', 'helli', 'mlklkk', 'attachments/1545761723.jpg', '2018-12-31 10:44:52', 1, '2018-12-31 10:44:52', 1, 0),
(12, 'Anas', 'anasshafqat01@gmail.com', 'Hello', 'heloo heloo heloo heloo', 'attachments/1545764108.jpg', '2018-12-31 11:11:53', 1, '2018-12-31 11:11:53', 1, 0),
(13, 'Anas', 'anasshafqat01@gmail.com', 'Hello', 'Testing Email....', 'attachments/1545804180.jpg', '2018-12-26 06:03:14', 1, '0000-00-00 00:00:00', 0, 1),
(14, 'khh', 'anasshafqat01@gmail.com', 'hello', 'jkhjkh', 'attachments/1545816221.sql', '2018-12-26 09:23:48', 1, '0000-00-00 00:00:00', 0, 1),
(15, 'Mehtab', 'chmehtab4@gmail.com', 'Hello', 'This is testing Email with file attachment from Yii2....', 'attachments/1546064434.png', '2018-12-29 06:21:12', 1, '0000-00-00 00:00:00', 0, 1),
(16, 'Anas Shafqat', 'anasshafqat01@gmail.com', 'Wellcome', 'Testing Email...', 'attachments/1546066690.png', '2018-12-29 06:58:16', 1, '0000-00-00 00:00:00', 0, 1),
(17, 'Anas Shafqat', 'anasshafqat01@gmail.com', 'Hello', '<h2>Hello Sir,</h2><p><b><i>This is testing email from yii2...</i></b><br></p><p><b><i><br></i></b></p><p><b></b>Regards<b></b></p><p><b><i>Anas Shafqat</i></b></p>', 'attachments/1546068232.mp4', '2018-12-29 07:26:27', 1, '0000-00-00 00:00:00', 0, 1),
(18, 'Rana Faraz', 'ranafarazahmed@gmail.com', 'Testing Email', '<h2><b>Hello Sir,</b></h2><p><b><i></i><i>This is testing Email from Yii2 with text formatting.</i><i></i></b><b></b></p><p><b><i><br></i></b></p><p><b>Note:</b></p><p><ol><li><i>jkhjhj</i></li><li><i>erwrwe</i></li><li><i>werwe</i></li><li><i>were</i></li><li><i>werwerwr</i></li></ol><p>Regards,<br></p><p><b><i>Anas Shafqat</i></b></p></p>', 'attachments/1546069705.jpg', '2018-12-29 07:48:30', 1, '0000-00-00 00:00:00', 0, 1),
(19, 'ans', 'anasshafqat01@gmail.com', 'hello', '<p><b><i>anasshafqat01@gmail.com</i></b><br></p>', 'attachments/1548138607.jpg', '2019-01-22 06:30:23', 9, '0000-00-00 00:00:00', 0, 1),
(20, 'Kinza Mustafah', 'kinza@gmail.com', 'Wellcome', 'Hello....', '', '2019-03-04 09:49:21', 0, '0000-00-00 00:00:00', 0, 1),
(21, 'Kinza Mustafah', 'kinza@gmail.com', 'Wellcome', 'Hello....', '', '2019-03-04 09:49:40', 0, '0000-00-00 00:00:00', 0, 1),
(22, 'Rana Faraz', 'ranafarazahmed@gmail.com', 'Testing', '<p>lkjhgfdsdfghjk</p>', 'attachments/1551947170.jpg', '2019-03-07 08:26:26', 3, '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emp_attendance`
--

CREATE TABLE `emp_attendance` (
  `att_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `att_date` date NOT NULL,
  `check_in` time DEFAULT NULL,
  `check_out` time DEFAULT NULL,
  `attendance` varchar(2) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_departments`
--

CREATE TABLE `emp_departments` (
  `emp_department_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_departments`
--

INSERT INTO `emp_departments` (`emp_department_id`, `emp_id`, `dept_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emp_designation`
--

CREATE TABLE `emp_designation` (
  `emp_designation_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `emp_type_id` int(11) NOT NULL,
  `group_by` enum('Faculty','Non-Faculty') NOT NULL,
  `emp_salary` double NOT NULL,
  `designation_status` enum('Registered','Promotion','Demotion') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_designation`
--

INSERT INTO `emp_designation` (`emp_designation_id`, `emp_id`, `designation_id`, `emp_type_id`, `group_by`, `emp_salary`, `designation_status`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 11, 6, 'Non-Faculty', 15000, 'Registered', 'Active', '2019-06-18 11:29:57', '0000-00-00 00:00:00', 1, 0),
(2, 2, 4, 1, 'Faculty', 15000, 'Registered', 'Active', '2019-06-29 04:45:06', '0000-00-00 00:00:00', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `emp_documents`
--

CREATE TABLE `emp_documents` (
  `emp_document_id` int(11) NOT NULL,
  `emp_info_id` int(11) NOT NULL,
  `emp_document_name` varchar(30) NOT NULL,
  `emp_document` varchar(120) NOT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_info`
--

CREATE TABLE `emp_info` (
  `emp_id` int(11) NOT NULL,
  `emp_branch_id` int(11) NOT NULL,
  `emp_reg_no` varchar(50) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `emp_father_name` varchar(50) NOT NULL,
  `emp_cnic` varchar(15) NOT NULL,
  `emp_contact_no` varchar(15) NOT NULL,
  `emp_date_of_birth` date NOT NULL,
  `emp_perm_address` varchar(200) NOT NULL,
  `emp_temp_address` varchar(200) NOT NULL,
  `emp_marital_status` enum('Single','Married') NOT NULL,
  `emp_fb_ID` varchar(30) NOT NULL,
  `emp_gender` enum('M','F') NOT NULL,
  `emp_photo` varchar(200) NOT NULL,
  `emp_dept_id` int(11) NOT NULL,
  `emp_salary_type` enum('Salaried','Per Lecture') NOT NULL,
  `emp_email` varchar(84) NOT NULL,
  `emp_qualification` varchar(50) NOT NULL,
  `emp_passing_year` int(11) NOT NULL,
  `emp_institute_name` varchar(50) NOT NULL,
  `degree_scan_copy` varchar(200) NOT NULL,
  `emp_cv` varchar(200) NOT NULL,
  `barcode` longblob NOT NULL,
  `emp_religion` varchar(15) NOT NULL,
  `emp_domicile` varchar(30) NOT NULL,
  `emp_status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_info`
--

INSERT INTO `emp_info` (`emp_id`, `emp_branch_id`, `emp_reg_no`, `emp_name`, `emp_father_name`, `emp_cnic`, `emp_contact_no`, `emp_date_of_birth`, `emp_perm_address`, `emp_temp_address`, `emp_marital_status`, `emp_fb_ID`, `emp_gender`, `emp_photo`, `emp_dept_id`, `emp_salary_type`, `emp_email`, `emp_qualification`, `emp_passing_year`, `emp_institute_name`, `degree_scan_copy`, `emp_cv`, `barcode`, `emp_religion`, `emp_domicile`, `emp_status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 5, 'EMP-Y19-1', 'Syed Muzammil Javed', 'Syed Javed Raza', '31303-7130738-7', '+92-321-6716065', '0000-00-00', 'Jinnah Park', 'Jinnah Park', 'Single', 'Muzammil Shah', 'M', '0', 1, 'Salaried', 'syedmuzammiljaved@gmail.com', 'MCS', 2019, 'KFGC', '0', '0', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a3341414147726b6c4551565234587532645036676b525244477677324e4e5441304f7a4d54413046424d6645774555774d314641454d52484d524431507a41517a5163524944557745453848494378514d52444454524d5459532b2f434a33586237617670375a72756d6465754d504e62654c7a33646d62377a7a663154583156315431376b4851722f596758434944414b675365504569366b58355774634348514141453943354577677041344f6f49514b53725930674c4949424877675a4159415143654b51524b4e4c4737684741534c73334151415967514245476f4569626577654159693065784d4167424549514b51524b4e4c4737684741534c73334151415967514245476f4569626577654159693065784d4167424549514b51524b4e4c4737684741534c73334151415967514245476f4569626577654159693065784d4167424549514b51524b4e4c4737684741534c73334151415967514245476f456962657765675834695856786358505441645467635a4b66616233766c6a2b5833376233574f663534627176385857733736724f6e50542f4f33506261397649636654742b2f424547632b4d3831337a4c362b557857487664576e6955383236647677532f6c673132327654526d4f4d58524b6f5a4f455371332b77675573676b694153524c705644537a56414a496a307239794d70434c5337696a486b58616e5a446c6b6659753075347a62494e4970596370597269634769574b32477236746d49635971634c516c76736e3258444d3264527749746b773959676a6b6a556b47314c6d6a3678646e4146646d3155734a5277656154346c6837527a716667355354646e5745736b544d74416c3851672f3165366e78694a47436d73585646487173654955657a53497a3258334743496b5277354b63684f3435716c5351734b737164703975674731794a654439463746775530437130356e715567327950706b4862484653684c7043636561554a42437249555a436e49747277537951615344624f4661474b6b7275576a35716d52646b693753386e57572f6a7369554751646b693753544555615965305139716c6e5232743152536b76306c2f657939622f673252494e4939473667565558736b4c5445534d564a6f514b4d4e61303137492b7367632f55516c67684e6c302f566c4164723756687231375754654133525730755a53445a4d7852355a4f394c66704c38626a7a746f78556670706b4c3675796457594755444b78766d43495648776950686b664249635346784c73676548544f736159396b777a546433734b6a743143385a4330676931596253595a7a5a374567556e335639684a63494a49546a6d796a594276463273493352494a49717771654c63507053532b7a517a626576375145502b7049314a476f49365645515252446c544b66676d786c7155387262523170394358617653664958644d65486f6c6b5135684f4a30596952694a4743756e42446c6d325562434e6f7257366759497342566b4b7368526b4b636a32534b6b314d52794c5669396c6573736273646175654378774b336e42512f5235696c42454b715164306735706837524432694874707176535757766e5a465a556c53376662306b78366b6a7a443964763452644a575a3739665372776b485a494f3651643067357068375244327647743575356233612b7956757a6332306151646b673776745a6c674a53465342414a496b476b6b356951625252736f3241624264736f3474517336572b2b6a4c6e31434f6d52323144775348676b5042496543592f6b6e3352453175363453445237427a785378314c5a5675304461596530673067516158616c5147743777707131597453525467767a5050786b344e6577734e614f745859382f4d54564f395a7554494e4945416b6951615271526d3475646a6a586a594f5644662f78796f614f38496854514743764350512f5257697643444676454f684141434a31674d5170494e424341434b31454f493443485167414a4536514f495545476768414a46614348456342446f51674567644948454b434c5151674567746844674f4168304951435148306a564a58306c36524e496e6b7436516444636476302f536d35492b6c6e526230754f53666b6a483370483066767262762f2b537043386c765333705a6a722b684b51664b78666d52556c667550652f6b32547657562f335333704e306f647050464866755a39664a62306736652f552f7a4f75585276547a384538666276524f503163724e6b5370773662322b517045436d34724762456679616a7a77626d6a64742f7a416a337261532f484e6e732b416553336b706b7350394c516b51575a6630396c4569514352595a624f3762326e7057306b654a3545383763747578386b61512b38377a2f4b557839747059505561625a4d65435355476b414b78736f4c384848696c2f7a42766f4138365937586870614f62787372464831386a6165316e53353834625267543066563933784b2b527873687072394962526a6342377746725937557850532f70307758477475565449564a7864624e304b61564e615a7a3276393339483073797967685845695554795353575363616643726c594d797a766a664c786b6b6931766a31706132503173745461726333542b6a45702b71436255325438654b4d704d6841707342517a74442b535963314a6f327a55356b474d4d4e376a31447a5344556d765333725978566965744b39492b74724a77546c4a365073324b5a696c61456b6b49376a313930316c726e6d65466a666c73643252394a366b7a7951396d6d4b334848665a4461506d4e6266736258726d427045436c457250454d555958734c39357549694d386253433879316b516c546b30747a7356556d7133302b7830576c5a33784f6b6f30747931512f3554785049354b2f435a5453316e396d6a706739527266466379435375366f2b6139584b32766b73573553314d30396a5162784a77466454503145327a4137585a46334e493056395a376e6d6b794a52764a517a6a6e36655562756c34535072546d384645476d4c7430666d64485945494e4c5a496166444c5349416b625a34565a6e5432524741534765486e413633694d4139496e3076366459575a386563514f424d43447a31442f496637756a46515839724141414141456c46546b5375516d4343, '', '', 'Active', '2019-06-21 10:21:50', '2019-06-21 10:21:50', 1, 1, 1),
(2, 6, 'EMP-Y19-2', 'Nadia', 'Gull Ahmed', '31303-8765345-6', '+92-987-6545678', '2019-06-29', 'Jinnah Park', 'Jinnah Park', 'Single', 'Nadia gull', 'F', 'uploads/Nadia_emp_photo.jpg', 1, 'Per Lecture', 'nadia@gmail.com', 'BSCS', 2019, 'Superior', '0', '0', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414e494141414261434159414141444e65676a3341414147766b6c4551565234587532645034676c5252444776786361617978696f706d4a676143676d43676d68694c2b535551454d5245306b727339464450425241526a4654457846497938514d4649754d784c446a4857564d4f5632753236712b33746e707035722b2f6d64756333734f7837383664373570763670723671367036336b3353392f496b46424542674c77536533556d3656763732616f47445141414564415352734149514f4277426948513468725141416e676b624141455269434152787142496d31734867474974486b54414941524345436b45536a5378755952674569624e7745414749454152427142496d31734867474974486b54414941524345436b45536a5378755952674569624e7745414749454152427142496d31734867474974486b54414941524345436b45536a5378755952674569624e7745414749454152427142496d31734867474974486b54414941524345436b45536a53787559526d452b6b342b506a347a6c7737585937326137323378592f7a4e6662756d7966754e336271762b33327537314f616539654a3765397237742b54584764754c355a39737a724f72727154477438592f586b523362777a57374436504f7558636657766a3162434b7a72346a58544a732b4e65622b41704579413139715745734d6f5565305555625a6569424170464e2f4544484f794c547a4a78464575754d6c6530395750464a66525578353950706830464d634759477a42786f6571536a4337436e626b79655a7042676c46534553524f6f3548447853694e656d5046464e636d4b6b732f49486a315143667151643069354c6645776c69434153524c71645163516a6e575a517331686c61584b46474f6e45545a473179344c6370595a4631713564337367496e4e30486b67306b473770656750523357334a6e6462593564624f3574637773395633366f6f343052394b52624a67756f684d6a45534d524931576a54444b4a7456544b45694d52493832535845734e6978694a47476c534c6a4c57377179424c423068735353597a6f72586d566468724e3338385a3745534930427366734f4d695647496b61614968516a47786a5a6347346b6675624e6c6b705a596952694a474b6b716a53786a3065485342414a496b476b4f53475332516c314a4f70495a306431492b32596a7a52725a7531536a5a396c302f5a706232356c6e70454e6a477a6f7573516c30337a333065545a4b4f5639444a2b7348566b37736e6144336748427844346d39765849524978452b707630642f49436e6a6e5a426f67456b53415352446f2f4353324c7677364a755a42325344756b5866497576616c7041475474446e76504941565a437249555a436e497a676d524b4d6a4f3955536b76306c2f6b2f346d2f583169413632485270526476654a7666657a534f687a53446d6d4874455061496531365438366c54315353445351624d6a5a5252364b4f5242324a4f684a31704637386b6f33675a716f355538316e762f55486158666e51554f796f5439567047556e4561394d317056396d592f456643546d493856524b363350475a6d496b596952694a47496b596952694a486d7666692f4652507979754c474c795a4d465273504c5369532f6962396a625162554643455342414a496b476b6337386133357071457165585a4b6e7a70515674686767785249676851674d655242414a496b456b694a53704f6838515442324a4f684a314a4f704945335567526a59777371462b534c616d696a437949556d4451795349424a454776474d42496b456b69415352546849644c536b79396576647666305a744d71673164764731444f47587249416a345248776950686b6642496e66644d4c506b4e586f67456b534153524a7175595756765178303179425270683753376b42357056676d596e5542676d7767635765726f57766e624a6752634e5167636a6742454f687844576741425153534d4141514749414352426f4249457941416b624142454269414145516141434a4e6741424577675a415941414345436d412b4a696b3779553949656b725365394c2b7139736630445342354b2b6c505350704b636c2f564b32585a583053666b63313738753656744a56795239584c592f492b6e587a6f337a2f583653394a716b68384c352b43462b664f7a483176307536584e4a37355164352f54396f4b517653756e6a5a756e7a6d334a38666633786c4f752b6539637a7744347654424d5171584f727a4a442f4c45627668754d47626b534b6978487552306c2f42624c5a396b386c665653495a392f4e634e2b5639466b67714c646a4a4836706b4d4836657a3651737a373259556c765354717169503647704b386262666636666c6e537136556449354a392f304f5366653474647035313378664732752f6969554b6b4472684f446a657132695035595847396552416e673232505a4c54766b537831747a575248696e657a50654c526d36666a57776653726f683652564a66302b51744e5733393266623743466731316c666377756156743954784c754c746e74664e513252717476683871715759445752374c744a7161654b495a73783155527849706d526d325438725a4b4c745357343536746c5665334a3742787646614b35397a4c4a61544c796855417550366536373367746277596952516e713072412b783162664c6d76764b38752b787963446b54714152344f78586159386b68484b4a4a55524a764e494e687a7250556d5068786a4c53477365364e4569353272355a47537878574f52364f6c616372486c2b577964392f31696b4b30744c78537631666131754d6b393335506832436d70656f2f746550587549464c6e46706a78526e6e5649314b5563425a6665467a30623557636d434a6a4c514e724133316230673868316f6f78564375656171337a382f2b754a426a4d632f6e694a48474a5a763358385a33766d2f5739756b5776644149514b5141667331465a31733638676d6534656c6d37566a61746c37567a7165685a4e392b7639395366797642355573544948444e357262356a6f695462313647712b3636544c79765a38717264517152563461667a79344941524c6f7364354c7257425542694c51712f48522b57524341534a666c546e496471794a77517153664a5631663954546f484151754e674c502f51392b2b66586f614b63556a5141414141424a52553545726b4a6767673d3d, 'Islam', 'RYK', 'Active', '2019-06-29 04:45:06', '0000-00-00 00:00:00', 4, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emp_leave`
--

CREATE TABLE `emp_leave` (
  `app_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `leave_type` enum('Casual Leave','Medical Leave','','') NOT NULL,
  `starting_date` date NOT NULL,
  `ending_date` date NOT NULL,
  `applying_date` date NOT NULL,
  `no_of_days` int(5) NOT NULL,
  `leave_purpose` varchar(100) NOT NULL,
  `status` enum('Accepted','Rejected','Pending') NOT NULL,
  `remarks` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_reference`
--

CREATE TABLE `emp_reference` (
  `emp_ref_id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `ref_name` varchar(50) NOT NULL,
  `ref_contact_no` varchar(15) NOT NULL,
  `ref_cnic` varchar(15) NOT NULL,
  `ref_designation` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_reference`
--

INSERT INTO `emp_reference` (`emp_ref_id`, `emp_id`, `ref_name`, `ref_contact_no`, `ref_cnic`, `ref_designation`) VALUES
(1, 1, '', '', '', ''),
(2, 2, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `emp_type`
--

CREATE TABLE `emp_type` (
  `emp_type_id` int(11) NOT NULL,
  `emp_type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_type`
--

INSERT INTO `emp_type` (`emp_type_id`, `emp_type`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'Daily Wages', '2019-03-16 06:47:32', '0000-00-00 00:00:00', 1, 0, 1),
(2, 'Weekly Wages', '2019-03-16 06:47:44', '2019-03-16 06:47:44', 1, 1, 1),
(3, 'Contract Basis', '2019-01-14 18:24:23', '0000-00-00 00:00:00', 1, 0, 1),
(4, 'Permanent ', '2018-12-14 07:52:24', '0000-00-00 00:00:00', 1, 0, 1),
(5, 'Visiting', '2019-02-26 05:02:48', '2019-02-26 05:02:48', 0, 3, 1),
(6, 'Temporary', '2019-06-18 11:29:11', '0000-00-00 00:00:00', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(80) NOT NULL,
  `event_detail` text NOT NULL,
  `event_venue` varchar(100) NOT NULL,
  `event_start_datetime` datetime NOT NULL,
  `event_end_datetime` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_title`, `event_detail`, `event_venue`, `event_start_datetime`, `event_end_datetime`, `created_at`, `created_by`, `updated_at`, `updated_by`, `is_status`) VALUES
(1, 'Last Day', 'Last Day of Janvi', '', '2015-05-30 00:00:00', '2015-05-30 00:00:00', '2015-05-27 15:34:53', 1, '2015-05-27 15:40:30', 1, 'Inactive'),
(2, 'Janvi BDay', 'Happy Birthday Janvi ', '', '2015-07-05 00:00:00', '2015-07-05 00:00:00', '2015-05-27 15:35:38', 1, '2015-05-27 15:40:48', 1, 'Inactive'),
(3, 'Happy Bday', 'Happy Birthday KarmrajSir', '', '2015-07-25 00:00:00', '2015-07-25 00:00:00', '2019-04-20 13:14:50', 3, '0000-00-00 00:00:00', 0, 'Inactive'),
(4, 'Launching New Application', 'Launch of Edusec Yii2', '', '2015-06-02 09:30:00', '2015-06-02 10:00:00', '2015-05-27 15:37:00', 1, '2015-05-27 15:39:37', 1, ''),
(5, 'Meeting for staff ', 'All Staff Members-Meeting', '', '2015-06-09 00:00:00', '2015-06-09 00:00:00', '2015-05-27 15:37:42', 1, NULL, NULL, ''),
(7, 'Celebration Time', 'Celebration Time', '', '2015-06-25 00:00:00', '2015-06-25 00:00:00', '2015-05-27 15:39:12', 1, NULL, NULL, ''),
(8, 'Sports Week', 'Annual sports week of Brookfield Group of Colleges.', 'Shiekh Zaid Sports Complex', '2019-01-31 08:00:05', '2019-02-04 05:00:05', '2019-01-30 16:57:53', 9, '2019-01-30 17:00:43', 9, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `exams_category`
--

CREATE TABLE `exams_category` (
  `exam_category_id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `description` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exams_category`
--

INSERT INTO `exams_category` (`exam_category_id`, `category_name`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Daily Test', 'Daily Class Tests', '2019-03-11 09:34:22', '0000-00-00 00:00:00', 0, 0),
(2, 'Weekly Tests', 'Weekly Class Tests', '2019-03-11 09:34:40', '0000-00-00 00:00:00', 0, 0),
(3, 'First Term', 'First Term Exams', '2019-03-11 09:35:27', '0000-00-00 00:00:00', 0, 0),
(4, 'Mid Term', 'Mid Term Exams', '2019-03-11 09:35:49', '0000-00-00 00:00:00', 0, 0),
(5, 'Final Term', 'Final Term Exams', '2019-03-11 09:36:04', '0000-00-00 00:00:00', 0, 0),
(6, 'December Test', 'December Test / Exams', '2019-03-11 09:36:44', '0000-00-00 00:00:00', 0, 0),
(7, 'Quiz', 'Subject Quiz', '2019-03-11 09:37:15', '0000-00-00 00:00:00', 0, 0),
(8, 'Assignment', 'Class Assignment', '2019-03-11 09:37:35', '0000-00-00 00:00:00', 0, 0),
(9, 'Presentation', 'Class Presentation', '2019-03-11 09:37:56', '0000-00-00 00:00:00', 0, 0),
(10, 'Sendups', 'Class Sendups', '2019-03-11 09:38:11', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exams_criteria`
--

CREATE TABLE `exams_criteria` (
  `exam_criteria_id` int(11) NOT NULL,
  `exam_category_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `exam_start_date` date NOT NULL,
  `exam_end_date` date NOT NULL,
  `exam_start_time` time NOT NULL,
  `exam_end_time` time NOT NULL,
  `exam_room` varchar(15) NOT NULL,
  `exam_status` varchar(50) NOT NULL,
  `exam_type` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exams_criteria`
--

INSERT INTO `exams_criteria` (`exam_criteria_id`, `exam_category_id`, `class_id`, `exam_start_date`, `exam_end_date`, `exam_start_time`, `exam_end_time`, `exam_room`, `exam_status`, `exam_type`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 5, 6, '2019-04-12', '2019-04-19', '08:00:00', '11:00:00', 'Room-1', 'conducted', 'Regular', '2019-04-19 19:13:16', '2019-04-19 19:13:16', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `exams_schedule`
--

CREATE TABLE `exams_schedule` (
  `exam_schedule_id` int(11) NOT NULL,
  `exam_criteria_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `emp_attendance` varchar(2) NOT NULL,
  `date` date NOT NULL,
  `full_marks` int(5) NOT NULL,
  `passing_marks` int(5) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exams_schedule`
--

INSERT INTO `exams_schedule` (`exam_schedule_id`, `exam_criteria_id`, `subject_id`, `emp_id`, `emp_attendance`, `date`, `full_marks`, `passing_marks`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 1, 1, '', '2019-04-12', 100, 33, 'not', '2019-04-19 19:13:16', '2019-04-19 19:13:16', 1, 3),
(2, 1, 2, 3, '', '2019-04-13', 100, 33, 'not', '2019-04-19 19:13:16', '2019-04-19 19:13:16', 1, 3),
(3, 1, 4, 1, '', '2019-04-15', 100, 33, 'result prepared', '2019-04-19 19:13:16', '2019-04-19 19:13:16', 1, 3),
(4, 1, 8, 1, '', '2019-04-16', 100, 33, 'not', '2019-04-19 19:13:16', '2019-04-19 19:13:16', 1, 3),
(5, 1, 7, 4, '', '2019-04-17', 50, 17, 'not', '2019-04-19 19:13:16', '2019-04-19 19:13:16', 1, 3),
(6, 1, 10, 3, '', '2019-04-18', 100, 33, 'not', '2019-04-19 19:13:16', '2019-04-19 19:13:16', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `fee_month_detail`
--

CREATE TABLE `fee_month_detail` (
  `month_detail_id` int(11) NOT NULL,
  `voucher_no` int(11) NOT NULL,
  `month` varchar(10) NOT NULL,
  `monthly_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee_month_detail`
--

INSERT INTO `fee_month_detail` (`month_detail_id`, `voucher_no`, `month`, `monthly_amount`) VALUES
(3, 1001, '2019-07', 5700),
(4, 1002, '2019-07', 1500),
(5, 1003, '2019-07', 7200),
(6, 1004, '2019-07', 1400),
(7, 1005, '2019-07', 2900),
(8, 1006, '2019-07', 0),
(9, 1007, '2019-07', 0),
(10, 1008, '2019-07', 3700),
(11, 1009, '2019-07', 3700),
(12, 1010, '2019-07', 0),
(13, 1011, '2019-07', 3000),
(14, 1012, '2019-07', 1800),
(15, 1013, '2019-07', 1500),
(16, 1014, '2019-07', 2100),
(17, 1015, '2019-07', 4100),
(18, 1016, '2019-07', 3100),
(19, 1017, '2019-07', 3100),
(20, 1018, '2019-07', 6100),
(21, 1019, '2019-07', 2000),
(22, 1020, '2019-07', 1500),
(23, 1021, '2019-07', 1300),
(24, 1022, '2019-07', 2100),
(25, 1023, '2019-07', 2100),
(26, 1024, '2019-07', 1200),
(27, 1025, '2019-07', 1800);

-- --------------------------------------------------------

--
-- Table structure for table `fee_transaction_detail`
--

CREATE TABLE `fee_transaction_detail` (
  `fee_trans_detail_id` int(11) NOT NULL,
  `fee_trans_detail_head_id` int(11) NOT NULL,
  `fee_type_id` int(11) NOT NULL,
  `fee_amount` double DEFAULT NULL,
  `collected_fee_amount` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee_transaction_detail`
--

INSERT INTO `fee_transaction_detail` (`fee_trans_detail_id`, `fee_trans_detail_head_id`, `fee_type_id`, `fee_amount`, `collected_fee_amount`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(3, 3, 2, 1800, 0, '2019-07-09 13:22:33', '0000-00-00 00:00:00', 0, 0, 1),
(4, 3, 8, 3900, 0, '2019-07-09 13:22:33', '0000-00-00 00:00:00', 0, 0, 1),
(5, 4, 2, 1500, 0, '2019-07-09 13:22:33', '0000-00-00 00:00:00', 0, 0, 1),
(6, 5, 2, 1400, 0, '2019-07-09 13:22:33', '0000-00-00 00:00:00', 0, 0, 1),
(7, 5, 8, 5800, 0, '2019-07-09 13:22:33', '0000-00-00 00:00:00', 0, 0, 1),
(8, 6, 2, 1400, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(9, 7, 2, 1400, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(10, 7, 8, 1500, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(11, 8, 2, 0, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(12, 9, 2, 0, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(13, 10, 2, 1800, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(14, 10, 8, 1900, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(15, 11, 2, 1800, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(16, 11, 8, 1900, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(17, 12, 2, 0, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(18, 13, 2, 1500, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(19, 13, 8, 1500, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(20, 14, 2, 1800, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(21, 15, 2, 1500, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(22, 16, 2, 1000, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(23, 16, 8, 1100, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(24, 17, 2, 2000, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(25, 17, 8, 2100, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(26, 18, 2, 1000, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(27, 18, 8, 2100, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(28, 19, 2, 1500, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(29, 19, 8, 1600, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(30, 20, 2, 2000, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(31, 20, 8, 4100, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(32, 21, 2, 2000, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(33, 22, 2, 1500, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(34, 23, 2, 1300, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(35, 24, 2, 1000, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(36, 24, 8, 1100, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(37, 25, 2, 1000, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(38, 25, 8, 1100, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(39, 26, 2, 1200, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1),
(40, 27, 2, 1800, 0, '2019-07-09 13:22:34', '0000-00-00 00:00:00', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fee_transaction_head`
--

CREATE TABLE `fee_transaction_head` (
  `fee_trans_id` int(11) NOT NULL,
  `voucher_no` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `class_name_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `std_name` varchar(75) NOT NULL,
  `month` varchar(20) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `total_amount` double NOT NULL,
  `paid_amount` double NOT NULL,
  `remaining` double NOT NULL,
  `collection_date` datetime NOT NULL,
  `status` enum('Paid','Unpaid','Partially Paid','Added to next month') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee_transaction_head`
--

INSERT INTO `fee_transaction_head` (`fee_trans_id`, `voucher_no`, `branch_id`, `class_name_id`, `session_id`, `section_id`, `std_id`, `std_name`, `month`, `transaction_date`, `total_amount`, `paid_amount`, `remaining`, `collection_date`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(111, 1001, 5, 1, 1, 1, 3, 'RUMAISIA USMAN', '', '2019-07-09 18:22:33', 5700, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:33', '0000-00-00 00:00:00', 1, 0, 1),
(112, 1002, 5, 1, 1, 1, 13, 'MUHAMMAD HUSSAIN KHALID', '', '2019-07-09 18:22:33', 1500, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:33', '0000-00-00 00:00:00', 1, 0, 1),
(113, 1003, 5, 1, 1, 1, 14, 'HAREEM FATIMA', '', '2019-07-09 18:22:33', 7200, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:33', '0000-00-00 00:00:00', 1, 0, 1),
(114, 1004, 5, 1, 1, 1, 15, 'RABAIL FATIMA', '', '2019-07-09 18:22:33', 1400, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:33', '0000-00-00 00:00:00', 1, 0, 1),
(115, 1005, 5, 1, 1, 1, 16, 'ABDULLAH WAQAS', '', '2019-07-09 18:22:34', 2900, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(116, 1006, 5, 1, 1, 1, 17, 'ZOHA KAMRAN', '', '2019-07-09 18:22:34', 0, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(117, 1007, 5, 1, 1, 1, 18, 'M.USAID KHAN', '', '2019-07-09 18:22:34', 0, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(118, 1008, 5, 1, 1, 1, 19, 'IRTABA IJAZ', '', '2019-07-09 18:22:34', 3700, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(119, 1009, 5, 1, 1, 1, 20, 'TEHREEM IJAZ', '', '2019-07-09 18:22:34', 3700, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(120, 1010, 5, 1, 1, 1, 21, 'ZAHRA SHAHZAD', '', '2019-07-09 18:22:34', 0, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(121, 1011, 5, 1, 1, 1, 23, 'AYAAN SHAHID', '', '2019-07-09 18:22:34', 3000, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(122, 1012, 5, 1, 1, 1, 24, 'MUHAMMAD FARAZ', '', '2019-07-09 18:22:34', 1800, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(123, 1013, 5, 1, 1, 1, 25, 'AIZA ABBASI', '', '2019-07-09 18:22:34', 1500, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(124, 1014, 5, 1, 1, 1, 26, 'FATIMA BIBI', '', '2019-07-09 18:22:34', 2100, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(125, 1015, 5, 1, 1, 1, 27, 'DUA FATIMA', '', '2019-07-09 18:22:34', 4100, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(126, 1016, 5, 1, 1, 1, 28, 'ZAMZAMAH', '', '2019-07-09 18:22:34', 3100, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(127, 1017, 5, 1, 1, 1, 29, 'SIMON', '', '2019-07-09 18:22:34', 3100, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(128, 1018, 5, 1, 1, 1, 30, 'MUHAMMAD ZEESHAN', '', '2019-07-09 18:22:34', 6100, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(129, 1019, 5, 1, 1, 1, 32, 'TALHA', '', '2019-07-09 18:22:34', 2000, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(130, 1020, 5, 1, 1, 1, 33, 'HASSAN AFTAB', '', '2019-07-09 18:22:34', 1500, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(131, 1021, 5, 1, 1, 1, 34, 'JANNAT FATIMA', '', '2019-07-09 18:22:34', 1300, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(132, 1022, 5, 1, 1, 1, 35, 'MUHAMMAD ABU BAKAR', '', '2019-07-09 18:22:34', 2100, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(133, 1023, 5, 1, 1, 1, 36, 'HADIA FATIMA', '', '2019-07-09 18:22:34', 2100, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(134, 1024, 5, 1, 1, 1, 37, 'MAHIRA', '', '2019-07-09 18:22:34', 1200, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1),
(135, 1025, 5, 1, 1, 1, 149, 'FURQAN ALI ', '', '2019-07-09 18:22:34', 1800, 0, 0, '0000-00-00 00:00:00', 'Unpaid', '2019-07-09 13:22:34', '0000-00-00 00:00:00', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fee_type`
--

CREATE TABLE `fee_type` (
  `fee_type_id` int(11) NOT NULL,
  `fee_type_name` varchar(64) NOT NULL,
  `fee_type_description` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee_type`
--

INSERT INTO `fee_type` (`fee_type_id`, `fee_type_name`, `fee_type_description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'Admission Fee', 'Student have to pay admission fee only one time', '2018-11-03 06:36:22', '0000-00-00 00:00:00', 1, 0, 1),
(2, 'Tuition Fee', 'Paid on monthly bases', '2018-11-03 06:48:34', '0000-00-00 00:00:00', 1, 0, 1),
(3, 'Absent Fine', 'Absent Fine', '2019-04-09 07:33:52', '2019-04-09 07:33:52', 1, 1, 1),
(4, 'Activity Dues', 'Activity Dues', '2019-04-09 07:33:09', '2019-04-09 07:33:09', 1, 1, 1),
(5, 'Stationary Dues', 'Stationary Dues', '2019-04-09 07:32:21', '2019-04-09 07:32:21', 1, 1, 1),
(6, 'Board/University Fee', 'Board/University Fee', '2019-04-09 07:31:49', '2019-04-09 07:31:49', 1, 1, 1),
(7, 'Exams Fee', 'Examination Fee', '2019-02-28 05:03:40', '0000-00-00 00:00:00', 3, 0, 1),
(8, 'Arrears', 'Previous Pending Dues', '2019-04-09 07:29:28', '2019-04-09 07:29:28', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `grade_name` varchar(5) NOT NULL,
  `grade_from` int(5) NOT NULL,
  `grade_to` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade_id`, `grade_name`, `grade_from`, `grade_to`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'A+', 80, 100, '2019-04-20 07:28:36', '0000-00-00 00:00:00', 1, 3),
(2, 'A', 70, 79, '2019-04-20 07:28:36', '2019-04-20 07:20:57', 1, 3),
(3, 'B', 60, 69, '2019-04-20 07:28:36', '0000-00-00 00:00:00', 1, 3),
(4, 'C', 50, 59, '2019-04-20 07:28:36', '0000-00-00 00:00:00', 1, 3),
(5, 'D', 40, 49, '2019-04-20 07:28:36', '0000-00-00 00:00:00', 1, 3),
(6, 'F', 33, 39, '2019-04-20 07:28:36', '0000-00-00 00:00:00', 1, 3),
(7, 'Fail', 1, 32, '2019-04-20 07:28:37', '2019-04-20 07:20:34', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `installment`
--

CREATE TABLE `installment` (
  `installment_id` int(11) NOT NULL,
  `installment_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `installment`
--

INSERT INTO `installment` (`installment_id`, `installment_name`) VALUES
(1, '1st Installment'),
(2, '2nd Installment'),
(3, '3rd Installment'),
(4, '4th Installment'),
(5, '5th Installment'),
(6, '6th Installment');

-- --------------------------------------------------------

--
-- Table structure for table `institute`
--

CREATE TABLE `institute` (
  `institute_id` int(11) NOT NULL,
  `institute_name` varchar(65) NOT NULL,
  `institute_logo` varchar(200) NOT NULL,
  `institute_account_no` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `institute`
--

INSERT INTO `institute` (`institute_id`, `institute_name`, `institute_logo`, `institute_account_no`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(2, 'ABC Learning School', 'uploads/ABC Learning School_photo.jpg', 'xyz, RYK', '2019-05-02 18:09:01', '2019-05-02 18:09:01', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `institute_name`
--

CREATE TABLE `institute_name` (
  `Institute_name_id` int(11) NOT NULL,
  `Institute_name` varchar(100) NOT NULL,
  `Institutte_address` varchar(120) NOT NULL,
  `Institute_contact_no` varchar(12) NOT NULL,
  `head_name` varchar(20) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marks_details`
--

CREATE TABLE `marks_details` (
  `marks_detail_id` int(11) NOT NULL,
  `marks_head_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `obtained_marks` varchar(20) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks_details`
--

INSERT INTO `marks_details` (`marks_detail_id`, `marks_head_id`, `subject_id`, `obtained_marks`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(7, 1, 4, '80', 68, 0, '2019-04-18 15:10:21', '0000-00-00 00:00:00'),
(8, 2, 4, '90', 68, 0, '2019-04-18 15:10:22', '0000-00-00 00:00:00'),
(9, 3, 4, 'A', 68, 3, '2019-04-18 15:13:13', '2019-04-18 15:13:13');

-- --------------------------------------------------------

--
-- Table structure for table `marks_head`
--

CREATE TABLE `marks_head` (
  `marks_head_id` int(11) NOT NULL,
  `exam_criteria_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `grand_total` double NOT NULL,
  `percentage` varchar(10) NOT NULL,
  `grade` varchar(3) NOT NULL,
  `exam_status` varchar(6) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks_head`
--

INSERT INTO `marks_head` (`marks_head_id`, `exam_criteria_id`, `std_id`, `grand_total`, `percentage`, `grade`, `exam_status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 0, '', '', '', 68, 0, '2019-04-13 06:48:20', '0000-00-00 00:00:00'),
(2, 1, 8, 0, '', '', '', 68, 0, '2019-04-13 06:48:20', '0000-00-00 00:00:00'),
(3, 1, 18, 0, '', '', '', 68, 0, '2019-04-13 06:48:21', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `marks_weightage_details`
--

CREATE TABLE `marks_weightage_details` (
  `weightage_detail_id` int(11) NOT NULL,
  `weightage_head_id` int(11) NOT NULL,
  `weightage_type_id` int(11) NOT NULL,
  `marks` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks_weightage_details`
--

INSERT INTO `marks_weightage_details` (`weightage_detail_id`, `weightage_head_id`, `weightage_type_id`, `marks`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 1, 5, '2019-04-23 09:11:35', '0000-00-00 00:00:00', 1, 0),
(2, 1, 2, 5, '2019-04-23 09:11:35', '0000-00-00 00:00:00', 1, 0),
(3, 1, 3, 5, '2019-04-23 09:11:35', '0000-00-00 00:00:00', 1, 0),
(4, 1, 4, 5, '2019-04-23 09:11:35', '0000-00-00 00:00:00', 1, 0),
(5, 1, 6, 80, '2019-04-23 09:11:35', '0000-00-00 00:00:00', 1, 0),
(6, 2, 1, 5, '2019-04-23 12:26:23', '0000-00-00 00:00:00', 1, 0),
(7, 2, 2, 5, '2019-04-23 12:26:23', '0000-00-00 00:00:00', 1, 0),
(8, 2, 3, 5, '2019-04-23 12:26:23', '0000-00-00 00:00:00', 1, 0),
(9, 2, 4, 5, '2019-04-23 12:26:23', '0000-00-00 00:00:00', 1, 0),
(10, 2, 6, 80, '2019-04-23 12:26:23', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `marks_weightage_head`
--

CREATE TABLE `marks_weightage_head` (
  `marks_weightage_id` int(11) NOT NULL,
  `exam_category_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subjects_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks_weightage_head`
--

INSERT INTO `marks_weightage_head` (`marks_weightage_id`, `exam_category_id`, `class_id`, `subjects_id`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 5, 4, 1, '2019-04-23 11:30:11', '0000-00-00 00:00:00', 1, 0),
(2, 5, 4, 2, '2019-04-23 12:26:23', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `marks_weightage_type`
--

CREATE TABLE `marks_weightage_type` (
  `weightage_type_id` int(11) NOT NULL,
  `weightage_type_name` varchar(30) NOT NULL,
  `weightage_type_description` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks_weightage_type`
--

INSERT INTO `marks_weightage_type` (`weightage_type_id`, `weightage_type_name`, `weightage_type_description`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Attendance', '', '2019-04-22 06:55:40', '0000-00-00 00:00:00', 3, 0),
(2, 'Assignment', '', '2019-04-22 06:55:55', '0000-00-00 00:00:00', 3, 0),
(3, 'Presentation', '', '2019-04-22 06:56:08', '0000-00-00 00:00:00', 3, 0),
(4, 'Dressing', '', '2019-04-22 06:56:16', '0000-00-00 00:00:00', 3, 0),
(5, 'Behaviour', '', '2019-04-22 06:56:27', '0000-00-00 00:00:00', 3, 0),
(6, 'Theory', '', '2019-04-22 06:56:37', '0000-00-00 00:00:00', 3, 0),
(7, 'Practical', '', '2019-04-22 06:57:06', '0000-00-00 00:00:00', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1538846625),
('m130524_201442_init', 1538846629);

-- --------------------------------------------------------

--
-- Table structure for table `msg_of_day`
--

CREATE TABLE `msg_of_day` (
  `msg_of_day_id` int(11) NOT NULL,
  `msg_details` varchar(100) NOT NULL,
  `msg_user_type` enum('Students','Parents','Employees','Others') NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` enum('Active','Inactive') NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `msg_of_day`
--

INSERT INTO `msg_of_day` (`msg_of_day_id`, `msg_details`, `msg_user_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `is_status`, `delete_status`) VALUES
(1, 'Each Day is a GIFT don\'t send it BACK unopened.  Have a nice Day !', 'Students', '2015-05-27 15:21:01', 1, NULL, NULL, 'Active', 1),
(2, 'Every day may not be GOOD but there is something GOOD in every day.', 'Parents', '2015-05-27 15:21:22', 1, NULL, NULL, 'Active', 1),
(3, 'Every ONE wants happiness, No ONE needs pain, But its not possible to get a rainbow.', 'Employees', '2015-05-27 15:21:41', 1, NULL, NULL, 'Active', 1),
(4, 'Smile is the Electricity and Life is a Battery whenever you Smile the Battery gets Charges.', 'Students', '2015-05-27 15:21:59', 1, '2018-12-26 18:11:26', 1, 'Active', 1),
(5, 'The Best for the Group comes when everyone in the group does what’s best for himself AND the group.', 'Students', '2015-05-27 15:22:20', 1, NULL, NULL, 'Active', 1),
(6, 'In life, as in football, you won\'t go far unless you know where the goalposts are.-- Arnold Glasow', 'Students', '2015-05-27 15:24:54', 1, '2018-12-26 18:11:18', 1, 'Active', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL,
  `notice_title` varchar(25) NOT NULL,
  `notice_description` text,
  `notice_start` datetime NOT NULL,
  `notice_end` datetime NOT NULL,
  `notice_user_type` enum('Students','Parents','Employees','Others') NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `sms_id` int(11) NOT NULL,
  `sms_name` varchar(120) NOT NULL,
  `sms_template` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms`
--

INSERT INTO `sms` (`sms_id`, `sms_name`, `sms_template`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'Absent Message', 'Absent Message', '2019-03-07 08:20:16', '0000-00-00 00:00:00', 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_academic_info`
--

CREATE TABLE `std_academic_info` (
  `academic_id` int(11) NOT NULL,
  `std_id` int(11) DEFAULT NULL,
  `std_enroll_status` varchar(6) NOT NULL,
  `class_name_id` int(11) NOT NULL,
  `subject_combination` int(11) NOT NULL,
  `previous_class` varchar(50) NOT NULL,
  `passing_year` int(32) DEFAULT NULL,
  `previous_class_rollno` int(11) DEFAULT NULL,
  `total_marks` int(11) DEFAULT NULL,
  `obtained_marks` int(11) DEFAULT NULL,
  `grades` varchar(10) NOT NULL,
  `percentage` varchar(5) DEFAULT NULL,
  `Institute` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_academic_info`
--

INSERT INTO `std_academic_info` (`academic_id`, `std_id`, `std_enroll_status`, `class_name_id`, `subject_combination`, `previous_class`, `passing_year`, `previous_class_rollno`, `total_marks`, `obtained_marks`, `grades`, `percentage`, `Institute`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(3, 3, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(6, 13, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(7, 14, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(8, 15, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(9, 16, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(10, 17, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(11, 18, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(12, 19, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(13, 20, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(14, 21, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(16, 23, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(17, 24, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(18, 25, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(19, 26, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(20, 27, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(21, 28, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(22, 29, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(23, 30, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(25, 32, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(26, 33, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(27, 34, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(28, 35, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(29, 36, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(30, 37, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(31, 38, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(32, 39, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(33, 40, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(35, 42, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(36, 43, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(37, 44, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(38, 45, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(39, 46, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(40, 47, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(41, 48, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(43, 50, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(44, 51, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(45, 52, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(46, 53, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(47, 54, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(48, 55, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(49, 56, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(50, 57, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(51, 58, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(53, 60, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:21:00', '0000-00-00 00:00:00', 1, 0, 1),
(55, 62, 'signed', 2, 6, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:21:00', '0000-00-00 00:00:00', 1, 0, 1),
(56, 63, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(57, 64, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(58, 65, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(59, 66, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(60, 67, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(61, 68, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(62, 69, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(63, 70, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(65, 72, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(66, 73, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(67, 74, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(68, 75, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(69, 76, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(70, 77, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(71, 78, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(72, 79, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(73, 80, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(74, 81, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(75, 82, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(76, 83, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(77, 84, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(78, 85, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(79, 86, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(80, 87, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(81, 88, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(82, 89, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(83, 90, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(84, 91, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(85, 92, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(86, 93, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(88, 95, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(89, 96, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(90, 97, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(91, 98, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(92, 99, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(93, 100, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(94, 101, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(95, 102, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(96, 103, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(97, 104, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(98, 105, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(99, 106, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(100, 107, 'signed', 3, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(102, 109, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(103, 110, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(104, 111, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(105, 112, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(106, 113, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(107, 114, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(108, 115, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(109, 116, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(110, 117, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(112, 119, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(113, 120, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(114, 121, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(116, 123, 'signed', 4, 7, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(119, 126, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(120, 127, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(121, 128, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(122, 129, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(123, 130, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(124, 131, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(125, 132, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(126, 133, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(127, 134, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(128, 135, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(129, 136, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(130, 137, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(131, 138, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(134, 141, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(135, 142, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(136, 143, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(137, 144, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(138, 145, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(140, 147, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(141, 148, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(142, 149, 'signed', 1, 5, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(143, 150, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(144, 151, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(145, 152, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(146, 153, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(147, 154, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(148, 155, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(149, 156, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(150, 157, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(151, 158, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(152, 159, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(153, 160, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(154, 161, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(155, 162, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(156, 163, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(157, 164, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(158, 165, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(159, 166, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(160, 167, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(161, 168, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(162, 169, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(163, 170, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(164, 171, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(165, 172, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(166, 173, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(167, 174, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(168, 175, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(173, 180, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(174, 181, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(175, 182, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(176, 183, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(177, 184, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(178, 185, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(179, 186, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(180, 187, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(181, 188, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(182, 189, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(183, 190, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(184, 191, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(185, 192, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(186, 193, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(187, 194, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(188, 195, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(189, 196, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(190, 197, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(191, 198, 'unsign', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-06-22 05:37:48', '0000-00-00 00:00:00', 1, 0, 1),
(192, 199, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(193, 200, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(194, 201, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(195, 202, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(196, 203, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(197, 204, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(198, 205, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(199, 206, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(200, 207, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(202, 209, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(203, 210, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(204, 211, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(205, 212, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(206, 213, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(207, 214, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:58:22', '0000-00-00 00:00:00', 1, 0, 1),
(208, 215, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(209, 216, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:04:17', '0000-00-00 00:00:00', 1, 0, 1),
(210, 217, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(211, 218, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(212, 219, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(213, 220, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(214, 221, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(215, 222, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(216, 223, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(217, 224, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(218, 225, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(219, 226, 'signed', 4, 8, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(220, 227, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(222, 229, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(223, 230, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(224, 231, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(225, 232, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(226, 233, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(227, 234, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(228, 235, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(229, 236, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(230, 237, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(231, 238, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(232, 239, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(233, 240, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(234, 241, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(235, 242, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(236, 243, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(237, 244, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(238, 245, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(239, 246, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(240, 247, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(241, 248, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(242, 249, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(243, 250, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(244, 251, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(245, 252, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(246, 253, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:04:17', '0000-00-00 00:00:00', 1, 0, 1),
(247, 254, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(248, 255, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(249, 256, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(250, 257, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(251, 258, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(252, 259, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(253, 260, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(254, 261, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(255, 262, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(256, 263, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(257, 264, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(258, 265, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(259, 266, 'signed', 6, 10, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(260, 267, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(261, 268, 'signed', 5, 9, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(263, 270, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(264, 271, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(265, 272, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(266, 273, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(267, 274, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(268, 275, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(269, 276, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(270, 277, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(271, 278, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(272, 279, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(273, 280, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(274, 281, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(275, 282, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(276, 283, 'signed', 7, 11, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(277, 284, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(278, 285, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(279, 286, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(280, 287, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(282, 289, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(283, 290, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(284, 291, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(285, 292, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(286, 293, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(287, 294, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(288, 295, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(289, 296, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(290, 297, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(291, 298, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(292, 299, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(293, 300, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(294, 301, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(295, 302, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(296, 303, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(298, 305, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(299, 306, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(300, 307, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(301, 308, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(302, 309, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(303, 310, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(304, 311, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(305, 312, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(306, 313, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(307, 314, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(308, 315, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(309, 316, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(310, 317, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(311, 318, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(312, 319, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(313, 320, 'signed', 8, 12, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:11:08', '0000-00-00 00:00:00', 1, 0, 1),
(314, 321, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(315, 322, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(316, 323, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(317, 324, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(318, 325, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(319, 326, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(320, 327, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(321, 328, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(322, 329, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(323, 330, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(324, 331, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(325, 332, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(326, 333, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(327, 334, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(328, 335, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(329, 336, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(330, 337, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(331, 338, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(332, 339, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(333, 340, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(334, 341, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(335, 342, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(336, 343, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(337, 344, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(338, 345, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(339, 346, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(340, 347, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(341, 348, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(342, 349, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(343, 350, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(344, 351, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(345, 352, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(347, 354, 'signed', 9, 17, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(348, 355, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(349, 356, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(350, 357, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(351, 358, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(352, 359, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(353, 360, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(354, 361, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(355, 362, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(356, 363, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(357, 364, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(358, 365, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(359, 366, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(360, 367, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:12', '0000-00-00 00:00:00', 4, 0, 1),
(361, 368, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:12', '0000-00-00 00:00:00', 4, 0, 1),
(362, 369, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:12', '0000-00-00 00:00:00', 4, 0, 1),
(363, 370, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:12', '0000-00-00 00:00:00', 4, 0, 1),
(364, 371, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(365, 372, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(366, 373, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(367, 374, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(368, 375, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(369, 376, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(370, 377, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(371, 378, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(372, 379, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(373, 380, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(374, 381, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(375, 382, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(376, 383, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(377, 384, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(378, 385, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(379, 386, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(380, 387, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(381, 388, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(382, 389, 'signed', 11, 19, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(383, 390, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(384, 391, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(385, 392, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(386, 393, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(387, 394, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(388, 395, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(389, 396, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(390, 397, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(391, 398, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(392, 399, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(393, 400, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(394, 401, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(395, 402, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(396, 403, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(397, 404, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(398, 405, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(399, 406, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(400, 407, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(401, 408, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(402, 409, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(403, 410, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(404, 411, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(405, 412, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(406, 413, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(407, 414, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(408, 415, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(409, 416, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(410, 417, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(411, 418, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(412, 419, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(413, 420, 'signed', 12, 20, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(414, 421, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(415, 422, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(416, 423, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(417, 424, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(418, 425, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(419, 426, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(420, 427, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(421, 428, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(422, 429, 'unsign', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-01 06:35:23', '0000-00-00 00:00:00', 4, 0, 1),
(423, 430, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(424, 431, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(425, 432, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(426, 433, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(427, 434, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(430, 437, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(431, 438, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(432, 439, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(433, 440, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:40:12', '0000-00-00 00:00:00', 4, 0, 1),
(434, 441, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:40:12', '0000-00-00 00:00:00', 4, 0, 1),
(435, 442, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:40:12', '0000-00-00 00:00:00', 4, 0, 1),
(436, 443, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:40:12', '0000-00-00 00:00:00', 4, 0, 1),
(437, 444, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:40:12', '0000-00-00 00:00:00', 4, 0, 1),
(438, 445, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(439, 446, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(440, 447, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(441, 448, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1);
INSERT INTO `std_academic_info` (`academic_id`, `std_id`, `std_enroll_status`, `class_name_id`, `subject_combination`, `previous_class`, `passing_year`, `previous_class_rollno`, `total_marks`, `obtained_marks`, `grades`, `percentage`, `Institute`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(442, 449, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(443, 450, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(444, 451, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(445, 452, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(446, 453, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(447, 454, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(448, 455, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(449, 456, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(450, 457, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(451, 458, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(452, 459, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(453, 460, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(454, 461, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(455, 462, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(456, 463, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(457, 464, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(458, 465, 'signed', 13, 21, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:40:12', '0000-00-00 00:00:00', 4, 0, 1),
(459, 466, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(460, 467, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(461, 468, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(462, 469, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(463, 470, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(464, 471, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(465, 472, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(466, 473, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(467, 474, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(468, 475, 'signed', 14, 22, '', NULL, NULL, NULL, NULL, '', '', '', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_attendance`
--

CREATE TABLE `std_attendance` (
  `std_attend_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `class_name_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `std_class_name`
--

CREATE TABLE `std_class_name` (
  `class_name_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `class_type` enum('School','College','University','Mudarassa','Academy') NOT NULL,
  `class_name` varchar(120) NOT NULL,
  `class_name_description` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_class_name`
--

INSERT INTO `std_class_name` (`class_name_id`, `branch_id`, `class_type`, `class_name`, `class_name_description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 5, 'School', 'Pre-Nursery', 'Pre-Nursery', 'Active', '2019-06-18 10:32:30', '2019-06-18 10:32:30', 1, 1, 1),
(2, 5, 'School', 'Nursery', 'Nursery', 'Active', '2019-03-16 01:28:12', '2019-03-16 01:28:12', 1, 1, 1),
(3, 5, 'School', 'KG', 'KG', 'Active', '2019-06-18 10:33:00', '2019-06-18 10:33:00', 1, 1, 1),
(4, 5, 'School', 'One', 'One', 'Active', '2019-03-16 01:28:33', '2019-03-16 01:28:33', 1, 1, 1),
(5, 5, 'School', 'Two', 'Two', 'Active', '2019-03-16 01:28:45', '2019-03-16 01:28:45', 1, 1, 1),
(6, 5, 'School', 'Three', 'Three', 'Active', '2019-03-16 01:28:56', '2019-03-16 01:28:56', 1, 1, 1),
(7, 5, 'School', 'Four', 'Four', 'Active', '2019-03-16 01:29:09', '2019-03-16 01:29:09', 1, 1, 1),
(8, 5, 'School', 'Five', 'Five', 'Active', '2019-06-18 10:44:29', '2019-06-18 10:44:29', 1, 1, 1),
(9, 6, 'School', '6th', '6th', 'Active', '2019-03-18 05:30:32', '2019-03-16 01:29:36', 1, 1, 1),
(11, 6, 'School', '7th', '7th', 'Active', '2019-03-18 05:45:19', '2019-03-18 05:45:19', 1, 1, 1),
(12, 6, 'School', '8th ', '8th ', 'Active', '2019-03-18 05:45:28', '2019-03-18 05:45:28', 3, 1, 1),
(13, 6, 'School', '9th', '9th', 'Active', '2019-03-18 05:45:36', '2019-03-18 05:45:36', 3, 1, 1),
(14, 6, 'School', '10th', '10th', 'Active', '2019-06-18 10:18:04', '2019-06-18 10:18:04', 1, 1, 1),
(16, 5, 'School', 'Play Group', 'Play Group', 'Active', '2019-06-18 10:44:38', '2019-06-18 10:44:38', 4, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `std_enrollment_detail`
--

CREATE TABLE `std_enrollment_detail` (
  `std_enroll_detail_id` int(11) NOT NULL,
  `std_enroll_detail_head_id` int(11) NOT NULL,
  `std_reg_no` varchar(20) NOT NULL,
  `std_roll_no` varchar(32) NOT NULL,
  `std_enroll_detail_std_id` int(11) NOT NULL,
  `std_enroll_detail_std_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_enrollment_detail`
--

INSERT INTO `std_enrollment_detail` (`std_enroll_detail_id`, `std_enroll_detail_head_id`, `std_reg_no`, `std_roll_no`, `std_enroll_detail_std_id`, `std_enroll_detail_std_name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 1, 'STD-REG-Y19-3', '', 3, 'RUMAISIA USMAN', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(2, 1, 'STD-REG-Y19-13', '', 13, 'MUHAMMAD HUSSAIN KHALID', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(3, 1, 'STD-REG-Y19-14', '', 14, 'HAREEM FATIMA', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(4, 1, 'STD-REG-Y19-15', '', 15, 'RABAIL FATIMA', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(5, 1, 'STD-REG-Y19-16', '', 16, 'ABDULLAH WAQAS', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(6, 1, 'STD-REG-Y19-17', '', 17, 'ZOHA KAMRAN', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(7, 1, 'STD-REG-Y19-18', '', 18, 'M.USAID KHAN', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(8, 1, 'STD-REG-Y19-19', '', 19, 'IRTABA IJAZ', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(9, 1, 'STD-REG-Y19-20', '', 20, 'TEHREEM IJAZ', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(10, 1, 'STD-REG-Y19-21', '', 21, 'ZAHRA SHAHZAD', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(11, 1, 'STD-REG-Y19-23', '', 23, 'AYAAN SHAHID', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(12, 1, 'STD-REG-Y19-24', '', 24, 'MUHAMMAD FARAZ', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(13, 1, 'STD-REG-Y19-25', '', 25, 'AIZA ABBASI', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(14, 1, 'STD-REG-Y19-26', '', 26, 'FATIMA BIBI', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(15, 1, 'STD-REG-Y19-27', '', 27, 'DUA FATIMA', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(16, 1, 'STD-REG-Y19-28', '', 28, 'ZAMZAMAH', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(17, 1, 'STD-REG-Y19-29', '', 29, 'SIMON', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(18, 1, 'STD-REG-Y19-30', '', 30, 'MUHAMMAD ZEESHAN', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(19, 1, 'STD-REG-Y19-32', '', 32, 'TALHA', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(20, 1, 'STD-REG-Y19-33', '', 33, 'HASSAN AFTAB', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(21, 1, 'STD-REG-Y19-34', '', 34, 'JANNAT FATIMA', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(22, 1, 'STD-REG-Y19-35', '', 35, 'MUHAMMAD ABU BAKAR', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(23, 1, 'STD-REG-Y19-36', '', 36, 'HADIA FATIMA', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(24, 1, 'STD-REG-Y19-37', '', 37, 'MAHIRA', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(25, 1, 'STD-REG-Y19-149', '', 149, 'FURQAN ALI ', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(26, 2, 'STD-REG-Y19-38', '', 38, 'ABDUL HADI', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(27, 2, 'STD-REG-Y19-39', '', 39, 'MUHAMMAD AAYAN MEHBOOB', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(28, 2, 'STD-REG-Y19-40', '', 40, 'MUHAMMAD HUZAFIA JAMEEL', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(29, 2, 'STD-REG-Y19-42', '', 42, 'MUBSHIRA KHAN', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(30, 2, 'STD-REG-Y19-43', '', 43, 'MUHAMMAD HAMDAN KHAN', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(31, 2, 'STD-REG-Y19-44', '', 44, 'MUHAMMAD HUMZA IMRAN', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(32, 2, 'STD-REG-Y19-45', '', 45, 'FATIMA TAHIR', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(33, 2, 'STD-REG-Y19-46', '', 46, 'ZAIN AHMAD KHAN', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(34, 2, 'STD-REG-Y19-47', '', 47, 'ABRISH', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(35, 2, 'STD-REG-Y19-48', '', 48, 'MUHAMMAD IBRAHIM', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(36, 2, 'STD-REG-Y19-50', '', 50, 'SHAMAYA  ZAHID', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(37, 2, 'STD-REG-Y19-51', '', 51, 'ALI MUHAMMAD KHAN', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(38, 2, 'STD-REG-Y19-52', '', 52, 'AWAIS FARID', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(39, 2, 'STD-REG-Y19-53', '', 53, 'FARIA FATIMA', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(40, 2, 'STD-REG-Y19-54', '', 54, 'HAMNA ISRAR', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(41, 2, 'STD-REG-Y19-55', '', 55, 'FAJAR IRFAN', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(42, 2, 'STD-REG-Y19-56', '', 56, 'MUHAMMAD FAZAN', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(43, 2, 'STD-REG-Y19-57', '', 57, 'MUHAMMAD AYAN ALI', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(44, 2, 'STD-REG-Y19-58', '', 58, 'RIZWAN ULLAH', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(45, 2, 'STD-REG-Y19-60', '', 60, 'ABU BAKAR', '2019-07-02 09:21:00', '0000-00-00 00:00:00', 1, 0, 1),
(46, 2, 'STD-REG-Y19-62', '', 62, 'SYEDA FARYAL FATIMA BUKHARI', '2019-07-02 09:21:00', '0000-00-00 00:00:00', 1, 0, 1),
(47, 3, 'STD-REG-Y19-63', '', 63, 'FAIZA AAMIR', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(48, 3, 'STD-REG-Y19-64', '', 64, 'RAMEEN SHAHID', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(49, 3, 'STD-REG-Y19-65', '', 65, 'MUHAMMAD ARHAM KHAN', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(50, 3, 'STD-REG-Y19-66', '', 66, 'MUHAMMAD OWAIS', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(51, 3, 'STD-REG-Y19-67', '', 67, 'KINZA KOREEN', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(52, 3, 'STD-REG-Y19-68', '', 68, 'MAHAM ARSHAD', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(53, 3, 'STD-REG-Y19-69', '', 69, 'BUKHTAWER KHAN', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(54, 3, 'STD-REG-Y19-70', '', 70, 'MUHAMMAD FAIZAN', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(55, 3, 'STD-REG-Y19-72', '', 72, 'JAVERIA KHAN', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(56, 3, 'STD-REG-Y19-73', '', 73, 'MUHAMMAD SUBHAN KHAN', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(57, 3, 'STD-REG-Y19-74', '', 74, 'MAHAD AHMAD', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(58, 3, 'STD-REG-Y19-75', '', 75, 'MOMNA SHEHVAR', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(59, 3, 'STD-REG-Y19-76', '', 76, 'MAAZ BILAL', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(60, 3, 'STD-REG-Y19-77', '', 77, 'ABDUR REHMAN', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(61, 3, 'STD-REG-Y19-78', '', 78, 'REHAN SHAKEEL', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(62, 3, 'STD-REG-Y19-79', '', 79, 'SHAMRAYA TAHIR', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(63, 3, 'STD-REG-Y19-80', '', 80, 'NABEEL AHMED', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(64, 3, 'STD-REG-Y19-81', '', 81, 'MUHAMMAD ANAS', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(65, 3, 'STD-REG-Y19-82', '', 82, 'M HAMZA MAQSOOD', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(66, 3, 'STD-REG-Y19-83', '', 83, 'ESHAL KHAN', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(67, 3, 'STD-REG-Y19-84', '', 84, 'ABDUL HADI', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(68, 3, 'STD-REG-Y19-85', '', 85, 'BILAL HAFEEZ', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(69, 3, 'STD-REG-Y19-86', '', 86, 'WAREESHA NADEEM', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(70, 3, 'STD-REG-Y19-87', '', 87, 'KHUSH BAKHT ALI', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(71, 3, 'STD-REG-Y19-88', '', 88, 'HAFSA IMRAN', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(72, 3, 'STD-REG-Y19-89', '', 89, 'ANAYA IMRAN', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(73, 3, 'STD-REG-Y19-90', '', 90, 'MUHAMMAD ALIYAN', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(74, 3, 'STD-REG-Y19-91', '', 91, 'DUA FATIMA', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(75, 3, 'STD-REG-Y19-92', '', 92, 'ABIHA FATIMA', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(76, 3, 'STD-REG-Y19-93', '', 93, 'MUHAMMAD UBAID ULLAH ASIF', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(77, 3, 'STD-REG-Y19-95', '', 95, 'MUHAMMAD ABDULLAH KAMRAN', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(78, 3, 'STD-REG-Y19-96', '', 96, 'MUHAMMAD ABDULLAH BIN JUNAID', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(79, 3, 'STD-REG-Y19-97', '', 97, 'JERALD YOUSAF', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(80, 3, 'STD-REG-Y19-98', '', 98, 'ABEEHA TANVEER', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(81, 3, 'STD-REG-Y19-99', '', 99, 'AFEERA HASSAN', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(82, 3, 'STD-REG-Y19-100', '', 100, 'MUHAMMAD FURKAAN', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(83, 3, 'STD-REG-Y19-101', '', 101, 'MOHAMMAD ABUBAKAR SIDDIQUE', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(84, 3, 'STD-REG-Y19-102', '', 102, 'AIZA FATIMA', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(85, 3, 'STD-REG-Y19-103', '', 103, 'MUHAMMAD AHMED', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(86, 3, 'STD-REG-Y19-104', '', 104, 'MUHAMMAD ABDULLAH', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(87, 3, 'STD-REG-Y19-105', '', 105, 'JAVERIA RASHEED', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(88, 3, 'STD-REG-Y19-106', '', 106, 'ADEEL RIAZ', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(89, 3, 'STD-REG-Y19-107', '', 107, 'EMAN BALOUCH', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(90, 4, 'STD-REG-Y19-109', '', 109, 'SAFA SAJID', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(91, 4, 'STD-REG-Y19-110', '', 110, 'SYEDA UMME HANI', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(92, 4, 'STD-REG-Y19-111', '', 111, 'MUHAMMAD MUSTAFA SHAH', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(93, 4, 'STD-REG-Y19-112', '', 112, 'ABDULLAH TARIQ', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(94, 4, 'STD-REG-Y19-113', '', 113, 'MAHNOOR HUSSAIN', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(95, 4, 'STD-REG-Y19-114', '', 114, 'YORIM LAAZER', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(96, 4, 'STD-REG-Y19-115', '', 115, 'SAIMA', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(97, 4, 'STD-REG-Y19-116', '', 116, 'MAHNOOR FATIMA', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(98, 4, 'STD-REG-Y19-117', '', 117, 'AYESHA TABSSUM', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(99, 4, 'STD-REG-Y19-119', '', 119, 'HIBNA SHAKEEL', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(100, 4, 'STD-REG-Y19-120', '', 120, 'AROOBA ARSHAD', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(101, 4, 'STD-REG-Y19-121', '', 121, 'MUHAMMAD SULAIMAN', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(102, 4, 'STD-REG-Y19-123', '', 123, 'YUSRA BATOOL', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(103, 4, 'STD-REG-Y19-126', '', 126, 'ALIZA FATIMA', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(104, 4, 'STD-REG-Y19-127', '', 127, 'M.ALI ATHER', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(105, 4, 'STD-REG-Y19-128', '', 128, 'NOOR UL AIN', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(106, 4, 'STD-REG-Y19-129', '', 129, 'HIBA IMRAN', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(107, 4, 'STD-REG-Y19-130', '', 130, 'MUHAMMAD AYAN', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(108, 4, 'STD-REG-Y19-131', '', 131, 'MUHAMMAD SUBHAN', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(109, 4, 'STD-REG-Y19-132', '', 132, 'FATIMA KHALID', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(110, 4, 'STD-REG-Y19-133', '', 133, 'UZAIR  UR REHMAN', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(111, 4, 'STD-REG-Y19-134', '', 134, 'MUHAMMAD TAYYAB', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(112, 4, 'STD-REG-Y19-135', '', 135, 'WARISHA IMRAN', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(113, 4, 'STD-REG-Y19-136', '', 136, 'SYED FURQAN ALI BUKHARI', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(114, 4, 'STD-REG-Y19-137', '', 137, 'MUHAMMAD ASAD', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(115, 4, 'STD-REG-Y19-138', '', 138, 'ABDULLAH MUSTAFA', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(116, 4, 'STD-REG-Y19-141', '', 141, 'M.ZOHAIB', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(117, 4, 'STD-REG-Y19-142', '', 142, 'MUHAMMAD HUSNAIN', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(118, 4, 'STD-REG-Y19-143', '', 143, 'ZAINAB FATIMA', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(119, 4, 'STD-REG-Y19-144', '', 144, 'MUNIBA BHATTI', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(120, 4, 'STD-REG-Y19-145', '', 145, 'HUSSAIN KHALID', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(121, 4, 'STD-REG-Y19-147', '', 147, 'MUHAMMAD FAHAD', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(122, 4, 'STD-REG-Y19-166', '', 166, 'HANIYA KHALID', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(123, 4, 'STD-REG-Y19-226', '', 226, 'SAAD NADEEM', '2019-07-02 09:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(124, 5, 'STD-REG-Y19-148', '', 148, 'MICAH ZAHID', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(125, 5, 'STD-REG-Y19-150', '', 150, 'ABDUL MANAN', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(126, 5, 'STD-REG-Y19-151', '', 151, 'SAMAN IRFAN', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(127, 5, 'STD-REG-Y19-152', '', 152, 'HASAAN SHAHID', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(128, 5, 'STD-REG-Y19-153', '', 153, 'TAHA NAVEED', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(129, 5, 'STD-REG-Y19-154', '', 154, 'KHIZAR ABDULLAH WAQAR', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(130, 5, 'STD-REG-Y19-155', '', 155, 'KHADIJA-TUL-KUBRA NAVEED', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(131, 5, 'STD-REG-Y19-156', '', 156, 'HAZA SOHAIL', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(132, 5, 'STD-REG-Y19-157', '', 157, 'MUNTAHA KAMRAN', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(133, 5, 'STD-REG-Y19-158', '', 158, 'REYAN MUDASSIR', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(134, 5, 'STD-REG-Y19-159', '', 159, 'MUHAMMAD HAMZA', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(135, 5, 'STD-REG-Y19-160', '', 160, 'TALHA SAGHEER', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(136, 5, 'STD-REG-Y19-161', '', 161, 'MUHAMMAD ALIYAN', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(137, 5, 'STD-REG-Y19-162', '', 162, 'MAHNOOR NADEEM', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(138, 5, 'STD-REG-Y19-163', '', 163, 'FARMAN ALI KHAN', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(139, 5, 'STD-REG-Y19-164', '', 164, 'ZAINAB ALI', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(140, 5, 'STD-REG-Y19-165', '', 165, 'MUHAMMAD HUMAIN ISLAM', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(141, 5, 'STD-REG-Y19-167', '', 167, 'MINAHIL KHALID', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(142, 5, 'STD-REG-Y19-168', '', 168, 'ABDUL REHMAN', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(143, 5, 'STD-REG-Y19-169', '', 169, 'ALIZAY KAMRAN', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(144, 5, 'STD-REG-Y19-170', '', 170, 'MUHAMMAD AHMAD', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(145, 5, 'STD-REG-Y19-171', '', 171, 'AROOSA FAYYAZ', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(146, 5, 'STD-REG-Y19-172', '', 172, 'ARTAZA JAMIL', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(147, 5, 'STD-REG-Y19-173', '', 173, 'YASIR ALI', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(148, 5, 'STD-REG-Y19-174', '', 174, 'ZAINAB BHATTI', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(149, 5, 'STD-REG-Y19-175', '', 175, 'WAFA FATIMA', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(150, 6, 'STD-REG-Y19-180', '', 180, 'HAFSA TARIQ', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(151, 6, 'STD-REG-Y19-181', '', 181, 'MUHAMMAD TALHA', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(152, 6, 'STD-REG-Y19-182', '', 182, 'AMNA TABASSUM', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(153, 6, 'STD-REG-Y19-183', '', 183, 'SHIFA MADNI', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(154, 6, 'STD-REG-Y19-184', '', 184, 'FURQAN MUDASSIR', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(155, 6, 'STD-REG-Y19-185', '', 185, 'SADIA ARSHAD', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(156, 6, 'STD-REG-Y19-186', '', 186, 'AMMAR UL HASSAN', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(157, 6, 'STD-REG-Y19-187', '', 187, 'HAFSA SAGHEER', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(158, 6, 'STD-REG-Y19-188', '', 188, 'RIMSHA AHMED', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(159, 6, 'STD-REG-Y19-189', '', 189, 'ALISHA ALI', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(160, 6, 'STD-REG-Y19-190', '', 190, 'MUHAMMAD SAAD ATA', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(161, 6, 'STD-REG-Y19-191', '', 191, 'MOHAMMAD HANNAN', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(162, 6, 'STD-REG-Y19-192', '', 192, 'MUHAMMAD KHIZAR EJAZ', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(163, 6, 'STD-REG-Y19-193', '', 193, 'ATIQA KHAN', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(164, 6, 'STD-REG-Y19-194', '', 194, 'MUHAMMAD FARHAN TANVEER', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(165, 6, 'STD-REG-Y19-195', '', 195, 'MUHAMMAD MOSA SHAH', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(166, 6, 'STD-REG-Y19-196', '', 196, 'ABU BAKAR GHAURI', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(167, 6, 'STD-REG-Y19-197', '', 197, 'MEERAB ISLAM', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(168, 6, 'STD-REG-Y19-199', '', 199, 'HURIA', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(169, 6, 'STD-REG-Y19-200', '', 200, 'AYESHA RAFIQ', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(170, 6, 'STD-REG-Y19-201', '', 201, 'MARRIAM FATIMA', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(171, 6, 'STD-REG-Y19-202', '', 202, 'MUHAMMAD FAIZAN ALTAF', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(172, 6, 'STD-REG-Y19-203', '', 203, 'SABOOR-UR-REHMAN', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(173, 6, 'STD-REG-Y19-204', '', 204, 'ABDULLAH', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(174, 6, 'STD-REG-Y19-205', '', 205, 'ALI ASGHAR', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(175, 6, 'STD-REG-Y19-206', '', 206, 'MUHAMMAD ANUS WAQAS', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(176, 6, 'STD-REG-Y19-207', '', 207, 'MUHAMMAD ARHAM SHEHZAD', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(177, 6, 'STD-REG-Y19-209', '', 209, 'MUHAMMAD SALMAN', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(178, 6, 'STD-REG-Y19-210', '', 210, 'ALI SHER', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(179, 6, 'STD-REG-Y19-268', '', 268, 'HARIS ALI', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(180, 7, 'STD-REG-Y19-211', '', 211, 'MUHAMMAD ISMIL', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(181, 7, 'STD-REG-Y19-213', '', 213, 'MUHAMMAD  USMAN', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(182, 7, 'STD-REG-Y19-218', '', 218, 'M TAHA AJMAL', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(183, 7, 'STD-REG-Y19-219', '', 219, 'RAHEEL RIAZ', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(184, 7, 'STD-REG-Y19-220', '', 220, 'MUHAMMAD FAZAL', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(185, 7, 'STD-REG-Y19-221', '', 221, 'ALI MEHDI', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(186, 7, 'STD-REG-Y19-223', '', 223, 'AHMAD ALI TABASSUM', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(187, 7, 'STD-REG-Y19-224', '', 224, 'RAEES LAKHAN TABASSUM', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(188, 7, 'STD-REG-Y19-227', '', 227, 'KHALIL UR REHMAN', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(189, 7, 'STD-REG-Y19-230', '', 230, 'HUSSAIN AHMAD KHAN', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(190, 7, 'STD-REG-Y19-231', '', 231, 'MUHAMMAD MUJEEB IQBAL', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(191, 7, 'STD-REG-Y19-233', '', 233, 'MUHAMMAD MUNEEB', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(192, 7, 'STD-REG-Y19-236', '', 236, 'MUHAMMAD ABDULLAH', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(193, 7, 'STD-REG-Y19-237', '', 237, 'MANAN RAO', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(194, 7, 'STD-REG-Y19-238', '', 238, 'MUHAMMAD FAISAL', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(195, 7, 'STD-REG-Y19-242', '', 242, 'MUHAMMAD AHMAD', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(196, 7, 'STD-REG-Y19-244', '', 244, 'RAEES UBAID ULLAH TABASSUM', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(197, 7, 'STD-REG-Y19-247', '', 247, 'SAMAR ABBASI', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(198, 7, 'STD-REG-Y19-248', '', 248, 'FALAK SHER', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(199, 7, 'STD-REG-Y19-266', '', 266, 'MUHAMMAD MUDASIR MEHBOB', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(200, 8, 'STD-REG-Y19-212', '', 212, 'ISBAH ARSHAD', '2019-07-02 09:58:04', '0000-00-00 00:00:00', 1, 0, 1),
(201, 8, 'STD-REG-Y19-215', '', 215, 'HAFSA MAIRAJ', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(202, 8, 'STD-REG-Y19-217', '', 217, 'ZIRWA ASHRAF', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(203, 8, 'STD-REG-Y19-222', '', 222, 'ZARYAB ZAHID', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(204, 8, 'STD-REG-Y19-225', '', 225, 'AYESHA NAVEED', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(205, 8, 'STD-REG-Y19-229', '', 229, 'SYEDA MAHAM FATIMA BUKHARI', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(206, 8, 'STD-REG-Y19-232', '', 232, 'SUMBAL ATHER', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(207, 8, 'STD-REG-Y19-234', '', 234, 'LAZEEN AHMAD', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(208, 8, 'STD-REG-Y19-235', '', 235, 'OKBA KHAN', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(209, 8, 'STD-REG-Y19-239', '', 239, 'ZONISH SOHAIL', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(210, 8, 'STD-REG-Y19-240', '', 240, 'ZOHA ANWAR', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(211, 8, 'STD-REG-Y19-241', '', 241, 'HAJJAN FATIMA HAMEED', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(212, 8, 'STD-REG-Y19-243', '', 243, 'ZOHA SOHAIL', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(213, 8, 'STD-REG-Y19-245', '', 245, 'MAHNOOR RIAZ', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(214, 8, 'STD-REG-Y19-246', '', 246, 'KHADIJA NAVEED', '2019-07-02 09:58:05', '0000-00-00 00:00:00', 1, 0, 1),
(215, 7, 'STD-REG-Y19-214', '', 214, 'RAZA HUSSAIN', '2019-07-02 09:58:22', '0000-00-00 00:00:00', 1, 0, 1),
(216, 9, 'STD-REG-Y19-249', '', 249, 'MUHAMMAD USMAN', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(217, 9, 'STD-REG-Y19-251', '', 251, 'MUHAMMAD BILAL KHAN', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(218, 9, 'STD-REG-Y19-252', '', 252, 'SAMI UL HAQ', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(219, 9, 'STD-REG-Y19-254', '', 254, 'MUHAMMAD AHMED NADEEM', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(220, 9, 'STD-REG-Y19-256', '', 256, 'QAISER MAQSOOD', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(221, 9, 'STD-REG-Y19-257', '', 257, 'ABUBAKR  RAYAZ', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(222, 9, 'STD-REG-Y19-260', '', 260, 'MUHAMMAD AHMAD', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(223, 9, 'STD-REG-Y19-263', '', 263, 'ANAS REHMAN', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(224, 9, 'STD-REG-Y19-264', '', 264, 'ALI AKBAR', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(225, 9, 'STD-REG-Y19-265', '', 265, 'MUHAMMAD REHAN ABBASI', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(226, 9, 'STD-REG-Y19-267', '', 267, 'MUHAMMAD MOHSIN', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(227, 9, 'STD-REG-Y19-270', '', 270, 'MUHAMMAD AHMAD', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(228, 9, 'STD-REG-Y19-272', '', 272, 'MUHAMMAD ABDUR REHMAN KHAN', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(229, 9, 'STD-REG-Y19-275', '', 275, 'SYED MARIB EJAZ', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(230, 9, 'STD-REG-Y19-276', '', 276, 'MUHAMMAD MURTAJIZ', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(231, 9, 'STD-REG-Y19-277', '', 277, 'JALIL MAQSOOD', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(232, 9, 'STD-REG-Y19-279', '', 279, 'MUHAMMAD TAHA', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(233, 9, 'STD-REG-Y19-280', '', 280, 'MUHAMMAD SAMEER', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(234, 9, 'STD-REG-Y19-283', '', 283, 'ANAS JAMIL', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(235, 10, 'STD-REG-Y19-216', '', 216, 'AMANA TAHIR', '2019-07-02 10:04:17', '0000-00-00 00:00:00', 1, 0, 1),
(236, 10, 'STD-REG-Y19-253', '', 253, 'SHIMLAH  KHAN', '2019-07-02 10:04:17', '0000-00-00 00:00:00', 1, 0, 1),
(237, 10, 'STD-REG-Y19-255', '', 255, 'BISMA IFTIKHAR', '2019-07-02 10:04:17', '0000-00-00 00:00:00', 1, 0, 1),
(238, 10, 'STD-REG-Y19-258', '', 258, 'MEERAB TARIQ', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(239, 10, 'STD-REG-Y19-259', '', 259, 'SAIRA ZEESHAN', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(240, 10, 'STD-REG-Y19-261', '', 261, 'ATTIA MADNI', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(241, 10, 'STD-REG-Y19-262', '', 262, 'AMMARA MADNI', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(242, 10, 'STD-REG-Y19-271', '', 271, 'BASIM ABDULLAH WAQAR', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(243, 10, 'STD-REG-Y19-273', '', 273, 'MANAHIL BILAL', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(244, 10, 'STD-REG-Y19-274', '', 274, 'HALEEMA SADIA', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(245, 10, 'STD-REG-Y19-278', '', 278, 'ANAMTA EJAZ', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(246, 10, 'STD-REG-Y19-281', '', 281, 'KHADIJA JAMEEL', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(247, 10, 'STD-REG-Y19-282', '', 282, 'NOOR FATIMA', '2019-07-02 10:04:18', '0000-00-00 00:00:00', 1, 0, 1),
(248, 11, 'STD-REG-Y19-284', '', 284, 'FAHAD IMRAN', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(249, 11, 'STD-REG-Y19-285', '', 285, 'SABIR HUSSAIN', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(250, 11, 'STD-REG-Y19-286', '', 286, 'BILAWAL KHAN', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(251, 11, 'STD-REG-Y19-289', '', 289, 'MUHAMMAD HUSNAIN', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(252, 11, 'STD-REG-Y19-290', '', 290, 'SYED LAAL MAZHAR BUKHARI', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(253, 11, 'STD-REG-Y19-291', '', 291, 'MUHAMMAD AHTISHAM QADIR', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(254, 11, 'STD-REG-Y19-292', '', 292, 'MUHAMMAD ASAD', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(255, 11, 'STD-REG-Y19-293', '', 293, 'SHAN-E-ALI', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(256, 11, 'STD-REG-Y19-294', '', 294, 'BILAL ISMAIL', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(257, 11, 'STD-REG-Y19-295', '', 295, 'ATTAQ UR REHMAN', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(258, 11, 'STD-REG-Y19-296', '', 296, 'BADAR ABBASI', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(259, 11, 'STD-REG-Y19-297', '', 297, 'ADEEL UR REHMAN', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(260, 11, 'STD-REG-Y19-298', '', 298, 'ZEESHAN IQBAL', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(261, 11, 'STD-REG-Y19-299', '', 299, 'MUHAMMAD MUNEEB ISRAR', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(262, 11, 'STD-REG-Y19-300', '', 300, 'MUHAMMAD TALHA QAYYUM', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(263, 11, 'STD-REG-Y19-301', '', 301, 'AMAR REHAN', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(264, 11, 'STD-REG-Y19-302', '', 302, 'ALI REHAN', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(265, 11, 'STD-REG-Y19-303', '', 303, 'MUHAMMAD ABU BAKAR BHATTI', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(266, 12, 'STD-REG-Y19-250', '', 250, 'HOORIA AHMED', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(267, 12, 'STD-REG-Y19-287', '', 287, 'NAWAL FATIMA', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(268, 12, 'STD-REG-Y19-305', '', 305, 'IQRA SHARIF', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(269, 12, 'STD-REG-Y19-306', '', 306, 'ANOOSH KHAN', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(270, 12, 'STD-REG-Y19-307', '', 307, 'DUA SHAHID', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(271, 12, 'STD-REG-Y19-308', '', 308, 'AIMN WASEEM ZAMAN', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(272, 12, 'STD-REG-Y19-309', '', 309, 'AAIZA AMAN KHAN', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(273, 12, 'STD-REG-Y19-310', '', 310, 'TAYABA IRFAN', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(274, 12, 'STD-REG-Y19-311', '', 311, 'MINAHIL GHORI', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(275, 12, 'STD-REG-Y19-312', '', 312, 'KIRN FAYYAZ', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(276, 12, 'STD-REG-Y19-313', '', 313, 'MUNAZZA MUDASSAR', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(277, 12, 'STD-REG-Y19-314', '', 314, 'UMM-E-HANI', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(278, 12, 'STD-REG-Y19-315', '', 315, 'UMAIMA  KAMRAN', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(279, 12, 'STD-REG-Y19-316', '', 316, 'WARDA MUJTABA', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(280, 12, 'STD-REG-Y19-317', '', 317, 'JAVARIA IMRAN', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(281, 12, 'STD-REG-Y19-318', '', 318, 'SANIA AHMED', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(282, 12, 'STD-REG-Y19-319', '', 319, 'SALEHA MUNIR', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(283, 12, 'STD-REG-Y19-320', '', 320, 'NOOR FATIMA', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(284, 13, 'STD-REG-Y19-321', '', 321, 'MUHMMMAD HASAAN ISLAM', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(285, 13, 'STD-REG-Y19-322', '', 322, 'MUHAMMAD ABDULLAH ASIF', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(286, 13, 'STD-REG-Y19-323', '', 323, 'SUFYAN SHAHID', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(287, 13, 'STD-REG-Y19-324', '', 324, 'MUHAMMAD OMAR', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(288, 13, 'STD-REG-Y19-325', '', 325, 'M.HASEEB JAWAD', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(289, 13, 'STD-REG-Y19-326', '', 326, 'MUHAMMAD KHALID', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(290, 13, 'STD-REG-Y19-327', '', 327, 'HANAN ALI', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(291, 13, 'STD-REG-Y19-328', '', 328, 'SALMAN ANWAR', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(292, 13, 'STD-REG-Y19-329', '', 329, 'M HAMZA NADEEM', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(293, 13, 'STD-REG-Y19-330', '', 330, 'MUHAMMAD ZULQARNAIN', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(294, 13, 'STD-REG-Y19-331', '', 331, 'MUHAMMAD HASSAN MEHMOOD', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(295, 13, 'STD-REG-Y19-332', '', 332, 'MUHAMMAD  JAZIB', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(296, 13, 'STD-REG-Y19-333', '', 333, 'RAEES ABDULLAH TABASSUM', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(297, 13, 'STD-REG-Y19-334', '', 334, 'TAJ MUHAMMAD', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(298, 13, 'STD-REG-Y19-335', '', 335, 'ALI HASSAN', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(299, 13, 'STD-REG-Y19-336', '', 336, 'ALI HADIR ZULQERNAIN', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(300, 13, 'STD-REG-Y19-337', '', 337, 'AHMAD SHEHZAD', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(301, 13, 'STD-REG-Y19-338', '', 338, 'ABDULLAH TAYYAB', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(302, 13, 'STD-REG-Y19-339', '', 339, 'ATTA UR REHMAN', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(303, 14, 'STD-REG-Y19-340', '', 340, 'SHUMAIM ASIF', '2019-07-02 10:16:15', '0000-00-00 00:00:00', 4, 0, 1),
(304, 14, 'STD-REG-Y19-341', '', 341, 'HARMAIN AKBAR', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(305, 14, 'STD-REG-Y19-342', '', 342, 'ZUNAIRA JABBAR', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(306, 14, 'STD-REG-Y19-343', '', 343, 'RUBAB ALI', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(307, 14, 'STD-REG-Y19-344', '', 344, 'RAMEEN ALI', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(308, 14, 'STD-REG-Y19-345', '', 345, 'MAIRA EJAZ', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(309, 14, 'STD-REG-Y19-346', '', 346, 'AYESHA ABBASI', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(310, 14, 'STD-REG-Y19-347', '', 347, 'ESHA NOOR ASIF', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(311, 14, 'STD-REG-Y19-348', '', 348, 'EMAN WASEEM ZAMAN', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(312, 14, 'STD-REG-Y19-349', '', 349, 'ATIKA FATIMA', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(313, 14, 'STD-REG-Y19-350', '', 350, 'LAIBA SHAHID', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(314, 14, 'STD-REG-Y19-351', '', 351, 'LAIBA AHMED', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(315, 14, 'STD-REG-Y19-352', '', 352, 'AMNA KHAN', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(316, 14, 'STD-REG-Y19-354', '', 354, 'AYESHA RASHEED', '2019-07-02 10:16:16', '0000-00-00 00:00:00', 4, 0, 1),
(317, 15, 'STD-REG-Y19-355', '', 355, 'M.ABBAS KHAN', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(318, 15, 'STD-REG-Y19-356', '', 356, 'ABDUL HASEEB SAEED BAJWA', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(319, 15, 'STD-REG-Y19-357', '', 357, 'MUHAMMAD BILAL', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(320, 15, 'STD-REG-Y19-358', '', 358, 'SIBGHAT-ULLAH ZAHID', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(321, 15, 'STD-REG-Y19-359', '', 359, 'REHAN NAVEED', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(322, 15, 'STD-REG-Y19-360', '', 360, 'USAMA ABDUL MUGHEES SHAHID', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(323, 15, 'STD-REG-Y19-361', '', 361, 'MUHAMMAD MUNEEB KHALID', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(324, 15, 'STD-REG-Y19-362', '', 362, 'M.SUFIYAN KHALID', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(325, 15, 'STD-REG-Y19-363', '', 363, 'MUHAMMAD SABIR', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(326, 15, 'STD-REG-Y19-364', '', 364, 'ABDUL REHMAN', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(327, 15, 'STD-REG-Y19-365', '', 365, 'RAEES AHMAD MAHMOOD TABASSUM', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(328, 15, 'STD-REG-Y19-366', '', 366, 'AUN RAZA', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(329, 15, 'STD-REG-Y19-367', '', 367, 'MUHAMMAD DANIAL ZAFAR', '2019-07-02 10:24:12', '0000-00-00 00:00:00', 4, 0, 1),
(330, 15, 'STD-REG-Y19-368', '', 368, 'ALIYAN AAMIR', '2019-07-02 10:24:12', '0000-00-00 00:00:00', 4, 0, 1),
(331, 15, 'STD-REG-Y19-369', '', 369, 'NASIR AHMAD ', '2019-07-02 10:24:12', '0000-00-00 00:00:00', 4, 0, 1),
(332, 15, 'STD-REG-Y19-370', '', 370, 'ABDUL SHAKOOR DURRANI', '2019-07-02 10:24:12', '0000-00-00 00:00:00', 4, 0, 1),
(333, 16, 'STD-REG-Y19-371', '', 371, 'MAHNOOR BHATTI', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(334, 16, 'STD-REG-Y19-372', '', 372, 'AREEBA MAQSOOD', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(335, 16, 'STD-REG-Y19-373', '', 373, 'MARYYAM NAVEED', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(336, 16, 'STD-REG-Y19-374', '', 374, 'LAIBA KHAN', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(337, 16, 'STD-REG-Y19-375', '', 375, 'HAFZA JABBAR', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(338, 16, 'STD-REG-Y19-376', '', 376, 'FIZA ALI', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(339, 16, 'STD-REG-Y19-377', '', 377, 'HANIA ATHER', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(340, 16, 'STD-REG-Y19-378', '', 378, 'SHAHREEN BIBI', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(341, 16, 'STD-REG-Y19-379', '', 379, 'QAIM KHATOON', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(342, 16, 'STD-REG-Y19-380', '', 380, 'JAVERIA QADIR', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(343, 16, 'STD-REG-Y19-381', '', 381, 'UROOJ FATIMA', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(344, 16, 'STD-REG-Y19-382', '', 382, 'MALIKA ARSHAD', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(345, 16, 'STD-REG-Y19-383', '', 383, 'EMAN HAFEEZ', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(346, 16, 'STD-REG-Y19-384', '', 384, 'KASHAF SAJID', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(347, 16, 'STD-REG-Y19-385', '', 385, 'FATIMA-TU-ZAHRA', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(348, 16, 'STD-REG-Y19-386', '', 386, 'ALINA ALTAF', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(349, 16, 'STD-REG-Y19-387', '', 387, 'MARIAM BIBI', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(350, 16, 'STD-REG-Y19-388', '', 388, 'IQRA REHAN', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(351, 16, 'STD-REG-Y19-389', '', 389, 'ZUNAISHA BHATTI', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(352, 17, 'STD-REG-Y19-390', '', 390, 'MOEEZ AHMED', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(353, 17, 'STD-REG-Y19-391', '', 391, 'ALLAH NAWAZ', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(354, 17, 'STD-REG-Y19-392', '', 392, 'MUHAMMAD HARIS AFAQ', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(355, 17, 'STD-REG-Y19-393', '', 393, 'KHURRAM SOHAIL', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(356, 17, 'STD-REG-Y19-394', '', 394, 'HAMZA SOHAIL', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(357, 17, 'STD-REG-Y19-395', '', 395, 'MUHAMMAD ABDULLAH NAZIM', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(358, 17, 'STD-REG-Y19-396', '', 396, 'NOMAN ANWAR', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(359, 17, 'STD-REG-Y19-397', '', 397, 'MUHAMMAD FAHEEM', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(360, 17, 'STD-REG-Y19-398', '', 398, 'MUHAMMAD ATIF', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(361, 17, 'STD-REG-Y19-399', '', 399, 'MUHAMMAD KAIF', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(362, 17, 'STD-REG-Y19-400', '', 400, 'RAHEEL AHMAD', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(363, 17, 'STD-REG-Y19-401', '', 401, 'MOHAMMAD HASSAN ZAFAR', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(364, 17, 'STD-REG-Y19-402', '', 402, 'ABDUL SAMAD', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(365, 17, 'STD-REG-Y19-403', '', 403, 'BEHROZ ALI', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(366, 17, 'STD-REG-Y19-404', '', 404, 'MUHAMMAD ABU BAKAR', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(367, 17, 'STD-REG-Y19-405', '', 405, 'MUHAMMAD AHMAD', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(368, 17, 'STD-REG-Y19-406', '', 406, 'FAHAD TAYYAB', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(369, 17, 'STD-REG-Y19-407', '', 407, 'MUHAMMAD ZEESHAN SHAHID', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(370, 18, 'STD-REG-Y19-408', '', 408, 'ALISHBA ALI', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(371, 18, 'STD-REG-Y19-409', '', 409, 'AYESHA RIZWAN', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(372, 18, 'STD-REG-Y19-410', '', 410, 'ALIZA KHAN', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(373, 18, 'STD-REG-Y19-411', '', 411, 'MINAHIL ATHER', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(374, 18, 'STD-REG-Y19-412', '', 412, 'ZAINAB SHEHZAD', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(375, 18, 'STD-REG-Y19-413', '', 413, 'SANA FATIMA', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(376, 18, 'STD-REG-Y19-414', '', 414, 'FATMA SHAHZAD', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(377, 18, 'STD-REG-Y19-415', '', 415, 'ALEEZA TABASSUM', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(378, 18, 'STD-REG-Y19-416', '', 416, 'LAIBA HAMEED', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(379, 18, 'STD-REG-Y19-417', '', 417, 'AATIKA HAMEED', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(380, 18, 'STD-REG-Y19-418', '', 418, 'IQRA HAMEED', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(381, 18, 'STD-REG-Y19-419', '', 419, 'ALISHA IMRAN', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(382, 18, 'STD-REG-Y19-420', '', 420, 'ALISHBA KHALID', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(383, 19, 'STD-REG-Y19-421', '', 421, 'AMJAD ALI', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(384, 19, 'STD-REG-Y19-422', '', 422, 'ZAIN ALI', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(385, 19, 'STD-REG-Y19-423', '', 423, 'MUHAMMAD USMAN JAWAD', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(386, 19, 'STD-REG-Y19-424', '', 424, 'HAIDER ALI', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(387, 19, 'STD-REG-Y19-425', '', 425, 'ABDUL AHAD SAEED', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(388, 19, 'STD-REG-Y19-426', '', 426, 'ADNAN FAYYAZ', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(389, 19, 'STD-REG-Y19-427', '', 427, 'MUHAMMAD HUSSAIN RAZA', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(390, 19, 'STD-REG-Y19-428', '', 428, 'YASIR ALI', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(391, 19, 'STD-REG-Y19-430', '', 430, 'MOIZ JAVED', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(392, 19, 'STD-REG-Y19-431', '', 431, 'ALI RAZA', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(393, 19, 'STD-REG-Y19-432', '', 432, 'MUHAMMAD ZAIN TAHIR', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(394, 19, 'STD-REG-Y19-433', '', 433, 'AASHAN ALI', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(395, 19, 'STD-REG-Y19-434', '', 434, 'M. ABDULLAH', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(396, 19, 'STD-REG-Y19-437', '', 437, 'MUHAMMAD UMAIR', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(397, 19, 'STD-REG-Y19-438', '', 438, 'SAIF UR REHMAN', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(398, 19, 'STD-REG-Y19-439', '', 439, 'SUFIYAN AZAM', '2019-07-02 10:39:40', '0000-00-00 00:00:00', 4, 0, 1),
(399, 20, 'STD-REG-Y19-440', '', 440, 'AFSHAN RASHEED', '2019-07-02 10:40:12', '0000-00-00 00:00:00', 4, 0, 1),
(400, 20, 'STD-REG-Y19-441', '', 441, 'SAIRA AYYAZ', '2019-07-02 10:40:12', '0000-00-00 00:00:00', 4, 0, 1),
(401, 20, 'STD-REG-Y19-442', '', 442, 'AMNA JAVED', '2019-07-02 10:40:12', '0000-00-00 00:00:00', 4, 0, 1),
(402, 20, 'STD-REG-Y19-443', '', 443, 'AYESHA BIBI', '2019-07-02 10:40:12', '0000-00-00 00:00:00', 4, 0, 1),
(403, 20, 'STD-REG-Y19-444', '', 444, 'SANA AMEEN', '2019-07-02 10:40:12', '0000-00-00 00:00:00', 4, 0, 1),
(404, 20, 'STD-REG-Y19-465', '', 465, 'NOOR -UL- AIN', '2019-07-02 10:40:12', '0000-00-00 00:00:00', 4, 0, 1),
(405, 21, 'STD-REG-Y19-445', '', 445, 'MOHAMMAD ADIL KHAN', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(406, 21, 'STD-REG-Y19-446', '', 446, 'MUHAMMAD ESSA KHAN', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(407, 21, 'STD-REG-Y19-447', '', 447, 'MOHSIN SAEED', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(408, 21, 'STD-REG-Y19-448', '', 448, 'YASIR RAZA', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(409, 21, 'STD-REG-Y19-449', '', 449, 'BASIT ALEEM', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(410, 21, 'STD-REG-Y19-450', '', 450, 'TANVEER HUSSAIN', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(411, 21, 'STD-REG-Y19-451', '', 451, 'ALI HAMZA', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(412, 21, 'STD-REG-Y19-452', '', 452, 'MUHAMMAD ZAMEER UL HASSAN', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(413, 21, 'STD-REG-Y19-453', '', 453, 'MUHAMMAD FARHAN FAYYAZ', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(414, 21, 'STD-REG-Y19-454', '', 454, 'SAIFULLAH ZIA', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(415, 21, 'STD-REG-Y19-455', '', 455, 'MUHAMMAD AWAIS', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(416, 21, 'STD-REG-Y19-456', '', 456, 'ALI HASSAN', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(417, 21, 'STD-REG-Y19-457', '', 457, 'MUHAMMAD NOSHAD ALI', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(418, 21, 'STD-REG-Y19-458', '', 458, 'TAYYAB HUSSAIN', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(419, 21, 'STD-REG-Y19-459', '', 459, 'USMAN SHOUKAT', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(420, 21, 'STD-REG-Y19-460', '', 460, 'HAMZA HAFEEZ', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(421, 21, 'STD-REG-Y19-461', '', 461, 'MUHAMMAD ARAIZ ARSHAD', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(422, 21, 'STD-REG-Y19-462', '', 462, 'ZAMIN ALI', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(423, 21, 'STD-REG-Y19-463', '', 463, 'ARSLAN ASGHAR', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(424, 22, 'STD-REG-Y19-464', '', 464, 'MAHAM AZEEM', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(425, 22, 'STD-REG-Y19-466', '', 466, 'UZMA JABBAR', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(426, 22, 'STD-REG-Y19-467', '', 467, 'HAFSA REHMAN', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(427, 22, 'STD-REG-Y19-468', '', 468, 'ZUNAIRA FAYYAZ', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(428, 22, 'STD-REG-Y19-469', '', 469, 'SIDRA TUL MUNTAHA', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(429, 22, 'STD-REG-Y19-470', '', 470, 'LAIBA  AZHAR', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(430, 22, 'STD-REG-Y19-471', '', 471, 'NOOR LATIF', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(431, 22, 'STD-REG-Y19-472', '', 472, 'KAINAT TABASSUM', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(432, 22, 'STD-REG-Y19-473', '', 473, 'AQSA KHALID', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(433, 22, 'STD-REG-Y19-474', '', 474, 'MALAIKA NIZAM', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1),
(434, 22, 'STD-REG-Y19-475', '', 475, 'UZMA YASEEN', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_enrollment_head`
--

CREATE TABLE `std_enrollment_head` (
  `std_enroll_head_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `class_name_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `std_enroll_head_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_enrollment_head`
--

INSERT INTO `std_enrollment_head` (`std_enroll_head_id`, `branch_id`, `class_name_id`, `session_id`, `section_id`, `std_enroll_head_name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 5, 1, 1, 1, 'Pre-Nursery-2019-2020-Blue', '2019-07-02 09:19:28', '0000-00-00 00:00:00', 1, 0, 1),
(2, 5, 2, 1, 2, 'Nursery-2019-2020-Blue', '2019-07-02 09:20:59', '0000-00-00 00:00:00', 1, 0, 1),
(3, 5, 3, 1, 3, 'KG-2019-2020-Blue', '2019-07-02 09:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(4, 5, 4, 1, 4, 'One-2019-2020-Blue', '2019-07-02 09:24:40', '0000-00-00 00:00:00', 1, 0, 1),
(5, 5, 5, 1, 6, 'Two-2019-2020-Blue', '2019-07-02 09:36:08', '0000-00-00 00:00:00', 1, 0, 1),
(6, 5, 5, 1, 13, 'Two-2019-2020-Red', '2019-07-02 09:41:27', '0000-00-00 00:00:00', 1, 0, 1),
(7, 5, 6, 1, 7, 'Three-2019-2020-Blue (Boys)', '2019-07-02 09:56:41', '0000-00-00 00:00:00', 1, 0, 1),
(8, 5, 6, 1, 14, 'Three-2019-2020-Red (Girls)', '2019-07-02 09:58:04', '0000-00-00 00:00:00', 1, 0, 1),
(9, 5, 7, 1, 15, 'Four-2019-2020-Blue (Boys)', '2019-07-02 10:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(10, 5, 7, 1, 8, 'Four-2019-2020-Red (Girls)', '2019-07-02 10:04:17', '0000-00-00 00:00:00', 1, 0, 1),
(11, 5, 8, 1, 10, 'Five-2019-2020-Blue (Boys)', '2019-07-02 10:10:33', '0000-00-00 00:00:00', 1, 0, 1),
(12, 5, 8, 1, 9, 'Five-2019-2020-Red (Girls)', '2019-07-02 10:11:07', '0000-00-00 00:00:00', 1, 0, 1),
(13, 6, 9, 2, 11, '6th-2019-2020 -Boys', '2019-07-02 10:14:39', '0000-00-00 00:00:00', 4, 0, 1),
(14, 6, 9, 2, 12, '6th-2019-2020 -Girls', '2019-07-02 10:16:15', '0000-00-00 00:00:00', 4, 0, 1),
(15, 6, 11, 2, 16, '7th-2019-2020 -Boys', '2019-07-02 10:24:11', '0000-00-00 00:00:00', 4, 0, 1),
(16, 6, 11, 2, 17, '7th-2019-2020 -Girls', '2019-07-02 10:24:35', '0000-00-00 00:00:00', 4, 0, 1),
(17, 6, 12, 2, 18, '8th -2019-2020 -Boys', '2019-07-02 10:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(18, 6, 12, 2, 19, '8th -2019-2020 -Girls', '2019-07-02 10:33:04', '0000-00-00 00:00:00', 4, 0, 1),
(19, 6, 13, 2, 20, '9th-2019-2020 -Boys', '2019-07-02 10:39:39', '0000-00-00 00:00:00', 4, 0, 1),
(20, 6, 13, 2, 21, '9th-2019-2020 -Girls', '2019-07-02 10:40:12', '0000-00-00 00:00:00', 4, 0, 1),
(21, 6, 14, 2, 22, '10th-2019-2020 -Boys', '2019-07-02 10:42:22', '0000-00-00 00:00:00', 4, 0, 1),
(22, 6, 14, 2, 23, '10th-2019-2020 -Girls', '2019-07-02 10:43:07', '0000-00-00 00:00:00', 4, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_fee_details`
--

CREATE TABLE `std_fee_details` (
  `fee_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `admission_fee` double NOT NULL,
  `addmission_fee_discount` int(11) NOT NULL,
  `net_addmission_fee` double NOT NULL,
  `concession_id` int(11) NOT NULL,
  `tuition_fee` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_fee_details`
--

INSERT INTO `std_fee_details` (`fee_id`, `std_id`, `admission_fee`, `addmission_fee_discount`, `net_addmission_fee`, `concession_id`, `tuition_fee`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(3, 3, 5000, 5000, 0, 200, 1800, '2019-06-20 01:02:50', '0000-00-00 00:00:00', 1, 0, 1),
(6, 13, 5000, 5000, 0, 500, 1500, '2019-06-21 00:42:20', '0000-00-00 00:00:00', 1, 0, 1),
(7, 14, 5000, 5000, 0, 600, 1400, '2019-06-21 00:48:23', '0000-00-00 00:00:00', 1, 0, 1),
(8, 15, 5000, 5000, 0, 600, 1400, '2019-06-21 00:51:08', '0000-00-00 00:00:00', 1, 0, 1),
(9, 16, 5000, 5000, 0, 600, 1400, '2019-06-21 00:52:42', '0000-00-00 00:00:00', 1, 0, 1),
(10, 17, 5000, 5000, 0, 2000, 0, '2019-06-21 00:54:43', '0000-00-00 00:00:00', 1, 0, 1),
(11, 18, 5000, 5000, 0, 2000, 0, '2019-06-21 00:57:20', '0000-00-00 00:00:00', 1, 0, 1),
(12, 19, 5000, 1000, 0, 200, 1800, '2019-07-09 13:07:12', '0000-00-00 00:00:00', 1, 0, 1),
(13, 20, 5000, 1000, 0, 200, 1800, '2019-07-09 13:07:21', '0000-00-00 00:00:00', 1, 0, 1),
(14, 21, 5000, 5000, 0, 2000, 0, '2019-06-21 01:04:09', '0000-00-00 00:00:00', 1, 0, 1),
(15, 22, 5000, 5000, 0, 0, 2000, '2019-06-21 01:06:25', '0000-00-00 00:00:00', 1, 0, 1),
(16, 23, 5000, 5000, 0, 500, 1500, '2019-06-21 01:07:53', '0000-00-00 00:00:00', 1, 0, 1),
(17, 24, 5000, 5000, 0, 200, 1800, '2019-06-21 01:09:16', '0000-00-00 00:00:00', 1, 0, 1),
(18, 25, 5000, 5000, 0, 500, 1500, '2019-06-21 01:10:38', '0000-00-00 00:00:00', 1, 0, 1),
(19, 26, 5000, 5000, 0, 1000, 1000, '2019-06-21 01:11:54', '0000-00-00 00:00:00', 1, 0, 1),
(20, 27, 5000, 2000, 0, 0, 2000, '2019-07-09 13:07:25', '0000-00-00 00:00:00', 1, 0, 1),
(21, 28, 5000, 5000, 0, 1000, 1000, '2019-06-21 01:15:08', '0000-00-00 00:00:00', 1, 0, 1),
(22, 29, 5000, 5000, 0, 500, 1500, '2019-06-21 01:17:31', '0000-00-00 00:00:00', 1, 0, 1),
(23, 30, 5000, 5000, 0, 0, 2000, '2019-06-21 01:18:50', '0000-00-00 00:00:00', 1, 0, 1),
(24, 31, 5000, 5000, 0, 0, 2000, '2019-06-21 01:20:07', '0000-00-00 00:00:00', 1, 0, 1),
(25, 32, 5000, 5000, 0, 0, 2000, '2019-06-21 01:21:33', '0000-00-00 00:00:00', 1, 0, 1),
(26, 33, 5000, 5000, 0, 500, 1500, '2019-06-21 01:23:23', '0000-00-00 00:00:00', 1, 0, 1),
(27, 34, 5000, 5000, 0, 700, 1300, '2019-06-21 01:24:52', '0000-00-00 00:00:00', 1, 0, 1),
(28, 35, 5000, 5000, 0, 1000, 1000, '2019-06-21 01:26:03', '0000-00-00 00:00:00', 1, 0, 1),
(29, 36, 5000, 5000, 0, 1000, 1000, '2019-06-21 01:30:30', '0000-00-00 00:00:00', 1, 0, 1),
(30, 37, 5000, 5000, 0, 800, 1200, '2019-06-21 01:32:13', '0000-00-00 00:00:00', 1, 0, 1),
(31, 38, 5000, 5000, 0, 1000, 1000, '2019-06-21 02:23:46', '0000-00-00 00:00:00', 1, 0, 1),
(32, 39, 5000, 5000, 0, 2000, 0, '2019-06-21 02:26:14', '0000-00-00 00:00:00', 1, 0, 1),
(33, 40, 5000, 5000, 0, 700, 1300, '2019-06-21 02:27:53', '0000-00-00 00:00:00', 1, 0, 1),
(34, 41, 5000, 5000, 0, 700, 1300, '2019-06-21 02:31:49', '0000-00-00 00:00:00', 1, 0, 1),
(35, 42, 5000, 5000, 0, 500, 1500, '2019-06-21 02:39:18', '0000-00-00 00:00:00', 1, 0, 1),
(36, 43, 5000, 5000, 0, 1000, 1000, '2019-06-21 02:48:57', '0000-00-00 00:00:00', 1, 0, 1),
(37, 44, 5000, 5000, 0, 1000, 1000, '2019-06-21 03:13:17', '0000-00-00 00:00:00', 1, 0, 1),
(38, 45, 5000, 5000, 0, 500, 1500, '2019-06-21 03:16:19', '0000-00-00 00:00:00', 1, 0, 1),
(39, 46, 5000, 5000, 0, 500, 1500, '2019-06-21 03:17:57', '0000-00-00 00:00:00', 1, 0, 1),
(40, 47, 5000, 5000, 0, 500, 1500, '2019-06-21 03:20:08', '0000-00-00 00:00:00', 1, 0, 1),
(41, 48, 5000, 5000, 0, 1000, 1000, '2019-06-21 03:21:33', '0000-00-00 00:00:00', 1, 0, 1),
(42, 49, 5000, 1000, 0, 1800, 1800, '2019-07-09 13:07:31', '0000-00-00 00:00:00', 1, 0, 1),
(43, 50, 5000, 2500, 0, 600, 1400, '2019-07-09 13:07:34', '0000-00-00 00:00:00', 1, 0, 1),
(44, 51, 5000, 3000, 0, 500, 1500, '2019-07-09 13:07:37', '0000-00-00 00:00:00', 1, 0, 1),
(45, 52, 5000, 5000, 0, 1000, 1000, '2019-06-21 04:14:43', '0000-00-00 00:00:00', 1, 0, 1),
(46, 53, 5000, 1500, 0, 200, 1800, '2019-07-09 13:07:40', '0000-00-00 00:00:00', 1, 0, 1),
(47, 54, 5000, 1000, 0, 500, 1500, '2019-07-09 13:07:43', '0000-00-00 00:00:00', 1, 0, 1),
(48, 55, 5000, 3000, 0, 500, 1500, '2019-07-09 13:07:46', '0000-00-00 00:00:00', 1, 0, 1),
(49, 56, 5000, 5000, 0, 2000, 0, '2019-06-21 04:26:54', '0000-00-00 00:00:00', 1, 0, 1),
(50, 57, 5000, 5000, 0, 1000, 1000, '2019-06-21 04:28:25', '0000-00-00 00:00:00', 1, 0, 1),
(51, 58, 5000, 5000, 0, 500, 1500, '2019-06-21 04:30:44', '0000-00-00 00:00:00', 1, 0, 1),
(52, 59, 5000, 2500, 0, 2000, 0, '2019-07-09 13:07:51', '0000-00-00 00:00:00', 1, 0, 1),
(53, 60, 5000, 5000, 0, 1000, 1000, '2019-06-21 04:34:35', '0000-00-00 00:00:00', 1, 0, 1),
(54, 61, 5000, 5000, 0, 500, 1500, '2019-06-21 04:38:09', '0000-00-00 00:00:00', 1, 0, 1),
(55, 62, 5000, 5000, 0, 2000, 0, '2019-06-21 04:40:23', '0000-00-00 00:00:00', 1, 0, 1),
(56, 63, 5000, 5000, 0, 300, 1700, '2019-06-21 04:43:56', '0000-00-00 00:00:00', 1, 0, 1),
(57, 64, 5000, 5000, 0, 1000, 1000, '2019-06-21 04:45:44', '0000-00-00 00:00:00', 1, 0, 1),
(58, 65, 5000, 5000, 0, 700, 1300, '2019-06-21 04:47:40', '0000-00-00 00:00:00', 1, 0, 1),
(59, 66, 5000, 5000, 0, 600, 1400, '2019-06-21 04:50:08', '0000-00-00 00:00:00', 1, 0, 1),
(60, 67, 5000, 5000, 0, 500, 1500, '2019-06-21 04:51:46', '0000-00-00 00:00:00', 1, 0, 1),
(61, 68, 5000, 5000, 0, 500, 1500, '2019-06-21 04:53:57', '0000-00-00 00:00:00', 1, 0, 1),
(62, 69, 5000, 5000, 0, 500, 1500, '2019-06-21 04:55:15', '0000-00-00 00:00:00', 1, 0, 1),
(63, 70, 5000, 5000, 0, 500, 1500, '2019-06-21 04:56:34', '0000-00-00 00:00:00', 1, 0, 1),
(64, 71, 5000, 5000, 0, 600, 1400, '2019-06-21 04:57:55', '0000-00-00 00:00:00', 1, 0, 1),
(65, 72, 5000, 5000, 0, 200, 1800, '2019-06-21 05:02:53', '0000-00-00 00:00:00', 1, 0, 1),
(66, 73, 5000, 5000, 0, 0, 2000, '2019-06-21 05:05:42', '0000-00-00 00:00:00', 1, 0, 1),
(67, 74, 5000, 5000, 0, 2000, 0, '2019-06-21 05:11:26', '0000-00-00 00:00:00', 1, 0, 1),
(68, 75, 5000, 5000, 0, 700, 1300, '2019-06-21 05:12:27', '0000-00-00 00:00:00', 1, 0, 1),
(69, 76, 5000, 5000, 0, 600, 1400, '2019-06-21 05:15:25', '0000-00-00 00:00:00', 1, 0, 1),
(70, 77, 5000, 5000, 0, 300, 1700, '2019-06-21 05:16:31', '0000-00-00 00:00:00', 1, 0, 1),
(71, 78, 5000, 5000, 0, 300, 1700, '2019-06-21 05:18:02', '0000-00-00 00:00:00', 1, 0, 1),
(72, 79, 5000, 5000, 0, 200, 1800, '2019-06-21 05:21:19', '0000-00-00 00:00:00', 1, 0, 1),
(73, 80, 5000, 5000, 0, 1000, 1000, '2019-06-21 05:25:22', '0000-00-00 00:00:00', 1, 0, 1),
(74, 81, 5000, 5000, 0, 1000, 1000, '2019-06-21 05:31:27', '0000-00-00 00:00:00', 1, 0, 1),
(75, 82, 5000, 5000, 0, 300, 1700, '2019-06-21 05:34:01', '0000-00-00 00:00:00', 1, 0, 1),
(76, 83, 5000, 5000, 0, 500, 1500, '2019-06-21 05:35:44', '0000-00-00 00:00:00', 1, 0, 1),
(77, 84, 5000, 5000, 0, 700, 1300, '2019-06-21 05:37:35', '0000-00-00 00:00:00', 1, 0, 1),
(78, 85, 5000, 5000, 0, 600, 1400, '2019-06-21 05:41:10', '0000-00-00 00:00:00', 1, 0, 1),
(79, 86, 5000, 5000, 0, 300, 1700, '2019-06-21 05:43:32', '0000-00-00 00:00:00', 1, 0, 1),
(80, 87, 5000, 5000, 0, 300, 1700, '2019-06-21 05:45:40', '0000-00-00 00:00:00', 1, 0, 1),
(81, 88, 5000, 5000, 0, 200, 1800, '2019-06-21 05:48:21', '0000-00-00 00:00:00', 1, 0, 1),
(82, 89, 5000, 5000, 0, 200, 1800, '2019-06-21 05:49:40', '0000-00-00 00:00:00', 1, 0, 1),
(83, 90, 5000, 5000, 0, 600, 1400, '2019-06-21 05:51:17', '0000-00-00 00:00:00', 1, 0, 1),
(84, 91, 5000, 5000, 0, 1500, 500, '2019-06-21 05:53:04', '0000-00-00 00:00:00', 1, 0, 1),
(85, 92, 5000, 5000, 0, 200, 1800, '2019-06-21 05:55:21', '0000-00-00 00:00:00', 1, 0, 1),
(86, 93, 5000, 5000, 0, 500, 1500, '2019-06-21 05:57:17', '0000-00-00 00:00:00', 1, 0, 1),
(87, 94, 5000, 5000, 0, 500, 1500, '2019-06-21 05:58:58', '0000-00-00 00:00:00', 1, 0, 1),
(88, 95, 5000, 5000, 0, 300, 1700, '2019-06-21 06:02:46', '0000-00-00 00:00:00', 1, 0, 1),
(89, 96, 5000, 5000, 0, 500, 1500, '2019-06-21 06:04:36', '0000-00-00 00:00:00', 1, 0, 1),
(90, 97, 5000, 5000, 0, 300, 1700, '2019-06-21 06:06:23', '0000-00-00 00:00:00', 1, 0, 1),
(91, 98, 5000, 5000, 0, 300, 1700, '2019-06-21 06:07:43', '0000-00-00 00:00:00', 1, 0, 1),
(92, 99, 5000, 5000, 0, 300, 1700, '2019-06-21 06:09:35', '0000-00-00 00:00:00', 1, 0, 1),
(93, 100, 5000, 5000, 0, 800, 1200, '2019-06-21 06:11:25', '0000-00-00 00:00:00', 1, 0, 1),
(94, 101, 5000, 5000, 0, 500, 1500, '2019-06-21 06:12:54', '0000-00-00 00:00:00', 1, 0, 1),
(95, 102, 5000, 5000, 0, 500, 1500, '2019-06-21 06:15:09', '0000-00-00 00:00:00', 1, 0, 1),
(96, 103, 5000, 5000, 0, 600, 1400, '2019-06-21 06:16:47', '0000-00-00 00:00:00', 1, 0, 1),
(97, 104, 5000, 5000, 0, 500, 1500, '2019-06-21 06:18:54', '0000-00-00 00:00:00', 1, 0, 1),
(98, 105, 5000, 5000, 0, 2000, 0, '2019-06-21 06:20:56', '0000-00-00 00:00:00', 1, 0, 1),
(99, 106, 5000, 3000, 0, 500, 1500, '2019-07-09 13:07:58', '0000-00-00 00:00:00', 1, 0, 1),
(100, 107, 5000, 5000, 0, 500, 1500, '2019-06-21 06:26:35', '0000-00-00 00:00:00', 1, 0, 1),
(101, 108, 5000, 2500, 0, 200, 1800, '2019-07-09 13:08:01', '0000-00-00 00:00:00', 1, 0, 1),
(102, 109, 5000, 5000, 0, 500, 1500, '2019-06-21 06:35:40', '0000-00-00 00:00:00', 1, 0, 1),
(103, 110, 5000, 5000, 0, 300, 1700, '2019-06-21 06:37:00', '0000-00-00 00:00:00', 1, 0, 1),
(104, 111, 5000, 5000, 0, 200, 1800, '2019-06-21 06:38:22', '0000-00-00 00:00:00', 1, 0, 1),
(105, 112, 5000, 5000, 0, 200, 1800, '2019-06-21 06:39:46', '0000-00-00 00:00:00', 1, 0, 1),
(106, 113, 5000, 5000, 0, 500, 1500, '2019-06-21 06:41:11', '0000-00-00 00:00:00', 1, 0, 1),
(107, 114, 5000, 5000, 0, 200, 1800, '2019-06-21 06:45:00', '0000-00-00 00:00:00', 1, 0, 1),
(108, 115, 5000, 5000, 0, 500, 1500, '2019-06-21 06:48:39', '0000-00-00 00:00:00', 1, 0, 1),
(109, 116, 5000, 5000, 0, 200, 1800, '2019-06-21 06:51:04', '0000-00-00 00:00:00', 1, 0, 1),
(110, 117, 5000, 5000, 0, 500, 1500, '2019-06-21 06:53:28', '0000-00-00 00:00:00', 1, 0, 1),
(111, 119, 5000, 5000, 0, 200, 1800, '2019-06-21 06:56:17', '0000-00-00 00:00:00', 1, 0, 1),
(112, 120, 5000, 5000, 0, 1000, 1000, '2019-06-21 06:59:02', '0000-00-00 00:00:00', 1, 0, 1),
(113, 121, 5000, 5000, 0, 500, 1500, '2019-06-21 07:01:16', '0000-00-00 00:00:00', 1, 0, 1),
(114, 122, 5000, 5000, 0, 200, 1800, '2019-06-21 07:05:13', '0000-00-00 00:00:00', 1, 0, 1),
(115, 123, 5000, 5000, 0, 500, 1500, '2019-06-21 07:08:31', '0000-00-00 00:00:00', 1, 0, 1),
(116, 124, 5000, 5000, 0, 300, 1700, '2019-06-21 07:11:08', '0000-00-00 00:00:00', 1, 0, 1),
(117, 125, 5000, 5000, 0, 200, 1800, '2019-06-21 07:12:38', '0000-00-00 00:00:00', 1, 0, 1),
(118, 126, 5000, 5000, 0, 1100, 900, '2019-06-21 07:14:34', '0000-00-00 00:00:00', 1, 0, 1),
(119, 127, 5000, 5000, 0, 1000, 1000, '2019-06-21 07:15:55', '0000-00-00 00:00:00', 1, 0, 1),
(120, 128, 5000, 5000, 0, 600, 1400, '2019-06-21 07:17:31', '0000-00-00 00:00:00', 1, 0, 1),
(121, 129, 5000, 5000, 0, 700, 1300, '2019-06-21 07:18:59', '0000-00-00 00:00:00', 1, 0, 1),
(122, 130, 5000, 5000, 0, 400, 1600, '2019-06-21 07:21:01', '0000-00-00 00:00:00', 1, 0, 1),
(123, 131, 5000, 5000, 0, 500, 1500, '2019-06-21 07:22:13', '0000-00-00 00:00:00', 1, 0, 1),
(124, 132, 5000, 5000, 0, 900, 1100, '2019-06-21 07:23:43', '0000-00-00 00:00:00', 1, 0, 1),
(125, 133, 5000, 5000, 0, 500, 1500, '2019-06-21 07:26:11', '0000-00-00 00:00:00', 1, 0, 1),
(126, 134, 5000, 5000, 0, 400, 1600, '2019-06-21 07:28:36', '0000-00-00 00:00:00', 1, 0, 1),
(127, 135, 5000, 5000, 0, 200, 1800, '2019-06-21 07:29:52', '0000-00-00 00:00:00', 1, 0, 1),
(128, 136, 5000, 5000, 0, 300, 1700, '2019-06-21 07:31:19', '0000-00-00 00:00:00', 1, 0, 1),
(129, 137, 5000, 5000, 0, 600, 1400, '2019-06-21 07:32:31', '0000-00-00 00:00:00', 1, 0, 1),
(130, 138, 5000, 0, 0, 600, 1400, '2019-07-09 13:08:05', '0000-00-00 00:00:00', 1, 0, 1),
(131, 139, 5000, 500, 0, 0, 2000, '2019-07-09 13:08:08', '0000-00-00 00:00:00', 1, 0, 1),
(132, 140, 5000, 5000, 0, 700, 1300, '2019-06-21 07:38:13', '0000-00-00 00:00:00', 1, 0, 1),
(133, 141, 5000, 5000, 0, 0, 2000, '2019-06-21 07:40:31', '0000-00-00 00:00:00', 1, 0, 1),
(134, 142, 5000, 5000, 0, 2000, 0, '2019-06-21 07:43:09', '0000-00-00 00:00:00', 1, 0, 1),
(135, 143, 5000, 5000, 0, 0, 2000, '2019-06-21 07:44:28', '0000-00-00 00:00:00', 1, 0, 1),
(136, 144, 5000, 5000, 0, 2000, 0, '2019-06-21 07:45:52', '0000-00-00 00:00:00', 1, 0, 1),
(137, 145, 5000, 5000, 0, 500, 1500, '2019-06-21 07:49:20', '0000-00-00 00:00:00', 1, 0, 1),
(138, 146, 5000, 5000, 0, 500, 1500, '2019-06-21 07:50:57', '0000-00-00 00:00:00', 1, 0, 1),
(139, 147, 5000, 5000, 0, 500, 1500, '2019-06-21 07:52:45', '0000-00-00 00:00:00', 1, 0, 1),
(140, 148, 5000, 5000, 0, 500, 1500, '2019-06-21 23:44:18', '0000-00-00 00:00:00', 1, 0, 1),
(141, 149, 5000, 5000, 0, 200, 1800, '2019-06-21 23:47:01', '0000-00-00 00:00:00', 1, 0, 1),
(142, 150, 5000, 5000, 0, 600, 1400, '2019-06-21 23:52:53', '0000-00-00 00:00:00', 1, 0, 1),
(143, 151, 5000, 5000, 0, 600, 1400, '2019-06-21 23:54:40', '0000-00-00 00:00:00', 1, 0, 1),
(144, 152, 5000, 5000, 0, 900, 1100, '2019-06-21 23:58:54', '0000-00-00 00:00:00', 1, 0, 1),
(145, 153, 5000, 5000, 0, 1300, 700, '2019-06-22 00:00:27', '0000-00-00 00:00:00', 1, 0, 1),
(146, 154, 5000, 5000, 0, 500, 1500, '2019-06-22 00:13:42', '0000-00-00 00:00:00', 1, 0, 1),
(147, 155, 5000, 5000, 0, 600, 1400, '2019-06-22 00:15:35', '0000-00-00 00:00:00', 1, 0, 1),
(148, 156, 5000, 5000, 0, 600, 500, '2019-06-22 00:17:51', '0000-00-00 00:00:00', 1, 0, 1),
(149, 157, 5000, 5000, 0, 0, 2000, '2019-06-22 00:19:32', '0000-00-00 00:00:00', 1, 0, 1),
(150, 158, 5000, 5000, 0, 500, 1500, '2019-06-22 00:21:02', '0000-00-00 00:00:00', 1, 0, 1),
(151, 159, 5000, 5000, 0, 800, 1200, '2019-06-22 00:22:24', '0000-00-00 00:00:00', 1, 0, 1),
(152, 160, 5000, 5000, 0, 300, 1700, '2019-06-22 00:23:31', '0000-00-00 00:00:00', 1, 0, 1),
(153, 161, 5000, 5000, 0, 900, 1100, '2019-06-22 00:25:30', '0000-00-00 00:00:00', 1, 0, 1),
(154, 162, 5000, 5000, 0, 700, 1300, '2019-06-22 00:26:45', '0000-00-00 00:00:00', 1, 0, 1),
(155, 163, 5000, 5000, 0, 500, 1500, '2019-06-22 00:28:05', '0000-00-00 00:00:00', 1, 0, 1),
(156, 164, 5000, 5000, 0, 300, 1700, '2019-06-22 00:29:27', '0000-00-00 00:00:00', 1, 0, 1),
(157, 165, 5000, 5000, 0, 400, 1600, '2019-06-22 00:30:54', '0000-00-00 00:00:00', 1, 0, 1),
(158, 166, 5000, 5000, 0, 500, 1500, '2019-06-22 00:32:39', '0000-00-00 00:00:00', 1, 0, 1),
(159, 167, 5000, 5000, 0, 500, 1500, '2019-06-22 00:35:45', '0000-00-00 00:00:00', 1, 0, 1),
(160, 168, 5000, 5000, 0, 500, 1500, '2019-06-22 00:37:15', '0000-00-00 00:00:00', 1, 0, 1),
(161, 169, 5000, 5000, 0, 300, 1700, '2019-06-22 00:38:47', '0000-00-00 00:00:00', 1, 0, 1),
(162, 170, 5000, 5000, 0, 2000, 0, '2019-06-22 00:40:07', '0000-00-00 00:00:00', 1, 0, 1),
(163, 171, 5000, 5000, 0, 0, 2000, '2019-06-22 00:41:41', '0000-00-00 00:00:00', 1, 0, 1),
(164, 172, 5000, 5000, 0, 300, 1700, '2019-06-22 00:43:03', '0000-00-00 00:00:00', 1, 0, 1),
(165, 173, 5000, 5000, 0, 300, 1700, '2019-06-22 00:44:24', '0000-00-00 00:00:00', 1, 0, 1),
(166, 174, 5000, 4000, 0, 1000, 1000, '2019-07-09 13:08:13', '0000-00-00 00:00:00', 1, 0, 1),
(167, 175, 5000, 5000, 0, 500, 1500, '2019-06-22 00:47:11', '0000-00-00 00:00:00', 1, 0, 1),
(168, 179, 5000, 5000, 0, 0, 2000, '2019-06-22 00:50:08', '0000-00-00 00:00:00', 1, 0, 1),
(169, 180, 5000, 5000, 0, 500, 1500, '2019-06-22 00:52:05', '0000-00-00 00:00:00', 1, 0, 1),
(170, 181, 5000, 5000, 0, 800, 1200, '2019-06-22 00:53:46', '0000-00-00 00:00:00', 1, 0, 1),
(171, 182, 5000, 5000, 0, 800, 1200, '2019-06-22 00:55:52', '0000-00-00 00:00:00', 1, 0, 1),
(172, 183, 5000, 5000, 0, 700, 1300, '2019-06-22 00:57:06', '0000-00-00 00:00:00', 1, 0, 1),
(173, 184, 5000, 5000, 0, 500, 1500, '2019-06-22 00:58:10', '0000-00-00 00:00:00', 1, 0, 1),
(174, 185, 5000, 5000, 0, 800, 1200, '2019-06-22 00:59:32', '0000-00-00 00:00:00', 1, 0, 1),
(175, 186, 5000, 5000, 0, 600, 1400, '2019-06-22 01:00:40', '0000-00-00 00:00:00', 1, 0, 1),
(176, 187, 5000, 5000, 0, 500, 1500, '2019-06-22 01:01:54', '0000-00-00 00:00:00', 1, 0, 1),
(177, 188, 5000, 5000, 0, 1300, 700, '2019-06-22 01:03:25', '0000-00-00 00:00:00', 1, 0, 1),
(178, 189, 5000, 5000, 0, 900, 1100, '2019-06-22 01:04:46', '0000-00-00 00:00:00', 1, 0, 1),
(179, 190, 5000, 5000, 0, 1000, 1000, '2019-06-22 01:20:39', '0000-00-00 00:00:00', 1, 0, 1),
(180, 191, 5000, 5000, 0, 300, 1700, '2019-06-22 01:22:33', '0000-00-00 00:00:00', 1, 0, 1),
(181, 192, 5000, 5000, 0, 400, 1600, '2019-06-22 01:23:57', '0000-00-00 00:00:00', 1, 0, 1),
(182, 193, 5000, 5000, 0, 500, 1500, '2019-06-22 01:25:20', '0000-00-00 00:00:00', 1, 0, 1),
(183, 194, 5000, 5000, 0, 500, 1500, '2019-06-22 01:26:44', '0000-00-00 00:00:00', 1, 0, 1),
(184, 195, 5000, 5000, 0, 300, 1700, '2019-06-22 01:27:58', '0000-00-00 00:00:00', 1, 0, 1),
(185, 196, 5000, 5000, 0, 2000, 0, '2019-06-22 01:29:28', '0000-00-00 00:00:00', 1, 0, 1),
(186, 197, 5000, 5000, 0, 600, 1400, '2019-06-22 01:33:14', '0000-00-00 00:00:00', 1, 0, 1),
(187, 198, 5000, 5000, 0, 200, 1800, '2019-06-22 01:37:48', '0000-00-00 00:00:00', 1, 0, 1),
(188, 199, 5000, 5000, 0, 500, 1500, '2019-06-22 01:39:30', '0000-00-00 00:00:00', 1, 0, 1),
(189, 200, 5000, 5000, 0, 700, 1300, '2019-06-22 01:41:46', '0000-00-00 00:00:00', 1, 0, 1),
(190, 201, 5000, 5000, 0, 200, 1800, '2019-06-22 01:43:55', '0000-00-00 00:00:00', 1, 0, 1),
(191, 202, 5000, 5000, 0, 500, 1500, '2019-06-22 01:45:58', '0000-00-00 00:00:00', 1, 0, 1),
(192, 203, 5000, 5000, 0, 200, 1800, '2019-06-22 01:47:26', '0000-00-00 00:00:00', 1, 0, 1),
(193, 204, 5000, 5000, 0, 800, 1200, '2019-06-22 01:53:21', '0000-00-00 00:00:00', 1, 0, 1),
(194, 205, 5000, 5000, 0, 500, 1500, '2019-06-22 02:03:01', '0000-00-00 00:00:00', 1, 0, 1),
(195, 206, 5000, 5000, 0, 500, 1500, '2019-06-22 02:05:04', '0000-00-00 00:00:00', 1, 0, 1),
(196, 207, 5000, 5000, 0, 500, 1500, '2019-06-22 02:08:20', '0000-00-00 00:00:00', 1, 0, 1),
(197, 208, 5000, 5000, 0, 200, 1800, '2019-06-22 02:10:12', '0000-00-00 00:00:00', 1, 0, 1),
(198, 209, 5000, 5000, 0, 500, 1500, '2019-06-22 02:12:24', '0000-00-00 00:00:00', 1, 0, 1),
(199, 210, 5000, 5000, 0, 2000, 0, '2019-06-22 02:14:38', '0000-00-00 00:00:00', 1, 0, 1),
(200, 211, 5000, 5000, 0, 200, 1800, '2019-06-22 02:43:55', '0000-00-00 00:00:00', 1, 0, 1),
(201, 212, 5000, 5000, 0, 400, 1600, '2019-06-22 02:48:27', '0000-00-00 00:00:00', 1, 0, 1),
(202, 213, 5000, 5000, 0, 800, 1200, '2019-06-22 02:51:07', '0000-00-00 00:00:00', 1, 0, 1),
(203, 214, 5000, 5000, 0, 500, 1500, '2019-06-22 03:00:11', '0000-00-00 00:00:00', 1, 0, 1),
(204, 215, 5000, 5000, 0, 600, 1400, '2019-06-22 03:02:06', '0000-00-00 00:00:00', 1, 0, 1),
(205, 216, 5000, 5000, 0, 300, 1700, '2019-06-22 03:03:54', '0000-00-00 00:00:00', 1, 0, 1),
(206, 217, 5000, 5000, 0, 500, 1500, '2019-06-22 03:06:17', '0000-00-00 00:00:00', 1, 0, 1),
(207, 218, 5000, 5000, 0, 200, 1800, '2019-06-22 03:08:45', '0000-00-00 00:00:00', 1, 0, 1),
(208, 219, 5000, 5000, 0, 200, 1800, '2019-06-22 03:26:35', '0000-00-00 00:00:00', 1, 0, 1),
(209, 220, 5000, 5000, 0, 2000, 0, '2019-06-22 03:29:06', '0000-00-00 00:00:00', 1, 0, 1),
(210, 221, 5000, 5000, 0, 200, 1800, '2019-06-22 03:30:49', '0000-00-00 00:00:00', 1, 0, 1),
(211, 222, 5000, 5000, 0, 400, 1600, '2019-06-22 03:32:17', '0000-00-00 00:00:00', 1, 0, 1),
(212, 223, 5000, 5000, 0, 800, 1200, '2019-06-22 03:33:50', '0000-00-00 00:00:00', 1, 0, 1),
(213, 224, 5000, 5000, 0, 2000, 0, '2019-06-22 03:35:34', '0000-00-00 00:00:00', 1, 0, 1),
(214, 225, 5000, 5000, 0, 500, 1500, '2019-06-22 03:36:39', '0000-00-00 00:00:00', 1, 0, 1),
(215, 226, 5000, 5000, 0, 0, 2000, '2019-06-22 03:37:42', '0000-00-00 00:00:00', 1, 0, 1),
(216, 227, 5000, 5000, 0, 500, 1500, '2019-06-22 03:38:55', '0000-00-00 00:00:00', 1, 0, 1),
(217, 228, 5000, 5000, 0, 600, 1400, '2019-06-22 03:39:58', '0000-00-00 00:00:00', 1, 0, 1),
(218, 229, 5000, 5000, 0, 200, 1800, '2019-06-22 03:41:06', '0000-00-00 00:00:00', 1, 0, 1),
(219, 230, 5000, 5000, 0, 200, 1800, '2019-06-22 03:42:11', '0000-00-00 00:00:00', 1, 0, 1),
(220, 231, 5000, 5000, 0, 600, 1400, '2019-06-22 03:43:17', '0000-00-00 00:00:00', 1, 0, 1),
(221, 232, 5000, 5000, 0, 800, 1200, '2019-06-22 03:44:30', '0000-00-00 00:00:00', 1, 0, 1),
(222, 233, 5000, 5000, 0, 300, 1700, '2019-06-22 03:45:50', '0000-00-00 00:00:00', 1, 0, 1),
(223, 234, 5000, 5000, 0, 300, 1700, '2019-06-22 03:47:03', '0000-00-00 00:00:00', 1, 0, 1),
(224, 235, 5000, 5000, 0, 800, 1200, '2019-06-22 03:48:25', '0000-00-00 00:00:00', 1, 0, 1),
(225, 236, 5000, 5000, 0, 500, 1500, '2019-06-22 03:49:31', '0000-00-00 00:00:00', 1, 0, 1),
(226, 237, 5000, 5000, 0, 500, 1500, '2019-06-22 03:50:45', '0000-00-00 00:00:00', 1, 0, 1),
(227, 238, 5000, 5000, 0, 300, 1700, '2019-06-22 03:51:52', '0000-00-00 00:00:00', 1, 0, 1),
(228, 239, 5000, 5000, 0, 800, 1200, '2019-06-22 03:52:54', '0000-00-00 00:00:00', 1, 0, 1),
(229, 240, 5000, 5000, 0, 300, 1700, '2019-06-22 03:54:07', '0000-00-00 00:00:00', 1, 0, 1),
(230, 241, 5000, 5000, 0, 2000, 0, '2019-06-22 03:55:14', '0000-00-00 00:00:00', 1, 0, 1),
(231, 242, 5000, 5000, 0, 300, 1700, '2019-06-22 03:56:15', '0000-00-00 00:00:00', 1, 0, 1),
(232, 243, 5000, 5000, 0, 600, 1400, '2019-06-22 04:08:59', '0000-00-00 00:00:00', 1, 0, 1),
(233, 244, 5000, 5000, 0, 300, 1700, '2019-06-22 04:14:58', '0000-00-00 00:00:00', 1, 0, 1),
(234, 245, 5000, 5000, 0, 400, 1600, '2019-06-22 04:19:56', '0000-00-00 00:00:00', 1, 0, 1),
(235, 246, 5000, 5000, 0, 500, 1500, '2019-06-22 04:22:47', '0000-00-00 00:00:00', 1, 0, 1),
(236, 247, 5000, 2000, 0, 2000, 0, '2019-07-09 13:08:21', '0000-00-00 00:00:00', 1, 0, 1),
(237, 248, 5000, 3000, 0, 1000, 1000, '2019-07-09 13:08:24', '0000-00-00 00:00:00', 1, 0, 1),
(238, 249, 5000, 5000, 0, 500, 1500, '2019-06-22 04:39:33', '0000-00-00 00:00:00', 1, 0, 1),
(239, 250, 5000, 5000, 0, 800, 1200, '2019-06-22 04:53:43', '0000-00-00 00:00:00', 1, 0, 1),
(240, 251, 5000, 5000, 0, 500, 1500, '2019-06-22 04:55:48', '0000-00-00 00:00:00', 1, 0, 1),
(241, 252, 5000, 5000, 0, 500, 1500, '2019-06-22 04:57:17', '0000-00-00 00:00:00', 1, 0, 1),
(242, 253, 5000, 5000, 0, 500, 1500, '2019-06-22 04:59:19', '0000-00-00 00:00:00', 1, 0, 1),
(243, 254, 5000, 5000, 0, 200, 1800, '2019-06-22 05:00:51', '0000-00-00 00:00:00', 1, 0, 1),
(244, 255, 5000, 5000, 0, 600, 1400, '2019-06-22 05:02:13', '0000-00-00 00:00:00', 1, 0, 1),
(245, 256, 5000, 5000, 0, 500, 1500, '2019-06-22 05:03:56', '0000-00-00 00:00:00', 1, 0, 1),
(246, 257, 5000, 5000, 0, 500, 1500, '2019-06-22 05:05:22', '0000-00-00 00:00:00', 1, 0, 1),
(247, 258, 5000, 5000, 0, 600, 1400, '2019-06-22 05:08:09', '0000-00-00 00:00:00', 1, 0, 1),
(248, 259, 5000, 5000, 0, 0, 2000, '2019-06-22 05:10:11', '0000-00-00 00:00:00', 1, 0, 1),
(249, 260, 5000, 5000, 0, 500, 1500, '2019-06-22 05:13:46', '0000-00-00 00:00:00', 1, 0, 1),
(250, 261, 5000, 5000, 0, 500, 1500, '2019-06-22 05:19:03', '0000-00-00 00:00:00', 1, 0, 1),
(251, 262, 5000, 5000, 0, 500, 1500, '2019-06-22 05:22:22', '0000-00-00 00:00:00', 1, 0, 1),
(252, 263, 5000, 5000, 0, 500, 1500, '2019-06-22 05:23:30', '0000-00-00 00:00:00', 1, 0, 1),
(253, 264, 5000, 5000, 0, 500, 1500, '2019-06-22 05:24:46', '0000-00-00 00:00:00', 1, 0, 1),
(254, 265, 5000, 5000, 0, 500, 1500, '2019-06-22 05:26:09', '0000-00-00 00:00:00', 1, 0, 1),
(255, 266, 5000, 5000, 0, 500, 1500, '2019-06-22 05:27:45', '0000-00-00 00:00:00', 1, 0, 1),
(256, 267, 5000, 5000, 0, 700, 1300, '2019-06-22 05:29:01', '0000-00-00 00:00:00', 1, 0, 1),
(257, 268, 5000, 3000, 0, 0, 2000, '2019-07-09 13:08:28', '0000-00-00 00:00:00', 1, 0, 1),
(258, 269, 5000, 5000, 0, 2000, 0, '2019-06-22 05:31:45', '0000-00-00 00:00:00', 1, 0, 1),
(259, 270, 5000, 3500, 0, 600, 1400, '2019-07-09 13:08:31', '0000-00-00 00:00:00', 1, 0, 1),
(260, 271, 5000, 5000, 0, 500, 1500, '2019-06-22 05:37:34', '0000-00-00 00:00:00', 1, 0, 1),
(261, 272, 5000, 5000, 0, 200, 1800, '2019-06-22 05:39:10', '0000-00-00 00:00:00', 1, 0, 1),
(262, 273, 5000, 5000, 0, 600, 1400, '2019-06-22 05:40:45', '0000-00-00 00:00:00', 1, 0, 1),
(263, 274, 5000, 5000, 0, 300, 1700, '2019-06-22 05:42:12', '0000-00-00 00:00:00', 1, 0, 1),
(264, 275, 5000, 5000, 0, 500, 1500, '2019-06-22 05:43:25', '0000-00-00 00:00:00', 1, 0, 1),
(265, 276, 5000, 5000, 0, 500, 1500, '2019-06-22 06:03:07', '0000-00-00 00:00:00', 1, 0, 1),
(266, 277, 5000, 5000, 0, 200, 1800, '2019-06-22 06:07:52', '0000-00-00 00:00:00', 1, 0, 1),
(267, 278, 5000, 5000, 0, 300, 1700, '2019-06-22 06:12:40', '0000-00-00 00:00:00', 1, 0, 1),
(268, 279, 5000, 5000, 0, 600, 1400, '2019-06-22 06:14:13', '0000-00-00 00:00:00', 1, 0, 1),
(269, 280, 5000, 5000, 0, 2000, 0, '2019-06-22 06:15:36', '0000-00-00 00:00:00', 1, 0, 1),
(270, 281, 5000, 5000, 0, 500, 1500, '2019-06-22 06:18:48', '0000-00-00 00:00:00', 1, 0, 1),
(271, 282, 5000, 5000, 0, 500, 1500, '2019-06-22 06:21:20', '0000-00-00 00:00:00', 1, 0, 1),
(272, 283, 5000, 4000, 0, 700, 1300, '2019-07-09 13:08:36', '0000-00-00 00:00:00', 1, 0, 1),
(273, 284, 5000, 5000, 0, 700, 1300, '2019-06-22 06:28:27', '0000-00-00 00:00:00', 1, 0, 1),
(274, 285, 5000, 5000, 0, 300, 1700, '2019-06-22 06:29:46', '0000-00-00 00:00:00', 1, 0, 1),
(275, 286, 5000, 5000, 0, 400, 1600, '2019-06-22 06:30:57', '0000-00-00 00:00:00', 1, 0, 1),
(276, 287, 5000, 5000, 0, 500, 1500, '2019-06-22 06:33:33', '0000-00-00 00:00:00', 1, 0, 1),
(277, 288, 5000, 5000, 0, 500, 1500, '2019-06-22 06:35:27', '0000-00-00 00:00:00', 1, 0, 1),
(278, 289, 5000, 5000, 0, 500, 1500, '2019-06-22 06:36:57', '0000-00-00 00:00:00', 1, 0, 1),
(279, 290, 5000, 5000, 0, 300, 1700, '2019-06-22 06:38:25', '0000-00-00 00:00:00', 1, 0, 1),
(280, 291, 5000, 5000, 0, 500, 1500, '2019-06-24 00:22:09', '0000-00-00 00:00:00', 1, 0, 1),
(281, 292, 5000, 5000, 0, 300, 1700, '2019-06-24 00:23:30', '0000-00-00 00:00:00', 1, 0, 1),
(282, 293, 5000, 5000, 0, 300, 1700, '2019-06-24 00:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(283, 294, 5000, 5000, 0, 500, 1500, '2019-06-24 00:25:52', '0000-00-00 00:00:00', 1, 0, 1),
(284, 295, 5000, 5000, 0, 500, 1500, '2019-06-24 00:27:17', '0000-00-00 00:00:00', 1, 0, 1),
(285, 296, 5000, 5000, 0, 300, 1700, '2019-06-24 00:29:28', '0000-00-00 00:00:00', 1, 0, 1),
(286, 297, 5000, 5000, 0, 500, 1500, '2019-06-24 00:31:25', '0000-00-00 00:00:00', 1, 0, 1),
(287, 298, 5000, 5000, 0, 300, 1700, '2019-06-24 00:32:47', '0000-00-00 00:00:00', 1, 0, 1),
(288, 299, 5000, 5000, 0, 300, 1700, '2019-06-24 00:34:05', '0000-00-00 00:00:00', 1, 0, 1),
(289, 300, 5000, 5000, 0, 300, 1700, '2019-06-24 00:35:20', '0000-00-00 00:00:00', 1, 0, 1),
(290, 301, 5000, 3000, 0, 0, 2000, '2019-07-09 13:08:40', '0000-00-00 00:00:00', 1, 0, 1),
(291, 302, 5000, 3000, 0, 2000, 0, '2019-07-09 13:08:43', '0000-00-00 00:00:00', 1, 0, 1),
(292, 303, 5000, 3000, 0, 0, 2000, '2019-07-09 13:08:46', '0000-00-00 00:00:00', 1, 0, 1),
(293, 304, 5000, 5000, 0, 300, 1700, '2019-06-24 00:47:20', '0000-00-00 00:00:00', 1, 0, 1),
(294, 305, 5000, 5000, 0, 900, 1100, '2019-06-24 00:48:30', '0000-00-00 00:00:00', 1, 0, 1),
(295, 306, 5000, 5000, 0, 500, 1500, '2019-06-24 00:49:54', '0000-00-00 00:00:00', 1, 0, 1),
(296, 307, 5000, 5000, 0, 500, 1500, '2019-06-24 00:52:45', '0000-00-00 00:00:00', 1, 0, 1),
(297, 308, 5000, 5000, 0, 2000, 0, '2019-06-24 00:54:07', '0000-00-00 00:00:00', 1, 0, 1),
(298, 309, 5000, 5000, 0, 500, 1500, '2019-06-24 00:59:28', '0000-00-00 00:00:00', 1, 0, 1),
(299, 310, 5000, 5000, 0, 600, 1400, '2019-06-24 01:01:09', '0000-00-00 00:00:00', 1, 0, 1),
(300, 311, 5000, 5000, 0, 2000, 0, '2019-06-24 01:02:12', '0000-00-00 00:00:00', 1, 0, 1),
(301, 312, 5000, 5000, 0, 2000, 0, '2019-06-24 01:03:43', '0000-00-00 00:00:00', 1, 0, 1),
(302, 313, 5000, 5000, 0, 500, 1500, '2019-06-24 01:05:21', '0000-00-00 00:00:00', 1, 0, 1),
(303, 314, 5000, 5000, 0, 300, 1700, '2019-06-24 01:06:37', '0000-00-00 00:00:00', 1, 0, 1),
(304, 315, 5000, 5000, 0, 300, 1700, '2019-06-24 01:08:21', '0000-00-00 00:00:00', 1, 0, 1),
(305, 316, 5000, 5000, 0, 500, 1500, '2019-06-24 01:09:56', '0000-00-00 00:00:00', 1, 0, 1),
(306, 317, 5000, 5000, 0, 400, 1600, '2019-06-24 01:11:23', '0000-00-00 00:00:00', 1, 0, 1),
(307, 318, 5000, 5000, 0, 300, 1700, '2019-06-24 01:12:24', '0000-00-00 00:00:00', 1, 0, 1),
(308, 319, 5000, 5000, 0, 500, 1500, '2019-06-24 01:13:30', '0000-00-00 00:00:00', 1, 0, 1),
(309, 320, 5000, 5000, 0, 0, 2000, '2019-06-24 01:14:48', '0000-00-00 00:00:00', 1, 0, 1),
(310, 321, 5000, 5000, 0, 300, 1700, '2019-06-24 04:55:57', '0000-00-00 00:00:00', 4, 0, 1),
(311, 322, 5000, 5000, 0, 300, 1700, '2019-06-24 04:58:42', '0000-00-00 00:00:00', 4, 0, 1),
(312, 323, 5000, 5000, 0, 300, 1700, '2019-06-24 05:00:06', '0000-00-00 00:00:00', 4, 0, 1),
(313, 324, 5000, 5000, 0, 200, 1800, '2019-06-24 05:01:29', '0000-00-00 00:00:00', 4, 0, 1),
(314, 325, 5000, 5000, 0, 500, 1500, '2019-06-24 05:03:29', '0000-00-00 00:00:00', 4, 0, 1),
(315, 326, 5000, 5000, 0, 500, 1500, '2019-06-24 05:04:49', '0000-00-00 00:00:00', 4, 0, 1),
(316, 327, 5000, 5000, 0, 700, 1300, '2019-06-24 05:06:07', '0000-00-00 00:00:00', 4, 0, 1),
(317, 328, 5000, 5000, 0, 400, 1600, '2019-06-24 05:07:31', '0000-00-00 00:00:00', 4, 0, 1),
(318, 329, 5000, 5000, 0, 200, 1800, '2019-06-24 05:08:50', '0000-00-00 00:00:00', 4, 0, 1),
(319, 330, 5000, 5000, 0, 200, 1800, '2019-06-24 05:10:24', '0000-00-00 00:00:00', 4, 0, 1),
(320, 331, 5000, 5000, 0, 400, 1600, '2019-06-24 05:12:25', '0000-00-00 00:00:00', 4, 0, 1),
(321, 332, 5000, 5000, 0, 200, 1800, '2019-06-24 05:15:11', '0000-00-00 00:00:00', 4, 0, 1),
(322, 333, 5000, 5000, 0, 200, 1800, '2019-06-24 05:16:47', '0000-00-00 00:00:00', 4, 0, 1),
(323, 334, 5000, 5000, 0, 300, 1700, '2019-06-24 05:18:00', '0000-00-00 00:00:00', 4, 0, 1),
(324, 335, 5000, 5000, 0, 500, 1500, '2019-06-24 05:19:19', '0000-00-00 00:00:00', 4, 0, 1),
(325, 336, 5000, 5000, 0, 500, 1500, '2019-06-24 05:20:13', '0000-00-00 00:00:00', 4, 0, 1),
(326, 337, 5000, 5000, 0, 200, 1800, '2019-06-24 05:21:56', '0000-00-00 00:00:00', 4, 0, 1),
(327, 338, 5000, 5000, 0, 500, 1500, '2019-06-24 05:23:11', '0000-00-00 00:00:00', 4, 0, 1),
(328, 339, 5000, 5000, 0, 500, 1500, '2019-06-24 05:28:15', '0000-00-00 00:00:00', 4, 0, 1),
(329, 340, 5000, 5000, 0, 500, 1500, '2019-06-24 05:29:23', '0000-00-00 00:00:00', 4, 0, 1),
(330, 341, 5000, 5000, 0, 200, 1800, '2019-06-24 05:30:44', '0000-00-00 00:00:00', 4, 0, 1),
(331, 342, 5000, 5000, 0, 200, 1800, '2019-06-24 05:32:08', '0000-00-00 00:00:00', 4, 0, 1),
(332, 343, 5000, 5000, 0, 500, 1500, '2019-06-24 05:33:27', '0000-00-00 00:00:00', 4, 0, 1),
(333, 344, 5000, 5000, 0, 200, 1800, '2019-06-24 05:36:20', '0000-00-00 00:00:00', 4, 0, 1),
(334, 345, 5000, 5000, 0, 200, 1800, '2019-06-24 05:37:42', '0000-00-00 00:00:00', 4, 0, 1),
(335, 346, 5000, 5000, 0, 200, 1800, '2019-06-24 05:39:13', '0000-00-00 00:00:00', 4, 0, 1),
(336, 347, 5000, 5000, 0, 300, 1700, '2019-06-24 05:41:14', '0000-00-00 00:00:00', 4, 0, 1),
(337, 348, 5000, 5000, 0, 2000, 0, '2019-06-24 05:43:11', '0000-00-00 00:00:00', 4, 0, 1),
(338, 349, 5000, 5000, 0, 700, 1300, '2019-06-24 05:44:48', '0000-00-00 00:00:00', 4, 0, 1),
(339, 350, 5000, 5000, 0, 500, 1500, '2019-06-24 05:46:12', '0000-00-00 00:00:00', 4, 0, 1),
(340, 351, 5000, 5000, 0, 800, 1200, '2019-06-24 05:48:23', '0000-00-00 00:00:00', 4, 0, 1),
(341, 352, 5000, 5000, 0, 500, 1500, '2019-06-24 05:49:47', '0000-00-00 00:00:00', 4, 0, 1),
(342, 354, 5000, 5000, 0, 500, 1500, '2019-06-24 05:51:34', '0000-00-00 00:00:00', 4, 0, 1),
(343, 355, 5000, 5000, 0, 200, 1800, '2019-06-24 05:54:06', '0000-00-00 00:00:00', 4, 0, 1),
(344, 356, 5000, 5000, 0, 300, 1700, '2019-06-24 05:55:19', '0000-00-00 00:00:00', 4, 0, 1),
(345, 357, 5000, 5000, 0, 500, 1500, '2019-06-24 05:57:11', '0000-00-00 00:00:00', 4, 0, 1),
(346, 358, 5000, 5000, 0, 300, 1700, '2019-06-24 05:58:47', '0000-00-00 00:00:00', 4, 0, 1),
(347, 359, 5000, 5000, 0, 200, 1800, '2019-06-24 06:00:12', '0000-00-00 00:00:00', 4, 0, 1),
(348, 360, 5000, 5000, 0, 400, 1600, '2019-06-24 06:01:18', '0000-00-00 00:00:00', 4, 0, 1),
(349, 361, 5000, 5000, 0, 200, 1800, '2019-06-24 06:02:29', '0000-00-00 00:00:00', 4, 0, 1),
(350, 362, 5000, 5000, 0, 200, 1800, '2019-06-24 06:03:28', '0000-00-00 00:00:00', 4, 0, 1),
(351, 363, 5000, 5000, 0, 200, 1800, '2019-06-24 06:04:20', '0000-00-00 00:00:00', 4, 0, 1),
(352, 364, 5000, 5000, 0, 500, 1500, '2019-06-24 06:05:31', '0000-00-00 00:00:00', 4, 0, 1),
(353, 365, 5000, 5000, 0, 200, 1800, '2019-06-24 06:06:33', '0000-00-00 00:00:00', 4, 0, 1),
(354, 366, 5000, 5000, 0, 500, 1500, '2019-06-24 06:07:32', '0000-00-00 00:00:00', 4, 0, 1),
(355, 367, 5000, 5000, 0, 500, 1500, '2019-06-24 06:08:53', '0000-00-00 00:00:00', 4, 0, 1),
(356, 368, 5000, 5000, 0, 400, 1600, '2019-06-24 06:09:54', '0000-00-00 00:00:00', 4, 0, 1),
(357, 369, 5000, 5000, 0, 200, 1800, '2019-06-24 06:22:27', '0000-00-00 00:00:00', 4, 0, 1),
(358, 370, 5000, 5000, 0, 0, 2000, '2019-06-24 06:24:32', '0000-00-00 00:00:00', 4, 0, 1),
(359, 371, 5000, 5000, 0, 500, 1500, '2019-06-24 06:34:47', '0000-00-00 00:00:00', 4, 0, 1),
(360, 372, 5000, 5000, 0, 400, 1600, '2019-06-24 06:37:43', '0000-00-00 00:00:00', 4, 0, 1),
(361, 373, 5000, 5000, 0, 200, 1800, '2019-06-24 06:39:22', '0000-00-00 00:00:00', 4, 0, 1),
(362, 374, 5000, 5000, 0, 300, 1700, '2019-06-24 06:44:42', '0000-00-00 00:00:00', 4, 0, 1),
(363, 375, 5000, 5000, 0, 200, 1800, '2019-06-24 06:46:29', '0000-00-00 00:00:00', 4, 0, 1),
(364, 376, 5000, 5000, 0, 500, 1500, '2019-06-24 06:48:29', '0000-00-00 00:00:00', 4, 0, 1),
(365, 377, 5000, 5000, 0, 500, 1500, '2019-06-24 07:07:27', '0000-00-00 00:00:00', 4, 0, 1),
(366, 378, 5000, 5000, 0, 700, 1300, '2019-06-24 07:11:34', '0000-00-00 00:00:00', 4, 0, 1),
(367, 379, 5000, 5000, 0, 500, 1500, '2019-06-25 03:06:51', '0000-00-00 00:00:00', 4, 0, 1),
(368, 380, 5000, 5000, 0, 500, 1500, '2019-06-25 03:08:24', '0000-00-00 00:00:00', 4, 0, 1),
(369, 381, 5000, 500, 0, 200, 1800, '2019-07-09 13:08:54', '0000-00-00 00:00:00', 4, 0, 1),
(370, 382, 5000, 5000, 0, 200, 1800, '2019-06-25 03:12:54', '0000-00-00 00:00:00', 4, 0, 1),
(371, 383, 5000, 5000, 0, 400, 1600, '2019-06-25 03:14:52', '0000-00-00 00:00:00', 4, 0, 1),
(372, 384, 5000, 5000, 0, 200, 1800, '2019-06-25 03:16:26', '0000-00-00 00:00:00', 4, 0, 1),
(373, 385, 5000, 5000, 0, 300, 1700, '2019-06-25 03:18:32', '0000-00-00 00:00:00', 4, 0, 1),
(374, 386, 5000, 5000, 0, 500, 1500, '2019-06-25 03:21:22', '0000-00-00 00:00:00', 4, 0, 1),
(375, 387, 5000, 5000, 0, 0, 2000, '2019-06-25 03:25:26', '0000-00-00 00:00:00', 4, 0, 1),
(376, 388, 5000, 5000, 0, 0, 2000, '2019-06-25 03:26:52', '0000-00-00 00:00:00', 4, 0, 1),
(377, 389, 5000, 5000, 0, 0, 2000, '2019-06-25 03:27:47', '0000-00-00 00:00:00', 4, 0, 1),
(378, 390, 5000, 5000, 0, 300, 1700, '2019-06-25 03:30:17', '0000-00-00 00:00:00', 4, 0, 1),
(379, 391, 5000, 5000, 0, 500, 1500, '2019-06-25 03:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(380, 392, 5000, 5000, 0, 800, 1200, '2019-06-25 03:35:14', '0000-00-00 00:00:00', 4, 0, 1),
(381, 393, 5000, 5000, 0, 200, 1800, '2019-06-25 03:38:08', '0000-00-00 00:00:00', 4, 0, 1),
(382, 394, 5000, 5000, 0, 600, 1400, '2019-06-25 03:39:37', '0000-00-00 00:00:00', 4, 0, 1),
(383, 395, 5000, 5000, 0, 200, 1800, '2019-06-25 03:41:09', '0000-00-00 00:00:00', 4, 0, 1),
(384, 396, 5000, 5000, 0, 400, 1600, '2019-06-25 03:42:36', '0000-00-00 00:00:00', 4, 0, 1),
(385, 397, 5000, 5000, 0, 200, 1800, '2019-06-25 03:44:10', '0000-00-00 00:00:00', 4, 0, 1),
(386, 398, 5000, 5000, 0, 500, 1500, '2019-06-25 03:45:57', '0000-00-00 00:00:00', 4, 0, 1),
(387, 399, 5000, 5000, 0, 700, 1300, '2019-06-25 03:48:32', '0000-00-00 00:00:00', 4, 0, 1),
(388, 400, 5000, 5000, 0, 500, 1500, '2019-06-25 03:50:13', '0000-00-00 00:00:00', 4, 0, 1),
(389, 401, 5000, 5000, 0, 700, 1300, '2019-06-25 04:10:52', '0000-00-00 00:00:00', 4, 0, 1),
(390, 402, 5000, 5000, 0, 200, 1800, '2019-06-25 04:12:13', '0000-00-00 00:00:00', 4, 0, 1),
(391, 403, 5000, 5000, 0, 500, 1500, '2019-06-25 04:14:17', '0000-00-00 00:00:00', 4, 0, 1),
(392, 404, 5000, 5000, 0, 200, 1800, '2019-06-25 04:15:37', '0000-00-00 00:00:00', 4, 0, 1),
(393, 405, 5000, 5000, 0, 200, 1800, '2019-06-25 04:17:40', '0000-00-00 00:00:00', 4, 0, 1),
(394, 406, 5000, 5000, 0, 0, 2000, '2019-06-25 04:19:14', '0000-00-00 00:00:00', 4, 0, 1),
(395, 407, 5000, 5000, 0, 0, 2000, '2019-06-25 04:20:24', '0000-00-00 00:00:00', 4, 0, 1),
(396, 408, 5000, 5000, 0, 200, 1800, '2019-06-25 04:22:03', '0000-00-00 00:00:00', 4, 0, 1),
(397, 409, 5000, 5000, 0, 700, 1300, '2019-06-25 04:24:10', '0000-00-00 00:00:00', 4, 0, 1),
(398, 410, 5000, 5000, 0, 700, 1300, '2019-06-25 04:26:15', '0000-00-00 00:00:00', 4, 0, 1),
(399, 411, 5000, 5000, 0, 600, 1400, '2019-06-25 04:30:41', '0000-00-00 00:00:00', 4, 0, 1),
(400, 412, 5000, 5000, 0, 500, 1500, '2019-06-25 04:32:04', '0000-00-00 00:00:00', 4, 0, 1),
(401, 413, 5000, 5000, 0, 200, 1800, '2019-06-25 04:33:32', '0000-00-00 00:00:00', 4, 0, 1),
(402, 414, 5000, 5000, 0, 200, 1800, '2019-06-25 04:35:08', '0000-00-00 00:00:00', 4, 0, 1),
(403, 415, 5000, 5000, 0, 200, 1800, '2019-06-25 04:37:38', '0000-00-00 00:00:00', 4, 0, 1),
(404, 416, 5000, 5000, 0, 300, 1700, '2019-06-25 04:43:49', '0000-00-00 00:00:00', 4, 0, 1),
(405, 417, 5000, 5000, 0, 300, 1700, '2019-06-25 04:46:00', '0000-00-00 00:00:00', 4, 0, 1),
(406, 418, 5000, 5000, 0, 300, 1700, '2019-06-25 04:47:35', '0000-00-00 00:00:00', 4, 0, 1),
(407, 419, 5000, 5000, 0, 400, 1600, '2019-06-25 04:49:49', '0000-00-00 00:00:00', 4, 0, 1),
(408, 420, 5000, 5000, 0, 200, 1800, '2019-06-25 04:51:33', '0000-00-00 00:00:00', 4, 0, 1),
(409, 421, 5000, 5000, 0, 700, 1300, '2019-06-25 05:24:05', '0000-00-00 00:00:00', 4, 0, 1),
(410, 422, 5000, 5000, 0, 400, 1600, '2019-06-25 05:25:39', '0000-00-00 00:00:00', 4, 0, 1),
(411, 423, 5000, 5000, 0, 300, 1700, '2019-06-25 05:27:45', '0000-00-00 00:00:00', 4, 0, 1),
(412, 424, 5000, 5000, 0, 300, 1700, '2019-06-25 05:29:29', '0000-00-00 00:00:00', 4, 0, 1),
(413, 425, 5000, 5000, 0, 300, 1600, '2019-06-25 05:41:35', '0000-00-00 00:00:00', 4, 0, 1),
(414, 426, 5000, 5000, 0, 300, 1700, '2019-06-25 05:44:44', '0000-00-00 00:00:00', 4, 0, 1),
(415, 427, 5000, 5000, 0, 200, 1800, '2019-06-25 05:46:23', '0000-00-00 00:00:00', 4, 0, 1),
(416, 428, 5000, 5000, 0, 500, 1500, '2019-06-25 05:48:21', '0000-00-00 00:00:00', 4, 0, 1),
(417, 429, 5000, 5000, 0, 500, 1500, '2019-06-25 05:48:22', '0000-00-00 00:00:00', 4, 0, 1),
(418, 430, 5000, 5000, 0, 300, 1700, '2019-06-25 05:50:10', '0000-00-00 00:00:00', 4, 0, 1),
(419, 431, 5000, 5000, 0, 500, 1500, '2019-06-25 05:51:53', '0000-00-00 00:00:00', 4, 0, 1),
(420, 432, 5000, 5000, 0, 700, 1300, '2019-06-25 05:54:09', '0000-00-00 00:00:00', 4, 0, 1),
(421, 433, 5000, 5000, 0, 200, 1800, '2019-06-25 05:55:45', '0000-00-00 00:00:00', 4, 0, 1),
(422, 434, 5000, 3000, 0, 0, 2000, '2019-07-09 13:09:00', '0000-00-00 00:00:00', 4, 0, 1),
(423, 437, 5000, 5000, 0, 0, 2000, '2019-06-25 06:04:46', '0000-00-00 00:00:00', 4, 0, 1),
(424, 438, 5000, 5000, 0, 200, 1800, '2019-06-25 06:06:07', '0000-00-00 00:00:00', 4, 0, 1),
(425, 439, 5000, 5000, 0, 0, 2000, '2019-06-25 06:07:55', '0000-00-00 00:00:00', 4, 0, 1),
(426, 440, 5000, 5000, 0, 400, 1600, '2019-06-25 06:09:30', '0000-00-00 00:00:00', 4, 0, 1),
(427, 441, 5000, 5000, 0, 200, 1800, '2019-06-25 06:11:05', '0000-00-00 00:00:00', 4, 0, 1),
(428, 442, 5000, 5000, 0, 200, 1800, '2019-06-25 06:12:31', '0000-00-00 00:00:00', 4, 0, 1),
(429, 443, 5000, 3000, 0, 0, 2000, '2019-07-09 13:09:05', '0000-00-00 00:00:00', 4, 0, 1),
(430, 444, 5000, 5000, 0, 500, 1500, '2019-06-25 06:15:52', '0000-00-00 00:00:00', 4, 0, 1),
(431, 445, 5000, 5000, 0, 0, 2000, '2019-06-25 06:18:11', '0000-00-00 00:00:00', 4, 0, 1),
(432, 446, 5000, 5000, 0, 200, 1800, '2019-06-25 06:20:05', '0000-00-00 00:00:00', 4, 0, 1),
(433, 447, 5000, 5000, 0, 200, 1800, '2019-06-25 06:21:42', '0000-00-00 00:00:00', 4, 0, 1),
(434, 448, 5000, 5000, 0, 200, 1800, '2019-06-25 06:23:05', '0000-00-00 00:00:00', 4, 0, 1),
(435, 449, 5000, 5000, 0, 0, 2000, '2019-06-25 06:25:22', '0000-00-00 00:00:00', 4, 0, 1),
(436, 450, 5000, 5000, 0, 300, 1700, '2019-06-25 06:26:57', '0000-00-00 00:00:00', 4, 0, 1),
(437, 451, 5000, 5000, 0, 800, 1200, '2019-06-25 06:28:15', '0000-00-00 00:00:00', 4, 0, 1),
(438, 452, 5000, 5000, 0, 200, 1800, '2019-06-25 06:29:51', '0000-00-00 00:00:00', 4, 0, 1),
(439, 453, 5000, 5000, 0, 300, 1700, '2019-06-25 06:31:21', '0000-00-00 00:00:00', 4, 0, 1),
(440, 454, 5000, 5000, 0, 0, 2000, '2019-06-25 06:32:50', '0000-00-00 00:00:00', 4, 0, 1),
(441, 455, 5000, 5000, 0, 0, 2000, '2019-06-25 06:34:35', '0000-00-00 00:00:00', 4, 0, 1),
(442, 456, 5000, 5000, 0, 0, 2000, '2019-06-25 06:36:08', '0000-00-00 00:00:00', 4, 0, 1),
(443, 457, 5000, 5000, 0, 0, 2000, '2019-06-25 06:37:34', '0000-00-00 00:00:00', 4, 0, 1),
(444, 458, 5000, 5000, 0, 200, 2000, '2019-06-25 07:17:49', '0000-00-00 00:00:00', 4, 0, 1),
(445, 459, 5000, 5000, 0, 500, 2000, '2019-06-25 07:09:46', '0000-00-00 00:00:00', 4, 0, 1),
(446, 460, 5000, 5000, 0, 0, 2000, '2019-06-25 07:21:23', '0000-00-00 00:00:00', 4, 0, 1),
(447, 461, 5000, 5000, 0, 0, 2000, '2019-06-25 07:22:31', '0000-00-00 00:00:00', 4, 0, 1),
(448, 462, 5000, 5000, 0, 0, 2000, '2019-06-25 07:23:54', '0000-00-00 00:00:00', 4, 0, 1),
(449, 463, 5000, 5000, 0, 200, 1800, '2019-06-25 07:25:21', '0000-00-00 00:00:00', 4, 0, 1),
(450, 464, 5000, 5000, 0, 0, 2000, '2019-06-25 07:27:52', '0000-00-00 00:00:00', 4, 0, 1),
(451, 465, 5000, 5000, 0, 200, 1800, '2019-06-25 07:29:28', '0000-00-00 00:00:00', 4, 0, 1),
(452, 466, 5000, 5000, 0, 2000, 0, '2019-06-25 07:31:04', '0000-00-00 00:00:00', 4, 0, 1),
(453, 467, 5000, 5000, 0, 0, 2000, '2019-06-25 07:32:37', '0000-00-00 00:00:00', 4, 0, 1),
(454, 468, 5000, 5000, 0, 300, 1700, '2019-06-25 07:33:47', '0000-00-00 00:00:00', 4, 0, 1),
(455, 469, 5000, 5000, 0, 0, 2000, '2019-06-25 07:34:58', '0000-00-00 00:00:00', 4, 0, 1),
(456, 470, 5000, 5000, 0, 300, 1700, '2019-06-25 07:36:57', '0000-00-00 00:00:00', 4, 0, 1),
(457, 471, 5000, 5000, 0, 200, 1800, '2019-06-25 07:39:05', '0000-00-00 00:00:00', 4, 0, 1),
(458, 472, 5000, 5000, 0, 0, 2000, '2019-06-25 07:40:33', '0000-00-00 00:00:00', 4, 0, 1),
(459, 473, 5000, 5000, 0, 200, 1800, '2019-06-25 07:41:53', '0000-00-00 00:00:00', 4, 0, 1),
(460, 474, 5000, 5000, 0, 2000, 0, '2019-06-25 07:42:59', '0000-00-00 00:00:00', 4, 0, 1),
(461, 475, 5000, 5000, 0, 300, 1700, '2019-06-25 07:44:26', '0000-00-00 00:00:00', 4, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_fee_installments`
--

CREATE TABLE `std_fee_installments` (
  `fee_installment_id` int(11) NOT NULL,
  `std_fee_id` int(11) NOT NULL,
  `installment_no` int(11) NOT NULL,
  `installment_amount` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `std_fee_pkg`
--

CREATE TABLE `std_fee_pkg` (
  `std_fee_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `admission_fee` double NOT NULL,
  `tutuion_fee` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_fee_pkg`
--

INSERT INTO `std_fee_pkg` (`std_fee_id`, `session_id`, `class_id`, `admission_fee`, `tutuion_fee`, `created_at`, `created_by`, `updated_at`, `updated_by`, `delete_status`) VALUES
(1, 1, 1, 5000, 2000, '2019-06-18 10:54:46', 1, '0000-00-00 00:00:00', 0, 1),
(2, 1, 2, 5000, 2000, '2019-06-18 10:55:03', 1, '0000-00-00 00:00:00', 0, 1),
(3, 1, 3, 5000, 2000, '2019-06-18 10:55:20', 1, '0000-00-00 00:00:00', 0, 1),
(4, 1, 4, 5000, 2000, '2019-06-18 10:55:54', 1, '0000-00-00 00:00:00', 0, 1),
(5, 1, 5, 5000, 2000, '2019-06-18 10:56:06', 1, '0000-00-00 00:00:00', 0, 1),
(6, 1, 6, 5000, 2000, '2019-06-18 10:56:18', 1, '0000-00-00 00:00:00', 0, 1),
(7, 1, 7, 5000, 2000, '2019-06-18 10:56:31', 1, '0000-00-00 00:00:00', 0, 1),
(8, 1, 8, 5000, 2000, '2019-06-18 10:56:58', 1, '0000-00-00 00:00:00', 0, 1),
(9, 2, 9, 5000, 2000, '2019-06-24 09:51:57', 4, '0000-00-00 00:00:00', 0, 1),
(10, 2, 11, 5000, 2000, '2019-06-24 09:53:04', 4, '0000-00-00 00:00:00', 0, 1),
(11, 2, 12, 5000, 2000, '2019-06-24 09:53:17', 4, '0000-00-00 00:00:00', 0, 1),
(12, 2, 13, 5000, 2000, '2019-06-25 10:21:20', 4, '0000-00-00 00:00:00', 0, 1),
(13, 2, 14, 5000, 2000, '2019-06-25 12:21:07', 4, '2019-06-25 12:21:07', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_guardian_info`
--

CREATE TABLE `std_guardian_info` (
  `std_guardian_info_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `guardian_name` varchar(50) NOT NULL,
  `guardian_relation` varchar(50) NOT NULL,
  `guardian_cnic` varchar(15) NOT NULL,
  `guardian_email` varchar(84) NOT NULL,
  `guardian_contact_no_1` varchar(15) NOT NULL,
  `guardian_contact_no_2` varchar(15) NOT NULL,
  `guardian_monthly_income` int(11) DEFAULT NULL,
  `guardian_occupation` varchar(50) NOT NULL,
  `guardian_designation` varchar(100) NOT NULL,
  `guardian_password` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_guardian_info`
--

INSERT INTO `std_guardian_info` (`std_guardian_info_id`, `std_id`, `guardian_name`, `guardian_relation`, `guardian_cnic`, `guardian_email`, `guardian_contact_no_1`, `guardian_contact_no_2`, `guardian_monthly_income`, `guardian_occupation`, `guardian_designation`, `guardian_password`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(3, 3, 'M.USMAN', 'FATHER', '31303-2299367-5', '', '+92-307-2921030', '', NULL, '', '', '1006', '2019-06-20 01:02:49', '0000-00-00 00:00:00', 1, 0, 1),
(6, 13, '', '', '', '', '+92-300-6700150', '', NULL, '', '', '6296', '2019-06-21 00:42:20', '0000-00-00 00:00:00', 1, 0, 1),
(7, 14, '', '', '', '', '+92-300-9675661', '', NULL, '', '', '8115', '2019-06-21 00:48:23', '0000-00-00 00:00:00', 1, 0, 1),
(8, 15, '', '', '31303-2346889-3', '', '+92-300-9675661', '', NULL, '', '', '3684', '2019-06-21 00:51:08', '0000-00-00 00:00:00', 1, 0, 1),
(9, 16, '', '', '', '', '+92-301-2037177', '', NULL, '', '', '5075', '2019-06-21 00:52:42', '0000-00-00 00:00:00', 1, 0, 1),
(10, 17, '', '', '31303-0862575-5', '', '+92-300-8776117', '', NULL, '', '', '1379', '2019-06-21 00:54:43', '0000-00-00 00:00:00', 1, 0, 1),
(11, 18, '', '', '31303-2444997-3', '', '+92-334-7370402', '', NULL, '', '', '2326', '2019-06-21 01:42:01', '0000-00-00 00:00:00', 1, 0, 1),
(12, 19, '', '', '31303-0112305-5', '', '', '', NULL, '', '', '4358', '2019-06-21 00:59:08', '0000-00-00 00:00:00', 1, 0, 1),
(13, 20, '', '', '31303-0112305-5', '', '+92-300-4784925', '', NULL, '', '', '5629', '2019-06-21 01:41:24', '0000-00-00 00:00:00', 1, 0, 1),
(14, 21, '', '', '', '', '+92-300-6810734', '', NULL, '', '', '4825', '2019-06-21 01:39:58', '0000-00-00 00:00:00', 1, 0, 1),
(15, 22, '', '', '31303-1648649-1', '', '', '', NULL, '', '', '1137', '2019-06-21 01:06:25', '0000-00-00 00:00:00', 1, 0, 1),
(16, 23, '', '', '31303-5420865-5', '', '', '', NULL, '', '', '4211', '2019-06-21 01:07:53', '0000-00-00 00:00:00', 1, 0, 1),
(17, 24, '', '', '31201-9305939-1', '', '+92-301-5276748', '', NULL, '', '', '1749', '2019-06-21 01:38:42', '0000-00-00 00:00:00', 1, 0, 1),
(18, 25, '', '', '31303-7562165-3', '', '+92-303-2130005', '', NULL, '', '', '5375', '2019-06-21 01:38:14', '0000-00-00 00:00:00', 1, 0, 1),
(19, 26, '', '', '31303-2453479-9', '', '+92-301-4635741', '', NULL, '', '', '6377', '2019-06-21 01:37:48', '0000-00-00 00:00:00', 1, 0, 1),
(20, 27, '', '', '31303-1648649-1', '', '+92-345-8033034', '', NULL, '', '', '1354', '2019-06-21 01:37:14', '0000-00-00 00:00:00', 1, 0, 1),
(21, 28, '', '', '31303-2347046-3', '', '+92-304-3368813', '', NULL, '', '', '4336', '2019-06-21 01:36:46', '0000-00-00 00:00:00', 1, 0, 1),
(22, 29, '', '', '31301-0193992-3', '', '+92-300-7666532', '', NULL, '', '', '8261', '2019-06-21 01:36:20', '0000-00-00 00:00:00', 1, 0, 1),
(23, 30, '', '', '31304-5828810-5', '', '+92-307-7984330', '', NULL, '', '', '3978', '2019-06-21 01:35:42', '0000-00-00 00:00:00', 1, 0, 1),
(24, 31, '', '', '', '', '', '', NULL, '', '', '4540', '2019-06-21 01:20:07', '0000-00-00 00:00:00', 1, 0, 1),
(25, 32, '', '', '', '', '', '', NULL, '', '', '9967', '2019-06-21 01:21:33', '0000-00-00 00:00:00', 1, 0, 1),
(26, 33, '', '', '35302-6027573-1', '', '+92-300-9676345', '', NULL, '', '', '1483', '2019-06-21 01:34:26', '0000-00-00 00:00:00', 1, 0, 1),
(27, 34, '', '', '31303-1055062-9', '', '+92-333-8222208', '', NULL, '', '', '6964', '2019-06-21 01:24:52', '0000-00-00 00:00:00', 1, 0, 1),
(28, 35, '', '', '31303-2389760-3', '', '+92-300-6703009', '', NULL, '', '', '9571', '2019-06-21 01:32:53', '0000-00-00 00:00:00', 1, 0, 1),
(29, 36, '', '', '31303-2389760-7', '', '+92-306-1775432', '', NULL, '', '', '8189', '2019-06-21 01:30:30', '0000-00-00 00:00:00', 1, 0, 1),
(30, 37, '', '', '31303-8076751-1', '', '+92-300-6732304', '', NULL, '', '', '1921', '2019-06-21 01:32:13', '0000-00-00 00:00:00', 1, 0, 1),
(31, 38, '', '', '', '', '+92-300-6701420', '', NULL, '', '', '4798', '2019-06-21 02:23:46', '0000-00-00 00:00:00', 1, 0, 1),
(32, 39, '', '', '', '', '+92-301-7664889', '', NULL, '', '', '4662', '2019-06-21 02:26:14', '0000-00-00 00:00:00', 1, 0, 1),
(33, 40, '', '', '31303-7364267-7', '', '+92-301-7625451', '', NULL, '', '', '9482', '2019-06-21 02:27:53', '0000-00-00 00:00:00', 1, 0, 1),
(34, 41, '', '', '31303-7364267-7', '', '+92-301-7625451', '', NULL, '', '', '3471', '2019-06-21 02:31:49', '0000-00-00 00:00:00', 1, 0, 1),
(35, 42, '', '', '31303-1163305-9', '', '+92-308-7651407', '', NULL, '', '', '7169', '2019-06-21 02:39:18', '0000-00-00 00:00:00', 1, 0, 1),
(36, 43, '', '', '31303-0924997-3', '', '+92-300-9671009', '', NULL, '', '', '6580', '2019-06-21 02:48:57', '0000-00-00 00:00:00', 1, 0, 1),
(37, 44, '', '', '31303-2040850-9', '', '+92-300-6703957', '', NULL, '', '', '5777', '2019-06-21 03:13:17', '0000-00-00 00:00:00', 1, 0, 1),
(38, 45, '', '', '31303-4057163-5', '', '+92-305-6831200', '', NULL, '', '', '7804', '2019-06-21 03:16:19', '0000-00-00 00:00:00', 1, 0, 1),
(39, 46, '', '', '31303-1732768-9', '', '+92-300-8772521', '', NULL, '', '', '8616', '2019-06-21 03:17:57', '0000-00-00 00:00:00', 1, 0, 1),
(40, 47, '', '', '31303-0235822-5', '', '+92-345-8049880', '', NULL, '', '', '4237', '2019-06-21 03:20:08', '0000-00-00 00:00:00', 1, 0, 1),
(41, 48, '', '', '31303-0235822-5', '', '+92-345-8049880', '', NULL, '', '', '3002', '2019-06-21 03:21:33', '0000-00-00 00:00:00', 1, 0, 1),
(42, 49, '', '', '31304-9963766-7', '', '+92-300-7824052', '', NULL, '', '', '2815', '2019-06-21 03:23:09', '0000-00-00 00:00:00', 1, 0, 1),
(43, 50, '', '', '31303-4897794-1', '', '+92-301-6787031', '', NULL, '', '', '3512', '2019-06-21 04:09:02', '0000-00-00 00:00:00', 1, 0, 1),
(44, 51, '', '', '', '', '+92-345-8746007', '', NULL, '', '', '4472', '2019-06-21 04:13:27', '0000-00-00 00:00:00', 1, 0, 1),
(45, 52, '', '', '', '', '', '', NULL, '', '', '4344', '2019-06-21 04:14:43', '0000-00-00 00:00:00', 1, 0, 1),
(46, 53, '', '', '', '', '+92-300-9671392', '', NULL, '', '', '1133', '2019-06-21 04:16:17', '0000-00-00 00:00:00', 1, 0, 1),
(47, 54, '', '', '', '', '+92-300-8677238', '', NULL, '', '', '8987', '2019-06-21 04:17:45', '0000-00-00 00:00:00', 1, 0, 1),
(48, 55, '', '', '31303-9161238-1', '', '+92-300-3283051', '', NULL, '', '', '4768', '2019-06-21 04:25:18', '0000-00-00 00:00:00', 1, 0, 1),
(49, 56, '', '', '31303-7730814-7', '', '+92-300-9676843', '', NULL, '', '', '4538', '2019-06-21 04:26:54', '0000-00-00 00:00:00', 1, 0, 1),
(50, 57, '', '', '31303-2375949-9', '', '+92-321-6706974', '', NULL, '', '', '9583', '2019-06-21 04:28:25', '0000-00-00 00:00:00', 1, 0, 1),
(51, 58, '', '', '31303-1237754-1', '', '+92-302-3647017', '', NULL, '', '', '7080', '2019-06-21 04:30:44', '0000-00-00 00:00:00', 1, 0, 1),
(52, 59, '', '', '', '', '+92-302-6809955', '', NULL, '', '', '1561', '2019-06-21 04:31:58', '0000-00-00 00:00:00', 1, 0, 1),
(53, 60, '', '', '', '', '', '', NULL, '', '', '2615', '2019-06-21 04:34:35', '0000-00-00 00:00:00', 1, 0, 1),
(54, 61, '', '', '', '', '', '', NULL, '', '', '5831', '2019-06-21 04:38:09', '0000-00-00 00:00:00', 1, 0, 1),
(55, 62, '', '', '31303-2405453-7', '', '+92-300-6708834', '', NULL, '', '', '3043', '2019-06-21 04:40:23', '0000-00-00 00:00:00', 1, 0, 1),
(56, 63, '', '', '31303-6859832-9', '', '+92-311-8182114', '', NULL, '', '', '8344', '2019-06-21 04:43:56', '0000-00-00 00:00:00', 1, 0, 1),
(57, 64, '', '', '', '', '+92-300-9675099', '', NULL, '', '', '4069', '2019-06-21 04:45:44', '0000-00-00 00:00:00', 1, 0, 1),
(58, 65, '', '', '31303-0305406-7', '', '+92-308-6829202', '', NULL, '', '', '4753', '2019-06-21 04:47:40', '0000-00-00 00:00:00', 1, 0, 1),
(59, 66, '', '', '31303-7027171-3', '', '+92-300-7824455', '', NULL, '', '', '3052', '2019-06-21 04:50:08', '0000-00-00 00:00:00', 1, 0, 1),
(60, 67, '', '', '31303-6197860-3', '', '+92-304-7945517', '', NULL, '', '', '2333', '2019-06-21 04:51:46', '0000-00-00 00:00:00', 1, 0, 1),
(61, 68, '', '', '31303-3805594-1', '', '+92-300-6748085', '', NULL, '', '', '4398', '2019-06-21 04:53:57', '0000-00-00 00:00:00', 1, 0, 1),
(62, 69, '', '', '', '', '+92-321-6745564', '', NULL, '', '', '4965', '2019-06-21 04:55:15', '0000-00-00 00:00:00', 1, 0, 1),
(63, 70, '', '', '31303-1689170-7', '', '+92-305-8489422', '', NULL, '', '', '6131', '2019-06-21 04:56:34', '0000-00-00 00:00:00', 1, 0, 1),
(64, 71, '', '', '31301-1472413-7', '', '+92-333-7492486', '', NULL, '', '', '3504', '2019-06-21 04:57:55', '0000-00-00 00:00:00', 1, 0, 1),
(65, 72, '', '', '31303-3444838-7', '', '+92-300-6752456', '', NULL, '', '', '1728', '2019-06-21 05:02:53', '0000-00-00 00:00:00', 1, 0, 1),
(66, 73, '', '', '31303-0862575-5', '', '+92-300-8776117', '', NULL, '', '', '5453', '2019-06-21 05:05:42', '0000-00-00 00:00:00', 1, 0, 1),
(67, 74, '', '', '31303-8035307-3', '', '+92-301-5986479', '', NULL, '', '', '7637', '2019-06-21 05:11:26', '0000-00-00 00:00:00', 1, 0, 1),
(68, 75, '', '', '', '', '+92-308-7175432', '', NULL, '', '', '7334', '2019-06-21 05:12:27', '0000-00-00 00:00:00', 1, 0, 1),
(69, 76, '', '', '', '', '+92-308-7175432', '', NULL, '', '', '1039', '2019-06-21 05:15:25', '0000-00-00 00:00:00', 1, 0, 1),
(70, 77, '', '', '', '', '+92-301-6757835', '', NULL, '', '', '4774', '2019-06-21 05:16:31', '0000-00-00 00:00:00', 1, 0, 1),
(71, 78, '', '', '31303-6776023-3', '', '+92-301-7663687', '', NULL, '', '', '8904', '2019-06-21 05:18:02', '0000-00-00 00:00:00', 1, 0, 1),
(72, 79, '', '', '31303-3226631-5', '', '+92-333-6137341', '', NULL, '', '', '3724', '2019-06-21 05:21:19', '0000-00-00 00:00:00', 1, 0, 1),
(73, 80, '', '', '', '', '+92-305-2882759', '', NULL, '', '', '2884', '2019-06-21 05:25:22', '0000-00-00 00:00:00', 1, 0, 1),
(74, 81, '', '', '', '', '+92-342-8719764', '', NULL, '', '', '7131', '2019-06-21 05:31:27', '0000-00-00 00:00:00', 1, 0, 1),
(75, 82, '', '', '31303-7247815-1', '', '+92-300-7820667', '', NULL, '', '', '6125', '2019-06-21 05:34:01', '0000-00-00 00:00:00', 1, 0, 1),
(76, 83, '', '', '31303-2389809-5', '', '+92-300-6770007', '', NULL, '', '', '8034', '2019-06-21 05:35:44', '0000-00-00 00:00:00', 1, 0, 1),
(77, 84, 'RAO NAVEED AKHTAR', '', '', '', '+92-300-9677840', '', NULL, '', '', '4124', '2019-06-21 05:37:35', '0000-00-00 00:00:00', 1, 0, 1),
(78, 85, '', '', '', '', '+92-306-7789174', '', NULL, '', '', '6094', '2019-06-21 05:41:10', '0000-00-00 00:00:00', 1, 0, 1),
(79, 86, '', '', '31303-5767126-9', '', '+92-300-6742422', '', NULL, '', '', '6197', '2019-06-21 05:43:32', '0000-00-00 00:00:00', 1, 0, 1),
(80, 87, '', '', '31301-0461093-3', '', '+92-341-8288299', '', NULL, '', '', '8968', '2019-06-21 05:45:40', '0000-00-00 00:00:00', 1, 0, 1),
(81, 88, '', '', '31303-3727833-7', '', '+92-302-5772715', '', NULL, '', '', '3573', '2019-06-21 05:48:21', '0000-00-00 00:00:00', 1, 0, 1),
(82, 89, '', '', '36103-7738610-1', '', '+92-315-6430049', '', NULL, '', '', '3837', '2019-06-21 05:49:40', '0000-00-00 00:00:00', 1, 0, 1),
(83, 90, 'MUHAMMAD JAMIL', '', '31202-1577498-5', '', '+92-308-8628563', '', NULL, '', '', '6936', '2019-06-21 05:51:17', '0000-00-00 00:00:00', 1, 0, 1),
(84, 91, '', '', '', '', '+92-308-7613135', '', NULL, '', '', '3036', '2019-06-21 05:53:04', '0000-00-00 00:00:00', 1, 0, 1),
(85, 92, '', '', '31204-7898397-7', '', '+92-333-6343679', '', NULL, '', '', '7094', '2019-06-21 05:55:21', '0000-00-00 00:00:00', 1, 0, 1),
(86, 93, '', '', '31303-2449090-1', '', '+92-300-6750005', '+92-300-8670677', NULL, '', '', '3594', '2019-06-21 05:57:17', '0000-00-00 00:00:00', 1, 0, 1),
(87, 94, '', '', '31303-4173289-5', '', '+92-300-8778359', '', NULL, '', '', '5037', '2019-06-21 05:58:58', '0000-00-00 00:00:00', 1, 0, 1),
(88, 95, '', '', '31303-9366541-1', '', '+92-300-9671675', '', NULL, '', '', '4733', '2019-06-21 06:02:46', '0000-00-00 00:00:00', 1, 0, 1),
(89, 96, '', '', '31303-8909771-9', '', '+92-303-4898652', '', NULL, '', '', '1881', '2019-06-21 06:04:36', '0000-00-00 00:00:00', 1, 0, 1),
(90, 97, '', '', '31303-2351883-1', '', '+92-300-8775524', '', NULL, '', '', '4187', '2019-06-21 06:06:23', '0000-00-00 00:00:00', 1, 0, 1),
(91, 98, '', '', '31303-4346156-5', '', '+92-321-6700715', '', NULL, '', '', '6093', '2019-06-21 06:07:43', '0000-00-00 00:00:00', 1, 0, 1),
(92, 99, '', '', '31303-6914834-9', '', '+92-300-6716263', '', NULL, '', '', '3935', '2019-06-21 06:09:35', '0000-00-00 00:00:00', 1, 0, 1),
(93, 100, '', '', '31303-6635885-5', '', '+92-303-8743300', '', NULL, '', '', '5843', '2019-06-21 06:11:25', '0000-00-00 00:00:00', 1, 0, 1),
(94, 101, '', '', '31303-4749027-9', '', '+92-300-2145384', '', NULL, '', '', '1324', '2019-06-21 06:12:54', '0000-00-00 00:00:00', 1, 0, 1),
(95, 102, '', '', '31303-7368290-3', '', '+92-305-5570466', '', NULL, '', '', '1211', '2019-06-21 06:15:09', '0000-00-00 00:00:00', 1, 0, 1),
(96, 103, '', '', '31303-2411397-1', '', '+92-305-6712956', '', NULL, '', '', '6871', '2019-06-21 06:16:47', '0000-00-00 00:00:00', 1, 0, 1),
(97, 104, '', '', '31303-8199189-9', '', '+92-300-6734896', '', NULL, '', '', '5773', '2019-06-21 06:18:54', '0000-00-00 00:00:00', 1, 0, 1),
(98, 105, '', '', '31303-8199189-9', '', '', '', NULL, '', '', '1432', '2019-06-21 06:20:56', '0000-00-00 00:00:00', 1, 0, 1),
(99, 106, '', '', '31303-7156586-1', '', '+92-300-6700743', '', NULL, '', '', '5068', '2019-06-21 06:24:23', '0000-00-00 00:00:00', 1, 0, 1),
(100, 107, '', '', '36302-3224050-5', '', '+92-308-7309241', '', NULL, '', '', '1552', '2019-06-21 06:26:35', '0000-00-00 00:00:00', 1, 0, 1),
(101, 108, '', '', '', '', '+92-302-6809955', '', NULL, '', '', '7267', '2019-06-21 06:27:56', '0000-00-00 00:00:00', 1, 0, 1),
(102, 109, 'MUHAMMAD SAJID SHABIR', '', '31303-6527293-7', '', '+92-303-6129843', '', NULL, '', '', '5127', '2019-06-21 06:35:40', '0000-00-00 00:00:00', 1, 0, 1),
(103, 110, 'SYED MUHMMAD ALI REHAN', '', '', '', '+92-300-6734923', '', NULL, '', '', '2489', '2019-06-21 06:37:00', '0000-00-00 00:00:00', 1, 0, 1),
(104, 111, 'SYED IJAZ HUSSAIN SHAH', '', '', '', '+92-306-0358385', '', NULL, '', '', '4632', '2019-06-21 06:38:22', '0000-00-00 00:00:00', 1, 0, 1),
(105, 112, 'TARIQ MAQSOOD', '', '31303-4521636-1', '', '+92-340-0166391', '', NULL, '', '', '1772', '2019-06-21 06:39:46', '0000-00-00 00:00:00', 1, 0, 1),
(106, 113, 'MUHAMMAD HUSSAIN', '', '31303-7482215-9', '', '+92-301-7635957', '', NULL, '', '', '5484', '2019-06-21 06:41:11', '0000-00-00 00:00:00', 1, 0, 1),
(107, 114, 'LAAZER', '', '31303-8600184-5', '', '+92-305-6594921', '', NULL, '', '', '3111', '2019-06-21 06:45:00', '0000-00-00 00:00:00', 1, 0, 1),
(108, 115, 'YAR MUHAMMAD', '', '31303-2347046-3', '', '+92-304-3388813', '', NULL, '', '', '1937', '2019-06-21 06:48:39', '0000-00-00 00:00:00', 1, 0, 1),
(109, 116, 'MUHAMMAD ALTAF', 'FATHER', '31303-2453479-9', '', '+92-300-6738656', '', NULL, '', '', '2550', '2019-06-21 06:51:04', '0000-00-00 00:00:00', 1, 0, 1),
(110, 117, 'RAEES KHADIM HUSSAIN TABSSUM', 'FATHER', '31303-2427985-3', '', '', '', NULL, '', '', '8461', '2019-06-21 06:53:28', '0000-00-00 00:00:00', 1, 0, 1),
(112, 119, 'SHAKEEL', '', '31303-6776023-3', '', '+92-301-7663687', '', NULL, '', '', '7888', '2019-06-21 06:56:17', '0000-00-00 00:00:00', 1, 0, 1),
(113, 120, 'MUHAMMAD ARSHAD HUSSAIN', '', '31303-3805594-1', '', '+92-300-6748085', '', NULL, '', '', '3817', '2019-06-21 06:59:02', '0000-00-00 00:00:00', 1, 0, 1),
(114, 121, 'ABDUL HAMEED', '', '', '', '+92-305-8489422', '', NULL, '', '', '6298', '2019-06-21 07:01:16', '0000-00-00 00:00:00', 1, 0, 1),
(115, 122, 'EJAZ AHMAD', '', '31303-2399085-1', '', '+92-300-6386470', '', NULL, '', '', '3663', '2019-06-21 07:05:13', '0000-00-00 00:00:00', 1, 0, 1),
(116, 123, 'SHEIKH JAMEEL AHMAD', '', '', '', '+92-313-6735188', '', NULL, '', '', '9615', '2019-06-21 07:08:31', '0000-00-00 00:00:00', 1, 0, 1),
(117, 124, 'ABDUL RAHIM', '', '31303-4994885-3', '', '+92-333-6701983', '', NULL, '', '', '6269', '2019-06-21 07:11:08', '0000-00-00 00:00:00', 1, 0, 1),
(118, 125, 'TAYAB MUNEER', 'FATHER', '', '', '+92-321-6709627', '', NULL, '', '', '6154', '2019-06-21 07:12:38', '0000-00-00 00:00:00', 1, 0, 1),
(119, 126, 'M.HAFEEZ', 'FATHER', '31303-5353237-7', '', '+92-305-2750818', '', NULL, '', '', '6021', '2019-06-21 07:14:34', '0000-00-00 00:00:00', 1, 0, 1),
(120, 127, 'ATHER AMEEN', 'FATHER', '31303-1004668-1', '', '+92-300-9672435', '', NULL, '', '', '6347', '2019-06-21 07:15:55', '0000-00-00 00:00:00', 1, 0, 1),
(121, 128, 'MUHAMMAD TOUFEEQ SALEEMI', 'FATHER', '31303-2526349-5', '', '+92-300-9677203', '', NULL, '', '', '9257', '2019-06-21 07:17:31', '0000-00-00 00:00:00', 1, 0, 1),
(122, 129, 'IMRAN MEHMOOD QADARI', 'FATHER', '31303-2408509-9', '', '+92-300-6703957', '', NULL, '', '', '3257', '2019-06-21 07:18:59', '0000-00-00 00:00:00', 1, 0, 1),
(123, 130, 'RIAZ AHMED', 'FATHER', '31303-0324221-4', '', '+92-321-6729065', '', NULL, '', '', '1714', '2019-06-21 07:21:01', '0000-00-00 00:00:00', 1, 0, 1),
(124, 131, 'MUHAMMAD KAMRAN SHAHZAD', 'FATHER', '31303-3334762-5', '', '+92-300-6746424', '', NULL, '', '', '1869', '2019-06-21 07:22:13', '0000-00-00 00:00:00', 1, 0, 1),
(125, 132, 'KHALID JAEVD', 'FATHER', '31303-0177519-1', '', '+92-305-6869877', '', NULL, '', '', '9015', '2019-06-21 07:23:43', '0000-00-00 00:00:00', 1, 0, 1),
(126, 133, 'FAISAL REHMAN (LATE)', 'FATHER', '', '', '+92-307-7942399', '', NULL, '', '', '9439', '2019-06-21 07:26:11', '0000-00-00 00:00:00', 1, 0, 1),
(127, 134, 'MUHAMMAD SHERAZ MAQBOOL', 'FATHER', '31303-4886338-5', '', '+92-306-6447902', '', NULL, '', '', '9669', '2019-06-21 07:28:36', '0000-00-00 00:00:00', 1, 0, 1),
(128, 135, 'IMRAN-UL-HAQ', 'FATHER', '31303-3727833-7', '', '+92-333-8003332', '', NULL, '', '', '7603', '2019-06-21 07:29:52', '0000-00-00 00:00:00', 1, 0, 1),
(129, 136, 'SYED ASIM BUKHARI', 'FATHER', '31303-2405457-_', '', '+92-303-3920702', '', NULL, '', '', '1648', '2019-06-21 07:31:19', '0000-00-00 00:00:00', 1, 0, 1),
(130, 137, 'MUHAMMAD ALTAF', 'FATHER', '31303-8558565-5', '', '+92-300-6736626', '', NULL, '', '', '9557', '2019-06-21 07:32:31', '0000-00-00 00:00:00', 1, 0, 1),
(131, 138, 'GHULAM MUSTAFA', 'FATHER', '31303-1515522-1', '', '+92-310-3317948', '', NULL, '', '', '3500', '2019-06-21 07:34:52', '0000-00-00 00:00:00', 1, 0, 1),
(132, 139, 'M.AFTAB', 'FATHER', '31205-1603873-5', '', '+92-304-0084714', '', NULL, '', '', '2479', '2019-06-21 07:36:15', '0000-00-00 00:00:00', 1, 0, 1),
(133, 140, 'WAQAS ARSHAD', 'FATHER', '', '', '+92-335-3423631', '', NULL, '', '', '4906', '2019-06-21 07:38:13', '0000-00-00 00:00:00', 1, 0, 1),
(134, 141, 'FARMAN ALI', 'FATHER', '31303-3035825-7', '', '', '', NULL, '', '', '4105', '2019-06-21 07:40:31', '0000-00-00 00:00:00', 1, 0, 1),
(135, 142, 'EJAZ MOHY U DIN', 'FATHER', '31303-1571051-9', '', '+92-300-3357355', '', NULL, '', '', '5653', '2019-06-21 07:43:08', '0000-00-00 00:00:00', 1, 0, 1),
(136, 143, 'MUHAMMAD IMTIAZ', 'FATHER', '31303-8136066-3', '', '+92-300-3357355', '', NULL, '', '', '7822', '2019-06-21 07:44:28', '0000-00-00 00:00:00', 1, 0, 1),
(137, 144, 'NASIR NAVEED BHATTI', 'FATHER', '31303-9852475-5', '', '+92-321-6744944', '', NULL, '', '', '2912', '2019-06-21 07:45:52', '0000-00-00 00:00:00', 1, 0, 1),
(138, 145, 'A', '', '', '', '', '', NULL, '', '', '2620', '2019-06-21 07:49:20', '0000-00-00 00:00:00', 1, 0, 1),
(139, 146, 'A', '', '', '', '', '', NULL, '', '', '8075', '2019-06-21 07:50:57', '0000-00-00 00:00:00', 1, 0, 1),
(140, 147, 'A', '', '', '', '', '', NULL, '', '', '9053', '2019-06-21 07:52:45', '0000-00-00 00:00:00', 1, 0, 1),
(141, 148, 'ZAHID MEHMOOD', 'FATHER', '31303-1002306-6', '', '+92-304-7945517', '', NULL, '', '', '4896', '2019-06-21 23:44:18', '0000-00-00 00:00:00', 1, 0, 1),
(142, 149, 'MUHAMMAD ZEESHAN', 'FATHER', '31304-1257715-7', '', '', '', NULL, '', '', '1454', '2019-06-21 23:47:01', '0000-00-00 00:00:00', 1, 0, 1),
(143, 150, 'M. ZEESHAN', 'FATHER', '31304-1257715-7', '', '+92-300-6735590', '', NULL, '', '', '2217', '2019-06-21 23:52:53', '0000-00-00 00:00:00', 1, 0, 1),
(144, 151, 'MUHAMMAD IRFAN', 'FATHER', '31303-2434029-1', '', '+92-300-9673723', '', NULL, '', '', '5744', '2019-06-21 23:54:40', '0000-00-00 00:00:00', 1, 0, 1),
(145, 152, 'RAO SHAHID IQBAL', 'FATHER', '31303-2441776-7', '', '+92-300-7395019', '', NULL, '', '', '3156', '2019-06-21 23:58:54', '0000-00-00 00:00:00', 1, 0, 1),
(146, 153, 'RAO NAVEED AKHTAR', 'FATHER', '31303-2441776-7', '', '+92-300-9677840', '', NULL, '', '', '7770', '2019-06-22 00:00:27', '0000-00-00 00:00:00', 1, 0, 1),
(147, 154, 'WAQAR ZAFAR', 'FATHER', '', '', '+92-348-4483979', '', NULL, '', '', '2658', '2019-06-22 00:13:42', '0000-00-00 00:00:00', 1, 0, 1),
(148, 155, 'NAVEED ZAFAR', 'FATHER', '', '', '+92-300-9675661', '', NULL, '', '', '5712', '2019-06-22 00:15:35', '0000-00-00 00:00:00', 1, 0, 1),
(149, 156, 'SOHAIL MEHMOOD', 'Father', '31303-2411397-1', '', '+92-333-7438197', '', NULL, '', '', '9797', '2019-06-22 00:16:38', '0000-00-00 00:00:00', 1, 0, 1),
(150, 157, 'WAHID KAMRAN KHAN', 'FATHER', '31303-0862575-5', '', '+92-321-6722146', '', NULL, '', '', '8176', '2019-06-22 00:19:32', '0000-00-00 00:00:00', 1, 0, 1),
(151, 158, 'MUDASSAR HUSSAIN', 'FATHER', '31303-1609547-5', '', '+92-300-6706178', '', NULL, '', '', '3057', '2019-06-22 00:21:02', '0000-00-00 00:00:00', 1, 0, 1),
(152, 159, 'MUHAMMAD ARSHAD GHAFOOR', 'FATHER', '31303-2416277-9', '', '+92-304-1348414', '', NULL, '', '', '9135', '2019-06-22 00:22:24', '0000-00-00 00:00:00', 1, 0, 1),
(153, 160, 'SAGHEER AHMAD', 'FATHER', '31303-3202189-1', '', '+92-301-2001268', '', NULL, '', '', '4379', '2019-06-22 00:23:31', '0000-00-00 00:00:00', 1, 0, 1),
(154, 161, 'ALI ABBAS', 'FATHER', '31303-4177709-3', '', '+92-300-9677622', '', NULL, '', '', '2541', '2019-06-22 00:25:30', '0000-00-00 00:00:00', 1, 0, 1),
(155, 162, 'MUHAMMAD NADEEM', 'FATHER', '31303-8793073-1', '', '+92-300-6747504', '', NULL, '', '', '7139', '2019-06-22 00:26:45', '0000-00-00 00:00:00', 1, 0, 1),
(156, 163, 'FAYAZ AHMAD', 'FATHER', '', '', '+92-332-4139099', '', NULL, '', '', '4753', '2019-06-22 00:28:05', '0000-00-00 00:00:00', 1, 0, 1),
(157, 164, 'AFZAAL AHMAD', 'FATHER', '31301-0461093-3', '', '+92-345-8746007', '', NULL, '', '', '8933', '2019-06-22 00:29:27', '0000-00-00 00:00:00', 1, 0, 1),
(158, 165, 'MUHAMMAD ISLAM ZAHID', 'FATHER', '', '', '+92-300-8673551', '', NULL, '', '', '2609', '2019-06-22 00:30:54', '0000-00-00 00:00:00', 1, 0, 1),
(159, 166, 'MUHAMMAD KHALID ISLAM', 'FATHER', '31303-9117714-5', '', '+92-300-6714125', '', NULL, '', '', '7331', '2019-06-22 00:32:39', '0000-00-00 00:00:00', 1, 0, 1),
(160, 167, 'KHALID MEHMOOD', 'FATHER', '', '', '+92-302-7625094', '', NULL, '', '', '5160', '2019-06-22 00:35:45', '0000-00-00 00:00:00', 1, 0, 1),
(161, 168, 'RANA TAHIR NAVEED', 'FATHER', '31303-0306421-3', '', '+92-312-6713072', '', NULL, '', '', '5733', '2019-06-22 00:37:15', '0000-00-00 00:00:00', 1, 0, 1),
(162, 169, 'MUHAMMAD KAMRAN ASLAM', 'FATHER', '31303-9366541-1', '', '+92-300-9671675', '', NULL, '', '', '6622', '2019-06-22 00:38:47', '0000-00-00 00:00:00', 1, 0, 1),
(163, 170, 'ABDUL RASHEED', 'FATHER', '', '', '+92-300-6730588', '', NULL, '', '', '6110', '2019-06-22 00:40:07', '0000-00-00 00:00:00', 1, 0, 1),
(164, 171, 'FAYYAZ HUSSAIN', 'FATHER', '', '', '+92-349-8737386', '', NULL, '', '', '9992', '2019-06-22 00:41:41', '0000-00-00 00:00:00', 1, 0, 1),
(165, 172, 'JAMIL AHMAD', 'FATHER', '31303-7364267-7', '', '+92-301-7625451', '', NULL, '', '', '5587', '2019-06-22 00:43:03', '0000-00-00 00:00:00', 1, 0, 1),
(166, 173, 'GHULAM YASEEN', 'FATHER', '31303-1645523-7', '', '+92-302-7635114', '', NULL, '', '', '7442', '2019-06-22 00:44:24', '0000-00-00 00:00:00', 1, 0, 1),
(167, 174, 'NASIR NAVEED BHATTI', 'FATHER', '31303-9885247-5', '', '+92-321-6744944', '', NULL, '', '', '7026', '2019-06-22 00:46:25', '0000-00-00 00:00:00', 1, 0, 1),
(168, 175, 'A', 'FATHER', '', '', '', '', NULL, '', '', '2262', '2019-06-22 00:47:11', '0000-00-00 00:00:00', 1, 0, 1),
(172, 179, '', '', '', '', '', '', NULL, '', '', '8432', '2019-06-22 00:50:08', '0000-00-00 00:00:00', 1, 0, 1),
(173, 180, 'TARIQ  MAQSOOD', 'FATHER', '31303-4521636-1', '', '+92-321-6711250', '', NULL, '', '', '1339', '2019-06-22 00:52:05', '0000-00-00 00:00:00', 1, 0, 1),
(174, 181, 'SAJID ALI', 'FATHER', '31303-6844024-1', '', '+92-344-8473103', '', NULL, '', '', '7301', '2019-06-22 00:53:46', '0000-00-00 00:00:00', 1, 0, 1),
(175, 182, 'MUHAMMAD ASGHAR', 'FATHER', '31303-5578521-3', '', '+92-302-9672951', '', NULL, '', '', '5301', '2019-06-22 00:55:52', '0000-00-00 00:00:00', 1, 0, 1),
(176, 183, 'MUHAMMAD MADNI', 'FATHER', '31303-8035307-3', '', '+92-300-6743658', '', NULL, '', '', '3103', '2019-06-22 00:57:06', '0000-00-00 00:00:00', 1, 0, 1),
(177, 184, 'MUDASSAR HUSSAIN', 'FATHER', '31303-1609547-5', '', '+92-300-6743658', '', NULL, '', '', '6535', '2019-06-22 00:58:10', '0000-00-00 00:00:00', 1, 0, 1),
(178, 185, 'MUHAMMAD ARSHAD GHAFOOR', 'FATHER', '31303-2416277-9', '', '+92-304-1348414', '', NULL, '', '', '1376', '2019-06-22 00:59:32', '0000-00-00 00:00:00', 1, 0, 1),
(179, 186, 'IFTAKHAR UL HASSAN', 'FATHER', '31303-2389760-3', '', '+92-345-8430013', '', NULL, '', '', '9202', '2019-06-22 01:00:40', '0000-00-00 00:00:00', 1, 0, 1),
(180, 187, 'SAGEER AHMAD', 'FATHER', '31303-3202189-1', '', '+92-301-2396894', '', NULL, '', '', '5748', '2019-06-22 01:01:54', '0000-00-00 00:00:00', 1, 0, 1),
(181, 188, 'MUHAMMAD JAVEED', 'FATHER', '31303-1465677-5', '', '+92-313-8034633', '', NULL, '', '', '1769', '2019-06-22 01:03:25', '0000-00-00 00:00:00', 1, 0, 1),
(182, 189, 'ALI ABBAS', 'FATHER', '31303-4177709-3', '', '+92-300-9677622', '', NULL, '', '', '8802', '2019-06-22 01:04:46', '0000-00-00 00:00:00', 1, 0, 1),
(183, 190, 'MUHAMMAD RIZWAN', 'FATHER', '', '', '+92-300-9671360', '', NULL, '', '', '6121', '2019-06-22 01:20:39', '0000-00-00 00:00:00', 1, 0, 1),
(184, 191, 'GHULAM DASTGEER', 'FATHER', '31303-2588500-1', '', '+92-307-7649100', '', NULL, '', '', '1996', '2019-06-22 01:22:33', '0000-00-00 00:00:00', 1, 0, 1),
(185, 192, 'EJAZ ALI', 'FATHER', '31303-2432171-7', '', '+92-302-7565600', '', NULL, '', '', '2318', '2019-06-22 01:23:57', '0000-00-00 00:00:00', 1, 0, 1),
(186, 193, 'ZEESHAN KHAN', 'FATHER', '', '', '+92-301-8431389', '', NULL, '', '', '8360', '2019-06-22 01:25:20', '0000-00-00 00:00:00', 1, 0, 1),
(187, 194, 'NAUMAN AHMAD KHAN', 'FATHER', '31303-2389809-5', '', '+92-301-7614020', '', NULL, '', '', '4493', '2019-06-22 01:26:44', '0000-00-00 00:00:00', 1, 0, 1),
(188, 195, 'MUHAMMAD EJAZ SHAH', 'FATHER', '', '', '+92-306-0358385', '', NULL, '', '', '9933', '2019-06-22 01:27:58', '0000-00-00 00:00:00', 1, 0, 1),
(189, 196, 'FAHEEM GHAURI', 'FATHER', '', '', '+92-300-6722765', '', NULL, '', '', '8885', '2019-06-22 01:29:28', '0000-00-00 00:00:00', 1, 0, 1),
(190, 197, 'ISLAM-UL-HAQ', 'FATHER', '', '', '+92-300-6785600', '', NULL, '', '', '8840', '2019-06-22 01:33:14', '0000-00-00 00:00:00', 1, 0, 1),
(191, 198, 'MOHSIN NADEEM', 'Father', '', '', '+92-300-6747963', '', NULL, '', '', '9140', '2019-06-22 01:37:48', '0000-00-00 00:00:00', 1, 0, 1),
(192, 199, 'IFTAKHAR AHMAD', 'FATHER', '31303-3587695-9', '', '+92-302-7648781', '', NULL, '', '', '8320', '2019-06-22 01:39:30', '0000-00-00 00:00:00', 1, 0, 1),
(193, 200, 'MUHAMMAD RAFIQ', 'FATHER', '', '', '+92-300-8771637', '', NULL, '', '', '7277', '2019-06-22 01:41:46', '0000-00-00 00:00:00', 1, 0, 1),
(194, 201, 'MUHAMMAD IMRAN', 'FATHER', '', '', '+92-300-8622261', '', NULL, '', '', '3235', '2019-06-22 01:43:55', '0000-00-00 00:00:00', 1, 0, 1),
(195, 202, 'MUHAMMAD ALTAF AHMAD', 'FATHER', '31303-2453479-9', '', '+92-300-6738656', '', NULL, '', '', '6482', '2019-06-22 01:45:58', '0000-00-00 00:00:00', 1, 0, 1),
(196, 203, 'ANWAR-UR-REHMAN', 'FATHER', '31303-2210091-9', '', '+92-336-8211285', '', NULL, '', '', '9586', '2019-06-22 01:47:26', '0000-00-00 00:00:00', 1, 0, 1),
(197, 204, 'GULAM MUSTAFA', 'FATHER', '32404-0316719-7', '', '+92-332-2145239', '', NULL, '', '', '3719', '2019-06-22 01:53:21', '0000-00-00 00:00:00', 1, 0, 1),
(198, 205, 'MUHAMMAD ARSHAD HUSSAIN', 'FATHER', '31303-3805594-1', '', '+92-300-6748085', '', NULL, '', '', '1074', '2019-06-22 02:03:01', '0000-00-00 00:00:00', 1, 0, 1),
(199, 206, 'WAQAS ALI', 'FATHER', '31303-1895898-9', '', '+92-345-8022997', '', NULL, '', '', '3203', '2019-06-22 02:05:04', '0000-00-00 00:00:00', 1, 0, 1),
(200, 207, 'SHEHZAD AHMAD', 'FATHER', '31303-7372888-3', '', '+92-315-6507759', '', NULL, '', '', '2417', '2019-06-22 02:08:20', '0000-00-00 00:00:00', 1, 0, 1),
(201, 208, 'RIZWAN SARWAR', 'FATHER', '31303-9909009-9', '', '+92-306-7659986', '', NULL, '', '', '2756', '2019-06-22 02:10:12', '0000-00-00 00:00:00', 1, 0, 1),
(202, 209, 'ABDUL BASIT', 'FATHER', '31303-7074313-2', '', '+92-301-2989965', '', NULL, '', '', '4705', '2019-06-22 02:12:24', '0000-00-00 00:00:00', 1, 0, 1),
(203, 210, 'ZAHOOR AHMAD', 'FATHER', '31303-6428243-1', '', '+92-305-7075097', '', NULL, '', '', '9402', '2019-06-22 02:14:38', '0000-00-00 00:00:00', 1, 0, 1),
(204, 211, 'LIAQUAT ALI', 'FATHER', '31303-9601516-5', '', '+92-301-7668819', '', NULL, '', '', '6524', '2019-06-22 02:43:55', '0000-00-00 00:00:00', 1, 0, 1),
(205, 212, 'MOHAMMAD ARSHAD KHAN', 'FATHER', '31303-2375949-9', '', '+92-321-4515528', '', NULL, '', '', '5562', '2019-06-22 02:48:27', '0000-00-00 00:00:00', 1, 0, 1),
(206, 213, 'M. RIZWAN', 'FATHER', '31303-7730814-7', '', '+92-300-9676843', '', NULL, '', '', '6504', '2019-06-22 02:51:07', '0000-00-00 00:00:00', 1, 0, 1),
(207, 214, 'MUHAMMAD SAHFIQ SALEEMI', 'FATHER', '31303-7941485-3', '', '+92-334-7341726', '', NULL, '', '', '6307', '2019-06-22 03:00:11', '0000-00-00 00:00:00', 1, 0, 1),
(208, 215, 'MUHAMMAD MAIRAJ-UD-DIN', 'FATHER', '31303-2423678-3', '', '+92-321-6703804', '', NULL, '', '', '7390', '2019-06-22 03:02:06', '0000-00-00 00:00:00', 1, 0, 1),
(209, 216, 'TAHIR MEHMOOD', 'FATHER', '31303-4057163-5', '', '+92-304-2197497', '', NULL, '', '', '1036', '2019-06-22 03:03:54', '0000-00-00 00:00:00', 1, 0, 1),
(210, 217, 'MUHAMMAD ASHRAF NIAZ', 'FATHER', '31303-2441889-1', '', '+92-302-7564433', '', NULL, '', '', '3098', '2019-06-22 03:06:17', '0000-00-00 00:00:00', 1, 0, 1),
(211, 218, 'M AJMAL KHAN', 'FATHER', '31303-5669133-7', '', '+92-321-6719215', '', NULL, '', '', '2326', '2019-06-22 03:08:45', '0000-00-00 00:00:00', 1, 0, 1),
(212, 219, 'M RIAZ', 'FATHER', '', '', '+92-300-6700743', '', NULL, '', '', '9934', '2019-06-22 03:26:34', '0000-00-00 00:00:00', 1, 0, 1),
(213, 220, 'ADIL MEHMOOD CHISTI', 'FATHER', '', '', '+92-320-6651223', '', NULL, '', '', '3232', '2019-06-22 03:29:06', '0000-00-00 00:00:00', 1, 0, 1),
(214, 221, 'EJAZ MEHMOOD', 'FATHER', '31303-6598505-9', '', '+92-300-6704938', '', NULL, '', '', '5275', '2019-06-22 03:30:49', '0000-00-00 00:00:00', 1, 0, 1),
(215, 222, 'ZAHID MANWAR', 'FATHER', '31303-4897794-1', '', '+92-301-6787031', '', NULL, '', '', '5568', '2019-06-22 03:32:17', '0000-00-00 00:00:00', 1, 0, 1),
(216, 223, 'MUHAMMAD ASGHAR', 'FATHER', '31303-5578521-3', '', '+92-302-9672951', '', NULL, '', '', '4190', '2019-06-22 03:33:50', '0000-00-00 00:00:00', 1, 0, 1),
(217, 224, 'RAEES KHADIM HUSSAIN TABASSUM', 'FATHER', '31303-2427985-3', '', '+92-300-6744415', '', NULL, '', '', '5828', '2019-06-22 03:35:34', '0000-00-00 00:00:00', 1, 0, 1),
(218, 225, 'RANA TAHIR NAVEED', 'FATHER', '', '', '+92-312-6731072', '', NULL, '', '', '7336', '2019-06-22 03:36:39', '0000-00-00 00:00:00', 1, 0, 1),
(219, 226, 'NADEEM SAJID', 'FATHER', '31303-4409692-5', '', '+92-303-3930452', '', NULL, '', '', '9601', '2019-06-22 03:37:42', '0000-00-00 00:00:00', 1, 0, 1),
(220, 227, 'NOOR AHMAD', 'FATHER', '31303-5476438-3', '', '+92-303-7656886', '', NULL, '', '', '8972', '2019-06-22 03:38:55', '0000-00-00 00:00:00', 1, 0, 1),
(221, 228, 'ABDUL JABBAR ANJUM', 'FATHER', '31303-5705150-7', '', '+92-305-3281713', '', NULL, '', '', '5867', '2019-06-22 03:39:58', '0000-00-00 00:00:00', 1, 0, 1),
(222, 229, 'SAYED BILAL  BUKHARI', 'FATHER', '31303-7310107-5', '', '+92-302-7898348', '', NULL, '', '', '1306', '2019-06-22 03:41:06', '0000-00-00 00:00:00', 1, 0, 1),
(223, 230, 'MUHAMMAD AHMED SAIF KHAN', 'FATHER', '31303-1732768-9', '', '+92-300-6727730', '', NULL, '', '', '3673', '2019-06-22 03:42:11', '0000-00-00 00:00:00', 1, 0, 1),
(224, 231, 'MUHAMMAD IQBAL ZAHID', 'FATHER', '31303-2441235-5', '', '+92-335-9674662', '', NULL, '', '', '3171', '2019-06-22 03:43:17', '0000-00-00 00:00:00', 1, 0, 1),
(225, 232, 'ATHER AMEEN', 'FATHER', '31303-1004668-1', '', '+92-300-9672435', '', NULL, '', '', '3657', '2019-06-22 03:44:30', '0000-00-00 00:00:00', 1, 0, 1),
(226, 233, 'AAMIR TOFAL', 'FATHER', '31306-8598329-_', '', '+92-331-8182114', '', NULL, '', '', '1751', '2019-06-22 03:45:50', '0000-00-00 00:00:00', 1, 0, 1),
(227, 234, 'AHMED ALI', 'FATHER', '31303-7346935-5', '', '+92-303-6167356', '', NULL, '', '', '5646', '2019-06-22 03:47:03', '0000-00-00 00:00:00', 1, 0, 1),
(228, 235, 'M. NADEEM KHAN', 'FATHER', '', '', '+92-321-6733112', '', NULL, '', '', '5532', '2019-06-22 03:48:25', '0000-00-00 00:00:00', 1, 0, 1),
(229, 236, 'MUHAMMAD SHRIF KHAN', 'FATHER', '31303-0752999-1', '', '+92-300-7822400', '', NULL, '', '', '5157', '2019-06-22 03:49:31', '0000-00-00 00:00:00', 1, 0, 1),
(230, 237, 'RAO NAVEED', 'FATHER', '', '', '+92-308-7668241', '', NULL, '', '', '7019', '2019-06-22 03:50:45', '0000-00-00 00:00:00', 1, 0, 1),
(231, 238, 'MUHAMMAD ASIF SHEIKH', 'FATHER', '31303-8764212-3', '', '+92-300-6714125', '', NULL, '', '', '2704', '2019-06-22 03:51:52', '0000-00-00 00:00:00', 1, 0, 1),
(232, 239, 'SOHAIL MEHMOOD', 'FATHER', '31303-2411397-1', '', '+92-331-6067164', '', NULL, '', '', '4361', '2019-06-22 03:52:54', '0000-00-00 00:00:00', 1, 0, 1),
(233, 240, 'MUHAMMAD ANWAR', 'FATHER', '31303-6578222-7', '', '+92-300-877712_', '', NULL, '', '', '8485', '2019-06-22 03:54:07', '0000-00-00 00:00:00', 1, 0, 1),
(234, 241, 'RAO ABDUL HAMEED', 'FATHER', '31303-2377683-5', '', '+92-305-2292534', '', NULL, '', '', '9736', '2019-06-22 03:55:14', '0000-00-00 00:00:00', 1, 0, 1),
(235, 242, 'MUHAMMAD ALI', 'FATHER', '', '', '+92-305-6949328', '', NULL, '', '', '1482', '2019-06-22 03:56:15', '0000-00-00 00:00:00', 1, 0, 1),
(236, 243, 'SOHAIL MEHMOOD', 'FATHER', '31303-2411397-1', '', '+92-331-6067164', '', NULL, '', '', '3001', '2019-06-22 04:08:59', '0000-00-00 00:00:00', 1, 0, 1),
(237, 244, 'RAEES KHADIM HUSSAIN TABASSUM', 'FATHER', '31303-2427985-3', '', '+92-300-6744415', '', NULL, '', '', '1728', '2019-06-22 04:14:58', '0000-00-00 00:00:00', 1, 0, 1),
(238, 245, 'RIAZ AHMED', 'FATHER', '31303-2422149-1', '', '+92-321-6729065', '', NULL, '', '', '6631', '2019-06-22 04:19:56', '0000-00-00 00:00:00', 1, 0, 1),
(239, 246, 'RANA TAHIR NAVEED', 'FATHER', '31303-0306421-3', '', '+92-312-6731072', '', NULL, '', '', '9894', '2019-06-22 04:22:47', '0000-00-00 00:00:00', 1, 0, 1),
(240, 247, 'QAMAR ABBASI', 'FATHER', '', '', '+92-308-7613135', '', NULL, '', '', '8718', '2019-06-22 04:25:53', '0000-00-00 00:00:00', 1, 0, 1),
(241, 248, 'ZAHOOR AHMAD', 'FATHER', '31303-6428243-1', '', '+92-305-7075097', '', NULL, '', '', '7123', '2019-06-22 04:33:06', '0000-00-00 00:00:00', 1, 0, 1),
(242, 249, 'ABDUL WAHEED', 'FATHER', '', '', '+92-300-6705797', '', NULL, '', '', '9686', '2019-06-22 04:39:33', '0000-00-00 00:00:00', 1, 0, 1),
(243, 250, 'MUHAMMAD JAVEED', 'FATHER', '', '', '+92-312-9677622', '', NULL, '', '', '6443', '2019-06-22 04:53:43', '0000-00-00 00:00:00', 1, 0, 1),
(244, 251, 'ABDUL BASEER KHAN', 'FATHER', '31303-4586922-1', '', '+92-300-6708260', '', NULL, '', '', '9071', '2019-06-22 04:55:48', '0000-00-00 00:00:00', 1, 0, 1),
(245, 252, 'NAIK MUHAMMAD', 'FATHER', '31303-2390759-3', '', '+92-321-7360459', '', NULL, '', '', '3490', '2019-06-22 04:57:17', '0000-00-00 00:00:00', 1, 0, 1),
(246, 253, 'AKBAR HUSSAIN', 'FATHER', '', '', '+92-301-6678299', '', NULL, '', '', '2505', '2019-06-22 04:59:19', '0000-00-00 00:00:00', 1, 0, 1),
(247, 254, 'MUHAMMAD NADEEM', 'FATHER', '31303-8793073-1', '', '', '', NULL, '', '', '8885', '2019-06-22 05:00:51', '0000-00-00 00:00:00', 1, 0, 1),
(248, 255, 'IFTIKHAR UL HASSAN', 'FATHER', '', '', '+92-300-6703009', '', NULL, '', '', '7795', '2019-06-22 05:02:13', '0000-00-00 00:00:00', 1, 0, 1),
(249, 256, 'RAS MAQSOOD AHMAD', 'FATHER', '', '', '+92-333-7468113', '', NULL, '', '', '5661', '2019-06-22 05:03:56', '0000-00-00 00:00:00', 1, 0, 1),
(250, 257, 'RAYAZ AHMED', 'FATHER', '', '', '', '', NULL, '', '', '5126', '2019-06-22 05:05:22', '0000-00-00 00:00:00', 1, 0, 1),
(251, 258, 'TARIQ MEHMOOD', 'FATHER', '31303-5978786-1', '', '+92-331-4554441', '', NULL, '', '', '3542', '2019-06-22 05:08:09', '0000-00-00 00:00:00', 1, 0, 1),
(252, 259, 'M ZEESHAN', 'FATHER', '31304-1257715-7', '', '', '', NULL, '', '', '5303', '2019-06-22 05:10:11', '0000-00-00 00:00:00', 1, 0, 1),
(253, 260, 'MUHAMMAD ALI', 'FATHER', '31303-2861411-5', '', '+92-303-0391077', '', NULL, '', '', '1345', '2019-06-22 05:13:46', '0000-00-00 00:00:00', 1, 0, 1),
(254, 261, 'MUHAMMAD MADNI', 'FATHER', '31303-8035307-3', '', '', '', NULL, '', '', '3522', '2019-06-22 05:19:03', '0000-00-00 00:00:00', 1, 0, 1),
(255, 262, 'MUHAMMAD MADNI', 'FATHER', '31303-8035307-3', '', '', '', NULL, '', '', '8096', '2019-06-22 05:22:22', '0000-00-00 00:00:00', 1, 0, 1),
(256, 263, 'ANWAR-UR-REHMAN', 'FATHER', '31303-2210091-9', '', '', '', NULL, '', '', '1934', '2019-06-22 05:23:30', '0000-00-00 00:00:00', 1, 0, 1),
(257, 264, 'MUHAMMAD ARSHAD HUSSAIN', 'FATHER', '31303-3805594-1', '', '+92-300-6748085', '', NULL, '', '', '5943', '2019-06-22 05:24:46', '0000-00-00 00:00:00', 1, 0, 1),
(258, 265, 'MUHAMMAD ZAHID', 'FATHER', '31303-7562165-3', '', '+92-030-0671527', '', NULL, '', '', '7084', '2019-06-22 05:26:09', '0000-00-00 00:00:00', 1, 0, 1),
(259, 266, 'MEHBOB AHMAH', 'FATHER', '', '', '+92-301-7664889', '', NULL, '', '', '8667', '2019-06-22 05:27:45', '0000-00-00 00:00:00', 1, 0, 1),
(260, 267, 'MUHAMMAD ALTAF', 'FATHER', '31303-8558565-5', '', '', '', NULL, '', '', '9523', '2019-06-22 05:29:00', '0000-00-00 00:00:00', 1, 0, 1),
(261, 268, 'HAZOOR BAKHSH', 'FATHER', '32403-8934021-3', '', '', '', NULL, '', '', '3098', '2019-06-22 05:30:24', '0000-00-00 00:00:00', 1, 0, 1),
(262, 269, 'UMAR DARAZ', 'FATHER', '31303-2436650-1', '', '+92-307-4001452', '', NULL, '', '', '2707', '2019-06-22 05:31:45', '0000-00-00 00:00:00', 1, 0, 1),
(263, 270, 'ABDUL JABBAR ANJUM', 'FATHER', '31303-5705150-7', '', '', '', NULL, '', '', '8724', '2019-06-22 05:32:54', '0000-00-00 00:00:00', 1, 0, 1),
(264, 271, 'WAQAR ZAFAR', 'FATHER', '', '', '+92-345-8671557', '', NULL, '', '', '3816', '2019-06-22 05:37:34', '0000-00-00 00:00:00', 1, 0, 1),
(265, 272, 'MUHAMMAD SHAHZAD KHAN', 'FATHER', '31303-7587917-7', '', '+92-300-6810734', '', NULL, '', '', '2271', '2019-06-22 05:39:10', '0000-00-00 00:00:00', 1, 0, 1),
(266, 273, 'BILAL HUSSAIN ANSARI', 'FATHER', '31303-2389760-7', '', '+92-334-7337155', '', NULL, '', '', '1927', '2019-06-22 05:40:45', '0000-00-00 00:00:00', 1, 0, 1),
(267, 274, 'MUHAMMAD AKHTAR', 'FATHER', '31303-2735332-9', '', '+92-335-2550043', '', NULL, '', '', '7798', '2019-06-22 05:42:12', '0000-00-00 00:00:00', 1, 0, 1),
(268, 275, 'SYED MUHAMMAD EJAZ', 'FATHER', '', '', '+92-304-6764994', '', NULL, '', '', '5520', '2019-06-22 05:43:25', '0000-00-00 00:00:00', 1, 0, 1),
(269, 276, 'MUHAMMAD ASKARI', '', '31303-2369839-1', '', '+92-300-6736626', '', NULL, '', '', '7539', '2019-06-22 06:03:07', '0000-00-00 00:00:00', 1, 0, 1),
(270, 277, 'RAS MAQSOOD AHMAD', 'FATHER', '31303-2449878-1', '', '+92-333-7468113', '', NULL, '', '', '3482', '2019-06-22 06:07:52', '0000-00-00 00:00:00', 1, 0, 1),
(271, 278, 'MUHAMMAD EJAZ', 'FATHER', '', '', '+92-333-7494918', '', NULL, '', '', '4385', '2019-06-22 06:12:40', '0000-00-00 00:00:00', 1, 0, 1),
(272, 279, 'SAJID ALI', 'FATHER', '', '', '+92-344-8473103', '', NULL, '', '', '4275', '2019-06-22 06:14:13', '0000-00-00 00:00:00', 1, 0, 1),
(273, 280, 'MAIN ABDUL LATIF', 'FATHER', '31303-6382272-3', '', '+92-301-2366390', '', NULL, '', '', '1367', '2019-06-22 06:15:36', '0000-00-00 00:00:00', 1, 0, 1),
(274, 281, 'JAMEEL AHMAD', 'FATHER', '', '', '+92-308-7483715', '', NULL, '', '', '2564', '2019-06-22 06:18:48', '0000-00-00 00:00:00', 1, 0, 1),
(275, 282, 'ABDUL RASHEED NOOR', 'FATHER', '', '', '+92-304-9383530', '', NULL, '', '', '8464', '2019-06-22 06:21:20', '0000-00-00 00:00:00', 1, 0, 1),
(276, 283, 'JAMIL AHMAD', 'FATHER', '31303-7364267-7', '', '+92-301-7625451', '', NULL, '', '', '6995', '2019-06-22 06:23:05', '0000-00-00 00:00:00', 1, 0, 1),
(277, 284, 'IMRAN ARSHAD', 'FATHER', '', '', '', '', NULL, '', '', '5896', '2019-06-22 06:28:27', '0000-00-00 00:00:00', 1, 0, 1),
(278, 285, 'SAFDAR HUSSAIN', 'FATHER', '', '', '+92-344-7016568', '', NULL, '', '', '1489', '2019-06-22 06:29:46', '0000-00-00 00:00:00', 1, 0, 1),
(279, 286, 'MUHAMMAD AZEEN KHAN', 'FATHER', '', '', '', '', NULL, '', '', '8165', '2019-06-22 06:30:57', '0000-00-00 00:00:00', 1, 0, 1),
(280, 287, 'EJAZ MEHMOOD', 'FATHER', '31303-6598505-9', '', '+92-300-6704938', '', NULL, '', '', '5115', '2019-06-22 06:33:33', '0000-00-00 00:00:00', 1, 0, 1),
(281, 288, 'PERVAIZ AHMED', 'FATHER', '', '', '+92-300-8779085', '', NULL, '', '', '3739', '2019-06-22 06:35:27', '0000-00-00 00:00:00', 1, 0, 1),
(282, 289, 'ABDUL BASEER KHAN', 'FATHER', '31303-4586922-1', '', '+92-300-6708260', '', NULL, '', '', '3329', '2019-06-22 06:36:57', '0000-00-00 00:00:00', 1, 0, 1),
(283, 290, 'SAYED BILAL BUKHARI', 'FATHER', '31303-7310107-5', '', '+92-300-9672978', '', NULL, '', '', '5840', '2019-06-22 06:38:25', '0000-00-00 00:00:00', 1, 0, 1),
(284, 291, 'GHULAM QADIR', 'FATHER', '31303-9018598-1', '', '+92-322-8910310', '', NULL, '', '', '7306', '2019-06-24 00:22:09', '0000-00-00 00:00:00', 1, 0, 1),
(285, 292, 'ATTA-ULLAH', 'FATHER', '', '', '', '', NULL, '', '', '3350', '2019-06-24 00:23:30', '0000-00-00 00:00:00', 1, 0, 1),
(286, 293, 'M.ALEEM AKBAR', 'FATHER', '', '', '+92-314-6708388', '', NULL, '', '', '7186', '2019-06-24 00:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(287, 294, 'MUHAMMAD ISMAIL', 'FATHER', '', '', '', '', NULL, '', '', '2388', '2019-06-24 00:25:52', '0000-00-00 00:00:00', 1, 0, 1),
(288, 295, 'AKHTAR ALI', 'FATHER', '', '', '+92-302-7564216', '', NULL, '', '', '3684', '2019-06-24 00:27:17', '0000-00-00 00:00:00', 1, 0, 1),
(289, 296, 'QAMAR ABBASI', 'FATHER', '', '', '', '', NULL, '', '', '4466', '2019-06-24 00:29:28', '0000-00-00 00:00:00', 1, 0, 1),
(290, 297, 'HAFEEZ UR REHMAN', 'FATHER', '31303-6507086-9', '', '', '', NULL, '', '', '7006', '2019-06-24 00:31:25', '0000-00-00 00:00:00', 1, 0, 1),
(291, 298, 'MUHAMMAD IQBAL', 'FATHER', '31303-1967022-5', '', '', '', NULL, '', '', '7444', '2019-06-24 00:32:47', '0000-00-00 00:00:00', 1, 0, 1),
(292, 299, 'MIAN MUHAMMAD ISRAR', 'FATHER', '31301-4931267-7', '', '+92-300-8677238', '', NULL, '', '', '5581', '2019-06-24 00:34:05', '0000-00-00 00:00:00', 1, 0, 1),
(293, 300, 'MUHAMMAD ABDUL QAYYUM', 'FATHER', '31303-9032246-7', '', '+92-300-7825434', '', NULL, '', '', '7159', '2019-06-24 00:35:20', '0000-00-00 00:00:00', 1, 0, 1),
(294, 301, 'RANA REHAN ASHRAF', 'FATHER', '31304-7226800-7', '', '+92-301-4981455', '', NULL, '', '', '9039', '2019-06-24 00:36:32', '0000-00-00 00:00:00', 1, 0, 1),
(295, 302, 'RANA REHAN ASHRAF', 'FATHER', '31304-7226800-7', '', '+92-301-4981455', '', NULL, '', '', '7502', '2019-06-24 00:38:21', '0000-00-00 00:00:00', 1, 0, 1),
(296, 303, 'SAIMA SHAHEEN', 'FATHER', '31303-9852475-5', '', '+92-321-6744944', '', NULL, '', '', '8369', '2019-06-24 00:46:14', '0000-00-00 00:00:00', 1, 0, 1),
(297, 304, 'NADEEM NAZEER', 'FATHER', '', '', '+92-321-6712135', '', NULL, '', '', '8874', '2019-06-24 00:47:20', '0000-00-00 00:00:00', 1, 0, 1),
(298, 305, 'MUHAMMAD SHARIF KHAN', 'FATHER', '31303-0752999-1', '', '+92-300-7822400', '', NULL, '', '', '4866', '2019-06-24 00:48:30', '0000-00-00 00:00:00', 1, 0, 1),
(299, 306, 'ZEESHAN AHMED KHAN', 'FATHER', '31303-2389809-3', '', '+92-300-8777766', '', NULL, '', '', '1098', '2019-06-24 00:49:54', '0000-00-00 00:00:00', 1, 0, 1),
(300, 307, 'MUHAMMAD SHAHID NADEEM', 'FATHER', '31303-5497736-1', '', '', '', NULL, '', '', '7595', '2019-06-24 00:52:45', '0000-00-00 00:00:00', 1, 0, 1),
(301, 308, 'WASEEM GHURI', 'FATHER', '', '', '', '', NULL, '', '', '2757', '2019-06-24 00:54:07', '0000-00-00 00:00:00', 1, 0, 1),
(302, 309, 'MUHAMMAD AHMED SAIF KHAN', 'FATHER', '31303-1732768-9', '', '+92-300-6727730', '', NULL, '', '', '3505', '2019-06-24 00:59:28', '0000-00-00 00:00:00', 1, 0, 1),
(303, 310, 'MUHAMMAD IRFAN', 'FATHER', '31303-2434029-1', '', '', '', NULL, '', '', '8696', '2019-06-24 01:01:09', '0000-00-00 00:00:00', 1, 0, 1),
(304, 311, 'FAHEEM GHAURI', 'FATHER', '', '', '+92-301-8677588', '', NULL, '', '', '4718', '2019-06-24 01:02:12', '0000-00-00 00:00:00', 1, 0, 1),
(305, 312, 'FAYYAZ AHMED', 'FATHER', '31303-4094259-5', '', '', '', NULL, '', '', '8385', '2019-06-24 01:03:43', '0000-00-00 00:00:00', 1, 0, 1),
(306, 313, 'MUDASSAR HUSSAIN', 'FATHER', '31303-1609547-5', '', '+92-306-0357663', '', NULL, '', '', '8892', '2019-06-24 01:05:21', '0000-00-00 00:00:00', 1, 0, 1),
(307, 314, 'MUHAMMAD KAMRAN', 'FATHER', '31303-0924997-3', '', '+92-300-6704131', '', NULL, '', '', '7191', '2019-06-24 01:06:37', '0000-00-00 00:00:00', 1, 0, 1),
(308, 315, 'MUHAMMAD KAMRAN', 'FATHER', '31303-0924997-3', '', '+92-300-6704131', '', NULL, '', '', '4790', '2019-06-24 01:08:21', '0000-00-00 00:00:00', 1, 0, 1),
(309, 316, 'JAVED MUJTABA', 'FATHER', '31303-0305406-7', '', '+92-308-6829202', '', NULL, '', '', '3000', '2019-06-24 01:09:56', '0000-00-00 00:00:00', 1, 0, 1),
(310, 317, 'IMRAN MEHMOOD QADARI', 'FATHER', '31303-2408509-9', '', '+92-300-6703957', '', NULL, '', '', '9502', '2019-06-24 01:11:23', '0000-00-00 00:00:00', 1, 0, 1),
(311, 318, 'MANZOOR AHMED', 'FATHER', '', '', '+92-333-7441661', '', NULL, '', '', '9618', '2019-06-24 01:12:24', '0000-00-00 00:00:00', 1, 0, 1),
(312, 319, 'ABDUL BASIT', 'FATHER', '31303-7074313-2', '', '+92-301-2989965', '', NULL, '', '', '5206', '2019-06-24 01:13:30', '0000-00-00 00:00:00', 1, 0, 1),
(313, 320, 'MUHAMMAD IMTIAZ', 'FATHER', '31303-8136066-3', '', '', '', NULL, '', '', '3254', '2019-06-24 01:14:48', '0000-00-00 00:00:00', 1, 0, 1),
(314, 321, 'MUHAMMAD ISLAM ZAHID', 'FATHER', '', '', '+92-300-9673551', '', NULL, '', '', '8123', '2019-06-24 04:55:57', '0000-00-00 00:00:00', 4, 0, 1),
(315, 322, 'MUHAMMAD ASIF', 'FATHER', '', '', '+92-300-6750005', '', NULL, '', '', '4700', '2019-06-24 04:58:42', '0000-00-00 00:00:00', 4, 0, 1),
(316, 323, 'RAO SHAHID IQBAL', 'FATHER', '', '', '+92-300-9677840', '', NULL, '', '', '7703', '2019-06-24 05:00:06', '0000-00-00 00:00:00', 4, 0, 1),
(317, 324, 'TARIQ MEHMOOD', 'FATHER', '', '', '+92-342-8719764', '', NULL, '', '', '2093', '2019-06-24 05:01:29', '0000-00-00 00:00:00', 4, 0, 1),
(318, 325, 'M.JAWAD AHMAD', 'FATHER', '31303-5164170-5', '', '', '', NULL, '', '', '9409', '2019-06-24 05:03:29', '0000-00-00 00:00:00', 4, 0, 1),
(319, 326, 'YAR MUHAMMAD', 'FATHER', '', '', '+92-301-7640330', '', NULL, '', '', '6463', '2019-06-24 05:04:49', '0000-00-00 00:00:00', 4, 0, 1),
(320, 327, 'AWAIS ALI(LATE)', 'FATHER', '', '', '', '', NULL, '', '', '2556', '2019-06-24 05:06:07', '0000-00-00 00:00:00', 4, 0, 1),
(321, 328, 'MUHAMMAD ANWAR', 'FATHER', '31303-6578222-7', '', '', '', NULL, '', '', '6470', '2019-06-24 05:07:31', '0000-00-00 00:00:00', 4, 0, 1),
(322, 329, 'MUHAMMAD NADEEM', 'FATHER', '31303-1084558-9', '', '+92-303-7674719', '', NULL, '', '', '2672', '2019-06-24 05:08:50', '0000-00-00 00:00:00', 4, 0, 1),
(323, 330, 'ABDUL NABI', 'FATHER', '31303-2399724-3', '', '', '', NULL, '', '', '5846', '2019-06-24 05:10:24', '0000-00-00 00:00:00', 4, 0, 1),
(324, 331, 'AZHAR MEHMOOD', 'FATHER', '', '', '', '', NULL, '', '', '3938', '2019-06-24 05:12:25', '0000-00-00 00:00:00', 4, 0, 1),
(325, 332, ' CH ABDUL WAHID', 'FATHER', '31303-2445506-7', '', '+92-300-6724083', '', NULL, '', '', '4632', '2019-06-24 05:15:11', '0000-00-00 00:00:00', 4, 0, 1),
(326, 333, 'RAEES KHADIM HUSSAIN TABASSUM', 'FATHER', '31303-2427985-3', '', '+92-300-6744415', '', NULL, '', '', '6803', '2019-06-24 05:16:47', '0000-00-00 00:00:00', 4, 0, 1),
(327, 334, 'HAJI SHOKT', 'FATHER', '', '', '+92-305-6949328', '', NULL, '', '', '1391', '2019-06-24 05:18:00', '0000-00-00 00:00:00', 4, 0, 1),
(328, 335, 'MUHAMMAD ARSHAD HUSSAIN', 'FATHER', '31303-3805594-1', '', '+92-300-6748085', '', NULL, '', '', '4502', '2019-06-24 05:19:19', '0000-00-00 00:00:00', 4, 0, 1),
(329, 336, 'MUHAMMAD ARSHAD HUSSAIN', 'FATHER', '31303-3805594-1', '', '+92-300-6748085', '', NULL, '', '', '3102', '2019-06-24 05:20:13', '0000-00-00 00:00:00', 4, 0, 1),
(330, 337, 'SHEHZAD AHMAD', 'FATHER', '31303-7372888-3', '', '+92-300-6744600', '', NULL, '', '', '4821', '2019-06-24 05:21:56', '0000-00-00 00:00:00', 4, 0, 1),
(331, 338, 'M.TAYYAB', 'FATHER', '', '', '+92-333-3650450', '', NULL, '', '', '1791', '2019-06-24 05:23:11', '0000-00-00 00:00:00', 4, 0, 1),
(332, 339, 'HAFEEZ UR REHMAN', 'FATHER', '31303-6507086-9', '', '+92-300-6708994', '', NULL, '', '', '6681', '2019-06-24 05:28:15', '0000-00-00 00:00:00', 4, 0, 1),
(333, 340, 'ASIF PAUL', 'FATHER', '', '', '+92-333-7881220', '', NULL, '', '', '8269', '2019-06-24 05:29:23', '0000-00-00 00:00:00', 4, 0, 1),
(334, 341, 'AKBAR HUSSAIN', 'FATHER', '', '', '+92-301-6782992', '', NULL, '', '', '2117', '2019-06-24 05:30:44', '0000-00-00 00:00:00', 4, 0, 1),
(335, 342, 'ABDUL JABBAR ANJUM', 'FATHER', '', '', '+92-300-6739228', '', NULL, '', '', '4131', '2019-06-24 05:32:08', '0000-00-00 00:00:00', 4, 0, 1),
(336, 343, 'ABID ALI', 'FATHER', '', '', '+92-300-6752418', '', NULL, '', '', '8494', '2019-06-24 05:33:27', '0000-00-00 00:00:00', 4, 0, 1),
(337, 344, 'OWAIS ALI', 'FATHER', '', '', '+92-331-1430944', '', NULL, '', '', '9584', '2019-06-24 05:36:20', '0000-00-00 00:00:00', 4, 0, 1),
(338, 345, 'EJAZ ALI', 'FATHER', '', '', '+92-300-9677726', '', NULL, '', '', '1487', '2019-06-24 05:37:42', '0000-00-00 00:00:00', 4, 0, 1),
(339, 346, 'SAIF ULLAH', 'FATHER', '', '', '+92-308-7613135', '', NULL, '', '', '3098', '2019-06-24 05:39:13', '0000-00-00 00:00:00', 4, 0, 1),
(340, 347, 'MUHAMMAD ASIF', 'FATHER', '', '', '', '', NULL, '', '', '9497', '2019-06-24 05:41:14', '0000-00-00 00:00:00', 4, 0, 1),
(341, 348, 'WASEEM GHORI', 'FATHER', '', '', '+92-300-6721640', '', NULL, '', '', '7575', '2019-06-24 05:43:11', '0000-00-00 00:00:00', 4, 0, 1),
(342, 349, 'MUHAMMAD RIZWAN', 'FATHER', '31303-7730814-7', '', '', '', NULL, '', '', '2813', '2019-06-24 05:44:48', '0000-00-00 00:00:00', 4, 0, 1);
INSERT INTO `std_guardian_info` (`std_guardian_info_id`, `std_id`, `guardian_name`, `guardian_relation`, `guardian_cnic`, `guardian_email`, `guardian_contact_no_1`, `guardian_contact_no_2`, `guardian_monthly_income`, `guardian_occupation`, `guardian_designation`, `guardian_password`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(343, 350, 'MUHAMMAD SHAHID NADEEM', 'FATHER', '31303-3549773-6', '', '+92-300-9675099', '', NULL, '', '', '8266', '2019-06-24 05:46:12', '0000-00-00 00:00:00', 4, 0, 1),
(344, 351, 'M.JAVEED AHMED', 'FATHER', '', '', '+92-307-6701510', '+92-300-9677622', NULL, '', '', '3702', '2019-06-24 05:48:23', '0000-00-00 00:00:00', 4, 0, 1),
(345, 352, 'JAVED MUJTABA', 'FATHER', '31303-0305406-7', '', '+92-308-6829202', '', NULL, '', '', '6981', '2019-06-24 05:49:47', '0000-00-00 00:00:00', 4, 0, 1),
(347, 354, 'RASHEED AHMAD', 'FATHER', '31303-8199189-9', '', '+92-333-7466906', '', NULL, '', '', '5340', '2019-06-24 05:51:34', '0000-00-00 00:00:00', 4, 0, 1),
(348, 355, 'ABDUL BASEER KHAN', 'FATHER', '', '', '+92-300-6708260', '', NULL, '', '', '8117', '2019-06-24 05:54:06', '0000-00-00 00:00:00', 4, 0, 1),
(349, 356, 'SAEED AHMED BAJWA', 'FATHER', '', '', '+92-334-7352349', '', NULL, '', '', '8519', '2019-06-24 05:55:19', '0000-00-00 00:00:00', 4, 0, 1),
(350, 357, 'MUHAMMAD SHARIF KHAN', 'FATHER', '31303-0752999-1', '', '+92-300-7822400', '', NULL, '', '', '1473', '2019-06-24 05:57:11', '0000-00-00 00:00:00', 4, 0, 1),
(351, 358, 'SAYED ZAHID HUSSAIN', 'FATHER', '', '', '+92-300-5898511', '', NULL, '', '', '8122', '2019-06-24 05:58:47', '0000-00-00 00:00:00', 4, 0, 1),
(352, 359, 'RAO NAVEED AKHTAR', 'FATHER', '', '', '+92-300-9677840', '', NULL, '', '', '2906', '2019-06-24 06:00:12', '0000-00-00 00:00:00', 4, 0, 1),
(353, 360, 'M. SHAHID NASEER', 'FATHER', '', '', '+92-302-8676767', '', NULL, '', '', '3773', '2019-06-24 06:01:18', '0000-00-00 00:00:00', 4, 0, 1),
(354, 361, 'KHALID MEHMOOD ABID', 'FATHER', '', '', '+92-302-3465403', '', NULL, '', '', '7311', '2019-06-24 06:02:29', '0000-00-00 00:00:00', 4, 0, 1),
(355, 362, 'KHALID HUSSAIN', 'FATHER', '', '', '+92-300-6752100', '', NULL, '', '', '4728', '2019-06-24 06:03:28', '0000-00-00 00:00:00', 4, 0, 1),
(356, 363, 'MUHAMMAD BILAL', 'FATHER', '', '', '+92-300-9670855', '', NULL, '', '', '6981', '2019-06-24 06:04:20', '0000-00-00 00:00:00', 4, 0, 1),
(357, 364, 'RASHEED AHMED', 'FATHER', '', '', '+92-300-6734896', '', NULL, '', '', '8047', '2019-06-24 06:05:31', '0000-00-00 00:00:00', 4, 0, 1),
(358, 365, 'RAEES KHADIM HUSSAIN TABASSUM', 'FATHER', '31303-2427985-3', '', '+92-300-6744415', '', NULL, '', '', '8075', '2019-06-24 06:06:33', '0000-00-00 00:00:00', 4, 0, 1),
(359, 366, 'KHALIL AHMAD (LATE)', 'FATHER', '', '', '+92-307-6641993', '', NULL, '', '', '2353', '2019-06-24 06:07:32', '0000-00-00 00:00:00', 4, 0, 1),
(360, 367, 'MUHAMMAD ZAFAR IQBAL', 'FATHER', '31303-3074722-7', '', '+92-331-6065004', '', NULL, '', '', '3447', '2019-06-24 06:08:52', '0000-00-00 00:00:00', 4, 0, 1),
(361, 368, 'AAMIR HANIF', 'FATHER', '31303-6565329-7', '', '+92-300-4337374', '', NULL, '', '', '7762', '2019-06-24 06:09:54', '0000-00-00 00:00:00', 4, 0, 1),
(362, 369, 'MAJEED AHMAD', 'FATHER', '', '', '+92-304-7694811', '', NULL, '', '', '4212', '2019-06-24 06:22:27', '0000-00-00 00:00:00', 4, 0, 1),
(363, 370, 'SAMAR ABBAS', 'FATHER', '31303-3945543-5', '', '+92-308-4849941', '', NULL, '', '', '4693', '2019-06-24 06:24:32', '0000-00-00 00:00:00', 4, 0, 1),
(364, 371, 'ABDUL HAMEED BHATTI', 'FATHER', '', '', '+92-321-6744944', '', NULL, '', '', '9228', '2019-06-24 06:34:47', '0000-00-00 00:00:00', 4, 0, 1),
(365, 372, 'MAQSOOD AHMED', 'FATHER', '', '', '+92-308-7672775', '', NULL, '', '', '8240', '2019-06-24 06:37:43', '0000-00-00 00:00:00', 4, 0, 1),
(366, 373, 'RAO NAVEED AKHTAR', 'FATHER', '', '', '+92-300-9677840', '', NULL, '', '', '2177', '2019-06-24 06:39:22', '0000-00-00 00:00:00', 4, 0, 1),
(367, 374, 'ASHIQ HUSSAIN', 'FATHER', '', '', '+92-333-7447031', '', NULL, '', '', '9285', '2019-06-24 06:44:42', '0000-00-00 00:00:00', 4, 0, 1),
(368, 375, 'ABDUL JABBAR  ANJUM', 'FATHER', '', '', '+92-300-6739228', '', NULL, '', '', '3221', '2019-06-24 06:46:29', '0000-00-00 00:00:00', 4, 0, 1),
(369, 376, 'ABID ALI', 'FATHER', '', '', '+92-300-6752418', '', NULL, '', '', '5557', '2019-06-24 06:48:29', '0000-00-00 00:00:00', 4, 0, 1),
(370, 377, 'ATHER AMEEN', 'FATHER', '', '', '', '', NULL, '', '', '7131', '2019-06-24 07:07:27', '0000-00-00 00:00:00', 4, 0, 1),
(371, 378, 'SAEED KHAN ', 'FATHER', '', '', '+92-334-7309280', '', NULL, '', '', '6215', '2019-06-24 07:11:34', '0000-00-00 00:00:00', 4, 0, 1),
(372, 379, 'MUHAMMMAD AKHTAR', 'FATHER', '31303-2735332-9', '', '+92-335-2550043', '', NULL, '', '', '5252', '2019-06-25 03:06:51', '0000-00-00 00:00:00', 4, 0, 1),
(373, 380, 'GHULAM QADIR', 'FATHER', '31303-9018598-1', '', '+92-322-8910310', '', NULL, '', '', '4855', '2019-06-25 03:08:24', '0000-00-00 00:00:00', 4, 0, 1),
(374, 381, 'JAM RIAZ', 'FATHER', '31303-7156586-1', '', '', '', NULL, '', '', '8547', '2019-06-25 03:09:52', '0000-00-00 00:00:00', 4, 0, 1),
(375, 382, 'ARSHAD GHAFOOR', 'FATHER', '31303-2416277-9', '', '+92-304-1348414', '', NULL, '', '', '9970', '2019-06-25 03:12:54', '0000-00-00 00:00:00', 4, 0, 1),
(376, 383, 'MUHAMMAD HAFEEZ', 'FATHER', '31303-5353237-7', '', '+92-305-2750818', '', NULL, '', '', '5909', '2019-06-25 03:14:52', '0000-00-00 00:00:00', 4, 0, 1),
(377, 384, 'MUHAMMAD SAJID ALI', 'FATHER', '31301-1472413-7', '', '+92-333-7492486', '', NULL, '', '', '9571', '2019-06-25 03:16:26', '0000-00-00 00:00:00', 4, 0, 1),
(378, 385, 'JAMEEL AHMAD', 'FATHER', '', '', '', '', NULL, '', '', '9464', '2019-06-25 03:18:31', '0000-00-00 00:00:00', 4, 0, 1),
(379, 386, 'MUHAMMAD ALTAF', 'FATHER', '31303-8558565-5', '', '', '', NULL, '', '', '6694', '2019-06-25 03:21:22', '0000-00-00 00:00:00', 4, 0, 1),
(380, 387, 'ZAHOOR AHMAD', 'FATHER', '31303-6428243-1', '', '+92-305-7075097', '', NULL, '', '', '7272', '2019-06-25 03:25:26', '0000-00-00 00:00:00', 4, 0, 1),
(381, 388, 'RANA REHAN ASHRAF', 'FATHER', '31304-7226800-7', '', '+92-301-4981455', '', NULL, '', '', '9574', '2019-06-25 03:26:52', '0000-00-00 00:00:00', 4, 0, 1),
(382, 389, 'NASIR NAVEED BHATTI', 'FATHER', '31303-9852475-5', '', '', '', NULL, '', '', '4164', '2019-06-25 03:27:47', '0000-00-00 00:00:00', 4, 0, 1),
(383, 390, 'AHMED ALI', 'FATHER', '', '', '+92-303-6167356', '', NULL, '', '', '4174', '2019-06-25 03:30:17', '0000-00-00 00:00:00', 4, 0, 1),
(384, 391, 'IRSHAD AHMED', 'FATHER', '', '', '+92-300-0096606', '', NULL, '', '', '7158', '2019-06-25 03:32:31', '0000-00-00 00:00:00', 4, 0, 1),
(385, 392, 'MUHAMMAD AFAQ', 'FATHER', '', '', '+92-301-6782793', '', NULL, '', '', '5365', '2019-06-25 03:35:14', '0000-00-00 00:00:00', 4, 0, 1),
(386, 393, 'SOHAIL AKHTER', 'FATHER', '31303-3879296-3', '', '+92-300-2708743', '', NULL, '', '', '7332', '2019-06-25 03:38:08', '0000-00-00 00:00:00', 4, 0, 1),
(387, 394, 'RANA SOHAIL', 'FATHER', '31303-2411397-1', '', '+92-333-7438197', '', NULL, '', '', '3012', '2019-06-25 03:39:37', '0000-00-00 00:00:00', 4, 0, 1),
(388, 395, 'MUHAMMAD NAZAM', 'FATHER', '', '', '+92-333-6374515', '', NULL, '', '', '4004', '2019-06-25 03:41:09', '0000-00-00 00:00:00', 4, 0, 1),
(389, 396, 'MUHAMMAD ANWAR', 'FATHER', '31303-6578222-7', '', '', '', NULL, '', '', '4165', '2019-06-25 03:42:36', '0000-00-00 00:00:00', 4, 0, 1),
(390, 397, 'RASHEED AHMED', 'FATHER', '', '', '', '', NULL, '', '', '8664', '2019-06-25 03:44:10', '0000-00-00 00:00:00', 4, 0, 1),
(391, 398, 'MUHAMMAD ALI', 'FATHER', '31303-2861411-5', '', '+92-303-0391077', '', NULL, '', '', '4332', '2019-06-25 03:45:57', '0000-00-00 00:00:00', 4, 0, 1),
(392, 399, 'MAIN ABDUL LATIF', 'FATHER', '31303-6382272-3', '', '+92-301-2366390', '', NULL, '', '', '8300', '2019-06-25 03:48:32', '0000-00-00 00:00:00', 4, 0, 1),
(393, 400, 'JAMEEL AHMAD', 'FATHER', '', '', '', '', NULL, '', '', '4929', '2019-06-25 03:50:13', '0000-00-00 00:00:00', 4, 0, 1),
(394, 401, '', 'FATHER', '_____-_______-_', '', '', '', NULL, '', '', '2451', '2019-06-25 04:10:52', '0000-00-00 00:00:00', 4, 0, 1),
(395, 402, 'TALIB HUSSAIN', 'FATHER', '31303-3022595-3', '', '', '', NULL, '', '', '7299', '2019-06-25 04:12:13', '0000-00-00 00:00:00', 4, 0, 1),
(396, 403, 'SAJJAD HUSSAIN', 'FATHER', '31303-1862047-5', '', '+92-300-6746642', '', NULL, '', '', '9174', '2019-06-25 04:14:17', '0000-00-00 00:00:00', 4, 0, 1),
(397, 404, 'MUHAMMAD HANIF', 'FATHER', '31303-7721798-1', '', '+92-306-9406174', '', NULL, '', '', '3425', '2019-06-25 04:15:37', '0000-00-00 00:00:00', 4, 0, 1),
(398, 405, 'ABDUL BASIT', 'FATHER', '31303-7074313-2', '', '+92-301-2989965', '', NULL, '', '', '5616', '2019-06-25 04:17:40', '0000-00-00 00:00:00', 4, 0, 1),
(399, 406, 'M.TAYYAB', 'FATHER', '', '', '+92-333-3650450', '', NULL, '', '', '3478', '2019-06-25 04:19:14', '0000-00-00 00:00:00', 4, 0, 1),
(400, 407, 'SHAHID ASHRAF', 'FATHER', '31303-0667825-5', '', '+92-301-2614126', '', NULL, '', '', '8460', '2019-06-25 04:20:24', '0000-00-00 00:00:00', 4, 0, 1),
(401, 408, 'MUHAMMAD ALI', 'FATHER', '', '', '+92-308-6751897', '', NULL, '', '', '8529', '2019-06-25 04:22:03', '0000-00-00 00:00:00', 4, 0, 1),
(402, 409, 'MUHAMMAD RIZWAN', 'FATHER', '31303-7730814-7', '', '', '', NULL, '', '', '3388', '2019-06-25 04:24:10', '0000-00-00 00:00:00', 4, 0, 1),
(403, 410, 'ZEESHAN KHAN', 'FATHER', '', '', '+92-300-9677701', '', NULL, '', '', '2967', '2019-06-25 04:26:15', '0000-00-00 00:00:00', 4, 0, 1),
(404, 411, 'ATHER AMEEN', 'FATHER', '', '', '+92-300-9672435', '', NULL, '', '', '9400', '2019-06-25 04:30:41', '0000-00-00 00:00:00', 4, 0, 1),
(405, 412, 'M. SHEZAD KHAN', 'FATHER', '', '', '', '', NULL, '', '', '3242', '2019-06-25 04:32:04', '0000-00-00 00:00:00', 4, 0, 1),
(406, 413, 'ABDUL RASHEED NOOR', 'FATHER', '', '', '+92-300-6730588', '', NULL, '', '', '3893', '2019-06-25 04:33:32', '0000-00-00 00:00:00', 4, 0, 1),
(407, 414, 'SHAHZAD MAQBOOL', 'FATHER', '', '', '+92-336-6851742', '', NULL, '', '', '2939', '2019-06-25 04:35:08', '0000-00-00 00:00:00', 4, 0, 1),
(408, 415, 'RAEES  KHADIM HUSSAIN TABASSUM', 'FATHER', '31303-2427985-3', '', '', '', NULL, '', '', '1436', '2019-06-25 04:37:38', '0000-00-00 00:00:00', 4, 0, 1),
(409, 416, 'RAO ABDUL HAMEED', 'FATHER', '31303-2377683-5', '', '', '', NULL, '', '', '2884', '2019-06-25 04:43:49', '0000-00-00 00:00:00', 4, 0, 1),
(410, 417, 'RAO ABDUL HAMEED', 'FATHER', '31303-2377683-5', '', '', '', NULL, '', '', '1936', '2019-06-25 04:46:00', '0000-00-00 00:00:00', 4, 0, 1),
(411, 418, 'ABDUL HAMEED KHAN', 'FATHER', '', '', '+92-306-7627342', '', NULL, '', '', '9268', '2019-06-25 04:47:35', '0000-00-00 00:00:00', 4, 0, 1),
(412, 419, 'IMRAN MEHMOOD QADARI', 'FATHER', '31303-2408509-9', '', '+92-300-6703957', '', NULL, '', '', '4061', '2019-06-25 04:49:49', '0000-00-00 00:00:00', 4, 0, 1),
(413, 420, 'KHALID JAVED', 'FATHER', '31303-0177519-1', '', '+92-305-6869877', '', NULL, '', '', '6226', '2019-06-25 04:51:33', '0000-00-00 00:00:00', 4, 0, 1),
(414, 421, 'M.RAMZAN', 'FATHER', '', '', '+92-349-7400668', '', NULL, '', '', '8411', '2019-06-25 05:24:05', '0000-00-00 00:00:00', 4, 0, 1),
(415, 422, 'MAQSOOD AHMED', 'FATHER', '31303-6279314-4', '', '+92-308-7278993', '', NULL, '', '', '7426', '2019-06-25 05:25:39', '0000-00-00 00:00:00', 4, 0, 1),
(416, 423, 'MUHAMMAD JAWAD AHMED', 'FATHER', '', '', '', '', NULL, '', '', '2569', '2019-06-25 05:27:45', '0000-00-00 00:00:00', 4, 0, 1),
(417, 424, 'AMIR AWAIS', 'FATHER', '', '', '', '', NULL, '', '', '7107', '2019-06-25 05:29:29', '0000-00-00 00:00:00', 4, 0, 1),
(418, 425, 'AMIR SAEED', 'FATHER', '31303-8427973-7', '', '+92-301-8724996', '', NULL, '', '', '9268', '2019-06-25 05:39:15', '0000-00-00 00:00:00', 4, 0, 1),
(419, 426, 'FAYYAZ AHMED', 'FATHER', '31303-4094259-5', '', '+92-300-7824830', '', NULL, '', '', '7364', '2019-06-25 05:44:44', '0000-00-00 00:00:00', 4, 0, 1),
(420, 427, 'MUHAMMAD ARSHAD HUSSAIN', 'FATHER', '31303-3805594-1', '', '+92-300-6748085', '', NULL, '', '', '9880', '2019-06-25 05:46:23', '0000-00-00 00:00:00', 4, 0, 1),
(421, 428, 'AKHTAR ALI', 'FATHER', '31303-3617821-5', '', '+92-302-7564216', '', NULL, '', '', '4584', '2019-06-25 05:48:21', '0000-00-00 00:00:00', 4, 0, 1),
(422, 429, 'AKHTAR ALI', 'FATHER', '31303-3617821-5', '', '+92-302-7564216', '', NULL, '', '', '6723', '2019-06-25 05:48:22', '0000-00-00 00:00:00', 4, 0, 1),
(423, 430, 'JAVED IQBAL', 'FATHER', '31303-4782635-7', '', '+92-321-6706211', '', NULL, '', '', '8829', '2019-06-25 05:50:10', '0000-00-00 00:00:00', 4, 0, 1),
(424, 431, 'KHALIL AHMAD (LATE)', 'FATHER', '', '', '+92-307-6641993', '', NULL, '', '', '8284', '2019-06-25 05:51:53', '0000-00-00 00:00:00', 4, 0, 1),
(425, 432, 'TAHIR IQBAL', 'FATHER', '31303-6619568-9', '', '+92-321-6712160', '', NULL, '', '', '1472', '2019-06-25 05:54:09', '0000-00-00 00:00:00', 4, 0, 1),
(426, 433, 'GULAM YASEEN', 'FATHER', '31303-2376767-5', '', '+92-300-6754556', '', NULL, '', '', '1538', '2019-06-25 05:55:45', '0000-00-00 00:00:00', 4, 0, 1),
(427, 434, 'M.ALTAF', 'FATHER', '31303-8558565-5', '', '+92-300-6736626', '', NULL, '', '', '4972', '2019-06-25 05:57:38', '0000-00-00 00:00:00', 4, 0, 1),
(430, 437, 'PEER DITTA', 'FATHER', '31303-6315769-7', '', '+92-306-7664023', '', NULL, '', '', '2354', '2019-06-25 06:04:46', '0000-00-00 00:00:00', 4, 0, 1),
(431, 438, 'NOOR AHMAD', 'FATHER', '31303-5476538-3', '', '+92-303-7656886', '', NULL, '', '', '9527', '2019-06-25 06:06:07', '0000-00-00 00:00:00', 4, 0, 1),
(432, 439, 'MUHAMMAD AZAM', 'FATHER', '31303-7768718-5', '', '+92-307-2110901', '', NULL, '', '', '4766', '2019-06-25 06:07:55', '0000-00-00 00:00:00', 4, 0, 1),
(433, 440, 'RASHEED AHMAD', 'FATHER', '31303-2409593-9', '', '', '', NULL, '', '', '5969', '2019-06-25 06:09:30', '0000-00-00 00:00:00', 4, 0, 1),
(434, 441, 'AYYAZ AHMAD', 'FATHER', '31303-0543618-9', '', '', '', NULL, '', '', '6441', '2019-06-25 06:11:05', '0000-00-00 00:00:00', 4, 0, 1),
(435, 442, 'JAVED AKHTAR', 'FATHER', '31303-6815614-3', '', '+92-305-8107054', '', NULL, '', '', '5573', '2019-06-25 06:12:31', '0000-00-00 00:00:00', 4, 0, 1),
(436, 443, 'ZAHOOR AHMAD', 'FATHER', '31303-6428243-1', '', '+92-305-7075097', '', NULL, '', '', '7299', '2019-06-25 06:14:43', '0000-00-00 00:00:00', 4, 0, 1),
(437, 444, 'M. AMEEN', 'FATHER', '31303-2549493-3', '', '', '', NULL, '', '', '1765', '2019-06-25 06:15:52', '0000-00-00 00:00:00', 4, 0, 1),
(438, 445, 'ASHIQ MOHAMMAD KHAN', 'FATHER', '', '', '+92-331-7514705', '', NULL, '', '', '5717', '2019-06-25 06:18:11', '0000-00-00 00:00:00', 4, 0, 1),
(439, 446, 'HAJI ASAD AHMED KHAN', 'FATHER', '31303-2288286-8', '', '+92-304-6619258', '', NULL, '', '', '6882', '2019-06-25 06:20:05', '0000-00-00 00:00:00', 4, 0, 1),
(440, 447, 'SAEED AHMED', 'FATHER', '', '', '+92-300-6722411', '', NULL, '', '', '5153', '2019-06-25 06:21:42', '0000-00-00 00:00:00', 4, 0, 1),
(441, 448, 'TAHIR SAEED', 'FATHER', '', '', '+92-308-8972368', '', NULL, '', '', '1502', '2019-06-25 06:23:05', '0000-00-00 00:00:00', 4, 0, 1),
(442, 449, 'M.ALEEM AKBAR', 'FATHER', '31303-6527267-3', '', '+92-312-9000988', '', NULL, '', '', '1241', '2019-06-25 06:25:22', '0000-00-00 00:00:00', 4, 0, 1),
(443, 450, 'KHADIM HUSSAIN', 'FATHER', '31303-4843569-6', '', '+92-324-9071950', '', NULL, '', '', '2261', '2019-06-25 06:26:57', '0000-00-00 00:00:00', 4, 0, 1),
(444, 451, 'PEER BUKHSH', 'FATHER', '31303-3968875-7', '', '+92-304-9509471', '', NULL, '', '', '6771', '2019-06-25 06:28:15', '0000-00-00 00:00:00', 4, 0, 1),
(445, 452, 'GHULAM QADIR', 'FATHER', '31303-9088598-1', '', '+92-322-8910310', '', NULL, '', '', '6150', '2019-06-25 06:29:51', '0000-00-00 00:00:00', 4, 0, 1),
(446, 453, 'FAYYAZ AHMED', 'FATHER', '31303-4094259-5', '', '', '', NULL, '', '', '7976', '2019-06-25 06:31:21', '0000-00-00 00:00:00', 4, 0, 1),
(447, 454, 'ZIA ULLAH', 'FATHER', '31303-2414610-1', '', '+92-334-0134967', '', NULL, '', '', '6675', '2019-06-25 06:32:50', '0000-00-00 00:00:00', 4, 0, 1),
(448, 455, 'AKMAL HUSSAIN', 'FATHER', '31303-6709989-3', '', '', '', NULL, '', '', '6793', '2019-06-25 06:34:35', '0000-00-00 00:00:00', 4, 0, 1),
(449, 456, 'FARZAND ALI', 'FATHER', '31303-4977005-9', '', '+92-303-6695411', '', NULL, '', '', '7967', '2019-06-25 06:36:08', '0000-00-00 00:00:00', 4, 0, 1),
(450, 457, 'KHALID RERVAIZ ZAHID', 'FATHER', '31304-7749523-7', '', '', '', NULL, '', '', '1437', '2019-06-25 06:37:34', '0000-00-00 00:00:00', 4, 0, 1),
(451, 458, 'MUHAMMAD ASLAM', 'FATHER', '31303-1904707-3', '', '+92-345-8034382', '', NULL, '', '', '9556', '2019-06-25 06:57:25', '0000-00-00 00:00:00', 4, 0, 1),
(452, 459, 'SHOUKAT ALI', 'FATHER', '', '', '+92-306-1238412', '', NULL, '', '', '1508', '2019-06-25 07:09:46', '0000-00-00 00:00:00', 4, 0, 1),
(453, 460, 'MUHAMMAD HAFEEZ', 'FATHER', '31303-5353237-7', '', '+92-301-7635668', '', NULL, '', '', '1690', '2019-06-25 07:21:23', '0000-00-00 00:00:00', 4, 0, 1),
(454, 461, 'ABDUL BASIT (LATE)', 'FATHER', '31303-2395343-3', '', '+92-306-5313831', '', NULL, '', '', '2079', '2019-06-25 07:22:31', '0000-00-00 00:00:00', 4, 0, 1),
(455, 462, 'FAYAZ HUSSAIN', 'FATHER', '42201-2789424-3', '', '+92-301-3361412', '', NULL, '', '', '8808', '2019-06-25 07:23:54', '0000-00-00 00:00:00', 4, 0, 1),
(456, 463, 'ASGHAR ALI', 'FATHER', '31303-6566216-9', '', '+92-300-6725057', '', NULL, '', '', '8613', '2019-06-25 07:25:21', '0000-00-00 00:00:00', 4, 0, 1),
(457, 464, 'MUNAWAR AZEEM', 'FATHER', '31303-6408090-9', '', '+92-342-3993307', '', NULL, '', '', '7373', '2019-06-25 07:27:52', '0000-00-00 00:00:00', 4, 0, 1),
(458, 465, 'SAEED AHMED', 'FATHER', '31303-4090960-9', '', '+92-334-7309280', '', NULL, '', '', '4576', '2019-06-25 07:29:28', '0000-00-00 00:00:00', 4, 0, 1),
(459, 466, 'ABDUL JABBAR ANJUM', 'FATHER', '31303-5705150-7', '', '+92-305-3281713', '', NULL, '', '', '8349', '2019-06-25 07:31:04', '0000-00-00 00:00:00', 4, 0, 1),
(460, 467, 'ABDUL REHMAN', 'FATHER', '31303-2406000-5', '', '+92-300-9679903', '', NULL, '', '', '8148', '2019-06-25 07:32:37', '0000-00-00 00:00:00', 4, 0, 1),
(461, 468, 'FAYYAZ AHMED', 'FATHER', '31303-4094259-5', '', '+92-300-7824830', '', NULL, '', '', '4622', '2019-06-25 07:33:47', '0000-00-00 00:00:00', 4, 0, 1),
(462, 469, 'MUHAMMAD ALI', 'FATHER', '31303-2861411-5', '', '+92-303-0391077', '', NULL, '', '', '7674', '2019-06-25 07:34:58', '0000-00-00 00:00:00', 4, 0, 1),
(463, 470, 'AZHAR MEHMOOD', 'FATHER', '', '', '+92-304-7001337', '', NULL, '', '', '8426', '2019-06-25 07:36:57', '0000-00-00 00:00:00', 4, 0, 1),
(464, 471, 'MAIN ABDUL LATIF', 'FATHER', '31303-6382272-3', '', '+92-301-2366390', '', NULL, '', '', '7873', '2019-06-25 07:39:05', '0000-00-00 00:00:00', 4, 0, 1),
(465, 472, 'RAEES KHADIM HUSSAIN TABASSUM', 'FATHER', '31303-2427985-3', '', '+92-300-6744415', '', NULL, '', '', '4359', '2019-06-25 07:40:33', '0000-00-00 00:00:00', 4, 0, 1),
(466, 473, 'KHALID MEHMOOD', 'FATHER', '31303-0555490-1', '', '+92-300-9678432', '', NULL, '', '', '3637', '2019-06-25 07:41:53', '0000-00-00 00:00:00', 4, 0, 1),
(467, 474, 'MUHAMMAD NIZAM BASHIR', 'FATHER', '31303-2380888-1', '', '+92-300-6757200', '', NULL, '', '', '8872', '2019-06-25 07:42:59', '0000-00-00 00:00:00', 4, 0, 1),
(468, 475, 'GHULAM YASEEN', 'FATHER', '31303-1645523-7', '', '+92-345-8079811', '', NULL, '', '', '7280', '2019-06-25 07:44:26', '0000-00-00 00:00:00', 4, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_ice_info`
--

CREATE TABLE `std_ice_info` (
  `std_ice_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `std_ice_name` varchar(64) NOT NULL,
  `std_ice_relation` varchar(64) NOT NULL,
  `std_ice_contact_no` varchar(15) NOT NULL,
  `std_ice_address` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_ice_info`
--

INSERT INTO `std_ice_info` (`std_ice_id`, `std_id`, `std_ice_name`, `std_ice_relation`, `std_ice_contact_no`, `std_ice_address`, `created_at`, `created_by`, `updated_at`, `updated_by`, `delete_status`) VALUES
(3, 3, 'RIMSHA', 'Mother', '+92-306-2854433', 'STREET #05 ZAFRAABAD', '2019-06-20 01:02:50', 1, '0000-00-00 00:00:00', 0, 1),
(6, 13, '', '', '', '', '2019-06-21 00:42:20', 1, '0000-00-00 00:00:00', 0, 1),
(7, 14, '', '', '', '', '2019-06-21 00:48:23', 1, '0000-00-00 00:00:00', 0, 1),
(8, 15, '', '', '', '', '2019-06-21 00:51:08', 1, '0000-00-00 00:00:00', 0, 1),
(9, 16, '', '', '', '', '2019-06-21 00:52:42', 1, '0000-00-00 00:00:00', 0, 1),
(10, 17, '', '', '', '', '2019-06-21 00:54:43', 1, '0000-00-00 00:00:00', 0, 1),
(11, 18, '', '', '', '', '2019-06-21 00:57:20', 1, '0000-00-00 00:00:00', 0, 1),
(12, 19, '', '', '', '', '2019-06-21 00:59:08', 1, '0000-00-00 00:00:00', 0, 1),
(13, 20, '', '', '', '', '2019-06-21 01:01:45', 1, '0000-00-00 00:00:00', 0, 1),
(14, 21, '', '', '', '', '2019-06-21 01:04:09', 1, '0000-00-00 00:00:00', 0, 1),
(15, 22, '', '', '', '', '2019-06-21 01:06:25', 1, '0000-00-00 00:00:00', 0, 1),
(16, 23, '', '', '', '', '2019-06-21 01:07:53', 1, '0000-00-00 00:00:00', 0, 1),
(17, 24, '', '', '', '', '2019-06-21 01:09:16', 1, '0000-00-00 00:00:00', 0, 1),
(18, 25, '', '', '', '', '2019-06-21 01:10:38', 1, '0000-00-00 00:00:00', 0, 1),
(19, 26, '', '', '', '', '2019-06-21 01:11:54', 1, '0000-00-00 00:00:00', 0, 1),
(20, 27, '', '', '', '', '2019-06-21 01:13:34', 1, '0000-00-00 00:00:00', 0, 1),
(21, 28, '', '', '', '', '2019-06-21 01:15:08', 1, '0000-00-00 00:00:00', 0, 1),
(22, 29, '', '', '', '', '2019-06-21 01:17:31', 1, '0000-00-00 00:00:00', 0, 1),
(23, 30, '', '', '', '', '2019-06-21 01:18:50', 1, '0000-00-00 00:00:00', 0, 1),
(24, 31, '', '', '', '', '2019-06-21 01:20:07', 1, '0000-00-00 00:00:00', 0, 1),
(25, 32, '', '', '', '', '2019-06-21 01:21:33', 1, '0000-00-00 00:00:00', 0, 1),
(26, 33, '', '', '', '', '2019-06-21 01:23:23', 1, '0000-00-00 00:00:00', 0, 1),
(27, 34, '', '', '', '', '2019-06-21 01:24:52', 1, '0000-00-00 00:00:00', 0, 1),
(28, 35, '', '', '', '', '2019-06-21 01:26:03', 1, '0000-00-00 00:00:00', 0, 1),
(29, 36, '', '', '', '', '2019-06-21 01:30:30', 1, '0000-00-00 00:00:00', 0, 1),
(30, 37, '', '', '', '', '2019-06-21 01:32:13', 1, '0000-00-00 00:00:00', 0, 1),
(31, 38, '', '', '', '', '2019-06-21 02:23:46', 1, '0000-00-00 00:00:00', 0, 1),
(32, 39, '', '', '', '', '2019-06-21 02:26:14', 1, '0000-00-00 00:00:00', 0, 1),
(33, 40, '', '', '', '', '2019-06-21 02:27:53', 1, '0000-00-00 00:00:00', 0, 1),
(34, 41, '', '', '', '', '2019-06-21 02:31:49', 1, '0000-00-00 00:00:00', 0, 1),
(35, 42, '', '', '', '', '2019-06-21 02:39:18', 1, '0000-00-00 00:00:00', 0, 1),
(36, 43, '', '', '', '', '2019-06-21 02:48:57', 1, '0000-00-00 00:00:00', 0, 1),
(37, 44, '', '', '', '', '2019-06-21 03:13:17', 1, '0000-00-00 00:00:00', 0, 1),
(38, 45, '', '', '', '', '2019-06-21 03:16:19', 1, '0000-00-00 00:00:00', 0, 1),
(39, 46, '', '', '', '', '2019-06-21 03:17:57', 1, '0000-00-00 00:00:00', 0, 1),
(40, 47, '', '', '', '', '2019-06-21 03:20:08', 1, '0000-00-00 00:00:00', 0, 1),
(41, 48, '', '', '', '', '2019-06-21 03:21:33', 1, '0000-00-00 00:00:00', 0, 1),
(42, 49, '', '', '', '', '2019-06-21 03:23:09', 1, '0000-00-00 00:00:00', 0, 1),
(43, 50, '', '', '', '', '2019-06-21 04:09:02', 1, '0000-00-00 00:00:00', 0, 1),
(44, 51, '', '', '', '', '2019-06-21 04:13:27', 1, '0000-00-00 00:00:00', 0, 1),
(45, 52, '', '', '', '', '2019-06-21 04:14:43', 1, '0000-00-00 00:00:00', 0, 1),
(46, 53, '', '', '', '', '2019-06-21 04:16:17', 1, '0000-00-00 00:00:00', 0, 1),
(47, 54, '', '', '', '', '2019-06-21 04:17:45', 1, '0000-00-00 00:00:00', 0, 1),
(48, 55, '', '', '', '', '2019-06-21 04:25:18', 1, '0000-00-00 00:00:00', 0, 1),
(49, 56, '', '', '', '', '2019-06-21 04:26:54', 1, '0000-00-00 00:00:00', 0, 1),
(50, 57, '', '', '', '', '2019-06-21 04:28:25', 1, '0000-00-00 00:00:00', 0, 1),
(51, 58, '', '', '', '', '2019-06-21 04:30:44', 1, '0000-00-00 00:00:00', 0, 1),
(52, 59, '', '', '', '', '2019-06-21 04:31:58', 1, '0000-00-00 00:00:00', 0, 1),
(53, 60, '', '', '', '', '2019-06-21 04:34:35', 1, '0000-00-00 00:00:00', 0, 1),
(54, 61, '', '', '', '', '2019-06-21 04:38:09', 1, '0000-00-00 00:00:00', 0, 1),
(55, 62, '', '', '', '', '2019-06-21 04:40:23', 1, '0000-00-00 00:00:00', 0, 1),
(56, 63, '', '', '', '', '2019-06-21 04:43:56', 1, '0000-00-00 00:00:00', 0, 1),
(57, 64, '', '', '', '', '2019-06-21 04:45:44', 1, '0000-00-00 00:00:00', 0, 1),
(58, 65, '', '', '', '', '2019-06-21 04:47:40', 1, '0000-00-00 00:00:00', 0, 1),
(59, 66, '', '', '', '', '2019-06-21 04:50:08', 1, '0000-00-00 00:00:00', 0, 1),
(60, 67, '', '', '', '', '2019-06-21 04:51:46', 1, '0000-00-00 00:00:00', 0, 1),
(61, 68, '', '', '', '', '2019-06-21 04:53:57', 1, '0000-00-00 00:00:00', 0, 1),
(62, 69, '', '', '', '', '2019-06-21 04:55:15', 1, '0000-00-00 00:00:00', 0, 1),
(63, 70, '', '', '', '', '2019-06-21 04:56:34', 1, '0000-00-00 00:00:00', 0, 1),
(64, 71, '', '', '', '', '2019-06-21 04:57:55', 1, '0000-00-00 00:00:00', 0, 1),
(65, 72, '', '', '', '', '2019-06-21 05:02:53', 1, '0000-00-00 00:00:00', 0, 1),
(66, 73, '', '', '', '', '2019-06-21 05:05:42', 1, '0000-00-00 00:00:00', 0, 1),
(67, 74, '', '', '', '', '2019-06-21 05:11:26', 1, '0000-00-00 00:00:00', 0, 1),
(68, 75, '', '', '', '', '2019-06-21 05:12:27', 1, '0000-00-00 00:00:00', 0, 1),
(69, 76, '', '', '', '', '2019-06-21 05:15:25', 1, '0000-00-00 00:00:00', 0, 1),
(70, 77, '', '', '', '', '2019-06-21 05:16:31', 1, '0000-00-00 00:00:00', 0, 1),
(71, 78, '', '', '', '', '2019-06-21 05:18:02', 1, '0000-00-00 00:00:00', 0, 1),
(72, 79, '', '', '', '', '2019-06-21 05:21:19', 1, '0000-00-00 00:00:00', 0, 1),
(73, 80, '', '', '', '', '2019-06-21 05:25:22', 1, '0000-00-00 00:00:00', 0, 1),
(74, 81, '', '', '', '', '2019-06-21 05:31:27', 1, '0000-00-00 00:00:00', 0, 1),
(75, 82, '', '', '', '', '2019-06-21 05:34:01', 1, '0000-00-00 00:00:00', 0, 1),
(76, 83, '', '', '', '', '2019-06-21 05:35:44', 1, '0000-00-00 00:00:00', 0, 1),
(77, 84, '', '', '', '', '2019-06-21 05:37:35', 1, '0000-00-00 00:00:00', 0, 1),
(78, 85, '', '', '', '', '2019-06-21 05:41:10', 1, '0000-00-00 00:00:00', 0, 1),
(79, 86, '', '', '', '', '2019-06-21 05:43:32', 1, '0000-00-00 00:00:00', 0, 1),
(80, 87, '', '', '', '', '2019-06-21 05:45:40', 1, '0000-00-00 00:00:00', 0, 1),
(81, 88, '', '', '', '', '2019-06-21 05:48:21', 1, '0000-00-00 00:00:00', 0, 1),
(82, 89, '', '', '', '', '2019-06-21 05:49:40', 1, '0000-00-00 00:00:00', 0, 1),
(83, 90, '', '', '', '', '2019-06-21 05:51:17', 1, '0000-00-00 00:00:00', 0, 1),
(84, 91, '', '', '', '', '2019-06-21 05:53:04', 1, '0000-00-00 00:00:00', 0, 1),
(85, 92, '', '', '', '', '2019-06-21 05:55:21', 1, '0000-00-00 00:00:00', 0, 1),
(86, 93, '', '', '', '', '2019-06-21 05:57:17', 1, '0000-00-00 00:00:00', 0, 1),
(87, 94, '', '', '', '', '2019-06-21 05:58:58', 1, '0000-00-00 00:00:00', 0, 1),
(88, 95, '', '', '', '', '2019-06-21 06:02:46', 1, '0000-00-00 00:00:00', 0, 1),
(89, 96, '', '', '', '', '2019-06-21 06:04:36', 1, '0000-00-00 00:00:00', 0, 1),
(90, 97, '', '', '', '', '2019-06-21 06:06:23', 1, '0000-00-00 00:00:00', 0, 1),
(91, 98, '', '', '', '', '2019-06-21 06:07:43', 1, '0000-00-00 00:00:00', 0, 1),
(92, 99, '', '', '', '', '2019-06-21 06:09:35', 1, '0000-00-00 00:00:00', 0, 1),
(93, 100, '', '', '', '', '2019-06-21 06:11:25', 1, '0000-00-00 00:00:00', 0, 1),
(94, 101, '', '', '', '', '2019-06-21 06:12:54', 1, '0000-00-00 00:00:00', 0, 1),
(95, 102, '', '', '', '', '2019-06-21 06:15:09', 1, '0000-00-00 00:00:00', 0, 1),
(96, 103, '', '', '', '', '2019-06-21 06:16:47', 1, '0000-00-00 00:00:00', 0, 1),
(97, 104, '', '', '', '', '2019-06-21 06:18:54', 1, '0000-00-00 00:00:00', 0, 1),
(98, 105, '', '', '', '', '2019-06-21 06:20:56', 1, '0000-00-00 00:00:00', 0, 1),
(99, 106, '', '', '', '', '2019-06-21 06:24:23', 1, '0000-00-00 00:00:00', 0, 1),
(100, 107, '', '', '', '', '2019-06-21 06:26:35', 1, '0000-00-00 00:00:00', 0, 1),
(101, 108, '', '', '', '', '2019-06-21 06:27:56', 1, '0000-00-00 00:00:00', 0, 1),
(102, 109, '', '', '', '', '2019-06-21 06:35:40', 1, '0000-00-00 00:00:00', 0, 1),
(103, 110, '', '', '', '', '2019-06-21 06:37:00', 1, '0000-00-00 00:00:00', 0, 1),
(104, 111, '', '', '', '', '2019-06-21 06:38:22', 1, '0000-00-00 00:00:00', 0, 1),
(105, 112, '', '', '', '', '2019-06-21 06:39:46', 1, '0000-00-00 00:00:00', 0, 1),
(106, 113, '', '', '', '', '2019-06-21 06:41:11', 1, '0000-00-00 00:00:00', 0, 1),
(107, 114, '', '', '', '', '2019-06-21 06:45:00', 1, '0000-00-00 00:00:00', 0, 1),
(108, 115, '', '', '', '', '2019-06-21 06:48:39', 1, '0000-00-00 00:00:00', 0, 1),
(109, 116, '', '', '', '', '2019-06-21 06:51:04', 1, '0000-00-00 00:00:00', 0, 1),
(110, 117, '', '', '', '', '2019-06-21 06:53:28', 1, '0000-00-00 00:00:00', 0, 1),
(112, 119, '', '', '', '', '2019-06-21 06:56:17', 1, '0000-00-00 00:00:00', 0, 1),
(113, 120, '', '', '', '', '2019-06-21 06:59:02', 1, '0000-00-00 00:00:00', 0, 1),
(114, 121, '', '', '', '', '2019-06-21 07:01:16', 1, '0000-00-00 00:00:00', 0, 1),
(115, 122, '', '', '', '', '2019-06-21 07:05:13', 1, '0000-00-00 00:00:00', 0, 1),
(116, 123, '', '', '', '', '2019-06-21 07:08:31', 1, '0000-00-00 00:00:00', 0, 1),
(117, 124, '', '', '', '', '2019-06-21 07:11:08', 1, '0000-00-00 00:00:00', 0, 1),
(118, 125, '', '', '', '', '2019-06-21 07:12:38', 1, '0000-00-00 00:00:00', 0, 1),
(119, 126, '', '', '', '', '2019-06-21 07:14:34', 1, '0000-00-00 00:00:00', 0, 1),
(120, 127, '', '', '', '', '2019-06-21 07:15:55', 1, '0000-00-00 00:00:00', 0, 1),
(121, 128, '', '', '', '', '2019-06-21 07:17:31', 1, '0000-00-00 00:00:00', 0, 1),
(122, 129, '', '', '', '', '2019-06-21 07:18:59', 1, '0000-00-00 00:00:00', 0, 1),
(123, 130, '', '', '', '', '2019-06-21 07:21:01', 1, '0000-00-00 00:00:00', 0, 1),
(124, 131, '', '', '', '', '2019-06-21 07:22:13', 1, '0000-00-00 00:00:00', 0, 1),
(125, 132, '', '', '', '', '2019-06-21 07:23:43', 1, '0000-00-00 00:00:00', 0, 1),
(126, 133, '', '', '', '', '2019-06-21 07:26:11', 1, '0000-00-00 00:00:00', 0, 1),
(127, 134, '', '', '', '', '2019-06-21 07:28:36', 1, '0000-00-00 00:00:00', 0, 1),
(128, 135, '', '', '', '', '2019-06-21 07:29:52', 1, '0000-00-00 00:00:00', 0, 1),
(129, 136, '', '', '', '', '2019-06-21 07:31:19', 1, '0000-00-00 00:00:00', 0, 1),
(130, 137, '', '', '', '', '2019-06-21 07:32:31', 1, '0000-00-00 00:00:00', 0, 1),
(131, 138, '', '', '', '', '2019-06-21 07:34:52', 1, '0000-00-00 00:00:00', 0, 1),
(132, 139, '', '', '', '', '2019-06-21 07:36:15', 1, '0000-00-00 00:00:00', 0, 1),
(133, 140, '', '', '', '', '2019-06-21 07:38:13', 1, '0000-00-00 00:00:00', 0, 1),
(134, 141, '', '', '', '', '2019-06-21 07:40:31', 1, '0000-00-00 00:00:00', 0, 1),
(135, 142, '', '', '', '', '2019-06-21 07:43:09', 1, '0000-00-00 00:00:00', 0, 1),
(136, 143, '', '', '', '', '2019-06-21 07:44:28', 1, '0000-00-00 00:00:00', 0, 1),
(137, 144, '', '', '', '', '2019-06-21 07:45:52', 1, '0000-00-00 00:00:00', 0, 1),
(138, 145, '', '', '', '', '2019-06-21 07:49:20', 1, '0000-00-00 00:00:00', 0, 1),
(139, 146, '', '', '', '', '2019-06-21 07:50:57', 1, '0000-00-00 00:00:00', 0, 1),
(140, 147, '', '', '', '', '2019-06-21 07:52:45', 1, '0000-00-00 00:00:00', 0, 1),
(141, 148, '', '', '', '', '2019-06-21 23:44:18', 1, '0000-00-00 00:00:00', 0, 1),
(142, 149, '', '', '', '', '2019-06-21 23:47:01', 1, '0000-00-00 00:00:00', 0, 1),
(143, 150, '', '', '', '', '2019-06-21 23:52:53', 1, '0000-00-00 00:00:00', 0, 1),
(144, 151, '', '', '', '', '2019-06-21 23:54:40', 1, '0000-00-00 00:00:00', 0, 1),
(145, 152, '', '', '', '', '2019-06-21 23:58:54', 1, '0000-00-00 00:00:00', 0, 1),
(146, 153, '', '', '', '', '2019-06-22 00:00:27', 1, '0000-00-00 00:00:00', 0, 1),
(147, 154, '', '', '', '', '2019-06-22 00:13:42', 1, '0000-00-00 00:00:00', 0, 1),
(148, 155, '', '', '', '', '2019-06-22 00:15:35', 1, '0000-00-00 00:00:00', 0, 1),
(149, 156, '', '', '', '', '2019-06-22 00:16:38', 1, '0000-00-00 00:00:00', 0, 1),
(150, 157, '', '', '', '', '2019-06-22 00:19:32', 1, '0000-00-00 00:00:00', 0, 1),
(151, 158, '', '', '', '', '2019-06-22 00:21:02', 1, '0000-00-00 00:00:00', 0, 1),
(152, 159, '', '', '', '', '2019-06-22 00:22:24', 1, '0000-00-00 00:00:00', 0, 1),
(153, 160, '', '', '', '', '2019-06-22 00:23:31', 1, '0000-00-00 00:00:00', 0, 1),
(154, 161, '', '', '', '', '2019-06-22 00:25:30', 1, '0000-00-00 00:00:00', 0, 1),
(155, 162, '', '', '', '', '2019-06-22 00:26:45', 1, '0000-00-00 00:00:00', 0, 1),
(156, 163, '', '', '', '', '2019-06-22 00:28:05', 1, '0000-00-00 00:00:00', 0, 1),
(157, 164, '', '', '', '', '2019-06-22 00:29:27', 1, '0000-00-00 00:00:00', 0, 1),
(158, 165, '', '', '', '', '2019-06-22 00:30:54', 1, '0000-00-00 00:00:00', 0, 1),
(159, 166, '', '', '', '', '2019-06-22 00:32:39', 1, '0000-00-00 00:00:00', 0, 1),
(160, 167, '', '', '', '', '2019-06-22 00:35:45', 1, '0000-00-00 00:00:00', 0, 1),
(161, 168, '', '', '', '', '2019-06-22 00:37:15', 1, '0000-00-00 00:00:00', 0, 1),
(162, 169, '', '', '', '', '2019-06-22 00:38:47', 1, '0000-00-00 00:00:00', 0, 1),
(163, 170, '', '', '', '', '2019-06-22 00:40:07', 1, '0000-00-00 00:00:00', 0, 1),
(164, 171, '', '', '', '', '2019-06-22 00:41:41', 1, '0000-00-00 00:00:00', 0, 1),
(165, 172, '', '', '', '', '2019-06-22 00:43:03', 1, '0000-00-00 00:00:00', 0, 1),
(166, 173, '', '', '', '', '2019-06-22 00:44:24', 1, '0000-00-00 00:00:00', 0, 1),
(167, 174, '', '', '', '', '2019-06-22 00:46:25', 1, '0000-00-00 00:00:00', 0, 1),
(168, 175, '', '', '', '', '2019-06-22 00:47:11', 1, '0000-00-00 00:00:00', 0, 1),
(172, 179, '', '', '', '', '2019-06-22 00:50:08', 1, '0000-00-00 00:00:00', 0, 1),
(173, 180, '', '', '', '', '2019-06-22 00:52:05', 1, '0000-00-00 00:00:00', 0, 1),
(174, 181, '', '', '', '', '2019-06-22 00:53:46', 1, '0000-00-00 00:00:00', 0, 1),
(175, 182, '', '', '', '', '2019-06-22 00:55:52', 1, '0000-00-00 00:00:00', 0, 1),
(176, 183, '', '', '', '', '2019-06-22 00:57:06', 1, '0000-00-00 00:00:00', 0, 1),
(177, 184, '', '', '', '', '2019-06-22 00:58:10', 1, '0000-00-00 00:00:00', 0, 1),
(178, 185, '', '', '', '', '2019-06-22 00:59:32', 1, '0000-00-00 00:00:00', 0, 1),
(179, 186, '', '', '', '', '2019-06-22 01:00:40', 1, '0000-00-00 00:00:00', 0, 1),
(180, 187, '', '', '', '', '2019-06-22 01:01:54', 1, '0000-00-00 00:00:00', 0, 1),
(181, 188, '', '', '', '', '2019-06-22 01:03:25', 1, '0000-00-00 00:00:00', 0, 1),
(182, 189, '', '', '', '', '2019-06-22 01:04:46', 1, '0000-00-00 00:00:00', 0, 1),
(183, 190, '', '', '', '', '2019-06-22 01:20:39', 1, '0000-00-00 00:00:00', 0, 1),
(184, 191, '', '', '', '', '2019-06-22 01:22:33', 1, '0000-00-00 00:00:00', 0, 1),
(185, 192, '', '', '', '', '2019-06-22 01:23:57', 1, '0000-00-00 00:00:00', 0, 1),
(186, 193, '', '', '', '', '2019-06-22 01:25:20', 1, '0000-00-00 00:00:00', 0, 1),
(187, 194, '', '', '', '', '2019-06-22 01:26:44', 1, '0000-00-00 00:00:00', 0, 1),
(188, 195, '', '', '', '', '2019-06-22 01:27:58', 1, '0000-00-00 00:00:00', 0, 1),
(189, 196, '', '', '', '', '2019-06-22 01:29:28', 1, '0000-00-00 00:00:00', 0, 1),
(190, 197, '', '', '', '', '2019-06-22 01:33:14', 1, '0000-00-00 00:00:00', 0, 1),
(191, 198, '', '', '', '', '2019-06-22 01:37:48', 1, '0000-00-00 00:00:00', 0, 1),
(192, 199, '', '', '', '', '2019-06-22 01:39:30', 1, '0000-00-00 00:00:00', 0, 1),
(193, 200, '', '', '', '', '2019-06-22 01:41:46', 1, '0000-00-00 00:00:00', 0, 1),
(194, 201, '', '', '', '', '2019-06-22 01:43:55', 1, '0000-00-00 00:00:00', 0, 1),
(195, 202, '', '', '', '', '2019-06-22 01:45:58', 1, '0000-00-00 00:00:00', 0, 1),
(196, 203, '', '', '', '', '2019-06-22 01:47:26', 1, '0000-00-00 00:00:00', 0, 1),
(197, 204, '', '', '', '', '2019-06-22 01:53:21', 1, '0000-00-00 00:00:00', 0, 1),
(198, 205, '', '', '', '', '2019-06-22 02:03:01', 1, '0000-00-00 00:00:00', 0, 1),
(199, 206, '', '', '', '', '2019-06-22 02:05:04', 1, '0000-00-00 00:00:00', 0, 1),
(200, 207, '', '', '', '', '2019-06-22 02:08:20', 1, '0000-00-00 00:00:00', 0, 1),
(201, 208, '', '', '', '', '2019-06-22 02:10:12', 1, '0000-00-00 00:00:00', 0, 1),
(202, 209, '', '', '', '', '2019-06-22 02:12:24', 1, '0000-00-00 00:00:00', 0, 1),
(203, 210, '', '', '', '', '2019-06-22 02:14:38', 1, '0000-00-00 00:00:00', 0, 1),
(204, 211, '', '', '+92-301-7668819', '', '2019-06-22 02:43:55', 1, '0000-00-00 00:00:00', 0, 1),
(205, 212, '', '', '', '', '2019-06-22 02:48:27', 1, '0000-00-00 00:00:00', 0, 1),
(206, 213, '', '', '+92-300-9676843', '', '2019-06-22 02:51:07', 1, '0000-00-00 00:00:00', 0, 1),
(207, 214, '', '', '+92-334-7341726', '', '2019-06-22 03:00:11', 1, '0000-00-00 00:00:00', 0, 1),
(208, 215, '', '', '+92-332-7328592', '', '2019-06-22 03:02:06', 1, '0000-00-00 00:00:00', 0, 1),
(209, 216, '', '', '+92-304-2197497', '', '2019-06-22 03:03:54', 1, '0000-00-00 00:00:00', 0, 1),
(210, 217, '', '', '', '', '2019-06-22 03:06:17', 1, '0000-00-00 00:00:00', 0, 1),
(211, 218, '', '', '', '', '2019-06-22 03:08:45', 1, '0000-00-00 00:00:00', 0, 1),
(212, 219, '', '', '', '', '2019-06-22 03:26:34', 1, '0000-00-00 00:00:00', 0, 1),
(213, 220, '', '', '', '', '2019-06-22 03:29:06', 1, '0000-00-00 00:00:00', 0, 1),
(214, 221, '', '', '', '', '2019-06-22 03:30:49', 1, '0000-00-00 00:00:00', 0, 1),
(215, 222, '', '', '+92-301-6787031', '', '2019-06-22 03:32:17', 1, '0000-00-00 00:00:00', 0, 1),
(216, 223, '', '', '', '', '2019-06-22 03:33:50', 1, '0000-00-00 00:00:00', 0, 1),
(217, 224, '', '', '', '', '2019-06-22 03:35:34', 1, '0000-00-00 00:00:00', 0, 1),
(218, 225, '', '', '', '', '2019-06-22 03:36:39', 1, '0000-00-00 00:00:00', 0, 1),
(219, 226, '', '', '', '', '2019-06-22 03:37:42', 1, '0000-00-00 00:00:00', 0, 1),
(220, 227, '', '', '', '', '2019-06-22 03:38:55', 1, '0000-00-00 00:00:00', 0, 1),
(221, 228, '', '', '', '', '2019-06-22 03:39:58', 1, '0000-00-00 00:00:00', 0, 1),
(222, 229, '', '', '', '', '2019-06-22 03:41:06', 1, '0000-00-00 00:00:00', 0, 1),
(223, 230, '', '', '', '', '2019-06-22 03:42:11', 1, '0000-00-00 00:00:00', 0, 1),
(224, 231, '', '', '', '', '2019-06-22 03:43:17', 1, '0000-00-00 00:00:00', 0, 1),
(225, 232, '', '', '', '', '2019-06-22 03:44:30', 1, '0000-00-00 00:00:00', 0, 1),
(226, 233, '', '', '', '', '2019-06-22 03:45:50', 1, '0000-00-00 00:00:00', 0, 1),
(227, 234, '', '', '', '', '2019-06-22 03:47:03', 1, '0000-00-00 00:00:00', 0, 1),
(228, 235, '', '', '+92-321-6733112', '', '2019-06-22 03:48:25', 1, '0000-00-00 00:00:00', 0, 1),
(229, 236, '', '', '', '', '2019-06-22 03:49:31', 1, '0000-00-00 00:00:00', 0, 1),
(230, 237, '', '', '', '', '2019-06-22 03:50:45', 1, '0000-00-00 00:00:00', 0, 1),
(231, 238, '', '', '+92-300-6714125', '', '2019-06-22 03:51:52', 1, '0000-00-00 00:00:00', 0, 1),
(232, 239, '', '', '', '', '2019-06-22 03:52:54', 1, '0000-00-00 00:00:00', 0, 1),
(233, 240, '', '', '', '', '2019-06-22 03:54:07', 1, '0000-00-00 00:00:00', 0, 1),
(234, 241, '', '', '', '', '2019-06-22 03:55:14', 1, '0000-00-00 00:00:00', 0, 1),
(235, 242, '', '', '', '', '2019-06-22 03:56:15', 1, '0000-00-00 00:00:00', 0, 1),
(236, 243, '', '', '', '', '2019-06-22 04:08:59', 1, '0000-00-00 00:00:00', 0, 1),
(237, 244, '', '', '', '', '2019-06-22 04:14:58', 1, '0000-00-00 00:00:00', 0, 1),
(238, 245, '', '', '', '', '2019-06-22 04:19:56', 1, '0000-00-00 00:00:00', 0, 1),
(239, 246, '', '', '', '', '2019-06-22 04:22:47', 1, '0000-00-00 00:00:00', 0, 1),
(240, 247, '', '', '', '', '2019-06-22 04:25:53', 1, '0000-00-00 00:00:00', 0, 1),
(241, 248, '', '', '', '', '2019-06-22 04:33:06', 1, '0000-00-00 00:00:00', 0, 1),
(242, 249, '', '', '', '', '2019-06-22 04:39:33', 1, '0000-00-00 00:00:00', 0, 1),
(243, 250, '', '', '', '', '2019-06-22 04:53:43', 1, '0000-00-00 00:00:00', 0, 1),
(244, 251, '', '', '', '', '2019-06-22 04:55:48', 1, '0000-00-00 00:00:00', 0, 1),
(245, 252, '', '', '', '', '2019-06-22 04:57:17', 1, '0000-00-00 00:00:00', 0, 1),
(246, 253, '', '', '+92-301-6678299', '', '2019-06-22 04:59:19', 1, '0000-00-00 00:00:00', 0, 1),
(247, 254, '', '', '+92-300-6749604', '', '2019-06-22 05:00:51', 1, '0000-00-00 00:00:00', 0, 1),
(248, 255, '', '', '', '', '2019-06-22 05:02:13', 1, '0000-00-00 00:00:00', 0, 1),
(249, 256, '', '', '', '', '2019-06-22 05:03:56', 1, '0000-00-00 00:00:00', 0, 1),
(250, 257, '', '', '+92-321-6718230', '', '2019-06-22 05:05:22', 1, '0000-00-00 00:00:00', 0, 1),
(251, 258, '', '', '', '', '2019-06-22 05:08:09', 1, '0000-00-00 00:00:00', 0, 1),
(252, 259, '', '', '+92-300-6735590', '', '2019-06-22 05:10:11', 1, '0000-00-00 00:00:00', 0, 1),
(253, 260, '', '', '', '', '2019-06-22 05:13:46', 1, '0000-00-00 00:00:00', 0, 1),
(254, 261, '', '', '+92-300-6743658', '', '2019-06-22 05:19:03', 1, '0000-00-00 00:00:00', 0, 1),
(255, 262, '', '', '+92-300-6743658', '', '2019-06-22 05:22:22', 1, '0000-00-00 00:00:00', 0, 1),
(256, 263, '', '', '+92-303-6719036', '', '2019-06-22 05:23:30', 1, '0000-00-00 00:00:00', 0, 1),
(257, 264, '', '', '', '', '2019-06-22 05:24:46', 1, '0000-00-00 00:00:00', 0, 1),
(258, 265, '', '', '', '', '2019-06-22 05:26:09', 1, '0000-00-00 00:00:00', 0, 1),
(259, 266, '', '', '', '', '2019-06-22 05:27:45', 1, '0000-00-00 00:00:00', 0, 1),
(260, 267, '', '', '+92-300-6736626', '', '2019-06-22 05:29:01', 1, '0000-00-00 00:00:00', 0, 1),
(261, 268, '', '', '', '', '2019-06-22 05:30:24', 1, '0000-00-00 00:00:00', 0, 1),
(262, 269, '', '', '', '', '2019-06-22 05:31:45', 1, '0000-00-00 00:00:00', 0, 1),
(263, 270, '', '', '', '', '2019-06-22 05:32:54', 1, '0000-00-00 00:00:00', 0, 1),
(264, 271, '', '', '', '', '2019-06-22 05:37:34', 1, '0000-00-00 00:00:00', 0, 1),
(265, 272, '', '', '', '', '2019-06-22 05:39:10', 1, '0000-00-00 00:00:00', 0, 1),
(266, 273, '', '', '', '', '2019-06-22 05:40:45', 1, '0000-00-00 00:00:00', 0, 1),
(267, 274, '', '', '', '', '2019-06-22 05:42:12', 1, '0000-00-00 00:00:00', 0, 1),
(268, 275, '', '', '', '', '2019-06-22 05:43:25', 1, '0000-00-00 00:00:00', 0, 1),
(269, 276, '', '', '', '', '2019-06-22 06:03:07', 1, '0000-00-00 00:00:00', 0, 1),
(270, 277, '', '', '', '', '2019-06-22 06:07:52', 1, '0000-00-00 00:00:00', 0, 1),
(271, 278, '', '', '', '', '2019-06-22 06:12:40', 1, '0000-00-00 00:00:00', 0, 1),
(272, 279, '', '', '', '', '2019-06-22 06:14:13', 1, '0000-00-00 00:00:00', 0, 1),
(273, 280, '', '', '', '', '2019-06-22 06:15:36', 1, '0000-00-00 00:00:00', 0, 1),
(274, 281, '', '', '', '', '2019-06-22 06:18:48', 1, '0000-00-00 00:00:00', 0, 1),
(275, 282, '', '', '', '', '2019-06-22 06:21:20', 1, '0000-00-00 00:00:00', 0, 1),
(276, 283, '', '', '', '', '2019-06-22 06:23:05', 1, '0000-00-00 00:00:00', 0, 1),
(277, 284, '', '', '', '', '2019-06-22 06:28:27', 1, '0000-00-00 00:00:00', 0, 1),
(278, 285, '', '', '', '', '2019-06-22 06:29:46', 1, '0000-00-00 00:00:00', 0, 1),
(279, 286, '', '', '', '', '2019-06-22 06:30:57', 1, '0000-00-00 00:00:00', 0, 1),
(280, 287, '', '', '', '', '2019-06-22 06:33:33', 1, '0000-00-00 00:00:00', 0, 1),
(281, 288, '', '', '', '', '2019-06-22 06:35:27', 1, '0000-00-00 00:00:00', 0, 1),
(282, 289, '', '', '', '', '2019-06-22 06:36:57', 1, '0000-00-00 00:00:00', 0, 1),
(283, 290, '', '', '', '', '2019-06-22 06:38:25', 1, '0000-00-00 00:00:00', 0, 1),
(284, 291, '', '', '', '', '2019-06-24 00:22:09', 1, '0000-00-00 00:00:00', 0, 1),
(285, 292, '', '', '+92-304-6766458', '', '2019-06-24 00:23:30', 1, '0000-00-00 00:00:00', 0, 1),
(286, 293, '', '', '', '', '2019-06-24 00:24:41', 1, '0000-00-00 00:00:00', 0, 1),
(287, 294, '', '', '+92-301-7663687', '', '2019-06-24 00:25:52', 1, '0000-00-00 00:00:00', 0, 1),
(288, 295, '', '', '', '', '2019-06-24 00:27:17', 1, '0000-00-00 00:00:00', 0, 1),
(289, 296, '', '', '+92-308-7613135', '', '2019-06-24 00:29:28', 1, '0000-00-00 00:00:00', 0, 1),
(290, 297, '', '', '+92-300-6708994', '', '2019-06-24 00:31:25', 1, '0000-00-00 00:00:00', 0, 1),
(291, 298, '', '', '+92-305-7061075', '', '2019-06-24 00:32:47', 1, '0000-00-00 00:00:00', 0, 1),
(292, 299, '', '', '', '', '2019-06-24 00:34:05', 1, '0000-00-00 00:00:00', 0, 1),
(293, 300, '', '', '', '', '2019-06-24 00:35:20', 1, '0000-00-00 00:00:00', 0, 1),
(294, 301, '', '', '', '', '2019-06-24 00:36:32', 1, '0000-00-00 00:00:00', 0, 1),
(295, 302, '', '', '', '', '2019-06-24 00:38:21', 1, '0000-00-00 00:00:00', 0, 1),
(296, 303, '', '', '', '', '2019-06-24 00:46:14', 1, '0000-00-00 00:00:00', 0, 1),
(297, 304, '', '', '', '', '2019-06-24 00:47:20', 1, '0000-00-00 00:00:00', 0, 1),
(298, 305, '', '', '', '', '2019-06-24 00:48:30', 1, '0000-00-00 00:00:00', 0, 1),
(299, 306, '', '', '', '', '2019-06-24 00:49:54', 1, '0000-00-00 00:00:00', 0, 1),
(300, 307, '', '', '+92-300-9675099', '', '2019-06-24 00:52:45', 1, '0000-00-00 00:00:00', 0, 1),
(301, 308, '', '', '+92-300-6721640', '', '2019-06-24 00:54:07', 1, '0000-00-00 00:00:00', 0, 1),
(302, 309, '', '', '', '', '2019-06-24 00:59:28', 1, '0000-00-00 00:00:00', 0, 1),
(303, 310, '', '', '+92-300-9673723', '', '2019-06-24 01:01:09', 1, '0000-00-00 00:00:00', 0, 1),
(304, 311, '', '', '', '', '2019-06-24 01:02:12', 1, '0000-00-00 00:00:00', 0, 1),
(305, 312, '', '', '+92-300-7824830', '', '2019-06-24 01:03:43', 1, '0000-00-00 00:00:00', 0, 1),
(306, 313, '', '', '', '', '2019-06-24 01:05:21', 1, '0000-00-00 00:00:00', 0, 1),
(307, 314, '', '', '', '', '2019-06-24 01:06:37', 1, '0000-00-00 00:00:00', 0, 1),
(308, 315, '', '', '', '', '2019-06-24 01:08:21', 1, '0000-00-00 00:00:00', 0, 1),
(309, 316, '', '', '', '', '2019-06-24 01:09:56', 1, '0000-00-00 00:00:00', 0, 1),
(310, 317, '', '', '', '', '2019-06-24 01:11:23', 1, '0000-00-00 00:00:00', 0, 1),
(311, 318, '', '', '', '', '2019-06-24 01:12:24', 1, '0000-00-00 00:00:00', 0, 1),
(312, 319, '', '', '', '', '2019-06-24 01:13:30', 1, '0000-00-00 00:00:00', 0, 1),
(313, 320, '', '', '', '', '2019-06-24 01:14:48', 1, '0000-00-00 00:00:00', 0, 1),
(314, 321, '', '', '', '', '2019-06-24 04:55:57', 4, '0000-00-00 00:00:00', 0, 1),
(315, 322, '', '', '', '', '2019-06-24 04:58:42', 4, '0000-00-00 00:00:00', 0, 1),
(316, 323, '', '', '+92-300-7824455', '', '2019-06-24 05:00:06', 4, '0000-00-00 00:00:00', 0, 1),
(317, 324, '', '', '+92-321-6718230', '', '2019-06-24 05:01:29', 4, '0000-00-00 00:00:00', 0, 1),
(318, 325, '', '', '+92-331-7967220', '', '2019-06-24 05:03:29', 4, '0000-00-00 00:00:00', 0, 1),
(319, 326, '', '', '', '', '2019-06-24 05:04:49', 4, '0000-00-00 00:00:00', 0, 1),
(320, 327, '', '', '+92-311-4309441', '', '2019-06-24 05:06:07', 4, '0000-00-00 00:00:00', 0, 1),
(321, 328, '', '', '+92-300-8777712', '', '2019-06-24 05:07:31', 4, '0000-00-00 00:00:00', 0, 1),
(322, 329, '', '', '', '', '2019-06-24 05:08:50', 4, '0000-00-00 00:00:00', 0, 1),
(323, 330, '', '', '+92-334-7312036', '', '2019-06-24 05:10:24', 4, '0000-00-00 00:00:00', 0, 1),
(324, 331, '', '', '+92-304-7001337', '', '2019-06-24 05:12:25', 4, '0000-00-00 00:00:00', 0, 1),
(325, 332, '', '', '', '', '2019-06-24 05:15:11', 4, '0000-00-00 00:00:00', 0, 1),
(326, 333, '', '', '', '', '2019-06-24 05:16:47', 4, '0000-00-00 00:00:00', 0, 1),
(327, 334, '', '', '', '', '2019-06-24 05:18:00', 4, '0000-00-00 00:00:00', 0, 1),
(328, 335, '', '', '', '', '2019-06-24 05:19:19', 4, '0000-00-00 00:00:00', 0, 1),
(329, 336, '', '', '', '', '2019-06-24 05:20:13', 4, '0000-00-00 00:00:00', 0, 1),
(330, 337, '', '', '', '', '2019-06-24 05:21:56', 4, '0000-00-00 00:00:00', 0, 1),
(331, 338, '', '', '', '', '2019-06-24 05:23:11', 4, '0000-00-00 00:00:00', 0, 1),
(332, 339, '', '', '', '', '2019-06-24 05:28:15', 4, '0000-00-00 00:00:00', 0, 1),
(333, 340, '', '', '', '', '2019-06-24 05:29:23', 4, '0000-00-00 00:00:00', 0, 1),
(334, 341, '', '', '', '', '2019-06-24 05:30:44', 4, '0000-00-00 00:00:00', 0, 1),
(335, 342, '', '', '', '', '2019-06-24 05:32:08', 4, '0000-00-00 00:00:00', 0, 1),
(336, 343, '', '', '', '', '2019-06-24 05:33:27', 4, '0000-00-00 00:00:00', 0, 1),
(337, 344, '', '', '', '', '2019-06-24 05:36:20', 4, '0000-00-00 00:00:00', 0, 1),
(338, 345, '', '', '', '', '2019-06-24 05:37:42', 4, '0000-00-00 00:00:00', 0, 1),
(339, 346, '', '', '', '', '2019-06-24 05:39:13', 4, '0000-00-00 00:00:00', 0, 1),
(340, 347, '', '', '+06-858-77844__', '', '2019-06-24 05:41:14', 4, '0000-00-00 00:00:00', 0, 1),
(341, 348, 'WASEEM GHORI', '', '', '', '2019-06-24 05:43:11', 4, '0000-00-00 00:00:00', 0, 1),
(342, 349, '', '', '', '', '2019-06-24 05:44:48', 4, '0000-00-00 00:00:00', 0, 1),
(343, 350, '', '', '', '', '2019-06-24 05:46:12', 4, '0000-00-00 00:00:00', 0, 1),
(344, 351, '', '', '+92-300-9677622', '', '2019-06-24 05:48:23', 4, '0000-00-00 00:00:00', 0, 1),
(345, 352, '', '', '+92-300-6719477', '', '2019-06-24 05:49:47', 4, '0000-00-00 00:00:00', 0, 1),
(347, 354, '', '', '+92-300-6734896', '', '2019-06-24 05:51:34', 4, '0000-00-00 00:00:00', 0, 1),
(348, 355, '', '', '+92-321-6708386', '', '2019-06-24 05:54:06', 4, '0000-00-00 00:00:00', 0, 1),
(349, 356, '', '', '+92-300-964328_', '', '2019-06-24 05:55:19', 4, '0000-00-00 00:00:00', 0, 1),
(350, 357, '', '', '', '', '2019-06-24 05:57:11', 4, '0000-00-00 00:00:00', 0, 1),
(351, 358, '', '', '', '', '2019-06-24 05:58:47', 4, '0000-00-00 00:00:00', 0, 1),
(352, 359, '', '', '', '', '2019-06-24 06:00:12', 4, '0000-00-00 00:00:00', 0, 1),
(353, 360, '', '', '', '', '2019-06-24 06:01:18', 4, '0000-00-00 00:00:00', 0, 1),
(354, 361, '', '', '', '', '2019-06-24 06:02:29', 4, '0000-00-00 00:00:00', 0, 1),
(355, 362, '', '', '', '', '2019-06-24 06:03:28', 4, '0000-00-00 00:00:00', 0, 1),
(356, 363, '', '', '', '', '2019-06-24 06:04:20', 4, '0000-00-00 00:00:00', 0, 1),
(357, 364, '', '', '', '', '2019-06-24 06:05:31', 4, '0000-00-00 00:00:00', 0, 1),
(358, 365, '', '', '', '', '2019-06-24 06:06:33', 4, '0000-00-00 00:00:00', 0, 1),
(359, 366, '', '', '', '', '2019-06-24 06:07:32', 4, '0000-00-00 00:00:00', 0, 1),
(360, 367, '', '', '', '', '2019-06-24 06:08:52', 4, '0000-00-00 00:00:00', 0, 1),
(361, 368, '', '', '', '', '2019-06-24 06:09:54', 4, '0000-00-00 00:00:00', 0, 1),
(362, 369, '', '', '', '', '2019-06-24 06:22:27', 4, '0000-00-00 00:00:00', 0, 1),
(363, 370, '', '', '', '', '2019-06-24 06:24:32', 4, '0000-00-00 00:00:00', 0, 1),
(364, 371, '', '', '', '', '2019-06-24 06:34:47', 4, '0000-00-00 00:00:00', 0, 1),
(365, 372, '', '', '', '', '2019-06-24 06:37:43', 4, '0000-00-00 00:00:00', 0, 1),
(366, 373, '', '', '', '', '2019-06-24 06:39:22', 4, '0000-00-00 00:00:00', 0, 1),
(367, 374, '', '', '', '', '2019-06-24 06:44:42', 4, '0000-00-00 00:00:00', 0, 1),
(368, 375, '', '', '', '', '2019-06-24 06:46:29', 4, '0000-00-00 00:00:00', 0, 1),
(369, 376, '', '', '', '', '2019-06-24 06:48:29', 4, '0000-00-00 00:00:00', 0, 1),
(370, 377, '', '', '', '', '2019-06-24 07:07:27', 4, '0000-00-00 00:00:00', 0, 1),
(371, 378, '', '', '', '', '2019-06-24 07:11:34', 4, '0000-00-00 00:00:00', 0, 1),
(372, 379, '', '', '', '', '2019-06-25 03:06:51', 4, '0000-00-00 00:00:00', 0, 1),
(373, 380, '', '', '', '', '2019-06-25 03:08:24', 4, '0000-00-00 00:00:00', 0, 1),
(374, 381, '', '', '+92-300-6700743', '', '2019-06-25 03:09:52', 4, '0000-00-00 00:00:00', 0, 1),
(375, 382, '', '', '', '', '2019-06-25 03:12:54', 4, '0000-00-00 00:00:00', 0, 1),
(376, 383, '', '', '', '', '2019-06-25 03:14:52', 4, '0000-00-00 00:00:00', 0, 1),
(377, 384, '', '', '', '', '2019-06-25 03:16:26', 4, '0000-00-00 00:00:00', 0, 1),
(378, 385, '', '', '+92-308-7483715', '', '2019-06-25 03:18:31', 4, '0000-00-00 00:00:00', 0, 1),
(379, 386, '', '', '+92-300-6736626', '', '2019-06-25 03:21:22', 4, '0000-00-00 00:00:00', 0, 1),
(380, 387, '', '', '', '', '2019-06-25 03:25:26', 4, '0000-00-00 00:00:00', 0, 1),
(381, 388, '', '', '', '', '2019-06-25 03:26:52', 4, '0000-00-00 00:00:00', 0, 1),
(382, 389, '', '', '', '', '2019-06-25 03:27:47', 4, '0000-00-00 00:00:00', 0, 1),
(383, 390, '', '', '', '', '2019-06-25 03:30:17', 4, '0000-00-00 00:00:00', 0, 1),
(384, 391, '', '', '', '', '2019-06-25 03:32:31', 4, '0000-00-00 00:00:00', 0, 1),
(385, 392, '', '', '', '', '2019-06-25 03:35:14', 4, '0000-00-00 00:00:00', 0, 1),
(386, 393, '', '', '', '', '2019-06-25 03:38:08', 4, '0000-00-00 00:00:00', 0, 1),
(387, 394, '', '', '', '', '2019-06-25 03:39:37', 4, '0000-00-00 00:00:00', 0, 1),
(388, 395, '', '', '', '', '2019-06-25 03:41:09', 4, '0000-00-00 00:00:00', 0, 1),
(389, 396, '', '', '+92-300-8777712', '', '2019-06-25 03:42:36', 4, '0000-00-00 00:00:00', 0, 1),
(390, 397, '', '', '+92-300-6734896', '', '2019-06-25 03:44:10', 4, '0000-00-00 00:00:00', 0, 1),
(391, 398, '', '', '', '', '2019-06-25 03:45:57', 4, '0000-00-00 00:00:00', 0, 1),
(392, 399, '', '', '', '', '2019-06-25 03:48:32', 4, '0000-00-00 00:00:00', 0, 1),
(393, 400, '', '', '+92-308-7483715', '', '2019-06-25 03:50:13', 4, '0000-00-00 00:00:00', 0, 1),
(394, 401, '', '', '+92-300-6733924', '', '2019-06-25 04:10:52', 4, '0000-00-00 00:00:00', 0, 1),
(395, 402, '', '', '+92-304-7541606', '', '2019-06-25 04:12:13', 4, '0000-00-00 00:00:00', 0, 1),
(396, 403, '', '', '', '', '2019-06-25 04:14:17', 4, '0000-00-00 00:00:00', 0, 1),
(397, 404, '', '', '', '', '2019-06-25 04:15:37', 4, '0000-00-00 00:00:00', 0, 1),
(398, 405, '', '', '', '', '2019-06-25 04:17:40', 4, '0000-00-00 00:00:00', 0, 1),
(399, 406, '', '', '', '', '2019-06-25 04:19:14', 4, '0000-00-00 00:00:00', 0, 1),
(400, 407, '', '', '', '', '2019-06-25 04:20:24', 4, '0000-00-00 00:00:00', 0, 1),
(401, 408, '', '', '', '', '2019-06-25 04:22:03', 4, '0000-00-00 00:00:00', 0, 1),
(402, 409, '', '', '+92-300-9676843', '', '2019-06-25 04:24:10', 4, '0000-00-00 00:00:00', 0, 1),
(403, 410, '', '', '', '', '2019-06-25 04:26:15', 4, '0000-00-00 00:00:00', 0, 1),
(404, 411, '', '', '', '', '2019-06-25 04:30:41', 4, '0000-00-00 00:00:00', 0, 1),
(405, 412, '', '', '+92-300-6810734', '', '2019-06-25 04:32:04', 4, '0000-00-00 00:00:00', 0, 1),
(406, 413, '', '', '', '', '2019-06-25 04:33:32', 4, '0000-00-00 00:00:00', 0, 1),
(407, 414, '', '', '', '', '2019-06-25 04:35:08', 4, '0000-00-00 00:00:00', 0, 1),
(408, 415, '', '', '+92-300-6744415', '', '2019-06-25 04:37:38', 4, '0000-00-00 00:00:00', 0, 1),
(409, 416, '', '', '+92-302-7660097', '', '2019-06-25 04:43:49', 4, '0000-00-00 00:00:00', 0, 1),
(410, 417, '', '', '+92-302-7660097', '', '2019-06-25 04:46:00', 4, '0000-00-00 00:00:00', 0, 1),
(411, 418, '', '', '', '', '2019-06-25 04:47:35', 4, '0000-00-00 00:00:00', 0, 1),
(412, 419, '', '', '', '', '2019-06-25 04:49:49', 4, '0000-00-00 00:00:00', 0, 1),
(413, 420, '', '', '', '', '2019-06-25 04:51:33', 4, '0000-00-00 00:00:00', 0, 1),
(414, 421, '', '', '', '', '2019-06-25 05:24:05', 4, '0000-00-00 00:00:00', 0, 1),
(415, 422, '', '', '', '', '2019-06-25 05:25:39', 4, '0000-00-00 00:00:00', 0, 1),
(416, 423, '', '', '+92-300-9670345', '', '2019-06-25 05:27:45', 4, '0000-00-00 00:00:00', 0, 1),
(417, 424, '', '', '+92-308-3291835', '', '2019-06-25 05:29:29', 4, '0000-00-00 00:00:00', 0, 1),
(418, 425, '', '', '', '', '2019-06-25 05:39:15', 4, '0000-00-00 00:00:00', 0, 1),
(419, 426, '', '', '', '', '2019-06-25 05:44:44', 4, '0000-00-00 00:00:00', 0, 1),
(420, 427, '', '', '', '', '2019-06-25 05:46:23', 4, '0000-00-00 00:00:00', 0, 1),
(421, 428, '', '', '', '', '2019-06-25 05:48:21', 4, '0000-00-00 00:00:00', 0, 1),
(422, 429, '', '', '', '', '2019-06-25 05:48:22', 4, '0000-00-00 00:00:00', 0, 1),
(423, 430, '', '', '', '', '2019-06-25 05:50:10', 4, '0000-00-00 00:00:00', 0, 1),
(424, 431, '', '', '', '', '2019-06-25 05:51:53', 4, '0000-00-00 00:00:00', 0, 1),
(425, 432, '', '', '', '', '2019-06-25 05:54:09', 4, '0000-00-00 00:00:00', 0, 1),
(426, 433, '', '', '', '', '2019-06-25 05:55:45', 4, '0000-00-00 00:00:00', 0, 1),
(427, 434, '', '', '', '', '2019-06-25 05:57:38', 4, '0000-00-00 00:00:00', 0, 1),
(430, 437, '', '', '', '', '2019-06-25 06:04:46', 4, '0000-00-00 00:00:00', 0, 1),
(431, 438, '', '', '', '', '2019-06-25 06:06:07', 4, '0000-00-00 00:00:00', 0, 1),
(432, 439, '', '', '', '', '2019-06-25 06:07:55', 4, '0000-00-00 00:00:00', 0, 1),
(433, 440, '', '', '+92-302-7625652', '', '2019-06-25 06:09:30', 4, '0000-00-00 00:00:00', 0, 1),
(434, 441, '', '', '', '', '2019-06-25 06:11:05', 4, '0000-00-00 00:00:00', 0, 1),
(435, 442, '', '', '', '', '2019-06-25 06:12:31', 4, '0000-00-00 00:00:00', 0, 1),
(436, 443, '', '', '', '', '2019-06-25 06:14:43', 4, '0000-00-00 00:00:00', 0, 1),
(437, 444, '', '', '', '', '2019-06-25 06:15:52', 4, '0000-00-00 00:00:00', 0, 1),
(438, 445, '', '', '', '', '2019-06-25 06:18:11', 4, '0000-00-00 00:00:00', 0, 1),
(439, 446, '', '', '', '', '2019-06-25 06:20:05', 4, '0000-00-00 00:00:00', 0, 1),
(440, 447, '', '', '', '', '2019-06-25 06:21:42', 4, '0000-00-00 00:00:00', 0, 1),
(441, 448, '', '', '', '', '2019-06-25 06:23:05', 4, '0000-00-00 00:00:00', 0, 1),
(442, 449, '', '', '', '', '2019-06-25 06:25:22', 4, '0000-00-00 00:00:00', 0, 1),
(443, 450, '', '', '', '', '2019-06-25 06:26:57', 4, '0000-00-00 00:00:00', 0, 1),
(444, 451, '', '', '', '', '2019-06-25 06:28:15', 4, '0000-00-00 00:00:00', 0, 1),
(445, 452, '', '', '', '', '2019-06-25 06:29:51', 4, '0000-00-00 00:00:00', 0, 1),
(446, 453, '', '', '+92-300-7824830', '', '2019-06-25 06:31:21', 4, '0000-00-00 00:00:00', 0, 1),
(447, 454, '', '', '', '', '2019-06-25 06:32:50', 4, '0000-00-00 00:00:00', 0, 1),
(448, 455, '', '', '+92-303-6637498', '', '2019-06-25 06:34:35', 4, '0000-00-00 00:00:00', 0, 1),
(449, 456, '', '', '', '', '2019-06-25 06:36:08', 4, '0000-00-00 00:00:00', 0, 1),
(450, 457, '', '', '+92-346-8813944', '', '2019-06-25 06:37:34', 4, '0000-00-00 00:00:00', 0, 1),
(451, 458, '', '', '', '', '2019-06-25 06:57:25', 4, '0000-00-00 00:00:00', 0, 1),
(452, 459, '', '', '', '', '2019-06-25 07:09:46', 4, '0000-00-00 00:00:00', 0, 1),
(453, 460, '', '', '', '', '2019-06-25 07:21:23', 4, '0000-00-00 00:00:00', 0, 1),
(454, 461, '', '', '', '', '2019-06-25 07:22:31', 4, '0000-00-00 00:00:00', 0, 1),
(455, 462, '', '', '', '', '2019-06-25 07:23:54', 4, '0000-00-00 00:00:00', 0, 1),
(456, 463, '', '', '', '', '2019-06-25 07:25:21', 4, '0000-00-00 00:00:00', 0, 1),
(457, 464, '', '', '', '', '2019-06-25 07:27:52', 4, '0000-00-00 00:00:00', 0, 1),
(458, 465, '', '', '', '', '2019-06-25 07:29:28', 4, '0000-00-00 00:00:00', 0, 1),
(459, 466, '', '', '', '', '2019-06-25 07:31:04', 4, '0000-00-00 00:00:00', 0, 1),
(460, 467, '', '', '', '', '2019-06-25 07:32:37', 4, '0000-00-00 00:00:00', 0, 1),
(461, 468, '', '', '', '', '2019-06-25 07:33:47', 4, '0000-00-00 00:00:00', 0, 1),
(462, 469, '', '', '', '', '2019-06-25 07:34:58', 4, '0000-00-00 00:00:00', 0, 1),
(463, 470, '', '', '', '', '2019-06-25 07:36:57', 4, '0000-00-00 00:00:00', 0, 1),
(464, 471, '', '', '', '', '2019-06-25 07:39:05', 4, '0000-00-00 00:00:00', 0, 1),
(465, 472, '', '', '', '', '2019-06-25 07:40:33', 4, '0000-00-00 00:00:00', 0, 1),
(466, 473, '', '', '', '', '2019-06-25 07:41:53', 4, '0000-00-00 00:00:00', 0, 1),
(467, 474, '', '', '', '', '2019-06-25 07:42:59', 4, '0000-00-00 00:00:00', 0, 1),
(468, 475, '', '', '', '', '2019-06-25 07:44:26', 4, '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_inquiry`
--

CREATE TABLE `std_inquiry` (
  `std_inquiry_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `std_inquiry_no` varchar(15) NOT NULL,
  `inquiry_session` varchar(20) NOT NULL,
  `std_name` varchar(32) NOT NULL,
  `std_father_name` varchar(32) NOT NULL,
  `gender` enum('Female','Male') NOT NULL,
  `std_contact_no` varchar(15) NOT NULL,
  `std_father_contact_no` varchar(15) NOT NULL,
  `std_inquiry_date` date NOT NULL,
  `std_intrested_class` varchar(50) NOT NULL,
  `std_previous_class` varchar(32) NOT NULL,
  `previous_institute` varchar(120) NOT NULL,
  `std_roll_no` varchar(10) NOT NULL,
  `std_obtained_marks` int(4) NOT NULL,
  `std_total_marks` int(4) NOT NULL,
  `std_percentage` varchar(6) NOT NULL,
  `refrence_name` varchar(32) NOT NULL,
  `refrence_contact_no` varchar(15) NOT NULL,
  `refrence_designation` varchar(30) NOT NULL,
  `std_address` varchar(200) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `inquiry_status` enum('Inquiry','Registered') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `std_personal_info`
--

CREATE TABLE `std_personal_info` (
  `std_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `std_reg_no` varchar(50) NOT NULL,
  `std_name` varchar(50) NOT NULL,
  `std_father_name` varchar(50) NOT NULL,
  `std_contact_no` varchar(15) NOT NULL,
  `std_DOB` date DEFAULT NULL,
  `std_gender` enum('M','F') NOT NULL,
  `std_permanent_address` varchar(255) NOT NULL,
  `std_temporary_address` varchar(255) NOT NULL,
  `std_email` varchar(84) NOT NULL,
  `std_photo` varchar(200) NOT NULL,
  `std_b_form` varchar(255) NOT NULL,
  `std_district` varchar(50) NOT NULL,
  `std_religion` varchar(50) NOT NULL,
  `std_nationality` varchar(50) NOT NULL,
  `std_tehseel` varchar(50) NOT NULL,
  `std_cast` varchar(30) NOT NULL,
  `admission_date` date DEFAULT NULL,
  `std_password` varchar(20) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `academic_status` enum('Active','Promote','Left','Struck off') NOT NULL,
  `barcode` longblob NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_personal_info`
--

INSERT INTO `std_personal_info` (`std_id`, `branch_id`, `std_reg_no`, `std_name`, `std_father_name`, `std_contact_no`, `std_DOB`, `std_gender`, `std_permanent_address`, `std_temporary_address`, `std_email`, `std_photo`, `std_b_form`, `std_district`, `std_religion`, `std_nationality`, `std_tehseel`, `std_cast`, `admission_date`, `std_password`, `status`, `academic_status`, `barcode`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(3, 5, 'STD-REG-Y19-3', 'RUMAISIA USMAN', 'M.USMAN', '', '2015-02-03', 'F', 'STREET #05 ZAFRAABAD', 'STREET #05 ZAFRAABAD', '', 'uploads/RUMAISIA USMAN_photo.jpg', '', 'RYK', 'Islam', 'Pakistani', 'RYK', '', '0000-00-00', '9647', 'Active', 'Active', '', '2019-07-02 08:01:29', '2019-06-26 08:45:51', 1, 1, 1),
(13, 5, 'STD-REG-Y19-13', 'MUHAMMAD HUSSAIN KHALID', 'MUHAMMAD KHALID', '', '2014-07-20', 'M', '', '', '', 'uploads/MUHAMMAD HUSSAIN KHALID_photo.jpg', '', '', '', '', '', '', '0000-00-00', '2745', 'Active', 'Active', '', '2019-07-02 08:01:36', '2019-06-26 08:47:50', 1, 1, 1),
(14, 5, 'STD-REG-Y19-14', 'HAREEM FATIMA', 'WAQAR ZAFAR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2322', 'Active', 'Active', '', '2019-07-02 08:02:08', '0000-00-00 00:00:00', 1, 0, 1),
(15, 5, 'STD-REG-Y19-15', 'RABAIL FATIMA', 'NAVEED ZAFAR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1945', 'Active', 'Active', '', '2019-07-02 08:02:14', '0000-00-00 00:00:00', 1, 0, 1),
(16, 5, 'STD-REG-Y19-16', 'ABDULLAH WAQAS', 'WAQAS IFTKHAR', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2201', 'Active', 'Active', '', '2019-07-02 08:02:25', '0000-00-00 00:00:00', 1, 0, 1),
(17, 5, 'STD-REG-Y19-17', 'ZOHA KAMRAN', 'WAHID KAMRAN KHAN', '', NULL, 'F', '', '', '', 'uploads/ZOHA KAMRAN_photo.jpg', '', '', '', '', '', '', '0000-00-00', '3494', 'Active', 'Active', '', '2019-07-02 08:02:31', '2019-06-26 08:51:21', 1, 1, 1),
(18, 5, 'STD-REG-Y19-18', 'M.USAID KHAN', 'M.EJAZ KHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9722', 'Active', 'Active', '', '2019-07-02 08:02:37', '0000-00-00 00:00:00', 1, 0, 1),
(19, 5, 'STD-REG-Y19-19', 'IRTABA IJAZ', 'MUHAMMAD IJAZ', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', 'Islam', '', '', '', '0000-00-00', '1519', 'Active', 'Active', '', '2019-07-02 08:02:47', '0000-00-00 00:00:00', 1, 0, 1),
(20, 5, 'STD-REG-Y19-20', 'TEHREEM IJAZ', 'MUHAMMAD IJAZ', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1093', 'Active', 'Active', '', '2019-07-02 08:02:54', '0000-00-00 00:00:00', 1, 0, 1),
(21, 5, 'STD-REG-Y19-21', 'ZAHRA SHAHZAD', 'M. SHAHZAD KHAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', 'RYK', '', '', '', '', '0000-00-00', '6909', 'Active', 'Active', '', '2019-07-02 08:03:01', '0000-00-00 00:00:00', 1, 0, 1),
(23, 5, 'STD-REG-Y19-23', 'AYAAN SHAHID', 'RANA SHAHID IQBAL', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3038', 'Active', 'Active', '', '2019-07-02 08:03:11', '0000-00-00 00:00:00', 1, 0, 1),
(24, 5, 'STD-REG-Y19-24', 'MUHAMMAD FARAZ', 'MUHAMMAD FAROOQ', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3446', 'Active', 'Active', '', '2019-07-02 08:03:16', '0000-00-00 00:00:00', 1, 0, 1),
(25, 5, 'STD-REG-Y19-25', 'AIZA ABBASI', 'MUHAMMAD ZAHID', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8920', 'Active', 'Active', '', '2019-07-02 08:03:22', '0000-00-00 00:00:00', 1, 0, 1),
(26, 5, 'STD-REG-Y19-26', 'FATIMA BIBI', 'MUHAMMAD ALTAF', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3146', 'Active', 'Active', '', '2019-07-02 08:03:28', '0000-00-00 00:00:00', 1, 0, 1),
(27, 5, 'STD-REG-Y19-27', 'DUA FATIMA', 'HASNAIN KHALIL', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9828', 'Active', 'Active', '', '2019-07-02 08:03:33', '0000-00-00 00:00:00', 1, 0, 1),
(28, 5, 'STD-REG-Y19-28', 'ZAMZAMAH', 'YAAR MUHAMMAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7734', 'Active', 'Active', '', '2019-07-02 08:03:38', '0000-00-00 00:00:00', 1, 0, 1),
(29, 5, 'STD-REG-Y19-29', 'SIMON', 'MAQSOOD MASIH', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', 'CHRISTIAN', '', '', '', '0000-00-00', '6203', 'Active', 'Active', '', '2019-07-02 08:03:49', '0000-00-00 00:00:00', 1, 0, 1),
(30, 5, 'STD-REG-Y19-30', 'MUHAMMAD ZEESHAN', 'MUHAMMAD ARFAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8927', 'Active', 'Active', '', '2019-07-02 08:03:55', '0000-00-00 00:00:00', 1, 0, 1),
(32, 5, 'STD-REG-Y19-32', 'TALHA', 'A', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8276', 'Active', 'Active', '', '2019-07-02 08:04:02', '0000-00-00 00:00:00', 1, 0, 1),
(33, 5, 'STD-REG-Y19-33', 'HASSAN AFTAB', 'AFTAB TAYYAB', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7480', 'Active', 'Active', '', '2019-07-02 08:04:44', '0000-00-00 00:00:00', 1, 0, 1),
(34, 5, 'STD-REG-Y19-34', 'JANNAT FATIMA', 'ZUBAIR ALI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8996', 'Active', 'Active', '', '2019-07-02 08:04:50', '0000-00-00 00:00:00', 1, 0, 1),
(35, 5, 'STD-REG-Y19-35', 'MUHAMMAD ABU BAKAR', 'IFTIKHAR UL HASSAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1577', 'Active', 'Active', '', '2019-07-02 08:04:55', '0000-00-00 00:00:00', 1, 0, 1),
(36, 5, 'STD-REG-Y19-36', 'HADIA FATIMA', 'BILAL HUSSAIN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '4655', 'Active', 'Active', '', '2019-07-02 08:05:01', '0000-00-00 00:00:00', 1, 0, 1),
(37, 5, 'STD-REG-Y19-37', 'MAHIRA', 'IRFAN ALI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7829', 'Active', 'Active', '', '2019-07-02 08:05:06', '0000-00-00 00:00:00', 1, 0, 1),
(38, 5, 'STD-REG-Y19-38', 'ABDUL HADI', 'MUHAMMAD IJAZ SHAH', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', 'Islam', '', '', '', '0000-00-00', '6630', 'Active', 'Active', '', '2019-07-02 08:05:12', '0000-00-00 00:00:00', 1, 0, 1),
(39, 5, 'STD-REG-Y19-39', 'MUHAMMAD AAYAN MEHBOOB', 'MEHBOB AHMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2877', 'Active', 'Active', '', '2019-07-02 08:06:38', '0000-00-00 00:00:00', 1, 0, 1),
(40, 5, 'STD-REG-Y19-40', 'MUHAMMAD HUZAFIA JAMEEL', 'JAMEEL AHMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5218', 'Active', 'Active', '', '2019-07-02 08:06:45', '0000-00-00 00:00:00', 1, 0, 1),
(42, 5, 'STD-REG-Y19-42', 'MUBSHIRA KHAN', 'FIAZ AHMAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6939', 'Active', 'Active', '', '2019-07-02 08:06:54', '0000-00-00 00:00:00', 1, 0, 1),
(43, 5, 'STD-REG-Y19-43', 'MUHAMMAD HAMDAN KHAN', 'MUHAMMAD KAMRAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '4972', 'Active', 'Active', '', '2019-07-02 08:07:00', '0000-00-00 00:00:00', 1, 0, 1),
(44, 5, 'STD-REG-Y19-44', 'MUHAMMAD HUMZA IMRAN', 'IMRAN MEHMOOD QADRI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9661', 'Active', 'Active', '', '2019-07-02 08:07:15', '0000-00-00 00:00:00', 1, 0, 1),
(45, 5, 'STD-REG-Y19-45', 'FATIMA TAHIR', 'MUHAMMAD TAHIR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9181', 'Active', 'Active', '', '2019-07-02 08:07:22', '0000-00-00 00:00:00', 1, 0, 1),
(46, 5, 'STD-REG-Y19-46', 'ZAIN AHMAD KHAN', 'M AHMAD SAIF KHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6731', 'Active', 'Active', '', '2019-07-02 08:07:34', '0000-00-00 00:00:00', 1, 0, 1),
(47, 5, 'STD-REG-Y19-47', 'ABRISH', 'ZIA HASSAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8134', 'Active', 'Active', '', '2019-07-02 08:07:46', '0000-00-00 00:00:00', 1, 0, 1),
(48, 5, 'STD-REG-Y19-48', 'MUHAMMAD IBRAHIM', 'ZIA HASSAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3440', 'Active', 'Active', '', '2019-07-02 08:07:56', '0000-00-00 00:00:00', 1, 0, 1),
(50, 5, 'STD-REG-Y19-50', 'SHAMAYA  ZAHID', 'ZAHID MUNAWAR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', 'CHRISTIAN', '', '', '', '0000-00-00', '8462', 'Active', 'Active', '', '2019-07-02 08:08:04', '0000-00-00 00:00:00', 1, 0, 1),
(51, 5, 'STD-REG-Y19-51', 'ALI MUHAMMAD KHAN', 'AFZAAL AHMED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', 'Islam', '', '', '', '0000-00-00', '1546', 'Active', 'Active', '', '2019-07-02 08:08:12', '0000-00-00 00:00:00', 1, 0, 1),
(52, 5, 'STD-REG-Y19-52', 'AWAIS FARID', 'GHULAM FARID', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3932', 'Active', 'Active', '', '2019-07-02 08:08:21', '0000-00-00 00:00:00', 1, 0, 1),
(53, 5, 'STD-REG-Y19-53', 'FARIA FATIMA', 'MUHAMMAD REHAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3364', 'Active', 'Active', '', '2019-07-02 08:08:28', '0000-00-00 00:00:00', 1, 0, 1),
(54, 5, 'STD-REG-Y19-54', 'HAMNA ISRAR', 'MIAN ISRAR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9444', 'Active', 'Active', '', '2019-07-02 08:08:35', '0000-00-00 00:00:00', 1, 0, 1),
(55, 5, 'STD-REG-Y19-55', 'FAJAR IRFAN', 'IRFAN UL HAQ', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1491', 'Active', 'Active', '', '2019-07-02 08:08:41', '0000-00-00 00:00:00', 1, 0, 1),
(56, 5, 'STD-REG-Y19-56', 'MUHAMMAD FAZAN', 'MUHAMMAD RIZWAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2536', 'Active', 'Active', '', '2019-07-02 08:08:48', '0000-00-00 00:00:00', 1, 0, 1),
(57, 5, 'STD-REG-Y19-57', 'MUHAMMAD AYAN ALI', 'MUHAMMAD ARSHAD KHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2586', 'Active', 'Active', '', '2019-07-02 08:08:56', '0000-00-00 00:00:00', 1, 0, 1),
(58, 5, 'STD-REG-Y19-58', 'RIZWAN ULLAH', 'A', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1425', 'Active', 'Active', '', '2019-07-02 08:09:04', '0000-00-00 00:00:00', 1, 0, 1),
(60, 5, 'STD-REG-Y19-60', 'ABU BAKAR', 'A', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2556', 'Active', 'Active', '', '2019-07-02 08:09:14', '2019-06-21 10:59:40', 1, 1, 1),
(62, 5, 'STD-REG-Y19-62', 'SYEDA FARYAL FATIMA BUKHARI', 'SYED ASIM BUKHARI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6590', 'Active', 'Active', '', '2019-07-02 08:09:20', '0000-00-00 00:00:00', 1, 0, 1),
(63, 5, 'STD-REG-Y19-63', 'FAIZA AAMIR', 'AAMIR TUFAIL', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7374', 'Active', 'Active', '', '2019-07-02 08:09:32', '0000-00-00 00:00:00', 1, 0, 1),
(64, 5, 'STD-REG-Y19-64', 'RAMEEN SHAHID', 'SHAHID NADEEM', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5754', 'Active', 'Active', '', '2019-07-02 08:09:39', '0000-00-00 00:00:00', 1, 0, 1),
(65, 5, 'STD-REG-Y19-65', 'MUHAMMAD ARHAM KHAN', 'JAVED MUJTABA', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '4313', 'Active', 'Active', '', '2019-07-02 08:09:46', '0000-00-00 00:00:00', 1, 0, 1),
(66, 5, 'STD-REG-Y19-66', 'MUHAMMAD OWAIS', 'MUHAMMAD IRFAN AZAM', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5825', 'Active', 'Active', '', '2019-07-02 08:09:56', '0000-00-00 00:00:00', 1, 0, 1),
(67, 5, 'STD-REG-Y19-67', 'KINZA KOREEN', 'ZAHID MEHMOOD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', 'CHRISTIAN', '', '', '', '0000-00-00', '1487', 'Active', 'Active', '', '2019-07-02 08:10:14', '0000-00-00 00:00:00', 1, 0, 1),
(68, 5, 'STD-REG-Y19-68', 'MAHAM ARSHAD', 'MUHAMMAD ARSHAD HUSSAIN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2722', 'Active', 'Active', '', '2019-07-02 08:10:23', '0000-00-00 00:00:00', 1, 0, 1),
(69, 5, 'STD-REG-Y19-69', 'BUKHTAWER KHAN', 'M AZEEM KHAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9962', 'Active', 'Active', '', '2019-07-02 08:10:30', '2019-06-21 11:00:17', 1, 1, 1),
(70, 5, 'STD-REG-Y19-70', 'MUHAMMAD FAIZAN', 'ABDUL HAMEED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '4521', 'Active', 'Active', '', '2019-07-02 08:10:36', '0000-00-00 00:00:00', 1, 0, 1),
(72, 5, 'STD-REG-Y19-72', 'JAVERIA KHAN', 'ZUBAIR KHAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5371', 'Active', 'Active', '', '2019-07-02 08:10:43', '0000-00-00 00:00:00', 1, 0, 1),
(73, 5, 'STD-REG-Y19-73', 'MUHAMMAD SUBHAN KHAN', 'WAHID KAMRAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8211', 'Active', 'Active', '', '2019-07-02 08:10:52', '2019-06-21 10:08:44', 1, 1, 1),
(74, 5, 'STD-REG-Y19-74', 'MAHAD AHMAD', 'MUHAMMAD MADNI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', 'Islam', '', '', '', '0000-00-00', '3032', 'Active', 'Active', '', '2019-07-02 08:11:35', '0000-00-00 00:00:00', 1, 0, 1),
(75, 5, 'STD-REG-Y19-75', 'MOMNA SHEHVAR', 'IRFAN ALI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3079', 'Active', 'Active', '', '2019-07-02 08:11:42', '0000-00-00 00:00:00', 1, 0, 1),
(76, 5, 'STD-REG-Y19-76', 'MAAZ BILAL', 'MUHAMMAD BILAL', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1053', 'Active', 'Active', '', '2019-07-02 08:11:51', '0000-00-00 00:00:00', 1, 0, 1),
(77, 5, 'STD-REG-Y19-77', 'ABDUR REHMAN', 'MUHAMMAD IRFAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '4615', 'Active', 'Active', '', '2019-07-02 08:11:58', '0000-00-00 00:00:00', 1, 0, 1),
(78, 5, 'STD-REG-Y19-78', 'REHAN SHAKEEL', 'MUHAMMAD SHAKEEL', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9366', 'Active', 'Active', '', '2019-07-02 08:12:18', '0000-00-00 00:00:00', 1, 0, 1),
(79, 5, 'STD-REG-Y19-79', 'SHAMRAYA TAHIR', 'TAHIR IQBAL', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7417', 'Active', 'Active', '', '2019-07-02 08:12:27', '0000-00-00 00:00:00', 1, 0, 1),
(80, 5, 'STD-REG-Y19-80', 'NABEEL AHMED', 'JAMEEL AHMED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3719', 'Active', 'Active', '', '2019-07-02 08:12:33', '0000-00-00 00:00:00', 1, 0, 1),
(81, 5, 'STD-REG-Y19-81', 'MUHAMMAD ANAS', 'TARIQ MEHMOOD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5693', 'Active', 'Active', '', '2019-07-02 08:12:42', '0000-00-00 00:00:00', 1, 0, 1),
(82, 5, 'STD-REG-Y19-82', 'M HAMZA MAQSOOD', 'MAQSOOD AKHATR', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7470', 'Active', 'Active', '', '2019-07-02 08:12:49', '0000-00-00 00:00:00', 1, 0, 1),
(83, 5, 'STD-REG-Y19-83', 'ESHAL KHAN', 'NUMAN AHMAD KHAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8089', 'Active', 'Active', '', '2019-07-02 08:12:56', '0000-00-00 00:00:00', 1, 0, 1),
(84, 5, 'STD-REG-Y19-84', 'ABDUL HADI', 'RAO NAVEED AKHTAR', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6403', 'Active', 'Active', '', '2019-07-02 08:13:10', '0000-00-00 00:00:00', 1, 0, 1),
(85, 5, 'STD-REG-Y19-85', 'BILAL HAFEEZ', 'HAFEEZ MAQBOOL', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5444', 'Active', 'Active', '', '2019-07-02 08:13:18', '0000-00-00 00:00:00', 1, 0, 1),
(86, 5, 'STD-REG-Y19-86', 'WAREESHA NADEEM', 'NADEEM SHAHZAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1641', 'Active', 'Active', '', '2019-07-02 08:13:25', '0000-00-00 00:00:00', 1, 0, 1),
(87, 5, 'STD-REG-Y19-87', 'KHUSH BAKHT ALI', 'AFZAAL AHMAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', 'Islam', '', '', '', '0000-00-00', '4270', 'Active', 'Active', '', '2019-07-02 08:13:32', '0000-00-00 00:00:00', 1, 0, 1),
(88, 5, 'STD-REG-Y19-88', 'HAFSA IMRAN', 'IMRAN-UL-HAQ', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6112', 'Active', 'Active', '', '2019-07-02 08:13:40', '0000-00-00 00:00:00', 1, 0, 1),
(89, 5, 'STD-REG-Y19-89', 'ANAYA IMRAN', 'DR IMRAN BASHIR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9809', 'Active', 'Active', '', '2019-07-02 08:13:48', '0000-00-00 00:00:00', 1, 0, 1),
(90, 5, 'STD-REG-Y19-90', 'MUHAMMAD ALIYAN', 'MUHAMMAD JAMIL', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7834', 'Active', 'Active', '', '2019-07-02 08:13:59', '0000-00-00 00:00:00', 1, 0, 1),
(91, 5, 'STD-REG-Y19-91', 'DUA FATIMA', 'SAIF-ULLAH', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1030', 'Active', 'Active', '', '2019-07-02 08:14:15', '0000-00-00 00:00:00', 1, 0, 1),
(92, 5, 'STD-REG-Y19-92', 'ABIHA FATIMA', 'MAQBOOL AHMAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5434', 'Active', 'Active', '', '2019-07-02 08:14:29', '0000-00-00 00:00:00', 1, 0, 1),
(93, 5, 'STD-REG-Y19-93', 'MUHAMMAD UBAID ULLAH ASIF', 'MUHAMMAD ASIF', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1799', 'Active', 'Active', '', '2019-07-02 08:14:36', '0000-00-00 00:00:00', 1, 0, 1),
(95, 5, 'STD-REG-Y19-95', 'MUHAMMAD ABDULLAH KAMRAN', 'MUHAMMD KAMRAN ASLAM', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7874', 'Active', 'Active', '', '2019-07-02 08:14:47', '0000-00-00 00:00:00', 1, 0, 1),
(96, 5, 'STD-REG-Y19-96', 'MUHAMMAD ABDULLAH BIN JUNAID', 'JUNAID KHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8827', 'Active', 'Active', '', '2019-07-02 08:14:54', '0000-00-00 00:00:00', 1, 0, 1),
(97, 5, 'STD-REG-Y19-97', 'JERALD YOUSAF', 'YOUSAF LAUZARS', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', 'CHRISTIAN', '', '', '', '0000-00-00', '3552', 'Active', 'Active', '', '2019-07-02 08:15:03', '0000-00-00 00:00:00', 1, 0, 1),
(98, 5, 'STD-REG-Y19-98', 'ABEEHA TANVEER', 'TANVEER HUSSAIN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8464', 'Active', 'Active', '', '2019-07-02 08:15:14', '0000-00-00 00:00:00', 1, 0, 1),
(99, 5, 'STD-REG-Y19-99', 'AFEERA HASSAN', 'HASSAN IJAZ', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1958', 'Active', 'Active', '', '2019-07-02 08:15:22', '0000-00-00 00:00:00', 1, 0, 1),
(100, 5, 'STD-REG-Y19-100', 'MUHAMMAD FURKAAN', 'MUHAMMAD JAVAID', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5965', 'Active', 'Active', '', '2019-07-02 08:15:31', '0000-00-00 00:00:00', 1, 0, 1),
(101, 5, 'STD-REG-Y19-101', 'MOHAMMAD ABUBAKAR SIDDIQUE', 'MOHAMMAD BILAL SIDDIQUE', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9117', 'Active', 'Active', '', '2019-07-02 08:15:39', '0000-00-00 00:00:00', 1, 0, 1),
(102, 5, 'STD-REG-Y19-102', 'AIZA FATIMA', 'ASIM SHAHZAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9175', 'Active', 'Active', '', '2019-07-02 08:15:46', '0000-00-00 00:00:00', 1, 0, 1),
(103, 5, 'STD-REG-Y19-103', 'MUHAMMAD AHMED', 'SOHAIL MEHMOOD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7548', 'Active', 'Active', '', '2019-07-02 08:15:54', '0000-00-00 00:00:00', 1, 0, 1),
(104, 5, 'STD-REG-Y19-104', 'MUHAMMAD ABDULLAH', 'RASHEED AHMED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '4015', 'Active', 'Active', '', '2019-07-02 08:16:02', '0000-00-00 00:00:00', 1, 0, 1),
(105, 5, 'STD-REG-Y19-105', 'JAVERIA RASHEED', 'RASHEED AHMED', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8833', 'Active', 'Active', '', '2019-07-02 08:16:11', '0000-00-00 00:00:00', 1, 0, 1),
(106, 5, 'STD-REG-Y19-106', 'ADEEL RIAZ', 'RIAZ AHMAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5393', 'Active', 'Active', '', '2019-07-02 08:16:19', '0000-00-00 00:00:00', 1, 0, 1),
(107, 5, 'STD-REG-Y19-107', 'EMAN BALOUCH', 'IRFAN GULL', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5416', 'Active', 'Active', '', '2019-07-02 08:16:41', '0000-00-00 00:00:00', 1, 0, 1),
(109, 5, 'STD-REG-Y19-109', 'SAFA SAJID', 'MUHAMMAD SAJID SHABIR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6006', 'Active', 'Active', '', '2019-07-02 08:16:52', '0000-00-00 00:00:00', 1, 0, 1),
(110, 5, 'STD-REG-Y19-110', 'SYEDA UMME HANI', 'SYED MUHMMAD ALI REHAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5993', 'Active', 'Active', '', '2019-07-02 08:17:40', '0000-00-00 00:00:00', 1, 0, 1),
(111, 5, 'STD-REG-Y19-111', 'MUHAMMAD MUSTAFA SHAH', 'SYED IJAZ HUSSAIN SHAH', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3537', 'Active', 'Active', '', '2019-07-02 08:17:47', '0000-00-00 00:00:00', 1, 0, 1),
(112, 5, 'STD-REG-Y19-112', 'ABDULLAH TARIQ', 'TARIQ MAQSOOD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2130', 'Active', 'Active', '', '2019-07-02 08:17:55', '0000-00-00 00:00:00', 1, 0, 1),
(113, 5, 'STD-REG-Y19-113', 'MAHNOOR HUSSAIN', 'MUHAMMAD HUSSAIN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7763', 'Active', 'Active', '', '2019-07-02 08:18:06', '2019-06-21 12:53:06', 1, 1, 1),
(114, 5, 'STD-REG-Y19-114', 'YORIM LAAZER', 'LAAZER', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', 'CHRISTIAN', '', '', '', '0000-00-00', '7870', 'Active', 'Active', '', '2019-07-02 08:18:13', '2019-06-21 12:53:52', 1, 1, 1),
(115, 5, 'STD-REG-Y19-115', 'SAIMA', 'YAR MUHAMMAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1263', 'Active', 'Active', '', '2019-07-02 08:18:21', '0000-00-00 00:00:00', 1, 0, 1),
(116, 5, 'STD-REG-Y19-116', 'MAHNOOR FATIMA', 'MUHAMMAD ALTAF', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8177', 'Active', 'Active', '', '2019-07-02 08:18:28', '0000-00-00 00:00:00', 1, 0, 1),
(117, 5, 'STD-REG-Y19-117', 'AYESHA TABSSUM', 'RAEES KHADIM HUSSAIN TABSSUM', '', NULL, 'F', 'VILLAGE SULTAN PUR RYK', 'VILLAGE SULTAN PUR RYK', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3270', 'Active', 'Active', '', '2019-07-02 08:18:36', '0000-00-00 00:00:00', 1, 0, 1),
(119, 5, 'STD-REG-Y19-119', 'HIBNA SHAKEEL', 'SHAKEEL', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1662', 'Active', 'Active', '', '2019-07-02 08:18:43', '0000-00-00 00:00:00', 1, 0, 1),
(120, 5, 'STD-REG-Y19-120', 'AROOBA ARSHAD', 'MUHAMMAD ARSHAD HUSSAIN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6455', 'Active', 'Active', '', '2019-07-02 08:18:50', '2019-06-21 12:54:13', 1, 1, 1),
(121, 5, 'STD-REG-Y19-121', 'MUHAMMAD SULAIMAN', 'ABDUL HAMEED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '4991', 'Active', 'Active', '', '2019-07-02 08:19:00', '2019-06-21 12:02:31', 1, 1, 1),
(123, 5, 'STD-REG-Y19-123', 'YUSRA BATOOL', 'SHEIKH JAMEEL AHMAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3298', 'Active', 'Active', '', '2019-07-02 08:19:14', '0000-00-00 00:00:00', 1, 0, 1),
(126, 5, 'STD-REG-Y19-126', 'ALIZA FATIMA', 'M.HAFEEZ', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2913', 'Active', 'Active', '', '2019-07-02 08:19:20', '2019-06-21 12:55:51', 1, 1, 1),
(127, 5, 'STD-REG-Y19-127', 'M.ALI ATHER', 'ATHER AMEEN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8375', 'Active', 'Active', '', '2019-07-02 08:19:28', '2019-06-21 12:56:08', 1, 1, 1),
(128, 5, 'STD-REG-Y19-128', 'NOOR UL AIN', 'MUHAMMAD TOUFEEQ SALEEMI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6272', 'Active', 'Active', '', '2019-07-02 08:19:41', '2019-06-21 12:57:06', 1, 1, 1),
(129, 5, 'STD-REG-Y19-129', 'HIBA IMRAN', 'IMRAN MEHMOOD QADARI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1572', 'Active', 'Active', '', '2019-07-02 08:19:53', '2019-06-21 12:56:21', 1, 1, 1),
(130, 5, 'STD-REG-Y19-130', 'MUHAMMAD AYAN', 'RIAZ AHMED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9991', 'Active', 'Active', '', '2019-07-02 08:20:01', '0000-00-00 00:00:00', 1, 0, 1),
(131, 5, 'STD-REG-Y19-131', 'MUHAMMAD SUBHAN', 'MUHAMMAD KAMRAN SHAHZAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9672', 'Active', 'Active', '', '2019-07-02 08:20:09', '2019-06-21 12:56:36', 1, 1, 1),
(132, 5, 'STD-REG-Y19-132', 'FATIMA KHALID', 'KHALID JAEVD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6796', 'Active', 'Active', '', '2019-07-02 08:20:16', '0000-00-00 00:00:00', 1, 0, 1),
(133, 5, 'STD-REG-Y19-133', 'UZAIR  UR REHMAN', 'FAISAL REHMAN (LATE)', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '4222', 'Active', 'Active', '', '2019-07-02 08:20:24', '2019-06-21 12:56:51', 1, 1, 1),
(134, 5, 'STD-REG-Y19-134', 'MUHAMMAD TAYYAB', 'MUHAMMAD SHERAZ MAQBOOL', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5237', 'Active', 'Active', '', '2019-07-02 08:20:34', '2019-06-21 12:57:30', 1, 1, 1),
(135, 5, 'STD-REG-Y19-135', 'WARISHA IMRAN', 'IMRAN-UL-HAQ', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1648', 'Active', 'Active', '', '2019-07-02 08:20:41', '2019-06-21 12:57:47', 1, 1, 1),
(136, 5, 'STD-REG-Y19-136', 'SYED FURQAN ALI BUKHARI', 'SYED ASIM BUKHARI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7753', 'Active', 'Active', '', '2019-07-02 08:20:49', '0000-00-00 00:00:00', 1, 0, 1),
(137, 5, 'STD-REG-Y19-137', 'MUHAMMAD ASAD', 'MUHAMMAD ALTAF', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6528', 'Active', 'Active', '', '2019-07-02 08:20:58', '2019-06-21 12:58:01', 1, 1, 1),
(138, 5, 'STD-REG-Y19-138', 'ABDULLAH MUSTAFA', 'GHULAM MUSTAFA', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7745', 'Active', 'Active', '', '2019-07-02 08:21:05', '0000-00-00 00:00:00', 1, 0, 1),
(141, 5, 'STD-REG-Y19-141', 'M.ZOHAIB', 'FARMAN ALI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3857', 'Active', 'Active', '', '2019-07-02 08:21:13', '0000-00-00 00:00:00', 1, 0, 1),
(142, 5, 'STD-REG-Y19-142', 'MUHAMMAD HUSNAIN', 'EJAZ MOHY U DIN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5979', 'Active', 'Active', '', '2019-07-02 08:21:23', '0000-00-00 00:00:00', 1, 0, 1),
(143, 5, 'STD-REG-Y19-143', 'ZAINAB FATIMA', 'MUHAMMAD IMTIAZ', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '4752', 'Active', 'Active', '', '2019-07-02 08:21:42', '2019-06-21 12:58:14', 1, 1, 1),
(144, 5, 'STD-REG-Y19-144', 'MUNIBA BHATTI', 'NASIR NAVEED BHATTI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9184', 'Active', 'Active', '', '2019-07-02 08:21:50', '2019-06-21 12:47:00', 1, 1, 1),
(145, 5, 'STD-REG-Y19-145', 'HUSSAIN KHALID', 'A', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5216', 'Active', 'Active', '', '2019-07-02 08:22:07', '2019-06-21 12:58:26', 1, 1, 1),
(147, 5, 'STD-REG-Y19-147', 'MUHAMMAD FAHAD', 'A', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '4582', 'Active', 'Active', '', '2019-07-02 08:22:23', '2019-06-21 12:58:39', 1, 1, 1),
(148, 5, 'STD-REG-Y19-148', 'MICAH ZAHID', 'ZAHID MEHMOOD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', 'CHRISTIAN', '', '', '', '0000-00-00', '7969', 'Active', 'Active', '', '2019-07-02 08:22:39', '0000-00-00 00:00:00', 1, 0, 1),
(149, 5, 'STD-REG-Y19-149', 'FURQAN ALI ', 'MUHAMMAD ZEESHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5635', 'Active', 'Active', '', '2019-07-02 08:22:46', '0000-00-00 00:00:00', 1, 0, 1),
(150, 5, 'STD-REG-Y19-150', 'ABDUL MANAN', 'M ZEESHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', 'Islam', '', '', '', '0000-00-00', '1927', 'Active', 'Active', '', '2019-07-02 08:22:54', '0000-00-00 00:00:00', 1, 0, 1),
(151, 5, 'STD-REG-Y19-151', 'SAMAN IRFAN', 'MUHAMMAD IRFAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6111', 'Active', 'Active', '', '2019-07-02 08:23:01', '0000-00-00 00:00:00', 1, 0, 1),
(152, 5, 'STD-REG-Y19-152', 'HASAAN SHAHID', 'RAO SHAHID IQBAL', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5216', 'Active', 'Active', '', '2019-07-02 08:23:08', '0000-00-00 00:00:00', 1, 0, 1),
(153, 5, 'STD-REG-Y19-153', 'TAHA NAVEED', 'RAO NAVEED AKHTAR', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '4536', 'Active', 'Active', '', '2019-07-02 08:23:17', '0000-00-00 00:00:00', 1, 0, 1),
(154, 5, 'STD-REG-Y19-154', 'KHIZAR ABDULLAH WAQAR', 'WAQAR ZAFAR', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3668', 'Active', 'Active', '', '2019-07-02 08:23:32', '0000-00-00 00:00:00', 1, 0, 1),
(155, 5, 'STD-REG-Y19-155', 'KHADIJA-TUL-KUBRA NAVEED', 'NAVEED ZAFAR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', 'Islam', '', '', '', '0000-00-00', '3987', 'Active', 'Active', '', '2019-07-02 08:23:38', '0000-00-00 00:00:00', 1, 0, 1),
(156, 5, 'STD-REG-Y19-156', 'HAZA SOHAIL', 'SOHAIL MEHMOOD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9945', 'Active', 'Active', '', '2019-07-02 08:23:47', '0000-00-00 00:00:00', 1, 0, 1),
(157, 5, 'STD-REG-Y19-157', 'MUNTAHA KAMRAN', 'WAHID KAMRAN KHAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '4404', 'Active', 'Active', '', '2019-07-02 08:23:55', '0000-00-00 00:00:00', 1, 0, 1),
(158, 5, 'STD-REG-Y19-158', 'REYAN MUDASSIR', 'MUDASSAR HUSSAIN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '4685', 'Active', 'Active', '', '2019-07-02 08:24:13', '0000-00-00 00:00:00', 1, 0, 1),
(159, 5, 'STD-REG-Y19-159', 'MUHAMMAD HAMZA', 'MUHAMMAD ARSHAD GHAFOOR', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6063', 'Active', 'Active', '', '2019-07-02 08:24:29', '0000-00-00 00:00:00', 1, 0, 1),
(160, 5, 'STD-REG-Y19-160', 'TALHA SAGHEER', 'SAGHEER AHMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2315', 'Active', 'Active', '', '2019-07-02 08:24:37', '0000-00-00 00:00:00', 1, 0, 1),
(161, 5, 'STD-REG-Y19-161', 'MUHAMMAD ALIYAN', 'ALI ABBAS', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9363', 'Active', 'Active', '', '2019-07-02 08:24:43', '0000-00-00 00:00:00', 1, 0, 1),
(162, 5, 'STD-REG-Y19-162', 'MAHNOOR NADEEM', 'MUHAMMAD NADEEM', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1538', 'Active', 'Active', '', '2019-07-02 08:24:49', '0000-00-00 00:00:00', 1, 0, 1),
(163, 5, 'STD-REG-Y19-163', 'FARMAN ALI KHAN', 'FAYAZ AHMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2548', 'Active', 'Active', '', '2019-07-02 08:24:55', '0000-00-00 00:00:00', 1, 0, 1),
(164, 5, 'STD-REG-Y19-164', 'ZAINAB ALI', 'AFZAAL AHMAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2873', 'Active', 'Active', '', '2019-07-02 08:25:02', '0000-00-00 00:00:00', 1, 0, 1),
(165, 5, 'STD-REG-Y19-165', 'MUHAMMAD HUMAIN ISLAM', 'MUHAMMAD ISLAM ZAHID', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2154', 'Active', 'Active', '', '2019-07-02 08:25:11', '0000-00-00 00:00:00', 1, 0, 1),
(166, 5, 'STD-REG-Y19-166', 'HANIYA KHALID', 'MUHAMMAD KHALID ISLAM', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6723', 'Active', 'Active', '', '2019-07-02 08:25:35', '0000-00-00 00:00:00', 1, 0, 1),
(167, 5, 'STD-REG-Y19-167', 'MINAHIL KHALID', 'KHALID MEHMOOD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2723', 'Active', 'Active', '', '2019-07-02 08:25:41', '0000-00-00 00:00:00', 1, 0, 1),
(168, 5, 'STD-REG-Y19-168', 'ABDUL REHMAN', 'RANA TAHIR NAVEED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', 'Islam', '', '', '', '0000-00-00', '7346', 'Active', 'Active', '', '2019-07-02 08:25:50', '0000-00-00 00:00:00', 1, 0, 1),
(169, 5, 'STD-REG-Y19-169', 'ALIZAY KAMRAN', 'MUHAMMAD KAMRAN ASLAM', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9653', 'Active', 'Active', '', '2019-07-02 08:25:57', '0000-00-00 00:00:00', 1, 0, 1),
(170, 5, 'STD-REG-Y19-170', 'MUHAMMAD AHMAD', 'ABDUL RASHEED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6363', 'Active', 'Active', '', '2019-07-02 08:26:03', '2019-06-22 05:40:33', 1, 1, 1),
(171, 5, 'STD-REG-Y19-171', 'AROOSA FAYYAZ', 'FAYYAZ HUSSAIN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7400', 'Active', 'Active', '', '2019-07-02 08:26:10', '0000-00-00 00:00:00', 1, 0, 1),
(172, 5, 'STD-REG-Y19-172', 'ARTAZA JAMIL', 'JAMIL AHMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2614', 'Active', 'Active', '', '2019-07-02 08:26:19', '0000-00-00 00:00:00', 1, 0, 1),
(173, 5, 'STD-REG-Y19-173', 'YASIR ALI', 'GHULAM YASEEN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7763', 'Active', 'Active', '', '2019-07-02 08:26:25', '2019-06-22 05:44:39', 1, 1, 1),
(174, 5, 'STD-REG-Y19-174', 'ZAINAB BHATTI', 'NASIR NAVEED BHATTI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8303', 'Active', 'Active', '', '2019-07-02 08:26:32', '0000-00-00 00:00:00', 1, 0, 1),
(175, 5, 'STD-REG-Y19-175', 'WAFA FATIMA', 'A', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5630', 'Active', 'Active', '', '2019-07-02 08:26:39', '0000-00-00 00:00:00', 1, 0, 1),
(180, 5, 'STD-REG-Y19-180', 'HAFSA TARIQ', 'TARIQ  MAQSOOD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3589', 'Active', 'Active', '', '2019-07-02 08:26:47', '0000-00-00 00:00:00', 1, 0, 1),
(181, 5, 'STD-REG-Y19-181', 'MUHAMMAD TALHA', 'SAJID ALI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5721', 'Active', 'Active', '', '2019-07-02 08:26:54', '0000-00-00 00:00:00', 1, 0, 1),
(182, 5, 'STD-REG-Y19-182', 'AMNA TABASSUM', 'MUHAMMAD ASGHAR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8996', 'Active', 'Active', '', '2019-07-02 08:27:01', '0000-00-00 00:00:00', 1, 0, 1),
(183, 5, 'STD-REG-Y19-183', 'SHIFA MADNI', 'MUHAMMAD MADNI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3788', 'Active', 'Active', '', '2019-07-02 08:27:16', '0000-00-00 00:00:00', 1, 0, 1),
(184, 5, 'STD-REG-Y19-184', 'FURQAN MUDASSIR', 'MUDASSAR HUSSAIN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7275', 'Active', 'Active', '', '2019-07-02 08:27:25', '0000-00-00 00:00:00', 1, 0, 1),
(185, 5, 'STD-REG-Y19-185', 'SADIA ARSHAD', 'MUHAMMAD ARSHAD GHAFOOR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1635', 'Active', 'Active', '', '2019-07-02 08:27:36', '0000-00-00 00:00:00', 1, 0, 1),
(186, 5, 'STD-REG-Y19-186', 'AMMAR UL HASSAN', 'IFTAKHAR UL HASSAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7187', 'Active', 'Active', '', '2019-07-02 08:27:46', '0000-00-00 00:00:00', 1, 0, 1),
(187, 5, 'STD-REG-Y19-187', 'HAFSA SAGHEER', 'SAGEER AHMAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8634', 'Active', 'Active', '', '2019-07-02 08:27:54', '0000-00-00 00:00:00', 1, 0, 1),
(188, 5, 'STD-REG-Y19-188', 'RIMSHA AHMED', 'MUHAMMAD JAVEED', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3287', 'Active', 'Active', '', '2019-07-02 08:28:04', '0000-00-00 00:00:00', 1, 0, 1),
(189, 5, 'STD-REG-Y19-189', 'ALISHA ALI', 'ALI ABBAS', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8625', 'Active', 'Active', '', '2019-07-02 08:28:11', '0000-00-00 00:00:00', 1, 0, 1),
(190, 5, 'STD-REG-Y19-190', 'MUHAMMAD SAAD ATA', 'MUHAMMAD RIZWAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5760', 'Active', 'Active', '', '2019-07-02 08:28:17', '0000-00-00 00:00:00', 1, 0, 1),
(191, 5, 'STD-REG-Y19-191', 'MOHAMMAD HANNAN', 'GHULAM DASTGEER', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6225', 'Active', 'Active', '', '2019-07-02 08:28:23', '0000-00-00 00:00:00', 1, 0, 1),
(192, 5, 'STD-REG-Y19-192', 'MUHAMMAD KHIZAR EJAZ', 'EJAZ ALI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5392', 'Active', 'Active', '', '2019-07-02 08:28:30', '0000-00-00 00:00:00', 1, 0, 1),
(193, 5, 'STD-REG-Y19-193', 'ATIQA KHAN', 'ZEESHAN KHAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1351', 'Active', 'Active', '', '2019-07-02 08:28:37', '0000-00-00 00:00:00', 1, 0, 1),
(194, 5, 'STD-REG-Y19-194', 'MUHAMMAD FARHAN TANVEER', 'NAUMAN AHMAD KHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7968', 'Active', 'Active', '', '2019-07-02 08:28:44', '0000-00-00 00:00:00', 1, 0, 1),
(195, 5, 'STD-REG-Y19-195', 'MUHAMMAD MOSA SHAH', 'MUHAMMAD EJAZ SHAH', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6133', 'Active', 'Active', '', '2019-07-02 08:28:50', '0000-00-00 00:00:00', 1, 0, 1),
(196, 5, 'STD-REG-Y19-196', 'ABU BAKAR GHAURI', 'FAHEEM GHAURI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1787', 'Active', 'Active', '', '2019-07-02 08:28:57', '2019-06-22 06:29:53', 1, 1, 1),
(197, 5, 'STD-REG-Y19-197', 'MEERAB ISLAM', 'ISLAM-UL-HAQ', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2197', 'Active', 'Active', '', '2019-07-02 08:29:06', '0000-00-00 00:00:00', 1, 0, 1),
(199, 5, 'STD-REG-Y19-199', 'HURIA', 'IFTAKHAR AHMAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7323', 'Active', 'Active', '', '2019-07-02 08:29:14', '0000-00-00 00:00:00', 1, 0, 1),
(200, 5, 'STD-REG-Y19-200', 'AYESHA RAFIQ', 'MUHAMMAD RAFIQ', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8778', 'Active', 'Active', '', '2019-07-02 08:29:28', '0000-00-00 00:00:00', 1, 0, 1),
(201, 5, 'STD-REG-Y19-201', 'MARRIAM FATIMA', 'MUHAMMAD IMRAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5970', 'Active', 'Active', '', '2019-07-02 08:29:37', '0000-00-00 00:00:00', 1, 0, 1),
(202, 5, 'STD-REG-Y19-202', 'MUHAMMAD FAIZAN ALTAF', 'MUHAMMAD ALTAF AHMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2159', 'Active', 'Active', '', '2019-07-02 08:29:42', '0000-00-00 00:00:00', 1, 0, 1),
(203, 5, 'STD-REG-Y19-203', 'SABOOR-UR-REHMAN', 'ANWAR-UR-REHMAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7647', 'Active', 'Active', '', '2019-07-02 08:29:49', '2019-06-22 06:48:00', 1, 1, 1),
(204, 5, 'STD-REG-Y19-204', 'ABDULLAH', 'GULAM MUSTAFA', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9348', 'Active', 'Active', '', '2019-07-02 08:29:55', '0000-00-00 00:00:00', 1, 0, 1),
(205, 5, 'STD-REG-Y19-205', 'ALI ASGHAR', 'MUHAMMAD ARSHAD HUSSAIN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3707', 'Active', 'Active', '', '2019-07-02 08:30:02', '0000-00-00 00:00:00', 1, 0, 1),
(206, 5, 'STD-REG-Y19-206', 'MUHAMMAD ANUS WAQAS', 'WAQAS ALI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8439', 'Active', 'Active', '', '2019-07-02 08:30:08', '0000-00-00 00:00:00', 1, 0, 1),
(207, 5, 'STD-REG-Y19-207', 'MUHAMMAD ARHAM SHEHZAD', 'SHEHZAD AHMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3507', 'Active', 'Active', '', '2019-07-02 08:30:15', '0000-00-00 00:00:00', 1, 0, 1),
(209, 5, 'STD-REG-Y19-209', 'MUHAMMAD SALMAN', 'ABDUL BASIT', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9516', 'Active', 'Active', '', '2019-07-02 08:30:23', '0000-00-00 00:00:00', 1, 0, 1),
(210, 5, 'STD-REG-Y19-210', 'ALI SHER', 'ZAHOOR AHMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7673', 'Active', 'Active', '', '2019-07-02 08:30:31', '0000-00-00 00:00:00', 1, 0, 1),
(211, 5, 'STD-REG-Y19-211', 'MUHAMMAD ISMIL', 'LIAQUAT ALI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2678', 'Active', 'Active', '', '2019-07-02 08:30:39', '0000-00-00 00:00:00', 1, 0, 1),
(212, 5, 'STD-REG-Y19-212', 'ISBAH ARSHAD', 'MOHAMMAD ARSHAD KHAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7185', 'Active', 'Active', '', '2019-07-02 08:30:46', '0000-00-00 00:00:00', 1, 0, 1),
(213, 5, 'STD-REG-Y19-213', 'MUHAMMAD  USMAN', 'M. RIZWAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9389', 'Active', 'Active', '', '2019-07-02 08:30:53', '0000-00-00 00:00:00', 1, 0, 1),
(214, 5, 'STD-REG-Y19-214', 'RAZA HUSSAIN', 'MUHAMMAD SAHFIQ SALEEMI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2129', 'Active', 'Active', '', '2019-07-02 08:31:00', '0000-00-00 00:00:00', 1, 0, 1),
(215, 5, 'STD-REG-Y19-215', 'HAFSA MAIRAJ', 'MUHAMMAD MAIRAJ-UD-DIN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '1230', 'Active', 'Active', '', '2019-07-02 08:31:07', '0000-00-00 00:00:00', 1, 0, 1),
(216, 5, 'STD-REG-Y19-216', 'AMANA TAHIR', 'TAHIR MEHMOOD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6489', 'Active', 'Active', '', '2019-07-02 08:31:13', '0000-00-00 00:00:00', 1, 0, 1),
(217, 5, 'STD-REG-Y19-217', 'ZIRWA ASHRAF', 'MUHAMMAD ASHRAF NIAZ', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9746', 'Active', 'Active', '', '2019-07-02 08:31:28', '0000-00-00 00:00:00', 1, 0, 1),
(218, 5, 'STD-REG-Y19-218', 'M TAHA AJMAL', 'M AJMAL KHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8056', 'Active', 'Active', '', '2019-07-02 08:31:33', '0000-00-00 00:00:00', 1, 0, 1),
(219, 5, 'STD-REG-Y19-219', 'RAHEEL RIAZ', 'M RIAZ', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7828', 'Active', 'Active', '', '2019-07-02 08:31:39', '0000-00-00 00:00:00', 1, 0, 1),
(220, 5, 'STD-REG-Y19-220', 'MUHAMMAD FAZAL', 'ADIL MEHMOOD CHISTI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '6001', 'Active', 'Active', '', '2019-07-02 08:31:45', '0000-00-00 00:00:00', 1, 0, 1),
(221, 5, 'STD-REG-Y19-221', 'ALI MEHDI', 'EJAZ MEHMOOD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2774', 'Active', 'Active', '', '2019-07-02 08:31:54', '0000-00-00 00:00:00', 1, 0, 1),
(222, 5, 'STD-REG-Y19-222', 'ZARYAB ZAHID', 'ZAHID MANWAR', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3543', 'Active', 'Active', '', '2019-07-02 08:32:01', '0000-00-00 00:00:00', 1, 0, 1),
(223, 5, 'STD-REG-Y19-223', 'AHMAD ALI TABASSUM', 'MUHAMMAD ASGHAR', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '9112', 'Active', 'Active', '', '2019-07-02 08:32:07', '0000-00-00 00:00:00', 1, 0, 1),
(224, 5, 'STD-REG-Y19-224', 'RAEES LAKHAN TABASSUM', 'RAEES KHADIM HUSSAIN TABASSUM', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3738', 'Active', 'Active', '', '2019-07-02 08:32:14', '0000-00-00 00:00:00', 1, 0, 1),
(225, 5, 'STD-REG-Y19-225', 'AYESHA NAVEED', 'RANA TAHIR NAVEED', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5357', 'Active', 'Active', '', '2019-07-02 08:32:21', '0000-00-00 00:00:00', 1, 0, 1),
(226, 5, 'STD-REG-Y19-226', 'SAAD NADEEM', 'NADEEM SAJID', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3471', 'Active', 'Active', '', '2019-07-02 08:32:26', '0000-00-00 00:00:00', 1, 0, 1),
(227, 5, 'STD-REG-Y19-227', 'KHALIL UR REHMAN', 'NOOR AHMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2574', 'Active', 'Active', '', '2019-07-02 08:32:33', '0000-00-00 00:00:00', 1, 0, 1),
(229, 5, 'STD-REG-Y19-229', 'SYEDA MAHAM FATIMA BUKHARI', 'SAYED BILAL  BUKHARI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7300', 'Active', 'Active', '', '2019-07-02 08:32:42', '0000-00-00 00:00:00', 1, 0, 1),
(230, 5, 'STD-REG-Y19-230', 'HUSSAIN AHMAD KHAN', 'MUHAMMAD AHMED SAIF KHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2815', 'Active', 'Active', '', '2019-07-02 08:32:50', '0000-00-00 00:00:00', 1, 0, 1),
(231, 5, 'STD-REG-Y19-231', 'MUHAMMAD MUJEEB IQBAL', 'MUHAMMAD IQBAL ZAHID', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7943', 'Active', 'Active', '', '2019-07-02 08:32:57', '0000-00-00 00:00:00', 1, 0, 1),
(232, 5, 'STD-REG-Y19-232', 'SUMBAL ATHER', 'ATHER AMEEN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5215', 'Active', 'Active', '', '2019-07-02 08:33:30', '0000-00-00 00:00:00', 1, 0, 1),
(233, 5, 'STD-REG-Y19-233', 'MUHAMMAD MUNEEB', 'AAMIR TOFAL', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7085', 'Active', 'Active', '', '2019-07-02 08:33:36', '0000-00-00 00:00:00', 1, 0, 1),
(234, 5, 'STD-REG-Y19-234', 'LAZEEN AHMAD', 'AHMED ALI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5774', 'Active', 'Active', '', '2019-07-02 08:33:56', '0000-00-00 00:00:00', 1, 0, 1),
(235, 5, 'STD-REG-Y19-235', 'OKBA KHAN', 'M. NADEEM KHAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '7599', 'Active', 'Active', '', '2019-07-02 08:34:04', '0000-00-00 00:00:00', 1, 0, 1),
(236, 5, 'STD-REG-Y19-236', 'MUHAMMAD ABDULLAH', 'MUHAMMAD SHRIF KHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '5676', 'Active', 'Active', '', '2019-07-02 08:34:10', '0000-00-00 00:00:00', 1, 0, 1),
(237, 5, 'STD-REG-Y19-237', 'MANAN RAO', 'RAO NAVEED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '4217', 'Active', 'Active', '', '2019-07-02 08:34:17', '0000-00-00 00:00:00', 1, 0, 1),
(238, 5, 'STD-REG-Y19-238', 'MUHAMMAD FAISAL', 'MUHAMMAD ASIF SHEIKH', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2205', 'Active', 'Active', '', '2019-07-02 08:34:24', '0000-00-00 00:00:00', 1, 0, 1);
INSERT INTO `std_personal_info` (`std_id`, `branch_id`, `std_reg_no`, `std_name`, `std_father_name`, `std_contact_no`, `std_DOB`, `std_gender`, `std_permanent_address`, `std_temporary_address`, `std_email`, `std_photo`, `std_b_form`, `std_district`, `std_religion`, `std_nationality`, `std_tehseel`, `std_cast`, `admission_date`, `std_password`, `status`, `academic_status`, `barcode`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(239, 5, 'STD-REG-Y19-239', 'ZONISH SOHAIL', 'SOHAIL MEHMOOD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8714', 'Active', 'Active', '', '2019-07-02 08:34:30', '0000-00-00 00:00:00', 1, 0, 1),
(240, 5, 'STD-REG-Y19-240', 'ZOHA ANWAR', 'MUHAMMAD ANWAR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '3760', 'Active', 'Active', '', '2019-07-02 08:34:37', '0000-00-00 00:00:00', 1, 0, 1),
(241, 5, 'STD-REG-Y19-241', 'HAJJAN FATIMA HAMEED', 'RAO ABDUL HAMEED', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '2417', 'Active', 'Active', '', '2019-07-02 08:34:43', '0000-00-00 00:00:00', 1, 0, 1),
(242, 5, 'STD-REG-Y19-242', 'MUHAMMAD AHMAD', 'MUHAMMAD ALI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '0000-00-00', '8894', 'Active', 'Active', '', '2019-07-02 08:34:50', '0000-00-00 00:00:00', 1, 0, 1),
(243, 5, 'STD-REG-Y19-243', 'ZOHA SOHAIL', 'SOHAIL MEHMOOD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', 'N/A', '2015-03-10', '2937', 'Active', 'Active', '', '2019-07-02 08:34:56', '0000-00-00 00:00:00', 1, 0, 1),
(244, 5, 'STD-REG-Y19-244', 'RAEES UBAID ULLAH TABASSUM', 'RAEES KHADIM HUSSAIN TABASSUM', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', 'Raees', '2016-02-16', '7706', 'Active', 'Active', '', '2019-07-02 08:35:03', '0000-00-00 00:00:00', 1, 0, 1),
(245, 5, 'STD-REG-Y19-245', 'MAHNOOR RIAZ', 'RIAZ AHMED', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '2017-03-24', '5932', 'Active', 'Active', '', '2019-07-02 08:35:11', '0000-00-00 00:00:00', 1, 0, 1),
(246, 5, 'STD-REG-Y19-246', 'KHADIJA NAVEED', 'RANA TAHIR NAVEED', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '2017-04-04', '8725', 'Active', 'Active', '', '2019-07-02 08:35:18', '0000-00-00 00:00:00', 1, 0, 1),
(247, 5, 'STD-REG-Y19-247', 'SAMAR ABBASI', 'QAMAR ABBASI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '2018-08-31', '7216', 'Active', 'Active', '', '2019-07-02 08:35:24', '0000-00-00 00:00:00', 1, 0, 1),
(248, 5, 'STD-REG-Y19-248', 'FALAK SHER', 'ZAHOOR AHMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '2019-03-11', '9480', 'Active', 'Active', '', '2019-07-02 08:35:30', '0000-00-00 00:00:00', 1, 0, 1),
(249, 5, 'STD-REG-Y19-249', 'MUHAMMAD USMAN', 'ABDUL WAHEED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', '2012-04-14', '1320', 'Active', 'Active', '', '2019-07-02 08:35:55', '0000-00-00 00:00:00', 1, 0, 1),
(250, 5, 'STD-REG-Y19-250', 'HOORIA AHMED', 'MUHAMMAD JAVEED', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1458', 'Active', 'Active', '', '2019-07-02 08:36:09', '0000-00-00 00:00:00', 1, 0, 1),
(251, 5, 'STD-REG-Y19-251', 'MUHAMMAD BILAL KHAN', 'ABDUL BASEER KHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9407', 'Active', 'Active', '', '2019-07-02 08:36:16', '0000-00-00 00:00:00', 1, 0, 1),
(252, 5, 'STD-REG-Y19-252', 'SAMI UL HAQ', 'NAIK MUHAMMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2800', 'Active', 'Active', '', '2019-07-02 08:36:25', '0000-00-00 00:00:00', 1, 0, 1),
(253, 5, 'STD-REG-Y19-253', 'SHIMLAH  KHAN', 'AKBAR HUSSAIN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9216', 'Active', 'Active', '', '2019-07-02 08:36:34', '0000-00-00 00:00:00', 1, 0, 1),
(254, 5, 'STD-REG-Y19-254', 'MUHAMMAD AHMED NADEEM', 'MUHAMMAD NADEEM', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2683', 'Active', 'Active', '', '2019-07-02 08:36:42', '0000-00-00 00:00:00', 1, 0, 1),
(255, 5, 'STD-REG-Y19-255', 'BISMA IFTIKHAR', 'IFTIKHAR UL HASSAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9155', 'Active', 'Active', '', '2019-07-02 08:36:49', '0000-00-00 00:00:00', 1, 0, 1),
(256, 5, 'STD-REG-Y19-256', 'QAISER MAQSOOD', 'RAS MAQSOOD AHMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7009', 'Active', 'Active', '', '2019-07-02 08:36:55', '0000-00-00 00:00:00', 1, 0, 1),
(257, 5, 'STD-REG-Y19-257', 'ABUBAKR  RAYAZ', 'RAYAZ AHMED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9068', 'Active', 'Active', '', '2019-07-02 08:37:02', '0000-00-00 00:00:00', 1, 0, 1),
(258, 5, 'STD-REG-Y19-258', 'MEERAB TARIQ', 'TARIQ MEHMOOD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2423', 'Active', 'Active', '', '2019-07-02 08:37:09', '0000-00-00 00:00:00', 1, 0, 1),
(259, 5, 'STD-REG-Y19-259', 'SAIRA ZEESHAN', 'M ZEESHAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8386', 'Active', 'Active', '', '2019-07-02 08:37:16', '0000-00-00 00:00:00', 1, 0, 1),
(260, 5, 'STD-REG-Y19-260', 'MUHAMMAD AHMAD', 'MUHAMMAD ALI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5265', 'Active', 'Active', '', '2019-07-02 08:37:23', '0000-00-00 00:00:00', 1, 0, 1),
(261, 5, 'STD-REG-Y19-261', 'ATTIA MADNI', 'MUHAMMAD MADNI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2290', 'Active', 'Active', '', '2019-07-02 08:37:30', '0000-00-00 00:00:00', 1, 0, 1),
(262, 5, 'STD-REG-Y19-262', 'AMMARA MADNI', 'MUHAMMAD MADNI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2000', 'Active', 'Active', '', '2019-07-02 08:37:36', '0000-00-00 00:00:00', 1, 0, 1),
(263, 5, 'STD-REG-Y19-263', 'ANAS REHMAN', 'ANWAR-UR-REHMAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7763', 'Active', 'Active', '', '2019-07-02 08:37:42', '0000-00-00 00:00:00', 1, 0, 1),
(264, 5, 'STD-REG-Y19-264', 'ALI AKBAR', 'MUHAMMAD ARSHAD HUSSAIN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1342', 'Active', 'Active', '', '2019-07-02 08:37:49', '0000-00-00 00:00:00', 1, 0, 1),
(265, 5, 'STD-REG-Y19-265', 'MUHAMMAD REHAN ABBASI', 'MUHAMMAD ZAHID', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9218', 'Active', 'Active', '', '2019-07-02 08:37:56', '0000-00-00 00:00:00', 1, 0, 1),
(266, 5, 'STD-REG-Y19-266', 'MUHAMMAD MUDASIR MEHBOB', 'MEHBOB AHMAH', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1468', 'Active', 'Active', '', '2019-07-02 08:38:10', '0000-00-00 00:00:00', 1, 0, 1),
(267, 5, 'STD-REG-Y19-267', 'MUHAMMAD MOHSIN', 'MUHAMMAD ALTAF', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2480', 'Active', 'Active', '', '2019-07-02 08:38:18', '0000-00-00 00:00:00', 1, 0, 1),
(268, 5, 'STD-REG-Y19-268', 'HARIS ALI', 'HAZOOR BAKHSH', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9506', 'Active', 'Active', '', '2019-07-02 08:38:27', '0000-00-00 00:00:00', 1, 0, 1),
(270, 5, 'STD-REG-Y19-270', 'MUHAMMAD AHMAD', 'ABDUL JABBAR ANJUM', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5901', 'Active', 'Active', '', '2019-07-02 08:38:34', '0000-00-00 00:00:00', 1, 0, 1),
(271, 5, 'STD-REG-Y19-271', 'BASIM ABDULLAH WAQAR', 'WAQAR ZAFAR', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4992', 'Active', 'Active', '', '2019-07-02 08:38:41', '0000-00-00 00:00:00', 1, 0, 1),
(272, 5, 'STD-REG-Y19-272', 'MUHAMMAD ABDUR REHMAN KHAN', 'MUHAMMAD SHAHZAD KHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5432', 'Active', 'Active', '', '2019-07-02 08:38:48', '0000-00-00 00:00:00', 1, 0, 1),
(273, 5, 'STD-REG-Y19-273', 'MANAHIL BILAL', 'BILAL HUSSAIN ANSARI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4235', 'Active', 'Active', '', '2019-07-02 08:38:54', '0000-00-00 00:00:00', 1, 0, 1),
(274, 5, 'STD-REG-Y19-274', 'HALEEMA SADIA', 'MUHAMMAD AKHTAR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8836', 'Active', 'Active', '', '2019-07-02 08:39:01', '0000-00-00 00:00:00', 1, 0, 1),
(275, 5, 'STD-REG-Y19-275', 'SYED MARIB EJAZ', 'SYED MUHAMMAD EJAZ', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6396', 'Active', 'Active', '', '2019-07-02 08:39:08', '0000-00-00 00:00:00', 1, 0, 1),
(276, 5, 'STD-REG-Y19-276', 'MUHAMMAD MURTAJIZ', 'MUHAMMAD ASKARI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6039', 'Active', 'Active', '', '2019-07-02 08:39:13', '0000-00-00 00:00:00', 1, 0, 1),
(277, 5, 'STD-REG-Y19-277', 'JALIL MAQSOOD', 'RAS MAQSOOD AHMAD', '', NULL, '', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2223', 'Active', 'Active', '', '2019-07-02 08:39:20', '0000-00-00 00:00:00', 1, 0, 1),
(278, 5, 'STD-REG-Y19-278', 'ANAMTA EJAZ', 'MUHAMMAD EJAZ', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6910', 'Active', 'Active', '', '2019-07-02 08:39:26', '0000-00-00 00:00:00', 1, 0, 1),
(279, 5, 'STD-REG-Y19-279', 'MUHAMMAD TAHA', 'SAJID ALI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9388', 'Active', 'Active', '', '2019-07-02 08:39:35', '0000-00-00 00:00:00', 1, 0, 1),
(280, 5, 'STD-REG-Y19-280', 'MUHAMMAD SAMEER', 'MAIN ABDUL LATIF', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3968', 'Active', 'Active', '', '2019-07-02 08:39:53', '0000-00-00 00:00:00', 1, 0, 1),
(281, 5, 'STD-REG-Y19-281', 'KHADIJA JAMEEL', 'JAMEEL AHMAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6652', 'Active', 'Active', '', '2019-07-02 08:40:01', '0000-00-00 00:00:00', 1, 0, 1),
(282, 5, 'STD-REG-Y19-282', 'NOOR FATIMA', 'ABDUL RASHEED NOOR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7816', 'Active', 'Active', '', '2019-07-02 08:40:08', '0000-00-00 00:00:00', 1, 0, 1),
(283, 5, 'STD-REG-Y19-283', 'ANAS JAMIL', 'JAMIL AHMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3733', 'Active', 'Active', '', '2019-07-02 08:40:15', '0000-00-00 00:00:00', 1, 0, 1),
(284, 5, 'STD-REG-Y19-284', 'FAHAD IMRAN', 'IMRAN ARSHAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9648', 'Active', 'Active', '', '2019-07-02 08:40:22', '0000-00-00 00:00:00', 1, 0, 1),
(285, 5, 'STD-REG-Y19-285', 'SABIR HUSSAIN', 'SAFDAR HUSSAIN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5691', 'Active', 'Active', '', '2019-07-02 08:40:29', '0000-00-00 00:00:00', 1, 0, 1),
(286, 5, 'STD-REG-Y19-286', 'BILAWAL KHAN', 'MUHAMMAD AZEEN KHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6147', 'Active', 'Active', '', '2019-07-02 08:40:37', '0000-00-00 00:00:00', 1, 0, 1),
(287, 5, 'STD-REG-Y19-287', 'NAWAL FATIMA', 'EJAZ MEHMOOD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5121', 'Active', 'Active', '', '2019-07-02 08:41:01', '0000-00-00 00:00:00', 1, 0, 1),
(289, 5, 'STD-REG-Y19-289', 'MUHAMMAD HUSNAIN', 'ABDUL BASEER KHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6396', 'Active', 'Active', '', '2019-07-02 08:41:08', '0000-00-00 00:00:00', 1, 0, 1),
(290, 5, 'STD-REG-Y19-290', 'SYED LAAL MAZHAR BUKHARI', 'SAYED BILAL BUKHARI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3814', 'Active', 'Active', '', '2019-07-02 08:41:15', '0000-00-00 00:00:00', 1, 0, 1),
(291, 5, 'STD-REG-Y19-291', 'MUHAMMAD AHTISHAM QADIR', 'GHULAM QADIR', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5811', 'Active', 'Active', '', '2019-07-02 08:41:21', '0000-00-00 00:00:00', 1, 0, 1),
(292, 5, 'STD-REG-Y19-292', 'MUHAMMAD ASAD', 'ATTA-ULLAH', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5977', 'Active', 'Active', '', '2019-07-02 08:41:28', '0000-00-00 00:00:00', 1, 0, 1),
(293, 5, 'STD-REG-Y19-293', 'SHAN-E-ALI', 'M.ALEEM AKBAR', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3111', 'Active', 'Active', '', '2019-07-02 08:41:35', '0000-00-00 00:00:00', 1, 0, 1),
(294, 5, 'STD-REG-Y19-294', 'BILAL ISMAIL', 'MUHAMMAD ISMAIL', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2277', 'Active', 'Active', '', '2019-07-02 08:41:41', '0000-00-00 00:00:00', 1, 0, 1),
(295, 5, 'STD-REG-Y19-295', 'ATTAQ UR REHMAN', 'AKHTAR ALI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2725', 'Active', 'Active', '', '2019-07-02 08:41:48', '0000-00-00 00:00:00', 1, 0, 1),
(296, 5, 'STD-REG-Y19-296', 'BADAR ABBASI', 'QAMAR ABBASI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8293', 'Active', 'Active', '', '2019-07-02 08:41:56', '0000-00-00 00:00:00', 1, 0, 1),
(297, 5, 'STD-REG-Y19-297', 'ADEEL UR REHMAN', 'HAFEEZ UR REHMAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8455', 'Active', 'Active', '', '2019-07-02 08:43:19', '0000-00-00 00:00:00', 1, 0, 1),
(298, 5, 'STD-REG-Y19-298', 'ZEESHAN IQBAL', 'MUHAMMAD IQBAL', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7433', 'Active', 'Active', '', '2019-07-02 08:43:27', '0000-00-00 00:00:00', 1, 0, 1),
(299, 5, 'STD-REG-Y19-299', 'MUHAMMAD MUNEEB ISRAR', 'MIAN MUHAMMAD ISRAR', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2934', 'Active', 'Active', '', '2019-07-02 08:43:35', '0000-00-00 00:00:00', 1, 0, 1),
(300, 5, 'STD-REG-Y19-300', 'MUHAMMAD TALHA QAYYUM', 'MUHAMMAD ABDUL QAYYUM', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9221', 'Active', 'Active', '', '2019-07-02 08:43:46', '0000-00-00 00:00:00', 1, 0, 1),
(301, 5, 'STD-REG-Y19-301', 'AMAR REHAN', 'RANA REHAN ASHRAF', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8596', 'Active', 'Active', '', '2019-07-02 08:43:53', '0000-00-00 00:00:00', 1, 0, 1),
(302, 5, 'STD-REG-Y19-302', 'ALI REHAN', 'RANA REHAN ASHRAF', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5867', 'Active', 'Active', '', '2019-07-02 08:44:01', '0000-00-00 00:00:00', 1, 0, 1),
(303, 5, 'STD-REG-Y19-303', 'MUHAMMAD ABU BAKAR BHATTI', 'SAIMA SHAHEEN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9755', 'Active', 'Active', '', '2019-07-02 08:44:08', '0000-00-00 00:00:00', 1, 0, 1),
(305, 5, 'STD-REG-Y19-305', 'IQRA SHARIF', 'MUHAMMAD SHARIF KHAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4673', 'Active', 'Active', '', '2019-07-02 08:44:15', '0000-00-00 00:00:00', 1, 0, 1),
(306, 5, 'STD-REG-Y19-306', 'ANOOSH KHAN', 'ZEESHAN AHMED KHAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1741', 'Active', 'Active', '', '2019-07-02 08:44:22', '0000-00-00 00:00:00', 1, 0, 1),
(307, 5, 'STD-REG-Y19-307', 'DUA SHAHID', 'MUHAMMAD SHAHID NADEEM', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2894', 'Active', 'Active', '', '2019-07-02 08:44:30', '0000-00-00 00:00:00', 1, 0, 1),
(308, 5, 'STD-REG-Y19-308', 'AIMN WASEEM ZAMAN', 'WASEEM GHURI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9309', 'Active', 'Active', '', '2019-07-02 08:44:39', '0000-00-00 00:00:00', 1, 0, 1),
(309, 5, 'STD-REG-Y19-309', 'AAIZA AMAN KHAN', 'MUHAMMAD AHMED SAIF KHAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8266', 'Active', 'Active', '', '2019-07-02 08:44:46', '0000-00-00 00:00:00', 1, 0, 1),
(310, 5, 'STD-REG-Y19-310', 'TAYABA IRFAN', 'MUHAMMAD IRFAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7235', 'Active', 'Active', '', '2019-07-02 08:44:51', '0000-00-00 00:00:00', 1, 0, 1),
(311, 5, 'STD-REG-Y19-311', 'MINAHIL GHORI', 'FAHEEM GHAURI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4130', 'Active', 'Active', '', '2019-07-02 08:44:59', '0000-00-00 00:00:00', 1, 0, 1),
(312, 5, 'STD-REG-Y19-312', 'KIRN FAYYAZ', 'FAYYAZ AHMED', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8799', 'Active', 'Active', '', '2019-07-02 08:45:05', '0000-00-00 00:00:00', 1, 0, 1),
(313, 5, 'STD-REG-Y19-313', 'MUNAZZA MUDASSAR', 'MUDASSAR HUSSAIN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7373', 'Active', 'Active', '', '2019-07-02 08:45:19', '0000-00-00 00:00:00', 1, 0, 1),
(314, 5, 'STD-REG-Y19-314', 'UMM-E-HANI', 'MUHAMMAD KAMRAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9123', 'Active', 'Active', '', '2019-07-02 08:45:25', '0000-00-00 00:00:00', 1, 0, 1),
(315, 5, 'STD-REG-Y19-315', 'UMAIMA  KAMRAN', 'MUHAMMAD KAMRAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6658', 'Active', 'Active', '', '2019-07-02 08:45:32', '0000-00-00 00:00:00', 1, 0, 1),
(316, 5, 'STD-REG-Y19-316', 'WARDA MUJTABA', 'JAVED MUJTABA', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3190', 'Active', 'Active', '', '2019-07-02 08:45:40', '0000-00-00 00:00:00', 1, 0, 1),
(317, 5, 'STD-REG-Y19-317', 'JAVARIA IMRAN', 'IMRAN MEHMOOD QADARI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7304', 'Active', 'Active', '', '2019-07-02 08:45:46', '0000-00-00 00:00:00', 1, 0, 1),
(318, 5, 'STD-REG-Y19-318', 'SANIA AHMED', 'MANZOOR AHMED', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7803', 'Active', 'Active', '', '2019-07-02 08:45:54', '0000-00-00 00:00:00', 1, 0, 1),
(319, 5, 'STD-REG-Y19-319', 'SALEHA MUNIR', 'ABDUL BASIT', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9739', 'Active', 'Active', '', '2019-07-02 08:46:00', '0000-00-00 00:00:00', 1, 0, 1),
(320, 5, 'STD-REG-Y19-320', 'NOOR FATIMA', 'MUHAMMAD IMTIAZ', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4412', 'Active', 'Active', '', '2019-07-02 08:46:07', '0000-00-00 00:00:00', 1, 0, 1),
(321, 6, 'STD-REG-Y19-321', 'MUHMMMAD HASAAN ISLAM', 'MUHAMMAD ISLAM ZAHID', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1024', 'Active', 'Active', '', '2019-07-02 08:46:14', '0000-00-00 00:00:00', 4, 0, 1),
(322, 6, 'STD-REG-Y19-322', 'MUHAMMAD ABDULLAH ASIF', 'MUHAMMAD ASIF', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1387', 'Active', 'Active', '', '2019-07-02 08:46:21', '0000-00-00 00:00:00', 4, 0, 1),
(323, 6, 'STD-REG-Y19-323', 'SUFYAN SHAHID', 'RAO SHAHID IQBAL', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1576', 'Active', 'Active', '', '2019-07-02 08:46:28', '0000-00-00 00:00:00', 4, 0, 1),
(324, 6, 'STD-REG-Y19-324', 'MUHAMMAD OMAR', 'TARIQ MEHMOOD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9153', 'Active', 'Active', '', '2019-07-02 08:46:34', '0000-00-00 00:00:00', 4, 0, 1),
(325, 6, 'STD-REG-Y19-325', 'M.HASEEB JAWAD', 'M.JAWAD AHMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1170', 'Active', 'Active', '', '2019-07-02 08:46:41', '0000-00-00 00:00:00', 4, 0, 1),
(326, 6, 'STD-REG-Y19-326', 'MUHAMMAD KHALID', 'YAR MUHAMMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2124', 'Active', 'Active', '', '2019-07-02 08:46:46', '0000-00-00 00:00:00', 4, 0, 1),
(327, 6, 'STD-REG-Y19-327', 'HANAN ALI', 'AWAIS ALI(LATE)', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5347', 'Active', 'Active', '', '2019-07-02 08:46:53', '0000-00-00 00:00:00', 4, 0, 1),
(328, 6, 'STD-REG-Y19-328', 'SALMAN ANWAR', 'MUHAMMAD ANWAR', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5257', 'Active', 'Active', '', '2019-07-02 08:46:58', '0000-00-00 00:00:00', 4, 0, 1),
(329, 6, 'STD-REG-Y19-329', 'M HAMZA NADEEM', 'MUHAMMAD NADEEM', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2455', 'Active', 'Active', '', '2019-07-02 08:47:05', '0000-00-00 00:00:00', 4, 0, 1),
(330, 6, 'STD-REG-Y19-330', 'MUHAMMAD ZULQARNAIN', 'ABDUL NABI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6867', 'Active', 'Active', '', '2019-07-02 08:47:17', '0000-00-00 00:00:00', 4, 0, 1),
(331, 6, 'STD-REG-Y19-331', 'MUHAMMAD HASSAN MEHMOOD', 'AZHAR MEHMOOD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7711', 'Active', 'Active', '', '2019-07-02 08:47:23', '0000-00-00 00:00:00', 4, 0, 1),
(332, 6, 'STD-REG-Y19-332', 'MUHAMMAD  JAZIB', 'CH ABDUL WAHID', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2668', 'Active', 'Active', '', '2019-07-02 08:47:30', '0000-00-00 00:00:00', 4, 0, 1),
(333, 6, 'STD-REG-Y19-333', 'RAEES ABDULLAH TABASSUM', 'RAEES KHADIM HUSSAIN TABASSUM', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2030', 'Active', 'Active', '', '2019-07-02 08:47:37', '0000-00-00 00:00:00', 4, 0, 1),
(334, 6, 'STD-REG-Y19-334', 'TAJ MUHAMMAD', 'HAJI SHOKT', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3764', 'Active', 'Active', '', '2019-07-02 08:47:43', '0000-00-00 00:00:00', 4, 0, 1),
(335, 6, 'STD-REG-Y19-335', 'ALI HASSAN', 'MUHAMMAD ARSHAD HUSSAIN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6970', 'Active', 'Active', '', '2019-07-02 08:47:50', '0000-00-00 00:00:00', 4, 0, 1),
(336, 6, 'STD-REG-Y19-336', 'ALI HADIR ZULQERNAIN', 'MUHAMMAD ARSHAD HUSSAIN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7969', 'Active', 'Active', '', '2019-07-02 08:47:56', '0000-00-00 00:00:00', 4, 0, 1),
(337, 6, 'STD-REG-Y19-337', 'AHMAD SHEHZAD', 'SHEHZAD AHMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1784', 'Active', 'Active', '', '2019-07-02 08:48:02', '0000-00-00 00:00:00', 4, 0, 1),
(338, 6, 'STD-REG-Y19-338', 'ABDULLAH TAYYAB', 'M.TAYYAB', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1450', 'Active', 'Active', '', '2019-07-02 08:48:08', '0000-00-00 00:00:00', 4, 0, 1),
(339, 6, 'STD-REG-Y19-339', 'ATTA UR REHMAN', 'HAFEEZ UR REHMAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4737', 'Active', 'Active', '', '2019-07-02 08:48:16', '0000-00-00 00:00:00', 4, 0, 1),
(340, 6, 'STD-REG-Y19-340', 'SHUMAIM ASIF', 'ASIF PAUL', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6279', 'Active', 'Active', '', '2019-07-02 08:48:23', '0000-00-00 00:00:00', 4, 0, 1),
(341, 6, 'STD-REG-Y19-341', 'HARMAIN AKBAR', 'AKBAR HUSSAIN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2251', 'Active', 'Active', '', '2019-07-02 08:48:29', '0000-00-00 00:00:00', 4, 0, 1),
(342, 6, 'STD-REG-Y19-342', 'ZUNAIRA JABBAR', 'ABDUL JABBAR ANJUM', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6017', 'Active', 'Active', '', '2019-07-02 08:48:34', '0000-00-00 00:00:00', 4, 0, 1),
(343, 6, 'STD-REG-Y19-343', 'RUBAB ALI', 'ABID ALI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7729', 'Active', 'Active', '', '2019-07-02 08:48:41', '0000-00-00 00:00:00', 4, 0, 1),
(344, 6, 'STD-REG-Y19-344', 'RAMEEN ALI', 'OWAIS ALI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1059', 'Active', 'Active', '', '2019-07-02 08:48:48', '0000-00-00 00:00:00', 4, 0, 1),
(345, 6, 'STD-REG-Y19-345', 'MAIRA EJAZ', 'EJAZ ALI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5415', 'Active', 'Active', '', '2019-07-02 08:48:55', '0000-00-00 00:00:00', 4, 0, 1),
(346, 6, 'STD-REG-Y19-346', 'AYESHA ABBASI', 'SAIF ULLAH', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6190', 'Active', 'Active', '', '2019-07-02 08:49:14', '0000-00-00 00:00:00', 4, 0, 1),
(347, 6, 'STD-REG-Y19-347', 'ESHA NOOR ASIF', 'MUHAMMAD ASIF', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3309', 'Active', 'Active', '', '2019-07-02 08:49:25', '0000-00-00 00:00:00', 4, 0, 1),
(348, 6, 'STD-REG-Y19-348', 'EMAN WASEEM ZAMAN', 'WASEEM GHORI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3404', 'Active', 'Active', '', '2019-07-02 08:49:32', '0000-00-00 00:00:00', 4, 0, 1),
(349, 6, 'STD-REG-Y19-349', 'ATIKA FATIMA', 'MUHAMMAD RIZWAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1650', 'Active', 'Active', '', '2019-07-02 08:49:39', '0000-00-00 00:00:00', 4, 0, 1),
(350, 6, 'STD-REG-Y19-350', 'LAIBA SHAHID', 'MUHAMMAD SHAHID NADEEM', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7983', 'Active', 'Active', '', '2019-07-02 08:49:45', '0000-00-00 00:00:00', 4, 0, 1),
(351, 6, 'STD-REG-Y19-351', 'LAIBA AHMED', 'M.JAVEED AHMED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9666', 'Active', 'Active', '', '2019-07-02 08:49:52', '0000-00-00 00:00:00', 4, 0, 1),
(352, 6, 'STD-REG-Y19-352', 'AMNA KHAN', 'JAVED MUJTABA', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3329', 'Active', 'Active', '', '2019-07-02 08:49:58', '0000-00-00 00:00:00', 4, 0, 1),
(354, 6, 'STD-REG-Y19-354', 'AYESHA RASHEED', 'RASHEED AHMAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5711', 'Active', 'Active', '', '2019-07-02 08:50:04', '0000-00-00 00:00:00', 4, 0, 1),
(355, 6, 'STD-REG-Y19-355', 'M.ABBAS KHAN', 'ABDUL BASEER KHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5674', 'Active', 'Active', '', '2019-07-02 08:50:11', '0000-00-00 00:00:00', 4, 0, 1),
(356, 6, 'STD-REG-Y19-356', 'ABDUL HASEEB SAEED BAJWA', 'SAEED AHMED BAJWA', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3141', 'Active', 'Active', '', '2019-07-02 08:50:22', '0000-00-00 00:00:00', 4, 0, 1),
(357, 6, 'STD-REG-Y19-357', 'MUHAMMAD BILAL', 'MUHAMMAD SHARIF KHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8303', 'Active', 'Active', '', '2019-07-02 08:50:28', '0000-00-00 00:00:00', 4, 0, 1),
(358, 6, 'STD-REG-Y19-358', 'SIBGHAT-ULLAH ZAHID', 'SAYED ZAHID HUSSAIN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6670', 'Active', 'Active', '', '2019-07-02 08:50:34', '0000-00-00 00:00:00', 4, 0, 1),
(359, 6, 'STD-REG-Y19-359', 'REHAN NAVEED', 'RAO NAVEED AKHTAR', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5372', 'Active', 'Active', '', '2019-07-02 08:50:47', '0000-00-00 00:00:00', 4, 0, 1),
(360, 6, 'STD-REG-Y19-360', 'USAMA ABDUL MUGHEES SHAHID', 'M. SHAHID NASEER', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1511', 'Active', 'Active', '', '2019-07-02 08:50:53', '0000-00-00 00:00:00', 4, 0, 1),
(361, 6, 'STD-REG-Y19-361', 'MUHAMMAD MUNEEB KHALID', 'KHALID MEHMOOD ABID', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1213', 'Active', 'Active', '', '2019-07-02 08:51:04', '0000-00-00 00:00:00', 4, 0, 1),
(362, 6, 'STD-REG-Y19-362', 'M.SUFIYAN KHALID', 'KHALID HUSSAIN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1392', 'Active', 'Active', '', '2019-07-02 08:51:10', '0000-00-00 00:00:00', 4, 0, 1),
(363, 6, 'STD-REG-Y19-363', 'MUHAMMAD SABIR', 'MUHAMMAD BILAL', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7592', 'Active', 'Active', '', '2019-07-02 08:51:16', '0000-00-00 00:00:00', 4, 0, 1),
(364, 6, 'STD-REG-Y19-364', 'ABDUL REHMAN', 'RASHEED AHMED', '', NULL, '', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6931', 'Active', 'Active', '', '2019-07-02 08:51:22', '0000-00-00 00:00:00', 4, 0, 1),
(365, 6, 'STD-REG-Y19-365', 'RAEES AHMAD MAHMOOD TABASSUM', 'RAEES KHADIM HUSSAIN TABASSUM', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4959', 'Active', 'Active', '', '2019-07-02 08:51:36', '0000-00-00 00:00:00', 4, 0, 1),
(366, 6, 'STD-REG-Y19-366', 'AUN RAZA', 'KHALIL AHMAD (LATE)', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3897', 'Active', 'Active', '', '2019-07-02 08:51:43', '0000-00-00 00:00:00', 4, 0, 1),
(367, 6, 'STD-REG-Y19-367', 'MUHAMMAD DANIAL ZAFAR', 'MUHAMMAD ZAFAR IQBAL', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3019', 'Active', 'Active', '', '2019-07-02 08:51:49', '0000-00-00 00:00:00', 4, 0, 1),
(368, 6, 'STD-REG-Y19-368', 'ALIYAN AAMIR', 'AAMIR HANIF', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1315', 'Active', 'Active', '', '2019-07-02 08:51:55', '0000-00-00 00:00:00', 4, 0, 1),
(369, 6, 'STD-REG-Y19-369', 'NASIR AHMAD ', 'MAJEED AHMAD', '', NULL, '', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7454', 'Active', 'Active', '', '2019-07-02 08:52:08', '0000-00-00 00:00:00', 4, 0, 1),
(370, 6, 'STD-REG-Y19-370', 'ABDUL SHAKOOR DURRANI', 'SAMAR ABBAS', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6874', 'Active', 'Active', '', '2019-07-02 08:52:14', '0000-00-00 00:00:00', 4, 0, 1),
(371, 6, 'STD-REG-Y19-371', 'MAHNOOR BHATTI', 'ABDUL HAMEED BHATTI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6633', 'Active', 'Active', '', '2019-07-02 08:52:20', '0000-00-00 00:00:00', 4, 0, 1),
(372, 6, 'STD-REG-Y19-372', 'AREEBA MAQSOOD', 'MAQSOOD AHMED', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8596', 'Active', 'Active', '', '2019-07-02 08:52:27', '0000-00-00 00:00:00', 4, 0, 1),
(373, 6, 'STD-REG-Y19-373', 'MARYYAM NAVEED', 'RAO NAVEED AKHTAR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4496', 'Active', 'Active', '', '2019-07-02 08:52:34', '0000-00-00 00:00:00', 4, 0, 1),
(374, 6, 'STD-REG-Y19-374', 'LAIBA KHAN', 'ASHIQ HUSSAIN', '', NULL, '', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4688', 'Active', 'Active', '', '2019-07-02 08:52:42', '0000-00-00 00:00:00', 4, 0, 1),
(375, 6, 'STD-REG-Y19-375', 'HAFZA JABBAR', 'ABDUL JABBAR  ANJUM', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7955', 'Active', 'Active', '', '2019-07-02 08:52:50', '0000-00-00 00:00:00', 4, 0, 1),
(376, 6, 'STD-REG-Y19-376', 'FIZA ALI', 'ABID ALI', '', NULL, '', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7881', 'Active', 'Active', '', '2019-07-02 08:52:55', '0000-00-00 00:00:00', 4, 0, 1),
(377, 6, 'STD-REG-Y19-377', 'HANIA ATHER', 'ATHER AMEEN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1268', 'Active', 'Active', '', '2019-07-02 08:53:02', '0000-00-00 00:00:00', 4, 0, 1),
(378, 6, 'STD-REG-Y19-378', 'SHAHREEN BIBI', 'SAEED KHAN ', '', NULL, '', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2942', 'Active', 'Active', '', '2019-07-02 08:53:08', '0000-00-00 00:00:00', 4, 0, 1),
(379, 6, 'STD-REG-Y19-379', 'QAIM KHATOON', 'MUHAMMMAD AKHTAR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2740', 'Active', 'Active', '', '2019-07-02 08:53:20', '0000-00-00 00:00:00', 4, 0, 1),
(380, 6, 'STD-REG-Y19-380', 'JAVERIA QADIR', 'GHULAM QADIR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9218', 'Active', 'Active', '', '2019-07-02 08:53:27', '0000-00-00 00:00:00', 4, 0, 1),
(381, 6, 'STD-REG-Y19-381', 'UROOJ FATIMA', 'JAM RIAZ', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8730', 'Active', 'Active', '', '2019-07-02 08:53:33', '0000-00-00 00:00:00', 4, 0, 1),
(382, 6, 'STD-REG-Y19-382', 'MALIKA ARSHAD', 'ARSHAD GHAFOOR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9504', 'Active', 'Active', '', '2019-07-02 08:53:44', '0000-00-00 00:00:00', 4, 0, 1),
(383, 6, 'STD-REG-Y19-383', 'EMAN HAFEEZ', 'MUHAMMAD HAFEEZ', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1636', 'Active', 'Active', '', '2019-07-02 08:53:50', '0000-00-00 00:00:00', 4, 0, 1),
(384, 6, 'STD-REG-Y19-384', 'KASHAF SAJID', 'MUHAMMAD SAJID ALI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2463', 'Active', 'Active', '', '2019-07-02 08:53:56', '0000-00-00 00:00:00', 4, 0, 1),
(385, 6, 'STD-REG-Y19-385', 'FATIMA-TU-ZAHRA', 'JAMEEL AHMAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3573', 'Active', 'Active', '', '2019-07-02 08:54:03', '0000-00-00 00:00:00', 4, 0, 1),
(386, 6, 'STD-REG-Y19-386', 'ALINA ALTAF', 'MUHAMMAD ALTAF', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8285', 'Active', 'Active', '', '2019-07-02 08:54:16', '0000-00-00 00:00:00', 4, 0, 1),
(387, 6, 'STD-REG-Y19-387', 'MARIAM BIBI', 'ZAHOOR AHMAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9081', 'Active', 'Active', '', '2019-07-02 08:54:22', '0000-00-00 00:00:00', 4, 0, 1),
(388, 6, 'STD-REG-Y19-388', 'IQRA REHAN', 'RANA REHAN ASHRAF', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3061', 'Active', 'Active', '', '2019-07-02 08:54:54', '0000-00-00 00:00:00', 4, 0, 1),
(389, 6, 'STD-REG-Y19-389', 'ZUNAISHA BHATTI', 'NASIR NAVEED BHATTI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4471', 'Active', 'Active', '', '2019-07-02 08:56:01', '0000-00-00 00:00:00', 4, 0, 1),
(390, 6, 'STD-REG-Y19-390', 'MOEEZ AHMED', 'AHMED ALI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4230', 'Active', 'Active', '', '2019-07-02 08:56:08', '0000-00-00 00:00:00', 4, 0, 1),
(391, 6, 'STD-REG-Y19-391', 'ALLAH NAWAZ', 'IRSHAD AHMED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5797', 'Active', 'Active', '', '2019-07-02 08:56:16', '0000-00-00 00:00:00', 4, 0, 1),
(392, 6, 'STD-REG-Y19-392', 'MUHAMMAD HARIS AFAQ', 'MUHAMMAD AFAQ', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3279', 'Active', 'Active', '', '2019-07-02 08:56:22', '0000-00-00 00:00:00', 4, 0, 1),
(393, 6, 'STD-REG-Y19-393', 'KHURRAM SOHAIL', 'SOHAIL AKHTER', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5435', 'Active', 'Active', '', '2019-07-02 08:56:29', '0000-00-00 00:00:00', 4, 0, 1),
(394, 6, 'STD-REG-Y19-394', 'HAMZA SOHAIL', 'RANA SOHAIL', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5131', 'Active', 'Active', '', '2019-07-02 08:56:35', '0000-00-00 00:00:00', 4, 0, 1),
(395, 6, 'STD-REG-Y19-395', 'MUHAMMAD ABDULLAH NAZIM', 'MUHAMMAD NAZAM', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3042', 'Active', 'Active', '', '2019-07-02 08:56:41', '0000-00-00 00:00:00', 4, 0, 1),
(396, 6, 'STD-REG-Y19-396', 'NOMAN ANWAR', 'MUHAMMAD ANWAR', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3879', 'Active', 'Active', '', '2019-07-02 08:56:48', '0000-00-00 00:00:00', 4, 0, 1),
(397, 6, 'STD-REG-Y19-397', 'MUHAMMAD FAHEEM', 'RASHEED AHMED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9108', 'Active', 'Active', '', '2019-07-02 08:56:55', '0000-00-00 00:00:00', 4, 0, 1),
(398, 6, 'STD-REG-Y19-398', 'MUHAMMAD ATIF', 'MUHAMMAD ALI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3350', 'Active', 'Active', '', '2019-07-02 08:57:02', '0000-00-00 00:00:00', 4, 0, 1),
(399, 6, 'STD-REG-Y19-399', 'MUHAMMAD KAIF', 'MAIN ABDUL LATIF', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5992', 'Active', 'Active', '', '2019-07-02 08:57:07', '0000-00-00 00:00:00', 4, 0, 1),
(400, 6, 'STD-REG-Y19-400', 'RAHEEL AHMAD', 'JAMEEL AHMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4145', 'Active', 'Active', '', '2019-07-02 08:57:14', '0000-00-00 00:00:00', 4, 0, 1),
(401, 6, 'STD-REG-Y19-401', 'MOHAMMAD HASSAN ZAFAR', 'MOHAMMAD ZAFAR IQBAL', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8245', 'Active', 'Active', '', '2019-07-02 08:57:28', '0000-00-00 00:00:00', 4, 0, 1),
(402, 6, 'STD-REG-Y19-402', 'ABDUL SAMAD', 'TALIB HUSSAIN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4634', 'Active', 'Active', '', '2019-07-02 08:57:35', '0000-00-00 00:00:00', 4, 0, 1),
(403, 6, 'STD-REG-Y19-403', 'BEHROZ ALI', 'SAJJAD HUSSAIN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4707', 'Active', 'Active', '', '2019-07-02 08:57:42', '0000-00-00 00:00:00', 4, 0, 1),
(404, 6, 'STD-REG-Y19-404', 'MUHAMMAD ABU BAKAR', 'MUHAMMAD HANIF', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8779', 'Active', 'Active', '', '2019-07-02 08:57:49', '0000-00-00 00:00:00', 4, 0, 1),
(405, 6, 'STD-REG-Y19-405', 'MUHAMMAD AHMAD', 'ABDUL BASIT', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3832', 'Active', 'Active', '', '2019-07-02 08:57:55', '0000-00-00 00:00:00', 4, 0, 1),
(406, 6, 'STD-REG-Y19-406', 'FAHAD TAYYAB', 'M.TAYYAB', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3531', 'Active', 'Active', '', '2019-07-02 08:58:00', '0000-00-00 00:00:00', 4, 0, 1),
(407, 6, 'STD-REG-Y19-407', 'MUHAMMAD ZEESHAN SHAHID', 'SHAHID ASHRAF', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6065', 'Active', 'Active', '', '2019-07-02 08:58:07', '0000-00-00 00:00:00', 4, 0, 1),
(408, 6, 'STD-REG-Y19-408', 'ALISHBA ALI', 'MUHAMMAD ALI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9151', 'Active', 'Active', '', '2019-07-02 08:58:13', '0000-00-00 00:00:00', 4, 0, 1),
(409, 6, 'STD-REG-Y19-409', 'AYESHA RIZWAN', 'MUHAMMAD RIZWAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5762', 'Active', 'Active', '', '2019-07-02 08:58:18', '0000-00-00 00:00:00', 4, 0, 1),
(410, 6, 'STD-REG-Y19-410', 'ALIZA KHAN', 'ZEESHAN KHAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7457', 'Active', 'Active', '', '2019-07-02 08:58:23', '0000-00-00 00:00:00', 4, 0, 1),
(411, 6, 'STD-REG-Y19-411', 'MINAHIL ATHER', 'ATHER AMEEN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6355', 'Active', 'Active', '', '2019-07-02 08:58:53', '0000-00-00 00:00:00', 4, 0, 1),
(412, 6, 'STD-REG-Y19-412', 'ZAINAB SHEHZAD', 'M. SHEZAD KHAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7131', 'Active', 'Active', '', '2019-07-02 08:59:01', '0000-00-00 00:00:00', 4, 0, 1),
(413, 6, 'STD-REG-Y19-413', 'SANA FATIMA', 'ABDUL RASHEED NOOR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4164', 'Active', 'Active', '', '2019-07-02 08:59:11', '0000-00-00 00:00:00', 4, 0, 1),
(414, 6, 'STD-REG-Y19-414', 'FATMA SHAHZAD', 'SHAHZAD MAQBOOL', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1705', 'Active', 'Active', '', '2019-07-02 08:59:18', '0000-00-00 00:00:00', 4, 0, 1),
(415, 6, 'STD-REG-Y19-415', 'ALEEZA TABASSUM', 'RAEES  KHADIM HUSSAIN TABASSUM', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9944', 'Active', 'Active', '', '2019-07-02 08:59:25', '0000-00-00 00:00:00', 4, 0, 1),
(416, 6, 'STD-REG-Y19-416', 'LAIBA HAMEED', 'RAO ABDUL HAMEED', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7825', 'Active', 'Active', '', '2019-07-02 08:59:34', '0000-00-00 00:00:00', 4, 0, 1),
(417, 6, 'STD-REG-Y19-417', 'AATIKA HAMEED', 'RAO ABDUL HAMEED', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6127', 'Active', 'Active', '', '2019-07-02 08:59:42', '0000-00-00 00:00:00', 4, 0, 1),
(418, 6, 'STD-REG-Y19-418', 'IQRA HAMEED', 'ABDUL HAMEED KHAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6433', 'Active', 'Active', '', '2019-07-02 08:59:49', '0000-00-00 00:00:00', 4, 0, 1),
(419, 6, 'STD-REG-Y19-419', 'ALISHA IMRAN', 'IMRAN MEHMOOD QADARI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4380', 'Active', 'Active', '', '2019-07-02 08:59:59', '0000-00-00 00:00:00', 4, 0, 1),
(420, 6, 'STD-REG-Y19-420', 'ALISHBA KHALID', 'KHALID JAVED', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9831', 'Active', 'Active', '', '2019-07-02 09:00:08', '0000-00-00 00:00:00', 4, 0, 1),
(421, 6, 'STD-REG-Y19-421', 'AMJAD ALI', 'M.RAMZAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7927', 'Active', 'Active', '', '2019-07-02 09:04:16', '0000-00-00 00:00:00', 4, 0, 1),
(422, 6, 'STD-REG-Y19-422', 'ZAIN ALI', 'MAQSOOD AHMED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4505', 'Active', 'Active', '', '2019-07-02 09:04:24', '0000-00-00 00:00:00', 4, 0, 1),
(423, 6, 'STD-REG-Y19-423', 'MUHAMMAD USMAN JAWAD', 'MUHAMMAD JAWAD AHMED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8678', 'Active', 'Active', '', '2019-07-02 09:04:32', '0000-00-00 00:00:00', 4, 0, 1),
(424, 6, 'STD-REG-Y19-424', 'HAIDER ALI', 'AMIR AWAIS', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8756', 'Active', 'Active', '', '2019-07-02 09:04:39', '0000-00-00 00:00:00', 4, 0, 1),
(425, 6, 'STD-REG-Y19-425', 'ABDUL AHAD SAEED', 'AMIR SAEED', '', NULL, '', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6864', 'Active', 'Active', '', '2019-07-02 09:04:46', '0000-00-00 00:00:00', 4, 0, 1),
(426, 6, 'STD-REG-Y19-426', 'ADNAN FAYYAZ', 'FAYYAZ AHMED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8863', 'Active', 'Active', '', '2019-07-02 09:04:52', '0000-00-00 00:00:00', 4, 0, 1),
(427, 6, 'STD-REG-Y19-427', 'MUHAMMAD HUSSAIN RAZA', 'MUHAMMAD ARSHAD HUSSAIN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1272', 'Active', 'Active', '', '2019-07-02 09:04:58', '0000-00-00 00:00:00', 4, 0, 1),
(428, 6, 'STD-REG-Y19-428', 'YASIR ALI', 'AKHTAR ALI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1908', 'Active', 'Active', '', '2019-07-02 09:05:06', '0000-00-00 00:00:00', 4, 0, 1),
(429, 6, 'STD-REG-Y19-429', 'YASIR ALI', 'AKHTAR ALI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3511', 'Active', 'Active', '', '2019-07-02 09:05:13', '0000-00-00 00:00:00', 4, 0, 1),
(430, 6, 'STD-REG-Y19-430', 'MOIZ JAVED', 'JAVED IQBAL', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4189', 'Active', 'Active', '', '2019-07-02 09:05:20', '0000-00-00 00:00:00', 4, 0, 1),
(431, 6, 'STD-REG-Y19-431', 'ALI RAZA', 'KHALIL AHMAD (LATE)', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5061', 'Active', 'Active', '', '2019-07-02 09:05:27', '0000-00-00 00:00:00', 4, 0, 1),
(432, 6, 'STD-REG-Y19-432', 'MUHAMMAD ZAIN TAHIR', 'TAHIR IQBAL', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7441', 'Active', 'Active', '', '2019-07-02 09:05:33', '0000-00-00 00:00:00', 4, 0, 1),
(433, 6, 'STD-REG-Y19-433', 'AASHAN ALI', 'GULAM YASEEN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6249', 'Active', 'Active', '', '2019-07-02 09:05:39', '0000-00-00 00:00:00', 4, 0, 1),
(434, 6, 'STD-REG-Y19-434', 'M. ABDULLAH', 'M. ALTAF', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7709', 'Active', 'Active', '', '2019-07-02 09:05:47', '0000-00-00 00:00:00', 4, 0, 1),
(437, 6, 'STD-REG-Y19-437', 'MUHAMMAD UMAIR', 'PEER DITTA', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4919', 'Active', 'Active', '', '2019-07-02 09:05:54', '0000-00-00 00:00:00', 4, 0, 1),
(438, 6, 'STD-REG-Y19-438', 'SAIF UR REHMAN', 'NOOR AHMAD', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3144', 'Active', 'Active', '', '2019-07-02 09:06:01', '0000-00-00 00:00:00', 4, 0, 1),
(439, 6, 'STD-REG-Y19-439', 'SUFIYAN AZAM', 'MUHAMMAD AZAM', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7841', 'Active', 'Active', '', '2019-07-02 09:06:07', '0000-00-00 00:00:00', 4, 0, 1),
(440, 6, 'STD-REG-Y19-440', 'AFSHAN RASHEED', 'RASHEED AHMAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7579', 'Active', 'Active', '', '2019-07-02 09:06:24', '0000-00-00 00:00:00', 4, 0, 1),
(441, 6, 'STD-REG-Y19-441', 'SAIRA AYYAZ', 'AYYAZ AHMAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7487', 'Active', 'Active', '', '2019-07-02 09:06:31', '0000-00-00 00:00:00', 4, 0, 1),
(442, 6, 'STD-REG-Y19-442', 'AMNA JAVED', 'JAVED AKHTAR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6044', 'Active', 'Active', '', '2019-07-02 09:06:37', '0000-00-00 00:00:00', 4, 0, 1),
(443, 6, 'STD-REG-Y19-443', 'AYESHA BIBI', 'ZAHOOR AHMAD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1751', 'Active', 'Active', '', '2019-07-02 09:06:44', '0000-00-00 00:00:00', 4, 0, 1),
(444, 6, 'STD-REG-Y19-444', 'SANA AMEEN', 'M. AMEEN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5701', 'Active', 'Active', '', '2019-07-02 09:06:51', '0000-00-00 00:00:00', 4, 0, 1),
(445, 6, 'STD-REG-Y19-445', 'MOHAMMAD ADIL KHAN', 'ASHIQ MOHAMMAD KHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1228', 'Active', 'Active', '', '2019-07-02 09:06:58', '0000-00-00 00:00:00', 4, 0, 1),
(446, 6, 'STD-REG-Y19-446', 'MUHAMMAD ESSA KHAN', 'HAJI ASAD AHMED KHAN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2275', 'Active', 'Active', '', '2019-07-02 09:07:05', '0000-00-00 00:00:00', 4, 0, 1),
(447, 6, 'STD-REG-Y19-447', 'MOHSIN SAEED', 'SAEED AHMED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7901', 'Active', 'Active', '', '2019-07-02 09:07:12', '0000-00-00 00:00:00', 4, 0, 1),
(448, 6, 'STD-REG-Y19-448', 'YASIR RAZA', 'TAHIR SAEED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2231', 'Active', 'Left', '', '2019-07-06 06:58:46', '2019-07-06 06:58:46', 4, 4, 1),
(449, 6, 'STD-REG-Y19-449', 'BASIT ALEEM', 'M.ALEEM AKBAR', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8154', 'Active', 'Active', '', '2019-07-02 09:07:30', '0000-00-00 00:00:00', 4, 0, 1),
(450, 6, 'STD-REG-Y19-450', 'TANVEER HUSSAIN', 'KHADIM HUSSAIN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3293', 'Active', 'Active', '', '2019-07-02 09:07:37', '0000-00-00 00:00:00', 4, 0, 1),
(451, 6, 'STD-REG-Y19-451', 'ALI HAMZA', 'PEER BUKHSH', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8513', 'Active', 'Active', '', '2019-07-02 09:07:44', '0000-00-00 00:00:00', 4, 0, 1),
(452, 6, 'STD-REG-Y19-452', 'MUHAMMAD ZAMEER UL HASSAN', 'GHULAM QADIR', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6053', 'Active', 'Active', '', '2019-07-02 09:07:52', '0000-00-00 00:00:00', 4, 0, 1),
(453, 6, 'STD-REG-Y19-453', 'MUHAMMAD FARHAN FAYYAZ', 'FAYYAZ AHMED', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8923', 'Active', 'Active', '', '2019-07-02 09:07:58', '0000-00-00 00:00:00', 4, 0, 1),
(454, 6, 'STD-REG-Y19-454', 'SAIFULLAH ZIA', 'ZIA ULLAH', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9007', 'Active', 'Active', '', '2019-07-02 09:08:23', '0000-00-00 00:00:00', 4, 0, 1);
INSERT INTO `std_personal_info` (`std_id`, `branch_id`, `std_reg_no`, `std_name`, `std_father_name`, `std_contact_no`, `std_DOB`, `std_gender`, `std_permanent_address`, `std_temporary_address`, `std_email`, `std_photo`, `std_b_form`, `std_district`, `std_religion`, `std_nationality`, `std_tehseel`, `std_cast`, `admission_date`, `std_password`, `status`, `academic_status`, `barcode`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(455, 6, 'STD-REG-Y19-455', 'MUHAMMAD AWAIS', 'AKMAL HUSSAIN', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1245', 'Active', 'Active', '', '2019-07-02 09:08:30', '0000-00-00 00:00:00', 4, 0, 1),
(456, 6, 'STD-REG-Y19-456', 'ALI HASSAN', 'FARZAND ALI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1848', 'Active', 'Active', '', '2019-07-02 09:08:37', '0000-00-00 00:00:00', 4, 0, 1),
(457, 6, 'STD-REG-Y19-457', 'MUHAMMAD NOSHAD ALI', 'KHALID RERVAIZ ZAHID', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5050', 'Active', 'Active', '', '2019-07-02 09:08:45', '0000-00-00 00:00:00', 4, 0, 1),
(458, 6, 'STD-REG-Y19-458', 'TAYYAB HUSSAIN', 'MUHAMMAD ASLAM', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1262', 'Active', 'Active', '', '2019-07-02 09:08:52', '0000-00-00 00:00:00', 4, 0, 1),
(459, 6, 'STD-REG-Y19-459', 'USMAN SHOUKAT', 'SHOUKAT ALI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1390', 'Active', 'Active', '', '2019-07-02 09:08:59', '0000-00-00 00:00:00', 4, 0, 1),
(460, 6, 'STD-REG-Y19-460', 'HAMZA HAFEEZ', 'MUHAMMAD HAFEEZ', '', NULL, '', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5406', 'Active', 'Active', '', '2019-07-02 09:09:06', '0000-00-00 00:00:00', 4, 0, 1),
(461, 6, 'STD-REG-Y19-461', 'MUHAMMAD ARAIZ ARSHAD', 'ABDUL BASIT (LATE)', '', NULL, '', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9070', 'Active', 'Active', '', '2019-07-02 09:09:12', '0000-00-00 00:00:00', 4, 0, 1),
(462, 6, 'STD-REG-Y19-462', 'ZAMIN ALI', 'FAYAZ HUSSAIN', '', NULL, '', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8015', 'Active', 'Active', '', '2019-07-02 09:09:25', '0000-00-00 00:00:00', 4, 0, 1),
(463, 6, 'STD-REG-Y19-463', 'ARSLAN ASGHAR', 'ASGHAR ALI', '', NULL, 'M', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9314', 'Active', 'Active', '', '2019-07-02 09:09:30', '0000-00-00 00:00:00', 4, 0, 1),
(464, 6, 'STD-REG-Y19-464', 'MAHAM AZEEM', 'MUNAWAR AZEEM', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '9788', 'Active', 'Active', '', '2019-07-02 09:09:37', '0000-00-00 00:00:00', 4, 0, 1),
(465, 6, 'STD-REG-Y19-465', 'NOOR -UL- AIN', 'SAEED AHMED', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1400', 'Active', 'Active', '', '2019-07-02 09:09:44', '0000-00-00 00:00:00', 4, 0, 1),
(466, 6, 'STD-REG-Y19-466', 'UZMA JABBAR', 'ABDUL JABBAR ANJUM', '', NULL, '', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '4521', 'Active', 'Active', '', '2019-07-02 09:09:56', '0000-00-00 00:00:00', 4, 0, 1),
(467, 6, 'STD-REG-Y19-467', 'HAFSA REHMAN', 'ABDUL REHMAN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2953', 'Active', 'Active', '', '2019-07-02 09:10:03', '0000-00-00 00:00:00', 4, 0, 1),
(468, 6, 'STD-REG-Y19-468', 'ZUNAIRA FAYYAZ', 'FAYYAZ AHMED', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '6704', 'Active', 'Active', '', '2019-07-02 09:10:10', '0000-00-00 00:00:00', 4, 0, 1),
(469, 6, 'STD-REG-Y19-469', 'SIDRA TUL MUNTAHA', 'MUHAMMAD ALI', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '2820', 'Active', 'Active', '', '2019-07-02 09:10:17', '0000-00-00 00:00:00', 4, 0, 1),
(470, 6, 'STD-REG-Y19-470', 'LAIBA  AZHAR', 'AZHAR MEHMOOD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5175', 'Active', 'Active', '', '2019-07-02 09:10:24', '0000-00-00 00:00:00', 4, 0, 1),
(471, 6, 'STD-REG-Y19-471', 'NOOR LATIF', 'MAIN ABDUL LATIF', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '8659', 'Active', 'Active', '', '2019-07-02 09:10:30', '0000-00-00 00:00:00', 4, 0, 1),
(472, 6, 'STD-REG-Y19-472', 'KAINAT TABASSUM', 'RAEES KHADIM HUSSAIN TABASSUM', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '3562', 'Active', 'Active', '', '2019-07-02 09:10:39', '0000-00-00 00:00:00', 4, 0, 1),
(473, 6, 'STD-REG-Y19-473', 'AQSA KHALID', 'KHALID MEHMOOD', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '5989', 'Active', 'Active', '', '2019-07-02 09:10:52', '0000-00-00 00:00:00', 4, 0, 1),
(474, 6, 'STD-REG-Y19-474', 'MALAIKA NIZAM', 'MUHAMMAD NIZAM BASHIR', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '7933', 'Active', 'Active', '', '2019-07-02 09:11:01', '0000-00-00 00:00:00', 4, 0, 1),
(475, 6, 'STD-REG-Y19-475', 'UZMA YASEEN', 'GHULAM YASEEN', '', NULL, 'F', '', '', '', 'uploads/std_default.jpg', '', '', '', '', '', '', NULL, '1866', 'Active', 'Active', '', '2019-07-02 09:11:08', '0000-00-00 00:00:00', 4, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_sections`
--

CREATE TABLE `std_sections` (
  `section_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `section_name` varchar(50) NOT NULL,
  `section_description` varchar(100) NOT NULL,
  `section_intake` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_sections`
--

INSERT INTO `std_sections` (`section_id`, `class_id`, `branch_id`, `session_id`, `section_name`, `section_description`, `section_intake`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 1, 5, 1, 'Blue', 'Blue', 30, '2019-06-20 05:38:46', '2019-06-20 05:38:46', 1, 1, 1),
(2, 2, 5, 1, 'Blue', 'Blue', 30, '2019-06-20 05:40:18', '2019-06-20 05:40:18', 1, 1, 1),
(3, 3, 5, 1, 'Blue', 'Blue', 35, '2019-06-20 05:42:05', '2019-06-20 05:42:05', 1, 1, 1),
(4, 4, 5, 1, 'Blue', 'Blue', 30, '2019-06-18 10:49:35', '0000-00-00 00:00:00', 1, 0, 1),
(6, 5, 5, 1, 'Blue', 'Blue', 50, '2019-06-20 05:53:08', '0000-00-00 00:00:00', 1, 0, 1),
(7, 6, 5, 1, 'Blue (Boys)', 'Blue (Boys)', 50, '2019-07-02 09:43:40', '2019-07-02 09:43:40', 1, 1, 1),
(8, 7, 5, 1, 'Red (Girls)', 'Red (Girls)', 50, '2019-07-02 09:45:00', '2019-07-02 09:45:00', 1, 1, 1),
(9, 8, 5, 1, 'Red (Girls)', 'Red (Girls)', 50, '2019-07-02 09:46:55', '2019-07-02 09:46:55', 1, 1, 1),
(10, 8, 5, 1, 'Blue (Boys)', 'Blue (Boys)', 50, '2019-07-02 09:47:25', '2019-07-02 09:47:25', 1, 1, 1),
(11, 9, 6, 2, 'Boys', '6th (Boys)', 50, '2019-06-24 09:45:19', '0000-00-00 00:00:00', 4, 0, 1),
(12, 9, 6, 2, 'Girls', '6th (Girls)', 50, '2019-06-24 09:46:02', '0000-00-00 00:00:00', 4, 0, 1),
(13, 5, 5, 1, 'Red', 'Red', 50, '2019-06-26 08:28:17', '0000-00-00 00:00:00', 1, 0, 1),
(14, 6, 5, 1, 'Red (Girls)', 'Red (Girls)', 50, '2019-07-02 09:44:20', '2019-07-02 09:44:20', 1, 1, 1),
(15, 7, 5, 1, 'Blue (Boys)', 'Blue (Boys)', 50, '2019-07-02 09:45:50', '2019-07-02 09:45:50', 1, 1, 1),
(16, 11, 6, 2, 'Boys', 'Boys', 50, '2019-07-02 10:19:26', '2019-07-02 10:19:26', 4, 4, 1),
(17, 11, 6, 2, 'Girls', 'Girls', 40, '2019-07-02 10:19:57', '0000-00-00 00:00:00', 4, 0, 1),
(18, 12, 6, 2, 'Boys', 'Boys', 50, '2019-07-02 10:20:18', '0000-00-00 00:00:00', 4, 0, 1),
(19, 12, 6, 2, 'Girls', 'Girls', 50, '2019-07-02 10:20:33', '0000-00-00 00:00:00', 4, 0, 1),
(20, 13, 6, 2, 'Boys', 'Boys', 50, '2019-07-02 10:20:52', '0000-00-00 00:00:00', 4, 0, 1),
(21, 13, 6, 2, 'Girls', 'Girls', 50, '2019-07-02 10:21:32', '0000-00-00 00:00:00', 4, 0, 1),
(22, 14, 6, 2, 'Boys', 'Boys', 50, '2019-07-03 06:18:30', '2019-07-03 06:18:30', 4, 4, 1),
(23, 14, 6, 2, 'Girls', 'Girls', 50, '2019-07-03 06:18:41', '2019-07-03 06:18:41', 4, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_sessions`
--

CREATE TABLE `std_sessions` (
  `session_id` int(11) NOT NULL,
  `session_branch_id` int(11) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `session_start_date` date NOT NULL,
  `session_end_date` date NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `installment_cycle` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_sessions`
--

INSERT INTO `std_sessions` (`session_id`, `session_branch_id`, `session_name`, `session_start_date`, `session_end_date`, `status`, `installment_cycle`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 5, '2019-2020', '2019-01-01', '2019-12-31', 'Active', 0, '2019-06-18 10:08:22', '0000-00-00 00:00:00', 1, 0, 1),
(2, 6, '2019-2020 ', '2019-01-01', '2019-12-31', 'Active', 0, '2019-07-06 06:18:59', '2019-07-06 06:18:59', 4, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_subjects`
--

CREATE TABLE `std_subjects` (
  `std_subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `std_subject_name` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_subjects`
--

INSERT INTO `std_subjects` (`std_subject_id`, `class_id`, `std_subject_name`) VALUES
(5, 1, 'Alphabet Book,Counting Book,Urdu Learner'),
(6, 2, 'ABC (Picture Book),123 (Picture Book),Alif,Byy,Pyy (Picture Book),Islamyat Studies'),
(7, 3, 'Islamyat Studies,Math Skill Book Bro,Urdu Book Bro,Language Skill book Bro,Science Factor Book (Starter),Science Factor WorkBook(Starter)'),
(8, 4, 'Junior English Book - 1,Islamyat (SAP),Urdu Crammer (B.B.C),Nelson Grammer Book - 1 ,Science Factor Book - 1,Urdu Alif,Social Studies,Math Count Down'),
(9, 5, 'Islamyat (SAP),Urdu Crammer (B.B.C),Urdu Alif,Social Studies,Math Count Down,Junior English Book - 2,Nelson Grammer Book - 2,Science Factor Book - 2'),
(10, 6, 'Islamyat (SAP),Urdu Crammer (B.B.C),Social Studies,Math Count Down,Junior English Book - 3,Nelson Grammer Book - 3,Science Factor Book - 3,Urdu'),
(11, 7, 'Islamyat (SAP),Urdu Crammer (B.B.C),Social Studies,Math Count Down,Junior English Book - 4,Nelson Grammer Book - 4,Science Factor Book - 4,Urdu'),
(12, 8, 'Islamyat (SAP),Social Studies,Math Count Down,Junior English Book - 5,English Grammer,Urdu Crammer (P.T.B),Science Factor Book - 5,Urdu (P.T.B)'),
(17, 9, 'Express English (Student Book -6 ),Express English (Work Book -6 ),Computer - 6,Growing with Grammar - 6,Secondary Science - 1,Count Down Math - 6,Understanding History - 1,Islamiat - 6,Urdu - 6,Urdu Grammar (9-10)'),
(19, 11, 'Urdu Grammar (9-10),Express English (Student Book -7 ),Express English (Work Book -7 ),Computer - 7,Growing with Grammar - 7,Secondary Science - 2,Count Down Math - 7,Understanding History - 2,Islamiat - 7,Urdu - 7'),
(20, 12, 'Urdu Grammar (9-10),Express English (Student Book -8 ),Express English (Work Book -8),Computer - 8,Growing with Grammar - 8,Secondary Science - 3,Count Down Math - 8,Understanding History - 3,Islamiat - 8,Urdu - 8'),
(21, 13, 'Math A,English A,Urdu A,Pak-Studies,Biology,Chemistry'),
(22, 14, 'English B,Urdu B,Pak-Studies,Biology,Chemistry');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(60) NOT NULL,
  `subject_alias` varchar(10) NOT NULL,
  `subject_description` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_name`, `subject_alias`, `subject_description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'Math A', 'M', 'Math A', '2019-06-25 10:11:10', '2019-06-25 10:11:10', 1, 4, 1),
(2, 'English A', 'Ea', 'English A', '2019-04-20 07:54:14', '0000-00-00 00:00:00', 1, 0, 1),
(3, 'English B', 'Eb', 'English B', '2019-04-20 07:54:14', '0000-00-00 00:00:00', 1, 0, 1),
(4, 'Urdu A', 'Ua', 'Urdu A', '2019-04-20 07:54:14', '0000-00-00 00:00:00', 1, 0, 1),
(5, 'Urdu B', 'Ub', 'Urdu B', '2019-04-20 07:54:14', '0000-00-00 00:00:00', 1, 0, 1),
(6, 'Science', 'S', 'Science', '2019-04-20 07:54:14', '0000-00-00 00:00:00', 1, 0, 1),
(7, 'Pak-Studies', 'Ps', 'History / Pak-Studies', '2019-04-20 07:54:14', '0000-00-00 00:00:00', 1, 0, 1),
(8, 'Computer', 'Cm', 'Computer', '2019-04-20 07:54:14', '0000-00-00 00:00:00', 1, 0, 1),
(9, 'islamiat', 'I', 'Islamiat', '2019-06-25 10:15:23', '2019-06-25 10:15:23', 1, 4, 0),
(10, 'Drawing', 'D', 'Drawing', '2019-04-18 06:57:07', '0000-00-00 00:00:00', 9, 0, 1),
(11, 'Biology', 'B', 'Biology', '2019-04-20 07:54:15', '0000-00-00 00:00:00', 1, 0, 1),
(12, 'Physics', 'P', 'Physics', '2019-06-24 08:05:45', '2019-06-24 08:05:45', 1, 4, 0),
(13, 'Chemistry', 'Ch', 'Chemistry', '2019-04-20 07:54:15', '0000-00-00 00:00:00', 1, 0, 1),
(14, 'Islamiat (Elective)', 'I(ele)', 'Islamiat (Elective)', '2019-06-19 07:51:19', '2019-06-19 07:51:19', 1, 1, 0),
(15, 'Junior English Book - 1', '', 'Book - 1 (SAP)', '2019-06-19 07:55:28', '2019-06-19 07:55:28', 1, 1, 1),
(16, 'Islamyat (SAP)', '', 'Islamyat (SAP)', '2019-06-19 07:50:30', '2019-06-19 07:50:30', 1, 1, 1),
(17, 'Urdu Crammer (B.B.C)', '', 'B.B.C', '2019-06-19 08:02:17', '2019-06-19 08:02:17', 1, 1, 1),
(18, 'Nelson Grammer Book - 1 ', '', 'Book - 1 (Oxford)', '2019-06-19 07:54:03', '2019-06-19 07:54:03', 1, 1, 1),
(19, 'Science Factor Book - 1', '', 'Oxford', '2019-06-19 07:54:58', '2019-06-19 07:54:58', 1, 1, 1),
(20, 'Urdu Alif', '', 'Paramount', '2019-06-19 07:42:19', '0000-00-00 00:00:00', 1, 0, 1),
(21, 'Social Studies', '', 'Paramount', '2019-06-19 07:42:44', '0000-00-00 00:00:00', 1, 0, 1),
(22, 'Math Count Down', '', 'Oxford', '2019-06-19 07:43:14', '0000-00-00 00:00:00', 1, 0, 1),
(23, 'Junior English Book - 2', '', 'Book - 2 (SAP)', '2019-06-19 07:55:39', '2019-06-19 07:55:39', 1, 1, 1),
(24, 'Nelson Grammer Book - 2', '', 'Book - 2 (Oxford)', '2019-06-19 07:53:41', '2019-06-19 07:53:41', 1, 1, 1),
(25, 'Science Factor Book - 2', '', 'Oxford', '2019-06-19 07:56:28', '0000-00-00 00:00:00', 1, 0, 1),
(26, 'Junior English Book - 3', '', 'SAP', '2019-06-19 07:57:14', '0000-00-00 00:00:00', 1, 0, 1),
(27, 'Nelson Grammer Book - 3', '', 'Oxford', '2019-06-19 07:57:44', '0000-00-00 00:00:00', 1, 0, 1),
(28, 'Science Factor Book - 3', '', 'Oxford', '2019-06-19 07:58:09', '0000-00-00 00:00:00', 1, 0, 1),
(29, 'Junior English Book - 4', '', 'SAP', '2019-06-19 07:58:41', '0000-00-00 00:00:00', 1, 0, 1),
(30, 'Nelson Grammer Book - 4', '', 'Oxford', '2019-06-19 07:59:11', '0000-00-00 00:00:00', 1, 0, 1),
(31, 'Science Factor Book - 4', '', 'Oxford', '2019-06-19 07:59:34', '0000-00-00 00:00:00', 1, 0, 1),
(32, 'Junior English Book - 5', '', 'SAP', '2019-06-19 08:00:04', '0000-00-00 00:00:00', 1, 0, 1),
(33, 'English Grammer', '', 'B.B.C', '2019-06-19 08:00:54', '0000-00-00 00:00:00', 1, 0, 1),
(34, 'Urdu Crammer (P.T.B)', '', 'Punjab Text Book', '2019-06-19 08:02:56', '0000-00-00 00:00:00', 1, 0, 1),
(35, 'Science Factor Book - 5', '', 'Oxford', '2019-06-19 08:03:19', '0000-00-00 00:00:00', 1, 0, 1),
(36, 'Alphabet Book', '', 'Book Wise', '2019-06-19 08:04:25', '0000-00-00 00:00:00', 1, 0, 1),
(37, 'Counting Book', '', 'Book Wise', '2019-06-19 08:04:47', '0000-00-00 00:00:00', 1, 0, 1),
(38, 'Urdu Learner', '', 'Book Wise', '2019-06-19 08:05:02', '0000-00-00 00:00:00', 1, 0, 1),
(39, 'ABC (Picture Book)', '', 'Book Wise', '2019-06-19 08:05:30', '0000-00-00 00:00:00', 1, 0, 1),
(40, '123 (Picture Book)', '', 'Book Wise', '2019-06-19 08:05:49', '0000-00-00 00:00:00', 1, 0, 1),
(41, 'Alif,Byy,Pyy (Picture Book)', '', 'Book Wise', '2019-06-19 08:07:37', '0000-00-00 00:00:00', 1, 0, 1),
(42, 'Islamyat Studies', '', 'Al Bakio', '2019-06-19 08:08:30', '0000-00-00 00:00:00', 1, 0, 1),
(43, 'Math Skill Book Bro', '', 'Al Bakio', '2019-06-19 08:09:46', '0000-00-00 00:00:00', 1, 0, 1),
(44, 'Urdu Book Bro', '', 'Al Bakio', '2019-06-19 08:10:01', '0000-00-00 00:00:00', 1, 0, 1),
(45, 'Language Skill book Bro', '', 'Al Bakio', '2019-06-19 08:10:19', '0000-00-00 00:00:00', 1, 0, 1),
(46, 'Science Factor Book (Starter)', '', 'Oxford', '2019-06-19 08:12:06', '0000-00-00 00:00:00', 1, 0, 1),
(47, 'Science Factor WorkBook(Starter)', '', 'Oxford', '2019-06-19 08:13:55', '0000-00-00 00:00:00', 1, 0, 1),
(48, 'Urdu', '', 'Paramount ', '2019-06-20 05:09:26', '0000-00-00 00:00:00', 1, 0, 1),
(49, 'Urdu (P.T.B)', '', 'Punjab Text Book', '2019-06-20 05:15:42', '0000-00-00 00:00:00', 1, 0, 1),
(50, 'Express English (Student Book -6 )', '', 'Cambridge', '2019-06-24 08:31:38', '2019-06-24 08:31:38', 4, 4, 1),
(51, 'Express English (Work Book -6 )', '', 'Cambridge', '2019-06-24 08:32:04', '0000-00-00 00:00:00', 4, 0, 1),
(52, 'Computer - 6', '', 'Punjab Text Book', '2019-06-24 08:32:49', '0000-00-00 00:00:00', 4, 0, 1),
(53, 'Growing with Grammar - 6', '', 'Paramount', '2019-06-24 08:44:03', '2019-06-24 08:44:03', 4, 4, 1),
(54, 'Secondary Science - 1', '', 'OUP', '2019-06-24 08:34:02', '0000-00-00 00:00:00', 4, 0, 1),
(55, 'Count Down Math - 6', '', 'OUP', '2019-06-24 08:34:43', '0000-00-00 00:00:00', 4, 0, 1),
(56, 'Understanding History - 1', '', 'OUP', '2019-06-24 08:35:56', '0000-00-00 00:00:00', 4, 0, 1),
(57, 'Islamiat - 6', '', 'Punjab Text Book', '2019-06-24 08:36:44', '0000-00-00 00:00:00', 4, 0, 1),
(58, 'Urdu - 6', '', 'Punjab Text Book', '2019-06-24 08:37:10', '0000-00-00 00:00:00', 4, 0, 1),
(59, 'Urdu Grammar (9-10)', '', 'Punjab Text Book', '2019-06-24 08:37:59', '0000-00-00 00:00:00', 4, 0, 1),
(60, 'Express English (Student Book -7 )', '', 'Cambridge', '2019-06-24 08:41:28', '0000-00-00 00:00:00', 4, 0, 1),
(61, 'Express English (Work Book -7 )', '', 'Cambridge', '2019-06-24 08:42:11', '0000-00-00 00:00:00', 4, 0, 1),
(62, 'Computer - 7', '', 'Punjab Text Book', '2019-06-24 08:43:03', '0000-00-00 00:00:00', 4, 0, 1),
(63, 'Growing with Grammar - 7', '', 'Paramount', '2019-06-24 08:44:17', '2019-06-24 08:44:17', 4, 4, 1),
(64, 'Secondary Science - 2', '', 'OUP', '2019-06-24 08:45:29', '0000-00-00 00:00:00', 4, 0, 1),
(65, 'Count Down Math - 7', '', 'OUP', '2019-06-24 08:46:40', '0000-00-00 00:00:00', 4, 0, 1),
(66, 'Understanding History - 2', '', 'OUP', '2019-06-24 08:47:59', '0000-00-00 00:00:00', 4, 0, 1),
(67, 'Islamiat - 7', '', 'Punjab Text Book', '2019-06-24 08:49:16', '0000-00-00 00:00:00', 4, 0, 1),
(68, 'Urdu - 7', '', 'Punjab Text Book', '2019-06-24 08:50:13', '0000-00-00 00:00:00', 4, 0, 1),
(69, 'Express English (Student Book -8 )', '', 'Cambridge', '2019-06-24 08:51:59', '0000-00-00 00:00:00', 4, 0, 1),
(70, 'Express English (Work Book -8)', '', 'Cambridge', '2019-06-24 08:52:50', '0000-00-00 00:00:00', 4, 0, 1),
(71, 'Computer - 8', '', 'Punjab Text Book', '2019-06-24 08:53:47', '0000-00-00 00:00:00', 4, 0, 1),
(72, 'Growing with Grammar - 8', '', 'Paramount', '2019-06-24 08:55:31', '0000-00-00 00:00:00', 4, 0, 1),
(73, 'Secondary Science - 3', '', 'OUP', '2019-06-24 08:56:53', '0000-00-00 00:00:00', 4, 0, 1),
(74, 'Count Down Math - 8', '', 'OUP', '2019-06-24 09:03:29', '0000-00-00 00:00:00', 4, 0, 1),
(75, 'Understanding History - 3', '', 'OUP', '2019-06-24 09:03:57', '0000-00-00 00:00:00', 4, 0, 1),
(76, 'Islamiat - 8', '', 'Punjab Text Book', '2019-06-24 09:05:25', '0000-00-00 00:00:00', 4, 0, 1),
(77, 'Urdu - 8', '', 'Punjab Text Book', '2019-06-24 09:05:58', '0000-00-00 00:00:00', 4, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subject_assign_detail`
--

CREATE TABLE `teacher_subject_assign_detail` (
  `teacher_subject_assign_detail_id` int(11) NOT NULL,
  `teacher_subject_assign_detail_head_id` int(11) NOT NULL,
  `incharge` tinyint(4) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `no_of_lecture` enum('1 Lecture','2 Lectures','3 Lectures','4 Lectures','5 Lectures','6 Lectures','Full Week') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subject_assign_head`
--

CREATE TABLE `teacher_subject_assign_head` (
  `teacher_subject_assign_head_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `teacher_subject_assign_head_name` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `first_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'example@gmail.com',
  `user_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_photo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `is_block` tinyint(4) NOT NULL DEFAULT '1',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `branch_id`, `first_name`, `last_name`, `username`, `email`, `user_type`, `auth_key`, `password_hash`, `password_reset_token`, `user_photo`, `is_block`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 'Miss', 'Noreen', 'admin1', 'admin1@abcls.edu.pk', 'dexdevs', 'pQEdYTAVV_wLtqIALoSZ-vELIA0mdsOx', '$2y$13$ClHehtUhZZQqsocCsPnEwer2wfQd4gTcpwSOJTkWnvoMD/oFzfCpG', NULL, 'userphotos/dexdevs_photo.png', 1, 10, 1552727256, 1552727256),
(3, 5, 'Super', 'Admin', 'Superadmin', 'superadmin@gmail.com', 'Superadmin', 'xqZuT3vxOiZ-rsN56V6wjZhi7VXMpKnD', '$2y$13$9TnNqeWAHECax0kmKSBzK.tGW/ePQm6IkutslR9ITYIXocjs4nnX.', NULL, 'userphotos/Superadmin_photo.png', 1, 10, 1552883449, 1552883449),
(4, 6, 'Miss', 'Mariam', 'admin2', 'admin@dexdevs.com', 'dexdevs2', 'm4vI7EWTZ61_eTBrJf_tliCWdgRfCKzM', '$2y$13$k6pJmBNM4hrkgZh0SYhcC.dZLxMLOjsJtVo55TV4QiVIJ4F6t7lIW', NULL, 'userphotos/dexdevs2_photo.png', 1, 10, 1552894313, 1552894313),
(102, 5, '', '', '31303-7130738-7', 'syedmuzammiljaved@gmail.com', 'Employee', 'b38IZwZ8KEGY-pB3qmXt5Y8KHH0ry_yF', '$2y$13$2oyPumTpUf9Ax.4Xv72BXuEXS99GIOLIPy.iuOqtbt2LwuP9x2.tq', NULL, '0', 1, 10, 1560856624, 1560856624),
(103, 5, '', '', '31303-3333335-5', 'ranafarazahmed@gmail.com', 'Student', 'xWXBIMKQiFDorY2Kz1S7prdjAEBQAdox', '$2y$13$Dxg5FyE0ECty870Qm.DTBO7T9ihsXUOffuEDmaEB4SDBkGcd4Fi0G', NULL, 'uploads/std_default.jpg', 1, 10, 1560858409, 1560858409),
(104, 5, '', '', '31303-3335546-6', 'rananaveedadocate@gmail.com', 'Parent', 'IxlTQ9WbbpHzWGOAeeMgvxngPwPFlFo7', '$2y$13$1haRZQOv4NS2293GDxd.SezhU2df1KKv7yUSgyQPQUJ0wX/pGwVjS', NULL, 'uploads/std_default.jpg', 1, 10, 1560858410, 1560858410),
(105, 5, '', '', '22222-2222222-2', '', 'Student', '_9CAiaGmBIt2Z2PiBDcMfl3XEoCQM74V', '$2y$13$cCIshrDi9WNXoHU2CU0sYO2l1vW1OaGbcDnN4EkhNNbEmp1Sf5PLC', NULL, 'uploads/std_default.jpg', 1, 10, 1560929272, 1560929272),
(106, 5, '', '', '31303-1515522-1', '', 'Parent', 'yA9T3XJdf-LSZzeJodekadzdK5Sve0iA', '$2y$13$KCP2F4Qav3LezkTHgZvMd.Xp.xLfU/oeD51mP5FNachWrb8q68H4C', NULL, 'uploads/std_default.jpg', 1, 10, 1560929273, 1560929273),
(107, 5, '', '', '', '', 'Student', 'JFqt-jyQhXr0_J81RRQK-PxFOH44rGWW', '$2y$13$HbmkjkkXliMZ2nzFtSO7fOa0z1LUT5e.ElwL3z0Qk6s8wUGR/Zfba', NULL, 'uploads/std_default.jpg', 1, 10, 1561010569, 1561010569),
(108, 5, '', '', '31303-2299367-5', '', 'Parent', 'rQDTWHPW8iMLaqps3gUEl6LO_w1r4dWA', '$2y$13$E2HRC9B6NOFWbERwy62mLu.wGRpSrTViq/Q33aNJySgHTJIV2ZeQO', NULL, 'uploads/std_default.jpg', 1, 10, 1561010570, 1561010570),
(116, 5, '', '', '33333-3333333-3', '', 'Student', 'xiWrRKC0dKpzbT-9I3uXt4Fsu7aX3TFJ', '$2y$13$CZ00v5DYJlU6cy4weLGUhO1x8wGY6iKc/U0rt8PQKvPg4ZJszvit2', NULL, 'uploads/std_default.jpg', 1, 10, 1561021680, 1561021680),
(117, 5, '', '', '33130-351303_-_', '', 'Parent', 'Af2k5QgWPJv0eF16FeLIIdg5-04slgsq', '$2y$13$vMJ8cM./gRxVhga1BRpsDOVjCItdx6PyxTQfov66bUmLIS4f9wJOS', NULL, 'uploads/std_default.jpg', 1, 10, 1561021681, 1561021681),
(118, 5, '', '', '33130-4130405-5', '', 'Student', 'KljvzOfA7A0kMYs8EGtO2kY_i5SZ8MYL', '$2y$13$nSC2IbAgtU1PeMzeWGwTW.7yll0vSA7Ksd8ed5cG8ngpYJRNMGslW', NULL, 'uploads/std_default.jpg', 1, 10, 1561023098, 1561023098),
(119, 5, '', '', '99999-9999999-9', '', 'Parent', '-uSg4oAFS2Kx1o6akU32brCP5VX-yN1Q', '$2y$13$hs7O06sh0xuVox8i4WB31uZvp2jhVKTXOFW1Z41d98LEt8Q9DOSfq', NULL, 'uploads/std_default.jpg', 1, 10, 1561023098, 1561023098),
(120, 6, '', '', '31303-8765345-6', 'nadia@gmail.com', 'Teacher', 'S179bhrL1qsOFpzxvwHvVmRpLQLMbkEe', '$2y$13$eOA/8UwFnJMp10Eejz1FpeZjvgg7WDGChcPCvugyd1sra8dDEpuXS', NULL, 'uploads/Nadia_emp_photo.jpg', 1, 10, 1561783507, 1561783507),
(121, 5, 'Syed ', 'Muzammil', 'Accountant', 'nadiagull285@gmail.com', 'Accountant', 'pCPad5pu8gAJ4pxTe3YfIVhV0vr52QTc', '$2y$13$eE2LV0SEXOpobwtgM3nMGeJOBo8GLJCclK36WW26K/E00sP5rAuj.', NULL, 'userphotos/Accountant_photo.jpg', 1, 10, 1562398188, 1562399641);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`) VALUES
(1, 'Principal'),
(2, 'Admin'),
(3, 'Vice Principal'),
(4, 'Superadmin'),
(5, 'Inquiry Head'),
(6, 'Registrar'),
(7, 'Accountant'),
(8, 'Exams Controller'),
(9, 'Student'),
(10, 'Teacher'),
(11, 'Parent'),
(12, 'Executive');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_nature`
--
ALTER TABLE `account_nature`
  ADD PRIMARY KEY (`account_nature_id`);

--
-- Indexes for table `account_register`
--
ALTER TABLE `account_register`
  ADD PRIMARY KEY (`account_register_id`),
  ADD KEY `account_register_account_nature_id` (`account_nature_id`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `trans_head_account_id` (`account_nature`),
  ADD KEY `trans_head_voucher_type_id` (`account_register_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `institute_id` (`institute_id`);

--
-- Indexes for table `concession`
--
ALTER TABLE `concession`
  ADD PRIMARY KEY (`concession_id`);

--
-- Indexes for table `custom_sms`
--
ALTER TABLE `custom_sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`designation_id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`emial_id`);

--
-- Indexes for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  ADD PRIMARY KEY (`att_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `emp_departments`
--
ALTER TABLE `emp_departments`
  ADD PRIMARY KEY (`emp_department_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `department_id` (`dept_id`);

--
-- Indexes for table `emp_designation`
--
ALTER TABLE `emp_designation`
  ADD PRIMARY KEY (`emp_designation_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `designation_id` (`designation_id`),
  ADD KEY `emp_type_id` (`emp_type_id`);

--
-- Indexes for table `emp_documents`
--
ALTER TABLE `emp_documents`
  ADD PRIMARY KEY (`emp_document_id`),
  ADD KEY `emp_info_id` (`emp_info_id`);

--
-- Indexes for table `emp_info`
--
ALTER TABLE `emp_info`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `emp_branch_id` (`emp_branch_id`),
  ADD KEY `emp_dept_id` (`emp_dept_id`);

--
-- Indexes for table `emp_leave`
--
ALTER TABLE `emp_leave`
  ADD PRIMARY KEY (`app_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `emp_reference`
--
ALTER TABLE `emp_reference`
  ADD PRIMARY KEY (`emp_ref_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `emp_type`
--
ALTER TABLE `emp_type`
  ADD PRIMARY KEY (`emp_type_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `exams_category`
--
ALTER TABLE `exams_category`
  ADD PRIMARY KEY (`exam_category_id`);

--
-- Indexes for table `exams_criteria`
--
ALTER TABLE `exams_criteria`
  ADD PRIMARY KEY (`exam_criteria_id`),
  ADD KEY `exam_category_id` (`exam_category_id`,`class_id`),
  ADD KEY `std_enroll_head_id` (`class_id`);

--
-- Indexes for table `exams_schedule`
--
ALTER TABLE `exams_schedule`
  ADD PRIMARY KEY (`exam_schedule_id`),
  ADD KEY `exam_criteria_id` (`exam_criteria_id`,`subject_id`,`emp_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `fee_month_detail`
--
ALTER TABLE `fee_month_detail`
  ADD PRIMARY KEY (`month_detail_id`);

--
-- Indexes for table `fee_transaction_detail`
--
ALTER TABLE `fee_transaction_detail`
  ADD PRIMARY KEY (`fee_trans_detail_id`),
  ADD KEY `fee_trans_detail_head_id` (`fee_trans_detail_head_id`),
  ADD KEY `fee_type_id` (`fee_type_id`);

--
-- Indexes for table `fee_transaction_head`
--
ALTER TABLE `fee_transaction_head`
  ADD PRIMARY KEY (`fee_trans_id`),
  ADD KEY `std_id` (`std_id`),
  ADD KEY `month_id` (`month`),
  ADD KEY `class_name_id` (`class_name_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `fee_type`
--
ALTER TABLE `fee_type`
  ADD PRIMARY KEY (`fee_type_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`);

--
-- Indexes for table `installment`
--
ALTER TABLE `installment`
  ADD PRIMARY KEY (`installment_id`);

--
-- Indexes for table `institute`
--
ALTER TABLE `institute`
  ADD PRIMARY KEY (`institute_id`);

--
-- Indexes for table `institute_name`
--
ALTER TABLE `institute_name`
  ADD PRIMARY KEY (`Institute_name_id`);

--
-- Indexes for table `marks_details`
--
ALTER TABLE `marks_details`
  ADD PRIMARY KEY (`marks_detail_id`),
  ADD KEY `marks_head_id` (`marks_head_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `marks_head`
--
ALTER TABLE `marks_head`
  ADD PRIMARY KEY (`marks_head_id`),
  ADD KEY `std_id` (`std_id`),
  ADD KEY `exam_criteria_id` (`exam_criteria_id`);

--
-- Indexes for table `marks_weightage_details`
--
ALTER TABLE `marks_weightage_details`
  ADD PRIMARY KEY (`weightage_detail_id`),
  ADD KEY `weightage_head_id` (`weightage_head_id`),
  ADD KEY `weightage_type_id` (`weightage_type_id`);

--
-- Indexes for table `marks_weightage_head`
--
ALTER TABLE `marks_weightage_head`
  ADD PRIMARY KEY (`marks_weightage_id`),
  ADD KEY `exam_category_id` (`exam_category_id`),
  ADD KEY `subjects_id` (`subjects_id`),
  ADD KEY `marks_weightage_head_ibfk_2` (`class_id`);

--
-- Indexes for table `marks_weightage_type`
--
ALTER TABLE `marks_weightage_type`
  ADD PRIMARY KEY (`weightage_type_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `msg_of_day`
--
ALTER TABLE `msg_of_day`
  ADD PRIMARY KEY (`msg_of_day_id`),
  ADD UNIQUE KEY `msg_details` (`msg_details`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`notice_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`sms_id`);

--
-- Indexes for table `std_academic_info`
--
ALTER TABLE `std_academic_info`
  ADD PRIMARY KEY (`academic_id`),
  ADD KEY `std_id` (`std_id`),
  ADD KEY `class_name_id` (`class_name_id`),
  ADD KEY `subject_combination` (`subject_combination`);

--
-- Indexes for table `std_attendance`
--
ALTER TABLE `std_attendance`
  ADD PRIMARY KEY (`std_attend_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `class_id` (`class_name_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `std_class_name`
--
ALTER TABLE `std_class_name`
  ADD PRIMARY KEY (`class_name_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `std_enrollment_detail`
--
ALTER TABLE `std_enrollment_detail`
  ADD PRIMARY KEY (`std_enroll_detail_id`),
  ADD KEY `std_enroll_detail_head_id` (`std_enroll_detail_head_id`),
  ADD KEY `std_enroll_detail_std_id` (`std_enroll_detail_std_id`);

--
-- Indexes for table `std_enrollment_head`
--
ALTER TABLE `std_enrollment_head`
  ADD PRIMARY KEY (`std_enroll_head_id`),
  ADD KEY `class_name_id` (`class_name_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `std_fee_details`
--
ALTER TABLE `std_fee_details`
  ADD PRIMARY KEY (`fee_id`),
  ADD KEY `std_id` (`std_id`);

--
-- Indexes for table `std_fee_installments`
--
ALTER TABLE `std_fee_installments`
  ADD PRIMARY KEY (`fee_installment_id`),
  ADD KEY `std_fee_id` (`std_fee_id`),
  ADD KEY `installment_no` (`installment_no`);

--
-- Indexes for table `std_fee_pkg`
--
ALTER TABLE `std_fee_pkg`
  ADD PRIMARY KEY (`std_fee_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `std_guardian_info`
--
ALTER TABLE `std_guardian_info`
  ADD PRIMARY KEY (`std_guardian_info_id`),
  ADD KEY `std_id` (`std_id`);

--
-- Indexes for table `std_ice_info`
--
ALTER TABLE `std_ice_info`
  ADD PRIMARY KEY (`std_ice_id`),
  ADD KEY `std_id` (`std_id`);

--
-- Indexes for table `std_inquiry`
--
ALTER TABLE `std_inquiry`
  ADD PRIMARY KEY (`std_inquiry_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `std_personal_info`
--
ALTER TABLE `std_personal_info`
  ADD PRIMARY KEY (`std_id`),
  ADD UNIQUE KEY `std_reg_no` (`std_reg_no`),
  ADD KEY `std_name` (`std_name`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `std_sections`
--
ALTER TABLE `std_sections`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `std_sessions`
--
ALTER TABLE `std_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `session_branch_id` (`session_branch_id`);

--
-- Indexes for table `std_subjects`
--
ALTER TABLE `std_subjects`
  ADD PRIMARY KEY (`std_subject_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `teacher_subject_assign_detail`
--
ALTER TABLE `teacher_subject_assign_detail`
  ADD PRIMARY KEY (`teacher_subject_assign_detail_id`),
  ADD KEY `teacher_subject_assign_detail_head_id` (`teacher_subject_assign_detail_head_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `teacher_subject_assign_head`
--
ALTER TABLE `teacher_subject_assign_head`
  ADD PRIMARY KEY (`teacher_subject_assign_head_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_nature`
--
ALTER TABLE `account_nature`
  MODIFY `account_nature_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `account_register`
--
ALTER TABLE `account_register`
  MODIFY `account_register_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `concession`
--
ALTER TABLE `concession`
  MODIFY `concession_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `custom_sms`
--
ALTER TABLE `custom_sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `emial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  MODIFY `att_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_departments`
--
ALTER TABLE `emp_departments`
  MODIFY `emp_department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emp_designation`
--
ALTER TABLE `emp_designation`
  MODIFY `emp_designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `emp_documents`
--
ALTER TABLE `emp_documents`
  MODIFY `emp_document_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_info`
--
ALTER TABLE `emp_info`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `emp_leave`
--
ALTER TABLE `emp_leave`
  MODIFY `app_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_reference`
--
ALTER TABLE `emp_reference`
  MODIFY `emp_ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `emp_type`
--
ALTER TABLE `emp_type`
  MODIFY `emp_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exams_category`
--
ALTER TABLE `exams_category`
  MODIFY `exam_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `exams_criteria`
--
ALTER TABLE `exams_criteria`
  MODIFY `exam_criteria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exams_schedule`
--
ALTER TABLE `exams_schedule`
  MODIFY `exam_schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fee_month_detail`
--
ALTER TABLE `fee_month_detail`
  MODIFY `month_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `fee_transaction_detail`
--
ALTER TABLE `fee_transaction_detail`
  MODIFY `fee_trans_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `fee_transaction_head`
--
ALTER TABLE `fee_transaction_head`
  MODIFY `fee_trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `fee_type`
--
ALTER TABLE `fee_type`
  MODIFY `fee_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `installment`
--
ALTER TABLE `installment`
  MODIFY `installment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `institute`
--
ALTER TABLE `institute`
  MODIFY `institute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `institute_name`
--
ALTER TABLE `institute_name`
  MODIFY `Institute_name_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marks_details`
--
ALTER TABLE `marks_details`
  MODIFY `marks_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `marks_head`
--
ALTER TABLE `marks_head`
  MODIFY `marks_head_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `marks_weightage_details`
--
ALTER TABLE `marks_weightage_details`
  MODIFY `weightage_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `marks_weightage_head`
--
ALTER TABLE `marks_weightage_head`
  MODIFY `marks_weightage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `marks_weightage_type`
--
ALTER TABLE `marks_weightage_type`
  MODIFY `weightage_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `msg_of_day`
--
ALTER TABLE `msg_of_day`
  MODIFY `msg_of_day_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `sms_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `std_academic_info`
--
ALTER TABLE `std_academic_info`
  MODIFY `academic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=469;

--
-- AUTO_INCREMENT for table `std_attendance`
--
ALTER TABLE `std_attendance`
  MODIFY `std_attend_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `std_class_name`
--
ALTER TABLE `std_class_name`
  MODIFY `class_name_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `std_enrollment_detail`
--
ALTER TABLE `std_enrollment_detail`
  MODIFY `std_enroll_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=435;

--
-- AUTO_INCREMENT for table `std_enrollment_head`
--
ALTER TABLE `std_enrollment_head`
  MODIFY `std_enroll_head_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `std_fee_details`
--
ALTER TABLE `std_fee_details`
  MODIFY `fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=462;

--
-- AUTO_INCREMENT for table `std_fee_installments`
--
ALTER TABLE `std_fee_installments`
  MODIFY `fee_installment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `std_fee_pkg`
--
ALTER TABLE `std_fee_pkg`
  MODIFY `std_fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `std_guardian_info`
--
ALTER TABLE `std_guardian_info`
  MODIFY `std_guardian_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=469;

--
-- AUTO_INCREMENT for table `std_ice_info`
--
ALTER TABLE `std_ice_info`
  MODIFY `std_ice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=469;

--
-- AUTO_INCREMENT for table `std_inquiry`
--
ALTER TABLE `std_inquiry`
  MODIFY `std_inquiry_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `std_personal_info`
--
ALTER TABLE `std_personal_info`
  MODIFY `std_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=476;

--
-- AUTO_INCREMENT for table `std_sections`
--
ALTER TABLE `std_sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `std_sessions`
--
ALTER TABLE `std_sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `std_subjects`
--
ALTER TABLE `std_subjects`
  MODIFY `std_subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `teacher_subject_assign_detail`
--
ALTER TABLE `teacher_subject_assign_detail`
  MODIFY `teacher_subject_assign_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_subject_assign_head`
--
ALTER TABLE `teacher_subject_assign_head`
  MODIFY `teacher_subject_assign_head_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_register`
--
ALTER TABLE `account_register`
  ADD CONSTRAINT `account_register_ibfk_1` FOREIGN KEY (`account_nature_id`) REFERENCES `account_nature` (`account_nature_id`);

--
-- Constraints for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD CONSTRAINT `account_transactions_ibfk_2` FOREIGN KEY (`account_register_id`) REFERENCES `account_register` (`account_register_id`),
  ADD CONSTRAINT `account_transactions_ibfk_3` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_ibfk_1` FOREIGN KEY (`institute_id`) REFERENCES `institute` (`institute_id`);

--
-- Constraints for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  ADD CONSTRAINT `emp_attendance_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_info` (`emp_id`),
  ADD CONSTRAINT `emp_attendance_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `emp_departments`
--
ALTER TABLE `emp_departments`
  ADD CONSTRAINT `emp_departments_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`department_id`),
  ADD CONSTRAINT `emp_departments_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `emp_info` (`emp_id`);

--
-- Constraints for table `emp_designation`
--
ALTER TABLE `emp_designation`
  ADD CONSTRAINT `emp_designation_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_info` (`emp_id`),
  ADD CONSTRAINT `emp_designation_ibfk_2` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`designation_id`),
  ADD CONSTRAINT `emp_designation_ibfk_3` FOREIGN KEY (`emp_type_id`) REFERENCES `emp_type` (`emp_type_id`);

--
-- Constraints for table `emp_documents`
--
ALTER TABLE `emp_documents`
  ADD CONSTRAINT `emp_documents_ibfk_1` FOREIGN KEY (`emp_info_id`) REFERENCES `emp_info` (`emp_id`);

--
-- Constraints for table `emp_info`
--
ALTER TABLE `emp_info`
  ADD CONSTRAINT `emp_info_ibfk_1` FOREIGN KEY (`emp_branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `emp_leave`
--
ALTER TABLE `emp_leave`
  ADD CONSTRAINT `emp_leave_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `emp_leave_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `emp_info` (`emp_id`);

--
-- Constraints for table `emp_reference`
--
ALTER TABLE `emp_reference`
  ADD CONSTRAINT `emp_reference_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_info` (`emp_id`);

--
-- Constraints for table `fee_transaction_detail`
--
ALTER TABLE `fee_transaction_detail`
  ADD CONSTRAINT `fee_transaction_detail_ibfk_1` FOREIGN KEY (`fee_trans_detail_head_id`) REFERENCES `fee_month_detail` (`month_detail_id`),
  ADD CONSTRAINT `fee_transaction_detail_ibfk_2` FOREIGN KEY (`fee_type_id`) REFERENCES `fee_type` (`fee_type_id`);

--
-- Constraints for table `fee_transaction_head`
--
ALTER TABLE `fee_transaction_head`
  ADD CONSTRAINT `fee_transaction_head_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `fee_transaction_head_ibfk_2` FOREIGN KEY (`class_name_id`) REFERENCES `std_class_name` (`class_name_id`),
  ADD CONSTRAINT `fee_transaction_head_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `std_sessions` (`session_id`),
  ADD CONSTRAINT `fee_transaction_head_ibfk_4` FOREIGN KEY (`section_id`) REFERENCES `std_sections` (`section_id`),
  ADD CONSTRAINT `fee_transaction_head_ibfk_5` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`);

--
-- Constraints for table `std_academic_info`
--
ALTER TABLE `std_academic_info`
  ADD CONSTRAINT `std_academic_info_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`),
  ADD CONSTRAINT `std_academic_info_ibfk_2` FOREIGN KEY (`class_name_id`) REFERENCES `std_class_name` (`class_name_id`),
  ADD CONSTRAINT `std_academic_info_ibfk_3` FOREIGN KEY (`subject_combination`) REFERENCES `std_subjects` (`std_subject_id`);

--
-- Constraints for table `std_attendance`
--
ALTER TABLE `std_attendance`
  ADD CONSTRAINT `std_attendance_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `std_attendance_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `std_personal_info` (`std_id`),
  ADD CONSTRAINT `std_attendance_ibfk_3` FOREIGN KEY (`class_name_id`) REFERENCES `std_class_name` (`class_name_id`),
  ADD CONSTRAINT `std_attendance_ibfk_4` FOREIGN KEY (`session_id`) REFERENCES `std_sessions` (`session_id`),
  ADD CONSTRAINT `std_attendance_ibfk_5` FOREIGN KEY (`section_id`) REFERENCES `std_sections` (`section_id`),
  ADD CONSTRAINT `std_attendance_ibfk_6` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `std_attendance_ibfk_7` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_subject_assign_head` (`teacher_subject_assign_head_id`);

--
-- Constraints for table `std_class_name`
--
ALTER TABLE `std_class_name`
  ADD CONSTRAINT `std_class_name_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `std_enrollment_detail`
--
ALTER TABLE `std_enrollment_detail`
  ADD CONSTRAINT `std_enrollment_detail_ibfk_1` FOREIGN KEY (`std_enroll_detail_head_id`) REFERENCES `std_enrollment_head` (`std_enroll_head_id`),
  ADD CONSTRAINT `std_enrollment_detail_ibfk_2` FOREIGN KEY (`std_enroll_detail_std_id`) REFERENCES `std_personal_info` (`std_id`);

--
-- Constraints for table `std_enrollment_head`
--
ALTER TABLE `std_enrollment_head`
  ADD CONSTRAINT `std_enrollment_head_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `std_enrollment_head_ibfk_2` FOREIGN KEY (`class_name_id`) REFERENCES `std_class_name` (`class_name_id`),
  ADD CONSTRAINT `std_enrollment_head_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `std_sessions` (`session_id`),
  ADD CONSTRAINT `std_enrollment_head_ibfk_4` FOREIGN KEY (`section_id`) REFERENCES `std_sections` (`section_id`);

--
-- Constraints for table `std_fee_details`
--
ALTER TABLE `std_fee_details`
  ADD CONSTRAINT `std_fee_details_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`);

--
-- Constraints for table `std_fee_installments`
--
ALTER TABLE `std_fee_installments`
  ADD CONSTRAINT `std_fee_installments_ibfk_1` FOREIGN KEY (`installment_no`) REFERENCES `installment` (`installment_id`);

--
-- Constraints for table `std_fee_pkg`
--
ALTER TABLE `std_fee_pkg`
  ADD CONSTRAINT `std_fee_pkg_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `std_sessions` (`session_id`),
  ADD CONSTRAINT `std_fee_pkg_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `std_class_name` (`class_name_id`);

--
-- Constraints for table `std_guardian_info`
--
ALTER TABLE `std_guardian_info`
  ADD CONSTRAINT `std_guardian_info_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`);

--
-- Constraints for table `std_ice_info`
--
ALTER TABLE `std_ice_info`
  ADD CONSTRAINT `std_ice_info_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`);

--
-- Constraints for table `std_inquiry`
--
ALTER TABLE `std_inquiry`
  ADD CONSTRAINT `std_inquiry_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `std_personal_info`
--
ALTER TABLE `std_personal_info`
  ADD CONSTRAINT `std_personal_info_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `std_sections`
--
ALTER TABLE `std_sections`
  ADD CONSTRAINT `std_sections_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `std_class_name` (`class_name_id`),
  ADD CONSTRAINT `std_sections_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `std_sections_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `std_sessions` (`session_id`);

--
-- Constraints for table `std_sessions`
--
ALTER TABLE `std_sessions`
  ADD CONSTRAINT `std_sessions_ibfk_1` FOREIGN KEY (`session_branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `std_subjects`
--
ALTER TABLE `std_subjects`
  ADD CONSTRAINT `std_subjects_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `std_class_name` (`class_name_id`);

--
-- Constraints for table `teacher_subject_assign_detail`
--
ALTER TABLE `teacher_subject_assign_detail`
  ADD CONSTRAINT `teacher_subject_assign_detail_ibfk_1` FOREIGN KEY (`teacher_subject_assign_detail_head_id`) REFERENCES `teacher_subject_assign_head` (`teacher_subject_assign_head_id`),
  ADD CONSTRAINT `teacher_subject_assign_detail_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `std_enrollment_head` (`std_enroll_head_id`),
  ADD CONSTRAINT `teacher_subject_assign_detail_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

--
-- Constraints for table `teacher_subject_assign_head`
--
ALTER TABLE `teacher_subject_assign_head`
  ADD CONSTRAINT `teacher_subject_assign_head_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `emp_info` (`emp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

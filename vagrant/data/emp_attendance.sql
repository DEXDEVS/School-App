-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2019 at 06:42 AM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

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

--
-- Dumping data for table `emp_attendance`
--

INSERT INTO `emp_attendance` (`att_id`, `branch_id`, `emp_id`, `att_date`, `check_in`, `check_out`, `attendance`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 5, 2, '2019-04-01', '10:34:36', '10:38:53', 'P', 1, 1, '2019-04-26 08:34:36', '2019-04-26 08:38:53'),
(4, 5, 1, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(5, 5, 3, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(6, 5, 4, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(7, 5, 5, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(8, 5, 6, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(9, 5, 7, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(10, 5, 8, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(11, 5, 9, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(12, 5, 11, '2019-04-01', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 08:46:43', '0000-00-00 00:00:00'),
(13, 5, 1, '2019-04-26', '00:00:00', '00:00:00', 'L', 1, 0, '2019-04-26 15:34:22', '0000-00-00 00:00:00'),
(14, 5, 1, '2019-04-27', '00:00:00', '00:00:00', 'L', 1, 0, '2019-04-26 15:34:22', '0000-00-00 00:00:00'),
(15, 5, 1, '2019-04-28', '00:00:00', '00:00:00', 'L', 1, 0, '2019-04-26 15:34:22', '0000-00-00 00:00:00'),
(16, 5, 3, '2019-04-26', '21:24:55', NULL, 'P', 1, 0, '2019-04-26 19:24:55', '0000-00-00 00:00:00'),
(17, 5, 2, '2019-04-26', '00:00:00', '00:00:00', 'A', 1, 1, '2019-04-26 19:34:06', '2019-04-26 19:36:26'),
(18, 5, 4, '2019-04-26', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 19:34:06', '0000-00-00 00:00:00'),
(19, 5, 5, '2019-04-26', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 19:34:06', '0000-00-00 00:00:00'),
(20, 5, 6, '2019-04-26', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 19:34:06', '0000-00-00 00:00:00'),
(21, 5, 7, '2019-04-26', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 19:34:06', '0000-00-00 00:00:00'),
(22, 5, 8, '2019-04-26', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 19:34:06', '0000-00-00 00:00:00'),
(23, 5, 9, '2019-04-26', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 19:34:06', '0000-00-00 00:00:00'),
(24, 5, 11, '2019-04-26', '00:00:00', '00:00:00', 'A', 1, 0, '2019-04-26 19:34:06', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  ADD PRIMARY KEY (`att_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  MODIFY `att_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  ADD CONSTRAINT `emp_attendance_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_info` (`emp_id`),
  ADD CONSTRAINT `emp_attendance_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

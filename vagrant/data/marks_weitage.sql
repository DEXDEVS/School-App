-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2019 at 11:29 AM
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
-- Table structure for table `marks_weitage`
--

CREATE TABLE `marks_weitage` (
  `marks_weitage_id` int(11) NOT NULL,
  `exam_category_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `presentation` int(5) NOT NULL,
  `assignment` int(5) NOT NULL,
  `attendance` int(5) NOT NULL,
  `dressing` int(5) NOT NULL,
  `theory` int(5) NOT NULL,
  `practical` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks_weitage`
--

INSERT INTO `marks_weitage` (`marks_weitage_id`, `exam_category_id`, `subject_id`, `presentation`, `assignment`, `attendance`, `dressing`, `theory`, `practical`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 5, 1, 5, 5, 5, 5, 80, 0, '2019-04-07 17:58:09', '0000-00-00 00:00:00', 1, 0),
(2, 5, 2, 5, 5, 5, 5, 80, 0, '2019-04-07 17:58:26', '0000-00-00 00:00:00', 1, 0),
(3, 5, 4, 5, 5, 5, 5, 80, 0, '2019-04-07 17:58:40', '0000-00-00 00:00:00', 1, 0),
(4, 5, 7, 5, 5, 5, 5, 30, 0, '2019-04-07 17:59:09', '0000-00-00 00:00:00', 1, 0),
(5, 5, 9, 5, 5, 5, 5, 30, 0, '2019-04-07 18:19:07', '0000-00-00 00:00:00', 1, 0),
(6, 5, 10, 5, 5, 5, 5, 50, 30, '2019-04-07 18:19:26', '0000-00-00 00:00:00', 1, 0),
(7, 5, 8, 5, 5, 5, 5, 50, 30, '2019-04-08 08:05:41', '0000-00-00 00:00:00', 1, 0),
(8, 5, 13, 5, 5, 5, 5, 60, 20, '2019-04-08 08:06:24', '0000-00-00 00:00:00', 1, 0),
(9, 5, 12, 5, 5, 5, 5, 60, 20, '2019-04-08 08:06:40', '0000-00-00 00:00:00', 1, 0),
(10, 5, 3, 5, 5, 5, 5, 80, 0, '2019-04-08 08:07:01', '0000-00-00 00:00:00', 1, 0),
(11, 5, 5, 5, 5, 5, 5, 80, 0, '2019-04-08 08:07:13', '0000-00-00 00:00:00', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `marks_weitage`
--
ALTER TABLE `marks_weitage`
  ADD PRIMARY KEY (`marks_weitage_id`),
  ADD KEY `std_enroll_head_id` (`exam_category_id`,`subject_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `marks_weitage`
--
ALTER TABLE `marks_weitage`
  MODIFY `marks_weitage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `marks_weitage`
--
ALTER TABLE `marks_weitage`
  ADD CONSTRAINT `marks_weitage_ibfk_1` FOREIGN KEY (`exam_category_id`) REFERENCES `exams_category` (`exam_category_id`),
  ADD CONSTRAINT `marks_weitage_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

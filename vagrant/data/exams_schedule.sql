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
-- Table structure for table `exams_schedule`
--

CREATE TABLE `exams_schedule` (
  `exam_schedule_id` int(11) NOT NULL,
  `exam_criteria_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
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

INSERT INTO `exams_schedule` (`exam_schedule_id`, `exam_criteria_id`, `subject_id`, `emp_id`, `date`, `full_marks`, `passing_marks`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(7, 1, 1, 1, '2019-04-08', 100, 33, 'result prepared', '2019-04-09 06:29:12', '2019-04-08 07:48:36', 1, 1),
(8, 1, 2, 3, '2019-04-09', 100, 33, 'result prepared', '2019-04-09 06:29:35', '2019-04-08 07:48:36', 1, 1),
(9, 1, 4, 4, '2019-04-10', 100, 33, '', '2019-04-09 08:22:11', '2019-04-08 07:48:36', 1, 1),
(10, 1, 9, 4, '2019-04-11', 50, 17, '', '2019-04-08 07:48:36', '2019-04-08 07:48:36', 1, 1),
(11, 1, 7, 5, '2019-04-13', 50, 17, '', '2019-04-08 07:48:36', '2019-04-08 07:48:36', 1, 1),
(12, 1, 10, 8, '2019-04-16', 100, 33, '', '2019-04-08 07:48:36', '2019-04-08 07:48:36', 1, 1),
(21, 9, 8, 1, '2019-04-08', 100, 33, '', '2019-04-08 17:39:13', '2019-04-08 17:39:13', 1, 1),
(22, 9, 13, 3, '2019-04-09', 100, 33, '', '2019-04-08 17:39:13', '2019-04-08 17:39:13', 1, 1),
(23, 9, 12, 5, '2019-04-10', 100, 33, '', '2019-04-08 17:39:13', '2019-04-08 17:39:13', 1, 1),
(24, 9, 2, 6, '2019-04-11', 100, 33, '', '2019-04-08 17:39:13', '2019-04-08 17:39:13', 1, 1),
(25, 9, 3, 6, '2019-04-12', 100, 33, '', '2019-04-08 17:39:13', '2019-04-08 17:39:13', 1, 1),
(26, 9, 4, 8, '2019-04-12', 100, 33, '', '2019-04-08 17:39:13', '2019-04-08 17:39:13', 1, 1),
(27, 9, 5, 5, '2019-04-15', 100, 33, '', '2019-04-08 17:39:13', '2019-04-08 17:39:13', 1, 1),
(28, 9, 1, 11, '2019-04-17', 100, 33, '', '2019-04-08 17:39:13', '2019-04-08 17:39:13', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exams_schedule`
--
ALTER TABLE `exams_schedule`
  ADD PRIMARY KEY (`exam_schedule_id`),
  ADD KEY `exam_criteria_id` (`exam_criteria_id`,`subject_id`,`emp_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exams_schedule`
--
ALTER TABLE `exams_schedule`
  MODIFY `exam_schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `exams_schedule`
--
ALTER TABLE `exams_schedule`
  ADD CONSTRAINT `exams_schedule_ibfk_1` FOREIGN KEY (`exam_criteria_id`) REFERENCES `exams_criteria` (`exam_criteria_id`),
  ADD CONSTRAINT `exams_schedule_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `exams_schedule_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `emp_info` (`emp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

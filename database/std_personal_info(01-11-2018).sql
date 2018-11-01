-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2018 at 07:53 AM
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
-- Table structure for table `std_personal_info`
--

CREATE TABLE `std_personal_info` (
  `std_id` int(11) NOT NULL,
  `std_name` varchar(50) NOT NULL,
  `std_contact_no` varchar(15) NOT NULL,
  `std_DOB` date NOT NULL,
  `std_gender` enum('Male','Female') NOT NULL,
  `std_permanent_address` varchar(255) NOT NULL,
  `std_temporary_address` varchar(255) NOT NULL,
  `std_email` varchar(84) NOT NULL,
  `std_photo` varchar(200) NOT NULL,
  `std_b_form` varchar(255) NOT NULL,
  `std_district` varchar(50) NOT NULL,
  `std_religion` varchar(50) NOT NULL,
  `std_nationality` varchar(50) NOT NULL,
  `std_tehseel` varchar(50) NOT NULL,
  `std_total_fee` double NOT NULL,
  `std_fee_discount` double NOT NULL,
  `std_net_fee` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_personal_info`
--

INSERT INTO `std_personal_info` (`std_id`, `std_name`, `std_contact_no`, `std_DOB`, `std_gender`, `std_permanent_address`, `std_temporary_address`, `std_email`, `std_photo`, `std_b_form`, `std_district`, `std_religion`, `std_nationality`, `std_tehseel`, `std_total_fee`, `std_fee_discount`, `std_net_fee`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Kinza', '0300 1234567', '0000-00-00', 'Female', 'RYK', 'RYK', 'kinza@gmail.com', '', '12345-1234567-1', 'RYK', 'Islam', 'Pakistani', 'RYK', 0, 0, 0, '2018-10-10 13:10:34', '0000-00-00 00:00:00', 1, 0),
(2, 'Nadia', '0300 1234567', '2018-10-29', 'Female', 'RYK', 'RYK', 'nadia@gmail.com', '', '12345-6789123-4', 'RYK', 'RYK', 'Pakistan', 'Islam', 0, 0, 0, '2018-10-10 13:34:26', '0000-00-00 00:00:00', 1, 0),
(3, 'Noman', '+12-345-6789123', '2018-10-10', 'Male', 'RYK', 'RYK', 'nomi@gmail.com', '', '12345-6789123-4', 'RYK', 'Islam', 'Pakistani', 'RYK', 0, 0, 0, '2018-10-10 14:05:12', '0000-00-00 00:00:00', 1, 0),
(4, 'Ali', '+56-234-6789098', '2018-10-27', 'Male', 'seuh', 'hggyu', 'hiuuhi', '', '23456-7890987-6', 'jbjbj', 'knk', 'jjj', 'jhjh', 0, 0, 0, '2018-10-27 08:21:09', '0000-00-00 00:00:00', 1, 0),
(5, 'Hamza', '+35-678-9009876', '2018-10-27', 'Male', 'tghjk', 'lkokjo', '4567kpok', 'uploads/Hamza_photo.jpg', '23678-7654345-6', 'dfhjk', 'jojoj', 'jjoijho', 'hukhukhk', 0, 0, 0, '2018-11-01 06:49:57', '2018-11-01 06:49:57', 1, 1),
(6, 'Qasim', '+38-909-8765445', '2018-10-27', 'Male', 'dtrjhhi iyhiuh ', 'huihuii uihui', 'hiuhuihuiu', '', '23678-8765434-5', 'vhg ghjhl ', 'u uiuigug ', 'gyugfu gyuguilui ', 'yuyugul gygyugul ', 0, 0, 0, '2018-10-27 08:22:15', '0000-00-00 00:00:00', 1, 0),
(7, 'Anas Shafqat', '+92-331-7375027', '2018-10-27', 'Male', 'Gulshan Iqbal, Rahim Yar Khan', 'Gulshan Iqbal, Rahim Yar Khan', 'ihuih ', 'uploads/Anas Shafqat_photo.jpg', '23467-8987655-6', 'drtyu ', 'yhiopjh iuhui ', 'rtyuijhh ', 'tyguhjioog', 2500, 200, 2300, '2018-11-01 06:48:42', '2018-11-01 06:48:42', 1, 1),
(8, 'Zia Ali', '+12-345-6789098', '2009-06-09', 'Male', 'Gulshan Iqbal, Rahim Yar Khan', 'Gulshan Iqbal, Rahim Yar Khan', 'zia@gmail.com', 'uploads/Zia Ali_photo.jpg', '12345-6789876-5', 'Rahim Yar Khan', 'Islam', 'Pakistani', 'Rahim Yar Khan', 2500, 200, 2300, '2018-11-01 06:31:39', '0000-00-00 00:00:00', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `std_personal_info`
--
ALTER TABLE `std_personal_info`
  ADD PRIMARY KEY (`std_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `std_personal_info`
--
ALTER TABLE `std_personal_info`
  MODIFY `std_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

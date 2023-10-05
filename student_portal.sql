-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2020 at 10:13 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(255) NOT NULL,
  `Files` varchar(1000) DEFAULT NULL,
  `realName` varchar(1000) DEFAULT NULL,
  `Url` varchar(1000) DEFAULT NULL,
  `types` varchar(1000) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `Created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `Files`, `realName`, `Url`, `types`, `user_email`, `Created_at`) VALUES
(7, 'https://www.fiverr.com/users/muhammadumai515/seller_dashboard', 'Muhammad Usama', NULL, 'url', 'MuhammadUmaira98@gmail.com', '2020-12-28'),
(9, '1609348454188.pdf', 'Physics Exam', NULL, 'file', 'MuhammadUmaira98@gmail.com', '2020-12-30'),
(10, 'https://www.fiverr.com/inbox/idanpin', 'Muhammad Usama', NULL, 'url', 'MuhammadUmaira98@gmail.com', '2020-12-30'),
(11, 'https://www.fiverr.com/inbox/idanpin', 'Kala Macha', NULL, 'url', 'MuhammadUmaira98@gmail.com', '2020-12-30'),
(12, '1609349069565.pdf', 'Muhammad Usama', NULL, 'file', 'MuhammadUmaira98@gmail.com', '2020-12-30'),
(13, '1609349069565.pdf', 'Muhammad Usama', NULL, 'url', 'MuhammadUmaira98@gmail.com', '2020-12-30'),
(14, 'http://localhost:8080/', 'Usman', NULL, 'url', 'MuhammadUmaira98@gmail.com', '2020-12-30'),
(15, 'http://localhost:8080/', 'Usman', NULL, 'url', 'MuhammadUmaira98@gmail.com', '2020-12-30'),
(16, '1609349326930.pdf', 'Usman', NULL, 'file', 'MuhammadUmaira98@gmail.com', '2020-12-30'),
(17, '1609349326930.pdf', 'Usman', NULL, 'url', 'MuhammadUmaira98@gmail.com', '2020-12-30'),
(18, '1609349515311.pdf', 'Apke', NULL, 'file', 'MuhammadUmaira98@gmail.com', '2020-12-30'),
(19, '1609349515311.pdf', 'Apke', NULL, 'url', 'MuhammadUmaira98@gmail.com', '2020-12-30'),
(20, '1609351484041.pdf', 'Kala Macha', NULL, 'file', 'MuhammadUmaira98@gmail.com', '2020-12-30'),
(21, 'https://www.w3schools.com/nodejs/nodejs_mysql_join.asp', 'Kala Macha', NULL, 'url', 'MuhammadUmaira98@gmail.com', '2020-12-30'),
(22, 'https://www.w3schools.com/nodejs/nodejs_mysql_join.asp', 'Kala Macha', NULL, 'url', 'MuhammadUmaira98@gmail.com', '2020-12-30'),
(23, 'https://www.w3schools.com/nodejs/nodejs_mysql_join.asp', 'umair', NULL, 'url', 'MuhammadUmaira98@gmail.com', '2020-12-30');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(255) NOT NULL,
  `files_id` int(255) NOT NULL,
  `review` varchar(1000) NOT NULL,
  `user_email` varchar(1000) NOT NULL,
  `feedback` mediumtext NOT NULL,
  `created_at` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `files_id`, `review`, `user_email`, `feedback`, `created_at`) VALUES
(2, 7, '10', 'MuhammadUmaira6798@gmail.com', 'ok', '2020-12-29'),
(3, 11, '6', 'MuhammadUmaira98@gmail.com', 'GREAT', '2020-12-30'),
(4, 7, '10', 'MuhammadUmaira98@gmail.com', 'GREAT', '2020-12-30'),
(5, 7, '10', 'MuhammadUmaira98@gmail.com', 'GREAT', '2020-12-30');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `Email` varchar(1000) NOT NULL,
  `Password` varchar(1000) NOT NULL,
  `Subject` varchar(1000) DEFAULT NULL,
  `Created_at` varchar(1000) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `Email`, `Password`, `Subject`, `Created_at`) VALUES
(53, 'MuhammadUmaira98@gmail.com', '12345678', 'What is it?', '2020-12-29 14:05:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Email` (`Email`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

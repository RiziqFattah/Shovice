-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2021 at 04:49 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `login`
--

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `req_name` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `scope` varchar(25) DEFAULT NULL,
  `price` varchar(60) NOT NULL,
  `location` varchar(120) NOT NULL,
  `description` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `req_name`, `type`, `scope`, `price`, `location`, `description`) VALUES
(1, 'buy mask', 'health care', 'health care', '', '', ''),
(2, 'aaa', 'aaaa', 'aaa', '', '', ''),
(3, 'please buy me mask', 'health care', 'health care', '', '', ''),
(4, 'buy shoes', 'necessity', 'nike shoes', '300', 'aeon', 'aeon'),
(5, 'asdsa', 'asdas', 'asda', 'asdas', 'asda', 'asdas'),
(6, 'buy flower', 'flourist', 'rose flower', '25', 'bekasi', 'bekasi'),
(7, 'buy sun glasses', 'necessity', 'jennie glasses', '1000', 'jakarta', 'jakarta'),
(8, 'buy flower', 'flourist', 'sunflower', '40', 'johor bahru', 'johor bahru'),
(9, 'buy pen', 'stationary', 'blue pen', '2', 'skudai market', 'skudai market aeon');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'ADMIN'),
(2, 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `fullname` varchar(60) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `matric` varchar(60) NOT NULL,
  `gender` varchar(15) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(60) NOT NULL,
  `faculty` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `fullname`, `enabled`, `matric`, `gender`, `phone`, `address`, `faculty`) VALUES
(3, 'anzul@gmail.com', '$2a$10$UATisoMI/a7V4j5DHKZAIew4zLjGHG.WYmRzECDH45Fc1ZKeBw812', 'angelia', 1, '', '', '', '', ''),
(4, 'angelia30@gmail.com', '$2a$10$Q3QfSe7f5XFAFYrI0g00me9SluirnytQZ/isE1aBlr0IQph2Oycty', 'angeliahasan', 1, '', '', '', '', ''),
(5, 'nini@gmail.com', '$2a$10$Yqh/iUp3vlZXV9J9iWSZ1eAXognD5uJNStwrOpw./nYNW3KtjQ1L.', 'nini', 1, '', '', '', '', ''),
(6, 'lulu@gmail.com', '$2a$10$alVWwR.QW.4Bt3fD861LYOtAP.Mol/s2TJIbjUPdaezZynGupZt9W', 'lulu', 1, '', '', '', '', ''),
(7, 'nano@gmail.com', '$2a$10$cwfpd0VhFK7fET5G1PmFIOJ3ZZ0EPn7bil3Ftmm3.6iXbvNb6BEy2', 'nano sawadikap', 1, '', '', '', '', ''),
(8, 'jennie@gmail.com', '$2a$10$mCFmj5Orxmg/Shp9v2Nkh.wdrFskxP6LDSsd5BGbCNmTibKfYmya.', 'jennie', 1, 'A17CS0245', 'Female', '08134124', 'seoul', 'Faculty Engineering'),
(9, 'lisa@gmail.com', '$2a$10$u7An40tTVC2Z/FWwbkxfnenEQ.JBcfVPIxQfyuTTnUgScxvyGuNEC', 'lisa', 1, 'A17CS0234', 'Female', '081242132412', 'jakarta', 'Faculty of Science'),
(10, 'jisoo@gmail.com', '$2a$10$dRqX6Z1YqWQUacPDRj2eLePfS6C2Zx5R1PHVn8sR0atd4RYitiGte', 'jisoo', 1, 'A17CS9890', 'Female', '0814214242', 'jakarta', 'Faculty of Science');

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users_roles`
--
ALTER TABLE `users_roles`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2024 at 10:29 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `ACCOUNT_NO` int(38) NOT NULL,
  `ACCOUNT_TYPE` varchar(38) NOT NULL,
  `BALANCE` int(38) NOT NULL,
  `cust_id` varchar(38) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `BANK_NAME` varchar(30) NOT NULL,
  `BRANCH_NAME` varchar(30) NOT NULL,
  `BRANCH_CODE` int(38) NOT NULL,
  `BRANCH_ADDRESS` varchar(44) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` varchar(30) NOT NULL,
  `cust_name` varchar(30) NOT NULL,
  `DOB` date NOT NULL,
  `GENDER` varchar(10) NOT NULL,
  `MOB_NO` int(38) NOT NULL,
  `CUST_ADDRESS` varchar(44) NOT NULL,
  `BRANCH_CODE` int(38) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transation`
--

CREATE TABLE `transation` (
  `Trans_id` varchar(38) NOT NULL,
  `Trans_TYP` varchar(38) NOT NULL,
  `Amount` int(38) NOT NULL,
  `Trans_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ACCOUNT_NO` int(38) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ACCOUNT_NO`),
  ADD KEY `fk_custid` (`cust_id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`BRANCH_CODE`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`),
  ADD KEY `fk_branch_code` (`BRANCH_CODE`);

--
-- Indexes for table `transation`
--
ALTER TABLE `transation`
  ADD PRIMARY KEY (`Trans_id`),
  ADD KEY `fk_ACC_NO` (`ACCOUNT_NO`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `fk_custid` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_branch_code` FOREIGN KEY (`BRANCH_CODE`) REFERENCES `branch` (`BRANCH_CODE`);

--
-- Constraints for table `transation`
--
ALTER TABLE `transation`
  ADD CONSTRAINT `fk_ACC_NO` FOREIGN KEY (`ACCOUNT_NO`) REFERENCES `account` (`ACCOUNT_NO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

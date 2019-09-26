-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 25, 2019 at 02:31 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TravelSystemDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id` int(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Contienent`
--

CREATE TABLE `Contienent` (
  `id` int(10) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Countries`
--

CREATE TABLE `Countries` (
  `id` int(10) NOT NULL,
  `cont_id` int(10) NOT NULL,
  `package_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Packages`
--

CREATE TABLE `Packages` (
  `id` int(10) NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` text NOT NULL,
  `meal_plan` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `hotel_type` varchar(80) NOT NULL,
  `room_type` varchar(80) NOT NULL,
  `includes` varchar(80) NOT NULL,
  `excludes` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Sliders`
--

CREATE TABLE `Sliders` (
  `id` int(10) NOT NULL,
  `image` varchar(60) NOT NULL,
  `text` varchar(150) NOT NULL,
  `package_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Tours`
--

CREATE TABLE `Tours` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price_adult` float NOT NULL,
  `price_child` float NOT NULL,
  `duration` int(10) NOT NULL,
  `days` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Tour_Desc`
--

CREATE TABLE `Tour_Desc` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(60) NOT NULL,
  `tour_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_offer`
--

CREATE TABLE `user_offer` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `date` date NOT NULL,
  `package_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_tours`
--

CREATE TABLE `user_tours` (
  `id` int(10) NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `date` date NOT NULL,
  `tour_id` int(10) NOT NULL,
  `persons` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Contienent`
--
ALTER TABLE `Contienent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Countries`
--
ALTER TABLE `Countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `cont_id` (`cont_id`);

--
-- Indexes for table `Packages`
--
ALTER TABLE `Packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Sliders`
--
ALTER TABLE `Sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `Tours`
--
ALTER TABLE `Tours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Tour_Desc`
--
ALTER TABLE `Tour_Desc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tour_id` (`tour_id`);

--
-- Indexes for table `user_offer`
--
ALTER TABLE `user_offer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `user_tours`
--
ALTER TABLE `user_tours`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `tour_id` (`tour_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Countries`
--
ALTER TABLE `Countries`
  ADD CONSTRAINT `Countries_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `Packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Countries_ibfk_2` FOREIGN KEY (`cont_id`) REFERENCES `Contienent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Sliders`
--
ALTER TABLE `Sliders`
  ADD CONSTRAINT `Sliders_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `Packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Tour_Desc`
--
ALTER TABLE `Tour_Desc`
  ADD CONSTRAINT `Tour_Desc_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `Tours` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_offer`
--
ALTER TABLE `user_offer`
  ADD CONSTRAINT `user_offer_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `Packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_tours`
--
ALTER TABLE `user_tours`
  ADD CONSTRAINT `user_tours_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `Tours` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

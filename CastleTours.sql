-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 26, 2019 at 01:14 PM
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
-- Database: `CastleTours`
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
  `days` int(11) NOT NULL,
  `nights` int(11) NOT NULL,
  `image` varchar(60) NOT NULL,
  `best` int(11) NOT NULL,
  `hotel_type` varchar(80) NOT NULL,
  `room_type` varchar(80) NOT NULL,
  `includes` varchar(80) NOT NULL,
  `excludes` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Packages`
--

INSERT INTO `Packages` (`id`, `name`, `description`, `meal_plan`, `price`, `days`, `nights`, `image`, `best`, `hotel_type`, `room_type`, `includes`, `excludes`) VALUES
(1, 'Santorini, Greece', 'asdasda', 'AE', 100, 5, 4, 'images/01-greece.jpg', 0, '5', 'Double', 'meals', 'wifi'),
(2, 'Rome, Italy', '', '', 1000, 6, 5, 'images/02-rome.jpg', 0, '', '', '', ''),
(3, 'Mount Fuji, Japan', '', '', 1000, 5, 4, 'images/03-japan.jpg', 0, '', '', '', ''),
(4, 'Camels, Dubai', '', '', 2000, 6, 5, 'images/04-dubai.jpg', 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `Sliders`
--

CREATE TABLE `Sliders` (
  `id` int(10) NOT NULL,
  `image` varchar(60) NOT NULL,
  `header` varchar(60) NOT NULL,
  `paragraph` varchar(150) NOT NULL,
  `url` varchar(60) NOT NULL,
  `hidden` int(11) NOT NULL,
  `package_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Sliders`
--

INSERT INTO `Sliders` (`id`, `image`, `header`, `paragraph`, `url`, `hidden`, `package_id`) VALUES
(1, 'images/hero_bg_1.jpg', 'Never Stop Exploring', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fuga est inventore ducimus repudiandae.', 'Turkey', 0, 1),
(4, 'images/hero_bg_2.jpg', 'Love The Places', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fuga est inventore ducimus repudiandae.', 'Turkey', 0, 0);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Contienent`
--
ALTER TABLE `Contienent`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Countries`
--
ALTER TABLE `Countries`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Packages`
--
ALTER TABLE `Packages`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Sliders`
--
ALTER TABLE `Sliders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Tours`
--
ALTER TABLE `Tours`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Tour_Desc`
--
ALTER TABLE `Tour_Desc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_offer`
--
ALTER TABLE `user_offer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_tours`
--
ALTER TABLE `user_tours`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

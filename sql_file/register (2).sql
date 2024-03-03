-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2024 at 04:14 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `register`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `comments` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `title`, `content`, `created_at`, `comments`, `image`) VALUES
(15, 'England and Wales had warmest February on record', 'The average temperature for England was 7.5C, with an average of 6.9C in Wales. The UK as a whole saw its second warmest recorded February.\r\n\r\nFarmers say they are losing crops to floods while less frost hurts the growth of trees like apples and pears.\r\n\r\nThe provisional statistics are in line with long-term projections of warmer, wetter winters due to climate change.\r\n\r\nAverage temperatures for the UK as a whole in February were 6.3C.\r\n\r\nThat\'s still below February 1998\'s figure of 6.8C. But in a clear indicator of the recent impact of climate change, four of the UK\'s 10 warmest Februarys since 1884 have all come in the last six years - 2024, 2023, 2022 and 2019.', '2024-03-01 18:10:12', NULL, '_132776445_mediaitem132776444.jpg'),
(16, 'First class stamp price to rise again to £1.35, says Royal Mail', 'Royal Mail said the price of a first-class stamp would rise by 10p to £1.35 and second-class stamps would increase by 10p to 85p.\r\n\r\nIt comes after warning by the loss-making firm over the impact of higher costs and lower demand for letters.\r\n\r\nOn Monday, the BBC revealed the impact of problems with deliveries.\r\n\r\nThe cost of sending a letter second class from the second of April - 85p - will be the same as it cost to send one first class at the start of 2022.\r\n\r\nNick Landon, chief commercial officer at Royal Mail, said: \"We always consider price changes very carefully, but we face a situation where letter volumes have reduced dramatically over recent years while costs have increased.', '2024-03-01 18:11:40', NULL, '_128844589_stampfirstclass_gettyimages-1464200029.jpg'),
(17, 'Horse walks into Cheshire police headquarters', 'It sounds like the start of a joke but a horse really did walk into a Cheshire police station early on Monday morning.\r\n\r\nThe noble steed, who lives in a nearby field, ambled into the force\'s headquarters in Winsford, much to the surprise of security staff.\r\n\r\nA Cheshire Constabulary spokesman said the animal was \"quickly escorted\" back, adding: \"We like to ensure a warm welcome to all our guests at HQ and at neigh point did the horse pose a risk to security!\"', '2024-03-01 18:12:44', NULL, '_78111430_cheshirehorse.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `loginlogs`
--

CREATE TABLE `loginlogs` (
  `id` int(11) NOT NULL,
  `IpAddress` varchar(16) NOT NULL,
  `TryTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `t_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `token` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `trn_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `trn_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `trn_date`) VALUES
(1, 'ben', 'ben@ben.ben', '7fe4771c008a22eb763df47d19e2c6aa', '2024-02-09 14:45:55'),
(2, 'test ', 'test@test.com', '098f6bcd4621d373cade4e832627b4f6', '2024-02-12 16:05:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

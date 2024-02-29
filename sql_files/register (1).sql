-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 29, 2024 at 07:28 PM
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
(5, 'Example blog5', 'This is an example blog\r\n', '2024-02-29 14:22:51', 'New Comment: Shite\nNew Comment: aaa\n', NULL),
(6, 'Example Blog 6', 'This is an example blog to do', '2024-02-29 14:23:18', 'New Comment: \n', NULL),
(7, 'Snowden', 'ssss', '2024-02-29 14:59:20', 'New Comment: \n', NULL),
(8, 'aaa', 'aaaa', '2024-02-29 16:34:51', 'New Comment: aaa\n', NULL),
(9, 'cyber ', 'cyber attack image', '2024-02-29 16:53:43', NULL, 'cyber.jpg'),
(10, 'Image Test', 'image test - ben', '2024-02-29 16:54:49', NULL, 'Snowden.jpg'),
(11, 'safsafa', 'sfsafsfsaf', '2024-02-29 17:44:27', NULL, 'cyberchallenges.jpg'),
(12, 'sdsafaf', 'safsafsafaf', '2024-02-29 17:45:17', NULL, 'cyberproject.jpg'),
(13, 'nbjjbjbbjb', ';mlmlmmllmlmlmlm', '2024-02-29 17:48:00', NULL, 'ssd.jpg');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

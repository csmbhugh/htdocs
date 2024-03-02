-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2024 at 06:35 PM
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
  `postID` int(11) UNSIGNED NOT NULL,
  `postTitle` varchar(225) DEFAULT NULL,
  `postDesc` text DEFAULT NULL,
  `postCont` text DEFAULT NULL,
  `postDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`t_id`, `username`, `token`, `email`, `trn_date`) VALUES
(2, '0', '0', 'triangulated9@gmail.com', '2024-03-01 16:08:43'),
(3, '0', '0', 'email@gmail.com', '2024-03-01 16:08:54'),
(4, '0', '0', 'triangulated9@gmail.com', '2024-03-01 16:09:00'),
(5, 'ben', '', 'triangulated9@gmail.com', '2024-03-01 16:11:13'),
(6, 'ben', '', 'triangulated9@gmail.com', '2024-03-01 16:27:28'),
(7, 'q', '', 'q', '2024-03-01 16:27:37'),
(8, 'ben', '', 'triangulated9@gmail.com', '2024-03-01 16:34:52'),
(9, 'ben', '', 'triangulated9@gmail.com', '2024-03-01 17:48:26'),
(10, 'ben', '', 'csmbhugh@ljmu.ac.uk', '2024-03-01 18:04:04'),
(11, 'william', '', 'csmwadam@ljmu.ac.uk', '2024-03-01 18:04:18'),
(12, 'william', '', 'csmwadam@ljmu.ac.uk', '2024-03-01 18:15:26'),
(13, 'ben', '', 'triangulated9@gmail.com', '2024-03-01 18:15:33'),
(14, 'ben', '', 'triangulated9@gmail.com', '2024-03-01 18:18:27'),
(15, 'b', '', 'triangulated9@gmail.com', '2024-03-01 18:18:34'),
(16, 'bb', '', 'triangulated9@gmail.com', '2024-03-01 18:18:41'),
(17, 'b', '', 'wadams6090@gmail.com', '2024-03-01 18:19:44'),
(21, 'b', '2894b71faf9ec2e8209303254e1ca2ac82b6c6a3ba9d42c104', 'triangulated9@gmail.com', '2024-03-01 18:47:57'),
(22, 'b', '0b497ba086281d9c98012c19db564d46cfadc22d9d9ed58b65', 'triangulated9@gmail.com', '2024-03-01 18:48:05'),
(23, 'william', '4d486677fe907390fdcca5cf290b151dda8c6a00b80112cc9f', 'wadams6090@gmail.com', '2024-03-01 18:56:54'),
(24, 'b', '4d3625bb34ca2f7c843c69454b0b2e3eed94ab2d188fe1cee2', 'wadams6090@gmail.com', '2024-03-02 11:42:03'),
(25, 'b', '68b4cd17410819387f8f220139fafe10843f363138d0727fa8', 'wadams6090@gmail.com', '2024-03-02 11:43:25'),
(26, 'b', '2e24ede5be9acd6055b39afe79d61cabd363d1163ab59e00ed', 'wadams6090@gmail.com', '2024-03-02 11:43:31'),
(27, 'b', 'e3b1ea4fcc0adaafc4294db3f1588c3d8629b0dee082e78211', 'wadams6090@gmail.com', '2024-03-02 11:43:37'),
(28, 'b', 'd894e089fd7ab9d39edf800d66f5311a890ab6a9555a31efbc', 'wadams6090@gmail.com', '2024-03-02 11:46:04'),
(29, 'b', '1247b63466ee7de833435ae179e44ac83c84ba382bd977cf4d', 'wadams6090@gmail.com', '2024-03-02 11:46:11'),
(30, 'b', '50905374ef79704757dd4e287cf4628bb875986c2a434513ac', 'wadams6090@gmail.com', '2024-03-02 11:49:00'),
(31, 'b', '621273f10c54bddee57727c12c9c3f9b8d6249c15b2c6f294b', 'triangulated9@gmail.com', '2024-03-02 11:49:44'),
(32, 'b', '67516fb6184a4430b3f6d23bb91cbbfb6460e3fad10302ecec', 'triangulated9@gmail.com', '2024-03-02 11:50:34'),
(33, 'b', '558b5ea8c185ee59ec3f6b72f557d21ec885fc93075a4e6075', 'triangulated9@gmail.com', '2024-03-02 11:50:41'),
(34, 'b', '22e7c975e69561d05084b750af1b12b5cb00a1537a4fe9c980', 'triangulated9@gmail.com', '2024-03-02 11:52:00'),
(35, 'b', '3d4449efa6c149ebec349943a7e32f2e43817da08ba5470502', 'wadams6090@gmail.com', '2024-03-02 11:52:16'),
(36, 'b', 'c870b037e189edfcbe53a6d4dc73d840b72c75fcd2b2d4c5a8', 'wadams6090@gmail.com', '2024-03-02 11:54:46'),
(37, 'wadams123', '452e712ec7385bf7c4fec4ab2f600726d5848fde7ffd415537', 'wadams6090@gmail.com', '2024-03-02 11:54:54'),
(38, 'b', 'a764c8e8030396b839731c824f1cf6875e77098045c5a80573', 'wadams6090@gmail.com', '2024-03-02 11:57:22'),
(39, 'b', '5da8c55829b6f5cde78b804bfd7314108bb7f3611e7d6c009f', 'wadams6090@gmail.com', '2024-03-02 12:00:47'),
(40, 'b', '22f6bc7d228ad0452db90a4d97c572a503df552b5b0d6d2ed4', 'wadams6090@gmail.com', '2024-03-02 12:00:56'),
(41, 'b', 'b87c951cd6f2630980c591a19077934676b784d6670f11bd76', 'wadams6090@gmail.com', '2024-03-02 12:17:22'),
(42, 'w', '8672214482438d4ff617411a05c23aef34c871bcbbae37752a', 'wadams6090@gmail.com', '2024-03-02 12:17:32'),
(43, 'wadams123', 'f5821b43adc394866e703701a53df293fec2e00f19cb8fe539', 'wadams6090@gmail.com', '2024-03-02 12:20:00'),
(44, 'b', '5a1399e1e6875edf48406eb0640c50bfa2e15a1fb27839be31', 'wadams6090@gmail.com', '2024-03-02 12:20:08'),
(45, 'b', 'edfa1dfc6ca70fc93d477c7fc8da7aa20e2e17e3b53e27d115', 'wadams6090@gmail.com', '2024-03-02 12:21:24'),
(46, 'b', '25fb9eeb8f0b9daddcf733cd86f3a356f7ec3251abeee237cf', 'wadams6090@gmail.com', '2024-03-02 12:22:34'),
(47, 'b', '1ce87234250892be38e07c7efe8449d38b5890371a06303f30', 'wadams6090@gmail.com', '2024-03-02 12:24:26'),
(48, 'b', '1cc83d67036c82328b1d742dd429c9ad88990602e6b12036ad', 'wadams6090@gmail.com', '2024-03-02 12:25:06'),
(49, 'b', '9ef21e3e1dca047b96567b770164653f91dbf353c2cc0b4f21', 'wadams6090@gmail.com', '2024-03-02 12:25:15'),
(50, 'b', '0cb13d5f405c070ffa9ad70f5cc22950935d6777a5ceb4e7d6', 'wadams6090@gmail.com', '2024-03-02 12:30:10'),
(51, 'b', 'a1563f65b294cf6cc7c06ace65c9729ccb00bcdfb31559ee34', 'wadams6090@gmail.com', '2024-03-02 12:37:22'),
(52, 'b', '426f92c06af2281799b5a00db13b1d430ff51cd69b4c2cd4b8', 'wadams6090@gmail.com', '2024-03-02 12:37:30'),
(53, 'bb', 'bf05177c5a4a6a90e020de19db77f62f8724faead5e99e50e0', 'triangulated9@gmail.com', '2024-03-02 12:37:55'),
(54, 'wadams123', '8e44c50903fbb5a229f3cce99b1357572593677974762101bb', 'wadams6090@gmail.com', '2024-03-02 14:01:06'),
(55, 'wadams123', '44e6293bd2c2fa920a5ae95f2dca4de71dc085afcc60fc78da', 'wadams6090@gmail.com', '2024-03-02 14:57:20'),
(56, 'wadams123', '3282a54a3d9786b6fc3374eb0027954c57f08f5e13b8fb9976', 'wadams6090@gmail.com', '2024-03-02 17:18:43'),
(57, 'wadams123', '12bf9a73438a3f905af252676e60cc31ffe77d8106bd4fff74', 'wadams6090@gmail.com', '2024-03-02 17:18:52');

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
(1, 'ben', 'ben@ben.ben', 'e202ab68487f50975219c8efdc63bf53', '2024-02-09 14:45:55'),
(2, 'test ', 'test@test.com', 'e202ab68487f50975219c8efdc63bf53', '2024-02-12 16:05:36'),
(3, 'test', 'test@gmail.com', 'e202ab68487f50975219c8efdc63bf53', '2024-02-16 14:50:13'),
(4, 'wadams123', 'wadams1@gmail.com', '7aded315a468ac674d105ce3116df1cb', '2024-02-27 16:37:27'),
(5, 'testing2', 'test2@gmail.com', 'e202ab68487f50975219c8efdc63bf53', '2024-02-28 16:58:31'),
(6, 'wadams123', 'wadams6090@gmail.com', '747002da4273290ef59091f9db954dcf', '2024-03-02 13:59:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`postID`);

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
  MODIFY `postID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

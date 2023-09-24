-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 24, 2023 at 06:31 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2dekans-veilingen`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL,
  `userid` int NOT NULL,
  `categoryid` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `imageUrl` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `status` enum('open','gesloten') COLLATE utf8mb4_general_ci DEFAULT 'open',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `userid`, `categoryid`, `name`, `description`, `price`, `imageUrl`, `start_time`, `status`, `updatedAt`, `createdAt`) VALUES
(1, 1, NULL, 'Scotch & soda blauw', 'Cats v2!', '42.50', 'https://images.2dehands.com/api/v1/listing-twh-p/images/bd/bd8442ae-17e6-4be4-ab82-4b22e9d7fea4?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:46:10', '2023-09-16 08:47:41'),
(2, 1, NULL, 'jeans blauw', 'Vector Optics | Available', '100.00', 'https://images.2dehands.com/api/v1/listing-twh-p/images/eb/ebae7f76-627f-43be-b4ed-c7fad45e4fa4?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:46:20', '2023-09-22 13:16:31'),
(3, 1, NULL, 'Playstation 4 + GTA 5 & SW Battlefront', 'Vector Optics | Available', '100.00', 'https://images.2dehands.com/api/v1/listing-twh-p/images/63/63450fee-788f-42fc-bcbe-bad36ce0eb23?rule=ecg_mp_eps$_84', '0000-00-00 00:00:00', 'open', '2023-09-23 18:46:26', '2023-09-22 13:16:56'),
(4, 1, NULL, 'Kinderfiets \'\' Bike Fun 2 Fast \'\'', 'Vector Optics | Available', '65.00', 'https://images.2dehands.com/api/v1/listing-twh-p/images/b3/b396c6a9-0dab-4277-9c6e-a96fe79c7911?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:46:33', '2023-09-22 13:16:58'),
(5, 1, NULL, 'Simracing simulator', 'Vector Optics | Available', '1000.00', 'https://images.2dehands.com/api/v1/listing-twh-p/images/14/14fef45d-c4e4-48e6-a44a-f528d66a7e21?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:39:35', '2023-09-22 13:17:41'),
(6, 1, NULL, 'B-box Modem 3v+\n', 'Vector Optics | Available', '10.00', 'https://images.2dehands.com/api/v1/listing-twh-p/images/8e/8e0bf2b0-4c4c-4b15-91a2-de1d40b72204?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:46:48', '2023-09-22 13:17:50'),
(7, 1, NULL, 'Tullio Abbate', 'Vector Optics | Available', '13000.00', 'https://images.2dehands.com/api/v1/listing-twh-p/images/94/9447560e-83b7-41c8-8d50-5346eed1bf05?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:47:40', '2023-09-22 15:18:45'),
(8, 1, NULL, 'Midnight Navy - Air Jordan 4', 'Vector Optics | Available', '139.95', 'https://images.2dehands.com/api/v1/listing-twh-p/images/de/ded7d9e0-35f0-4160-a2ff-c5440ec83013?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:48:24', '2023-09-22 15:18:47'),
(9, 1, NULL, 'UNC - Air Jordan 4', 'FMA | Available', '139.95', 'https://images.2dehands.com/api/v1/listing-twh-p/images/55/55cf8cb3-7b49-4949-ae16-5bf1098f3644?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:48:41', '2023-09-22 17:40:21'),
(10, 1, NULL, 'Gaming pc GTX 2080 & i7 7900k 16gb Ram', 'CYMA | Available', '750.00', 'https://images.2dehands.com/api/v1/listing-twh-p/images/5e/5ea1ae6f-7faf-4c43-b0d7-21692509c43f?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:48:52', '2023-09-23 06:56:21'),
(11, 1, NULL, '2 Xbox games', 'CYMA | Available', '10.00', 'https://images.2dehands.com/api/v1/listing-twh-p/images/df/df048368-0776-4d7e-9090-7d0355bf862e?rule=ecg_mp_eps$_86\"', '0000-00-00 00:00:00', 'open', '2023-09-23 18:48:59', '2023-09-23 06:57:24'),
(12, 1, NULL, 'Koga Sportslady (Fitness-race -sport fiets nwpr 1399 euro)', 'S&T | Available', '460.00', 'https://images.2dehands.com/api/v1/listing-twh-p/images/11/1113e0d0-4df8-46f5-bef7-91e97122b181?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:42:36', '2023-09-23 06:57:49'),
(13, 1, NULL, 'Gaming pc', 'Double Bell | Available', '600.00', 'https://images.2dehands.com/api/v1/listing-twh-p/images/35/3524ab7f-f8c1-49ce-b9d4-3b82a95f679b?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:49:33', '2023-09-23 06:59:05'),
(14, 1, NULL, 'Ps5 controller zwart', 'Vector Optics | Available', '45.00', 'https://images.2dehands.com/api/v1/listing-twh-p/images/ee/eee86805-d43c-4e70-ab24-f995cf788ed3?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:50:19', '2023-09-23 10:21:23'),
(15, 1, NULL, 'Sony koptelefoon ook geschikt voor game', 'Vector Optics | Available', '50.00', 'https://images.2dehands.com/api/v1/listing-twh-p/images/9c/9cec078c-4c9d-4510-b0de-04e8bee0d7db?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:51:09', '2023-09-23 10:21:34'),
(16, 1, NULL, 'Mountainbike \'\' Thompson \'\'', 'CYMA | Available', '250.00', 'https://images.2dehands.com/api/v1/listing-twh-p/images/11/115a3b14-1631-4f34-a1bc-ec379e10b6dc?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:52:20', '2023-09-23 10:22:01'),
(17, 1, NULL, 'Prachtig Donker blauw jeans hemd ( medium)', 'CYMA | Available', '13.00', 'https://images.2dehands.com/api/v1/listing-twh-p/images/87/87aa8973-3866-4010-ace7-d8bfc9daad91?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:54:37', '2023-09-23 10:22:35'),
(18, 1, NULL, 'Samsung 4K monitor 28 inch', 'Double Bell | Available', '200.00', 'https://images.2dehands.com/api/v1/listing-twh-p/images/a7/a7abdb50-faa9-4955-ad00-4617a4ad5d84?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:55:10', '2023-09-23 10:23:54'),
(19, 1, NULL, 'nintendo switch Mario Kart 8 + 5 games + extra\'s', 'CYMA | Available', '250.00', 'https://images.2dehands.com/api/v1/listing-twh-p/images/c3/c3a45ef1-208c-4715-8e00-0ac8eb3ca773?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:55:41', '2023-09-23 10:31:23'),
(20, 1, NULL, 'Nintendo New 3DS XL', 'CYMA | Available', '180.00', 'https://images.2dehands.com/api/v1/listing-twh-p/images/b9/b9a543cb-9c64-49ad-b049-4d38e20e33d5?rule=ecg_mp_eps$_83', '0000-00-00 00:00:00', 'open', '2023-09-23 18:56:13', '2023-09-23 10:33:42');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `firstname`, `lastname`, `updatedAt`, `createdAt`) VALUES
(1, 'Username', 'email@email.email', '$argon2id$v=19$m=16,t=2,p=1$ckg3aWhxdUFOTEEydHVVUw$kAyjahR5deo9So58dcIjew', 'Firstname', 'Lastname', '2023-09-16 12:42:10', '2023-09-16 12:42:10');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `profilePictureUrl` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `about` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`id`, `userid`, `profilePictureUrl`, `about`) VALUES
(1, 1, 'https://http.cat/404.png', 'Cats!');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `name`) VALUES
(1, 'admin'),
(3, 'guest'),
(2, 'member');

-- --------------------------------------------------------

--
-- Table structure for table `user_role_mapping`
--

DROP TABLE IF EXISTS `user_role_mapping`;
CREATE TABLE IF NOT EXISTS `user_role_mapping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `roleid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_mapping_roleid` (`roleid`),
  KEY `role_mapping_userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_role_mapping`
--

INSERT INTO `user_role_mapping` (`id`, `userid`, `roleid`) VALUES
(1, 1, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `profile_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_role_mapping`
--
ALTER TABLE `user_role_mapping`
  ADD CONSTRAINT `role_mapping_roleid` FOREIGN KEY (`roleid`) REFERENCES `user_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_mapping_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

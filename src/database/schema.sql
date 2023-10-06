-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2023 at 12:30 AM
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
-- Database: `2dekansveilingen`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(11) NOT NULL,
  `location` text NOT NULL,
  `text_en` text NOT NULL DEFAULT 'UNAVAILABLE',
  `text_nl` text NOT NULL DEFAULT 'ONBESCHIKBAAR',
  `text_fr` text NOT NULL DEFAULT 'INDISPONIBLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `location`, `text_en`, `text_nl`, `text_fr`) VALUES
(1, '***DISCLAIMER***', 'DO NOT DELETE ANY RECORDS IN THIS TABLE', 'DONT DELETE ANY', 'AT ALL'),
(2, 'nav', '2nd-chance auctions', '2dekans veilingen', '2ème-chance enchères'),
(3, 'nav', 'Log out', 'Log uit', 'Se déconnecter'),
(4, 'footer', 'Services', 'Diensten', 'Service'),
(5, 'footer', 'UNAVAILABLE', 'Branding', 'INDISPONIBLE'),
(6, 'footer', 'UNAVAILABLE', 'Ontwerp', 'INDISPONIBLE'),
(7, 'footer', 'UNAVAILABLE', 'Marketing', 'INDISPONIBLE'),
(8, 'footer', 'UNAVAILABLE', 'Advertentie', 'INDISPONIBLE'),
(9, 'footer', 'Business', 'Bedrijf', 'Enterprise'),
(10, 'footer', 'UNAVAILABLE', 'Over ons', 'INDISPONIBLE'),
(11, 'footer', 'Contact', 'Contact', 'INDISPONIBLE'),
(12, 'footer', 'UNAVAILABLE', 'Vacatures', 'INDISPONIBLE'),
(13, 'footer', 'UNAVAILABLE', 'Perskit', 'INDISPONIBLE'),
(14, 'footer', 'UNAVAILABLE', 'Juridisch', 'INDISPONIBLE'),
(15, 'footer', 'Terms', 'Gebruiksvoorwaarden', 'INDISPONIBLE'),
(16, 'footer', 'UNAVAILABLE', 'Privacybeleid', 'Politique de confidentialité'),
(17, 'footer', 'UNAVAILABLE', 'Cookiebeleid', 'INDISPONIBLE'),
(18, 'nav', 'Auctions', 'Veilingen', 'Enchères'),
(19, 'nav', 'Location', 'Locatie', 'Emplacement'),
(20, 'nav', 'Products', 'Producten', 'Produits');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `profilePictureUrl` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `theme` text NOT NULL,
  `language` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_role_mapping`
--

CREATE TABLE `user_role_mapping` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_userid` (`userid`),
  ADD KEY `products_categoryid` (`categoryid`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_category_name` (`name`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_userid` (`userid`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `user_role_mapping`
--
ALTER TABLE `user_role_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_mapping_roleid` (`roleid`),
  ADD KEY `role_mapping_userid` (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_role_mapping`
--
ALTER TABLE `user_role_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_categoryid` FOREIGN KEY (`categoryid`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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

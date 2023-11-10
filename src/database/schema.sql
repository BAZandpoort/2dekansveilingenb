-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 10 nov 2023 om 12:56
-- Serverversie: 10.4.28-MariaDB
-- PHP-versie: 8.2.4

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
-- Tabelstructuur voor tabel `bids`
--

CREATE TABLE `bids` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `bidPrice` decimal(18,2) NOT NULL,
  `bidOfferedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `bids`
--

INSERT INTO `bids` (`id`, `productid`, `userid`, `bidPrice`, `bidOfferedAt`) VALUES
(1, 3, 51, 25.00, '2023-11-09 10:54:27'),
(2, 4, 51, 170.00, '2023-11-09 13:26:30');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bidshistory`
--

CREATE TABLE `bidshistory` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `bidPrice` decimal(10,0) NOT NULL,
  `bidOfferedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Gegevens worden geëxporteerd voor tabel `bidshistory`
--

INSERT INTO `bidshistory` (`id`, `productid`, `userid`, `bidPrice`, `bidOfferedAt`) VALUES
(1, 3, 51, 20, '2023-11-09 10:20:28'),
(2, 3, 51, 21, '2023-11-09 10:20:28'),
(3, 3, 50, 25, '2023-11-09 10:20:28'),
(4, 4, 51, 20, '2023-11-09 12:09:24'),
(5, 4, 51, 50, '2023-11-09 12:09:28'),
(6, 4, 51, 70, '2023-11-09 12:09:32'),
(7, 4, 51, 80, '2023-11-09 12:13:31'),
(8, 4, 51, 90, '2023-11-09 12:15:53'),
(9, 4, 51, 100, '2023-11-09 12:16:30'),
(10, 4, 51, 110, '2023-11-09 12:19:24'),
(11, 4, 51, 120, '2023-11-09 12:19:47'),
(12, 4, 51, 130, '2023-11-09 12:20:20'),
(13, 4, 51, 140, '2023-11-09 12:21:09'),
(14, 4, 51, 150, '2023-11-09 12:23:51'),
(15, 4, 51, 150, '2023-11-09 12:25:58'),
(16, 4, 51, 160, '2023-11-09 12:26:05'),
(17, 4, 51, 170, '2023-11-09 12:26:30');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `favorites`
--

CREATE TABLE `favorites` (
  `userid` int(11) NOT NULL,
  `productid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `notification_read`
--

CREATE TABLE `notification_read` (
  `notificationid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `read` tinyint(1) NOT NULL,
  `userid2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Gegevens worden geëxporteerd voor tabel `notification_read`
--

INSERT INTO `notification_read` (`notificationid`, `userid`, `read`, `userid2`) VALUES
(4, 51, 0, 50),
(3, 51, 0, 50),
(10, 51, 0, 51),
(3, 51, 0, 50),
(11, 51, 0, 51),
(3, 51, 0, 50),
(14, 51, 0, 51),
(15, 51, 0, 51),
(16, 51, 0, 51),
(17, 51, 0, 51);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `products`
--

INSERT INTO `products` (`id`, `userid`, `categoryid`, `name`, `description`, `price`, `imageUrl`, `endDate`, `updatedAt`, `createdAt`) VALUES
(1, 40, 4, 'Refined Granite Gloves', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 211.00, '19.jpg', '2023-11-09 20:06:11', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(2, 7, 9, 'Small Concrete Chicken', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 790.00, '21.jpg', '2023-11-09 18:50:23', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(3, 22, 2, 'Modern Cotton Fish', 'The Football Is Good For Training And Recreational Purposes', 29.00, '11.jpg', '2023-11-09 20:03:59', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(4, 15, 2, 'Intelligent Wooden Chips', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 325.00, '27.jpg', '2023-11-10 09:21:14', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(5, 2, 6, 'Handcrafted Granite Towels', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 683.00, '15.jpg', '2023-11-09 15:20:07', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(6, 29, 2, 'Licensed Fresh Chair', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 593.00, '2.jpg', '2023-11-10 01:25:07', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(7, 14, 8, 'Tasty Wooden Mouse', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 157.00, '49.jpg', '2023-11-10 03:50:42', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(8, 11, 1, 'Practical Fresh Gloves', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 707.00, '46.jpg', '2023-11-10 03:42:35', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(9, 46, 8, 'Ergonomic Fresh Car', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 928.00, '1.jpg', '2023-11-09 19:53:02', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(10, 49, 2, 'Handmade Cotton Cheese', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 674.00, '3.jpg', '2023-11-09 23:53:29', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(11, 44, 3, 'Elegant Cotton Soap', 'The Football Is Good For Training And Recreational Purposes', 985.00, '6.jpg', '2023-11-09 19:36:47', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(12, 13, 9, 'Practical Metal Hat', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 118.00, '50.jpg', '2023-11-09 17:11:02', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(13, 21, 2, 'Modern Metal Chair', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 357.00, '13.jpg', '2023-11-10 03:42:23', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(14, 20, 10, 'Practical Frozen Pants', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 808.00, '41.jpg', '2023-11-09 18:21:48', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(15, 28, 1, 'Elegant Cotton Keyboard', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 606.00, '12.jpg', '2023-11-09 21:15:49', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(16, 5, 8, 'Gorgeous Metal Salad', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 137.00, '44.jpg', '2023-11-10 02:53:13', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(17, 10, 8, 'Ergonomic Metal Pizza', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 636.00, '47.jpg', '2023-11-10 00:15:28', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(18, 35, 2, 'Oriental Soft Mouse', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 49.00, '5.jpg', '2023-11-09 15:01:55', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(19, 9, 4, 'Practical Cotton Shoes', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 409.00, '26.jpg', '2023-11-10 06:34:05', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(20, 31, 2, 'Licensed Soft Chicken', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 999.00, '25.jpg', '2023-11-09 20:36:52', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(21, 39, 1, 'Generic Wooden Sausages', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 596.00, '28.jpg', '2023-11-10 08:18:48', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(22, 23, 6, 'Practical Steel Shirt', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 603.00, '48.jpg', '2023-11-10 04:36:50', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(23, 36, 5, 'Electronic Plastic Chicken', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 70.00, '37.jpg', '2023-11-09 11:35:25', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(24, 50, 1, 'Fantastic Soft Sausages', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 98.00, '9.jpg', '2023-11-09 15:58:49', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(25, 6, 4, 'Licensed Concrete Soap', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 289.00, '18.jpg', '2023-11-10 03:06:22', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(26, 18, 8, 'Unbranded Steel Ball', 'The Football Is Good For Training And Recreational Purposes', 860.00, '42.jpg', '2023-11-09 23:36:18', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(27, 32, 1, 'Tasty Cotton Table', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 466.00, '39.jpg', '2023-11-09 10:40:41', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(28, 8, 6, 'Recycled Frozen Car', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 867.00, '24.jpg', '2023-11-10 06:28:20', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(29, 17, 3, 'Rustic Steel Gloves', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 457.00, '32.jpg', '2023-11-09 17:17:04', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(30, 42, 5, 'Incredible Metal Towels', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 603.00, '34.jpg', '2023-11-10 07:56:47', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(31, 16, 8, 'Awesome Concrete Chicken', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 336.00, '36.jpg', '2023-11-09 14:07:59', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(32, 41, 3, 'Small Metal Shoes', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 16.00, '8.jpg', '2023-11-10 02:07:23', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(33, 38, 3, 'Awesome Steel Pizza', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 130.00, '7.jpg', '2023-11-09 20:18:28', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(34, 4, 6, 'Modern Rubber Cheese', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 239.00, '30.jpg', '2023-11-10 07:42:16', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(35, 19, 9, 'Rustic Metal Chips', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 240.00, '35.jpg', '2023-11-09 17:03:29', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(36, 3, 3, 'Unbranded Soft Cheese', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 985.00, '4.jpg', '2023-11-10 08:17:43', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(37, 30, 10, 'Sleek Steel Computer', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 444.00, '23.jpg', '2023-11-09 19:23:13', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(38, 37, 2, 'Recycled Wooden Towels', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 538.00, '45.jpg', '2023-11-10 00:54:55', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(39, 12, 8, 'Incredible Metal Chips', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 531.00, '20.jpg', '2023-11-09 13:20:54', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(40, 33, 2, 'Small Bronze Shirt', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 344.00, '22.jpg', '2023-11-10 06:51:48', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(41, 25, 6, 'Intelligent Frozen Shoes', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 35.00, '17.jpg', '2023-11-09 11:28:52', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(42, 34, 2, 'Ergonomic Concrete Computer', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 303.00, '40.jpg', '2023-11-10 09:07:02', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(43, 26, 1, 'Handcrafted Bronze Cheese', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 946.00, '29.jpg', '2023-11-09 21:24:32', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(44, 24, 1, 'Modern Granite Fish', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 129.00, '31.jpg', '2023-11-09 14:18:05', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(45, 47, 5, 'Small Fresh Keyboard', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 28.00, '33.jpg', '2023-11-09 20:21:47', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(46, 1, 8, 'Electronic Concrete Salad', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 932.00, '38.jpg', '2023-11-10 02:48:05', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(47, 45, 8, 'Licensed Granite Shoes', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 652.00, '10.jpg', '2023-11-09 10:15:48', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(48, 43, 5, 'Recycled Soft Bike', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 185.00, '43.jpg', '2023-11-10 06:37:56', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(49, 27, 6, 'Handmade Wooden Gloves', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 520.00, '16.jpg', '2023-11-10 02:14:29', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(50, 48, 10, 'Tasty Metal Gloves', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 53.00, '14.jpg', '2023-11-09 22:50:21', '2023-11-09 09:38:45', '2023-11-09 09:38:45');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `icon`) VALUES
(1, 'Movies', 'M4.26 10.147a60.436 60.436 0 00-.491 6.347A48.627 48.627 0 0112 20.904a48.627 48.627 0 018.232-4.41 60.46 60.46 0 00-.491-6.347m-15.482 0a50.57 50.57 0 00-2.658-.813A59.905 59.905 0 0112 3.493a59.902 59.902 0 0110.399 5.84c-.896.248-1.783.52-2.658.814m-15.482 0A50.697 50.697 0 0112 13.489a50.702 50.702 0 017.74-3.342M6.75 15a.75.75 0 100-1.5.75.75 0 000 1.5zm0 0v-3.675A55.378 55.378 0 0112 8.443m-7.007 11.55A5.981 5.981 0 006.75 15.75v-1.5'),
(2, 'Automotive', 'M9.75 3.104v5.714a2.25 2.25 0 01-.659 1.591L5 14.5M9.75 3.104c-.251.023-.501.05-.75.082m.75-.082a24.301 24.301 0 014.5 0m0 0v5.714c0 .597.237 1.17.659 1.591L19.8 15.3M14.25 3.104c.251.023.501.05.75.082M19.8 15.3l-1.57.393A9.065 9.065 0 0112 15a9.065 9.065 0 00-6.23-.693L5 14.5m14.8.8l1.402 1.402c1.232 1.232.65 3.318-1.067 3.611A48.309 48.309 0 0112 21c-2.773 0-5.491-.235-8.135-.687-1.718-.293-2.3-2.379-1.067-3.61L5 14.5'),
(3, 'Industrial', 'M12 12.75c1.148 0 2.278.08 3.383.237 1.037.146 1.866.966 1.866 2.013 0 3.728-2.35 6.75-5.25 6.75S6.75 18.728 6.75 15c0-1.046.83-1.867 1.866-2.013A24.204 24.204 0 0112 12.75zm0 0c2.883 0 5.647.508 8.207 1.44a23.91 23.91 0 01-1.152 6.06M12 12.75c-2.883 0-5.647.508-8.208 1.44.125 2.104.52 4.136 1.153 6.06M12 12.75a2.25 2.25 0 002.248-2.354M12 12.75a2.25 2.25 0 01-2.248-2.354M12 8.25c.995 0 1.971-.08 2.922-.236.403-.066.74-.358.795-.762a3.778 3.778 0 00-.399-2.25M12 8.25c-.995 0-1.97-.08-2.922-.236-.402-.066-.74-.358-.795-.762a3.734 3.734 0 01.4-2.253M12 8.25a2.25 2.25 0 00-2.248 2.146M12 8.25a2.25 2.25 0 012.248 2.146M8.683 5a6.032 6.032 0 01-1.155-1.002c.07-.63.27-1.222.574-1.747m.581 2.749A3.75 3.75 0 0115.318 5m0 0c.427-.283.815-.62 1.155-.999a4.471 4.471 0 00-.575-1.752M4.921 6a24.048 24.048 0 00-.392 3.314c1.668.546 3.416.914 5.223 1.082M19.08 6c.205 1.08.337 2.187.392 3.314a23.882 23.882 0 01-5.223 1.082'),
(4, 'Shoes', 'M2.25 18.75a60.07 60.07 0 0115.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 013 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 00-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 01-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 003 15h-.75M15 10.5a3 3 0 11-6 0 3 3 0 016 0zm3 0h.008v.008H18V10.5zm-12 0h.008v.008H6V10.5z'),
(5, 'Beauty', 'M2.25 21h19.5m-18-18v18m10.5-18v18m6-13.5V21M6.75 6.75h.75m-.75 3h.75m-.75 3h.75m3-6h.75m-.75 3h.75m-.75 3h.75M6.75 21v-3.375c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21M3 3h12m-.75 4.5H21m-3.75 3.75h.008v.008h-.008v-.008zm0 3h.008v.008h-.008v-.008zm0 3h.008v.008h-.008v-.008z'),
(6, 'Clothing', 'M3.75 13.5l10.5-11.25L12 10.5h8.25L9.75 21.75 12 13.5H3.75z'),
(7, 'Garden', 'M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0 0118 9.75v-.7V9A6 6 0 006 9v.75a8.967 8.967 0 01-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 01-5.714 0m5.714 0a3 3 0 11-5.714 0M3.124 7.5A8.969 8.969 0 015.292 3m13.416 0a8.969 8.969 0 012.168 4.5'),
(8, 'Health', 'M12 6.042A8.967 8.967 0 006 3.75c-1.052 0-2.062.18-3 .512v14.25A8.987 8.987 0 016 18c2.305 0 4.408.867 6 2.292m0-14.25a8.966 8.966 0 016-2.292c1.052 0 2.062.18 3 .512v14.25A8.987 8.987 0 0018 18a8.967 8.967 0 00-6 2.292m0-14.25v14.25'),
(9, 'Baby', 'M20.25 14.15v4.25c0 1.094-.787 2.036-1.872 2.18-2.087.277-4.216.42-6.378.42s-4.291-.143-6.378-.42c-1.085-.144-1.872-1.086-1.872-2.18v-4.25m16.5 0a2.18 2.18 0 00.75-1.661V8.706c0-1.081-.768-2.015-1.837-2.175a48.114 48.114 0 00-3.413-.387m4.5 8.006c-.194.165-.42.295-.673.38A23.978 23.978 0 0112 15.75c-2.648 0-5.195-.429-7.577-1.22a2.016 2.016 0 01-.673-.38m0 0A2.18 2.18 0 013 12.489V8.706c0-1.081.768-2.015 1.837-2.175a48.111 48.111 0 013.413-.387m7.5 0V5.25A2.25 2.25 0 0013.5 3h-3a2.25 2.25 0 00-2.25 2.25v.894m7.5 0a48.667 48.667 0 00-7.5 0M12 12.75h.008v.008H12v-.008z'),
(10, 'Grocery', 'M12 21v-8.25M15.75 21v-8.25M8.25 21v-8.25M3 9l9-6 9 6m-1.5 12V10.332A48.36 48.36 0 0012 9.75c-2.551 0-5.056.2-7.5.582V21M3 21h18M12 6.75h.008v.008H12V6.75z');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `typeOfAbuse` text NOT NULL,
  `context` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `review`
--

CREATE TABLE `review` (
  `member` int(11) NOT NULL,
  `review` text NOT NULL,
  `sterren` int(11) NOT NULL,
  `seller` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `translations`
--

CREATE TABLE `translations` (
  `id` int(11) NOT NULL,
  `location` text NOT NULL,
  `text_en` text NOT NULL DEFAULT 'UNAVAILABLE',
  `text_nl` text NOT NULL DEFAULT 'ONBESCHIKBAAR',
  `text_fr` text NOT NULL DEFAULT 'INDISPONIBLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `translations`
--

INSERT INTO `translations` (`id`, `location`, `text_en`, `text_nl`, `text_fr`) VALUES
(1, '***DISCLAIMER***', 'DO NOT DELETE ANY RECORDS IN THIS TABLE', 'DONT DELETE ANY', 'AT ALL'),
(2, 'nav', '2nd-chance auctions', '2dekans veilingen', '2ème-chance enchères'),
(3, 'nav', 'Log out', 'Log uit', 'Se déconnecter'),
(4, 'footer', 'Services', 'Diensten', 'Service'),
(5, 'footer', 'Branding', 'Branding', 'Marque'),
(6, 'footer', 'Design', 'Ontwerp', 'Design'),
(7, 'footer', 'Marketing', 'Marketing', 'Marketing'),
(8, 'footer', 'Advertisement', 'Advertentie', 'Publicité'),
(9, 'footer', 'Business', 'Bedrijf', 'Enterprise'),
(10, 'footer', 'About us', 'Over ons', 'A propos de nous'),
(11, 'footer', 'Contact', 'Contact', 'Contact'),
(12, 'footer', 'Vacancies', 'Vacatures', 'Postes vacants'),
(13, 'footer', 'Press kit', 'Perskit', 'Kit de presse'),
(14, 'footer', 'Legal', 'Juridisch', 'Juridique'),
(15, 'footer', 'Terms', 'Gebruiksvoorwaarden', 'Conditions d\'utilisation'),
(16, 'footer', 'Privacy Policy', 'Privacybeleid', 'Politique de confidentialité'),
(17, 'footer', 'Cookie Policy', 'Cookiebeleid', 'Politique de cookies'),
(18, 'nav', 'Auctions', 'Veilingen', 'Enchères'),
(19, 'nav', 'Location', 'Locatie', 'Emplacement'),
(20, 'nav', 'Products', 'Producten', 'Produits'),
(21, 'nav', 'test', 'test', 'test');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
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

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `firstname`, `lastname`, `updatedAt`, `createdAt`) VALUES
(1, 'Shania_Kerluke-Kris', 'Elnora.Kohler@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$QClsxPuSU/Orv4MSUf10fg$lVZvB6Z/QTZCUNgrWSqFA2DtvWnxhBF4VDJ6HPKXhIQ', 'Margie', 'Pacocha', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(2, 'Otilia_Cummerata', 'Kayleigh_Kulas@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$lZtqiFoSgHLIkzIK6mjKGg$FkA8AyAB9pYF9n/9W9ICgDoagzIXbUY9mxNsOtrXlXI', 'Clara', 'Ryan', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(3, 'Seamus96', 'Brooklyn_Treutel@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$DLbONA3P/QY68VjXs/keTw$0f0700Ko4Q7wvdclZTBazglMHsxminHDKGkQvodWdyA', 'Wellington', 'Sauer', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(4, 'Katlyn67', 'Conner38@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$N3gC6a61ZsS7tYtTYylFxA$v6ZkEMJMyF+UYpXU8m19grfKnBxneLOPN0hVUbnNOdI', 'Sherman', 'Reynolds', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(5, 'Levi_Rowe10', 'Marietta_Senger@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$vU1aFumNsVK8lKiLvB3kEg$cmkNJwtFo+aXu2VztLO3SrcPPTtDZ01SMcJDKvqe3Ek', 'Carissa', 'Graham', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(6, 'Marques.Lueilwitz-Rippin', 'Helene_Dare63@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$xv123IhCpOaZ7t1eAt8hjQ$7T3gXuN2QNpkpRZRSj3xxtyNXg6rrt4wydufJfMe4xw', 'Salma', 'Homenick', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(7, 'Loy.Wisoky55', 'Elliot_Maggio@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$y6W11gFMa88Vv1sHTHLe0w$LEMb0KkckPIBUYvMsnnhM038NhbX6S9C2IPOqDNgEm4', 'Mariela', 'Schneider', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(8, 'Heaven.Walsh39', 'Tavares.Farrell67@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$UfBRcaFlkF3oO16Y/AxxSg$mEFYV7RwA4FkL0LoJdWN7pIRudKaln+d40bicUZ8lks', 'Shea', 'O\'Conner', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(9, 'Bryon_Hodkiewicz47', 'Dedric_Ratke@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$jt+lobJesOs1fZNuFfwd4g$Yt+uBQ6zfAjcoHygJDvAONfYcvkKr7uB0mMod3szVf8', 'Leonor', 'Brakus', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(10, 'Laron_Carter', 'Billie.Pfeffer@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$bEgtY+TcaRhZ4who1DJZiw$s4tDT45mFsbTYrvlTQeMX2Mj0ABuue1hltr/necD8XU', 'Barbara', 'Klocko', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(11, 'Dana.Ferry', 'Marquise6@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Axw4RUDUNysELiDOb5jKMQ$JFOvV13x6qqqA5d9tzNGurDv64rXpZhDHQIwrJcpeWE', 'Baylee', 'Toy', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(12, 'Una.Dare39', 'Katelyn_Johnston@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$kl6bcq5ebxmvKqgbDQ4uOg$nLW/1Bf1LC0vLorW0MD50EPMGpXDSobOF8bv3Asv5AM', 'Santino', 'Gleason', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(13, 'Karine_Monahan16', 'Courtney51@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$kVy/A3Pnq1DrcrWoYC+Bew$Ex4UCkLu25DGMKwldCP/BbZtVlgdyQoP9alkwbWshdI', 'Jeramy', 'Roob', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(14, 'Malcolm60', 'Ethel.Wilkinson55@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$XDiPNcp1Y7g9qXWOgUdFng$ZyyDUzKHOFzsyvfFxZb1JwzBU2RMT2tfLdvvpScgwn0', 'Grant', 'Yost', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(15, 'Katheryn_Walsh79', 'Tania_Dicki@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$ffYwN3uNEc7cFCelDcayiA$1W49VW7yuGe1UONvq6bLbOgeKG3LqYnopSwxo2wjtbM', 'Tyreek', 'Farrell', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(16, 'Thalia.Kuhic97', 'Maida.Schiller@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$cgJcxW/6pBLt1NpkPrV72Q$f4oPVE6VqV94V2llhdfxBjkCYuRkT2u6qJQc6D8XUmE', 'Susana', 'Bradtke', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(17, 'Dorothy_OConnell73', 'Mariano70@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$DPmEq1o53EpIRKskTFrFwA$gVEOH/+MmKehDyKn5rgP9XABVV4UBhQD4arSD68Oqhs', 'Houston', 'Schinner', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(18, 'Yasmin31', 'Skylar_Feil@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$D1ywzWfOIWra7BnRMxzxAQ$FIQL7yZy2t2a0mHNxMuVn6FR9co5ZYhsjkltYOpUj/Q', 'Catharine', 'Howell', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(19, 'Ladarius_Lemke20', 'Angela_Moen95@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$ZRVV1jD74qH7Im8swnS2GQ$6JPMKCy1evCt4HJHlY7ywtObrAuul4vQkUb5UkW49X8', 'Eladio', 'Champlin', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(20, 'Elliott.Weimann48', 'Dave14@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$tlBpSTGvQ7VjduHMZz1iSg$LzbvJeD7c9N/0UjOn2p8Krwvs0bqgwDZ0R17/OAPZYY', 'Donavon', 'Gleichner', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(21, 'Ransom78', 'Roberta.Marquardt-Block89@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$XgTUwIdGifQ9VSRjQ8WzDw$tWDgvyoiuyeAT8YrBOxJcE7ZFCApzR9hRP71vtldvdg', 'Augustus', 'Medhurst', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(22, 'Sabina.Will-Labadie11', 'Jaiden.Glover79@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$b1AhXERvJDGBC7ozX7uihA$xeqJhz+PUrgkM0ilt/VNoeBOfNskgBd5YtMwWnKIv8s', 'Bette', 'Grady', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(23, 'Grayson.Durgan', 'Justine.Bernier31@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$4DqpLUPoygcyf9O9h0noFw$bq0i+yStEevfFGpYSubmrwG1qkbJYswkFHFp/oitKvA', 'Alyce', 'Kuhlman', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(24, 'Angelica.Stracke', 'Willis20@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$iw0KR22KN56/ajHDSmjvqg$YxrW7NT8gDprqLiJuLvqhEqMW9EWSvtAnH+HFVfJwhs', 'Megane', 'Barton-Franey', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(25, 'Itzel37', 'Luella.Renner87@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$NSuDjT3oV5onBpyYpVnQQA$71QFqS3sTTNxr4JRJfzmhyRpS7ZPwT63fOS+9WwrcZI', 'Crystel', 'Russel', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(26, 'Mckayla_Douglas79', 'Jennyfer.Langworth@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$r1n+R6oVejypKuzuWv9GYA$o0hK4K42SoC45lAVHT0qOTBEH9qowuOuDLdjmutFlmM', 'Theodora', 'Conn-Harber', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(27, 'John.Kiehn81', 'Eddie.Nader3@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$6mDytRO2BMoih8msUebUIw$J3JVeLXuA1xWSx+Vic7TyoSwcOoN0pAKo+jZUEIg7Kw', 'Maya', 'Hickle-Hodkiewicz', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(28, 'Ruby_Dach43', 'Evelyn.Pouros@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$fyue5fGEJ96pV8GFveg7lg$4YTk85Pafg0N/H3Y7K7hsRhBEZ0sJXY9/fCkc/m78Yk', 'Kianna', 'Murray', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(29, 'Berenice4', 'Juliet_Waelchi@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$UqBgwwBppevLNxPFwG6qHQ$XDGsNV0LPaKGSs6RTM5fafzDgeorzZOFt9+jcrVglX0', 'Pablo', 'Thiel', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(30, 'Walker_Koepp', 'Helene_Kohler-Corwin@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$RGe3tesWY1csR5hgTBoZjg$biwUYmkK2b4FTVAL5v/ENQY+YfWb27B+hxrMqWXD2C8', 'Cora', 'Koelpin', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(31, 'Herminia0', 'Lavern57@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$7AXVrFQznn81OpV7RwHrhQ$xHmtasuA/+sGQO0K5fgT79EIubLHFa+OYF4l0lfqcfg', 'Marty', 'Gusikowski', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(32, 'Rosamond_Block', 'Cornell92@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$MHeS5+8S9aFRRmXpqXEDzA$7mSXTg75P1dMlUmSWzUqgG6S8jQ9lGbD3twDkcptc/w', 'Alene', 'Bergnaum', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(33, 'Jerrell27', 'Abdullah.Ortiz67@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$gFi5Bkjgn6GmP3KhEVzz0A$cKo2Qda7Fbdk1KxskP19JePjEOrYix4AUX+SRK6AMLQ', 'Norene', 'Crist', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(34, 'Damon_Schuster95', 'Kale.Schoen35@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$CnOf+tpzq9bZFBXkf6Dskw$JMBxW76e5xUVneHT4KrfX4YETqB+TCyw+EKmazVn858', 'Darby', 'Schowalter', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(35, 'Eddie86', 'Georgette_Donnelly78@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$fMdNrX2dTM5ly++a9U+fsQ$aO45xpCGQfyJoXznq2w5H7t5zwVVar+fBPIK+/BNQus', 'Hazle', 'Rempel', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(36, 'Elmira62', 'Rubie.Blick88@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$c/Rn8zz52XGjD6IQLzgGfQ$0j22VdgUfa58Bbs4EqS8GD28ilCaqhHSCnGhKRS4v+A', 'Kaylah', 'Emmerich', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(37, 'Vesta.Mayert70', 'Geraldine58@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qXro5KlEK3r+kgO4ApyMIw$Yee97XSnUSXLCY98e7QVW0eaNwbuP+243CBwnQrZjq4', 'Zaria', 'Schmidt', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(38, 'Zoe.Wolf2', 'Justine69@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$8rzB4ctzmu1lkwHwCMkbYA$n6jcqYiQNGB30SIyjoPjj7jxmIKU//zEjQ330XNWoCI', 'Josie', 'Daugherty', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(39, 'Jedidiah_Feeney87', 'Nasir68@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$+ITi+kEcKphc/T1Ho52rFQ$zssWXPbI0T2/dzY/xsKsUQ72M9mc41z/wvStN5BDRRw', 'Dayna', 'Hagenes', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(40, 'Camryn.Ledner83', 'Walter.Koelpin91@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$yvQAUMQJmFItWNlnaK1Ihw$Mdn/PrWA5ybp4M0SiYyAw8FeDmQfXHAyO5YGwmUvAgM', 'Bella', 'Rippin', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(41, 'Michelle42', 'Jacinthe.Block79@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$mkSQ7G2VrN0LbFUXDwH1Kw$cpP0310J3o74FTOYNVCAOLgGFpj2S4+vD+4Xuvz3+PY', 'Orland', 'Streich', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(42, 'Fausto57', 'Clementine.Oberbrunner@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$WfeDZKVLxXqf2Q/X21zmLw$0fG4K0TTYRQNe80coFzSnr8yrxXJgWgD2t2Y6u4f2T0', 'Leland', 'Emmerich', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(43, 'Sylvan77', 'Elda_Feil22@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$FDHSyDvoj0NV2gC6qIRxpA$uuwsin3c+ewENP0QJSYJlHGMPYp15GxtG70K+8mP5sg', 'Diana', 'Shields', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(44, 'Lea_Gulgowski65', 'Selina_Ledner@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$8MfaHcfGHHrgBsrvt4+XGg$HYsZDOLHfzry27Mds8PpZb026471+1w9wSTPTALaeGQ', 'Clyde', 'Nolan', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(45, 'Nichole.Kling', 'Arianna_Ebert@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$TN7N8SA6Z2iA474fSikgqQ$nXQwNqA2uXIpT+9hnX9cImR2Hhp6wyKdvuC6WO49pco', 'Shawna', 'Ullrich', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(46, 'Marcella_Strosin', 'Letha43@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$dBF6YVKiOjPpIgxo7I1WrA$VEEc+c3HW6KWpTffUZJ1EK9YoUOkFWXaZUG5fu8rX1E', 'Sunny', 'Fahey', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(47, 'Hans25', 'Lizeth.Fisher8@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$YrmLZ+qr735FhvezkF5FMw$e/wgE600/AtU6fmSxMp14ximvs9xWnuifuz54d8oUYA', 'Madisyn', 'Halvorson', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(48, 'Rosalind4', 'Sibyl_Johns@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$AYQCjtR1ut0IW/fJcsuG6A$fHwmJIQuP5+7UIiAKKahSjOYH2KV57mx6phZqjZYj/4', 'Nigel', 'Collins', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(49, 'Clarabelle_Schultz', 'Declan_Bradtke78@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$OcZb/Bh7wZNkprPhu1rwQw$uadrsaYmz9flg8SDyRa+RCEEYmm+nvqJ59Qc/1AJTxw', 'D\'angelo', 'Graham', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(50, 'Malvina58', 'Tony_Powlowski@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$WvS68ZTa/eGeeBTTJ1PQkQ$6IHQ2OfFea84QRKSXnKBZWAspzzDNmlTJnFYrWvH+pY', 'Odell', 'Nitzsche', '2023-11-09 09:38:45', '2023-11-09 09:38:45'),
(51, 'Testing Account', 'test@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$WfSSbfv8w4YSOyVyXb1MNg$DsV22kV7+Yy6PH47TeGnZfP8wydFZ0P4uUSY6teYl7g', 'Testing', 'Account', '2023-11-09 09:38:45', '2023-11-09 09:38:45');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `profilePictureUrl` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `theme` text NOT NULL DEFAULT 'light',
  `language` text NOT NULL DEFAULT 'text_en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `user_profile`
--

INSERT INTO `user_profile` (`id`, `userid`, `profilePictureUrl`, `about`, `theme`, `language`) VALUES
(1, 39, 'https://avatars.githubusercontent.com/u/64698607', 'Comis sulum suscipio votum facilis commodo pax victoria vorago centum. Arbor pax attero animi curso amo accedo accommodo terreo perferendis. Arma versus sunt curatio crur bellum turpis earum arguo abbas.', 'dark', 'text_fr'),
(2, 20, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1115.jpg', 'Amita cavus sui commodo patior nihil debitis sapiente bibo. Patruus aer harum alienus tamisium corroboro. Voluptas carmen spiculum.', 'dark', 'text_fr'),
(3, 9, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/118.jpg', 'Curiositas auctor sollers. Adamo umquam copiose demulceo defaeco utrum despecto. Adhuc non defessus.', 'light', 'text_nl'),
(4, 48, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1233.jpg', 'Adeo undique ipsum celer optio vicissitudo tabula uredo assentator. Territo adicio tendo ad vomica claudeo anser. Aequitas addo avaritia tertius.', 'light', 'text_nl'),
(5, 26, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/707.jpg', 'Corrumpo tyrannus coma corpus derelinquo amplitudo. Quis valens comparo claro velut. Minima defero commodi caecus vox.', 'light', 'text_fr'),
(6, 11, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/836.jpg', 'Aetas via adiuvo calcar omnis defaeco confido venia vulariter suadeo. Acquiro terga condico cui quae decipio solio. Ventus carmen cupio.', 'dark', 'text_en'),
(7, 45, 'https://avatars.githubusercontent.com/u/16030426', 'Derelinquo articulus angulus terebro modi. Sopor aliquam suggero vespillo copia debeo casso. Correptius aveho thymum strenuus adipisci curso verus auctor tantum pecco.', 'light', 'text_en'),
(8, 41, 'https://avatars.githubusercontent.com/u/75359763', 'Aqua cibo accusamus abutor vesco xiphias xiphias terga. Adduco assumenda absum argumentum verbum desolo. Abeo sto ciminatio acceptus defaeco atavus nisi.', 'light', 'text_nl'),
(9, 6, 'https://avatars.githubusercontent.com/u/69188012', 'Thermae argumentum culpa patrocinor dicta venio sed adsidue tabula spoliatio. Acidus curtus tyrannus hic cur aqua conservo. Curia substantia temeritas abeo.', 'dark', 'text_nl'),
(10, 2, 'https://avatars.githubusercontent.com/u/94008594', 'Tactus vivo aequitas curso. Tondeo angustus vinum veritas vesco porro. Dolore curriculum aro contabesco.', 'light', 'text_nl'),
(11, 24, 'https://avatars.githubusercontent.com/u/37783929', 'Sustineo spoliatio sint occaecati accommodo dolorum officia. Aetas alius confido aedificium cariosus suspendo exercitationem nulla amaritudo contego. Exercitationem sint agnitio thymbra vitium auditor amet sol commodo.', 'dark', 'text_fr'),
(12, 49, 'https://avatars.githubusercontent.com/u/8389984', 'Infit amiculum vinitor valeo reprehenderit perspiciatis eligendi nihil appositus arcesso. Adfero collum ad contra calamitas doloremque voluptates adduco tubineus copia. Molestias avarus asper deorsum voluptas sonitus eos cornu amplexus.', 'light', 'text_fr'),
(13, 29, 'https://avatars.githubusercontent.com/u/60152346', 'Beatus laudantium corrumpo accommodo aliqua quam curis aequitas cura. Patior coerceo clarus usitas solum tondeo beatae celo adsum. Constans tui sortitus speculum deleo non candidus deripio.', 'light', 'text_fr'),
(14, 36, 'https://avatars.githubusercontent.com/u/7562490', 'Deludo laboriosam subvenio strenuus vix sonitus summopere impedit cotidie. Aperte calco conventus campana ante celebrer. Volo tergeo bene facere.', 'dark', 'text_en'),
(15, 5, 'https://avatars.githubusercontent.com/u/55680317', 'Incidunt crapula temporibus. Celer provident casus stabilis speculum deripio saepe cinis absorbeo. Succurro demum celer taceo asporto.', 'dark', 'text_nl'),
(16, 19, 'https://avatars.githubusercontent.com/u/64478864', 'Solum ab arbor velut civitas conatus ascisco virtus. Suffragium tergo angulus cornu usque cur distinctio. Condico explicabo consequatur complectus urbs sapiente adicio viridis.', 'dark', 'text_nl'),
(17, 10, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/536.jpg', 'Cruentus stillicidium ver coadunatio via deficio ver amicitia aspicio vulnus. Defleo aliquid sono sit ubi. Creator deduco utor deorsum.', 'dark', 'text_fr'),
(18, 35, 'https://avatars.githubusercontent.com/u/92617838', 'Voluptatibus arbustum verecundia tendo torqueo inventore stultus pecus velut contra. Damnatio vel laudantium. Vilitas bellicus depraedor repellat cerno adsuesco.', 'dark', 'text_en'),
(19, 50, 'https://avatars.githubusercontent.com/u/17940737', 'Beatus bellum accendo carcer conservo utique terreo contigo deduco tricesimus. Vulticulus bos vereor allatus deprecator ullus caste. Aperiam canis accommodo benigne vulgaris excepturi.', 'light', 'text_fr'),
(20, 16, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/590.jpg', 'Calco coniuratio cupressus deleniti ipsum. Conicio cibo decimus considero temperantia deputo. Sollers crinis paulatim aedificium aqua dolore labore aspernatur.', 'light', 'text_en'),
(21, 40, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/852.jpg', 'Conduco comes crastinus advenio tener ustilo sui. Venustas adficio iusto amo quo cogito terra cedo cornu acsi. Curiositas crapula exercitationem curo tenuis.', 'light', 'text_nl'),
(22, 44, 'https://avatars.githubusercontent.com/u/58435428', 'Depereo aestas tredecim provident acidus quam arbitro turbo. Conqueror aggredior credo. Tracto atqui terra via pectus voluptatum tenetur acsi cinis.', 'dark', 'text_nl'),
(23, 28, 'https://avatars.githubusercontent.com/u/48766826', 'Cognatus vestrum beatae denuncio capitulus sustineo compello quaerat. Blandior cimentarius ipsa uredo spectaculum. Copiose vespillo utpote acsi acquiro velum demoror contigo dignissimos.', 'light', 'text_en'),
(24, 12, 'https://avatars.githubusercontent.com/u/21464770', 'Ubi necessitatibus asperiores texo cena sol. Dolor territo benevolentia aut ratione amplus cultellus claustrum nostrum curvo. Talio cervus tabella absconditus volutabrum triduana vomer decet dicta deficio.', 'light', 'text_en'),
(25, 31, 'https://avatars.githubusercontent.com/u/13814550', 'Bestia tricesimus vigilo. Accendo commodo chirographum coerceo vestrum defetiscor. Civis vita ab carpo sodalitas quia truculenter culpo careo.', 'dark', 'text_fr'),
(26, 13, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/885.jpg', 'Sublime antepono basium xiphias deinde cernuus terreo celo torqueo benigne. Cariosus cuius vespillo patior adopto curriculum bellicus conculco. Cometes vere caute umquam universe thesaurus cura tergo.', 'dark', 'text_nl'),
(27, 46, 'https://avatars.githubusercontent.com/u/34368110', 'Molestias repellendus cornu ciminatio vestrum conqueror. Nam minima ager adamo alii. Aegrotatio veniam adnuo utilis.', 'light', 'text_en'),
(28, 32, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/933.jpg', 'Acerbitas ulciscor subseco corpus decerno eius. Compello viscus contego cilicium. Adinventitias tempora validus cribro amet thermae sapiente toties.', 'dark', 'text_en'),
(29, 18, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1107.jpg', 'Vindico vulariter vir creo uberrime thermae armarium utor. Deduco conor sequi barba careo brevis curis curo. Bellum curso adamo trucido harum ocer cultellus advenio vergo.', 'light', 'text_fr'),
(30, 47, 'https://avatars.githubusercontent.com/u/42670808', 'Circumvenio utrum comes pecto vulgivagus calco adeo. Villa viriliter carus ambitus. Vicissitudo amita deludo vitiosus admoneo.', 'light', 'text_nl'),
(31, 38, 'https://avatars.githubusercontent.com/u/39868028', 'Aedificium decens fugit vinitor tabula. Crinis cetera necessitatibus. Expedita vergo caveo vapulus textilis.', 'light', 'text_en'),
(32, 22, 'https://avatars.githubusercontent.com/u/60876079', 'Sub vomito spiculum aequitas usque ex patior. Timidus ante vitae. Unus beneficium thesis animus cumque.', 'dark', 'text_fr'),
(33, 43, 'https://avatars.githubusercontent.com/u/51738278', 'Vallum sui quaerat eligendi bardus. Strenuus deserunt compono cresco tui trepide summisse uberrime. Tempore comparo laboriosam suffragium aggero cui cupiditate.', 'light', 'text_en'),
(34, 27, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/319.jpg', 'Brevis cupressus comminor angelus accedo repellendus vitium. Celer cupiditas ambitus vobis sodalitas perspiciatis curo. Amor tenus convoco adflicto testimonium aperte turpis delectatio.', 'dark', 'text_nl'),
(35, 42, 'https://avatars.githubusercontent.com/u/62971441', 'Cattus considero vergo benigne thalassinus nam. Fugit curvo acsi. Custodia aduro amet.', 'light', 'text_fr'),
(36, 4, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/570.jpg', 'Dolore sustineo vere. Socius ceno thalassinus. Arceo vilitas aegrotatio approbo nemo apud villa delinquo magni.', 'light', 'text_fr'),
(37, 37, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/188.jpg', 'Tabesco tabgo cavus. Ocer vilitas vitae voluptates reiciendis ancilla accommodo pecto adfero. Inventore soluta tandem vergo.', 'dark', 'text_en'),
(38, 14, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/280.jpg', 'Antiquus ab cedo aggero ater caries vesco tunc clamo. Basium aperiam adfero cur careo comparo curiositas circumvenio theatrum occaecati. Cupressus vorago coepi.', 'light', 'text_nl'),
(39, 34, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/436.jpg', 'Strenuus tandem suppellex aveho ager aggero usque conduco casso suffragium. Absum vos amet adficio quo denego accedo. Cunae capillus asporto arca agnitio tempora amiculum caritas strenuus repellat.', 'dark', 'text_fr'),
(40, 25, 'https://avatars.githubusercontent.com/u/22278136', 'Demo curtus adeptio via volutabrum similique curriculum. Aeternus spoliatio ullus sui facere tollo adsum virga. Sed clementia deprecator vester acer demergo.', 'dark', 'text_fr'),
(41, 23, 'https://avatars.githubusercontent.com/u/66750211', 'Torrens cibo vigor venustas crinis. Argumentum ambitus soluta delectatio statim reiciendis umquam vel arcesso culpo. Studio aqua sit tamdiu veniam adfectus corrupti.', 'dark', 'text_nl'),
(42, 8, 'https://avatars.githubusercontent.com/u/37034473', 'Quam maiores balbus tero copiose tribuo audeo curto curriculum nemo. Catena aeger curo curatio thermae ascisco. Assentator adipiscor dolorum assumenda vulgo abbas causa.', 'dark', 'text_nl'),
(43, 21, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/886.jpg', 'Aro crastinus qui arcesso terga conduco contigo qui. Commemoro pel tero totidem adstringo ab veritas. Labore caput thorax catena abduco.', 'dark', 'text_en'),
(44, 17, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/932.jpg', 'Coerceo villa conqueror crudelis complectus velit laudantium demitto. Vigor necessitatibus tumultus admoveo compello audacia creo distinctio. Depereo auxilium adipiscor.', 'dark', 'text_nl'),
(45, 15, 'https://avatars.githubusercontent.com/u/8200485', 'Sublime claustrum cuius cursus ipsa clarus subiungo urbs. Creptio adinventitias error condico vulgo tibi inflammatio amiculum. Id adflicto solus virga.', 'light', 'text_en'),
(46, 30, 'https://avatars.githubusercontent.com/u/38450965', 'Beneficium derelinquo desparatus doloremque statua vesper talis. Via voluptates strenuus audentia caute quam. Ustulo omnis veniam.', 'light', 'text_en'),
(47, 3, 'https://avatars.githubusercontent.com/u/34911604', 'Subito tutis tibi cohors. Et volva mollitia thymum spero. Armarium demoror sum.', 'dark', 'text_nl'),
(48, 7, 'https://avatars.githubusercontent.com/u/17780770', 'Nihil contra corpus custodia valde aedificium. Sumptus distinctio tergiversatio temeritas minima possimus. Deserunt condico aliquam arma curis vitiosus.', 'dark', 'text_fr'),
(49, 1, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/925.jpg', 'Spargo laudantium auditor pecus quaerat arca virtus volubilis candidus subseco. Caste coniuratio tabesco defleo suasoria absorbeo ustilo. Recusandae perferendis provident casso suffragium.', 'light', 'text_fr'),
(50, 33, 'https://avatars.githubusercontent.com/u/9233202', 'Consectetur curvo placeat uterque nam certe culpo accommodo cum consequuntur. Triduana attero conor admitto nemo volaticus voluptatum curto adulatio dignissimos. Conatus appono patruus adfero autus temeritas demo.', 'light', 'text_fr'),
(51, 51, 'https://avatars.githubusercontent.com/u/71884175', 'Testing Account', 'light', 'text_en');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user_purchases`
--

CREATE TABLE `user_purchases` (
  `id` int(11) NOT NULL,
  `timeOfPurchase` datetime NOT NULL,
  `productId` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `productName` text NOT NULL,
  `productImage` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Gegevens worden geëxporteerd voor tabel `user_purchases`
--

INSERT INTO `user_purchases` (`id`, `timeOfPurchase`, `productId`, `price`, `productName`, `productImage`) VALUES
(8, '2023-10-14 00:00:00', 14, 383, 'Intelligent Soft Pizza', 'https://loremflickr.com/640/480?lock=3514985902768128'),
(44, '2023-10-26 00:00:00', 26, 513, 'Awesome Frozen Computer', 'https://loremflickr.com/640/480?lock=2297265488134144'),
(18, '2023-10-26 00:00:00', 26, 420, 'Small Concrete Sausages', 'https://picsum.photos/seed/cFd4uQw6/640/480'),
(25, '2023-10-20 00:00:00', 21, 596, 'Awesome Fresh Sausages', 'https://picsum.photos/seed/57BUX/640/480'),
(41, '2023-10-10 00:00:00', 48, 541, 'Unbranded Plastic Gloves', 'https://loremflickr.com/640/480?lock=246992034856960'),
(28, '2023-11-03 00:00:00', 46, 133, 'Refined Fresh Car', 'https://picsum.photos/seed/e5WMW/640/480'),
(46, '2023-10-31 00:00:00', 36, 336, 'Oriental Bronze Mouse', 'https://loremflickr.com/640/480?lock=1958099233538048'),
(6, '2023-11-06 00:00:00', 28, 762, 'Tasty Concrete Fish', 'https://loremflickr.com/640/480?lock=5375794022973440'),
(26, '2023-10-29 00:00:00', 28, 796, 'Practical Bronze Salad', 'https://loremflickr.com/640/480?lock=892526990983168'),
(17, '2023-10-25 00:00:00', 25, 332, 'Unbranded Granite Tuna', 'https://loremflickr.com/640/480?lock=6134957590183936'),
(40, '2023-10-15 00:00:00', 14, 718, 'Sleek Rubber Cheese', 'https://picsum.photos/seed/cgkzzKLU/640/480'),
(35, '2023-10-12 00:00:00', 40, 841, 'Awesome Fresh Chicken', 'https://loremflickr.com/640/480?lock=7097505380564992'),
(6, '2023-11-02 00:00:00', 49, 382, 'Licensed Fresh Shirt', 'https://picsum.photos/seed/mJeI9UQ/640/480'),
(46, '2023-10-18 00:00:00', 9, 221, 'Generic Metal Keyboard', 'https://loremflickr.com/640/480?lock=4674483958841344'),
(25, '2023-10-19 00:00:00', 40, 730, 'Recycled Cotton Chicken', 'https://picsum.photos/seed/RuYbnGQ/640/480'),
(21, '2023-11-05 00:00:00', 47, 364, 'Luxurious Wooden Table', 'https://picsum.photos/seed/I8q36g0e4o/640/480'),
(1, '2023-10-10 00:00:00', 43, 932, 'Oriental Granite Computer', 'https://picsum.photos/seed/hfoktvZhv/640/480'),
(34, '2023-10-30 00:00:00', 2, 933, 'Oriental Soft Bacon', 'https://picsum.photos/seed/CcgGl/640/480'),
(17, '2023-10-17 00:00:00', 36, 383, 'Bespoke Soft Pizza', 'https://loremflickr.com/640/480?lock=8925397559279616'),
(42, '2023-10-23 00:00:00', 49, 675, 'Unbranded Wooden Table', 'https://picsum.photos/seed/3eElOC5Y6K/640/480'),
(13, '2023-10-10 00:00:00', 30, 7, 'Gorgeous Granite Pizza', 'https://picsum.photos/seed/D7MiRKvJ/640/480'),
(6, '2023-10-28 00:00:00', 14, 241, 'Handcrafted Bronze Table', 'https://loremflickr.com/640/480?lock=4254117589417984'),
(26, '2023-10-31 00:00:00', 31, 723, 'Handcrafted Bronze Pants', 'https://picsum.photos/seed/hgBCR/640/480'),
(50, '2023-10-31 00:00:00', 30, 862, 'Luxurious Granite Chicken', 'https://picsum.photos/seed/CHYq3jLz5L/640/480'),
(23, '2023-10-26 00:00:00', 28, 646, 'Oriental Bronze Hat', 'https://picsum.photos/seed/VFpy3aHg/640/480'),
(32, '2023-10-20 00:00:00', 25, 209, 'Intelligent Frozen Computer', 'https://loremflickr.com/640/480?lock=5980053926051840'),
(17, '2023-11-09 00:00:00', 1, 207, 'Fantastic Plastic Towels', 'https://loremflickr.com/640/480?lock=2291592652128256'),
(42, '2023-10-20 00:00:00', 49, 406, 'Luxurious Rubber Hat', 'https://loremflickr.com/640/480?lock=8295974308937728'),
(16, '2023-10-12 00:00:00', 27, 296, 'Generic Granite Pants', 'https://loremflickr.com/640/480?lock=7589571447488512'),
(34, '2023-10-20 00:00:00', 19, 223, 'Electronic Granite Chips', 'https://picsum.photos/seed/aZDR1oh0u7/640/480'),
(48, '2023-10-25 00:00:00', 41, 457, 'Handcrafted Wooden Fish', 'https://loremflickr.com/640/480?lock=1432949465546752'),
(5, '2023-11-02 00:00:00', 4, 366, 'Luxurious Wooden Chair', 'https://loremflickr.com/640/480?lock=2874115134324736'),
(40, '2023-11-01 00:00:00', 24, 822, 'Licensed Rubber Hat', 'https://picsum.photos/seed/ESQeZ1T/640/480'),
(3, '2023-10-21 00:00:00', 24, 75, 'Bespoke Fresh Pants', 'https://picsum.photos/seed/DtVkUwOCUp/640/480'),
(21, '2023-10-25 00:00:00', 12, 286, 'Oriental Wooden Table', 'https://loremflickr.com/640/480?lock=2484717339279360'),
(16, '2023-10-23 00:00:00', 26, 322, 'Luxurious Steel Car', 'https://loremflickr.com/640/480?lock=3841684515323904'),
(43, '2023-10-16 00:00:00', 46, 114, 'Small Fresh Car', 'https://loremflickr.com/640/480?lock=8935151052521472'),
(38, '2023-11-02 00:00:00', 41, 698, 'Intelligent Wooden Bacon', 'https://loremflickr.com/640/480?lock=6918071788765184'),
(35, '2023-10-26 00:00:00', 40, 838, 'Unbranded Wooden Tuna', 'https://loremflickr.com/640/480?lock=8043774957584384'),
(31, '2023-11-05 00:00:00', 5, 638, 'Oriental Bronze Chips', 'https://loremflickr.com/640/480?lock=4812724569636864'),
(19, '2023-11-05 00:00:00', 38, 490, 'Handmade Plastic Chicken', 'https://loremflickr.com/640/480?lock=321514433937408'),
(8, '2023-10-16 00:00:00', 50, 97, 'Generic Metal Car', 'https://picsum.photos/seed/FDqADi1SBo/640/480'),
(11, '2023-11-02 00:00:00', 4, 889, 'Handcrafted Rubber Fish', 'https://loremflickr.com/640/480?lock=2627138123464704'),
(38, '2023-10-16 00:00:00', 44, 102, 'Licensed Rubber Soap', 'https://loremflickr.com/640/480?lock=5600260711776256'),
(23, '2023-10-17 00:00:00', 12, 902, 'Sleek Bronze Towels', 'https://loremflickr.com/640/480?lock=5371489844985856'),
(34, '2023-10-11 00:00:00', 6, 813, 'Modern Frozen Fish', 'https://loremflickr.com/640/480?lock=5087186124800000'),
(24, '2023-10-10 00:00:00', 20, 137, 'Recycled Granite Computer', 'https://picsum.photos/seed/rRYeXt9/640/480'),
(15, '2023-10-15 00:00:00', 45, 44, 'Practical Cotton Keyboard', 'https://picsum.photos/seed/Pq86G/640/480'),
(31, '2023-10-24 00:00:00', 33, 207, 'Gorgeous Metal Fish', 'https://picsum.photos/seed/CjwiGGKq/640/480'),
(31, '2023-10-18 00:00:00', 10, 791, 'Fantastic Frozen Mouse', 'https://loremflickr.com/640/480?lock=7907714164326400'),
(3, '2023-10-13 00:00:00', 1, 498, 'Bespoke Granite Fish', 'https://loremflickr.com/640/480?lock=277281486405632'),
(5, '2023-11-05 00:00:00', 22, 433, 'Awesome Metal Soap', 'https://picsum.photos/seed/TIsBNt/640/480'),
(45, '2023-10-26 00:00:00', 43, 679, 'Recycled Frozen Bike', 'https://picsum.photos/seed/cGglvk8wzq/640/480'),
(15, '2023-10-26 00:00:00', 8, 583, 'Bespoke Rubber Tuna', 'https://picsum.photos/seed/jxDgDv/640/480'),
(40, '2023-10-17 00:00:00', 49, 730, 'Luxurious Wooden Shirt', 'https://loremflickr.com/640/480?lock=2318085650382848'),
(38, '2023-10-25 00:00:00', 11, 525, 'Handmade Bronze Gloves', 'https://loremflickr.com/640/480?lock=1423551642992640'),
(47, '2023-10-19 00:00:00', 12, 247, 'Incredible Steel Bacon', 'https://loremflickr.com/640/480?lock=8509441120927744'),
(36, '2023-10-14 00:00:00', 13, 35, 'Elegant Rubber Chicken', 'https://loremflickr.com/640/480?lock=5696419973300224'),
(43, '2023-10-23 00:00:00', 24, 136, 'Refined Granite Pizza', 'https://picsum.photos/seed/kdBmeWP/640/480'),
(49, '2023-11-05 00:00:00', 39, 251, 'Incredible Bronze Chair', 'https://loremflickr.com/640/480?lock=2921758707417088'),
(38, '2023-11-03 00:00:00', 49, 286, 'Gorgeous Frozen Chicken', 'https://loremflickr.com/640/480?lock=6538956206243840'),
(30, '2023-10-19 00:00:00', 7, 233, 'Ergonomic Soft Keyboard', 'https://loremflickr.com/640/480?lock=6672384272629760'),
(24, '2023-11-03 00:00:00', 39, 552, 'Ergonomic Soft Soap', 'https://loremflickr.com/640/480?lock=6137396171112448'),
(11, '2023-11-08 00:00:00', 7, 128, 'Fantastic Frozen Computer', 'https://loremflickr.com/640/480?lock=624954313801728'),
(18, '2023-11-01 00:00:00', 19, 207, 'Licensed Frozen Shirt', 'https://picsum.photos/seed/wpKoID/640/480'),
(12, '2023-10-30 00:00:00', 6, 362, 'Licensed Cotton Keyboard', 'https://picsum.photos/seed/FZjUTc64aO/640/480'),
(13, '2023-10-14 00:00:00', 18, 459, 'Handcrafted Steel Pants', 'https://loremflickr.com/640/480?lock=7050832537190400'),
(12, '2023-10-16 00:00:00', 2, 582, 'Practical Plastic Chicken', 'https://loremflickr.com/640/480?lock=561914541244416'),
(48, '2023-10-24 00:00:00', 46, 403, 'Modern Bronze Sausages', 'https://loremflickr.com/640/480?lock=1382014722768896'),
(50, '2023-10-11 00:00:00', 9, 663, 'Handcrafted Fresh Tuna', 'https://picsum.photos/seed/3whwKZXCF6/640/480'),
(30, '2023-11-01 00:00:00', 9, 595, 'Modern Soft Salad', 'https://loremflickr.com/640/480?lock=1138273801994240'),
(7, '2023-11-05 00:00:00', 19, 296, 'Licensed Soft Pizza', 'https://loremflickr.com/640/480?lock=7534333388652544'),
(17, '2023-10-30 00:00:00', 21, 819, 'Practical Granite Keyboard', 'https://picsum.photos/seed/pPMDK3fGJ/640/480'),
(31, '2023-10-14 00:00:00', 29, 409, 'Unbranded Concrete Shoes', 'https://loremflickr.com/640/480?lock=2875561586196480'),
(42, '2023-10-13 00:00:00', 10, 137, 'Incredible Concrete Cheese', 'https://loremflickr.com/640/480?lock=6603904338886656'),
(13, '2023-10-17 00:00:00', 24, 135, 'Rustic Granite Tuna', 'https://loremflickr.com/640/480?lock=4179666678054912'),
(16, '2023-11-09 00:00:00', 14, 276, 'Elegant Plastic Pizza', 'https://loremflickr.com/640/480?lock=2930152524742656'),
(36, '2023-10-29 00:00:00', 40, 232, 'Unbranded Rubber Hat', 'https://picsum.photos/seed/oeFTVM3fEx/640/480'),
(7, '2023-10-16 00:00:00', 24, 392, 'Luxurious Soft Pizza', 'https://loremflickr.com/640/480?lock=470810795966464'),
(23, '2023-10-30 00:00:00', 1, 888, 'Oriental Fresh Pizza', 'https://loremflickr.com/640/480?lock=1496595684130816'),
(22, '2023-10-28 00:00:00', 28, 476, 'Oriental Granite Shirt', 'https://loremflickr.com/640/480?lock=6207112856207360'),
(41, '2023-11-08 00:00:00', 43, 234, 'Handmade Concrete Pizza', 'https://loremflickr.com/640/480?lock=6743407972057088'),
(14, '2023-10-24 00:00:00', 39, 842, 'Rustic Frozen Pants', 'https://picsum.photos/seed/xbIre/640/480'),
(29, '2023-11-07 00:00:00', 46, 817, 'Luxurious Rubber Salad', 'https://picsum.photos/seed/C4BhY/640/480'),
(7, '2023-10-20 00:00:00', 12, 270, 'Handmade Wooden Ball', 'https://picsum.photos/seed/egX3cGrK/640/480'),
(50, '2023-11-01 00:00:00', 41, 646, 'Practical Cotton Chair', 'https://loremflickr.com/640/480?lock=6484338050859008'),
(39, '2023-11-01 00:00:00', 42, 739, 'Modern Frozen Computer', 'https://loremflickr.com/640/480?lock=4921011476627456'),
(26, '2023-11-07 00:00:00', 22, 537, 'Luxurious Wooden Bike', 'https://picsum.photos/seed/PqxRWUjxR/640/480'),
(38, '2023-10-11 00:00:00', 37, 406, 'Tasty Steel Chair', 'https://loremflickr.com/640/480?lock=6855854666022912'),
(24, '2023-10-24 00:00:00', 41, 970, 'Fantastic Cotton Pants', 'https://loremflickr.com/640/480?lock=1108014782218240'),
(27, '2023-10-11 00:00:00', 35, 584, 'Oriental Rubber Car', 'https://picsum.photos/seed/wzN3YAxB/640/480'),
(45, '2023-10-26 00:00:00', 21, 431, 'Gorgeous Cotton Chair', 'https://picsum.photos/seed/mWcxtj9w5X/640/480'),
(35, '2023-10-31 00:00:00', 31, 778, 'Practical Rubber Computer', 'https://picsum.photos/seed/DtlAzMp5O/640/480'),
(37, '2023-11-07 00:00:00', 15, 473, 'Rustic Plastic Ball', 'https://loremflickr.com/640/480?lock=4658311538409472'),
(21, '2023-10-28 00:00:00', 32, 505, 'Recycled Cotton Computer', 'https://loremflickr.com/640/480?lock=4326566788071424'),
(5, '2023-11-08 00:00:00', 6, 146, 'Awesome Fresh Shoes', 'https://picsum.photos/seed/NdDHcA9/640/480'),
(10, '2023-11-01 00:00:00', 30, 726, 'Licensed Metal Bacon', 'https://loremflickr.com/640/480?lock=951002291240960'),
(23, '2023-10-14 00:00:00', 2, 835, 'Luxurious Frozen Bacon', 'https://picsum.photos/seed/JSOn4VFs3s/640/480'),
(23, '2023-10-26 00:00:00', 7, 54, 'Luxurious Soft Chicken', 'https://loremflickr.com/640/480?lock=6152187149287424'),
(18, '2023-10-14 00:00:00', 42, 762, 'Generic Soft Car', 'https://loremflickr.com/640/480?lock=1888736323305472'),
(51, '2023-10-26 05:49:18', 36, 16, 'Refined Rubber Chair', 'https://picsum.photos/seed/rFcrV6Wug/640/480');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `user_roles`
--

INSERT INTO `user_roles` (`id`, `name`) VALUES
(3, 'admin'),
(1, 'guest'),
(2, 'member');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user_role_mapping`
--

CREATE TABLE `user_role_mapping` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `user_role_mapping`
--

INSERT INTO `user_role_mapping` (`id`, `userid`, `roleid`) VALUES
(1, 14, 3),
(2, 28, 3),
(3, 31, 2),
(4, 35, 2),
(5, 24, 2),
(6, 10, 2),
(7, 48, 1),
(8, 22, 2),
(9, 9, 2),
(10, 17, 1),
(11, 49, 2),
(12, 32, 2),
(13, 7, 2),
(14, 29, 1),
(15, 6, 1),
(16, 42, 1),
(17, 37, 3),
(18, 21, 3),
(19, 34, 2),
(20, 11, 3),
(21, 13, 1),
(22, 26, 2),
(23, 38, 2),
(24, 46, 2),
(25, 20, 3),
(26, 27, 2),
(27, 43, 1),
(28, 33, 2),
(29, 41, 1),
(30, 16, 2),
(31, 3, 2),
(32, 18, 1),
(33, 39, 3),
(34, 23, 1),
(35, 2, 3),
(36, 19, 2),
(37, 5, 2),
(38, 47, 3),
(39, 50, 1),
(40, 4, 2),
(41, 1, 3),
(42, 12, 2),
(43, 30, 1),
(44, 8, 2),
(45, 36, 3),
(46, 45, 1),
(47, 15, 2),
(48, 40, 1),
(49, 44, 3),
(50, 25, 1);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `bidshistory`
--
ALTER TABLE `bidshistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_userid` (`userid`),
  ADD KEY `products_categoryid` (`categoryid`);
ALTER TABLE `products` ADD FULLTEXT KEY `search` (`name`,`description`);

--
-- Indexen voor tabel `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_category_name` (`name`);

--
-- Indexen voor tabel `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexen voor tabel `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_userid` (`userid`);

--
-- Indexen voor tabel `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexen voor tabel `user_role_mapping`
--
ALTER TABLE `user_role_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_mapping_roleid` (`roleid`),
  ADD KEY `role_mapping_userid` (`userid`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `bids`
--
ALTER TABLE `bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `bidshistory`
--
ALTER TABLE `bidshistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT voor een tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT voor een tabel `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT voor een tabel `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT voor een tabel `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `user_role_mapping`
--
ALTER TABLE `user_role_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_categoryid` FOREIGN KEY (`categoryid`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `profile_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `user_role_mapping`
--
ALTER TABLE `user_role_mapping`
  ADD CONSTRAINT `role_mapping_roleid` FOREIGN KEY (`roleid`) REFERENCES `user_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_mapping_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

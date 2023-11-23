-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--

-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2023 at 02:23 PM
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
CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL,
  `incoming_msg_id` int(255) NOT NULL,
  `outgoing_msg_id` int(255) NOT NULL,
  `msg` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- --------------------------------------------------------
-- Tabelstructuur voor tabel `advertisements`
--

CREATE TABLE `advertisements` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `sellerid` int(11) NOT NULL,
  `altText` text NOT NULL,
  `imageUrl` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `advertisements`
--

INSERT INTO `advertisements` (`id`, `productid`, `sellerid`, `altText`, `imageUrl`) VALUES
(10, 73, 52, 'Shrirmmpps', 'Banner_.png--userid-52.jpg'),
(11, 74, 52, 'Footbals! Tgree!', '5708f2cf0248b_thumb900.webp--userid-52.jpg');

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

-- --------------------------------------------------------

--
-- Table structure for table `delivery_orders`
--

CREATE TABLE `delivery_orders` (
  `id` int(11) NOT NULL,
  `customerid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `deliveryMethod` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_orders`
--

INSERT INTO `delivery_orders` (`id`, `customerid`, `productid`, `deliveryMethod`, `createdAt`) VALUES
(1, 53, 10, 'Express', '2023-11-19 13:21:52');
--
-- Gegevens worden geëxporteerd voor tabel `bids`
--

INSERT INTO `bids` (`id`, `productid`, `userid`, `bidPrice`, `bidOfferedAt`) VALUES
(1, 26, 52, 555.01, '2023-10-20 15:29:35'),
(2, 16, 52, 440.24, '2023-10-20 15:53:15'),
(3, 1, 52, 0.71, '2023-10-23 09:29:30');

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
  `id` int(11) NOT NULL,
  `notificationid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `read` tinyint(1) NOT NULL,
  `userid2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `products`
-- Tabelstructuur voor tabel `products`
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
  `endDate` datetime DEFAULT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `supportStandard` tinyint(1) NOT NULL DEFAULT 1,
  `supportExpress` tinyint(1) NOT NULL DEFAULT 1,
  `supportPickup` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `userid`, `categoryid`, `name`, `description`, `price`, `imageUrl`, `endDate`, `updatedAt`, `createdAt`, `supportStandard`, `supportExpress`, `supportPickup`) VALUES
(1, 47, 9, 'Incredible Bronze Fish', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 576.00, '17.jpg', '2023-11-24 14:00:00', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(2, 46, 8, 'Handmade Soft Shoes', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 368.00, '10.jpg', '2023-11-10 13:35:11', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(3, 9, 4, 'Awesome Soft Ball', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 406.00, '18.jpg', '2023-11-10 15:40:03', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(4, 11, 6, 'Gorgeous Frozen Car', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 400.00, '1.jpg', '2023-11-10 17:25:07', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(5, 26, 6, 'Rustic Steel Computer', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 472.00, '22.jpg', '2023-11-10 17:46:01', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(6, 32, 7, 'Handcrafted Concrete Mouse', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 935.00, '8.jpg', '2023-11-10 23:27:49', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(7, 17, 10, 'Sleek Wooden Shoes', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 160.00, '23.jpg', '2023-11-11 03:19:55', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(8, 22, 9, 'Recycled Rubber Gloves', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 482.00, '15.jpg', '2023-11-11 05:10:46', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(9, 20, 3, 'Generic Wooden Bacon', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 784.00, '16.jpg', '2023-11-10 14:04:00', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(10, 45, 7, 'Ergonomic Metal Keyboard', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 189.00, '46.jpg', '2023-11-19 14:19:00', '2023-11-19 13:18:25', '2023-11-10 12:58:34', 1, 1, 1),
(11, 10, 6, 'Sleek Concrete Chair', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 797.00, '3.jpg', '2023-11-11 02:17:56', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(12, 24, 8, 'Rustic Frozen Towels', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 338.00, '33.jpg', '2023-11-11 12:54:19', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(13, 43, 7, 'Elegant Wooden Mouse', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 86.00, '35.jpg', '2023-11-10 19:38:55', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(14, 27, 4, 'Bespoke Plastic Sausages', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 879.00, '11.jpg', '2023-11-10 16:38:01', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(15, 30, 9, 'Small Plastic Fish', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 642.00, '49.jpg', '2023-11-11 06:11:51', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(16, 37, 4, 'Ergonomic Cotton Sausages', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 855.00, '29.jpg', '2023-11-11 00:02:14', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(17, 4, 1, 'Ergonomic Steel Salad', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 783.00, '45.jpg', '2023-11-10 20:24:04', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(18, 16, 10, 'Generic Metal Tuna', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 435.00, '27.jpg', '2023-11-10 22:41:29', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(19, 13, 2, 'Ergonomic Rubber Hat', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 421.00, '14.jpg', '2023-11-10 22:13:38', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(20, 41, 7, 'Elegant Soft Shirt', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 403.00, '36.jpg', '2023-11-11 07:17:15', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(21, 18, 5, 'Licensed Rubber Pants', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 325.00, '43.jpg', '2023-11-10 17:11:22', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(22, 42, 3, 'Intelligent Granite Hat', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 778.00, '38.jpg', '2023-11-11 08:02:35', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(23, 5, 4, 'Generic Plastic Bike', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 362.00, '30.jpg', '2023-11-10 21:20:22', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(24, 33, 10, 'Rustic Rubber Table', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 852.00, '32.jpg', '2023-11-11 08:36:58', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(25, 31, 9, 'Handmade Frozen Computer', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 861.00, '4.jpg', '2023-11-11 11:27:59', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(26, 38, 7, 'Tasty Granite Keyboard', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 324.00, '37.jpg', '2023-11-10 19:35:52', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(27, 35, 5, 'Practical Concrete Ball', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 909.00, '39.jpg', '2023-11-10 20:09:57', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(28, 2, 2, 'Elegant Cotton Towels', 'The Football Is Good For Training And Recreational Purposes', 247.00, '44.jpg', '2023-11-11 05:24:53', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(29, 39, 3, 'Intelligent Concrete Sausages', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 24.00, '5.jpg', '2023-11-11 09:02:32', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(30, 36, 1, 'Ergonomic Soft Pants', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 136.00, '7.jpg', '2023-11-11 08:20:54', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(31, 8, 3, 'Tasty Frozen Computer', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 740.00, '47.jpg', '2023-11-11 09:26:34', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(32, 23, 10, 'Intelligent Soft Chair', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 287.00, '40.jpg', '2023-11-10 19:38:27', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(33, 49, 7, 'Elegant Rubber Bike', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 953.00, '26.jpg', '2023-11-11 11:41:00', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(34, 44, 8, 'Awesome Concrete Keyboard', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 344.00, '20.jpg', '2023-11-11 01:38:06', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(35, 19, 4, 'Generic Soft Tuna', 'The Football Is Good For Training And Recreational Purposes', 120.00, '6.jpg', '2023-11-10 13:10:40', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(36, 14, 6, 'Awesome Steel Sausages', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 359.00, '31.jpg', '2023-11-10 23:32:08', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(37, 3, 7, 'Practical Steel Ball', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 529.00, '9.jpg', '2023-11-11 11:15:41', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(38, 25, 5, 'Ergonomic Rubber Fish', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 736.00, '21.jpg', '2023-11-10 21:15:13', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(39, 6, 3, 'Licensed Concrete Sausages', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 634.00, '13.jpg', '2023-11-11 07:56:46', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(40, 34, 9, 'Bespoke Metal Table', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 136.00, '2.jpg', '2023-11-11 02:30:06', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(41, 12, 9, 'Practical Soft Gloves', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 566.00, '19.jpg', '2023-11-10 14:39:36', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(42, 28, 2, 'Handmade Soft Chips', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 670.00, '25.jpg', '2023-11-11 03:07:41', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(43, 15, 9, 'Recycled Metal Chicken', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 667.00, '48.jpg', '2023-11-11 09:22:00', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(44, 29, 1, 'Generic Bronze Bike', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 209.00, '24.jpg', '2023-11-10 21:02:42', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(45, 48, 8, 'Modern Fresh Car', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 609.00, '42.jpg', '2023-11-11 00:55:05', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(46, 1, 10, 'Electronic Soft Shirt', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 646.00, '34.jpg', '2023-11-11 06:28:28', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(47, 40, 5, 'Electronic Plastic Computer', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 603.00, '28.jpg', '2023-11-10 14:47:19', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(48, 21, 3, 'Rustic Frozen Shoes', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 599.00, '12.jpg', '2023-11-10 15:27:31', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(49, 7, 7, 'Ergonomic Concrete Bacon', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 663.00, '50.jpg', '2023-11-11 09:29:01', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(50, 50, 2, 'Practical Wooden Chips', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 84.00, '41.jpg', '2023-11-10 22:31:57', '2023-11-10 13:53:28', '2023-11-10 12:58:34', 1, 1, 1),
(52, 52, 4, 'fungus two', 'ymumm', 530.01, 'Hortus_Haren_18-05-2019._(actm.)_03--userid-52.jpg', '2023-12-01 15:00:00', '2023-11-10 14:00:32', '2023-11-10 14:00:32', 1, 0, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product_categories`
-- Tabelstructuur voor tabel `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `icon`) VALUES
(1, 'Music', 'M12 6.042A8.967 8.967 0 006 3.75c-1.052 0-2.062.18-3 .512v14.25A8.987 8.987 0 016 18c2.305 0 4.408.867 6 2.292m0-14.25a8.966 8.966 0 016-2.292c1.052 0 2.062.18 3 .512v14.25A8.987 8.987 0 0018 18a8.967 8.967 0 00-6 2.292m0-14.25v14.25'),
(2, 'Automotive', 'M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0 0118 9.75v-.7V9A6 6 0 006 9v.75a8.967 8.967 0 01-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 01-5.714 0m5.714 0a3 3 0 11-5.714 0M3.124 7.5A8.969 8.969 0 015.292 3m13.416 0a8.969 8.969 0 012.168 4.5'),
(3, 'Electronics', 'M4.26 10.147a60.436 60.436 0 00-.491 6.347A48.627 48.627 0 0112 20.904a48.627 48.627 0 018.232-4.41 60.46 60.46 0 00-.491-6.347m-15.482 0a50.57 50.57 0 00-2.658-.813A59.905 59.905 0 0112 3.493a59.902 59.902 0 0110.399 5.84c-.896.248-1.783.52-2.658.814m-15.482 0A50.697 50.697 0 0112 13.489a50.702 50.702 0 017.74-3.342M6.75 15a.75.75 0 100-1.5.75.75 0 000 1.5zm0 0v-3.675A55.378 55.378 0 0112 8.443m-7.007 11.55A5.981 5.981 0 006.75 15.75v-1.5'),
(4, 'Health', 'M12 12.75c1.148 0 2.278.08 3.383.237 1.037.146 1.866.966 1.866 2.013 0 3.728-2.35 6.75-5.25 6.75S6.75 18.728 6.75 15c0-1.046.83-1.867 1.866-2.013A24.204 24.204 0 0112 12.75zm0 0c2.883 0 5.647.508 8.207 1.44a23.91 23.91 0 01-1.152 6.06M12 12.75c-2.883 0-5.647.508-8.208 1.44.125 2.104.52 4.136 1.153 6.06M12 12.75a2.25 2.25 0 002.248-2.354M12 12.75a2.25 2.25 0 01-2.248-2.354M12 8.25c.995 0 1.971-.08 2.922-.236.403-.066.74-.358.795-.762a3.778 3.778 0 00-.399-2.25M12 8.25c-.995 0-1.97-.08-2.922-.236-.402-.066-.74-.358-.795-.762a3.734 3.734 0 01.4-2.253M12 8.25a2.25 2.25 0 00-2.248 2.146M12 8.25a2.25 2.25 0 012.248 2.146M8.683 5a6.032 6.032 0 01-1.155-1.002c.07-.63.27-1.222.574-1.747m.581 2.749A3.75 3.75 0 0115.318 5m0 0c.427-.283.815-.62 1.155-.999a4.471 4.471 0 00-.575-1.752M4.921 6a24.048 24.048 0 00-.392 3.314c1.668.546 3.416.914 5.223 1.082M19.08 6c.205 1.08.337 2.187.392 3.314a23.882 23.882 0 01-5.223 1.082'),
(5, 'Shoes', 'M2.25 18.75a60.07 60.07 0 0115.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 013 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 00-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 01-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 003 15h-.75M15 10.5a3 3 0 11-6 0 3 3 0 016 0zm3 0h.008v.008H18V10.5zm-12 0h.008v.008H6V10.5z'),
(6, 'Computers', 'M2.25 21h19.5m-18-18v18m10.5-18v18m6-13.5V21M6.75 6.75h.75m-.75 3h.75m-.75 3h.75m3-6h.75m-.75 3h.75m-.75 3h.75M6.75 21v-3.375c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21M3 3h12m-.75 4.5H21m-3.75 3.75h.008v.008h-.008v-.008zm0 3h.008v.008h-.008v-.008zm0 3h.008v.008h-.008v-.008z'),
(7, 'Tools', 'M3.75 13.5l10.5-11.25L12 10.5h8.25L9.75 21.75 12 13.5H3.75z'),
(8, 'Toys', 'M9.75 3.104v5.714a2.25 2.25 0 01-.659 1.591L5 14.5M9.75 3.104c-.251.023-.501.05-.75.082m.75-.082a24.301 24.301 0 014.5 0m0 0v5.714c0 .597.237 1.17.659 1.591L19.8 15.3M14.25 3.104c.251.023.501.05.75.082M19.8 15.3l-1.57.393A9.065 9.065 0 0112 15a9.065 9.065 0 00-6.23-.693L5 14.5m14.8.8l1.402 1.402c1.232 1.232.65 3.318-1.067 3.611A48.309 48.309 0 0112 21c-2.773 0-5.491-.235-8.135-.687-1.718-.293-2.3-2.379-1.067-3.61L5 14.5'),
(9, 'Sports', 'M12 21v-8.25M15.75 21v-8.25M8.25 21v-8.25M3 9l9-6 9 6m-1.5 12V10.332A48.36 48.36 0 0012 9.75c-2.551 0-5.056.2-7.5.582V21M3 21h18M12 6.75h.008v.008H12V6.75z'),
(10, 'Clothing', 'M20.25 14.15v4.25c0 1.094-.787 2.036-1.872 2.18-2.087.277-4.216.42-6.378.42s-4.291-.143-6.378-.42c-1.085-.144-1.872-1.086-1.872-2.18v-4.25m16.5 0a2.18 2.18 0 00.75-1.661V8.706c0-1.081-.768-2.015-1.837-2.175a48.114 48.114 0 00-3.413-.387m4.5 8.006c-.194.165-.42.295-.673.38A23.978 23.978 0 0112 15.75c-2.648 0-5.195-.429-7.577-1.22a2.016 2.016 0 01-.673-.38m0 0A2.18 2.18 0 013 12.489V8.706c0-1.081.768-2.015 1.837-2.175a48.111 48.111 0 013.413-.387m7.5 0V5.25A2.25 2.25 0 0013.5 3h-3a2.25 2.25 0 00-2.25 2.25v.894m7.5 0a48.667 48.667 0 00-7.5 0M12 12.75h.008v.008H12v-.008z');

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

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `productid`, `userid`, `typeOfAbuse`, `context`, `createdAt`) VALUES
(1, 9, 52, 'Unreceived', 'i got nothin', '2023-11-10 13:08:06');

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
-- Table structure for table `successful_bids`
--

CREATE TABLE `successful_bids` (
  `id` int(11) NOT NULL,
  `originalBidid` int(11) NOT NULL,
  `bidderid` int(11) NOT NULL,
  `sellerid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `bidAcceptedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bidPrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `successful_bids`
--

INSERT INTO `successful_bids` (`id`, `originalBidid`, `bidderid`, `sellerid`, `productid`, `bidAcceptedAt`, `bidPrice`) VALUES
(1, 1, 52, 0, 9, '2023-11-19 13:16:41', 0.52),
(2, 2, 53, 0, 10, '2023-11-19 13:19:07', 3430.07);

-- --------------------------------------------------------

--
-- Table structure for table `successful_bids`
--

CREATE TABLE `successful_bids` (
  `id` int(11) NOT NULL,
  `originalBidid` int(11) NOT NULL,
  `bidderid` int(11) NOT NULL,
  `sellerid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `bidAcceptedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bidPrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `successful_bids`
--

INSERT INTO `successful_bids` (`id`, `originalBidid`, `bidderid`, `sellerid`, `productid`, `bidAcceptedAt`, `bidPrice`) VALUES
(1, 1, 52, 0, 9, '2023-11-19 13:16:41', 0.52),
(2, 2, 53, 0, 10, '2023-11-19 13:19:07', 3430.07);

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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `firstname`, `lastname`, `updatedAt`, `createdAt`) VALUES
(1, 'Magdalena_Runolfsson67', 'Jazmyn_Batz24@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Q4lW8+tmLJZdV2ZqMN2CQQ$ZGwFeBw2EL/9usKExGZi69yb2esMigjM6ONbJengQi0', 'Connor', 'Dickens', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(2, 'Allan_Hayes69', 'Hadley94@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$joV/HKbd3YmfNe6z01ub6Q$z//biFJ/BepfJ7F4mssSqVN3aJRHH74R410tjoEH5mk', 'Asia', 'Terry', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(3, 'Pietro97', 'Magali88@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$pbpTBGiIl74nqSLvH85cZg$JU/mqpeFjT3CyTg/6Nu2TExLJrfoREtjR7qYBgPnzjw', 'Janick', 'Fisher', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(4, 'Erna71', 'Samir_Krajcik@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$evOei3wXlEWG4N1p5ydPmQ$x/tk1T584lJd8coKUMUbqJWFwzkOWB2BqMPUPZ8dI6c', 'Aurore', 'Cassin', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(5, 'Aron.Mills89', 'Jeff.Will@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$efzf5OpE0635NtZZlXyYbw$UjpMb/wsQMuNMO7BFCwNNaV6CchW7zOGW8PJGhuhv8c', 'Arjun', 'Towne', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(6, 'Aiden.Mueller12', 'Murl.Hammes@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$vteEF+aNxFwIPOQuruGZRw$F9A6dsORXIXuZlzNWw1IfBOwSPPj01FlmafPadz1ixA', 'Caleigh', 'Mann', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(7, 'Ryder_Lueilwitz31', 'Dejah56@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$1bSUgwY9Tu39RieQMyp55A$G9aFFrNYN5MEzjtJ5cZ73O8tObTmjumo6j7ZY4RC3R4', 'Elsie', 'Roob', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(8, 'Abbigail78', 'Brad75@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$HgNEFqKBZWTEh95YYRVW3A$64myGrn7N/bysyYYZ4nW3S0d9OHx+SFLpEqt7/9Thnc', 'Rosanna', 'Green-Thompson', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(9, 'Ike_Hand', 'Rosina.Kihn96@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Sw284ZLfH3Bz6qEvaeMyfw$m6Ir2z+O37hZCitoyF7oslz+I4j+7VtjSGu0pukZAPM', 'Sandra', 'Waters', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(10, 'Elaina.Prohaska87', 'Alexander29@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$/KpRM3RnP9hkPBnNp8SwKg$8UJnzt5mPugHXe5r44MJPfbmSQ00lxchpBPsZi4b1s8', 'Whitney', 'Dare', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(11, 'Aracely_Towne', 'Barton.Smitham-Rolfson45@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$dq2H5hejSqah84Lev8sJjw$ziyIcQh70gMY0cBjfXlEisWu/Je+rjdqMhk+Qh/was8', 'Gerardo', 'Bernhard', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(12, 'Kira.Tremblay8', 'Aryanna_Johns84@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$j9ZGHihMPOBVZTkrWvWfeg$zxl+Yw3KJN3mH2yOKyo9w46owvjJ2CGc/fJ4s9Cbs7E', 'Elouise', 'Powlowski', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(13, 'Frederik11', 'Elbert94@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$48Vd/ZA+fCtz+4Ta9jLknA$beIL263aQe6oL+/641PfiqI22IRA2GLP6ThF8PZFTlE', 'Kris', 'Wisoky', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(14, 'Bradly.Blick39', 'Shea_Bergnaum@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$LSyvXKVJ5X0qp0TjrWzZyw$HUor2hzbQMXUp/LtXGI35bj8IelVZBjJVlKn0eQY0lw', 'Jeromy', 'Ankunding-Wehner', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(15, 'Lynn.Kertzmann23', 'Dusty36@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$2IW3Bl57mGbb64XScWjMOA$MXtKh3xX0eg8Ppe2ArRrDJPtAuoVAa7/i+rTn210Zfw', 'Johnpaul', 'Koepp', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(16, 'Emanuel71', 'Shannon_Goldner@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$2mt3ppQH5JQ17WVmpIij7g$h2mkoNC+iFSgN0VjwmYqnM7CkcNcZDvXSYfjVqcSY7M', 'Morgan', 'Rempel', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(17, 'Clemmie_Volkman', 'Jessica.Volkman64@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$yRUzJFljoB/cWWUwBkCtFA$hmRJQAemDShc/JrBcCfc7YsUHYhKzGnNX5HLQ9j1GCc', 'Tania', 'Medhurst', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(18, 'Wilbert53', 'Hope_Batz@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$6WAaCbH0Oxh5UCgvmTGFeA$6HYJTjHF1AgRXuSDSptc6VMWJ/GpS9PjYBU95dO2qlE', 'Carmen', 'Hilpert', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(19, 'Julien.Mosciski', 'Lamar_Doyle20@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$ZgJ/IF9bnmaq7IDnl6zuYA$R9MbfLUb0Ma7TqlUnN4xe+IlVOwfLQx0jqxYBRu5GD8', 'Ashlynn', 'Schumm', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(20, 'Alphonso_Will76', 'Amara66@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Cv6Bp6cICNzj2lllfBOCXQ$qA8gf+UaeGTn6AwehOxUGogOPMHoz8Ft5vGVa1IakQw', 'Carlotta', 'Waelchi', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(21, 'Bette19', 'Hazel94@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$q+AaGYkaCUSPcKXBt9hzpg$pHsvfBGPfuk0lPvRKXH6p+C5W1ObGtKQDjGd7lpeZpI', 'Alyce', 'Kuphal', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(22, 'Faustino_Von35', 'Edison.Bashirian@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$EK7eBq4sTEZFi2IX1zgdZw$Ub1pkcjz5QiquoXccgfX+MI4iYzD+whXkH77w2EDkyU', 'Melyna', 'Stehr', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(23, 'Dorthy51', 'Tyler_Rutherford0@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$659Iy7r0n2++gyIZe9jp4g$qmrvU+A4HfBkJVgvuGxTAMA5vi69h7GrmWXmxQzRb0k', 'Gregg', 'Abshire', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(24, 'Tianna_Armstrong51', 'Dylan.VonRueden93@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$X2whsKf3QcCiAAuh5SxD/g$hdWXR0Vzm3FP6y3fFe0nFZJb+HEKpnC0GEgFyJxgM+A', 'Gudrun', 'Kshlerin', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(25, 'Adolfo6', 'Ophelia40@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$o7QdGQ/mcsSVbM6VUyJ+MQ$pdzL4hnM8tEBinex0u3X8+Ws/+xv3vwHlA7hBS8s+KY', 'Reinhold', 'Harvey', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(26, 'Murray.Schamberger79', 'Parker4@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$POTTIQKZxYHl8dVxEtAgww$gKLJMDE9YrOY4qFEwnvR4VwPf2gcKG2W93a6rExwVMM', 'Amely', 'Ullrich', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(27, 'Rico_Wolff3', 'Judson15@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$y7wxhv1Kr2CKmT5LqPAiPA$9xb+tdmhyGwkwRwvOf+VB2AKgJ7N2JSd34PZXV4qGhs', 'Braxton', 'Hermiston', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(28, 'Myrtie67', 'Nona41@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$1mkxaYorN8ERrlALpEWC8g$/B/kyID+FiCPlGWwa8cXMDxQ/33hGrM0F9z/byBHMZk', 'Gaetano', 'Block', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(29, 'Marisol_Osinski21', 'Laila.Nikolaus32@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$WRlix6aDDkUsknj8to0wow$nzv3TFx4o6uTZY04KcikF5qhloTeBtgC6ePaAuUpELw', 'Ubaldo', 'Roob', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(30, 'Berta_Rodriguez', 'Demetrius.Moore90@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$nYsgex+8mjwRRzNTtrl+yQ$KGmLNr6YU5hwXnFhYWRWoI4pwayRE+pWiryRZbjY70Q', 'Porter', 'Stokes', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(31, 'Eva_Erdman7', 'Tad_Brekke58@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$SkrzSn+0o0T0J0YehqMvVg$hUZxPIqQ7ZxsNnRebt1m7/J75qvbnSNBOLPO4CTKBog', 'Alize', 'Kub', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(32, 'Ulises26', 'Felipa.West@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$HwWwg/NjDqax7MTftpXlBg$Jq0vtse1Rxi9KJgtpxBiRViHTKcNO8ZlYj4SPxgvZzA', 'Eleonore', 'Pacocha', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(33, 'Delia15', 'Barry_Crist6@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$AVYBM5uCgAMUfL6yRDOOow$EdyMtqXtmtFLIN/ciN9ianbw7D0uybz1V5URf5PSvig', 'Buster', 'Yundt', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(34, 'Valentin_Bartoletti79', 'Marta.Abernathy33@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$BQqrz35j7Dg1cgJz5b2/WQ$hksHbzTqleHwo+ywnGhgpU/oZkmdADeZNfyyzoQTXbs', 'Alf', 'Nienow', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(35, 'Manuel_Kris74', 'Samson_Batz@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$4Q4eZ2YMG4vNKGNHqCftRw$5RlpEBRPtg+gtZNqy4MdUEvAnueQH75fkQpm0YzzNC8', 'Rubie', 'McLaughlin', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(36, 'Nick.Okuneva', 'Torrey30@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$xk73+/Cw86eMWn63dWhT0w$QcxwUmsnLv+BhoWR/3Ee49jlC6jq1yDEvk8Qz/uK4XY', 'Shea', 'Yost', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(37, 'Amelia.Bode', 'Lauretta.Wehner@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$7rTcScvOwncfuGgq7IHGfQ$w3fOWl4V6+42i3JOe/7amRMBdWQMFrOpjtI+hYuTG9M', 'Leopoldo', 'Greenholt-Kiehn', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(38, 'Eduardo.Marvin26', 'Olen42@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$O2Fh8Qe3P9rtFtTLlSL7pw$SmjJeDKxBIL+WVgy5qpZxeaWU/03+7dC17F5MOEEYFw', 'Jailyn', 'Schumm', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(39, 'Lera_Sauer', 'Cristobal_Rutherford97@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$EvBsiZlkGEaVtBibzNb70Q$1+Jo/Bib5EpwfwexFIHbkpa2rPJslg8NB2LFL2XzTOo', 'Danny', 'Smitham', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(40, 'Bryana78', 'Zoey.Kutch@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$maCAN3g5mPuhZfDuduw3Pg$8ZmL+uoM3glmGMuwjkOpxMRPzr2A/jx1Fra02Gtl6rA', 'Simeon', 'Schultz', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(41, 'Gloria_Bins', 'Emil.Windler@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$r41ABRQ46FLfXwt399ahjw$eShozSCpf4EpHY+HSBSrmG6/X7HaxfoGvnVQeLYvTXs', 'Dedrick', 'Mueller', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(42, 'Fleta.Erdman39', 'Jamel_Mills@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$on+sH28m6EwvXXVOtQTTfw$s3VlGZkeoiwvAG5L6BZU0ezCzcqvm9vsOff+DBqWSYQ', 'Zander', 'Gerhold', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(43, 'Columbus_McGlynn53', 'Timothy_Funk-Shanahan50@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$BvKAxp1QEmh4tSFpc728ig$RHDpfzZC9UWqJyFztYC7o4qRVnysaQwUiX21kQk1t/c', 'Layla', 'Cummings', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(44, 'Adolfo.Pfannerstill', 'Hildegard.Christiansen@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Dev4paSrsZbRvzOfxhQY6g$ZmN0haRHdJ5UGTzUNRyNmjZS0gqfyM+BDZy6ndykqwY', 'Reyna', 'Champlin', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(45, 'Ralph_Kessler', 'Ryan12@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$eJl3hvNuXv6HtgzHQgVQCQ$UVVxy1phkA9fPyK7wBlM4RsD5/ZZQWo1jg7KNXilEVY', 'Dandre', 'Keebler', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(46, 'Maybelle.Hauck', 'Ellsworth_Gleason23@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$Er+04qgcvLCiqD7SvdP77A$92eAAaMTuavpvGYC9SRAfLDUUG6MUKu7GM279XTBUt0', 'Rachel', 'Swaniawski', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(47, 'Melany.Lebsack50', 'Loy.Bauch@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$fzBW9WJHnMzF7PaSjIQ9TQ$AmEt9SPjM5sbXqH3o+B9g7JgG9W3daWpHxVePddg0Hg', 'Sister', 'Robel', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(48, 'Johnnie.Schaefer75', 'Mustafa.Swift@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$XeciBGpu7AVCrMcu4OjXKQ$LH31R9E3UPDcIjE7vakAVdZ0SKZxgSGhNhae1OND5cs', 'Drake', 'Kuhlman', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(49, 'Sim_Considine', 'Frederick78@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$pJPIpY2mj8SVKcV2BoWJJQ$JuMeSCC2fM8Oorl+uWpisx6lnknOlg4zHU261WLO+l8', 'Luisa', 'Lebsack', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(50, 'Annalise76', 'Shanny.Sporer75@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$MMsIvPE+zi/LHDYsQb3puQ$+T8kJsl/wLLgRKncyqH+YVRvjzwxa3ac8E0nPTsGVjY', 'Otto', 'Tremblay', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(51, 'Testing Account', 'test@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Fsrn7g0oJlrtBqeN688+aQ$I888DW8sXM01Miu0kNJl8u+yq1Lr3pd9Oj6Q5e8xJJc', 'Testing', 'Account', '2023-11-10 12:58:34', '2023-11-10 12:58:34'),
(52, 'xdfcvgjklm', 'john@johnson.com', '$argon2id$v=19$m=65536,t=4,p=1$MDV3VDFuSVhOZERjZFhpUg$ezaweTPW9LWN75hyEAikL8z/bzgn9hpBQx6OcM2Agq0', 'John', 'Johnson', '2023-11-10 12:59:33', '2023-11-10 12:59:33'),
(53, 'rkeikkzrlke', 'Er@gmaI.co', '$argon2id$v=19$m=65536,t=4,p=1$UEJwRFouYllQMHVzbnlQNQ$1NiuMYNlj55gdXzEbBEmr5zpw6I/wTd1zL8LTZwK2j0', 'Hel', 'Er', '2023-11-19 13:17:11', '2023-11-19 13:17:11');

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
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`id`, `userid`, `profilePictureUrl`, `about`, `theme`, `language`) VALUES
(1, 17, 'https://avatars.githubusercontent.com/u/56205165', 'Aro congregatio decumbo abscido vilis arcesso aggredior tonsor comptus. Accommodo odit auctus thesaurus virgo porro cruciamentum caelum canis. Abundans angelus admitto solium.', 'dark', 'text_en'),
(2, 26, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/577.jpg', 'Vindico casus contigo accusantium deputo concido illo versus tabesco. Territo textilis sodalitas viscus repudiandae colligo patior theca. Assentator tondeo quo succurro vespillo esse benevolentia.', 'light', 'text_en'),
(3, 6, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/654.jpg', 'Aequitas unus video termes provident pauper centum corrumpo beatus. Aduro aperte concido votum truculenter suppellex reiciendis aeneus vergo antiquus. Coepi doloribus depopulo vester.', 'light', 'text_nl'),
(4, 50, 'https://avatars.githubusercontent.com/u/28494631', 'Verbum necessitatibus pectus iure sophismata considero stipes. Tunc spectaculum tam ancilla nesciunt adeptio degenero timidus addo. Vos tollo abstergo magnam totus deduco.', 'dark', 'text_fr'),
(5, 25, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/186.jpg', 'Tam videlicet claudeo. Accusator voluptates laboriosam tergeo aegrotatio debitis esse deprimo adfectus deporto. Nisi aedificium caelum deficio acer perspiciatis aegrotatio infit.', 'dark', 'text_fr'),
(6, 48, 'https://avatars.githubusercontent.com/u/33005645', 'Conventus teneo summopere cornu autem delibero cohaero denuo dolore. Provident volva arbustum caries vaco cubo vulariter. Theca aranea cui denego.', 'light', 'text_fr'),
(7, 22, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1147.jpg', 'Calco dens enim velut ante. Paens debitis sollicito fuga cotidie decor. Quibusdam aliquid alioqui absum sopor varietas adamo tertius temperantia arcus.', 'dark', 'text_nl'),
(8, 32, 'https://avatars.githubusercontent.com/u/56998642', 'Minima comptus quae tamquam uxor agnosco. Tres sodalitas debilito alienus ater quisquam annus vinco earum ago. Caries adinventitias adstringo crux crinis dolor.', 'light', 'text_en'),
(9, 13, 'https://avatars.githubusercontent.com/u/85869182', 'Aestus tenuis sopor amaritudo varius audentia. Id audax adsuesco suasoria defendo arma supra tergo adiuvo. Corrumpo dicta maiores adaugeo vester.', 'light', 'text_nl'),
(10, 29, 'https://avatars.githubusercontent.com/u/43902816', 'Via tendo tollo thesis. Attonbitus crapula desolo varietas nesciunt. Quod aegrus perferendis tenetur curiositas synagoga caste.', 'dark', 'text_en'),
(11, 45, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/832.jpg', 'Carpo supellex odio debeo tamquam vociferor. Ipsa voluptatem trans. Creta conventus usus sum sed depereo.', 'light', 'text_nl'),
(12, 43, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/422.jpg', 'Quas arto sol sollicito trepide ventito cursus adstringo teres uredo. Advenio ars agnosco bonus fugiat solus theca. Bellum vicissitudo utrimque excepturi sollicito stips fugiat tendo.', 'dark', 'text_nl'),
(13, 10, 'https://avatars.githubusercontent.com/u/94832879', 'Valens caveo spargo. Infit vespillo vigilo coaegresco aranea conor accusantium. Sint vergo astrum atrocitas saepe cunctatio aegre thesaurus.', 'light', 'text_nl'),
(14, 23, 'https://avatars.githubusercontent.com/u/48510588', 'Omnis odit ratione ipsam. Ars degusto iusto soluta terminatio supplanto. Venio odio ambitus.', 'light', 'text_nl'),
(15, 34, 'https://avatars.githubusercontent.com/u/15912345', 'Explicabo aperio possimus cognatus. Ex ager vestigium texo terebro laborum corona vehemens spiculum deporto. Aetas totus adstringo eaque urbanus tabula vorax tum.', 'light', 'text_nl'),
(16, 4, 'https://avatars.githubusercontent.com/u/22076672', 'Uberrime ambulo solium victus una arma aegrus vos terreo. Vapulus vespillo celer arcus defendo surgo dens vulgaris claudeo. Degusto vomito absorbeo chirographum summopere tondeo abduco temptatio a cena.', 'dark', 'text_en'),
(17, 30, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/46.jpg', 'Crustulum decet quia ambulo pax spiculum astrum talus concedo. Et defleo conturbo ulciscor possimus demulceo ager adeo id. Concedo arbitro nisi cresco.', 'light', 'text_en'),
(18, 11, 'https://avatars.githubusercontent.com/u/50611344', 'Alioqui voluntarius delectus coadunatio abundans theologus spiritus vivo laboriosam itaque. Debilito ea adfectus thema vulpes. Ad deripio succurro.', 'light', 'text_fr'),
(19, 27, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/28.jpg', 'Fugit arto strenuus quo enim porro apostolus cattus subiungo vitiosus. Suggero aeneus deprimo maxime cado. Callide tumultus attonbitus inventore ait abbas suggero solvo.', 'light', 'text_en'),
(20, 28, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/216.jpg', 'Celebrer cinis sophismata caecus. Callide compello defungo tumultus coepi concedo ultio vinitor abutor. Antiquus verbera apparatus aro suspendo exercitationem antiquus subseco damnatio termes.', 'light', 'text_nl'),
(21, 19, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1086.jpg', 'Tredecim dolor viduo sulum cohors sono eum delego natus. Alioqui caterva repudiandae corrumpo usque expedita aptus sit. Surculus ancilla pecus acidus taceo conculco utroque appono.', 'light', 'text_en'),
(22, 3, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1163.jpg', 'Vociferor cohibeo aggero numquam. Tumultus quae coruscus solitudo viscus cum patruus. Somniculosus totidem conspergo adeptio constans toties acerbitas.', 'dark', 'text_en'),
(23, 18, 'https://avatars.githubusercontent.com/u/500023', 'Cresco vigilo aperio tam vita comprehendo caelum iure vociferor aperiam. Uxor tristis absque ceno beatus. Cum acervus minus odio adamo corrumpo adfectus vesper tremo carmen.', 'dark', 'text_nl'),
(24, 21, 'https://avatars.githubusercontent.com/u/79698501', 'Tempus bonus vestrum est. Circumvenio tergeo nulla custodia asporto clamo clarus depulso trans. Comis tibi adfero adhaero iusto coadunatio cultellus.', 'dark', 'text_nl'),
(25, 42, 'https://avatars.githubusercontent.com/u/57907670', 'Tristis thorax defero claustrum magnam. Vulpes cedo cimentarius vix tenus celer suggero casso debeo. Solitudo bene cinis dens cohaero deduco sursum adimpleo thema.', 'light', 'text_fr'),
(26, 33, 'https://avatars.githubusercontent.com/u/11075766', 'Terreo venio cibus. Carcer impedit verus canonicus. Sufficio provident defaeco synagoga verecundia succedo delego neque.', 'dark', 'text_fr'),
(27, 44, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/945.jpg', 'Vix ullus maxime paens. Capillus deludo quod ab. Tenetur artificiose patrocinor defetiscor.', 'dark', 'text_fr'),
(28, 39, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/209.jpg', 'Unus curiositas laboriosam colo utroque abstergo usus. Venia sophismata conduco cubo non. Derideo pauci terra debeo apto astrum non sonitus.', 'dark', 'text_en'),
(29, 36, 'https://avatars.githubusercontent.com/u/73610086', 'Arcesso dens carpo natus terreo cilicium. Amet avarus culpo. Exercitationem textilis copiose viridis provident statua abeo libero coruscus.', 'dark', 'text_fr'),
(30, 15, 'https://avatars.githubusercontent.com/u/11804482', 'A sperno officia cubo cribro adversus amitto arto. Minus corroboro excepturi contigo admoneo. Et suppono celo calamitas.', 'dark', 'text_fr'),
(31, 9, 'https://avatars.githubusercontent.com/u/76168054', 'Via argumentum conicio in decretum crur odio tamquam audacia tabula. Ducimus thymbra demergo vulgivagus culpa vulnero. Veritas subseco admitto.', 'dark', 'text_nl'),
(32, 38, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/470.jpg', 'Desidero vinitor tersus soluta demonstro tepesco commodo eaque ancilla summopere. Dedico ulciscor tribuo claudeo vesco strues articulus. Sit agnitio vobis doloremque cedo substantia defero comprehendo vox defetiscor.', 'light', 'text_fr'),
(33, 24, 'https://avatars.githubusercontent.com/u/91617531', 'Spectaculum denuncio sed audentia cimentarius laborum. Celebrer aperte theologus arcus. Subnecto tum delectus sub baiulus desidero tremo.', 'dark', 'text_fr'),
(34, 37, 'https://avatars.githubusercontent.com/u/98879760', 'Talis et pel deporto centum tribuo. Cunae tamisium adeptio tabella pel vos decerno terminatio coma volubilis. Vespillo armarium complectus supra cibo tenax delinquo fugit eos.', 'light', 'text_nl'),
(35, 5, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/234.jpg', 'Avarus fugiat aureus ad ipsam repellendus ademptio. Talio synagoga voco vinculum crepusculum sufficio clam terror. Canonicus amplus tum.', 'light', 'text_nl'),
(36, 7, 'https://avatars.githubusercontent.com/u/10590960', 'Curto talio tripudio solitudo cometes. Accommodo voluptatem admiratio tremo celebrer adeo textus. Concido theologus recusandae stips super tredecim.', 'dark', 'text_fr'),
(37, 20, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/66.jpg', 'Ter torqueo tubineus ventosus apparatus. Nam similique defendo officiis debeo aliquam tactus basium annus sollers. Deleo acquiro nobis toties administratio appositus solitudo.', 'dark', 'text_en'),
(38, 1, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1071.jpg', 'Aeternus somniculosus verto umbra decipio angulus soleo contabesco calco despecto. Usus timidus vel tolero aliquam caelestis via bene causa campana. Deleo terra temeritas confugo vicissitudo officiis.', 'light', 'text_fr'),
(39, 49, 'https://avatars.githubusercontent.com/u/59890924', 'Alo in assentator caelum. Delibero veritatis creator a adinventitias ascisco summopere. Tamdiu supellex arguo tonsor vulgus quos adfero.', 'light', 'text_nl'),
(40, 2, 'https://avatars.githubusercontent.com/u/68575903', 'Urbs timidus deripio calco. Verbum carcer odit demoror. Victus arcus volo conduco.', 'light', 'text_en'),
(41, 14, 'https://avatars.githubusercontent.com/u/55103935', 'Sollers theologus socius sequi vos animus libero antea candidus. Depopulo demitto ulterius clibanus eos totus aeneus quo odit. Dicta venustas hic abscido sustineo caecus beneficium vado vere.', 'dark', 'text_nl'),
(42, 16, 'https://avatars.githubusercontent.com/u/8895378', 'Virtus crux vitium abeo conforto vomica altus. Apostolus terebro cado charisma tot fugiat cupiditas comptus umquam temporibus. Tyrannus degusto carbo.', 'dark', 'text_nl'),
(43, 40, 'https://avatars.githubusercontent.com/u/88790081', 'Decerno adsum curiositas aestus. Caput soleo alter aranea similique. Colo cupiditas amplus vomer sub.', 'dark', 'text_en'),
(44, 12, 'https://avatars.githubusercontent.com/u/21929462', 'Suppellex velut ademptio appello dolorem causa tergo. Constans beatae pauci carpo auctus victus. Auctus crux vulgaris creator caput adipiscor venio terra.', 'dark', 'text_nl'),
(45, 31, 'https://avatars.githubusercontent.com/u/59432103', 'Vester angustus architecto sint cursim adstringo pauper advoco canonicus. Advoco animadverto corona. Urbanus derideo crudelis odio ter valens cogito summisse bellum.', 'dark', 'text_fr'),
(46, 47, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/72.jpg', 'Culpa appositus amor adipiscor vinum trepide curvo tracto tyrannus. Antepono teneo triumphus sustineo. Comis copiose sollicito.', 'dark', 'text_nl'),
(47, 46, 'https://avatars.githubusercontent.com/u/81184388', 'Tabella ager vilicus audeo velum carbo repudiandae aliquam animus candidus. Arbor itaque aegrus adinventitias adnuo auxilium cupiditate. Ulterius coaegresco magni civitas sumo tardus utpote rerum cohors.', 'dark', 'text_en'),
(48, 35, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/44.jpg', 'Vel ventosus civitas maiores cupio testimonium. Culpa agnitio solus aptus degusto valde. Claro excepturi cilicium infit calco infit taceo commodi totidem deficio.', 'light', 'text_fr'),
(49, 41, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/133.jpg', 'Volo spiculum valeo bos dignissimos rerum tutamen solvo tero. Trepide tametsi advenio paens admoneo acies tempore corporis desidero. Amicitia reprehenderit cultura calco calamitas cur assentator tollo.', 'dark', 'text_nl'),
(50, 8, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/228.jpg', 'Cimentarius tristis deprecator allatus est fugiat subnecto. Ducimus admitto vitae tibi ut cruciamentum. Derelinquo cursim deludo.', 'dark', 'text_fr'),
(51, 51, 'https://avatars.githubusercontent.com/u/76388079', 'Testing Account', 'light', 'text_en'),
(52, 52, 'https://avatars.githubusercontent.com/u/64209400?v=4', 'Hello!', 'dark', 'text_en'),
(53, 53, 'https://avatars.githubusercontent.com/u/64209400?v=4', 'Hello!', 'light', 'text_en');

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
-- Dumping data for table `user_purchases`
--

INSERT INTO `user_purchases` (`id`, `timeOfPurchase`, `productId`, `price`, `productName`, `productImage`) VALUES
(32, '2023-10-20 00:00:00', 13, 146, 'Unbranded Granite Keyboard', 'https://loremflickr.com/640/480?lock=3652895920619520'),
(34, '2023-10-30 00:00:00', 23, 781, 'Rustic Cotton Car', 'https://picsum.photos/seed/1k4iVYKP6K/640/480'),
(30, '2023-10-19 00:00:00', 33, 903, 'Sleek Fresh Car', 'https://loremflickr.com/640/480?lock=6605780216184832'),
(20, '2023-11-04 00:00:00', 8, 254, 'Fantastic Granite Sausages', 'https://picsum.photos/seed/pEwjs/640/480'),
(13, '2023-11-05 00:00:00', 38, 581, 'Recycled Plastic Fish', 'https://loremflickr.com/640/480?lock=6144483150266368'),
(46, '2023-10-26 00:00:00', 24, 427, 'Awesome Steel Tuna', 'https://picsum.photos/seed/v3YPdbrd/640/480'),
(22, '2023-10-23 00:00:00', 28, 306, 'Generic Granite Chips', 'https://picsum.photos/seed/yo0L8nlM/640/480'),
(9, '2023-10-20 00:00:00', 45, 9, 'Refined Frozen Sausages', 'https://picsum.photos/seed/H2g4bn/640/480'),
(44, '2023-10-29 00:00:00', 23, 317, 'Modern Wooden Hat', 'https://loremflickr.com/640/480?lock=4748134483755008'),
(12, '2023-11-06 00:00:00', 39, 404, 'Bespoke Cotton Mouse', 'https://picsum.photos/seed/lcI5VCjHa/640/480'),
(34, '2023-10-25 00:00:00', 21, 778, 'Generic Rubber Bike', 'https://loremflickr.com/640/480?lock=2737733587959808'),
(20, '2023-10-12 00:00:00', 22, 579, 'Sleek Plastic Hat', 'https://picsum.photos/seed/5397g2F/640/480'),
(38, '2023-10-21 00:00:00', 50, 32, 'Rustic Soft Mouse', 'https://picsum.photos/seed/YGzJb/640/480'),
(9, '2023-10-12 00:00:00', 23, 553, 'Refined Plastic Shirt', 'https://loremflickr.com/640/480?lock=3522758357024768'),
(27, '2023-10-18 00:00:00', 32, 197, 'Sleek Rubber Cheese', 'https://picsum.photos/seed/nsqvye/640/480'),
(26, '2023-11-02 00:00:00', 15, 472, 'Practical Frozen Shirt', 'https://picsum.photos/seed/hpB2zoRcW/640/480'),
(46, '2023-10-12 00:00:00', 1, 207, 'Oriental Bronze Pizza', 'https://loremflickr.com/640/480?lock=775660964413440'),
(7, '2023-11-09 00:00:00', 21, 563, 'Refined Cotton Car', 'https://picsum.photos/seed/4FwPOVXG/640/480'),
(37, '2023-11-06 00:00:00', 2, 625, 'Oriental Soft Car', 'https://picsum.photos/seed/dS0uj/640/480'),
(11, '2023-10-31 00:00:00', 19, 392, 'Small Bronze Ball', 'https://loremflickr.com/640/480?lock=647641916506112'),
(18, '2023-10-13 00:00:00', 19, 433, 'Licensed Concrete Sausages', 'https://picsum.photos/seed/0O0n6h/640/480'),
(31, '2023-10-29 00:00:00', 8, 903, 'Practical Concrete Car', 'https://picsum.photos/seed/bJR9oC3DT/640/480'),
(48, '2023-10-22 00:00:00', 47, 588, 'Refined Fresh Mouse', 'https://loremflickr.com/640/480?lock=8443746999861248'),
(38, '2023-10-18 00:00:00', 37, 251, 'Generic Metal Chicken', 'https://picsum.photos/seed/75pGA/640/480'),
(13, '2023-10-19 00:00:00', 30, 391, 'Practical Rubber Car', 'https://loremflickr.com/640/480?lock=2106346616913920'),
(47, '2023-10-26 00:00:00', 18, 304, 'Luxurious Bronze Computer', 'https://picsum.photos/seed/X24kIhxt/640/480'),
(19, '2023-10-29 00:00:00', 19, 553, 'Ergonomic Bronze Sausages', 'https://picsum.photos/seed/odO5JX/640/480'),
(14, '2023-11-08 00:00:00', 34, 391, 'Awesome Concrete Salad', 'https://loremflickr.com/640/480?lock=5272848566321152'),
(3, '2023-10-23 00:00:00', 49, 791, 'Unbranded Steel Computer', 'https://loremflickr.com/640/480?lock=6180545492942848'),
(30, '2023-10-15 00:00:00', 39, 129, 'Generic Plastic Chicken', 'https://loremflickr.com/640/480?lock=5508590645280768'),
(21, '2023-11-09 00:00:00', 16, 525, 'Refined Granite Sausages', 'https://loremflickr.com/640/480?lock=3224637257285632'),
(10, '2023-11-01 00:00:00', 45, 187, 'Oriental Cotton Chair', 'https://picsum.photos/seed/yQ687VoczI/640/480'),
(43, '2023-10-15 00:00:00', 8, 25, 'Electronic Fresh Fish', 'https://picsum.photos/seed/aeHO7RoD/640/480'),
(20, '2023-10-13 00:00:00', 44, 704, 'Elegant Rubber Pants', 'https://picsum.photos/seed/mP6y17nx0/640/480'),
(38, '2023-10-19 00:00:00', 3, 201, 'Generic Metal Gloves', 'https://picsum.photos/seed/octN9A5A23/640/480'),
(49, '2023-10-26 00:00:00', 33, 911, 'Luxurious Frozen Sausages', 'https://picsum.photos/seed/QKewR79ac/640/480'),
(12, '2023-11-07 00:00:00', 42, 107, 'Luxurious Rubber Gloves', 'https://loremflickr.com/640/480?lock=228158435491840'),
(2, '2023-11-05 00:00:00', 34, 411, 'Awesome Steel Chicken', 'https://picsum.photos/seed/VMtIQ/640/480'),
(18, '2023-10-23 00:00:00', 11, 376, 'Luxurious Granite Shirt', 'https://loremflickr.com/640/480?lock=440217257377792'),
(10, '2023-11-05 00:00:00', 19, 524, 'Handcrafted Plastic Keyboard', 'https://loremflickr.com/640/480?lock=250253601144832'),
(27, '2023-10-20 00:00:00', 48, 837, 'Licensed Concrete Table', 'https://loremflickr.com/640/480?lock=7686270234918912'),
(40, '2023-10-29 00:00:00', 35, 638, 'Ergonomic Plastic Tuna', 'https://picsum.photos/seed/tHLII/640/480'),
(33, '2023-10-14 00:00:00', 24, 83, 'Small Plastic Ball', 'https://picsum.photos/seed/ZueEf/640/480'),
(3, '2023-10-31 00:00:00', 21, 322, 'Licensed Granite Ball', 'https://picsum.photos/seed/oxLx9NK1U/640/480'),
(24, '2023-11-04 00:00:00', 5, 55, 'Handmade Granite Chicken', 'https://loremflickr.com/640/480?lock=6924081307844608'),
(13, '2023-11-04 00:00:00', 25, 897, 'Electronic Metal Tuna', 'https://picsum.photos/seed/lw3TeOUV/640/480'),
(41, '2023-11-10 00:00:00', 17, 837, 'Practical Concrete Towels', 'https://loremflickr.com/640/480?lock=2399941706121216'),
(30, '2023-11-08 00:00:00', 32, 952, 'Luxurious Rubber Gloves', 'https://picsum.photos/seed/dr8z2GpvK4/640/480'),
(20, '2023-10-24 00:00:00', 10, 32, 'Unbranded Bronze Shoes', 'https://loremflickr.com/640/480?lock=6119758533492736'),
(35, '2023-10-20 00:00:00', 20, 648, 'Luxurious Steel Keyboard', 'https://picsum.photos/seed/BeFIPhzE/640/480'),
(33, '2023-10-21 00:00:00', 9, 929, 'Refined Fresh Bacon', 'https://loremflickr.com/640/480?lock=5563762081792000'),
(11, '2023-10-14 00:00:00', 34, 814, 'Luxurious Concrete Fish', 'https://loremflickr.com/640/480?lock=721394585305088'),
(34, '2023-10-25 00:00:00', 47, 601, 'Ergonomic Frozen Computer', 'https://loremflickr.com/640/480?lock=7931157796618240'),
(12, '2023-10-11 00:00:00', 27, 294, 'Fantastic Cotton Bacon', 'https://loremflickr.com/640/480?lock=8865950665277440'),
(6, '2023-10-29 00:00:00', 33, 324, 'Modern Frozen Car', 'https://loremflickr.com/640/480?lock=4207502891679744'),
(34, '2023-10-16 00:00:00', 49, 255, 'Unbranded Soft Chair', 'https://picsum.photos/seed/mpkWpia2/640/480'),
(43, '2023-10-13 00:00:00', 6, 682, 'Awesome Frozen Computer', 'https://loremflickr.com/640/480?lock=7561174658842624'),
(27, '2023-11-02 00:00:00', 23, 812, 'Modern Frozen Keyboard', 'https://loremflickr.com/640/480?lock=5505675859853312'),
(19, '2023-10-29 00:00:00', 35, 482, 'Gorgeous Steel Pants', 'https://picsum.photos/seed/Qk1S9Xc/640/480'),
(33, '2023-10-27 00:00:00', 49, 759, 'Gorgeous Plastic Cheese', 'https://loremflickr.com/640/480?lock=8097295465709568'),
(41, '2023-10-29 00:00:00', 1, 598, 'Small Soft Towels', 'https://loremflickr.com/640/480?lock=2650797577863168'),
(47, '2023-11-07 00:00:00', 18, 757, 'Generic Cotton Car', 'https://loremflickr.com/640/480?lock=1850478451228672'),
(10, '2023-11-08 00:00:00', 12, 14, 'Fantastic Rubber Bacon', 'https://loremflickr.com/640/480?lock=4259698893127680'),
(4, '2023-11-04 00:00:00', 12, 752, 'Licensed Wooden Ball', 'https://picsum.photos/seed/DDSGepnsmk/640/480'),
(7, '2023-10-30 00:00:00', 16, 675, 'Generic Soft Tuna', 'https://loremflickr.com/640/480?lock=7819666219073536'),
(39, '2023-10-30 00:00:00', 10, 181, 'Modern Cotton Chips', 'https://loremflickr.com/640/480?lock=662648270094336'),
(12, '2023-11-09 00:00:00', 18, 574, 'Incredible Cotton Pants', 'https://loremflickr.com/640/480?lock=3465100681805824'),
(16, '2023-10-13 00:00:00', 29, 562, 'Sleek Wooden Bike', 'https://picsum.photos/seed/ukOTaCw1/640/480'),
(7, '2023-10-21 00:00:00', 29, 599, 'Sleek Cotton Gloves', 'https://picsum.photos/seed/a33FqcEWOx/640/480'),
(23, '2023-10-16 00:00:00', 19, 731, 'Oriental Cotton Car', 'https://picsum.photos/seed/ByaycvJIL0/640/480'),
(22, '2023-10-20 00:00:00', 35, 635, 'Electronic Fresh Bacon', 'https://picsum.photos/seed/FKJOreNtZ/640/480'),
(28, '2023-10-25 00:00:00', 4, 138, 'Generic Metal Hat', 'https://picsum.photos/seed/ghU84u/640/480'),
(24, '2023-10-31 00:00:00', 29, 389, 'Rustic Cotton Pants', 'https://picsum.photos/seed/OwCdc/640/480'),
(42, '2023-11-01 00:00:00', 10, 475, 'Modern Fresh Tuna', 'https://picsum.photos/seed/OCIQKXNb/640/480'),
(36, '2023-11-02 00:00:00', 1, 110, 'Practical Metal Salad', 'https://loremflickr.com/640/480?lock=4620484815618048'),
(31, '2023-10-26 00:00:00', 50, 209, 'Licensed Plastic Bike', 'https://loremflickr.com/640/480?lock=3251848909684736'),
(14, '2023-11-10 00:00:00', 17, 466, 'Recycled Frozen Ball', 'https://loremflickr.com/640/480?lock=7997205759655936'),
(11, '2023-10-21 00:00:00', 10, 562, 'Refined Steel Bike', 'https://loremflickr.com/640/480?lock=7758225550082048'),
(4, '2023-11-01 00:00:00', 19, 477, 'Practical Cotton Bike', 'https://loremflickr.com/640/480?lock=8184424367652864'),
(34, '2023-10-19 00:00:00', 15, 474, 'Intelligent Plastic Bike', 'https://picsum.photos/seed/NDomC2/640/480'),
(35, '2023-10-17 00:00:00', 39, 506, 'Handmade Steel Sausages', 'https://picsum.photos/seed/rSHFiI/640/480'),
(22, '2023-10-14 00:00:00', 34, 335, 'Bespoke Steel Soap', 'https://picsum.photos/seed/l6WOq/640/480'),
(45, '2023-10-30 00:00:00', 43, 595, 'Small Soft Cheese', 'https://picsum.photos/seed/gjHzyPH/640/480'),
(15, '2023-10-14 00:00:00', 6, 722, 'Tasty Concrete Sausages', 'https://loremflickr.com/640/480?lock=7730870716727296'),
(20, '2023-10-23 00:00:00', 10, 184, 'Bespoke Fresh Computer', 'https://picsum.photos/seed/ejFJGqF5IH/640/480'),
(40, '2023-10-24 00:00:00', 32, 239, 'Handcrafted Plastic Table', 'https://picsum.photos/seed/M4nVctz/640/480'),
(3, '2023-10-27 00:00:00', 45, 771, 'Tasty Rubber Cheese', 'https://picsum.photos/seed/RkSeLo6/640/480'),
(39, '2023-10-13 00:00:00', 36, 320, 'Recycled Steel Hat', 'https://picsum.photos/seed/5yv6tFwK0/640/480'),
(9, '2023-10-18 00:00:00', 35, 25, 'Intelligent Steel Pizza', 'https://loremflickr.com/640/480?lock=4486559296389120'),
(19, '2023-10-18 00:00:00', 31, 524, 'Generic Wooden Gloves', 'https://loremflickr.com/640/480?lock=1707081543450624'),
(37, '2023-11-02 00:00:00', 42, 282, 'Electronic Plastic Salad', 'https://loremflickr.com/640/480?lock=2878374714277888'),
(33, '2023-10-21 00:00:00', 34, 220, 'Licensed Wooden Pants', 'https://picsum.photos/seed/VDbdlrXLp/640/480'),
(47, '2023-10-13 00:00:00', 50, 271, 'Small Granite Fish', 'https://picsum.photos/seed/O0DOLA5hv5/640/480'),
(41, '2023-10-28 00:00:00', 24, 899, 'Elegant Concrete Hat', 'https://picsum.photos/seed/Ck25akv/640/480'),
(35, '2023-10-23 00:00:00', 47, 911, 'Oriental Concrete Chicken', 'https://picsum.photos/seed/phpOLh/640/480'),
(30, '2023-10-27 00:00:00', 38, 277, 'Refined Plastic Pizza', 'https://loremflickr.com/640/480?lock=4568987018985472'),
(45, '2023-10-31 00:00:00', 15, 176, 'Generic Frozen Towels', 'https://picsum.photos/seed/45oGgD/640/480'),
(10, '2023-11-04 00:00:00', 31, 273, 'Awesome Granite Car', 'https://picsum.photos/seed/E1YYw3s/640/480'),
(29, '2023-10-14 00:00:00', 38, 503, 'Awesome Concrete Mouse', 'https://loremflickr.com/640/480?lock=7477242762362880'),
(30, '2023-10-16 00:00:00', 28, 615, 'Modern Wooden Sausages', 'https://loremflickr.com/640/480?lock=1627375376793600'),
(51, '2023-11-09 00:03:18', 4, 339, 'Licensed Bronze Bacon', 'https://picsum.photos/seed/bfaG0/640/480');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_roles`
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
-- Dumping data for table `user_role_mapping`
--

INSERT INTO `user_role_mapping` (`id`, `userid`, `roleid`) VALUES
(1, 41, 1),
(2, 5, 2),
(3, 39, 1),
(4, 36, 3),
(5, 12, 3),
(6, 17, 2),
(7, 24, 2),
(8, 10, 2),
(9, 50, 1),
(10, 6, 1),
(11, 20, 1),
(12, 11, 1),
(13, 47, 2),
(14, 34, 2),
(15, 40, 1),
(16, 9, 3),
(17, 13, 3),
(18, 23, 2),
(19, 28, 2),
(20, 4, 3),
(21, 2, 1),
(22, 3, 3),
(23, 15, 2),
(24, 35, 1),
(25, 25, 2),
(26, 16, 3),
(27, 38, 1),
(28, 32, 2),
(29, 1, 1),
(30, 45, 3),
(31, 14, 1),
(32, 37, 3),
(33, 49, 2),
(34, 7, 1),
(35, 48, 3),
(36, 31, 1),
(37, 44, 3),
(38, 46, 3),
(39, 33, 1),
(40, 43, 3),
(41, 29, 3),
(42, 18, 1),
(43, 30, 3),
(44, 8, 2),
(45, 26, 2),
(46, 19, 3),
(47, 22, 3),
(48, 21, 2),
(49, 27, 1),
(50, 42, 1);

--
-- Dumping data for table `user_role_mapping`
--

INSERT INTO `user_role_mapping` (`id`, `userid`, `roleid`) VALUES
(1, 41, 1),
(2, 5, 2),
(3, 39, 1),
(4, 36, 3),
(5, 12, 3),
(6, 17, 2),
(7, 24, 2),
(8, 10, 2),
(9, 50, 1),
(10, 6, 1),
(11, 20, 1),
(12, 11, 1),
(13, 47, 2),
(14, 34, 2),
(15, 40, 1),
(16, 9, 3),
(17, 13, 3),
(18, 23, 2),
(19, 28, 2),
(20, 4, 3),
(21, 2, 1),
(22, 3, 3),
(23, 15, 2),
(24, 35, 1),
(25, 25, 2),
(26, 16, 3),
(27, 38, 1),
(28, 32, 2),
(29, 1, 1),
(30, 45, 3),
(31, 14, 1),
(32, 37, 3),
(33, 49, 2),
(34, 7, 1),
(35, 48, 3),
(36, 31, 1),
(37, 44, 3),
(38, 46, 3),
(39, 33, 1),
(40, 43, 3),
(41, 29, 3),
(42, 18, 1),
(43, 30, 3),
(44, 8, 2),
(45, 26, 2),
(46, 19, 3),
(47, 22, 3),
(48, 21, 2),
(49, 27, 1),
(50, 42, 1);

--
-- Gegevens worden geëxporteerd voor tabel `user_role_mapping`
--

INSERT INTO `user_role_mapping` (`id`, `userid`, `roleid`) VALUES
(1, 7, 3),
(2, 1, 3),
(3, 5, 2),
(4, 49, 3),
(5, 34, 2),
(6, 48, 3),
(7, 12, 1),
(8, 4, 2),
(9, 3, 2),
(10, 23, 3),
(11, 16, 3),
(12, 47, 2),
(13, 10, 3),
(14, 29, 1),
(15, 30, 3),
(16, 50, 1),
(17, 6, 2),
(18, 14, 3),
(19, 21, 3),
(20, 18, 2),
(21, 42, 1),
(22, 27, 1),
(23, 2, 1),
(24, 17, 3),
(25, 46, 3),
(26, 15, 1),
(27, 25, 2),
(28, 24, 1),
(29, 26, 3),
(30, 8, 2),
(31, 13, 3),
(32, 45, 1),
(33, 35, 1),
(34, 37, 3),
(35, 41, 2),
(36, 22, 3),
(37, 20, 2),
(38, 11, 3),
(39, 44, 1),
(40, 38, 2),
(41, 9, 2),
(42, 33, 3),
(43, 36, 2),
(44, 28, 2),
(45, 19, 2),
(46, 32, 1),
(47, 31, 2),
(48, 39, 1),
(49, 40, 2),
(50, 43, 2);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_orders`
--
ALTER TABLE `delivery_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_orders`
--
ALTER TABLE `delivery_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `bidshistory`
--
ALTER TABLE `bidshistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `notification_read`
--
ALTER TABLE `notification_read`
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
-- Indexes for table `successful_bids`

--
ALTER TABLE `successful_bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `successful_bids`
--
ALTER TABLE `successful_bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users`
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexen voor tabel `user_profile`
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
-- AUTO_INCREMENT voor een tabel `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT voor een tabel `bids`
--
ALTER TABLE `bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_orders`
--
ALTER TABLE `delivery_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `notification_read`
--
ALTER TABLE `notification_read`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT voor een tabel `products`
-- AUTO_INCREMENT voor een tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT voor een tabel `product_categories`
-- AUTO_INCREMENT voor een tabel `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `successful_bids`
--
ALTER TABLE `successful_bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT voor een tabel `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

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

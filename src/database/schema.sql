-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 16 okt 2023 om 15:35
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
-- Tabelstructuur voor tabel `abuse_reports`
--

CREATE TABLE `abuse_reports` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `senderid` int(11) NOT NULL,
  `typeOfAbuse` text NOT NULL,
  `context` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `abuse_reports`
--

INSERT INTO `abuse_reports` (`id`, `productid`, `senderid`, `typeOfAbuse`, `context`, `createdAt`) VALUES
(1, 1, 52, 'Trafficking', 'CRACK COCAINE!!!', '2023-10-16 12:58:34'),
(2, 17, 52, 'Deception', 'MADE OF ROCKS!!!!', '2023-10-16 12:59:20');

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
  `endDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `products`
--

INSERT INTO `products` (`id`, `userid`, `categoryid`, `name`, `description`, `price`, `imageUrl`, `endDate`, `updatedAt`, `createdAt`) VALUES
(1, 14, 7, 'Electronic Bronze Chips', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 846.00, '9.jpg', '2023-10-14 09:38:44', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(2, 7, 3, 'Tasty Bronze Sausages', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 369.00, '24.jpg', '2023-10-13 14:04:49', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(3, 44, 7, 'Intelligent Granite Sausages', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 993.00, '19.jpg', '2023-10-14 08:42:21', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(4, 18, 4, 'Ergonomic Wooden Keyboard', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 403.00, '17.jpg', '2023-10-13 13:29:24', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(5, 38, 3, 'Unbranded Cotton Chair', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 499.00, '22.jpg', '2023-10-13 13:28:21', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(6, 29, 9, 'Generic Cotton Chicken', 'The Football Is Good For Training And Recreational Purposes', 37.00, '15.jpg', '2023-10-14 08:12:48', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(7, 13, 5, 'Luxurious Fresh Bacon', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 467.00, '43.jpg', '2023-10-13 12:47:34', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(8, 6, 2, 'Luxurious Plastic Pizza', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 767.00, '3.jpg', '2023-10-13 23:10:05', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(9, 15, 5, 'Gorgeous Concrete Bike', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 479.00, '10.jpg', '2023-10-14 01:31:11', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(10, 3, 9, 'Practical Cotton Soap', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 726.00, '27.jpg', '2023-10-13 15:07:13', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(11, 19, 5, 'Incredible Frozen Chicken', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 862.00, '7.jpg', '2023-10-13 21:20:11', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(12, 2, 1, 'Tasty Bronze Salad', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 103.00, '36.jpg', '2023-10-13 21:42:31', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(13, 24, 4, 'Handcrafted Granite Bike', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 197.00, '11.jpg', '2023-10-13 16:09:21', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(14, 28, 8, 'Fantastic Cotton Chair', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 288.00, '11.jpg', '2023-10-14 04:01:56', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(15, 45, 5, 'Handcrafted Cotton Gloves', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 399.00, '20.jpg', '2023-10-13 17:27:53', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(16, 31, 9, 'Modern Rubber Shoes', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 504.00, '6.jpg', '2023-10-14 07:19:06', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(17, 9, 7, 'Small Frozen Pizza', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 637.00, '21.jpg', '2023-10-14 02:01:08', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(18, 46, 3, 'Practical Plastic Mouse', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 17.00, '25.jpg', '2023-10-13 21:09:31', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(19, 47, 7, 'Gorgeous Bronze Fish', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 571.00, '34.jpg', '2023-10-14 03:31:22', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(20, 17, 2, 'Fantastic Fresh Computer', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 753.00, '36.jpg', '2023-10-14 05:07:04', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(21, 50, 9, 'Handmade Rubber Bacon', 'The Football Is Good For Training And Recreational Purposes', 543.00, '29.jpg', '2023-10-14 01:01:08', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(22, 34, 6, 'Licensed Wooden Computer', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 879.00, '1.jpg', '2023-10-14 03:18:58', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(23, 48, 6, 'Practical Cotton Chips', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 347.00, '17.jpg', '2023-10-14 08:20:34', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(24, 27, 6, 'Fantastic Granite Shirt', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 941.00, '39.jpg', '2023-10-14 06:23:27', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(25, 16, 10, 'Modern Frozen Chicken', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 960.00, '29.jpg', '2023-10-14 03:40:29', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(26, 37, 3, 'Refined Cotton Pants', 'The Football Is Good For Training And Recreational Purposes', 382.00, '13.jpg', '2023-10-13 17:44:58', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(27, 32, 3, 'Unbranded Frozen Shirt', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 241.00, '44.jpg', '2023-10-13 20:56:05', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(28, 11, 9, 'Oriental Plastic Cheese', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 126.00, '24.jpg', '2023-10-14 07:48:41', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(29, 4, 4, 'Tasty Rubber Chair', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 836.00, '30.jpg', '2023-10-13 21:27:29', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(30, 39, 9, 'Electronic Plastic Hat', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 604.00, '31.jpg', '2023-10-13 18:54:15', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(31, 10, 4, 'Recycled Concrete Bike', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 522.00, '30.jpg', '2023-10-14 02:02:02', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(32, 22, 2, 'Practical Fresh Tuna', 'The Football Is Good For Training And Recreational Purposes', 688.00, '40.jpg', '2023-10-14 03:38:35', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(33, 1, 1, 'Unbranded Frozen Soap', 'The Football Is Good For Training And Recreational Purposes', 526.00, '32.jpg', '2023-10-14 09:25:23', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(34, 5, 7, 'Fantastic Soft Keyboard', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 438.00, '33.jpg', '2023-10-14 07:05:30', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(35, 43, 9, 'Unbranded Plastic Tuna', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 402.00, '2.jpg', '2023-10-13 21:59:02', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(36, 21, 7, 'Practical Concrete Towels', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 744.00, '4.jpg', '2023-10-14 00:35:32', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(37, 25, 10, 'Gorgeous Wooden Shirt', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 991.00, '6.jpg', '2023-10-14 04:37:59', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(38, 33, 6, 'Handcrafted Metal Gloves', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 94.00, '5.jpg', '2023-10-13 14:16:10', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(39, 35, 10, 'Bespoke Rubber Cheese', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 397.00, '13.jpg', '2023-10-13 14:51:46', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(40, 20, 1, 'Handmade Soft Pizza', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 676.00, '15.jpg', '2023-10-13 18:04:53', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(41, 36, 2, 'Handcrafted Rubber Gloves', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 550.00, '4.jpg', '2023-10-13 12:45:05', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(42, 40, 7, 'Luxurious Metal Gloves', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 159.00, '12.jpg', '2023-10-14 04:01:59', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(43, 42, 7, 'Refined Steel Tuna', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 813.00, '6.jpg', '2023-10-14 06:52:18', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(44, 26, 3, 'Intelligent Steel Bacon', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 23.00, '15.jpg', '2023-10-14 05:31:51', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(45, 12, 4, 'Incredible Wooden Keyboard', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 583.00, '2.jpg', '2023-10-14 06:28:50', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(46, 30, 1, 'Unbranded Frozen Table', 'The Football Is Good For Training And Recreational Purposes', 404.00, '5.jpg', '2023-10-13 16:15:21', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(47, 23, 6, 'Licensed Metal Chips', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 725.00, '2.jpg', '2023-10-13 22:36:30', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(48, 8, 5, 'Unbranded Rubber Soap', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 193.00, '2.jpg', '2023-10-14 04:20:03', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(49, 49, 2, 'Refined Plastic Chair', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 177.00, '5.jpg', '2023-10-19 17:16:03', '2023-10-16 11:52:31', '2023-10-13 12:37:29'),
(50, 41, 8, 'Intelligent Granite Mouse', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 220.00, '2.jpg', '2023-10-14 00:01:34', '2023-10-13 12:37:29', '2023-10-13 12:37:29');

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
(1, 'Baby', 'M2.25 8.25h19.5M2.25 9h19.5m-16.5 5.25h6m-6 2.25h3m-3.75 3h15a2.25 2.25 0 002.25-2.25V6.75A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25v10.5A2.25 2.25 0 004.5 19.5z'),
(2, 'Music', 'M12 12.75c1.148 0 2.278.08 3.383.237 1.037.146 1.866.966 1.866 2.013 0 3.728-2.35 6.75-5.25 6.75S6.75 18.728 6.75 15c0-1.046.83-1.867 1.866-2.013A24.204 24.204 0 0112 12.75zm0 0c2.883 0 5.647.508 8.207 1.44a23.91 23.91 0 01-1.152 6.06M12 12.75c-2.883 0-5.647.508-8.208 1.44.125 2.104.52 4.136 1.153 6.06M12 12.75a2.25 2.25 0 002.248-2.354M12 12.75a2.25 2.25 0 01-2.248-2.354M12 8.25c.995 0 1.971-.08 2.922-.236.403-.066.74-.358.795-.762a3.778 3.778 0 00-.399-2.25M12 8.25c-.995 0-1.97-.08-2.922-.236-.402-.066-.74-.358-.795-.762a3.734 3.734 0 01.4-2.253M12 8.25a2.25 2.25 0 00-2.248 2.146M12 8.25a2.25 2.25 0 012.248 2.146M8.683 5a6.032 6.032 0 01-1.155-1.002c.07-.63.27-1.222.574-1.747m.581 2.749A3.75 3.75 0 0115.318 5m0 0c.427-.283.815-.62 1.155-.999a4.471 4.471 0 00-.575-1.752M4.921 6a24.048 24.048 0 00-.392 3.314c1.668.546 3.416.914 5.223 1.082M19.08 6c.205 1.08.337 2.187.392 3.314a23.882 23.882 0 01-5.223 1.082'),
(3, 'Books', 'M9.75 3.104v5.714a2.25 2.25 0 01-.659 1.591L5 14.5M9.75 3.104c-.251.023-.501.05-.75.082m.75-.082a24.301 24.301 0 014.5 0m0 0v5.714c0 .597.237 1.17.659 1.591L19.8 15.3M14.25 3.104c.251.023.501.05.75.082M19.8 15.3l-1.57.393A9.065 9.065 0 0112 15a9.065 9.065 0 00-6.23-.693L5 14.5m14.8.8l1.402 1.402c1.232 1.232.65 3.318-1.067 3.611A48.309 48.309 0 0112 21c-2.773 0-5.491-.235-8.135-.687-1.718-.293-2.3-2.379-1.067-3.61L5 14.5'),
(4, 'Beauty', 'M4.26 10.147a60.436 60.436 0 00-.491 6.347A48.627 48.627 0 0112 20.904a48.627 48.627 0 018.232-4.41 60.46 60.46 0 00-.491-6.347m-15.482 0a50.57 50.57 0 00-2.658-.813A59.905 59.905 0 0112 3.493a59.902 59.902 0 0110.399 5.84c-.896.248-1.783.52-2.658.814m-15.482 0A50.697 50.697 0 0112 13.489a50.702 50.702 0 017.74-3.342M6.75 15a.75.75 0 100-1.5.75.75 0 000 1.5zm0 0v-3.675A55.378 55.378 0 0112 8.443m-7.007 11.55A5.981 5.981 0 006.75 15.75v-1.5'),
(5, 'Grocery', 'M8.25 3v1.5M4.5 8.25H3m18 0h-1.5M4.5 12H3m18 0h-1.5m-15 3.75H3m18 0h-1.5M8.25 19.5V21M12 3v1.5m0 15V21m3.75-18v1.5m0 15V21m-9-1.5h10.5a2.25 2.25 0 002.25-2.25V6.75a2.25 2.25 0 00-2.25-2.25H6.75A2.25 2.25 0 004.5 6.75v10.5a2.25 2.25 0 002.25 2.25zm.75-12h9v9h-9v-9z'),
(6, 'Home', 'M3.75 13.5l10.5-11.25L12 10.5h8.25L9.75 21.75 12 13.5H3.75z'),
(7, 'Movies', 'M9 17.25v1.007a3 3 0 01-.879 2.122L7.5 21h9l-.621-.621A3 3 0 0115 18.257V17.25m6-12V15a2.25 2.25 0 01-2.25 2.25H5.25A2.25 2.25 0 013 15V5.25m18 0A2.25 2.25 0 0018.75 3H5.25A2.25 2.25 0 003 5.25m18 0V12a2.25 2.25 0 01-2.25 2.25H5.25A2.25 2.25 0 013 12V5.25'),
(8, 'Garden', 'M8.25 3v1.5M4.5 8.25H3m18 0h-1.5M4.5 12H3m18 0h-1.5m-15 3.75H3m18 0h-1.5M8.25 19.5V21M12 3v1.5m0 15V21m3.75-18v1.5m0 15V21m-9-1.5h10.5a2.25 2.25 0 002.25-2.25V6.75a2.25 2.25 0 00-2.25-2.25H6.75A2.25 2.25 0 004.5 6.75v10.5a2.25 2.25 0 002.25 2.25zm.75-12h9v9h-9v-9z'),
(9, 'Sports', 'M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 012.25-2.25h13.5A2.25 2.25 0 0121 7.5v11.25m-18 0A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75m-18 0v-7.5A2.25 2.25 0 015.25 9h13.5A2.25 2.25 0 0121 11.25v7.5m-9-6h.008v.008H12v-.008zM12 15h.008v.008H12V15zm0 2.25h.008v.008H12v-.008zM9.75 15h.008v.008H9.75V15zm0 2.25h.008v.008H9.75v-.008zM7.5 15h.008v.008H7.5V15zm0 2.25h.008v.008H7.5v-.008zm6.75-4.5h.008v.008h-.008v-.008zm0 2.25h.008v.008h-.008V15zm0 2.25h.008v.008h-.008v-.008zm2.25-4.5h.008v.008H16.5v-.008zm0 2.25h.008v.008H16.5V15z'),
(10, 'Shoes', 'M12 12.75c1.148 0 2.278.08 3.383.237 1.037.146 1.866.966 1.866 2.013 0 3.728-2.35 6.75-5.25 6.75S6.75 18.728 6.75 15c0-1.046.83-1.867 1.866-2.013A24.204 24.204 0 0112 12.75zm0 0c2.883 0 5.647.508 8.207 1.44a23.91 23.91 0 01-1.152 6.06M12 12.75c-2.883 0-5.647.508-8.208 1.44.125 2.104.52 4.136 1.153 6.06M12 12.75a2.25 2.25 0 002.248-2.354M12 12.75a2.25 2.25 0 01-2.248-2.354M12 8.25c.995 0 1.971-.08 2.922-.236.403-.066.74-.358.795-.762a3.778 3.778 0 00-.399-2.25M12 8.25c-.995 0-1.97-.08-2.922-.236-.402-.066-.74-.358-.795-.762a3.734 3.734 0 01.4-2.253M12 8.25a2.25 2.25 0 00-2.248 2.146M12 8.25a2.25 2.25 0 012.248 2.146M8.683 5a6.032 6.032 0 01-1.155-1.002c.07-.63.27-1.222.574-1.747m.581 2.749A3.75 3.75 0 0115.318 5m0 0c.427-.283.815-.62 1.155-.999a4.471 4.471 0 00-.575-1.752M4.921 6a24.048 24.048 0 00-.392 3.314c1.668.546 3.416.914 5.223 1.082M19.08 6c.205 1.08.337 2.187.392 3.314a23.882 23.882 0 01-5.223 1.082');

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
(3, 'nav', 'Log in', 'Log in', 'Se déconnecter'),
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
(20, 'nav', 'Products', 'Producten', 'Produits');

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
(1, 'Randy_Hartmann-Schmeler', 'Brody67@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$eflCVn12vfUt72hJFKNbMg$mCPnUDAqet76A2SzWUpZw37IXH9uKxngQ+6SOxAnzuk', 'Benny', 'Weissnat', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(2, 'Mckenna27', 'Camden.Monahan60@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$G2qtC6pzwwtLcoq6uM2Dew$8jpbaKjyE9l687fRGuzJdz/DLCyrD1kzYDKi325G7gk', 'Keshaun', 'Miller', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(3, 'Alva.Marquardt75', 'Jenifer15@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$HFtoqTL8ZDGpTkheJkcpWQ$0mBlc7XWqSm2DJGPq+jD+pz5tCQgFTCRULOYfFPBXQc', 'Kameron', 'Botsford', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(4, 'Vena.Lynch4', 'Abbigail_Schaden@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$sOYPM05ecVU/GS5LBQVXnQ$77VOFboRrVqpCnJ5Cfr44bW560isbLwjdrIJGbuKIwE', 'Alejandrin', 'Mueller', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(5, 'Winfield_Huels34', 'Gwendolyn84@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$kD3/9Sh0MvgnBWk0iYYXpQ$g18HanDl69EeFMcgaxPlcj7gNga5BMwVytS4IX4qz+c', 'Roman', 'Keebler-Feeney', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(6, 'Stella3', 'Elfrieda_Ernser@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$JTpFW77UIISixo3gMngvLA$PDDn16QpQ3OJqrlr9oiETUEtFqNB13b37kGcK0SWiJY', 'Jedediah', 'Bednar', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(7, 'Afton.Kub59', 'Makenzie68@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$OO2Zr5feZwEfORRvMdptHw$WSW70Rg0sYcuBh6rh6MdZgLwWSdg+CK1v7FnjIoYp2I', 'Felicita', 'Jast', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(8, 'Golden.Goodwin19', 'Orville_Reinger@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$vuaL/fCM/d7e3Ox/00Cb7w$0pKUQ0UFIu7y9KEWKDSkC286iUqXTfRCpmEFP6jLPOM', 'Francisca', 'Casper', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(9, 'Ethan.Bins-Metz0', 'Jan54@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$JME3Iek5+M7NMfyVDPrpoQ$kjVlfaQyaf1ec+PPX/vAjETRS/DpLWYjDkohlTg93+M', 'Geovanni', 'Hackett', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(10, 'Kamryn99', 'Terrence_Vandervort-Smith94@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$mz4yWSPHXTz57tXftLVbMw$FDuGex+5HTd6Z/xPhXR0FFhnQUUHzHztpYktIF5QKWc', 'Fay', 'Aufderhar', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(11, 'Nelson22', 'Dawson.Gislason@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$BCeZZTAnh8LJ5vOeEJ8ffw$lJRh3/yWTN9DdbGfmhxfH7ff1RVHEDyTOnuuHezQ5TA', 'Vladimir', 'Hartmann', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(12, 'Bertha.Klein95', 'Noe.Zboncak@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$9wqqkYn7msJxhn7m31NGFg$pGsmm/Op60FQlD68pwQhuwK0k+AtRN/GCrhbwIfhdss', 'Garret', 'Raynor', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(13, 'Elaina.Okuneva', 'Sabryna_Davis4@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$+H4F66xSAoLIn/mX/juvkw$EJrZUegMgOXe85/lu1iOqHyJ7hNbhnybOwjt9dCb18I', 'Aron', 'Graham', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(14, 'Magdalen.Langosh', 'Terrence69@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$66xMWOqNl3B8CzrPCdI/Ug$yXrUg+fjivtNisrF7tGzs13dHjKzLv5QrDpk8WtWL20', 'Jedediah', 'Kassulke', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(15, 'Delia.Kozey', 'Heloise_Emmerich18@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$is+XDJrMBYQi4UJJIfXwVA$3N0HPTtHd+TKd6BpKRUoDvzk6qfO1hQHR4XFMxZaA9Q', 'Keara', 'Schroeder', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(16, 'Rashawn78', 'Brandyn0@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$UJCRq+/8xLbDn9fadKMLQQ$MWkY5lckHNkY04H7W9skwp3/xPJysccdZ9MtixgORhg', 'Sofia', 'Metz', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(17, 'Leonardo5', 'Bradly41@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$xjrDJ7YzKSIOpD9c89ufDA$9LsOFojNtp5Ay98QVQ2gOpFASJvfb9ObUuDohqnxv/U', 'Vada', 'Armstrong', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(18, 'Itzel_Okuneva84', 'Rylee50@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$mFT/3RCVKOYuyHF3Cpi3nQ$VH9sGVQXd4UM6+vnn8MYjRvEhDfgNPiQ1rTUV1/TroE', 'Lonzo', 'Jerde', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(19, 'Jaqueline38', 'Johanna72@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$eu4MprsaYlfnqXRHglS0uA$eZ3okYxPhQ3MD4F4FVcB4tVT9MnF/cVlS4bcUoRVo7I', 'Dominique', 'Dickens', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(20, 'Scarlett_Metz', 'Amber_Dach81@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$8DfwWY6sUAyfC5HIxbOjhw$xoAi4nRP4iz+9Z1kKN7B3OcA7SCkmVUpbLbXM1r36eA', 'Marina', 'Hammes-Lockman', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(21, 'Sincere.Towne-Zemlak4', 'Geovany_Schmeler16@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Qn60y8cRKl92Frtdg6iulg$8eCF9UdubsojWsnU0BJdeBLMLx4UkwtsswnLf6wRiEg', 'Maeve', 'Macejkovic', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(22, 'Ramon_Russel62', 'Ardith_Carter@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$H77lyqlz44W8HqA/iQxy3A$jpOcfMZs8/lDeExntNAXXPF5wepjq2y1fp1p+FUuH/U', 'Emely', 'Auer', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(23, 'Kelsi.Keebler34', 'Sven98@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Cga98e6O5NYKofZooifHIw$m3ztRkK7LoFH/bO3clbQPbLc7gkILPy4vCdPY6haOis', 'Garth', 'Blanda', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(24, 'Donato77', 'Jo34@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$IxhDGFuNu9ksAHXVnru/oA$jTBF9f4YzMk4Ux7+zwx2oLYD9qdibr29MNofXHg8Irs', 'Antonietta', 'Feeney', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(25, 'Marc.Stiedemann', 'Cale.Schamberger@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$sVcpBl87qw5DCkfqW4S5ug$j8RM4GrMBJTFRGVITb+l3hOmoKxqU1UyiNknhKe5mX4', 'Juston', 'Anderson', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(26, 'Marcellus24', 'Heather32@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$ctyxEpm3eO5cxFojTZ/vVA$NodQ3w0bWls7IdsRukDm0YsZTR9+j7RmTRvtxcpgBC8', 'Grayce', 'Powlowski', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(27, 'Tyrese40', 'Rosemary73@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Nlska9jSKplqa1ZHeuv8Ug$KPygdolC3q9R5EV8b/kcbgJHnj0ScpoGrWnBcricFyo', 'Keshawn', 'Pacocha', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(28, 'Kendra22', 'Rae_Hammes9@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$hF0gWqUVHmb65+m52p3Zbw$/pYZ1IDacKaRSCtE6+P2wzqoRAqQm1MEZ5TuCUBRjQk', 'Vivienne', 'Kohler', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(29, 'Reina.Stracke98', 'Rae28@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$W8b4d2lgyDFqF67CucSZUA$e1eoVl+iMWNcb4UXdDhZNkG6smRo2EOvEM/d+ADOKO0', 'Kristofer', 'Simonis', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(30, 'Kristoffer.Rutherford53', 'Gisselle92@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$H7jujvlFf0D2d2GW67wEqA$wTWkcCBsRAXveO0gZmQT2tds4Ad7Vp8wafwVEosxfg0', 'Irving', 'Morar', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(31, 'Philip_Blanda', 'Gregorio1@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$YHOqjdKn2+znIJDS3jnsUQ$7UmZNozNlMJ4+ceU+WYmvZ52Ku38qKtg6xakWaP0PHE', 'Johathan', 'Denesik', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(32, 'Bertram.Nicolas93', 'Jennie.Ebert@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$tj7jQP+1G13z7KHhkfISfg$KatIeExlHPn6attHY8qcwIY8YxYnYwspVSWWdhF5oxg', 'Bianka', 'Pollich', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(33, 'Jaron.Schroeder', 'Americo55@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$GwmcWQNYtefGndwjCdQ5zA$T2fvOy2Pgp/5uhu1yOUE19+uykOf83qk8Sbk4Bj0/U0', 'Desmond', 'Lockman', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(34, 'Juwan72', 'Bradley23@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$QBf5XfTS3KxwDrW9rPFxoA$8KgWHBzX+YtJ8fHgrzDR7Oc81prXl23WOH6xw2WFhqA', 'Brayan', 'Stanton', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(35, 'Watson25', 'Annetta.Larkin10@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$Z/FjKOj565XvrfHeGei2uQ$TwdQxEv+dTZyCrNR2OqPFk6rLa53iLA3ZDwBYSvszuI', 'Mathilde', 'Swift', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(36, 'Velva.Herman83', 'Rasheed51@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$u+l6ZcSWYSkeRHvDUPae5w$lVJfTJc5gli9CufD1+HnRUBVghRPmPz5vMGxdYn7xK4', 'Halle', 'Feil', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(37, 'Herminia_Cronin', 'Thora_Kerluke92@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$ovPvwFcdOxQpKaySxmCsqw$dBnr/xNoHouJdqQ76emsNjuCmluENLjVDCeROGACTs8', 'Jaycee', 'McKenzie', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(38, 'Hallie52', 'Alicia.Bashirian@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$B/WLdqLhHe/71BDY9+fVmA$mAvcmzVl05Nqtn+z9vJHJ9cJSm0/gqzLPOh9gL88k+g', 'Eve', 'Kris', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(39, 'Elissa.Abernathy71', 'Marquis_Hyatt@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$ubQU3Y7vy1w+/i2mU+jqtg$0xJvovdy5MxZf1ixp08Xln8Z1xWS+vF/zZz9dsGaw2k', 'Ernestina', 'Stehr', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(40, 'Julie_Pollich', 'Earnestine21@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$hwhkp7ie8yErsR5+83MHaA$jNaJLoI/xdnet1/L9gl23zypv9DBgAgk+8QsQzKi7oM', 'Brooks', 'Blick', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(41, 'Demario_Schimmel43', 'Sadie_Wunsch@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Sf1CEJE8o8vPL8aP6UJAVA$sCDFzQd7mErGhOW9U07vAQT8IPJKlPxOrjekKboMANk', 'Roselyn', 'Upton', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(42, 'Louisa_Gibson', 'Johnathan.Rodriguez@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$KyKval+lz8WrUiZMND6Mgw$6IE8iaZuOUZTfnNLQBrNVL5Br9mBnvYDGYSFnLgbGbw', 'Ruth', 'Steuber', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(43, 'Vesta_Walter', 'Casey.Baumbach37@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$VCx7D9QCOqfs2VIGaq5Vpg$j50CDkRYiX4Dw7D2FWa9dxyIlVuxSARhTdAYFhANpi8', 'Johan', 'Gutkowski', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(44, 'Oceane10', 'Carmel.Hauck@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$JUo5+n7lCvsN1TM0vKYUvg$nsfLVHqJefYC/q6ZFzwlOkHJynpbw9S700VgpAr3ZwE', 'Elisa', 'Adams-Wolf', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(45, 'Shanel.Smith40', 'Nettie.Gutkowski@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$OBAylAlTRSKlBreh0GnMjw$75fuR9q25brh0r+f6Znt+y5sPIF9bvdRV7UPCRu8URU', 'Shaylee', 'Zulauf', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(46, 'Raheem_Ankunding-Gulgowski', 'Lela14@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$uWrEeAD9BMgBq6S7pDtIdA$Zwcwny83Txa3cLe+WWzkmfCsMAzdC7704YFd8ZznAGc', 'Julian', 'West', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(47, 'Gerard.Gutkowski77', 'Orval.Muller@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$8QKPqIaZYSvbD+I5NAfwDw$/4g384atn/WwhqrqBo5MV2CQ4W1WL5vSZY20E/FT8cc', 'Bridgette', 'Beahan', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(48, 'Estevan.Cronin28', 'Golden.Altenwerth@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$H+nUJCXwxHQyGeUW2UfUow$mZTfl309Da6uiiW7qqNkUZHKpmboy9y7QLmxLGbc5N4', 'Cooper', 'Blanda', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(49, 'Yesenia_Crist94', 'Phoebe0@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$AxNfjYCeQXefyNv6QwJxdA$/j0rZbyKbAXc5TcsBy8COajvnJbdhiQDXfdjO22reOM', 'Ardella', 'Murray', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(50, 'Sonya_Hudson94', 'Amelia_Mann73@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$M81AfOATK3fNOwzroX/HDA$rn4iRUFCykH07aZ6B4qOxW7yFKsvo8LKw6lqDbKxF9I', 'Sonya', 'Hodkiewicz', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(51, 'Testing Account', 'test@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$jR+SNCaUlwexG5TYTINWLg$cKzPOmELe0UV98rO5zGJ1Dp9mz6MrLSP5xyP6r77Ch0', 'Testing', 'Account', '2023-10-13 12:37:29', '2023-10-13 12:37:29'),
(52, 'johnjohnson', 'john@johnson.com', '$argon2id$v=19$m=65536,t=4,p=1$dTZ3M3dLNEl0dTJ6Ty9OYQ$boscgI26mx/d1HGipCOVOeoPtjzMr25Ib2FWhDFu+44', 'John', 'Johnson', '2023-10-16 11:50:01', '2023-10-16 11:50:01');

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
(1, 17, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/730.jpg', 'Acceptus adeptio valde capitulus corrupti cognatus caste. Vorax fugiat porro. Admiratio casus tergeo aestus auditor versus theologus surgo sustineo.', 'light', 'text_nl'),
(2, 2, 'https://avatars.githubusercontent.com/u/37522273', 'Aegre ut quasi. Amaritudo collum nesciunt natus commodo sollicito decor. Viduo tui cervus.', 'dark', 'text_fr'),
(3, 21, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/901.jpg', 'Triumphus ultra patruus comis defero terra capio defessus attonbitus delectatio. Sortitus vaco tero vehemens. Magnam aeternus caste vicinus denego ascisco.', 'light', 'text_en'),
(4, 27, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/574.jpg', 'Demo spoliatio cicuta curtus facere repellat comparo debeo suspendo antiquus. Molestias timidus crapula aeneus comitatus commodo defleo dens suscipio. Voco creta tremo atque tondeo.', 'light', 'text_nl'),
(5, 42, 'https://avatars.githubusercontent.com/u/95202067', 'Ventosus dolores unus varius nobis. Dolorem nam eligendi. Tergeo canto creator natus usitas soleo vigilo.', 'light', 'text_fr'),
(6, 32, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/543.jpg', 'Tergo argumentum varius. Auctus annus voco speciosus absconditus voluptate cattus vociferor. Decens debilito censura bellicus ante caries.', 'light', 'text_fr'),
(7, 39, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/809.jpg', 'Cruciamentum cras tergo arbor abscido facere aequus baiulus consectetur. Curtus denego talio accusamus vindico aegrus vereor. Explicabo saepe deprimo cras sursum adeo vos.', 'dark', 'text_en'),
(8, 38, 'https://avatars.githubusercontent.com/u/64272368', 'Aeternus triumphus tondeo mollitia ter ut. Surgo turbo adsum carpo vilis tendo. Sto depereo talio exercitationem reprehenderit verecundia.', 'light', 'text_nl'),
(9, 18, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/398.jpg', 'Cribro assumenda solus adicio. Aegrotatio altus vesco peior alias testimonium aut aqua surculus itaque. Vigor succurro sui mollitia carus error optio tergiversatio.', 'dark', 'text_fr'),
(10, 45, 'https://avatars.githubusercontent.com/u/56377245', 'Cornu vis currus vestigium iure deleo angulus cunae tubineus calco. Natus versus deinde tabula reiciendis non dolor. Arma aequus censura.', 'light', 'text_fr'),
(11, 12, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/786.jpg', 'Correptius adaugeo veritatis concido dens suscipit ater tremo. Somniculosus impedit apparatus succurro. Curso cerno voluptatibus adipiscor adflicto stultus tutis laborum usus desidero.', 'light', 'text_nl'),
(12, 36, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/4.jpg', 'Talus attonbitus curvo urbanus. Venio arbor arca correptius abduco. Colo administratio triduana.', 'dark', 'text_fr'),
(13, 24, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/971.jpg', 'Custodia voluptatibus cena vulnus decipio utor contigo vinum. Atrox cado solvo argentum armarium. Amissio tamdiu alias colligo amor trepide asporto voluptatum.', 'dark', 'text_en'),
(14, 30, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1190.jpg', 'Tergo tersus absum amiculum ultio correptius vulgaris circumvenio tutamen. Libero cum artificiose vae tamen aestivus ancilla subiungo considero vesper. Carus articulus validus depulso timor contabesco tenetur allatus reprehenderit.', 'dark', 'text_fr'),
(15, 23, 'https://avatars.githubusercontent.com/u/45268704', 'Ut possimus absque acerbitas cognatus corrumpo comminor. Odit sulum sunt. Natus deripio decretum alveus culpo torqueo copia.', 'light', 'text_nl'),
(16, 8, 'https://avatars.githubusercontent.com/u/82527904', 'Tabesco benigne nostrum tertius tumultus. Aggero administratio vergo abundans expedita comes cenaculum sursum solio vulgaris. Defaeco dolor caterva cogito ab.', 'light', 'text_nl'),
(17, 34, 'https://avatars.githubusercontent.com/u/12065056', 'Votum comedo venustas maiores paulatim tamisium deleniti. Triduana corrigo ad voluptates auctus appositus canto. Volutabrum xiphias pectus ultio subvenio totam magni synagoga comminor apto.', 'dark', 'text_en'),
(18, 3, 'https://avatars.githubusercontent.com/u/43794705', 'Quis sui vita nam addo depono dedecor coepi. Video copiose vehemens adicio apud vigor deprimo vulpes quas ager. Nisi temeritas esse.', 'dark', 'text_fr'),
(19, 37, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1120.jpg', 'Demoror trado alioqui molestias tactus terminatio cerno repellat dolore. Solvo aedificium architecto triumphus calculus aureus apud minus. Maxime deleo beatus conculco.', 'dark', 'text_en'),
(20, 13, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/779.jpg', 'Ventus ducimus tactus alter somniculosus toties aer. Solio aduro suggero crux tergeo sursum. Consequuntur desino usitas coadunatio.', 'dark', 'text_en'),
(21, 46, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/332.jpg', 'Umbra sint considero cupiditas thymum ademptio aveho cumque. Vere teres aureus crux sequi decerno. Voro aedificium claudeo.', 'light', 'text_en'),
(22, 10, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/274.jpg', 'Ipsum desipio creta patrocinor arcesso usitas alveus decet sublime cui. Textilis timidus tergeo torrens pariatur. Accusantium clamo magnam ullam solum ustilo canonicus.', 'dark', 'text_nl'),
(23, 28, 'https://avatars.githubusercontent.com/u/58135703', 'Ambulo accommodo depulso victus. Eum canonicus cohors tonsor adfectus paulatim numquam ciminatio. Accusamus desolo tolero corrupti carmen aer conitor utilis censura audax.', 'dark', 'text_en'),
(24, 49, 'https://avatars.githubusercontent.com/u/72383927', 'Iure appello decet virga. Commodo cohors magnam vel ubi verumtamen voluptatum ventosus angelus ver. Desolo solutio bestia tres.', 'light', 'text_en'),
(25, 4, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/500.jpg', 'Canonicus amitto circumvenio textus. Currus vulgaris abstergo sapiente. Cui acsi validus voluptate valens sponte alii.', 'dark', 'text_fr'),
(26, 11, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/943.jpg', 'Convoco stultus quas amissio neque auditor utor textilis. Laboriosam barba peccatus vulgaris peior umquam patrocinor totus. Vilicus creta arbustum.', 'light', 'text_nl'),
(27, 40, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/825.jpg', 'Creta sunt amicitia commodi clementia cunabula tubineus sustineo. Aqua corrumpo deludo claustrum accusator. Odit tametsi suscipio.', 'dark', 'text_nl'),
(28, 19, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/404.jpg', 'Amplus copiose apostolus clarus harum. Traho adiuvo tibi minima cras auxilium. Cubicularis aperiam bestia antepono tandem arcus dolorum undique tertius decumbo.', 'dark', 'text_nl'),
(29, 6, 'https://avatars.githubusercontent.com/u/88890054', 'Ara undique vito ducimus tunc vulgivagus tertius. Ut commodo commodo numquam undique vilitas solvo. Totam corrupti vero fugiat casso volaticus aegre rem soleo corrupti.', 'dark', 'text_en'),
(30, 48, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/185.jpg', 'Vix celo expedita ratione deinde quaerat alveus. Amplitudo coruscus uberrime tempora sunt teneo. Capio cura calco tardus maxime.', 'light', 'text_fr'),
(31, 43, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/667.jpg', 'Apto conicio tantillus colligo. Vinum strenuus terga pel spiritus vesica. Volva comptus damnatio corroboro alius.', 'dark', 'text_fr'),
(32, 16, 'https://avatars.githubusercontent.com/u/40377052', 'Culpo tui temporibus verto. Autem aut sui deprimo vallum sordeo vester sperno caelum. Adeptio condico absque sponte currus tam thymbra demens aestas.', 'light', 'text_nl'),
(33, 25, 'https://avatars.githubusercontent.com/u/88948184', 'Decor sed super validus. Utilis beatae dens atrox succurro torqueo crudelis ducimus vester. Substantia capillus vapulus ventosus thesis admiratio supra tolero.', 'dark', 'text_en'),
(34, 41, 'https://avatars.githubusercontent.com/u/20368356', 'Tamdiu deludo accusator attonbitus sono tenuis cometes vito utrum cicuta. Ventus patria vis subseco. Coerceo vulgo tot delectatio tracto commemoro bardus delego suadeo deputo.', 'dark', 'text_fr'),
(35, 5, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/843.jpg', 'Communis vestigium sublime tripudio coma arcus. Clarus virtus argumentum maiores apostolus defero abundans. Animi demum amo cursus.', 'light', 'text_fr'),
(36, 29, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/243.jpg', 'Dolorem summopere accusantium surgo. Voro ultio pauci. Delibero delibero animus magni utrum cum cimentarius tricesimus votum corpus.', 'dark', 'text_fr'),
(37, 33, 'https://avatars.githubusercontent.com/u/79625198', 'Angulus addo arca amiculum socius summa. Cibo pecus libero abstergo trado numquam. Tabernus strenuus antiquus ex tempus.', 'dark', 'text_nl'),
(38, 47, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/983.jpg', 'Candidus terminatio creator audeo. Atque capitulus capto tempore sortitus degenero conturbo crudelis. Apostolus curvo cupiditas tenus facere trans ventosus antiquus bibo.', 'light', 'text_nl'),
(39, 44, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1006.jpg', 'Harum delego ager supellex acceptus crudelis delectus. Stabilis decretum solutio vigor vitae tubineus vigor. Una acquiro defungo consequatur ratione aetas.', 'dark', 'text_nl'),
(40, 15, 'https://avatars.githubusercontent.com/u/11896743', 'Sortitus valde tubineus abeo tertius super praesentium. Quibusdam blanditiis nostrum caelestis victus spoliatio. Ustilo appello amoveo iste cauda administratio cursus stillicidium alius clam.', 'light', 'text_fr'),
(41, 1, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/177.jpg', 'Ter claustrum et utpote. Carus antiquus atrox carbo umerus blandior impedit ulciscor civitas thema. Curto toties candidus.', 'dark', 'text_nl'),
(42, 22, 'https://avatars.githubusercontent.com/u/35929376', 'Volo stipes aspicio. Repudiandae volubilis admitto dolores vorax conspergo sponte nam tibi. Porro via cohaero angelus accedo tot tener deficio.', 'dark', 'text_nl'),
(43, 26, 'https://avatars.githubusercontent.com/u/98453723', 'Varietas terreo caritas subvenio conturbo cavus deleo spes. Deprimo abbas demens. Vere amoveo cetera talio aedificium accusantium neque quam argumentum.', 'dark', 'text_nl'),
(44, 9, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/394.jpg', 'Cernuus villa centum earum aer eum. Creo adinventitias illum dolorum thymbra ara possimus aegrus complectus similique. Vereor cognatus thymbra subito.', 'dark', 'text_nl'),
(45, 14, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/453.jpg', 'Clarus terra recusandae alii reiciendis voco vomer. Atrocitas damno defendo. Desino venustas amicitia ea.', 'dark', 'text_en'),
(46, 31, 'https://avatars.githubusercontent.com/u/83800690', 'Demergo defluo numquam arbor desino commodi abstergo ciminatio alveus summisse. Cultura a vulnero cogo ademptio ubi. Laborum alias at bestia crinis.', 'light', 'text_nl'),
(47, 35, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/929.jpg', 'Adulescens valde tego arbitro. Tamen termes altus vulnus. Appositus tenus antiquus comptus clibanus vulnero clam totidem clamo.', 'dark', 'text_fr'),
(48, 7, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/464.jpg', 'Derideo cilicium victus ab supellex patior. Adeptio victus comedo arbor video. Depulso curo delicate tunc vinum tutamen totus absconditus.', 'dark', 'text_nl'),
(49, 50, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1203.jpg', 'Adstringo torqueo allatus circumvenio aer tempus dolorum altus cado cunabula. Crux vado adeptio vetus canonicus delectus. Vereor atrox accusator vulgaris atrocitas.', 'light', 'text_fr'),
(50, 20, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/536.jpg', 'Denego ea vulgus peccatus spoliatio. Perferendis tergum tabgo earum cernuus. Consectetur sollers comburo viriliter carus voluptates pectus suffragium est audentia.', 'light', 'text_fr'),
(51, 51, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/914.jpg', 'Testing Account', 'light', 'text_en'),
(52, 52, 'https://avatars.githubusercontent.com/u/64209400?v=4', 'Hello!', 'dark', 'text_nl');

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
(45, '2023-09-25 00:00:00', 36, 359, 'Handmade Soft Tuna', 'https://loremflickr.com/640/480?lock=7684775955398656'),
(29, '2023-10-13 00:00:00', 24, 137, 'Practical Bronze Bike', 'https://picsum.photos/seed/yugCVf06HF/640/480'),
(31, '2023-09-15 00:00:00', 23, 982, 'Practical Plastic Pizza', 'https://loremflickr.com/640/480?lock=6554447861776384'),
(15, '2023-09-15 00:00:00', 4, 500, 'Gorgeous Rubber Chicken', 'https://picsum.photos/seed/reHz2N/640/480'),
(8, '2023-09-14 00:00:00', 28, 445, 'Ergonomic Rubber Fish', 'https://picsum.photos/seed/WiTYWWY/640/480'),
(14, '2023-10-08 00:00:00', 21, 319, 'Bespoke Steel Car', 'https://loremflickr.com/640/480?lock=2908578539110400'),
(41, '2023-09-14 00:00:00', 39, 200, 'Awesome Soft Shirt', 'https://picsum.photos/seed/tyeCiv8/640/480'),
(37, '2023-09-15 00:00:00', 44, 396, 'Incredible Steel Mouse', 'https://loremflickr.com/640/480?lock=4647032415322112'),
(16, '2023-09-19 00:00:00', 33, 69, 'Oriental Soft Mouse', 'https://picsum.photos/seed/yw4NBSGb/640/480'),
(24, '2023-09-17 00:00:00', 18, 712, 'Gorgeous Granite Chips', 'https://loremflickr.com/640/480?lock=3444053639168000'),
(25, '2023-10-02 00:00:00', 13, 211, 'Rustic Plastic Soap', 'https://picsum.photos/seed/gvWGym0/640/480'),
(27, '2023-10-07 00:00:00', 3, 399, 'Fantastic Plastic Keyboard', 'https://loremflickr.com/640/480?lock=6715591534575616'),
(25, '2023-10-01 00:00:00', 48, 57, 'Gorgeous Fresh Chips', 'https://picsum.photos/seed/Iq4yB0O/640/480'),
(1, '2023-10-11 00:00:00', 1, 910, 'Electronic Frozen Mouse', 'https://loremflickr.com/640/480?lock=7576528204333056'),
(9, '2023-09-16 00:00:00', 46, 574, 'Tasty Concrete Pants', 'https://loremflickr.com/640/480?lock=7312063560941568'),
(13, '2023-10-04 00:00:00', 40, 900, 'Sleek Rubber Mouse', 'https://loremflickr.com/640/480?lock=2348398158020608'),
(27, '2023-10-04 00:00:00', 38, 153, 'Gorgeous Cotton Computer', 'https://loremflickr.com/640/480?lock=203618682667008'),
(42, '2023-09-25 00:00:00', 40, 873, 'Handcrafted Metal Towels', 'https://picsum.photos/seed/HyUY2/640/480'),
(28, '2023-10-11 00:00:00', 18, 852, 'Generic Plastic Fish', 'https://loremflickr.com/640/480?lock=7895878507429888'),
(44, '2023-09-24 00:00:00', 7, 627, 'Electronic Fresh Salad', 'https://picsum.photos/seed/gLoHuONgYe/640/480'),
(26, '2023-10-03 00:00:00', 32, 787, 'Handcrafted Metal Computer', 'https://loremflickr.com/640/480?lock=5912867943481344'),
(10, '2023-09-20 00:00:00', 15, 121, 'Refined Fresh Salad', 'https://picsum.photos/seed/iGiYDk/640/480'),
(15, '2023-10-02 00:00:00', 7, 822, 'Intelligent Metal Bacon', 'https://loremflickr.com/640/480?lock=165334292103168'),
(49, '2023-10-05 00:00:00', 1, 516, 'Oriental Cotton Bike', 'https://loremflickr.com/640/480?lock=2284398118436864'),
(50, '2023-09-21 00:00:00', 20, 924, 'Handcrafted Soft Pizza', 'https://loremflickr.com/640/480?lock=8168114875269120'),
(46, '2023-09-27 00:00:00', 43, 539, 'Fantastic Wooden Car', 'https://picsum.photos/seed/55poXDOgW/640/480'),
(50, '2023-09-28 00:00:00', 48, 243, 'Tasty Frozen Bike', 'https://picsum.photos/seed/w1Dk4/640/480'),
(4, '2023-09-25 00:00:00', 30, 650, 'Bespoke Frozen Hat', 'https://loremflickr.com/640/480?lock=3287377661394944'),
(35, '2023-09-30 00:00:00', 24, 981, 'Fantastic Plastic Pizza', 'https://loremflickr.com/640/480?lock=3536021478178816'),
(37, '2023-09-26 00:00:00', 47, 737, 'Refined Bronze Car', 'https://loremflickr.com/640/480?lock=8737591882940416'),
(29, '2023-09-16 00:00:00', 45, 288, 'Small Frozen Keyboard', 'https://picsum.photos/seed/JBbVPJX/640/480'),
(10, '2023-10-09 00:00:00', 40, 914, 'Sleek Soft Mouse', 'https://loremflickr.com/640/480?lock=3313946303922176'),
(8, '2023-09-28 00:00:00', 37, 904, 'Modern Bronze Pants', 'https://picsum.photos/seed/XBADpb/640/480'),
(8, '2023-09-22 00:00:00', 42, 395, 'Rustic Cotton Gloves', 'https://loremflickr.com/640/480?lock=4733152014630912'),
(13, '2023-10-04 00:00:00', 34, 92, 'Ergonomic Bronze Gloves', 'https://loremflickr.com/640/480?lock=1547492004986880'),
(46, '2023-10-05 00:00:00', 8, 621, 'Practical Metal Shoes', 'https://loremflickr.com/640/480?lock=7447076927438848'),
(42, '2023-10-07 00:00:00', 10, 198, 'Handcrafted Bronze Chicken', 'https://picsum.photos/seed/xEfFvFZO3Q/640/480'),
(30, '2023-09-16 00:00:00', 12, 648, 'Tasty Bronze Gloves', 'https://picsum.photos/seed/rhW8hCcfWi/640/480'),
(44, '2023-09-28 00:00:00', 24, 275, 'Rustic Bronze Car', 'https://loremflickr.com/640/480?lock=2426980272177152'),
(13, '2023-09-27 00:00:00', 26, 335, 'Handcrafted Fresh Chips', 'https://loremflickr.com/640/480?lock=8097629170827264'),
(48, '2023-10-01 00:00:00', 16, 479, 'Modern Steel Tuna', 'https://picsum.photos/seed/ZIewo/640/480'),
(32, '2023-10-09 00:00:00', 36, 952, 'Oriental Frozen Shoes', 'https://picsum.photos/seed/LGYOoR/640/480'),
(36, '2023-09-29 00:00:00', 43, 989, 'Rustic Soft Computer', 'https://loremflickr.com/640/480?lock=3064522698915840'),
(34, '2023-10-08 00:00:00', 4, 55, 'Oriental Cotton Salad', 'https://picsum.photos/seed/rwb0A98/640/480'),
(32, '2023-10-05 00:00:00', 49, 665, 'Tasty Bronze Ball', 'https://loremflickr.com/640/480?lock=5873607947321344'),
(48, '2023-09-28 00:00:00', 6, 172, 'Modern Steel Chips', 'https://picsum.photos/seed/4QfWb1IRi/640/480'),
(42, '2023-10-08 00:00:00', 41, 911, 'Generic Steel Pizza', 'https://loremflickr.com/640/480?lock=3287967953059840'),
(43, '2023-09-20 00:00:00', 21, 208, 'Handcrafted Cotton Car', 'https://loremflickr.com/640/480?lock=5356963319775232'),
(1, '2023-10-12 00:00:00', 21, 337, 'Sleek Rubber Tuna', 'https://picsum.photos/seed/s9nLXyxw/640/480'),
(24, '2023-09-26 00:00:00', 43, 390, 'Modern Soft Towels', 'https://picsum.photos/seed/R4qlwBdc/640/480'),
(1, '2023-10-05 00:00:00', 21, 4, 'Awesome Concrete Computer', 'https://loremflickr.com/640/480?lock=4151269358829568'),
(13, '2023-09-29 00:00:00', 32, 677, 'Licensed Fresh Salad', 'https://loremflickr.com/640/480?lock=7191071587041280'),
(38, '2023-09-24 00:00:00', 7, 383, 'Recycled Fresh Mouse', 'https://picsum.photos/seed/bd92pIlxZ/640/480'),
(9, '2023-09-26 00:00:00', 49, 145, 'Fantastic Cotton Hat', 'https://loremflickr.com/640/480?lock=8929266509021184'),
(22, '2023-10-07 00:00:00', 23, 585, 'Recycled Concrete Table', 'https://loremflickr.com/640/480?lock=2900431814524928'),
(24, '2023-10-07 00:00:00', 15, 979, 'Modern Granite Shoes', 'https://picsum.photos/seed/DqolnD/640/480'),
(1, '2023-09-18 00:00:00', 20, 546, 'Licensed Fresh Tuna', 'https://loremflickr.com/640/480?lock=1791964118777856'),
(39, '2023-09-22 00:00:00', 17, 86, 'Elegant Cotton Keyboard', 'https://picsum.photos/seed/KJLHOt/640/480'),
(15, '2023-09-30 00:00:00', 23, 817, 'Bespoke Bronze Car', 'https://picsum.photos/seed/O8BfZfol/640/480'),
(7, '2023-10-11 00:00:00', 7, 784, 'Small Granite Chicken', 'https://picsum.photos/seed/Ad8cl2F/640/480'),
(10, '2023-09-17 00:00:00', 35, 454, 'Rustic Metal Car', 'https://picsum.photos/seed/hjcj5rOV7B/640/480'),
(39, '2023-09-21 00:00:00', 6, 580, 'Electronic Plastic Mouse', 'https://picsum.photos/seed/RzJZy56Uak/640/480'),
(22, '2023-10-10 00:00:00', 23, 33, 'Licensed Steel Chair', 'https://picsum.photos/seed/ZfFfcp/640/480'),
(12, '2023-10-06 00:00:00', 39, 933, 'Bespoke Bronze Car', 'https://loremflickr.com/640/480?lock=1507228718727168'),
(6, '2023-10-12 00:00:00', 15, 247, 'Licensed Bronze Pants', 'https://picsum.photos/seed/CtIwM0CLQd/640/480'),
(13, '2023-09-29 00:00:00', 37, 176, 'Luxurious Frozen Pizza', 'https://loremflickr.com/640/480?lock=7865504362397696'),
(25, '2023-09-27 00:00:00', 24, 746, 'Small Metal Car', 'https://picsum.photos/seed/TBQyRw/640/480'),
(24, '2023-09-21 00:00:00', 29, 92, 'Luxurious Plastic Shirt', 'https://picsum.photos/seed/BtNNu/640/480'),
(30, '2023-10-12 00:00:00', 24, 994, 'Handcrafted Concrete Chicken', 'https://loremflickr.com/640/480?lock=8777464033574912'),
(36, '2023-10-09 00:00:00', 49, 468, 'Rustic Metal Pizza', 'https://loremflickr.com/640/480?lock=1817401016451072'),
(28, '2023-10-09 00:00:00', 21, 326, 'Sleek Fresh Pants', 'https://loremflickr.com/640/480?lock=6301782800072704'),
(12, '2023-09-25 00:00:00', 44, 18, 'Handmade Plastic Sausages', 'https://loremflickr.com/640/480?lock=8288052266926080'),
(42, '2023-09-30 00:00:00', 14, 432, 'Small Granite Keyboard', 'https://loremflickr.com/640/480?lock=2882254399340544'),
(20, '2023-10-05 00:00:00', 47, 401, 'Oriental Frozen Bacon', 'https://picsum.photos/seed/a8iaE94FX/640/480'),
(40, '2023-10-03 00:00:00', 40, 741, 'Gorgeous Fresh Shoes', 'https://loremflickr.com/640/480?lock=6409836585549824'),
(34, '2023-10-01 00:00:00', 31, 280, 'Ergonomic Plastic Gloves', 'https://picsum.photos/seed/ait6Fz/640/480'),
(11, '2023-09-30 00:00:00', 11, 781, 'Intelligent Metal Bacon', 'https://loremflickr.com/640/480?lock=6524729301139456'),
(20, '2023-09-21 00:00:00', 19, 63, 'Tasty Granite Chair', 'https://picsum.photos/seed/5I2vNsf6T/640/480'),
(50, '2023-09-27 00:00:00', 7, 508, 'Incredible Wooden Chips', 'https://loremflickr.com/640/480?lock=2102474387226624'),
(46, '2023-10-06 00:00:00', 42, 993, 'Modern Cotton Pants', 'https://loremflickr.com/640/480?lock=6871019534942208'),
(37, '2023-09-26 00:00:00', 26, 632, 'Generic Frozen Shirt', 'https://picsum.photos/seed/7sJWW/640/480'),
(14, '2023-09-30 00:00:00', 3, 530, 'Awesome Steel Towels', 'https://loremflickr.com/640/480?lock=4645517302693888'),
(31, '2023-10-07 00:00:00', 12, 644, 'Handcrafted Granite Cheese', 'https://picsum.photos/seed/69W6wVLK/640/480'),
(7, '2023-09-16 00:00:00', 1, 802, 'Sleek Plastic Table', 'https://picsum.photos/seed/1uVdibIc33/640/480'),
(33, '2023-09-25 00:00:00', 22, 707, 'Ergonomic Fresh Salad', 'https://loremflickr.com/640/480?lock=6550873463324672'),
(28, '2023-10-10 00:00:00', 14, 603, 'Licensed Fresh Chicken', 'https://loremflickr.com/640/480?lock=7177431842553856'),
(27, '2023-09-16 00:00:00', 18, 135, 'Luxurious Concrete Keyboard', 'https://loremflickr.com/640/480?lock=579876989960192'),
(9, '2023-10-06 00:00:00', 42, 274, 'Handcrafted Granite Bike', 'https://loremflickr.com/640/480?lock=3774384349118464'),
(21, '2023-09-28 00:00:00', 42, 302, 'Unbranded Cotton Ball', 'https://picsum.photos/seed/fKFxX7ws3/640/480'),
(45, '2023-10-12 00:00:00', 37, 328, 'Oriental Steel Computer', 'https://picsum.photos/seed/8GhxY/640/480'),
(17, '2023-09-21 00:00:00', 40, 576, 'Oriental Cotton Gloves', 'https://picsum.photos/seed/3vXqqkZtl/640/480'),
(26, '2023-09-23 00:00:00', 8, 89, 'Electronic Metal Car', 'https://loremflickr.com/640/480?lock=286015124144128'),
(36, '2023-09-26 00:00:00', 41, 358, 'Awesome Rubber Chips', 'https://picsum.photos/seed/XjzjP/640/480'),
(15, '2023-10-06 00:00:00', 28, 293, 'Intelligent Wooden Hat', 'https://picsum.photos/seed/3XHM8Fj9v/640/480'),
(33, '2023-09-16 00:00:00', 30, 726, 'Modern Metal Hat', 'https://loremflickr.com/640/480?lock=5848443058651136'),
(2, '2023-09-30 00:00:00', 1, 581, 'Gorgeous Fresh Bike', 'https://picsum.photos/seed/JKphGNRv/640/480'),
(28, '2023-09-25 00:00:00', 46, 790, 'Handmade Concrete Keyboard', 'https://loremflickr.com/640/480?lock=4960329266102272'),
(37, '2023-09-29 00:00:00', 34, 404, 'Generic Rubber Pizza', 'https://picsum.photos/seed/iU6cQ8/640/480'),
(27, '2023-09-19 00:00:00', 17, 682, 'Sleek Fresh Chair', 'https://loremflickr.com/640/480?lock=1593009764302848'),
(36, '2023-09-21 00:00:00', 18, 246, 'Oriental Concrete Mouse', 'https://picsum.photos/seed/QieB9/640/480'),
(51, '2023-09-30 03:04:06', 3, 505, 'Electronic Cotton Gloves', 'https://loremflickr.com/640/480?lock=8224276584857600');

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
(1, 20, 3),
(2, 49, 3),
(3, 36, 2),
(4, 44, 2),
(5, 39, 1),
(6, 27, 3),
(7, 9, 1),
(8, 34, 3),
(9, 10, 2),
(10, 43, 3),
(11, 24, 3),
(12, 16, 1),
(13, 28, 2),
(14, 15, 1),
(15, 50, 3),
(16, 22, 1),
(17, 1, 2),
(18, 42, 2),
(19, 33, 3),
(20, 12, 1),
(21, 23, 2),
(22, 35, 1),
(23, 2, 1),
(24, 4, 1),
(25, 38, 1),
(26, 31, 1),
(27, 18, 2),
(28, 6, 2),
(29, 47, 1),
(30, 29, 2),
(31, 46, 3),
(32, 5, 2),
(33, 30, 2),
(34, 3, 2),
(35, 11, 2),
(36, 19, 1),
(37, 7, 2),
(38, 45, 2),
(39, 8, 2),
(40, 13, 1),
(41, 40, 1),
(42, 32, 1),
(43, 17, 1),
(44, 41, 3),
(45, 25, 1),
(46, 21, 2),
(47, 37, 1),
(48, 48, 2),
(49, 14, 1),
(50, 26, 1);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `abuse_reports`
--
ALTER TABLE `abuse_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_userid` (`userid`),
  ADD KEY `products_categoryid` (`categoryid`);

--
-- Indexen voor tabel `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_category_name` (`name`);

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
-- AUTO_INCREMENT voor een tabel `abuse_reports`
--
ALTER TABLE `abuse_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT voor een tabel `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT voor een tabel `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 14 nov 2023 om 21:11
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
-- Tabelstructuur voor tabel `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL,
  `incoming_msg_id` int(255) NOT NULL,
  `outgoing_msg_id` int(255) NOT NULL,
  `msg` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `messages`
--

INSERT INTO `messages` (`msg_id`, `incoming_msg_id`, `outgoing_msg_id`, `msg`) VALUES
(4, 31, 52, 'Helloo'),
(5, 31, 52, 'me gon beat u up'),
(6, 31, 52, 'yesyes'),
(7, 31, 52, 'gege'),
(8, 31, 52, 'awdada'),
(9, 52, 53, 'hewwo'),
(10, 53, 52, 'who are u??'),
(11, 52, 53, 'ur mom'),
(12, 53, 52, 'huh'),
(13, 53, 52, 'i have 2 moms?'),
(14, 52, 53, 'yeess hehehe'),
(15, 53, 52, 'NOOOO'),
(16, 53, 52, 'wdw'),
(17, 53, 52, 'ww'),
(18, 52, 53, 'wad'),
(19, 31, 53, 'helooo'),
(20, 3, 53, 'heahe'),
(21, 1, 53, 'dwawdw');

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
(1, 40, 4, 'Small Steel Chips', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 102.00, '25.jpg', '2023-11-13 19:09:51', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(2, 43, 1, 'Awesome Metal Ball', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 228.00, '19.jpg', '2023-11-13 14:36:01', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(3, 49, 5, 'Fantastic Wooden Car', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 291.00, '35.jpg', '2023-11-13 15:45:21', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(4, 12, 8, 'Recycled Plastic Chips', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 15.00, '10.jpg', '2023-11-13 23:17:47', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(5, 19, 5, 'Practical Rubber Chicken', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 75.00, '9.jpg', '2023-11-13 08:21:46', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(6, 17, 10, 'Intelligent Concrete Mouse', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 992.00, '4.jpg', '2023-11-13 09:16:46', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(7, 31, 6, 'Handcrafted Plastic Chicken', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 526.00, '44.jpg', '2023-11-13 23:48:53', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(8, 14, 9, 'Incredible Plastic Bacon', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 936.00, '47.jpg', '2023-11-13 18:42:39', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(9, 24, 5, 'Rustic Frozen Cheese', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 552.00, '31.jpg', '2023-11-14 03:15:55', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(10, 21, 4, 'Small Metal Hat', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 78.00, '48.jpg', '2023-11-13 09:22:15', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(11, 11, 9, 'Bespoke Bronze Mouse', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 222.00, '13.jpg', '2023-11-13 10:04:50', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(12, 33, 10, 'Sleek Rubber Pizza', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 781.00, '41.jpg', '2023-11-14 05:06:52', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(13, 16, 3, 'Rustic Granite Bike', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 678.00, '24.jpg', '2023-11-13 08:23:00', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(14, 41, 3, 'Licensed Cotton Table', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 273.00, '21.jpg', '2023-11-13 18:00:05', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(15, 8, 2, 'Unbranded Frozen Soap', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 135.00, '35.jpg', '2023-11-13 21:32:09', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(16, 15, 4, 'Licensed Soft Salad', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 383.00, '21.jpg', '2023-11-13 18:28:51', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(17, 48, 10, 'Licensed Steel Chicken', 'The Football Is Good For Training And Recreational Purposes', 643.00, '7.jpg', '2023-11-13 08:25:30', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(18, 29, 4, 'Generic Frozen Keyboard', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 306.00, '20.jpg', '2023-11-13 22:29:15', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(19, 45, 6, 'Bespoke Frozen Table', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 333.00, '36.jpg', '2023-11-13 23:07:48', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(20, 20, 10, 'Recycled Concrete Gloves', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 747.00, '39.jpg', '2023-11-13 23:57:46', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(21, 37, 10, 'Rustic Granite Sausages', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 542.00, '5.jpg', '2023-11-13 09:26:35', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(22, 6, 4, 'Incredible Bronze Soap', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 472.00, '5.jpg', '2023-11-14 05:04:56', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(23, 50, 7, 'Generic Steel Tuna', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 955.00, '16.jpg', '2023-11-13 19:13:35', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(24, 39, 9, 'Sleek Fresh Mouse', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 674.00, '1.jpg', '2023-11-14 02:38:19', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(25, 23, 1, 'Practical Soft Bike', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 735.00, '39.jpg', '2023-11-13 19:36:54', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(26, 27, 10, 'Small Plastic Keyboard', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 588.00, '18.jpg', '2023-11-14 03:56:30', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(27, 36, 2, 'Small Steel Ball', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 412.00, '27.jpg', '2023-11-13 16:36:12', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(28, 34, 2, 'Refined Frozen Ball', 'The Football Is Good For Training And Recreational Purposes', 306.00, '27.jpg', '2023-11-13 12:48:36', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(29, 5, 7, 'Rustic Bronze Mouse', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 441.00, '29.jpg', '2023-11-13 08:28:15', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(30, 10, 5, 'Unbranded Fresh Pants', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 701.00, '31.jpg', '2023-11-13 13:01:13', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(31, 28, 3, 'Handmade Concrete Keyboard', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 299.00, '22.jpg', '2023-11-13 08:02:08', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(32, 3, 4, 'Oriental Cotton Tuna', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 462.00, '33.jpg', '2023-11-13 18:44:44', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(33, 26, 10, 'Unbranded Rubber Tuna', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 290.00, '26.jpg', '2023-11-13 13:39:30', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(34, 47, 8, 'Incredible Cotton Keyboard', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 971.00, '22.jpg', '2023-11-13 08:00:02', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(35, 35, 6, 'Incredible Bronze Pants', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 752.00, '29.jpg', '2023-11-13 15:42:22', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(36, 25, 8, 'Gorgeous Bronze Cheese', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 663.00, '27.jpg', '2023-11-13 09:16:39', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(37, 18, 9, 'Elegant Rubber Tuna', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 928.00, '23.jpg', '2023-11-13 13:11:58', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(38, 42, 1, 'Licensed Cotton Chips', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 698.00, '24.jpg', '2023-11-13 08:09:36', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(39, 32, 5, 'Handmade Concrete Bacon', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 53.00, '11.jpg', '2023-11-13 15:12:24', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(40, 30, 4, 'Sleek Rubber Pants', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 427.00, '5.jpg', '2023-11-13 23:36:57', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(41, 2, 7, 'Electronic Metal Mouse', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 533.00, '2.jpg', '2023-11-13 07:10:08', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(42, 13, 1, 'Rustic Rubber Mouse', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 285.00, '21.jpg', '2023-11-13 18:11:30', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(43, 22, 1, 'Small Rubber Pizza', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 449.00, '13.jpg', '2023-11-13 17:16:30', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(44, 38, 1, 'Elegant Plastic Bike', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 114.00, '12.jpg', '2023-11-13 22:16:45', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(45, 44, 7, 'Licensed Plastic Shoes', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 654.00, '2.jpg', '2023-11-13 19:56:06', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(46, 46, 9, 'Practical Frozen Cheese', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 629.00, '2.jpg', '2023-11-13 13:38:29', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(47, 9, 4, 'Rustic Bronze Mouse', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 340.00, '3.jpg', '2023-11-14 05:21:08', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(48, 1, 4, 'Incredible Bronze Tuna', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 9.00, '5.jpg', '2023-11-13 07:34:44', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(49, 4, 5, 'Incredible Wooden Sausages', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 793.00, '2.jpg', '2023-11-13 16:13:10', '2023-11-13 07:44:08', '2023-11-13 07:44:08'),
(50, 7, 4, 'Bespoke Granite Mouse', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 402.00, '2.jpg', '2023-11-14 00:09:26', '2023-11-13 07:44:08', '2023-11-13 07:44:08');

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
(1, 'Movies', 'M9.75 3.104v5.714a2.25 2.25 0 01-.659 1.591L5 14.5M9.75 3.104c-.251.023-.501.05-.75.082m.75-.082a24.301 24.301 0 014.5 0m0 0v5.714c0 .597.237 1.17.659 1.591L19.8 15.3M14.25 3.104c.251.023.501.05.75.082M19.8 15.3l-1.57.393A9.065 9.065 0 0112 15a9.065 9.065 0 00-6.23-.693L5 14.5m14.8.8l1.402 1.402c1.232 1.232.65 3.318-1.067 3.611A48.309 48.309 0 0112 21c-2.773 0-5.491-.235-8.135-.687-1.718-.293-2.3-2.379-1.067-3.61L5 14.5'),
(2, 'Tools', 'M2.25 18.75a60.07 60.07 0 0115.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 013 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 00-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 01-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 003 15h-.75M15 10.5a3 3 0 11-6 0 3 3 0 016 0zm3 0h.008v.008H18V10.5zm-12 0h.008v.008H6V10.5z'),
(3, 'Grocery', 'M12 9.75v6.75m0 0l-3-3m3 3l3-3m-8.25 6a4.5 4.5 0 01-1.41-8.775 5.25 5.25 0 0110.233-2.33 3 3 0 013.758 3.848A3.752 3.752 0 0118 19.5H6.75z'),
(4, 'Beauty', 'M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z'),
(5, 'Baby', 'M2.25 21h19.5m-18-18v18m10.5-18v18m6-13.5V21M6.75 6.75h.75m-.75 3h.75m-.75 3h.75m3-6h.75m-.75 3h.75m-.75 3h.75M6.75 21v-3.375c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21M3 3h12m-.75 4.5H21m-3.75 3.75h.008v.008h-.008v-.008zm0 3h.008v.008h-.008v-.008zm0 3h.008v.008h-.008v-.008z'),
(6, 'Jewelery', 'M6.75 7.5l3 2.25-3 2.25m4.5 0h3m-9 8.25h13.5A2.25 2.25 0 0021 18V6a2.25 2.25 0 00-2.25-2.25H5.25A2.25 2.25 0 003 6v12a2.25 2.25 0 002.25 2.25z'),
(7, 'Electronics', 'M21 11.25v8.25a1.5 1.5 0 01-1.5 1.5H5.25a1.5 1.5 0 01-1.5-1.5v-8.25M12 4.875A2.625 2.625 0 109.375 7.5H12m0-2.625V7.5m0-2.625A2.625 2.625 0 1114.625 7.5H12m0 0V21m-8.625-9.75h18c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125h-18c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z'),
(8, 'Outdoors', 'M6.115 5.19l.319 1.913A6 6 0 008.11 10.36L9.75 12l-.387.775c-.217.433-.132.956.21 1.298l1.348 1.348c.21.21.329.497.329.795v1.089c0 .426.24.815.622 1.006l.153.076c.433.217.956.132 1.298-.21l.723-.723a8.7 8.7 0 002.288-4.042 1.087 1.087 0 00-.358-1.099l-1.33-1.108c-.251-.21-.582-.299-.905-.245l-1.17.195a1.125 1.125 0 01-.98-.314l-.295-.295a1.125 1.125 0 010-1.591l.13-.132a1.125 1.125 0 011.3-.21l.603.302a.809.809 0 001.086-1.086L14.25 7.5l1.256-.837a4.5 4.5 0 001.528-1.732l.146-.292M6.115 5.19A9 9 0 1017.18 4.64M6.115 5.19A8.965 8.965 0 0112 3c1.929 0 3.716.607 5.18 1.64'),
(9, 'Industrial', 'M6.75 7.5l3 2.25-3 2.25m4.5 0h3m-9 8.25h13.5A2.25 2.25 0 0021 18V6a2.25 2.25 0 00-2.25-2.25H5.25A2.25 2.25 0 003 6v12a2.25 2.25 0 002.25 2.25z'),
(10, 'Music', 'M4.5 12a7.5 7.5 0 0015 0m-15 0a7.5 7.5 0 1115 0m-15 0H3m16.5 0H21m-1.5 0H12m-8.457 3.077l1.41-.513m14.095-5.13l1.41-.513M5.106 17.785l1.15-.964m11.49-9.642l1.149-.964M7.501 19.795l.75-1.3m7.5-12.99l.75-1.3m-6.063 16.658l.26-1.477m2.605-14.772l.26-1.477m0 17.726l-.26-1.477M10.698 4.614l-.26-1.477M16.5 19.794l-.75-1.299M7.5 4.205L12 12m6.894 5.785l-1.149-.964M6.256 7.178l-1.15-.964m15.352 8.864l-1.41-.513M4.954 9.435l-1.41-.514M12.002 12l-3.75 6.495');

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
  `status` text DEFAULT 'Offline now',
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `firstname`, `lastname`, `status`, `updatedAt`, `createdAt`) VALUES
(1, 'Audrey.Block', 'Halie58@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$FtTBavN+PyRGH/EaFhOruw$cp3I2CtMKOiXiks9Zu67HmoSIJrpEKq7v4MPmYa5wCc', 'Monroe', 'Sporer', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(2, 'Liam_Langworth', 'Queenie_Graham10@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$lpRDtdqo2g3Tfh/L4lEwOg$yipgBRPiskl+rjOCNSXU8mFhu32xa9vKT0zltz3BD6g', 'Enos', 'Douglas', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(3, 'Estell_Rowe', 'Lysanne_Spinka14@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$FjsMRRZ4yZzIbTWBODlZuw$Yk3ZIbR4ZKyOcccIyIqv8jLry6j3PM80dC7ORbPPCS8', 'Otha', 'Strosin-Rau', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(4, 'Saige.Watsica17', 'Lily.Hayes@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$/zNKn1PujYeEox1ORxAvzQ$RkhS/1BBNUJyCgwh1/qSIFqD/pIiaMU9WOIg/1sn1o0', 'Bethany', 'Wilkinson', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(5, 'Mary.Leffler65', 'Remington.Huels66@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$M3G29+a7agVZIA8OI3GiiQ$iegWd0MqJmXThEjGiFPGFvTzIX5QghaNgi+xPEbtHWw', 'Perry', 'Schamberger', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(6, 'Lucile91', 'Robin_Walsh@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$ucyw/j9K/Oo7JRzGFLRmFw$EJAxX3OyvgijLwtucY1yUh0ABEy+Qcl5p2eKhwprpWc', 'Cierra', 'Cormier', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(7, 'Hellen.Rodriguez', 'Sydni57@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Zep5zK6seMOR1yyqVBzFNg$uPBYlggBX8Oxk6EuRdazi9HL/As3wBnkarRLok0IsiE', 'Devonte', 'Grimes', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(8, 'Scarlett_Hackett', 'Elton25@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$YmaIIup1/sYL9CudeqF15w$jrElEYYnHvUkC5tLnfT7L8NlDZVncUhvlU/6+PMBkjQ', 'Willy', 'Simonis', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(9, 'Lucile77', 'Cole_Fisher@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$DESoN9MP4eaQwhpQ+uqLUg$N4N4PiTi3vgO7OefFpzML3dOz4zQCY6h7E4hkLaR5O0', 'Freeda', 'Baumbach', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(10, 'Emmet_Casper64', 'Marlee.Hayes-Daniel23@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$DYK0HckDTMR9lVy4ZS77EQ$6CRYz9vBNGRzVDVcU3jhFlMC4azrbtkO26zkL5m5tNM', 'Maximillian', 'Waelchi', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(11, 'Genevieve_Paucek56', 'Haylie76@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$bEu2qo+AhUx8kPL1Nng91g$pvV231jKcAlvWnce0vvc0uwbFvAkcD8LOhciNmfnAKg', 'Freddie', 'Lang', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(12, 'Noel29', 'Marcelle45@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$lI+6/u6DJBZX0IhvKJoyBQ$1Qz7E3DC7IC9hclVnELkcOfdQ40kFWJ8/Bqlgaz89n8', 'Jerel', 'Thiel', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(13, 'Estelle.Renner24', 'Henry93@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$4FyzyWdPrMzdlBzCCHOXDg$a5XA11LB1W98PGqvuExb06QPEZFAv8f0PWkE4aLxgm8', 'Lorena', 'Jakubowski', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(14, 'Katlynn43', 'Kelton_Wisoky88@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$LkRC/zg3OCugpNAeHUFPZw$TNDyd9WCUr7jQEcaGCOaLT4sHiQYmJoegQ64GuVHwxE', 'Bethany', 'Powlowski', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(15, 'Charles.Fadel46', 'Aileen5@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$Sw37S/6ITZ8yn8AtSx3QcQ$luQqhw4QYUYtPYI4FuvRQGGw7P2JlfQdcGHD70dLEqI', 'Braden', 'Borer', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(16, 'Samantha14', 'Jonathan_Schaefer@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$posIVtEDnyn1YgJvLdHZJQ$8Fa/XaqPUiwaCq1A3zOHlIsiqdFX3P4cqXGqr+WXvCM', 'Peter', 'Walker', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(17, 'Lexie19', 'Winnifred97@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$xvoMR36Gw006JMsqI0o3gA$TtqSxmswUXQHRcGtIKvq/C2KV1L7AZg/0tdW/uhrvZY', 'Ozella', 'Wilkinson', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(18, 'Griffin_Leannon55', 'Aidan_Wiza@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$PXCjy4YUmkqN4U/PCd+4BA$zN1eWxrLIzhcDmFBymazBxMEwXXF48VPfkKTReFq7g8', 'Graciela', 'Wunsch', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(19, 'Ardith60', 'Zachary_Herman@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$1uSAi0rV/B31Wu3bk26S+A$/n6gKznmNA5GIK19wbOZBXorwJHWSTHLF5pvF5RKmIQ', 'Greyson', 'Wehner', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(20, 'Camila71', 'Providenci.Stoltenberg@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$5ESfIY71bHzejvJqkHDrxg$U6YO5Ex6ZbrhGoTijHNh57qyjpt3tzk79o45mOO2NGY', 'Kay', 'Hagenes', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(21, 'Kamryn46', 'Ernie.Corwin24@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$v6cJ6hGrNktnAyxTnwHLLw$GAN3w4xTIUOQaCOr69yPc2IIoJRd4ejpowCrpZPM7PQ', 'Keyshawn', 'Johnston', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(22, 'Ike15', 'Benton21@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$v1HCfMDcCsZsH//qGRAduQ$RWZd0zDurCWSNRDf70QLqHBfB/6DMOYWS+yt/uYf3RU', 'Pedro', 'Little', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(23, 'Adolphus_OKon92', 'Amy.Kilback68@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$fXKbSkKibnqPI8EtVvVkGA$s3DpUbk/jcQIClD/naTGqi4OErmUQORhEbz/IGyXvKU', 'Leonor', 'Boehm', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(24, 'Chesley32', 'Marguerite_Harber18@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$+1q/4AEjnGjOFApBJ6FC+g$wEXrNBahmD5nHjyuQb5yv9Puy9IrjX7c0CGxosW43Rc', 'Jazmin', 'Roberts', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(25, 'Jane.Mosciski', 'Maida_Breitenberg75@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$IL3CdjDm6GDzLZ/cbbP6Bg$ofLSr8JzjLgI+SRDHsv0Wzx1l5XJ+RLdLnoGKUzWB4U', 'Kayley', 'Pacocha', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(26, 'Serena_Lehner', 'Crawford.Stiedemann47@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$vwl0fa1BkWcU6t/33Mi3FA$wyUzlLVJb4q7JM7MushzTAF/IKs4RDtNTBOAy8g5QJQ', 'Mafalda', 'Ratke', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(27, 'Olen.Watsica-Russel70', 'Nakia_Hodkiewicz@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$zGdciQ74C3QwtNcdE4gsAQ$61kJJ6tYZ8JCozpwEf9hZqdADhakhUNyvTXXoTpiFB8', 'Ernest', 'Wunsch', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(28, 'Robyn_Altenwerth', 'Ernie45@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$nA0WYJIee2jbNG7rwrn/wg$ZxLFE9bfAH1Ef5tdsz3N4jmLqtKHpoS0pCbtIIQNpbI', 'Lonnie', 'Farrell', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(29, 'Nichole_Murazik94', 'Israel_Murphy92@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$kLVvZI7b1KglDTTiKd6G/w$l6YjFITWxUqrGzl8WoM24ADwhhm3CvkjbcSEKznEgC0', 'Aylin', 'Metz', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(30, 'Lisandro_Schowalter', 'Ludwig79@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$4r8kcSLkBosaZZvKsT/o2A$RZxFprnVkv2M6w8vQCfG2HFQ/BswMaXA34P/e92MFaA', 'Travon', 'Paucek', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(31, 'Consuelo79', 'Edmund70@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$TJnuOQtad0NqtPckwnmhOA$GJvATWBECrtx2G4coJnLfp55ANiK0pSYL8n+65oyKX4', 'Joesph', 'Orn', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(32, 'Concepcion.Wolf', 'Joannie.Tillman@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$73dAK+aL6jsD51C+ScMofQ$w+qhvJL6lJzBGVL1P06XMd+lH5sMWMuuzZqMWiYvqow', 'Ciara', 'Harris', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(33, 'Noble18', 'Wava.Gibson0@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$u7t9YGbMB68HaMzwqAtGkw$1zW3j+Y92srFo9KBOoK9XFhsY0GdcLU++SOIc4Ksmvw', 'Annetta', 'Hudson', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(34, 'Clair_Schuppe', 'Jaida_Price23@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$6fezRb+eRXt0DMU/FbRVag$aEHsEPoYWaIyM1YyPOBr5Y25fCvA87JXkVbv4QUX3Q0', 'Keeley', 'Bayer', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(35, 'Thurman_VonRueden25', 'Vincent.Schuppe@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$dNAUWx5FPsUPfBPeGw+fSw$YhLNJntCq13UW6/iWPJQ18jUgiQyGkn+VLp9+E1leY4', 'Ayana', 'Zieme', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(36, 'Katheryn_Brown77', 'Jayce_Hagenes@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$I03tO5jqUZOlk0ngTrn2og$KhqguWcvkE2C7ZgXl021Nkf5tsWW0St3Nzsq/NEFyJI', 'Karolann', 'Lang', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(37, 'Khalil76', 'Ashlee5@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$nwARdEDy6yV9g8K/OCSU7w$o3KON4kmZOa/bJmpH1YDj9ns2mTjJLsl6EHhcQ0Fi+A', 'Erica', 'Bednar-Bosco', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(38, 'Maxie_Prosacco', 'Noelia89@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$VUE06yZELp62b7pK8WM3vA$/xzFyt83qTlD/pHxBKHsNazochmHYwhSqn1vd6KY6X0', 'Imelda', 'Langosh', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(39, 'Joy_Grady10', 'Raul16@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$SC00dQ5WHrMuVTcDk8Kgzg$7izKRK/r+WRLOZ34wDyeepWD9Rz6irQj96mQZ4HcoeM', 'Camila', 'Reynolds', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(40, 'Oma94', 'Otho.Emard@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$0C8SpCEZS++KHmrJZnqgkA$CDvgoC5xB7Wsnmav+FoCfUaPws2TPh34gsmeBHSySBc', 'Jakob', 'Cassin', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(41, 'Gregoria.Jaskolski56', 'Kathleen68@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$tUx9AsCLJjNqV1qxjsvLIw$qgxAPkjCeEI7fR43kwSC0SqT+WL7nPiWioDFkGSRzfA', 'Kip', 'Keebler', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(42, 'Vito.Stamm10', 'Zane.Ratke24@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$j/yhMMgi44dpfhvaMBDbuQ$fO++vTrLnaPhHUcaykQeapokqcI5tzD+5ebMssntf2k', 'Darwin', 'Haag', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(43, 'Rey.Bailey', 'Rosie.Doyle27@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$LPsROrc1Jsa7JbgFzABtBA$YwJxQ8Q59Cbtx/aW+ZO/pp7oq/OX/EN+YmW03wW4dbg', 'Thomas', 'Cartwright', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(44, 'Maynard.Jacobson', 'Christa_Sporer73@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$KkwQJleExLphpyoHs3T57w$D6mWC1OOOvw1OeuX+P2Tdrf3igZMggF4/Nvr36LiApw', 'Candelario', 'Kihn', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(45, 'Norbert73', 'Raphael88@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$8f5WNi7Qr/L15Iv+JyMt9g$S2ZdXbXpMBOW87fEpzQln61o2Upy5sVZyiKVppP/WXk', 'Brianne', 'Windler', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(46, 'Aniya.Johnston', 'Reyes_Hayes40@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$mkOXEAT2dL53jR1gq1c4yA$DdVqUwrErikxdFZ0lKLPBXJSGpyuu9irGMQEZa/mrTo', 'Coby', 'Greenholt', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(47, 'Jared13', 'Shakira.Altenwerth@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$d6rHE/ykJHSh4bw15t7/+A$1wGwD4tFgdZQyR3o2sSrJ3IlxaKYrAzf43gEZVcrj0w', 'Justyn', 'Schaefer', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(48, 'Linwood93', 'Eryn.Tromp20@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$ouiC7Q8mEAuPF18yFt5FCg$a0E+JdnJ3xqW7d52lNa9zyZ+XdV5ZgGrDh357NRvttA', 'Shanny', 'Corkery', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(49, 'Skyla62', 'Adrien.Luettgen@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$wy3GuC7cUvakLUttbbreBg$nrI5S1QDsQJEFYumpYhEbWLkPt1pUv5Rs5H3nAZ5Iq8', 'Brook', 'Hyatt', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(50, 'Meggie_Metz', 'Rod_Bradtke27@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$muDKEEDY2AYLgBXq6RALng$I7CiZ8m7VBl6/y6dRCgxg7wW21Wmy40DJyyauq5tdNo', 'Eliseo', 'Macejkovic', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(51, 'Testing Account', 'test@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$+9rU3e41kDSk/ccW8QOXAQ$1jkdTgxdXq60+JFYkOmIj6Tkr2+ylTN6TDFMegDWSw8', 'Testing', 'Account', 'Offline now', '2023-11-13 07:44:07', '2023-11-13 07:44:07'),
(52, 'Abdullah Evloev', 'abdevl76@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$RmROZi5ENlFkRlQuZERHRQ$rZ5tKCMiCefQa0qw271IcnIbEibdLH2YCSyK0B5psBY', 'Abdullah', 'Evloev', 'Offline now', '2023-11-13 08:26:44', '2023-11-13 07:44:22'),
(53, 'adwda', 'admin@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$NHdsc1JGVm5WMWZHbjVmQQ$MQN+ex1eCZ+OkHXZgpMg9slbinctraITfR0xiY0Ewlo', 'john', 'wick', 'Offline now', '2023-11-14 19:49:53', '2023-11-14 19:49:53');

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
(1, 31, 'https://avatars.githubusercontent.com/u/24703435', 'Texo aegrotatio ipsam bis nemo fuga. Una eos amplus delinquo vaco surgo varietas alius. Arbustum termes congregatio ustulo anser caveo.', 'light', 'text_en'),
(2, 3, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/693.jpg', 'Censura cunctatio thorax apto cupiditas caritas tum pecto voluptas. Cibo tumultus ager candidus volup. Maiores consuasor adaugeo auditor appositus.', 'dark', 'text_nl'),
(3, 28, 'https://avatars.githubusercontent.com/u/95051676', 'Odio recusandae tenuis absum. Contego aestas maxime acceptus cito. Pel exercitationem caelum uredo vorax ciminatio compello accusamus summopere.', 'light', 'text_fr'),
(4, 1, 'https://avatars.githubusercontent.com/u/165814', 'Patior vulpes aequus in appositus patria aut tollo chirographum. Denuo caelestis vergo supellex tempore utroque color universe solium tantillus. Clementia contigo socius vere vulpes conitor dedico tergum aequus aestivus.', 'dark', 'text_nl'),
(5, 26, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/713.jpg', 'Consequuntur possimus attero. Arguo aut vere decretum creator tam somniculosus aeternus. Thymum tertius blandior unde custodia cruciamentum corrigo bonus.', 'dark', 'text_en'),
(6, 21, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/906.jpg', 'Vilitas tonsor colligo. Uberrime suffoco torrens conservo asporto dolore tamisium tricesimus. Vorax allatus basium repellat occaecati celer astrum adhuc sublime.', 'light', 'text_fr'),
(7, 36, 'https://avatars.githubusercontent.com/u/3112715', 'Suffragium deprecator ars catena vito eaque sordeo sol teres. Eos urbs deputo denuo auctus depraedor cuius. Odio decumbo illo.', 'light', 'text_nl'),
(8, 27, 'https://avatars.githubusercontent.com/u/98341837', 'Doloremque balbus thalassinus culpo colligo. Angulus ultra angelus. Cursus theologus subseco totidem suppellex acceptus aliqua corrigo sollers viscus.', 'dark', 'text_nl'),
(9, 8, 'https://avatars.githubusercontent.com/u/4559347', 'Delibero magnam aspernatur dolores thorax ciminatio voluptatum spoliatio. Coadunatio cibus terebro cunabula quo minima hic ara. Aggredior civitas dolor pecco tempore.', 'dark', 'text_en'),
(10, 25, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/685.jpg', 'Turba adfectus cogo calcar error sumo veniam tumultus. Stabilis cena ante contigo sursum tunc nostrum natus calamitas vomica. Concido quod eos voro confido vitae avaritia colligo utrum.', 'light', 'text_nl'),
(11, 34, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/69.jpg', 'Nulla caelestis cinis culpo torqueo saepe summisse minus usus tollo. Cibo harum sonitus. Pel voluptates audacia crux.', 'light', 'text_en'),
(12, 44, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/963.jpg', 'Viriliter nulla cui cursim tempore carcer saepe numquam tergum solio. Congregatio provident capitulus depraedor crux avarus cunabula at. Corrumpo summopere socius surgo aspicio soleo adstringo quisquam celo amoveo.', 'dark', 'text_fr'),
(13, 14, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/629.jpg', 'Verto astrum cogo degenero quibusdam defendo. Vitae vesper optio viridis conturbo sumptus abduco cunae. Clamo thesis atque attonbitus depraedor thesis.', 'dark', 'text_nl'),
(14, 23, 'https://avatars.githubusercontent.com/u/35794666', 'Crebro adicio contabesco officiis capillus bibo aut circumvenio pecto solio. Vir vehemens avaritia antea venia venio tergum capillus. Thesaurus cognatus ait nulla utroque.', 'light', 'text_en'),
(15, 47, 'https://avatars.githubusercontent.com/u/54007360', 'Spectaculum argumentum atque admoneo velum acidus saepe tribuo. Utilis laboriosam triduana. Ter ciminatio incidunt virga decipio vinculum vicissitudo.', 'light', 'text_nl'),
(16, 5, 'https://avatars.githubusercontent.com/u/86097269', 'Speculum bis ter cubo cursim. Aestas uxor stillicidium optio sustineo caelum undique. Vereor tego patior complectus trepide enim.', 'dark', 'text_fr'),
(17, 18, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/309.jpg', 'Stips subvenio curo deleniti teres. Voluptatem aliquam atqui temeritas suggero conventus conservo curso. Conscendo cumque supellex cultura vorax.', 'light', 'text_en'),
(18, 13, 'https://avatars.githubusercontent.com/u/23273159', 'Cavus tres trepide vel amplexus subnecto sum capio articulus. Coruscus ambulo aufero tracto torrens subvenio non carus. Aeneus tergeo minima deserunt fuga campana cado contra derelinquo adaugeo.', 'light', 'text_en'),
(19, 46, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/718.jpg', 'Inventore vilitas pectus tenuis. Tutis varius suffragium vorago succurro sponte talio denique trepide. Balbus audacia convoco.', 'dark', 'text_nl'),
(20, 20, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/918.jpg', 'Cito facere cinis synagoga amita tam voluptas. Confido pauper sol sum maxime taedium. Tonsor spero maxime impedit.', 'light', 'text_fr'),
(21, 24, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/722.jpg', 'Ater vacuus suggero suffragium defungo spoliatio adnuo. Artificiose eos conservo adstringo varietas amita suus. Infit audax vomer tametsi brevis.', 'light', 'text_nl'),
(22, 17, 'https://avatars.githubusercontent.com/u/68598716', 'Cervus aperio delego. Catena timidus solus cribro. Absum cariosus talio bos taceo colligo creptio vado amiculum vallum.', 'light', 'text_en'),
(23, 7, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/681.jpg', 'Suadeo adeo apostolus veritas atqui delibero confugo verbum. Tersus cursus inventore corporis porro considero ventosus territo. Triumphus admiratio curia vigilo adiuvo vigilo amplitudo tamen deputo.', 'dark', 'text_nl'),
(24, 41, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/938.jpg', 'Delibero amo spoliatio tubineus voluptatem stips barba ascisco. Cupiditate accedo studio arbitro degenero bestia creator subvenio. Carbo facilis pectus.', 'dark', 'text_fr'),
(25, 9, 'https://avatars.githubusercontent.com/u/93688614', 'Cilicium crastinus adopto annus vesper callide. Administratio aeneus adsidue video tutis sortitus tandem apto. Crastinus arbor aliquam quibusdam creptio depereo commemoro speculum aliqua.', 'dark', 'text_nl'),
(26, 4, 'https://avatars.githubusercontent.com/u/3485830', 'Adimpleo benigne solutio illum. Sint dedico saepe centum sperno adfero aegrotatio. Deserunt sum odio non.', 'dark', 'text_en'),
(27, 10, 'https://avatars.githubusercontent.com/u/22420598', 'Convoco terebro usus. Cum quaerat alo dolor ratione sumo. Aufero ex turbo bibo arx corporis.', 'light', 'text_fr'),
(28, 43, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/413.jpg', 'Ara suasoria cur condico minima aqua theatrum vicinus adficio. Tepidus tactus uter vicissitudo stipes agnosco vero tepesco conduco corpus. Bos tardus condico confero contigo atque tergiversatio delego eum trucido.', 'dark', 'text_nl'),
(29, 11, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/497.jpg', 'Caveo verus pecco tenetur currus incidunt. Saepe careo defessus. Careo crepusculum tum cicuta.', 'light', 'text_nl'),
(30, 15, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/620.jpg', 'Caelestis claro maiores deficio pecto acies. Vicinus ater delectatio. Arto creptio depulso contego iste deorsum cruentus ambulo cenaculum admoneo.', 'dark', 'text_fr'),
(31, 45, 'https://avatars.githubusercontent.com/u/14800121', 'Tero bene autus maxime. Coniecto claudeo quas quod solitudo corroboro. Ver caelestis absum crepusculum quod.', 'light', 'text_en'),
(32, 48, 'https://avatars.githubusercontent.com/u/21772538', 'Sto conitor vulticulus validus civis cribro atavus thalassinus. Tepidus auditor blandior tumultus. Atqui cursim aufero cogito summa tres vesco.', 'light', 'text_nl'),
(33, 50, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/738.jpg', 'Torqueo creo canto strenuus aggredior ustilo aveho. Utpote tabula candidus repellendus attollo tremo temeritas. Odit charisma thermae vitae terminatio capitulus valde textilis.', 'light', 'text_nl'),
(34, 12, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/551.jpg', 'Acer acidus suasoria vomica tibi credo utroque concedo curvo curo. Atrocitas angulus vere atrocitas credo degero. Voluntarius capillus taedium tollo aliquid.', 'dark', 'text_fr'),
(35, 6, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/681.jpg', 'Tardus deprecator toties uterque consuasor officia. Depulso tersus curiositas maxime acer celo aegre nihil. Undique vulticulus nemo creber caritas.', 'dark', 'text_nl'),
(36, 32, 'https://avatars.githubusercontent.com/u/59804977', 'Ter pauci statim nemo umquam cultellus illo voco speculum. Culpo tollo confugo vilitas vulgivagus arbustum. Velut vulgo curtus demitto vallum.', 'light', 'text_nl'),
(37, 30, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1036.jpg', 'Incidunt tametsi strenuus. Confero thorax depopulo agnosco atavus calamitas ambulo laboriosam comes. Commodo theologus collum ad subiungo varius comitatus adiuvo.', 'light', 'text_nl'),
(38, 33, 'https://avatars.githubusercontent.com/u/65653786', 'Carpo quod sollicito vel. Templum tego abutor volva solus sapiente compono cribro vespillo. Adnuo suscipit deprecator sit attonbitus terror vallum defendo.', 'light', 'text_en'),
(39, 16, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/739.jpg', 'Nesciunt venia accommodo adamo coniuratio subiungo capillus delicate supra. Acidus defessus tantillus depraedor avaritia adamo una tabernus molestiae. Artificiose canis sto advoco somnus delectus.', 'light', 'text_en'),
(40, 38, 'https://avatars.githubusercontent.com/u/95949290', 'Adipisci ratione tenus ventito vigor. Vapulus omnis delibero aegrus subito audacia bene excepturi. Clementia fuga alii commemoro terra decerno tamen.', 'light', 'text_en'),
(41, 37, 'https://avatars.githubusercontent.com/u/81498577', 'Varietas damnatio ab. Tardus trepide verecundia caecus vero velut arbitro tollo arcus. Ago tabella infit tabula ubi.', 'light', 'text_nl'),
(42, 42, 'https://avatars.githubusercontent.com/u/44754040', 'Adiuvo civitas atqui non depono cupio facilis. Vos apparatus vito creta vester crustulum paulatim demitto acsi. Ara ullam vitiosus conventus adinventitias acsi.', 'light', 'text_en'),
(43, 40, 'https://avatars.githubusercontent.com/u/21443017', 'Curis auxilium curto supellex totus. Copia umbra carpo defaeco natus taceo. Tempus sumo acer adeo tenuis terminatio collum minus cuius.', 'light', 'text_fr'),
(44, 39, 'https://avatars.githubusercontent.com/u/50478003', 'Caput comis molestias apto aiunt colo peccatus deleo. Soluta apud cohibeo vulgo vulnero deduco derideo amo dolorem vapulus. Denego adnuo carmen brevis.', 'dark', 'text_nl'),
(45, 49, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/575.jpg', 'Angulus cariosus alo tenuis nulla antea bos cervus. Adversus varietas una tersus cubo valeo. Officia derelinquo voluptas speciosus animi.', 'light', 'text_fr'),
(46, 2, 'https://avatars.githubusercontent.com/u/74517801', 'Vulnus dolorem acer bibo. Civitas cenaculum vergo nihil vere ipsum quaerat cresco ceno tandem. Tabgo arma varius spectaculum asper magni calamitas sit strues.', 'dark', 'text_fr'),
(47, 35, 'https://avatars.githubusercontent.com/u/25923082', 'Crebro suasoria sed spoliatio. Celebrer auctor artificiose ulciscor corrigo cubitum dedico tandem. Capillus solio alo tabula.', 'dark', 'text_fr'),
(48, 22, 'https://avatars.githubusercontent.com/u/1860337', 'Villa tactus verto. Tubineus coniuratio coniecto acquiro temptatio. Cetera amor arceo.', 'dark', 'text_en'),
(49, 29, 'https://avatars.githubusercontent.com/u/68358263', 'Tepidus creo cur. Vestigium sursum argentum comburo adhaero articulus adhaero titulus. Deorsum cogo demo demitto curvo ager voluptatum.', 'dark', 'text_fr'),
(50, 19, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/167.jpg', 'Thymum argumentum deorsum territo nostrum aeger. Aeneus eos vinculum uredo uterque adnuo catena vilicus. Validus laudantium cometes reiciendis conforto acies decet eaque ulterius tantum.', 'light', 'text_en'),
(51, 51, 'https://avatars.githubusercontent.com/u/78645956', 'Testing Account', 'light', 'text_en'),
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
-- Gegevens worden geëxporteerd voor tabel `user_purchases`
--

INSERT INTO `user_purchases` (`id`, `timeOfPurchase`, `productId`, `price`, `productName`, `productImage`) VALUES
(48, '2023-10-15 00:00:00', 4, 94, 'Handmade Metal Towels', 'https://loremflickr.com/640/480?lock=7400815717253120'),
(24, '2023-10-16 00:00:00', 26, 426, 'Luxurious Rubber Chicken', 'https://loremflickr.com/640/480?lock=1651464910929920'),
(34, '2023-10-28 00:00:00', 25, 476, 'Incredible Cotton Chicken', 'https://loremflickr.com/640/480?lock=1598324983463936'),
(11, '2023-10-19 00:00:00', 43, 268, 'Luxurious Fresh Ball', 'https://picsum.photos/seed/AZ7oc/640/480'),
(44, '2023-10-25 00:00:00', 45, 165, 'Sleek Soft Chicken', 'https://loremflickr.com/640/480?lock=4573912203526144'),
(42, '2023-11-09 00:00:00', 32, 843, 'Intelligent Bronze Shoes', 'https://loremflickr.com/640/480?lock=7418988820692992'),
(35, '2023-10-24 00:00:00', 8, 972, 'Fantastic Concrete Chicken', 'https://loremflickr.com/640/480?lock=4969868862423040'),
(23, '2023-10-18 00:00:00', 38, 740, 'Sleek Cotton Chair', 'https://picsum.photos/seed/grpxpPEjph/640/480'),
(14, '2023-10-30 00:00:00', 43, 299, 'Refined Rubber Car', 'https://loremflickr.com/640/480?lock=4154029689012224'),
(30, '2023-10-28 00:00:00', 7, 423, 'Intelligent Fresh Chicken', 'https://loremflickr.com/640/480?lock=47650267201536'),
(17, '2023-10-31 00:00:00', 11, 980, 'Small Plastic Chair', 'https://picsum.photos/seed/1jG33CL/640/480'),
(46, '2023-11-02 00:00:00', 50, 645, 'Generic Wooden Salad', 'https://picsum.photos/seed/Yq1We2sTrv/640/480'),
(1, '2023-11-11 00:00:00', 46, 576, 'Fantastic Fresh Table', 'https://picsum.photos/seed/qTG68/640/480'),
(10, '2023-10-28 00:00:00', 42, 474, 'Practical Bronze Chicken', 'https://loremflickr.com/640/480?lock=7987262750982144'),
(36, '2023-10-31 00:00:00', 33, 659, 'Generic Metal Towels', 'https://loremflickr.com/640/480?lock=6944330572890112'),
(43, '2023-10-21 00:00:00', 15, 117, 'Modern Bronze Hat', 'https://picsum.photos/seed/TJorVH4/640/480'),
(23, '2023-11-03 00:00:00', 8, 259, 'Fantastic Steel Shoes', 'https://picsum.photos/seed/aYbPAhx/640/480'),
(38, '2023-11-01 00:00:00', 27, 432, 'Handmade Fresh Shoes', 'https://loremflickr.com/640/480?lock=625877874376704'),
(47, '2023-10-20 00:00:00', 12, 755, 'Rustic Fresh Computer', 'https://loremflickr.com/640/480?lock=1242013731127296'),
(27, '2023-11-01 00:00:00', 48, 904, 'Fantastic Plastic Shirt', 'https://loremflickr.com/640/480?lock=3569264690724864'),
(16, '2023-11-05 00:00:00', 18, 929, 'Oriental Fresh Bacon', 'https://loremflickr.com/640/480?lock=1375961557762048'),
(31, '2023-11-06 00:00:00', 19, 741, 'Incredible Soft Pants', 'https://picsum.photos/seed/aRpG6/640/480'),
(45, '2023-11-09 00:00:00', 38, 181, 'Gorgeous Fresh Ball', 'https://loremflickr.com/640/480?lock=3852811596988416'),
(15, '2023-10-20 00:00:00', 32, 130, 'Incredible Frozen Mouse', 'https://picsum.photos/seed/3B9Am/640/480'),
(22, '2023-11-04 00:00:00', 16, 135, 'Elegant Frozen Salad', 'https://picsum.photos/seed/6E1lGa7qZ/640/480'),
(46, '2023-10-31 00:00:00', 39, 996, 'Sleek Plastic Salad', 'https://picsum.photos/seed/EgSmBQtIeJ/640/480'),
(25, '2023-11-13 00:00:00', 37, 965, 'Bespoke Frozen Sausages', 'https://loremflickr.com/640/480?lock=7713894481002496'),
(31, '2023-10-27 00:00:00', 29, 238, 'Intelligent Frozen Car', 'https://loremflickr.com/640/480?lock=6320723349995520'),
(48, '2023-10-15 00:00:00', 34, 865, 'Generic Frozen Tuna', 'https://loremflickr.com/640/480?lock=508386344960000'),
(50, '2023-10-16 00:00:00', 1, 694, 'Rustic Metal Gloves', 'https://picsum.photos/seed/tfJZTyNLW2/640/480'),
(50, '2023-10-26 00:00:00', 5, 757, 'Awesome Rubber Table', 'https://picsum.photos/seed/fmK3D/640/480'),
(31, '2023-10-21 00:00:00', 36, 970, 'Handmade Bronze Hat', 'https://loremflickr.com/640/480?lock=3162830301822976'),
(38, '2023-11-11 00:00:00', 35, 790, 'Electronic Metal Salad', 'https://loremflickr.com/640/480?lock=5559542500818944'),
(10, '2023-10-28 00:00:00', 35, 94, 'Elegant Cotton Soap', 'https://loremflickr.com/640/480?lock=8688299633803264'),
(8, '2023-11-05 00:00:00', 14, 221, 'Fantastic Fresh Bacon', 'https://loremflickr.com/640/480?lock=1024657343905792'),
(33, '2023-10-21 00:00:00', 29, 914, 'Awesome Fresh Car', 'https://loremflickr.com/640/480?lock=3695362166489088'),
(3, '2023-11-08 00:00:00', 41, 556, 'Ergonomic Steel Salad', 'https://picsum.photos/seed/2njRmAnBba/640/480'),
(26, '2023-10-26 00:00:00', 26, 267, 'Refined Cotton Towels', 'https://loremflickr.com/640/480?lock=3903508359151616'),
(16, '2023-10-14 00:00:00', 48, 546, 'Small Steel Shoes', 'https://picsum.photos/seed/Esl23DG7/640/480'),
(6, '2023-11-03 00:00:00', 9, 850, 'Electronic Fresh Chips', 'https://loremflickr.com/640/480?lock=7293490102796288'),
(17, '2023-10-22 00:00:00', 48, 154, 'Practical Frozen Bike', 'https://picsum.photos/seed/tscC9jt/640/480'),
(6, '2023-10-15 00:00:00', 44, 477, 'Incredible Fresh Chair', 'https://loremflickr.com/640/480?lock=2963339577655296'),
(49, '2023-11-13 00:00:00', 35, 672, 'Licensed Bronze Pants', 'https://loremflickr.com/640/480?lock=496060870950912'),
(34, '2023-11-08 00:00:00', 11, 731, 'Intelligent Wooden Table', 'https://picsum.photos/seed/MsuZGE4eQ/640/480'),
(28, '2023-10-30 00:00:00', 15, 725, 'Intelligent Soft Car', 'https://loremflickr.com/640/480?lock=4221554424545280'),
(11, '2023-10-23 00:00:00', 50, 748, 'Fantastic Granite Towels', 'https://picsum.photos/seed/89SuVSgTE8/640/480'),
(9, '2023-11-09 00:00:00', 8, 263, 'Practical Cotton Towels', 'https://loremflickr.com/640/480?lock=4410057129197568'),
(4, '2023-11-05 00:00:00', 14, 662, 'Incredible Cotton Gloves', 'https://loremflickr.com/640/480?lock=8768506044612608'),
(45, '2023-11-05 00:00:00', 10, 612, 'Incredible Metal Bacon', 'https://loremflickr.com/640/480?lock=7091469043105792'),
(50, '2023-10-28 00:00:00', 34, 274, 'Small Cotton Fish', 'https://picsum.photos/seed/8bHCcrapA/640/480'),
(25, '2023-10-21 00:00:00', 19, 145, 'Oriental Bronze Keyboard', 'https://loremflickr.com/640/480?lock=1691423109808128'),
(7, '2023-10-14 00:00:00', 17, 837, 'Generic Concrete Shirt', 'https://picsum.photos/seed/n0eoROqI/640/480'),
(38, '2023-10-19 00:00:00', 42, 195, 'Handmade Steel Ball', 'https://loremflickr.com/640/480?lock=6071121086513152'),
(24, '2023-11-03 00:00:00', 47, 46, 'Small Plastic Towels', 'https://loremflickr.com/640/480?lock=5763404123865088'),
(38, '2023-10-22 00:00:00', 1, 11, 'Handmade Steel Chicken', 'https://picsum.photos/seed/ueAvma/640/480'),
(26, '2023-10-30 00:00:00', 2, 967, 'Handmade Frozen Gloves', 'https://loremflickr.com/640/480?lock=6894112768786432'),
(5, '2023-10-24 00:00:00', 17, 149, 'Licensed Metal Ball', 'https://picsum.photos/seed/3KSYqs/640/480'),
(11, '2023-11-03 00:00:00', 14, 934, 'Modern Frozen Pizza', 'https://loremflickr.com/640/480?lock=8251451816017920'),
(9, '2023-11-02 00:00:00', 1, 464, 'Intelligent Frozen Keyboard', 'https://loremflickr.com/640/480?lock=1858341133352960'),
(12, '2023-10-15 00:00:00', 49, 625, 'Intelligent Frozen Cheese', 'https://loremflickr.com/640/480?lock=8655092406288384'),
(22, '2023-10-16 00:00:00', 36, 846, 'Ergonomic Metal Cheese', 'https://picsum.photos/seed/XMli3eNqi/640/480'),
(28, '2023-10-19 00:00:00', 11, 722, 'Incredible Fresh Cheese', 'https://loremflickr.com/640/480?lock=1147127633805312'),
(16, '2023-10-25 00:00:00', 1, 628, 'Oriental Steel Bacon', 'https://picsum.photos/seed/aPHhY82jB/640/480'),
(27, '2023-11-07 00:00:00', 10, 209, 'Fantastic Fresh Keyboard', 'https://picsum.photos/seed/Od8f3lg/640/480'),
(21, '2023-10-17 00:00:00', 9, 720, 'Electronic Frozen Bike', 'https://picsum.photos/seed/vXHxMMt/640/480'),
(12, '2023-10-19 00:00:00', 10, 547, 'Modern Steel Salad', 'https://loremflickr.com/640/480?lock=3744430502707200'),
(9, '2023-10-27 00:00:00', 3, 876, 'Generic Rubber Bacon', 'https://loremflickr.com/640/480?lock=5276841172533248'),
(49, '2023-11-10 00:00:00', 7, 304, 'Luxurious Cotton Soap', 'https://loremflickr.com/640/480?lock=2552200626700288'),
(37, '2023-11-09 00:00:00', 38, 485, 'Ergonomic Fresh Keyboard', 'https://picsum.photos/seed/3QnrOG/640/480'),
(25, '2023-10-15 00:00:00', 49, 15, 'Fantastic Metal Salad', 'https://picsum.photos/seed/CqS0uy/640/480'),
(40, '2023-10-15 00:00:00', 47, 868, 'Recycled Cotton Gloves', 'https://loremflickr.com/640/480?lock=4924527148531712'),
(49, '2023-10-20 00:00:00', 38, 459, 'Incredible Cotton Sausages', 'https://picsum.photos/seed/ve7TDXXgAd/640/480'),
(13, '2023-10-31 00:00:00', 24, 231, 'Luxurious Frozen Tuna', 'https://picsum.photos/seed/WVXsqxAT/640/480'),
(23, '2023-10-17 00:00:00', 13, 241, 'Recycled Plastic Cheese', 'https://loremflickr.com/640/480?lock=4115022502428672'),
(49, '2023-10-17 00:00:00', 8, 553, 'Tasty Bronze Keyboard', 'https://loremflickr.com/640/480?lock=904169445654528'),
(17, '2023-11-12 00:00:00', 17, 575, 'Electronic Soft Car', 'https://loremflickr.com/640/480?lock=3030166848667648'),
(27, '2023-10-20 00:00:00', 42, 566, 'Licensed Soft Fish', 'https://loremflickr.com/640/480?lock=6879040099057664'),
(45, '2023-10-22 00:00:00', 21, 992, 'Incredible Soft Cheese', 'https://loremflickr.com/640/480?lock=8489147144601600'),
(2, '2023-10-21 00:00:00', 6, 952, 'Oriental Wooden Bacon', 'https://picsum.photos/seed/RhRp8Bjrt5/640/480'),
(41, '2023-11-03 00:00:00', 4, 609, 'Awesome Metal Pizza', 'https://picsum.photos/seed/GmuN0OF/640/480'),
(12, '2023-10-26 00:00:00', 1, 869, 'Oriental Rubber Towels', 'https://picsum.photos/seed/DLFjG/640/480'),
(24, '2023-11-12 00:00:00', 8, 730, 'Rustic Metal Keyboard', 'https://loremflickr.com/640/480?lock=2091312241180672'),
(32, '2023-10-25 00:00:00', 20, 160, 'Bespoke Bronze Shirt', 'https://loremflickr.com/640/480?lock=7040565082324992'),
(4, '2023-11-10 00:00:00', 48, 668, 'Small Wooden Pizza', 'https://loremflickr.com/640/480?lock=5102920578105344'),
(44, '2023-11-12 00:00:00', 28, 141, 'Handmade Metal Soap', 'https://picsum.photos/seed/APKRo/640/480'),
(12, '2023-11-04 00:00:00', 49, 178, 'Unbranded Plastic Keyboard', 'https://loremflickr.com/640/480?lock=2321004290375680'),
(6, '2023-10-30 00:00:00', 14, 490, 'Rustic Rubber Keyboard', 'https://picsum.photos/seed/p6jEfLP/640/480'),
(45, '2023-11-11 00:00:00', 33, 23, 'Licensed Bronze Chicken', 'https://loremflickr.com/640/480?lock=3814341304385536'),
(48, '2023-11-10 00:00:00', 3, 859, 'Bespoke Concrete Fish', 'https://picsum.photos/seed/EF51qN/640/480'),
(20, '2023-11-10 00:00:00', 41, 281, 'Small Wooden Bacon', 'https://picsum.photos/seed/mERF8QgdF/640/480'),
(15, '2023-10-22 00:00:00', 8, 154, 'Awesome Bronze Chicken', 'https://loremflickr.com/640/480?lock=6224964503994368'),
(33, '2023-10-26 00:00:00', 5, 197, 'Sleek Rubber Keyboard', 'https://picsum.photos/seed/iiJowiEWE/640/480'),
(17, '2023-11-12 00:00:00', 14, 149, 'Handmade Plastic Ball', 'https://picsum.photos/seed/gRDyO/640/480'),
(46, '2023-11-09 00:00:00', 45, 356, 'Ergonomic Rubber Chair', 'https://picsum.photos/seed/wLHAoAwv0/640/480'),
(23, '2023-10-17 00:00:00', 49, 473, 'Refined Granite Chicken', 'https://loremflickr.com/640/480?lock=1803245582286848'),
(18, '2023-11-09 00:00:00', 29, 380, 'Rustic Cotton Table', 'https://picsum.photos/seed/813ly1/640/480'),
(42, '2023-10-21 00:00:00', 29, 772, 'Ergonomic Granite Chair', 'https://loremflickr.com/640/480?lock=4633451823104'),
(7, '2023-10-25 00:00:00', 46, 292, 'Rustic Concrete Mouse', 'https://loremflickr.com/640/480?lock=6265751763681280'),
(20, '2023-10-14 00:00:00', 12, 675, 'Electronic Soft Chair', 'https://loremflickr.com/640/480?lock=812939548295168'),
(44, '2023-11-04 00:00:00', 10, 232, 'Handcrafted Soft Soap', 'https://picsum.photos/seed/7FXLn2/640/480'),
(51, '2023-11-04 01:57:57', 1, 671, 'Luxurious Rubber Chicken', 'https://picsum.photos/seed/jEj1E5/640/480');

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
-- Indexen voor tabel `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`msg_id`);

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
-- AUTO_INCREMENT voor een tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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

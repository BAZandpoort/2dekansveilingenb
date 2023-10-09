-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2023 at 01:22 PM
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
-- Database: `2dekans-veilingen`
--

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `bidPrice` decimal(18,2) NOT NULL,
  `bidOfferedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`id`, `productid`, `userid`, `bidPrice`, `bidOfferedAt`) VALUES
(1, 4, 2, 22.99, '2023-10-08 16:55:02'),
(3, 3, 5, 20.33, '2023-10-08 18:53:39'),
(4, 9, 51, 0.56, '2023-10-09 11:16:39'),
(5, 29, 51, 494.00, '2023-10-09 11:21:01');

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

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `userid`, `categoryid`, `name`, `description`, `price`, `imageUrl`, `updatedAt`, `createdAt`) VALUES
(1, 14, 13, 'Small Granite Hat', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 784.00, 'https://picsum.photos/seed/BLuZELAvR/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(2, 42, 9, 'Ergonomic Fresh Shoes', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 534.00, 'https://picsum.photos/seed/HPdYqbJ10/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(3, 9, 4, 'Modern Bronze Bike', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 765.00, 'https://picsum.photos/seed/O7AzfWFY08/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(4, 21, 6, 'Sleek Concrete Salad', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 238.00, 'https://picsum.photos/seed/mQssVg0x/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(5, 50, 5, 'Sleek Wooden Salad', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 336.00, 'https://picsum.photos/seed/9dpEmlE/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(6, 39, 16, 'Ergonomic Concrete Hat', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 689.00, 'https://picsum.photos/seed/JuTdO/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(7, 11, 7, 'Practical Cotton Bacon', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 483.00, 'https://picsum.photos/seed/U8MMhE2/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(8, 22, 8, 'Intelligent Cotton Tuna', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 865.00, 'https://picsum.photos/seed/9nD88tN/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(9, 3, 11, 'Licensed Cotton Mouse', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 709.00, 'https://picsum.photos/seed/eA9Vd/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(10, 34, 11, 'Small Steel Car', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 458.00, 'https://picsum.photos/seed/ldYWEqoIIv/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(11, 18, 21, 'Handcrafted Rubber Shoes', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 45.00, 'https://picsum.photos/seed/9rvZG97W0j/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(12, 5, 2, 'Handcrafted Frozen Gloves', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 834.00, 'https://picsum.photos/seed/WhrXv1uhA/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(13, 10, 7, 'Recycled Fresh Sausages', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 525.00, 'https://picsum.photos/seed/7Nmkj/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(14, 30, 10, 'Refined Concrete Fish', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 333.00, 'https://picsum.photos/seed/ajcK4/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(15, 27, 1, 'Recycled Steel Ball', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 381.00, 'https://picsum.photos/seed/AfcZOp/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(16, 45, 17, 'Handcrafted Wooden Gloves', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 741.00, 'https://picsum.photos/seed/WkF6Y2/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(17, 8, 20, 'Tasty Plastic Pizza', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 277.00, 'https://picsum.photos/seed/QQpN4AQmq/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(18, 43, 20, 'Fantastic Frozen Computer', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 587.00, 'https://picsum.photos/seed/Y8rfLDB/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(19, 44, 6, 'Sleek Steel Hat', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 538.00, 'https://picsum.photos/seed/3yYAx/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(20, 32, 21, 'Recycled Bronze Tuna', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 511.00, 'https://picsum.photos/seed/I3OD80/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(21, 23, 10, 'Practical Cotton Soap', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 813.00, 'https://picsum.photos/seed/HMbhJF9EPI/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(22, 33, 14, 'Oriental Bronze Pizza', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 491.00, 'https://picsum.photos/seed/TYmjY/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(23, 24, 16, 'Handmade Wooden Pizza', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 785.00, 'https://picsum.photos/seed/6txJqvAd/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(24, 17, 19, 'Electronic Cotton Salad', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 17.00, 'https://picsum.photos/seed/SWBnwg/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(25, 40, 18, 'Bespoke Wooden Pizza', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 875.00, 'https://picsum.photos/seed/zSxcOnienO/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(26, 49, 15, 'Handmade Frozen Tuna', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 885.00, 'https://picsum.photos/seed/s6rzuRW/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(27, 16, 1, 'Sleek Rubber Sausages', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 112.00, 'https://picsum.photos/seed/zJ3YTUe/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(28, 25, 1, 'Licensed Wooden Shoes', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 745.00, 'https://picsum.photos/seed/QJVUirQslK/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(29, 38, 11, 'Ergonomic Fresh Ball', 'The Football Is Good For Training And Recreational Purposes', 437.00, 'https://picsum.photos/seed/BwD0dIzm/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(30, 41, 18, 'Electronic Soft Shoes', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 540.00, 'https://picsum.photos/seed/c8LR3Xc/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(31, 4, 21, 'Intelligent Cotton Car', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 375.00, 'https://picsum.photos/seed/Geormq/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(32, 12, 20, 'Small Steel Chips', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 876.00, 'https://picsum.photos/seed/2CXKCStw/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(33, 19, 1, 'Licensed Rubber Pants', 'The Football Is Good For Training And Recreational Purposes', 612.00, 'https://picsum.photos/seed/WEWlWh/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(34, 26, 11, 'Luxurious Metal Bacon', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 881.00, 'https://picsum.photos/seed/KhzXB/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(35, 47, 22, 'Licensed Frozen Cheese', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 909.00, 'https://picsum.photos/seed/zYlUIZ/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(36, 6, 14, 'Tasty Wooden Car', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 144.00, 'https://picsum.photos/seed/t1t2zZJmU/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(37, 2, 16, 'Generic Metal Tuna', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 456.00, 'https://picsum.photos/seed/wKcLr2K/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(38, 20, 5, 'Luxurious Bronze Chicken', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 966.00, 'https://picsum.photos/seed/AgkOUID/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(39, 13, 15, 'Ergonomic Frozen Keyboard', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 354.00, 'https://picsum.photos/seed/Zq0jebw/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(40, 35, 12, 'Handcrafted Fresh Computer', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 561.00, 'https://picsum.photos/seed/l4syOcdbH/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(41, 15, 3, 'Fantastic Steel Fish', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 533.00, 'https://picsum.photos/seed/sRckntr1dw/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(42, 46, 16, 'Fantastic Steel Bike', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 527.00, 'https://picsum.photos/seed/4JUNT/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(43, 36, 15, 'Refined Granite Chair', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 977.00, 'https://picsum.photos/seed/ikfvizPaP/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(44, 7, 14, 'Rustic Fresh Bike', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 62.00, 'https://picsum.photos/seed/gPYxlQuP/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(45, 37, 9, 'Refined Cotton Salad', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 900.00, 'https://picsum.photos/seed/zmOUs/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(46, 29, 5, 'Small Fresh Ball', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 835.00, 'https://picsum.photos/seed/Ui3kepTT5/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(47, 1, 5, 'Refined Wooden Car', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 298.00, 'https://picsum.photos/seed/WquZx/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(48, 31, 11, 'Oriental Fresh Cheese', 'The Football Is Good For Training And Recreational Purposes', 809.00, 'https://picsum.photos/seed/1P0xmt/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(49, 28, 22, 'Gorgeous Cotton Chair', 'The Football Is Good For Training And Recreational Purposes', 863.00, 'https://picsum.photos/seed/qlrnfQKkd/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(50, 48, 15, 'Licensed Granite Computer', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 676.00, 'https://picsum.photos/seed/Sr5dp5G/640/480', '2023-10-08 16:22:55', '2023-10-08 16:22:55');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
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
(1, 'Home', ''),
(2, 'Kids', ''),
(3, 'Computers', ''),
(4, 'Clothing', ''),
(5, 'Automotive', ''),
(6, 'Outdoors', ''),
(7, 'Grocery', ''),
(8, 'Health', ''),
(9, 'Jewelery', ''),
(10, 'Tools', ''),
(11, 'Toys', ''),
(12, 'Music', ''),
(13, 'Books', ''),
(14, 'Industrial', ''),
(15, 'Electronics', ''),
(16, 'Sports', ''),
(17, 'Movies', ''),
(18, 'Baby', ''),
(19, 'Games', ''),
(20, 'Beauty', ''),
(21, 'Shoes', ''),
(22, 'Garden', '');

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

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `firstname`, `lastname`, `updatedAt`, `createdAt`) VALUES
(1, 'Delaney.Marvin', 'Randy_Pagac-Rowe@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$CRLqs4Giz+mGtRpl6HrSdg$feXFoRftxqtw32tgXSVf1SJsmMVsm2u9a00JA6MPvXk', 'Rhiannon', 'Wintheiser', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(2, 'Floy.Cartwright45', 'Ignacio_Little-Batz@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$LPndJZSykPesEH9kVsUcSw$v6ywm7dNLDzMOO+wFe/Nsqgej+etCJOGg50ZI+7WvFs', 'Selena', 'Raynor', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(3, 'Levi4', 'Stella_Streich85@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$NO6BgIHKwBHvvPR6C7FFkw$J/+tpg5hgNb4h7D1dvbgUeAdrbsqqiAjMJUYPOFHj8I', 'Margaretta', 'Ondricka', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(4, 'Claudine.Goldner41', 'Herminia_Hackett@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$JloZ59zgRZGfwTRGovOH0Q$+AetxocNZ47Ta5P0D5ZLScvgcbaXspraXH7IfakKeMA', 'Toni', 'Kuhic', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(5, 'Enrico81', 'Piper.OConnell@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$2687H3CFpHkDJV+ch0bbkQ$8Lqu9XP7/OA/AZSphT8a6XwWZxD8RrL1LgCOlgQpmYI', 'Bessie', 'Lockman', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(6, 'Earline_Dooley', 'Tyler89@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$1XU6NosIbwOKvvxoIafIYw$sw1G64aM8+Te5pJcrZ8+Enrk9tc5x+8rxIVIH6jl5qA', 'Astrid', 'Conn', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(7, 'Terrell55', 'Naomie.Schoen4@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$ikHeVSc2/5AGeEohLTMssg$8kxsUDJfzvXjk7i0Acfw9/3G6a4/fiwd2L3C2RuMd5s', 'Lucy', 'Farrell', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(8, 'Nicklaus73', 'Seth.Wilderman94@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$BSyw9Ni39R7noQaxEpry9g$7UqdVE4eGqzAs2OFoJEHQ4cv8FBSWQ4Dv3qy0VIbRco', 'Noemie', 'Ward', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(9, 'Minnie43', 'Lucienne28@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$0L7BBXLetPP1Ro/45sXA8w$tG+/y2QwwZQNRVY7CxIYKxYluYM9b3rxAkXLzpJ4VE8', 'Collin', 'Renner', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(10, 'Ramiro_Anderson77', 'Hollie9@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$gqihQBh45ciFSivHg+CR7w$QSP1u7kapr+m01gVEtHbRl6LSD9UYxHpWXdUW/l8xZU', 'Laverne', 'Brown', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(11, 'Baron58', 'Palma_Roberts0@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$1/noUTY5EznNMHtojaU/Ew$W2RHjevijaxwW1200DJEwfkfafq91A+D8FH3d9F7JkY', 'Blake', 'Parisian', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(12, 'Lawrence.Gibson', 'Berta.Reichert-Robel23@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$ZWWiWXBnkXcDOe9CQcQvaw$MwvKsDCiR8bTLxmgUDfYwsgWzL7XzTHfmxX5jgmCO+Y', 'Theron', 'Muller', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(13, 'Marcia16', 'Kaci39@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$xDrai6yDSGNpzGv7HmRjwQ$apl9yFViA3EQISul1K/L4XBFVTBPj5mTUvb4T0wPs+0', 'Oscar', 'Skiles', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(14, 'Tomasa.Dach31', 'Mertie.Bruen6@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$3V+VQxdzgTL0Et80qDlmaQ$CIOY7kHDdgvBi09meICk/T9+ohqfdzpQKMq66s5cYEk', 'Gregg', 'Lowe', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(15, 'Domenick69', 'Earnestine.Cruickshank@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$bi2n6ZW4wX1z5LDRO1mw3A$AbwbWFd9VyRHEHZ/OSdqS+yR/soKaH+OQVRcyr5YTEs', 'Finn', 'Douglas', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(16, 'Vergie.Anderson82', 'Elwyn.Bogan@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$FEKtWhKCOGcam0s8bO/Rvg$aPiNEIDFQGO/M5YEvlk5r8o3Jeyg/cG39TbiMoltOd4', 'Katharina', 'Veum', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(17, 'Ernestine.Farrell', 'Thomas.Hickle78@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$GieTXSFb07SngUMzXT1VhA$G09CWajXJZuQ2WyEC/mwjKmQHVuRcG0vqaBsAZRictU', 'Antwan', 'Wolf-Rowe', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(18, 'Teagan.Prosacco38', 'Max19@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$JhDWwL6ef8N+A/LmJMTjGg$Myy6lqTiKhp6Lxp/wuS3vXO10IQ2nQERnbJYB83TJTQ', 'Lee', 'Rau', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(19, 'Karlee_Wilderman73', 'Larry.Hahn@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$4r9ogpnkH2NwwoC34Ews2Q$87DjJAxczqbvvDeCxJYvnpoG/K2nkr9Gl9txS8793nM', 'Elmira', 'Moen', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(20, 'Leola.Fisher', 'Maudie_MacGyver@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$m4dJoq3U7LVjn13Y3IMZJA$5q9NqLdcAt89E54PPzcnJGkMS0DN9tdLPaWo5BeIbDw', 'Bruce', 'Walsh-Reynolds', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(21, 'Autumn_Rempel56', 'Rickey_Kautzer72@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$r5cvf/QLzZvy5D4fxvUgCw$nQeBorkkOEZbX6yhgeeN7PuimavEBQLNJls7jXZbAJk', 'Arely', 'Jacobs', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(22, 'Reuben_Fadel', 'Skye.Satterfield@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$3za9KIFntkwxtrPCj+6V2g$XMdvB7qU1XE1KGhxz9xwPICHQIdZbWS1XE72LqpDlnM', 'Jaycee', 'Paucek', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(23, 'Marvin.Kautzer95', 'Sienna96@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$a5hh+/fXoVC4V9LiYql3hA$bZHtjQf4AQv+zcLQ3wbp+W81M8Yy63OSynPVlUxj8gU', 'Roselyn', 'Brekke', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(24, 'Helena17', 'Yazmin.Purdy@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$s9NpnHLSJa0Wr31jOpD/XQ$HVKmzaTtyA7VgoStrxTLYXdIUXeM7sIN1uyyMR1o0aQ', 'Katelynn', 'Wuckert', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(25, 'Waylon25', 'Tad.Dach@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$BaPjTFGPi+0/yKdlIUMu0A$mR4w/UtEBdufD2A3oPwM346cUJdYoFLEw7HZ/afCo0E', 'Janis', 'Krajcik', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(26, 'Orpha24', 'Clarabelle_Stokes18@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$qN6zWpEN8Zwcl5oAkhXZcg$hBhZ0DrbFNU3B/So+AgWFWzoj6sWrRwmaNmgWg2R1DU', 'Mohammad', 'Boyer', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(27, 'Vella12', 'Jakayla58@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$isNuTyDaNkqmrV+pkwudBQ$LtG/5XBsB0jFGf/Ag8NUThpUx3OgdRHFhlOB/SdVZ7A', 'Oleta', 'Heaney', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(28, 'Alycia89', 'Leopold_Labadie@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$vguJzhFsvb5u0lKMZgCclg$o79Pdg8zwTy4ZeTL572wy1RRxD3kggcV85nCKMEWxpY', 'Ofelia', 'Trantow', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(29, 'Columbus9', 'Garfield_Weimann@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$+oJRKYxP9VoC3gbFjuMU6w$7GTwBdYTxPIHnIQ4z0QH8Z/OeP1VaLFwxAoqLk0DktM', 'Jerad', 'Greenfelder', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(30, 'Rosalinda1', 'Fredy.Kertzmann48@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$4nX9S5YlZWWv5RxzyICpwg$7kBnNptej9/xgVwg1YgwvzCWmcf1yfUcxD6DpkCwo/E', 'Maiya', 'Treutel', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(31, 'Marcel_Stiedemann87', 'Eileen43@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$EeOQUuDyT9ayArXrbxiFng$iNvJ74wgqdYd3pVkTiMDCyjlYzMX1WwOTqH2FeeIqU0', 'Brannon', 'Hammes', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(32, 'Katelyn_Borer72', 'Bethany.Crooks56@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$i83YPhSxVe5/PDFSTnDTDQ$7QdW6gTS1XJMnmCO4esWDxcXGxjVr/wzias0ojQK6Hk', 'Athena', 'Mayert', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(33, 'Destiny7', 'Kaitlin.Stroman@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$xNynEr5/qaXnWeASpJBhKw$qR91TrCAYJENahM68HEcTIk9GrbYOli2ku+aOKhVCjo', 'Anastasia', 'Sanford', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(34, 'Daisy.Marks66', 'Art7@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$wE829fzBRPIQS79Ltm8D6A$hE0erFnn4AwRCzZ1jGfxywfxSeosbMEYXzLcowiaG3g', 'Lourdes', 'Douglas', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(35, 'Elise.Dickens92', 'Bianka54@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$pCw7myW3B7eI/PCFsg/W9w$r9MSSkWBw7k4l1AOlf8BW6VwROZkp+DtDA7DmVi+JRE', 'Maurice', 'Kerluke', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(36, 'Niko_Schuster41', 'Dallas18@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$GyBMEfekiZuLETnIcrRVYA$OkaEi40hlFTD2FEaghIDGchxZ3vS8nT8FJYaoJDsuDc', 'Tommie', 'Bayer', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(37, 'Julian.Wiegand82', 'Unique_Dickinson62@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$hDqZjiOtEvIWHwizdeRZaw$rwjkj9RE/IQB1HCsdK2mSf8N79siwqkcQ58MTER0e3Q', 'Keira', 'Goldner', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(38, 'Jake29', 'Marcelina_Upton-Auer@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$gjARqf6eq2omhT3/6+8BCQ$80S3fwRxxxn4iODhodx1UlDypOibUrPyOxHCj4gFuag', 'Finn', 'Goldner', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(39, 'Rebecca8', 'Richard25@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$3ZD4WmSFzFyiVwHhBtQkKQ$GXV5GjKixxuhR/JhTG2wbsMKs7oFK7Al+HKnCSC6jeA', 'Asha', 'Ryan', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(40, 'Vella.Johnston', 'Raoul_Wyman60@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$8kl+0UKUCtZDrhwqClQKSw$hbwrALktg2sB2caPPO/T6DwFQduiW/s5QrvHD93QiVs', 'Cruz', 'Bogan', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(41, 'Elisa.Mayert', 'Virginie27@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$/K9Z8WMxrnvbEmCiiNPw1Q$/QDR07FDDoqB8gCAasWQdd4OZIh5bPZa2qZZ1EZaq/I', 'Anissa', 'Gleason-Buckridge', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(42, 'Queenie.Hills-Bahringer8', 'Jane37@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$G7zdtF7SDNqIMO1jwwXOWg$s8K7SKhy8fh4UxLHGuM4qT2NdBREw89+uVi3pK2HJJk', 'Monique', 'Schowalter', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(43, 'Presley.Kautzer39', 'Danielle.Ernser65@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$+9lqMyYoo3h38hIoBrQGmw$eWxToG+CDurQGnkkRk09taJ+wWuCJpaUaBn9/KIBa/8', 'Dameon', 'Witting', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(44, 'Wilburn23', 'Destiny_Bechtelar33@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$j4H4+AZ+Vyv91vl5FDkQlA$xHCaMR7cbmsvRQbnqrOxgcZQW675aGW/u6CnSIaBNh0', 'Baby', 'Ruecker', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(45, 'Clint.Langosh', 'Frida22@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$FOq6706xEudkSclxnQRB5Q$CWZKqVi6dfYFLShaUpJFmE7xID9zs5KhQ6MKpF8PgYU', 'Marietta', 'Keeling', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(46, 'Allie_Barton', 'Garret_Dach@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$RyxexURGlfBzcY7ebACXkQ$YQVclVRZyJUqkOTnf4dek869/vAEytPZANfLk+CGLhg', 'Carroll', 'Brekke', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(47, 'Reginald44', 'Eddie38@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$vshJA9bnpHJSiauma9FvKQ$P7u9/gemvb/ITNptRTrzN4yt8P8G2qRtHh42CzBfRaM', 'Samanta', 'Mayert', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(48, 'Gisselle.Runolfsson', 'Danny.Torp@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$5p7Zc3uiSiWmZR7NjlojLw$w1WX/yjWH8GZsVNd+z0lj39GyZlxTadhcf9d0tuZBME', 'Arely', 'Goyette', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(49, 'Louvenia14', 'Destiny_Abbott-Schultz@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$elYU+ThXaZbHUuX/0gGzRA$j6Cp7IrQax7D77/z2RCioB0JA6EiDBqzO6lJBrXM6CE', 'Cleve', 'Kemmer-Hackett', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(50, 'Lea.Fadel', 'Trevor88@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$FajKJMuPii6HlB16TDUlIg$3zIJbHvbaGzx633yect2cxavtHYlvQfAANNa55Bu/aA', 'Dallin', 'Willms', '2023-10-08 16:22:55', '2023-10-08 16:22:55'),
(51, 'Eeer', 'jon@bbeh.be', '$argon2id$v=19$m=65536,t=4,p=1$QUFPRlFGQ1IxejAycVhvNg$s+Pxca257kyqgNOHhupiHfSjj/eb5z037ThRsWS3/s4', 'JOhn', 'bbebs', '2023-10-08 18:37:31', '2023-10-08 18:37:31');

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
  `language` text NOT NULL DEFAULT 'text_en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`id`, `userid`, `profilePictureUrl`, `about`, `theme`, `language`) VALUES
(1, 10, 'https://avatars.githubusercontent.com/u/3176873', 'Cibo claudeo tumultus textilis in tam. Terror repellat varietas curso. Viriliter aestus spero approbo tego delectatio.', 'dark', 'text_en'),
(2, 18, 'https://avatars.githubusercontent.com/u/59977945', 'Vivo sto ventosus statim adulatio sperno aestivus tyrannus aestas sumptus. Correptius curis paulatim pariatur cresco. Surgo cupressus adduco attero antiquus adopto.', 'dark', 'text_en'),
(3, 45, 'https://avatars.githubusercontent.com/u/61842357', 'Aiunt voluntarius amplitudo tempore degusto attero adulatio tamquam sint tres. Auditor perspiciatis versus uter callide abutor vilicus altus expedita vigor. Bos vindico comminor caritas coadunatio teneo tredecim arcesso pecco.', 'dark', 'text_en'),
(4, 11, 'https://avatars.githubusercontent.com/u/56656501', 'Cado ars modi. Angustus comes ulterius deprimo tandem carmen ad cui beatae. Usque cruentus vomica sophismata sulum.', 'light', 'text_en'),
(5, 32, 'https://avatars.githubusercontent.com/u/85562387', 'Adopto pecto sursum. Ubi corrigo sed teres demergo suscipit vae. Adulescens deleniti cribro eveniet colligo sperno cresco admoveo capitulus.', 'light', 'text_en'),
(6, 6, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/944.jpg', 'Denuo animus tero vacuus amissio. Tibi corporis subito arbitro. Tabernus ter tepidus aegrus velum bestia caelum adinventitias illo.', 'dark', 'text_en'),
(7, 16, 'https://avatars.githubusercontent.com/u/19323159', 'Acer sint termes bos antepono. Tepidus harum vicinus temperantia earum beatae. Catena sed capitulus confido calamitas tribuo utor.', 'light', 'text_en'),
(8, 42, 'https://avatars.githubusercontent.com/u/45463991', 'Sperno defaeco tot viriliter adaugeo thalassinus vinculum vitae conventus. Audentia qui amplexus viriliter comes defaeco. Dedico magni carus peior abduco anser tabella anser votum.', 'dark', 'text_en'),
(9, 33, 'https://avatars.githubusercontent.com/u/8364438', 'Cariosus terra balbus ventus denique voluptates amoveo. Coadunatio usus acsi certus acervus clamo votum dedico bis ustilo. Alveus chirographum impedit videlicet soleo porro xiphias aeternus conscendo vergo.', 'light', 'text_en'),
(10, 22, 'https://avatars.githubusercontent.com/u/17397512', 'Totidem theatrum deprimo campana. Angulus commodo talio solium cohors. Attero aureus trucido.', 'light', 'text_en'),
(11, 29, 'https://avatars.githubusercontent.com/u/44445363', 'Totidem venia tandem angulus audacia tabesco cubitum unus. Fugit trado tardus. Suscipit virtus tego.', 'dark', 'text_en'),
(12, 12, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/73.jpg', 'Caste cunctatio voluptatum. Varius conculco magnam cubitum officia undique thalassinus decumbo tamquam. Beatus antiquus defluo.', 'light', 'text_en'),
(13, 20, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1096.jpg', 'Repellat crastinus defendo coniuratio cavus distinctio deprimo uterque. Pecco volo colo aeternus. Virga cauda caput aut sufficio conculco synagoga caveo beatae compono.', 'dark', 'text_en'),
(14, 46, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/997.jpg', 'Baiulus cohibeo cruciamentum. Tumultus demulceo tonsor uter adamo adipiscor umerus dolore. Vos credo tripudio censura varius vulticulus.', 'light', 'text_en'),
(15, 17, 'https://avatars.githubusercontent.com/u/42740119', 'Verto ustulo amoveo modi dens. Ver tam vitium. Nemo compono delinquo vox caute desidero victoria absens vinitor.', 'light', 'text_en'),
(16, 3, 'https://avatars.githubusercontent.com/u/86842919', 'Vulgaris vulpes ceno tunc quisquam. Assumenda tamdiu templum tempus adhuc adstringo odit vulpes delectatio. Sortitus decimus timidus ver.', 'light', 'text_en'),
(17, 14, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1007.jpg', 'Theca tempore capillus aeternus aequus cunctatio nobis creator surculus. Demergo tubineus rem cilicium. Ea tactus laboriosam coadunatio harum coadunatio despecto odio ultra.', 'light', 'text_en'),
(18, 7, 'https://avatars.githubusercontent.com/u/53210464', 'Ulterius adinventitias venia excepturi. Usitas anser vester damnatio cedo statua illo vilicus curto defero. Cado vinco aro causa antea.', 'light', 'text_en'),
(19, 39, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/974.jpg', 'Vulnero adsidue defendo circumvenio explicabo adamo quod votum atrox corporis. Amitto in cupiditas abutor aedificium torrens crudelis. Culpa corona vita thesaurus ulterius delicate clementia cui.', 'light', 'text_en'),
(20, 37, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1243.jpg', 'Thermae vehemens asper. Patrocinor patrocinor bis argumentum cresco capto angulus curatio statua curvo. Demens audacia cubicularis acceptus ratione.', 'light', 'text_en'),
(21, 35, 'https://avatars.githubusercontent.com/u/95207486', 'Tam cerno compello ait suus quisquam angustus surgo tolero victoria. Acsi eum terminatio tenetur. Deludo magnam cunctatio terra succurro cado somniculosus tardus.', 'dark', 'text_en'),
(22, 38, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/439.jpg', 'Curia maxime veritatis derelinquo bardus. Cimentarius absum testimonium pauper catena conicio voco studio. Derideo aliqua impedit antepono thesaurus casus.', 'light', 'text_en'),
(23, 31, 'https://avatars.githubusercontent.com/u/321934', 'Tergum amplitudo hic temperantia theatrum. Nobis voro collum suggero. Compono aspicio dedico fugit delego timidus.', 'dark', 'text_en'),
(24, 1, 'https://avatars.githubusercontent.com/u/20587582', 'Veritas tripudio cimentarius tolero angulus vergo theatrum. Ancilla dignissimos viscus sub cras accusantium cognomen. Videlicet amiculum cursim amet autem tero eos.', 'light', 'text_nl'),
(25, 41, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/982.jpg', 'Versus culpa accommodo cornu tondeo. Vindico peccatus cotidie deficio placeat traho adnuo tertius clibanus eius. Decerno capto carcer carmen verbera beatae sumo carbo aequus.', 'dark', 'text_en'),
(26, 34, 'https://avatars.githubusercontent.com/u/31289607', 'Currus titulus dedecor uberrime timor iste pariatur. Talio vae comedo aurum depraedor tenuis ante conturbo assentator amplexus. Creator adulescens communis ulciscor carbo culpo.', 'light', 'text_en'),
(27, 25, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/186.jpg', 'Stella conservo casus paulatim vesco. Barba subnecto tenetur quisquam. Curo super spiculum territo aiunt.', 'dark', 'text_en'),
(28, 21, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/680.jpg', 'Appello deficio decumbo deprecator. Temptatio auditor theologus vinum. Aufero tricesimus capio stella incidunt clementia somniculosus solus unus.', 'light', 'text_en'),
(29, 26, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/643.jpg', 'Quaerat at defungo volaticus sequi pecco. Hic aliqua eum benigne carmen solio cunctatio ea demoror celer. Averto libero attero compello summisse pectus.', 'light', 'text_en'),
(30, 9, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/769.jpg', 'Infit thymbra acquiro facere textor abeo stipes absens conforto. Asper condico cernuus cometes eos canis coniecto. Virgo antepono claustrum calculus copiose paens apto.', 'light', 'text_en'),
(31, 8, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/34.jpg', 'Crepusculum barba casso valde tolero umerus ubi correptius. Suadeo consectetur corrumpo comes. Defetiscor ciminatio deorsum cubo tracto incidunt maiores temperantia strenuus ambitus.', 'light', 'text_en'),
(32, 5, 'https://avatars.githubusercontent.com/u/49502765', 'Tactus ipsum cupressus complectus autem. Ea quasi custodia videlicet cometes abstergo valetudo asperiores benigne temptatio. Deprimo caritas vis decumbo valetudo aliqua ullus autem decipio id.', 'dark', 'text_en'),
(33, 15, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1022.jpg', 'Trado praesentium totidem occaecati creator. Consectetur aeternus audacia vivo conicio adficio sed crudelis vitium. Patruus tondeo venustas vinitor tergeo bis taedium terebro attollo.', 'light', 'text_en'),
(34, 44, 'https://avatars.githubusercontent.com/u/19898379', 'Bibo celo cohaero administratio textilis. Maiores minus adulatio aro tamdiu deorsum asper ipsam nobis. Aer sol eaque sopor ustilo creator confido xiphias textilis.', 'dark', 'text_en'),
(35, 28, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/617.jpg', 'Cattus vaco pauper. Tum amplus uxor defessus hic illo sursum. Facere arma et.', 'light', 'text_en'),
(36, 24, 'https://avatars.githubusercontent.com/u/13199962', 'Celo pax summa eligendi repellat color. Accusator bene deleniti vaco nulla umquam earum aestus. Demulceo ventito solvo laboriosam.', 'dark', 'text_en'),
(37, 2, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/324.jpg', 'Damnatio defluo solvo uter terreo tamdiu conscendo qui. Solus urbs basium coepi tergeo tertius timidus excepturi victus sub. Coadunatio xiphias decens cernuus textor pariatur apostolus cubo cado tumultus.', 'dark', 'text_en'),
(38, 50, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/559.jpg', 'Omnis tardus fugit. Vetus terreo vulariter crudelis curiositas tam denego. Cibus coerceo copiose caveo tamen cibus.', 'light', 'text_en'),
(39, 13, 'https://avatars.githubusercontent.com/u/32240793', 'Solum thymum subnecto usque curtus cervus vaco stabilis odio. Fuga compello texo expedita sapiente agnosco thesaurus cornu. Placeat admoveo molestiae coepi crepusculum.', 'dark', 'text_en'),
(40, 49, 'https://avatars.githubusercontent.com/u/38087386', 'Arx stella teres nulla. Astrum trepide sponte. Coepi arca votum despecto cresco maxime repellat aut victoria.', 'light', 'text_en'),
(41, 23, 'https://avatars.githubusercontent.com/u/35832178', 'Aliqua spiculum alioqui ante textor quae. Ocer patrocinor aer traho cruciamentum demens tricesimus tenus synagoga. Expedita trado surculus clibanus compello.', 'dark', 'text_en'),
(42, 30, 'https://avatars.githubusercontent.com/u/23198612', 'Nobis decet velut laboriosam audacia colo coaegresco audentia. Tener cornu adversus. Alii pel alii adimpleo acer.', 'light', 'text_en'),
(43, 27, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/146.jpg', 'Auctus tandem curto cultellus. Decor dignissimos cupiditate cras amo pectus. Textilis cena umerus.', 'light', 'text_en'),
(44, 43, 'https://avatars.githubusercontent.com/u/61152120', 'Sopor ventosus talus truculenter thesaurus aureus maxime. Constans solvo adipisci compello vis cattus statim sed. Animus distinctio alias peior somniculosus.', 'light', 'text_en'),
(45, 40, 'https://avatars.githubusercontent.com/u/42768796', 'Vulgus cibo solio adulescens enim. Acquiro conatus argentum considero decet sapiente crebro. Convoco anser ulterius aut error canto amet corroboro clam caute.', 'dark', 'text_en'),
(46, 48, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/727.jpg', 'Statim consequuntur desolo voluptatum adamo varietas. Et quis copia tabernus ducimus ipsum avaritia tero combibo. A vesco averto calcar suffoco sollers aeneus.', 'dark', 'text_en'),
(47, 47, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1167.jpg', 'Dolorem aspicio unus casso cupio cetera natus cui. Comminor alius amor. Amaritudo quaerat urbs ait stips.', 'light', 'text_en'),
(48, 19, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/231.jpg', 'Aduro teres tenetur complectus stips verecundia uter alienus quam turpis. Damnatio sol dignissimos conatus timidus testimonium ad confido dedico ocer. Aestas theca valetudo tam alo dedico.', 'light', 'text_en'),
(49, 4, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/576.jpg', 'Tamen uterque substantia vulariter ultra apud patior auxilium aetas magnam. Cubicularis unde cetera desidero. Solum molestias sum advenio debilito coadunatio vitium.', 'dark', 'text_en'),
(50, 36, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1202.jpg', 'Minus dedecor cohors suppellex absum sulum ara virtus. Ut video comminor aperiam temptatio. Tabella comminor censura.', 'light', 'text_en'),
(51, 51, 'https://avatars.githubusercontent.com/u/64209400?v=4', 'Hello!', 'light', 'text_nl');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
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
-- Table structure for table `user_role_mapping`
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
(1, 42, 3),
(2, 15, 3),
(3, 21, 3),
(4, 50, 2),
(5, 38, 3),
(6, 31, 1),
(7, 24, 3),
(8, 47, 3),
(9, 17, 1),
(10, 27, 1),
(11, 8, 3),
(12, 49, 1),
(13, 26, 3),
(14, 10, 1),
(15, 4, 3),
(16, 32, 2),
(17, 19, 3),
(18, 13, 1),
(19, 3, 3),
(20, 11, 1),
(21, 40, 1),
(22, 37, 1),
(23, 36, 2),
(24, 16, 3),
(25, 2, 3),
(26, 9, 2),
(27, 34, 1),
(28, 12, 2),
(29, 33, 3),
(30, 44, 3),
(31, 39, 3),
(32, 41, 2),
(33, 35, 1),
(34, 22, 2),
(35, 30, 2),
(36, 29, 3),
(37, 25, 1),
(38, 6, 2),
(39, 20, 3),
(40, 18, 2),
(41, 5, 1),
(42, 23, 2),
(43, 48, 2),
(44, 28, 3),
(45, 46, 3),
(46, 45, 2),
(47, 14, 2),
(48, 1, 3),
(49, 43, 2),
(50, 7, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_role_mapping`
--
ALTER TABLE `user_role_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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

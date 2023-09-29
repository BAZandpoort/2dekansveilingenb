-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 29 sep 2023 om 14:57
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
-- Database: `2dekans-veilingen`
--

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
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `isAuction` tinyint(1) NOT NULL,
  `auctionEndTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `products`
--

INSERT INTO `products` (`id`, `userid`, `categoryid`, `name`, `description`, `price`, `imageUrl`, `updatedAt`, `createdAt`, `isAuction`, `auctionEndTime`) VALUES
(1, 12, 12, 'Refined Steel Table', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 460.00, 'https://picsum.photos/seed/fR14QOpQWG/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(2, 7, 1, 'Recycled Steel Sausages', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 362.00, 'https://picsum.photos/seed/WJcGlD/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(3, 3, 16, 'Modern Bronze Pizza', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 191.00, 'https://picsum.photos/seed/QYmIJXlg/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(4, 2, 7, 'Gorgeous Metal Gloves', 'The Football Is Good For Training And Recreational Purposes', 282.00, 'https://picsum.photos/seed/ak2ba/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(5, 50, 7, 'Electronic Cotton Table', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 521.00, 'https://picsum.photos/seed/uin11Xsxib/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(6, 13, 20, 'Intelligent Wooden Sausages', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 750.00, 'https://picsum.photos/seed/Ilb6N/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(7, 43, 16, 'Modern Fresh Gloves', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 170.00, 'https://picsum.photos/seed/JP3I7bCFB/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(8, 20, 16, 'Handmade Metal Shirt', 'The Football Is Good For Training And Recreational Purposes', 873.00, 'https://picsum.photos/seed/ukUiG51ySp/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(9, 39, 1, 'Practical Steel Chicken', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 967.00, 'https://picsum.photos/seed/D9zgi4unFz/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(10, 41, 22, 'Rustic Rubber Keyboard', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 240.00, 'https://picsum.photos/seed/12Og8pGi/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(11, 23, 19, 'Gorgeous Frozen Bike', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 49.00, 'https://picsum.photos/seed/HXxdxZaah/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(12, 42, 20, 'Rustic Cotton Ball', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 519.00, 'https://picsum.photos/seed/8PkW2W/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(13, 10, 6, 'Rustic Wooden Car', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 2.00, 'https://picsum.photos/seed/DLEZyO/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(14, 49, 14, 'Intelligent Bronze Bike', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 983.00, 'https://picsum.photos/seed/TaLX7/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(15, 46, 5, 'Oriental Metal Gloves', 'The Football Is Good For Training And Recreational Purposes', 441.00, 'https://picsum.photos/seed/36e5t9M/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(16, 8, 17, 'Handmade Rubber Ball', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 807.00, 'https://picsum.photos/seed/cMLKi/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(17, 24, 3, 'Refined Bronze Bacon', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 575.00, 'https://picsum.photos/seed/V2lSN/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(18, 22, 15, 'Incredible Rubber Ball', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 499.00, 'https://picsum.photos/seed/ftYShyKh/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(19, 17, 20, 'Rustic Granite Gloves', 'The Football Is Good For Training And Recreational Purposes', 768.00, 'https://picsum.photos/seed/0nOsL/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(20, 38, 19, 'Small Plastic Shirt', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 938.00, 'https://picsum.photos/seed/yasF2u/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(21, 36, 18, 'Modern Soft Shoes', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 830.00, 'https://picsum.photos/seed/T1PA2OkS4w/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(22, 40, 14, 'Small Frozen Car', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 449.00, 'https://picsum.photos/seed/djiOBQSGb/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(23, 18, 5, 'Fantastic Fresh Bacon', 'The Football Is Good For Training And Recreational Purposes', 207.00, 'https://picsum.photos/seed/9JZgGff9/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(24, 25, 14, 'Gorgeous Rubber Chair', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 437.00, 'https://picsum.photos/seed/OTpShDcGC/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(25, 30, 15, 'Handmade Fresh Chicken', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 237.00, 'https://picsum.photos/seed/mZa97T3NfN/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(26, 31, 19, 'Elegant Bronze Shirt', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 172.00, 'https://picsum.photos/seed/AKKVvv/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(27, 5, 6, 'Handcrafted Granite Ball', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 530.00, 'https://picsum.photos/seed/2rYasLz/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(28, 34, 7, 'Modern Rubber Shirt', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 438.00, 'https://picsum.photos/seed/UxLEp2M/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(29, 32, 11, 'Ergonomic Steel Pizza', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 122.00, 'https://picsum.photos/seed/5yLuD/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(30, 26, 7, 'Generic Granite Gloves', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 753.00, 'https://picsum.photos/seed/7epdpMsIa/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(31, 33, 14, 'Gorgeous Rubber Fish', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 740.00, 'https://picsum.photos/seed/ut1OfYX8/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(32, 21, 15, 'Luxurious Wooden Bike', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 135.00, 'https://picsum.photos/seed/3gQmi/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(33, 47, 8, 'Luxurious Concrete Tuna', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 657.00, 'https://picsum.photos/seed/v91gQR1/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(34, 28, 20, 'Ergonomic Bronze Car', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 248.00, 'https://picsum.photos/seed/HzANwLe2L/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(35, 16, 18, 'Gorgeous Soft Soap', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 445.00, 'https://picsum.photos/seed/NnR5HTFd5/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(36, 19, 20, 'Unbranded Steel Bacon', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 619.00, 'https://picsum.photos/seed/9bFRFmEjcR/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(37, 11, 9, 'Ergonomic Concrete Sausages', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 578.00, 'https://picsum.photos/seed/hvGSoRVfak/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(38, 1, 14, 'Licensed Frozen Salad', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 956.00, 'https://picsum.photos/seed/aFBhc/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(39, 9, 3, 'Tasty Steel Keyboard', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 117.00, 'https://picsum.photos/seed/eCgCjIMNUD/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(40, 29, 8, 'Handcrafted Concrete Fish', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 389.00, 'https://picsum.photos/seed/wP73XPec/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(41, 48, 6, 'Bespoke Bronze Bacon', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 914.00, 'https://picsum.photos/seed/pCt5yl/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(42, 44, 15, 'Bespoke Metal Salad', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 644.00, 'https://picsum.photos/seed/L89FN7q/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(43, 37, 1, 'Sleek Concrete Fish', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 741.00, 'https://picsum.photos/seed/U5A66z7Qya/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(44, 27, 4, 'Fantastic Rubber Soap', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 285.00, 'https://picsum.photos/seed/iSEyU/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(45, 45, 1, 'Awesome Rubber Bacon', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 719.00, 'https://picsum.photos/seed/ZONcvj3xjQ/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(46, 4, 15, 'Intelligent Bronze Cheese', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 278.00, 'https://picsum.photos/seed/e9G1m/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(47, 35, 6, 'Incredible Granite Keyboard', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 2.00, 'https://picsum.photos/seed/jPCoE/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(48, 15, 4, 'Rustic Wooden Bike', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 23.00, 'https://picsum.photos/seed/4qRK3k/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(49, 6, 19, 'Recycled Granite Cheese', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 780.00, 'https://picsum.photos/seed/NzWDIfA/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(50, 14, 2, 'Modern Granite Chicken', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 492.00, 'https://picsum.photos/seed/W5Urx/640/480', '2023-09-29 11:58:04', '2023-09-29 11:58:04', 0, NULL),
(51, 52, 2, 'Free food!', 'Free food!', 22.00, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/1024px-Good_Food_Display_-_NCI_Visuals_Online.jpg', '2023-09-29 12:10:20', '2023-09-29 12:10:20', 0, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`) VALUES
(15, 'Automotive'),
(16, 'Baby'),
(10, 'Beauty'),
(17, 'Books'),
(5, 'Clothing'),
(9, 'Computers'),
(19, 'Electronics'),
(6, 'Games'),
(13, 'Garden'),
(2, 'Grocery'),
(7, 'Health'),
(18, 'Home'),
(1, 'Industrial'),
(4, 'Jewelery'),
(22, 'Kids'),
(11, 'Movies'),
(8, 'Music'),
(21, 'Outdoors'),
(14, 'Shoes'),
(20, 'Sports'),
(3, 'Tools'),
(12, 'Toys');

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
(1, 'Lucile.Morissette', 'Maximilian_Armstrong@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$byq7PQ3DXGqc5Fap5dIZYw$/4heS5ZvgI/vL0TOUxHti92mxB+B+pcdV/2ZyNgwoxw', 'Vesta', 'Will', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(2, 'Cayla35', 'Katrina_Yost83@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$/Tsn/iXW7+abH85FFsxUjQ$WCeRn7BIHhYI893gaZE77AAby3ZTR3c54yFsPcgtXmI', 'Lottie', 'Wehner', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(3, 'Fernando.Nitzsche', 'Hettie_Boehm38@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$bYRcfyWV5Wp4sOXx+dO+9w$vNI8u1VzEWXvbqpxgOlZiGPwN2xuH0t1I7iMlgHXfIA', 'Kelsie', 'Tillman', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(4, 'Eleanora.Rowe60', 'Dawson.Turcotte@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$n8Dx/eJa2yd1wm/8FuaDKw$fysuC846/fabx7YgYq+86on9Xt8O9oaKc63fymmELPA', 'Ransom', 'Will', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(5, 'Brendon9', 'Virginie54@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$TOpXVn0yyn2egErDhVGOPQ$ARTdRZqudwVHTBLBrHijsiTFpwA/AK57dyNlR2pX86Y', 'Maribel', 'Shanahan', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(6, 'Stefan_McClure', 'Skye.Welch@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$7QmM/UsAa6+LkySkK/+nCQ$Uz60TkwiapSxFbph3Rm/C3TU4GgCUFeklaRtRIZX7Pg', 'Mathew', 'Rempel', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(7, 'Alan49', 'Eldridge_OReilly47@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$Oc7jYxj3Q3pNI/r9m2lzVQ$1Y6aO012c5/bb6a/cUbcXhPQd02haXr8djO4jZTJT/s', 'Davon', 'Cartwright', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(8, 'Diamond_Stokes', 'Carlie79@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$ZulD5XC0++i6/bL7pvuotA$hXLrsCmHss/HKyPCN37snjww4JzCKcywFRv7LHLW84M', 'Quincy', 'Douglas', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(9, 'Amber_Nader83', 'Orlo0@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$gJEZmnGztOrzvr36PUQ2xA$H/gSOgdsfnAHjyRs9BVjb3rJ2R5t8pNDSXzp2Em6/Yo', 'Brody', 'Thiel', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(10, 'Cassidy_Wisozk39', 'Elena.Schumm@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$7ph6+kCmU8vvK39s3zPnrg$4xVFLTXuICPML4gX+bPpEgXoX0RQCzjCoZ17Kl0mz5c', 'Jett', 'Purdy', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(11, 'Fredrick.OConner67', 'Eleazar_Spinka@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$oHnZkzG9NOrzgPha6JeXuw$K8Kczt9CrFsgy5aOJsciQdxNheJscC6oEHpJ+358GCo', 'Abbey', 'Stiedemann', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(12, 'Genesis.Goodwin', 'Kasandra.Wunsch@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$2r4rPVMOwe7WMBjpzTsHBw$Q3nXaFjfcdVPmR09dBKbzMxwj7l70a6LKt4BSieOkbs', 'Tatyana', 'Hoppe', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(13, 'Adelbert_King60', 'Cristopher15@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$FbwwXPKssawZRRR/bE1HAQ$r7HiKoRtcQujksOiu2J1qv9BDQYXndCPPHkUSUjQNVs', 'Clarabelle', 'Rosenbaum', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(14, 'Sven.Beer25', 'Cleve.Vandervort@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$p8V9r5zgHJ39i/EnwKKlaA$ZvtbiVbNTUVSjL4HJAbA9W6eXNcU+Yb+atPgBYeZk2c', 'Rebecca', 'Hilpert', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(15, 'Treva_Koelpin', 'Emmalee25@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$gbUPSnjpB0aQsfrL7blf2w$/npYIepm9/ArqvtYjOyGQwV8l439wLjLkk4/Igm8vfk', 'Khalil', 'Moore', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(16, 'Neva37', 'Ismael_Ledner50@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$2Nqq/WrkUeiDmuP49jix6A$8AEb9XOPLuW2FjI1rCyY2HlrjnbA/34LfngKnkUFSJE', 'Kaitlin', 'Dibbert', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(17, 'Victoria.Jones38', 'Oran55@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$xTR/49Dx9s0VC7b+bSdTtg$4cDYu0vvLY1vh7Cm8u/OQkQkTcMJPuUQFRzB4VZS1PE', 'Emanuel', 'Oberbrunner', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(18, 'Kavon.Gulgowski', 'Katelin95@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$3dxs0IbVyVCDFRw7NGtO/A$edeC2mvPDCj4HR2AJNWgIvFMAIskBkl8jh0nLLBa8Cc', 'Demarcus', 'Schroeder', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(19, 'Maxwell_Boehm', 'Jaylin_Johnston5@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$Hlf4rEQp9H5xtV1UPwm2Cw$fT0lOsMtW/Kt5jJ5dbTGGwEvw3tCfSs8JGYoWzKoYP8', 'Noah', 'Brown', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(20, 'Amara.Thompson78', 'Madisen_Rowe@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$yBHYvbamL9xomeGVa3lHug$JB2+R/Kz34F+pIuWQUZR72cOoRqBFBSU/CqVMDvtULc', 'Wallace', 'Veum', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(21, 'Edythe.Wolf', 'Beryl.Kassulke@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$cddQUZt2mO7+jrpsfShzfw$jCYMTDYDagLFqSSEE2xKl3DEamEOjvlxBKulwgTurFU', 'Jada', 'Stark-Schaefer', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(22, 'Alverta_Franey', 'Ella.Schaefer95@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$ishixMBDmn7cOzF5h7zKgg$lnoC9GB4KfF+3FmaWTiya7NWhearhxYENonXasmww14', 'Ebba', 'Kreiger', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(23, 'Keara.Kassulke', 'Mack73@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$19cpOeN1ZioH/YeHHfmPMA$x7AZ335wv2YOmPlD11xqvgbxBzTetFOGIF1otQfNDww', 'Devyn', 'Moore', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(24, 'Berry_Jones', 'Vena_Wiegand@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$1q5bb5MpWOzg810HELNQBw$sbFjUAoOPS2a29W0R1un9zZbZW8/3kv3N0NqR/fEfS4', 'Michel', 'Kub', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(25, 'Jo75', 'Julie64@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$oNItLxDdPc6xz+PxIxRGVg$xawnrG6Gyi3BDdZaiVMjI9m9WB5cqqnYaQOAtzVoYBY', 'Daphnee', 'Hammes', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(26, 'Nova_Corkery', 'Julian_Lowe@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$SsZ7SnKUi8h36s6AdZKcBQ$OekJ7/QlemlQPsF5vnxFZ5uaoxVdUBJ+PZ/8+PEdXpU', 'Jadon', 'Stark', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(27, 'Elwin70', 'Arlo2@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$HaVSWL5m1HFKewigB4flEg$lsFoRMTDz3MqcPAblCw84NfJ3YTY6zbHpLq3le6pp6c', 'Esther', 'Kautzer', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(28, 'Kirsten_VonRueden-Jerde', 'Geovanny98@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$8A8k2P2PCOoXdHT224Etng$jQXsYJT2qLXxzHxOKSiqN50MuEn3ezMNoefhp39KR7g', 'Ella', 'DuBuque', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(29, 'Javier42', 'Branson.Mraz68@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$OjAO8ukdhX+yzbGwuZQ17w$agw2CKvHVlBOdKXG8bJMik5U8qKAz+0tbKjOpBdqLEM', 'Ella', 'Borer-Sporer', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(30, 'Katharina.Halvorson', 'Jany_Satterfield41@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$fmruLW5fF/QjrwxS5LdJNg$m+epJ/BbdX6weQNiOH0giUi2VoaBy4Je6bA4/PpJYgU', 'Randall', 'Kunze', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(31, 'Edmund_Hegmann', 'Leanna8@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$bEuZjLynXdUMyehuqGkpMA$yhG4YVOeMS5VgAWCUnB8JCJXzH0SNZ1DxchEuBScTeg', 'Britney', 'Ebert', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(32, 'Tyreek99', 'Raymundo.Emard24@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$5x5qCWHOi3tWflsA5q+LMw$KqckhIf6JQnbyUJI+vG3nXuTV0ozjXnz6rYFP6Kjd88', 'Benton', 'Turcotte', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(33, 'Susana_Kuhic96', 'Hilton_Toy77@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$WYPq7ZIPGLegZuvx14jPMw$WiiB+2DPxOhB5j//uqwiRWxzJyGKPUeOfqfqcH9K/VA', 'Jackson', 'Zboncak', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(34, 'Katlynn3', 'Esteban97@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$QYfKYqQV805VCAm1y82TAg$wLERaa4BWsMHT8YBzdMxhrCUBK3xBjaDM19Q92dGcM8', 'Wilhelmine', 'Watsica', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(35, 'Nathen.Bashirian', 'Liam_Torphy@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$mn5sMJVUYRDulDhe/Jt1/A$4z2rib1E5W5K69H0Mffb/El0SDpaSDumIndZcRQ4R4s', 'Clovis', 'Stark', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(36, 'Harley_Auer2', 'Loraine_Schultz@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$00ZNJXU8sg4Cm4jk16prEQ$Pd+0lUMvWSfO1FZ4MnYorZ8NWJ6jRRElrLp6aYitbG8', 'Wendy', 'Gerlach', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(37, 'Kevin3', 'Brent.Jacobson@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$+VbRSPBHfVAGx75mu23tYg$oEUQUwoQ7yDWSRa7MsNUqBAaQQH7BGFZwWWAGtpyuos', 'Glennie', 'Howell', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(38, 'Jaqueline_Sawayn73', 'Reggie.Miller74@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$HT9NxHsew6KWuHqtvJLRew$zBp3+KP1Jzlm/rBYiUccsJMgRqANi1+c353hGIWEhbs', 'Johathan', 'Goyette', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(39, 'Kaylie_Walker-Koepp63', 'Arielle_Nader@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$6tc8e1u7bLtMzqWQRHav5Q$cjBRI2sdCSTLBKY3x5l7PlIR2QDF6zB3SRBm9ViXw7Q', 'Keeley', 'White', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(40, 'Palma_Kunde28', 'Devin_Goyette@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$yLAeONCXfSdBYlvYCz4BJQ$+N+LZ6b7VEDgjVpvbTFHIW9LRHti0wgI7luUggy3VJA', 'Camilla', 'McClure-Franey', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(41, 'Lincoln.Hane39', 'Avery.Thiel62@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$ic5g8QomZveTuCYX8ds33A$ITh1zebNJbYq0sgfR94lt854nXN4UYm82ZgOqoV6jFU', 'Jillian', 'Kuhlman', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(42, 'Cecelia.Pagac', 'Libby.Bode@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$cc5npQfbU2FBxZjZxUAr+Q$zJ6gTon1V94ZY9oNdidH2ALjP71AgUE9FOeplvaJpH8', 'Athena', 'Hyatt', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(43, 'Gus71', 'Treva21@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$ZacUlySW86akk2rHg3G9Iw$6lDFY/bO9/vZQ5aTJcNCnEU6n29wDumMDvpikivoUe0', 'Aleen', 'Conroy', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(44, 'Ike84', 'Willow6@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$Vm18B1HeRk8IhFeKdmWRUw$3qT2Ju50R4BeoRKdvE7M07LQ3zSDCoimyA1g7KJvQbg', 'Ozella', 'Boehm', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(45, 'Leonard_OKeefe', 'Sofia_Bradtke@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$gGLv4lV3fhJvV63MNV0eVg$qij+pyKYgBYWm+SVFoZE0w6uP35PsJe0lEoSw1RCzNc', 'Elsa', 'Jenkins', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(46, 'Janie.Kuvalis', 'Marlen_Ullrich53@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$fl7oE2T5NU/rjLEOxMOR+g$IZbU0saj8XtyK531oWIiITTi25GzaAwEI1QcrT3D4Dw', 'Julien', 'Gutkowski', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(47, 'Roosevelt92', 'Green.Renner@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$iVauWTqOHwyVQwmm09MqZg$1YWuJuSWEhRGqEN7KFiOYMz61a3hGnwiMWUifLmlzKA', 'Destin', 'Lesch', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(48, 'Tyson3', 'Esteban12@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$nwDwTXoz4TWW43WqzgUO5A$w9ayvTREi/cDHh0oiO/o11TWan6cdSVEvfV+sZGy568', 'Nathanael', 'Ruecker', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(49, 'Elza73', 'Edwin19@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$kCLOtTKMl32K2XpNgExULw$N19oOz0+aj6OqXWFo17f/jNeIWaE429DmWNBrRNAvfs', 'Baby', 'Zemlak', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(50, 'Abdiel_Lindgren', 'Constance37@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$FFmrg400yoPu+SORPgI24Q$a+jaN6xHNuDsbvmXDdiYo3ox11ZgvwoqCeQuDRebWm4', 'Christiana', 'Kling', '2023-09-29 11:58:04', '2023-09-29 11:58:04'),
(51, 'Eebee', 'gd@email.com', '$argon2id$v=19$m=65536,t=4,p=1$dXVkVmlzd3pYcjhXNDR6ag$81NnWg3z4+D1Ttr40DAAH+YUmYsDdGWICr1kqu8s7G4', 'Gebee', 'Debee', '2023-09-29 12:00:57', '2023-09-29 12:00:57'),
(52, 'EEEEE', 'eee@email.com', '$argon2id$v=19$m=65536,t=4,p=1$MjMwYTY4eVhmbWQ5WnVtNA$HUlX47MjXLTtnWtkdLzZuRK31czQxM2mLgtQCHSP9HI', 'AAA', 'EEE', '2023-09-29 12:01:39', '2023-09-29 12:01:39');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `profilePictureUrl` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `theme` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `user_profile`
--

INSERT INTO `user_profile` (`id`, `userid`, `profilePictureUrl`, `about`, `theme`) VALUES
(1, 7, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/874.jpg', 'Alias blandior calcar alo amiculum appositus depereo vetus cruentus. Laborum abeo xiphias tamisium. Civis patria ars via absens tondeo adhuc coepi damnatio.', 'dark'),
(2, 20, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/473.jpg', 'Sumptus reprehenderit crapula sol. Tepesco fugit aliqua. Crapula ab quae fuga vomer laboriosam suscipit cognatus aurum.', 'dark'),
(3, 33, 'https://avatars.githubusercontent.com/u/78280696', 'Distinctio aperte astrum urbanus odio cultellus bibo comitatus. Tergiversatio viriliter adfero teres centum amo. Defleo cotidie conicio arguo.', 'dark'),
(4, 2, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/724.jpg', 'Calculus color acsi viridis aestivus colo vociferor. Comminor atrox acidus cena victoria ustilo sonitus aeneus conventus enim. Spoliatio varietas virgo non vinco confido quam vomer.', 'dark'),
(5, 6, 'https://avatars.githubusercontent.com/u/78110148', 'Templum cribro cura voluptatibus complectus clementia acquiro adflicto cui campana. Acer considero temporibus candidus decor. Unus dedecor celebrer comes crastinus animadverto cupiditas vero.', 'light'),
(6, 21, 'https://avatars.githubusercontent.com/u/71492809', 'Auditor artificiose desipio. Thermae at tredecim id vorax adeo. Vinitor desipio et cura demulceo capitulus.', 'light'),
(7, 22, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/37.jpg', 'Vesco ullam officia confugo tripudio alioqui ubi aperte amissio ratione. Administratio venia ater unus uxor sperno ago ex administratio. Tricesimus trepide apparatus creta.', 'dark'),
(8, 1, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/593.jpg', 'Deripio stella abduco vitium stipes talis teres. Cetera appello usus agnosco timidus. Decet cimentarius trepide.', 'light'),
(9, 48, 'https://avatars.githubusercontent.com/u/73777275', 'Exercitationem atqui asporto cervus celebrer. Abutor decretum ad barba iusto calcar chirographum caput. Ustulo amet sollicito.', 'dark'),
(10, 44, 'https://avatars.githubusercontent.com/u/20140990', 'Sophismata vulgus aer exercitationem aer derideo sodalitas. Undique confugo certe demergo bellum versus. Supra vix validus antiquus aliquam caste toties aeger trado synagoga.', 'light'),
(11, 47, 'https://avatars.githubusercontent.com/u/51183222', 'Verus calco chirographum vindico recusandae. Cohors illum voluptates solium umbra crinis aestas centum. Patrocinor stabilis maxime agnosco agnitio libero.', 'dark'),
(12, 16, 'https://avatars.githubusercontent.com/u/91572508', 'Laudantium conitor damno decumbo color. Verumtamen defendo coniuratio tracto minima comminor dedico occaecati comburo una. Tero triumphus abbas accusantium.', 'light'),
(13, 45, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1136.jpg', 'Carpo depopulo derelinquo curatio crur calcar cuppedia sapiente defluo. Desino sapiente voluptate modi vinculum nam aegrotatio. Tabella vestrum dolores desino amicitia.', 'light'),
(14, 35, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/819.jpg', 'Eveniet aeger confugo catena excepturi umquam civis. Molestias tenetur arx aranea calco. Adaugeo turbo facere comprehendo calculus varietas.', 'dark'),
(15, 50, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/446.jpg', 'Conduco desolo ad a aliquam custodia. Optio blandior aveho armarium pauper vitiosus. Carbo admiratio repellendus supplanto praesentium adsuesco agnosco.', 'light'),
(16, 23, 'https://avatars.githubusercontent.com/u/51229510', 'Facere aer aperio advoco suffoco curis. Cui adversus tepesco solum. Atavus callide adhuc rem eligendi assumenda allatus ademptio vobis.', 'dark'),
(17, 28, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/314.jpg', 'Taceo adulescens caput incidunt valeo verto addo vos comptus spectaculum. Fuga statua decimus compono nesciunt. Dicta caveo tamdiu vorago thema vitae.', 'light'),
(18, 26, 'https://avatars.githubusercontent.com/u/42999078', 'Cibo ademptio conitor talus. Civis quia ambitus dapifer. Quo volo patior astrum sapiente constans claudeo.', 'light'),
(19, 18, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/675.jpg', 'Subito acerbitas caries delectatio. Altus rerum tener curis incidunt apud custodia cubitum articulus contabesco. Cresco beatae despecto ter depereo explicabo.', 'light'),
(20, 42, 'https://avatars.githubusercontent.com/u/60083701', 'Verus creo comminor beneficium tamdiu solutio claustrum vomica. Bis possimus deludo tergeo cerno tero vulariter. Coniecto advoco audentia deleo sublime tutamen illo volup.', 'dark'),
(21, 31, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/81.jpg', 'Solutio templum neque coruscus capio. Sto volubilis capitulus comprehendo verto crastinus. Laborum ait rem reprehenderit ara abscido.', 'dark'),
(22, 34, 'https://avatars.githubusercontent.com/u/29443006', 'Conduco versus aperiam. Aspicio demitto arcus. Aegre talis causa officia adipisci theologus beneficium confugo.', 'dark'),
(23, 43, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/274.jpg', 'Vinco terminatio rem damnatio vehemens beatus crapula theca adimpleo video. Venio collum vir aegrotatio decretum. Deorsum aperte cognomen appono claro veritas desipio spiritus.', 'light'),
(24, 14, 'https://avatars.githubusercontent.com/u/87309639', 'Magnam vis approbo taceo pariatur. Aeger beatus tabula assentator despecto delicate quis. Quaerat inflammatio calcar curia tubineus undique.', 'light'),
(25, 9, 'https://avatars.githubusercontent.com/u/61594244', 'Cometes repudiandae ciminatio stips denique eveniet tenus qui vaco. Magnam sophismata necessitatibus una. Cognomen defungo atavus officiis tergeo coniuratio adopto teres recusandae.', 'light'),
(26, 8, 'https://avatars.githubusercontent.com/u/54386498', 'Alii ullam vos tempus viridis aperio constans vindico et delinquo. Thymum viriliter aspernatur crebro. Audacia crustulum ventus ventus.', 'dark'),
(27, 25, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/664.jpg', 'Advoco dolores cerno viridis cavus tubineus dolorum delego facere. Textilis illo complectus textus soluta accusantium vulticulus quis arx deduco. Tabesco celer vulgo laboriosam solvo aduro.', 'dark'),
(28, 30, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1016.jpg', 'Denego theologus barba esse ustilo arceo. Solium constans absconditus. Valens callide acervus cornu vulnero uxor.', 'dark'),
(29, 3, 'https://avatars.githubusercontent.com/u/2327567', 'Amor accendo pectus nemo verto decens cibo theatrum acerbitas. Adopto clamo aeger crastinus consequatur. Veritatis sordeo spero tabula cavus urbs sono.', 'dark'),
(30, 11, 'https://avatars.githubusercontent.com/u/53800804', 'Tendo arbor dolores. Antepono fugiat abundans super illum stabilis testimonium certus. Soleo commodo tristis inflammatio vesper aveho temperantia carbo coadunatio absens.', 'light'),
(31, 41, 'https://avatars.githubusercontent.com/u/18713024', 'Terra theca admiratio adfero vir circumvenio. Abundans crapula curis cur magni admoneo admoneo causa. Asperiores deputo caute coruscus callide atqui atavus.', 'dark'),
(32, 37, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/476.jpg', 'Agnosco tenax vigilo recusandae deripio tametsi nihil tollo. Certus adsuesco tenus. Abundans uterque cometes canis tondeo triumphus.', 'dark'),
(33, 29, 'https://avatars.githubusercontent.com/u/74968570', 'Confugo coepi civis. Coadunatio adamo numquam cetera crudelis. Vilitas termes aggero.', 'light'),
(34, 15, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1233.jpg', 'Annus acquiro abbas consectetur baiulus tenus alveus utilis tremo. Campana ventito dens spiritus constans tredecim suscipit. Solum admiratio debilito alii baiulus valetudo trado.', 'dark'),
(35, 32, 'https://avatars.githubusercontent.com/u/87811052', 'Cur caterva centum eligendi ducimus cunae. Tantillus vesica truculenter aperte terror vere. Utroque laboriosam termes.', 'dark'),
(36, 38, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/612.jpg', 'Amaritudo avaritia socius tenax curto. Doloribus solum paens. Clam turbo truculenter charisma corrumpo subiungo.', 'dark'),
(37, 4, 'https://avatars.githubusercontent.com/u/44077877', 'Vulariter suggero solium veritatis temperantia tactus alo. Demergo inflammatio cubo urbanus reiciendis. Talus vindico textus voluptatem vado alter comitatus defaeco carmen cotidie.', 'light'),
(38, 5, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/538.jpg', 'Cruentus creptio cornu crudelis subseco. Ut tabgo cura versus collum nihil architecto suspendo. Vomer via cupiditate tergum tenuis.', 'light'),
(39, 40, 'https://avatars.githubusercontent.com/u/14169391', 'Vulticulus vesica demergo deludo vulpes odio uberrime sponte. Consectetur tunc cicuta dolor cubicularis abutor absconditus calco. Tutamen video error rem decet aut suasoria.', 'light'),
(40, 12, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/584.jpg', 'Labore statua adeo tenus acer valde comitatus deorsum timidus comedo. Pariatur creta alioqui. Ipsa iste atqui caste trepide talio suadeo temperantia.', 'dark'),
(41, 39, 'https://avatars.githubusercontent.com/u/14062178', 'Validus ante porro amoveo adsum iusto. Corona coruscus cresco xiphias adinventitias tantillus commemoro deputo. Abeo ullam quos cultellus.', 'light'),
(42, 49, 'https://avatars.githubusercontent.com/u/66597812', 'Vita spes rerum decens. Expedita adsum abundans tonsor subnecto excepturi coniecto acsi. Deduco totam angustus subseco turpis subiungo.', 'dark'),
(43, 19, 'https://avatars.githubusercontent.com/u/67033820', 'Absens sapiente ratione repellendus. Accusamus carus tenus thymbra valens torqueo vulariter. Possimus adopto cubitum abeo stips comprehendo approbo ea animus atrocitas.', 'dark'),
(44, 13, 'https://avatars.githubusercontent.com/u/24068998', 'Repellat voro amet cultellus laboriosam ab nesciunt odio nihil damno. Vulgo aperiam appello defetiscor antepono adipisci ager. Beatae aro sperno bardus animus vetus ager.', 'light'),
(45, 36, 'https://avatars.githubusercontent.com/u/70246514', 'Cultura corrumpo suadeo anser aliquid beatae optio. Aduro bestia corrigo carpo aperio ipsam vir vapulus curiositas. Vesica repellendus alii ademptio texo teneo laudantium.', 'dark'),
(46, 17, 'https://avatars.githubusercontent.com/u/31641960', 'Cumque aspicio bis teneo tricesimus demergo. Sonitus vigor conservo beneficium aperiam desino. Clibanus cruciamentum cena carmen tandem casso unde trans aegrus.', 'light'),
(47, 27, 'https://avatars.githubusercontent.com/u/86244532', 'Vado admiratio compono vilicus vado usus repellat. Vomica ait utrimque vereor. Tego ad strenuus.', 'light'),
(48, 10, 'https://avatars.githubusercontent.com/u/9764269', 'Solitudo videlicet terga deripio somniculosus thesaurus cibo. Deporto corporis truculenter cogito ascit. Amplexus quam tyrannus aperte calcar consequatur corpus.', 'dark'),
(49, 46, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/23.jpg', 'Solus sordeo audacia ventosus adaugeo recusandae. Expedita adopto vos cibus cedo vacuus utroque amplus id. Antiquus infit curis valens creptio.', 'light'),
(50, 24, 'https://avatars.githubusercontent.com/u/45241709', 'Venio amet appositus conduco collum canonicus verecundia adamo. Cruciamentum nostrum custodia laudantium amo tenuis sperno subnecto depromo acies. Inflammatio avarus suadeo coniuratio somniculosus comparo nam appositus delibero tactus.', 'dark'),
(51, 51, 'https://avatars.githubusercontent.com/u/64209400?v=4', 'Hello!', 'dark'),
(52, 52, 'https://avatars.githubusercontent.com/u/64209400?v=4', 'Hello!', 'dark');

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
(1, 19, 2),
(2, 14, 2),
(3, 49, 3),
(4, 37, 2),
(5, 20, 3),
(6, 41, 3),
(7, 40, 1),
(8, 32, 1),
(9, 16, 2),
(10, 5, 3),
(11, 26, 3),
(12, 31, 1),
(13, 43, 2),
(14, 17, 1),
(15, 44, 1),
(16, 38, 2),
(17, 7, 3),
(18, 8, 3),
(19, 34, 2),
(20, 6, 3),
(21, 24, 3),
(22, 3, 1),
(23, 48, 3),
(24, 50, 2),
(25, 46, 1),
(26, 21, 1),
(27, 36, 2),
(28, 13, 3),
(29, 10, 3),
(30, 33, 2),
(31, 30, 1),
(32, 39, 2),
(33, 23, 2),
(34, 12, 1),
(35, 27, 2),
(36, 35, 1),
(37, 28, 1),
(38, 47, 2),
(39, 22, 1),
(40, 9, 3),
(41, 2, 3),
(42, 25, 3),
(43, 29, 2),
(44, 18, 1),
(45, 42, 3),
(46, 45, 1),
(47, 1, 1),
(48, 15, 1),
(49, 11, 2),
(50, 4, 2);

--
-- Indexen voor geëxporteerde tabellen
--

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
-- AUTO_INCREMENT voor een tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT voor een tabel `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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

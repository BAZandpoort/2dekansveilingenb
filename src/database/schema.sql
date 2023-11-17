-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 10 nov 2023 om 14:30
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
  `hasSelfPickUp` tinyint(1) NOT NULL DEFAULT 1,
  `hasStandardDelivery` tinyint(1) NOT NULL DEFAULT 1,
  `hasExpressDelivery` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `products`
--

INSERT INTO `products` (`id`, `userid`, `categoryid`, `name`, `description`, `price`, `imageUrl`, `endDate`, `updatedAt`, `createdAt`, `hasSelfPickUp`, `hasStandardDelivery`, `hasExpressDelivery`) VALUES
(1, 34, 8, 'Ergonomic Plastic Towels', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 851.00, '20.jpg', '2023-10-24 06:50:21', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(2, 39, 7, 'Unbranded Frozen Tuna', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 590.00, '23.jpg', '2023-10-23 23:54:36', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(3, 15, 6, 'Luxurious Bronze Shoes', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 224.00, '33.jpg', '2023-10-23 13:14:53', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(4, 9, 5, 'Rustic Bronze Sausages', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 508.00, '2.jpg', '2023-10-23 18:21:14', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(5, 6, 8, 'Luxurious Fresh Salad', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 967.00, '29.jpg', '2023-10-23 10:21:57', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(6, 22, 5, 'Awesome Bronze Bike', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 765.00, '1.jpg', '2023-10-23 17:00:06', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(7, 42, 3, 'Ergonomic Concrete Pants', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 659.00, '42.jpg', '2023-10-23 16:47:59', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(8, 17, 6, 'Elegant Frozen Towels', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 675.00, '5.jpg', '2023-10-23 15:26:40', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(9, 46, 8, 'Bespoke Soft Pants', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 574.00, '36.jpg', '2023-10-23 14:11:58', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(10, 20, 3, 'Licensed Concrete Tuna', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 18.00, '46.jpg', '2023-10-24 07:27:13', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(11, 14, 7, 'Sleek Cotton Hat', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 225.00, '24.jpg', '2023-10-24 00:10:23', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(12, 23, 8, 'Luxurious Frozen Chair', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 870.00, '11.jpg', '2023-10-23 16:28:19', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(13, 3, 8, 'Ergonomic Plastic Gloves', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 514.00, '13.jpg', '2023-10-23 20:33:22', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(14, 40, 10, 'Licensed Metal Towels', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 191.00, '14.jpg', '2023-10-24 05:46:36', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(15, 1, 3, 'Sleek Rubber Computer', 'The Football Is Good For Training And Recreational Purposes', 939.00, '10.jpg', '2023-10-24 04:22:09', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(16, 8, 2, 'Unbranded Soft Salad', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 32.00, '19.jpg', '2023-10-23 23:06:41', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(17, 2, 10, 'Unbranded Granite Tuna', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 105.00, '50.jpg', '2023-10-23 16:57:31', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(18, 18, 1, 'Generic Fresh Chicken', 'The Football Is Good For Training And Recreational Purposes', 703.00, '34.jpg', '2023-10-23 20:00:07', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(19, 44, 9, 'Bespoke Metal Mouse', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 175.00, '30.jpg', '2023-10-23 23:11:59', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(20, 16, 5, 'Ergonomic Granite Ball', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 939.00, '28.jpg', '2023-10-24 05:15:16', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(21, 33, 5, 'Handcrafted Rubber Keyboard', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 172.00, '35.jpg', '2023-10-23 10:29:28', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(22, 4, 10, 'Elegant Concrete Salad', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 339.00, '3.jpg', '2023-10-23 15:52:31', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(23, 31, 2, 'Fantastic Granite Shirt', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 792.00, '32.jpg', '2023-10-23 14:22:09', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(24, 36, 3, 'Modern Granite Salad', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 269.00, '41.jpg', '2023-10-23 22:54:23', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(25, 37, 6, 'Ergonomic Metal Car', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 352.00, '4.jpg', '2023-10-23 19:33:27', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(26, 50, 7, 'Elegant Soft Towels', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 722.00, '43.jpg', '2023-10-24 06:32:01', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(27, 13, 4, 'Practical Rubber Soap', 'The Football Is Good For Training And Recreational Purposes', 318.00, '16.jpg', '2023-10-23 11:12:37', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(28, 27, 1, 'Refined Granite Chips', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 300.00, '17.jpg', '2023-10-23 18:30:16', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(29, 38, 7, 'Practical Fresh Pants', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 23.00, '18.jpg', '2023-10-23 19:05:20', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(30, 47, 8, 'Practical Fresh Car', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 563.00, '27.jpg', '2023-10-23 18:51:18', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(31, 28, 7, 'Luxurious Frozen Table', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 672.00, '45.jpg', '2023-10-24 01:44:49', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(32, 26, 1, 'Refined Cotton Towels', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 131.00, '26.jpg', '2023-10-23 12:40:07', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(33, 41, 8, 'Generic Concrete Ball', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 199.00, '39.jpg', '2023-10-23 13:19:08', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(34, 10, 1, 'Refined Wooden Bacon', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 992.00, '8.jpg', '2023-10-23 08:26:14', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(35, 29, 2, 'Handcrafted Fresh Shirt', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 287.00, '25.jpg', '2023-10-23 23:13:03', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(36, 45, 8, 'Recycled Plastic Gloves', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 978.00, '15.jpg', '2023-10-24 03:25:50', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(37, 21, 1, 'Gorgeous Metal Shoes', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 990.00, '9.jpg', '2023-10-23 13:10:14', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(38, 11, 10, 'Tasty Fresh Gloves', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 963.00, '7.jpg', '2023-10-24 02:13:13', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(39, 32, 4, 'Refined Rubber Keyboard', 'The Football Is Good For Training And Recreational Purposes', 799.00, '49.jpg', '2023-10-23 09:04:51', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(40, 25, 2, 'Oriental Cotton Pizza', 'The Football Is Good For Training And Recreational Purposes', 856.00, '48.jpg', '2023-10-23 18:25:22', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(41, 43, 2, 'Sleek Cotton Fish', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 820.00, '37.jpg', '2023-10-23 07:44:41', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(42, 7, 6, 'Practical Granite Fish', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 52.00, '47.jpg', '2023-10-23 10:21:19', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(43, 19, 3, 'Oriental Frozen Table', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 667.00, '38.jpg', '2023-10-24 06:07:33', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(44, 35, 7, 'Tasty Cotton Soap', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 816.00, '21.jpg', '2023-10-23 14:27:19', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(45, 24, 2, 'Electronic Bronze Shirt', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 233.00, '22.jpg', '2023-10-23 15:58:30', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(46, 30, 5, 'Tasty Steel Chicken', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 720.00, '44.jpg', '2023-10-23 19:03:02', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(47, 12, 4, 'Licensed Metal Bacon', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 69.00, '12.jpg', '2023-10-23 22:40:26', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(48, 5, 1, 'Handmade Bronze Salad', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 338.00, '40.jpg', '2023-10-23 18:17:07', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(49, 48, 2, 'Luxurious Plastic Cheese', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 483.00, '31.jpg', '2023-10-23 10:52:04', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(50, 49, 5, 'Intelligent Metal Bacon', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 862.00, '6.jpg', '2023-10-24 05:50:19', '2023-10-23 07:28:30', '2023-10-23 07:28:30', 1, 1, 1),
(73, 52, 2, 'rttthtt', 'RRRRRRRRRRRRR', 0.03, 'Headphone-dynamic-premium (1).png--userid-52.jpg', '2023-12-03 09:22:00', '2023-11-06 08:22:39', '2023-11-06 08:22:39', 1, 1, 1),
(74, 52, 4, 'Foot ball', 'ztergergerher', 0.17, 'Football.png--userid-52.jpg', '2023-11-25 15:15:00', '2023-11-06 14:16:02', '2023-11-06 14:16:02', 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Alan88', 'Misael_Mueller41@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$nneMf2Z7bC0hKQXKyIWA8g$8Vws7Y10y8tt153GOM1bUk3i9Ih1ocsy86Ovubd8wT4', 'Deangelo', 'Purdy', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(2, 'Bertram.Franey97', 'Delores92@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$YM5RSr7c5EnEtyxsNhOYIA$9jm8GdqrKueYkS+PM70kY9M5vl4t/YQwNq8Zlx2mqU0', 'Tavares', 'Tremblay', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(3, 'Myles69', 'Ray_Rohan@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$AWjBXbL+Q+oDmcJPRQ2p3Q$o+wlJOjQvNQ6wzLoX60XANeLmwqnXKSzq4XSFzkloTw', 'Genevieve', 'Mayer', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(4, 'Palma_Lind18', 'Judy.Jakubowski@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$GPhRzUHK8DA/AvL/Cmqhng$P4Jp3LXASSyeYf6FeeDJ1aJcYkTVo4oEjrXpQx3UGPg', 'Lina', 'Ebert', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(5, 'Lurline85', 'Doris.Beer45@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$DBpNt0o9A1QwQZ++rdb9MA$HPI2AFAMNFpMzt8kaxutgTUHLsXpFInOLX9grKUKNyk', 'Nestor', 'Bruen', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(6, 'Jamil.Kuhic', 'Abbie.Effertz53@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$vlr9UoVCtzyLOoySxBzixw$JBRYwQNGv4SQ3Uwkii9vWBdg9o1QiVC7gCoDBlnBA/8', 'Terrance', 'Kris', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(7, 'Niko.Heidenreich97', 'Tiara.Witting0@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$j8YNt5Em9nmrBSkBc6YJyQ$tvtNtIYh3kqRuCifrX+F6E6u2lRsnRvQX5nOVWiAzNM', 'Amber', 'Flatley', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(8, 'Tyree_Bailey88', 'Ken.Satterfield79@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$8YWvMWABfFCSVyGHUu4gJA$ldu/+x6Lq9Oz4zTLfu15Adoesk0j2XQdwZ7lal54ars', 'Carter', 'Prosacco', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(9, 'Vicente.Crona81', 'Wyman67@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$Oevp2VPvQfyDtFoEJ2NudA$DdUbKy8kk93AAuATbDn7qCfoTaIra+5zIk4D9f7qxVA', 'Rosina', 'Satterfield', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(10, 'Jason59', 'Jeremy36@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$ip7UHr769jhlb5L+lBY+xw$EjzxfxhgIM5Z+u7TM4AdqkZGrJmMgfDgiTj5f7kB5Wc', 'Emilio', 'Veum', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(11, 'Delores_Schuster82', 'Anastacio_Gleichner@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$IyVs9mwh1Gk4RGE3AIo1TA$NCHaS621voS27U5eAVxHqzZ0QOi9yJxunAcrqlNy3Fk', 'Enos', 'Kovacek', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(12, 'Stewart_Boyle', 'Tobin.Bernhard58@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$606DfY7yLDgiL6cbr/WkXg$nlPFkwAiVGYuifj0O8x/ocpCiwjuzJphSGQVJTJH83w', 'Thad', 'Feeney', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(13, 'Joanne.Schuppe84', 'Reba54@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$RLTXSBfCw9BqOCql/Lu9cQ$yThGCGKIE7KLdV39BfBigpfdgWJoM9l2xcXykmvKvFk', 'Roscoe', 'Smith', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(14, 'Elvera_Braun5', 'Adele32@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$dAPrUSWqI2BIC5TR34eVJg$cgGyafqQQDokeRqRbUASQ6pRU21vmnITRi5VfNXeLVk', 'Raheem', 'Haley', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(15, 'Jazlyn_Tromp', 'Brennon.Huel94@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$PQA5Hjm5zwQ7Awpys+2kPQ$FkYlcpM696hg05K6+cxj/vVZ2aPr8ci28fhGaB2JBCI', 'Wendell', 'Mayer', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(16, 'Philip.Howe66', 'Ansel.Hamill@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$xJJVnpnFzM8tVJJ+70N3Yw$QGQsz/ZSLWkWKzyJqw1KqTLnM8FuCU2U9BHsZA/x3+U', 'Maryse', 'Bashirian', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(17, 'Mariam.Williamson29', 'Everett64@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$WZ6R6Kc1pG83DQ5HJVoxBg$6mZoE4e9z7DVuFcbTrwCwqH4dhpFDT8CIKhqotkn8WY', 'Vicky', 'Bartoletti', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(18, 'Madilyn_Kirlin', 'Boris_Walter@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$KrvkpdAi5DLNGCMrxEgpnw$vKcDU9eg0qXnXkWHQQH/SMIk+Bmo5ndlJlq1kS/3S9w', 'Tyree', 'Kessler', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(19, 'Giuseppe71', 'Katlynn83@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$HzuixO3zraArRjB+M/dFhQ$oynDNHkV0IWL3bv/MTCsudDbMp74uToJHBx5zLWI6ss', 'Geoffrey', 'Kiehn', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(20, 'Lyla.Brakus', 'Otto_Schmidt97@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$cKLtcbSz/KSUvcT/PLhK2w$QkZjro3MMLOBFNhuxZDAOsFspukdCb75VXY4aSQsC24', 'Trey', 'Walsh', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(21, 'Brook.Hammes', 'Demarco12@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Uk4HWXlRtYzv5dlnKVabTA$FEqdyDCiic328SHzeEJgHbrf+tGn97/z3NXY75audrI', 'Linnea', 'Pfannerstill', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(22, 'Janessa_Christiansen', 'Linda55@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$HgQrDaNwpIzsnUnDuGH05w$3GyUuGjhdFgdS+kE5CvjvJmXijbbSKdBNVBaMhhSkqg', 'Isadore', 'Hammes', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(23, 'Julio_Grady-Nikolaus', 'Theo_Schaefer29@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$O1DZLwi3kHYXVFDYgmBx1Q$97tM08979oJO1zlGHVUZIOdy+9qxvQ1yzvU6PeH4dmg', 'Shemar', 'Mosciski', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(24, 'Josianne_McCullough', 'Annette_Sanford63@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$/6inMegcYS2adUVcAQww+g$fBMwABOLQF8pzjaZEAeF9ZmBCp0q+BdWS+LGa/1+/Vk', 'Jess', 'Cummerata', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(25, 'Jody_Spinka', 'Kyleigh25@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$AytcffXeUYP6VMPoL55k0w$0tXrYm+NiRVu/TbD29h+XtYOMxjOkcMK2AZo4U4T1fw', 'Winston', 'Lowe', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(26, 'Nat.Halvorson72', 'Aurelio4@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$E1i2/nrzLawgRJKDTqctHA$x4K270+8rMNdYRQccVUSwDCC8J37w6L2QFyNX8B2s9c', 'Larissa', 'Roob', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(27, 'Mitchell62', 'Nicola91@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$MmfhXac0uyzjaz9BNnnpHA$sOHDUBOU21B0Sd0eJSGBFyPTL0GhD57Oi+ys4rGalwM', 'Jaunita', 'Hettinger', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(28, 'Ubaldo_Halvorson', 'Corrine37@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$PDURoVv7+WW/YQgH2SVtsg$RfQ7ufaW/7U1OodoxeKUDFmeGUKtqcaO4sAufa7wgNg', 'Vinnie', 'Cronin', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(29, 'Doug14', 'Marlin_Hand@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$t+fve1advBmyXt3z21nv8w$+Tn4qaQAggUmHM28G5ws/iuCmWT2c3P+9Ng5dXCWxRw', 'Arely', 'Schmidt-Reichert', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(30, 'Maia.Hane75', 'Pearline11@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$U62zfBTgnQdHa7FqVtaGRw$KxXG4N2B2iFwSBRA8F9ef+GQFAxmHl4xqfU87ylmLOE', 'Kyra', 'Leuschke', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(31, 'Bennett97', 'Samanta.Cruickshank29@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$694p4ndJ31Ww657ic/qCsQ$llLDoSn6EuCnUNwJ9iyDE8HmXKfEjlIFsYLb/mUzWTQ', 'Luciano', 'Murazik', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(32, 'Jocelyn_OConnell', 'Emilio78@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Bvtbc76VNTlvnUDWuMSq5g$Pc0lYI3lpdXuFa8GKoIukIu5OanSX62EbJVAa3KUFBQ', 'Rosalee', 'Abernathy', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(33, 'Natalie.Stehr26', 'Gwendolyn82@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$xR5L7GRx575c0pfSdLYCtw$OtAklVwmSYEBg/gCXyAzosaXoC9Ok21TuMpArWccqkY', 'Gerardo', 'Kemmer-Prosacco', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(34, 'Barry.Jacobs', 'Dayton.Vandervort@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$mc0R1EiKzt7VuSmuU3XAbg$Bb/wa/9kn8ifSosRZynl+iAhmFH/6SDPoHHG3pUos9I', 'Ray', 'Dicki', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(35, 'Alvena_Bechtelar', 'Xavier.Borer@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$xcSTCC1oSXgb8OOvE1DsSQ$27N8EFvTYg61dSrZWNShDMuCMO9diBPfpOCw8pmKiEY', 'Alta', 'Effertz', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(36, 'Brianne_Weissnat', 'Dale13@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$KpTn724IzD+tZZmjCpZgfw$gllO3f2CAYxRi8BY94z5iXuLKUhaOQ1dToduRO5AJ8g', 'Kallie', 'Johnston', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(37, 'Melba_DAmore', 'Fabiola_Mohr@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$/ST+hGw+2AbUjPAECTu9xQ$w0UNOpTxDaK0en5T8TA6+xzyYlOiadvkZm1eVPU0ktY', 'Novella', 'Cremin', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(38, 'Henriette_Langworth35', 'Celine_Hegmann45@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$ySwUE/kbbFWD5oETPURxQQ$iOg3WNUkSt1HNxb4tI02JSSKHr4lAF5ERyp9OMBcJcA', 'Earl', 'Roberts', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(39, 'Nikita0', 'Alanna60@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$5ZDIPkScUw0U8Mab9LJ73A$6xRCrCfF4aZuaEZVRTV/pmdlt7C8zjU8wEb4jKWtQGI', 'John', 'Grady', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(40, 'Orrin85', 'Devyn_Fisher90@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Ky0WXKvlxxiZjH4TS9zgig$OR57xKxAg8gYj/zs2XepW5y7/NNTX2QNU6uR4Pfx4BQ', 'Stephen', 'Schamberger', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(41, 'Gordon18', 'Rasheed_Jenkins@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$RJMTu7ya+vCHBo6W+qulcA$PIwFAe79bcMm3EQvKim6lZCC4drrCjAVBF+oP3EfCCE', 'Godfrey', 'Marks', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(42, 'Imogene87', 'Annabelle.Buckridge85@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$33oaw/O6UKuXTkYxu6StHw$gFWIuk1AX8L/aNqAT3hzhNqJSHe1zU8YtwZXs7vouqk', 'Dexter', 'Marquardt', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(43, 'Valentina.Effertz97', 'Quinn32@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$50dm9AFCuEU0pWBYrEoTCQ$Bxd2JDx0onOkHUdEo8aPRwANJgTHOppvM9yuM4bNjVA', 'Margarete', 'Hamill', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(44, 'Jeff34', 'Lelia.Baumbach59@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$pEyqnIjyVAvQzv6Jzv+N2A$kqKBLRsDMSNK1yzK9KJKiLFXsqPFbYFJGGkB/B4rxkY', 'Una', 'Steuber', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(45, 'Deven_Nicolas59', 'Elyssa57@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$lEeIpOxIsHpiMaTuLNFudA$KPFTaUa1zFsLA2kbIIcr6hS+rvWIyic/j1t4Ssq1FtY', 'Ashley', 'Jaskolski', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(46, 'Ocie.Auer78', 'Owen_Tillman26@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$JFOtLEdaLCKos/m7rZXCCw$3J8XkVxyE0o2KUWV6W4mzTcz70AKbZza5LzMu95ZlUY', 'Kara', 'Rogahn', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(47, 'Mason19', 'Roxane_Wuckert28@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$hzs2oDStJR+UEJe8lHJPqg$y8le/AsvKOy/lbZctEXS1HSBPeKwdjpek2wNo0+wKUM', 'Nora', 'Frami', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(48, 'Trace38', 'Charley.Bins@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$AzD9CJCq61QzfzRjA/nUWA$VcJndyMN4/EXN72Gep5dTAMf32WXmQrMceo7hVN9tWY', 'Nona', 'Champlin', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(49, 'Zander51', 'Breanne94@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$ekZy55XTyNLrWRnefNFBTg$cZyKXnE6+VhplawroSS/FmUYnZnAi0QX5wbbrkA3XSw', 'Wade', 'Nader', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(50, 'Abigale63', 'Isabelle.Stehr@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$UyHy+POfgsNf+8GZC9+WjA$qSptBNDAoL89bXP3dp720pejMGJ8frNhZupY9OFpe+I', 'Lowell', 'Paucek-Kessler', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(51, 'Testing Account', 'test@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$lQpPAlQQx3jtdLUIUprNnA$/E+JxspEarc4jjm22UQVU+ht1iTMjygr/bU1PJfWCpA', 'Testing', 'Account', '2023-10-23 07:28:29', '2023-10-23 07:28:29'),
(52, 'john@johnson.com', 'john@johnson.com', '$argon2id$v=19$m=65536,t=4,p=1$YXd5OHNDY0tuTmFEV1JrSw$idI2qiIdSHTU3NrU85feDeIJABs9unHtCyIV7DrW4EY', 'John', 'Johnson', '2023-11-06 07:48:24', '2023-11-06 07:48:24');

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
(1, 8, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1021.jpg', 'Cernuus auxilium aeger fugiat adulatio cimentarius ratione accusamus. Dolores vester undique conicio sodalitas odio. Aqua decumbo officia acervus callide tremo tutamen.', 'dark', 'text_fr'),
(2, 49, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/658.jpg', 'Tunc venio clibanus vestrum vir celo taceo temptatio. Crepusculum creptio tepesco arbitro amplexus voveo vero advenio conscendo. Aperte non beatus tribuo armarium velut caterva arcus centum.', 'dark', 'text_fr'),
(3, 12, 'https://avatars.githubusercontent.com/u/71769306', 'Credo accedo ciminatio aggredior colligo. Stabilis defetiscor illum maiores cernuus toties ascisco tergum. Ambulo cohaero hic vestigium traho cena.', 'light', 'text_nl'),
(4, 32, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1032.jpg', 'Crinis defero vetus adhuc. Sequi autus sulum cernuus usitas argentum torrens. Vado vilitas cubicularis suffragium est.', 'dark', 'text_nl'),
(5, 31, 'https://avatars.githubusercontent.com/u/7546630', 'Accusator enim corpus terreo depopulo porro vergo cras xiphias. Sub aestivus alii decens colligo auctor trepide. In abutor itaque cattus.', 'light', 'text_nl'),
(6, 25, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/572.jpg', 'Commodi ventus solvo alter incidunt delectatio creta sodalitas vitium comparo. Capitulus angustus damno territo via conicio curiositas aut. Arbor patria decet defaeco aestas cursus aegrus suppellex vinculum.', 'light', 'text_en'),
(7, 19, 'https://avatars.githubusercontent.com/u/7352551', 'Delibero cursim cohors triduana constans sordeo astrum degenero velut. Adipiscor atqui confugo sonitus cunae. Ulciscor soleo conicio caste nostrum allatus thymum brevis.', 'light', 'text_en'),
(8, 50, 'https://avatars.githubusercontent.com/u/50035333', 'Copiose somnus appono volva sumo. Demonstro absum turpis accommodo. Depulso conculco amitto deleniti sperno crapula sulum facere crebro defessus.', 'light', 'text_en'),
(9, 48, 'https://avatars.githubusercontent.com/u/70916545', 'Cornu atrocitas cupressus hic cultura tabesco. Cognatus cado paens abeo adamo curriculum undique hic vesper. Tum sunt clam velut.', 'dark', 'text_nl'),
(10, 46, 'https://avatars.githubusercontent.com/u/2071786', 'Uter titulus non desino cetera spectaculum cohaero vapulus trepide ademptio. Occaecati vitium video spoliatio. Crinis vesco comes confido.', 'light', 'text_nl'),
(11, 29, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/317.jpg', 'Tamen omnis tonsor esse eligendi ultio decor tener patrocinor bellum. Volup esse adsum vacuus adaugeo accendo aduro. Eveniet abstergo tempora.', 'light', 'text_nl'),
(12, 16, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1028.jpg', 'Clamo accusamus usque certe dapifer cruentus cometes. Summa ater at. Fuga ustulo nobis timidus reprehenderit vulnus damnatio aro demo constans.', 'light', 'text_fr'),
(13, 15, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/241.jpg', 'Utor quidem carbo dolore veritas cruciamentum vigor alo. Ulterius suggero umquam ustulo curto. Adulatio adstringo civis cras viriliter sto canonicus.', 'light', 'text_nl'),
(14, 1, 'https://avatars.githubusercontent.com/u/25824205', 'Stabilis sit curvo amplitudo demum vigilo fugiat cumque. Ullus valetudo cognomen omnis astrum vigor minima cunae cultellus. Aliquam sonitus amplexus congregatio.', 'dark', 'text_en'),
(15, 41, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/846.jpg', 'Villa sustineo fugiat approbo adinventitias. Varius capitulus thesis supellex via tabula est repellat deprimo ut. Aro curriculum crudelis crastinus laborum videlicet laborum cur vos illo.', 'light', 'text_nl'),
(16, 2, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/864.jpg', 'Delego adficio campana aptus adimpleo veniam claudeo unus. Vetus caterva angelus talio subnecto vapulus claro balbus cilicium id. Ocer desolo aspernatur tergeo vitium.', 'light', 'text_nl'),
(17, 14, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/412.jpg', 'Xiphias deleniti sodalitas modi brevis occaecati. Ter vilicus casus coaegresco. Provident aufero canonicus sublime bene tui animus tepesco.', 'dark', 'text_fr'),
(18, 27, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/434.jpg', 'Urbanus modi vel tripudio. Maxime inflammatio dolor vomer caterva arma officiis agnitio stabilis delinquo. Somniculosus cubitum utroque nisi centum deludo acquiro voveo cometes vesica.', 'dark', 'text_en'),
(19, 13, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1069.jpg', 'Tandem commodi adversus volubilis. Campana spiculum dedecor soluta. Deputo copia volubilis.', 'dark', 'text_en'),
(20, 22, 'https://avatars.githubusercontent.com/u/5338160', 'Aptus crinis velociter nam. Absens solvo ex omnis conspergo acidus communis aestas vetus animadverto. Cattus sustineo caries turbo eaque casso.', 'light', 'text_en'),
(21, 17, 'https://avatars.githubusercontent.com/u/47322296', 'Sumo cilicium deinde cur studio accommodo tredecim iure talis nostrum. Aufero pectus somniculosus caritas. Adopto laudantium voluptates acidus suscipit appono pariatur collum ulterius ustilo.', 'dark', 'text_en'),
(22, 3, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/387.jpg', 'Cui acerbitas cognomen creator autus cetera canto. Reiciendis cresco advenio. Tabgo creator vigor solium depulso tempora arguo cumque solitudo amaritudo.', 'light', 'text_fr'),
(23, 34, 'https://avatars.githubusercontent.com/u/9285728', 'Ventito colo curriculum valens virgo maxime tepesco umquam. Timor depono amitto canis ambitus callide sub. Ultio cohibeo adhaero avarus architecto soleo.', 'dark', 'text_en'),
(24, 42, 'https://avatars.githubusercontent.com/u/80713173', 'Caelestis crustulum solio tabernus cotidie. Commodo cui textor cotidie astrum ars cicuta succurro hic arcus. Ante vulgaris tendo sufficio apud deporto celer cimentarius cruciamentum ratione.', 'dark', 'text_en'),
(25, 30, 'https://avatars.githubusercontent.com/u/72097539', 'Desolo aeternus cupiditate demonstro amet sperno. Vel talus ex thesaurus ipsum cursim confugo currus corrumpo dolorem. Maxime arbitro cicuta voveo vero cupio aliqua ante.', 'dark', 'text_en'),
(26, 18, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/688.jpg', 'Delectatio cenaculum toties volup atrox sordeo. Eius truculenter cupressus aperio ciminatio denego teneo viscus conculco crur. Surculus circumvenio calco amiculum speciosus clementia cunae quidem.', 'dark', 'text_en'),
(27, 7, 'https://avatars.githubusercontent.com/u/95355633', 'Benevolentia nesciunt vinco appono undique capitulus varietas molestias culpa. Tamquam totam tersus villa delego dens. Verbera nihil solitudo natus.', 'light', 'text_fr'),
(28, 26, 'https://avatars.githubusercontent.com/u/41687940', 'Vitium tener vigilo voluntarius comis delibero statim volaticus aer. Adipiscor voro cariosus tristis cimentarius. Civis cunae conitor subnecto stella.', 'light', 'text_fr'),
(29, 20, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1205.jpg', 'Denique aptus celo alioqui catena vindico. Succedo contra ambitus depopulo. Avaritia texo vespillo audeo.', 'light', 'text_nl'),
(30, 21, 'https://avatars.githubusercontent.com/u/77840587', 'Cito velut suadeo. Aeger vindico defero alii suasoria. Adsidue vigilo eum.', 'light', 'text_nl'),
(31, 24, 'https://avatars.githubusercontent.com/u/46370705', 'Denuncio denego ocer magni decipio cura triumphus sursum recusandae. Clarus debitis libero vereor vetus cognomen tolero distinctio stips decimus. Beatus debeo tribuo.', 'dark', 'text_fr'),
(32, 23, 'https://avatars.githubusercontent.com/u/90383336', 'Atavus tero triumphus. Umquam audio nemo absque. Repudiandae abutor crebro averto.', 'light', 'text_fr'),
(33, 5, 'https://avatars.githubusercontent.com/u/91661057', 'Textor considero peior sperno succurro terminatio verumtamen curo patrocinor. Thalassinus demonstro depulso stips defaeco correptius dicta absque cumque. Atrocitas vitiosus canis commodi amplus cimentarius.', 'light', 'text_fr'),
(34, 28, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/46.jpg', 'Titulus ater cervus. Aequitas cimentarius vomica admiratio tersus. Pariatur architecto correptius minima quibusdam causa assentator laboriosam aequus.', 'light', 'text_nl'),
(35, 40, 'https://avatars.githubusercontent.com/u/24037274', 'Vulgaris alius velit. Utrimque caterva quisquam coerceo cruciamentum amo. Assumenda somnus umbra sopor aurum versus.', 'light', 'text_en'),
(36, 33, 'https://avatars.githubusercontent.com/u/12928656', 'Quaerat tui caries appositus summa crustulum sursum utroque tersus. Cubitum caritas ea aperte amo tyrannus et. Facilis amplitudo vinum attonbitus debeo dedecor chirographum.', 'dark', 'text_fr'),
(37, 4, 'https://avatars.githubusercontent.com/u/74611853', 'Nisi clam arx denego nobis accusator deinde delicate comparo virtus. Traho clam cuius alias caveo officiis basium. Culpo veniam acer terreo sonitus tametsi.', 'light', 'text_en'),
(38, 45, 'https://avatars.githubusercontent.com/u/53389536', 'Caritas suffragium vorax aggredior succedo conturbo nam aliquam aestivus aliqua. Tempora adsuesco comminor voluptates cognatus ter cilicium timidus crastinus quod. Aegrus urbs repellendus adulescens conitor concedo curo sumptus sui.', 'dark', 'text_fr'),
(39, 9, 'https://avatars.githubusercontent.com/u/38565169', 'Ea calculus utpote tum sumptus. Tolero tripudio vitiosus eaque adopto quia ut. Saepe paens ulterius deficio aeneus.', 'dark', 'text_nl'),
(40, 43, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/60.jpg', 'Delicate deputo creptio stipes carmen abscido. Cometes dens sol assumenda caveo tabula infit. Optio canis contego volva recusandae ara culpo demoror vinitor.', 'light', 'text_nl'),
(41, 39, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/331.jpg', 'Odit terebro abscido vox sufficio conor comparo defendo laboriosam xiphias. Aperio turbo atrox temeritas ullam amaritudo clibanus. Virgo texo vomica anser ante.', 'light', 'text_fr'),
(42, 37, 'https://avatars.githubusercontent.com/u/20866664', 'Cras carbo vox. Contabesco vester aetas delicate aveho. Utor talus suppellex velit adamo compello calculus veritatis sustineo attonbitus.', 'dark', 'text_nl'),
(43, 44, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1147.jpg', 'Articulus ciminatio triduana verbum. Peccatus condico sufficio depopulo defaeco crapula coruscus blandior. Cimentarius vomito toties conicio adipiscor surgo versus inventore tamquam.', 'light', 'text_fr'),
(44, 11, 'https://avatars.githubusercontent.com/u/85246423', 'Aut addo soluta temporibus venustas baiulus. Suus vestigium turba vicinus ustulo ocer contra cimentarius cogo. Trans patria arbustum titulus repellat victus tui bardus.', 'light', 'text_nl'),
(45, 36, 'https://avatars.githubusercontent.com/u/67456980', 'Accusamus vulariter adipiscor canto voro demonstro coepi. Sortitus viscus amicitia textor cupressus appello cumque atqui. Absconditus aliquid suadeo surculus auxilium autus doloremque.', 'light', 'text_fr'),
(46, 38, 'https://avatars.githubusercontent.com/u/13284479', 'Capitulus supplanto attollo est patria dolores corrumpo speculum deleo. Minus spiculum deleniti tenax urbanus tergiversatio. Celo attero ter celer suppellex cariosus assentator.', 'light', 'text_fr'),
(47, 47, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/601.jpg', 'Cicuta capio sub varietas vulgus utpote compono suspendo supra vulariter. Amiculum atrox cunctatio. Alius combibo artificiose.', 'light', 'text_en'),
(48, 6, 'https://avatars.githubusercontent.com/u/76354036', 'Aperte tenus terga nam pecus cohaero adhuc stipes. Vis degenero ars sed delectatio decet. Illum virgo similique communis excepturi deputo temptatio venia suspendo aegre.', 'dark', 'text_en'),
(49, 10, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/617.jpg', 'Ceno pecto vis articulus carus vespillo vox annus aliqua. Cupressus atqui sto caveo aspernatur vel. Tametsi tredecim voluptatem claustrum aestas ambulo creptio.', 'dark', 'text_en'),
(50, 35, 'https://avatars.githubusercontent.com/u/90640552', 'Surgo derideo pel aetas culpo laudantium subvenio vitium cuius. At tracto cauda tot iste curvo pectus. Damnatio aqua usus tenuis.', 'light', 'text_en'),
(51, 51, 'https://avatars.githubusercontent.com/u/88485627', 'Testing Account', 'light', 'text_en'),
(52, 52, 'https://avatars.githubusercontent.com/u/64209400?v=4', 'Hello!', 'light', 'text_en');

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
(27, '2023-10-14 00:00:00', 3, 452, 'Oriental Metal Fish', 'https://picsum.photos/seed/2WK8WlL/640/480'),
(32, '2023-09-24 00:00:00', 37, 489, 'Modern Metal Mouse', 'https://loremflickr.com/640/480?lock=850329245581312'),
(36, '2023-10-20 00:00:00', 10, 837, 'Fantastic Cotton Cheese', 'https://loremflickr.com/640/480?lock=2706854935265280'),
(38, '2023-10-02 00:00:00', 22, 953, 'Rustic Cotton Car', 'https://picsum.photos/seed/lbdF2LgT/640/480'),
(46, '2023-10-05 00:00:00', 36, 621, 'Recycled Wooden Chips', 'https://loremflickr.com/640/480?lock=6386649904709632'),
(42, '2023-09-26 00:00:00', 11, 369, 'Generic Bronze Salad', 'https://picsum.photos/seed/n4M4hsPk/640/480'),
(32, '2023-10-02 00:00:00', 11, 875, 'Tasty Frozen Keyboard', 'https://loremflickr.com/640/480?lock=7267715442016256'),
(38, '2023-10-05 00:00:00', 3, 328, 'Practical Frozen Sausages', 'https://picsum.photos/seed/eQi5Nj7/640/480'),
(17, '2023-10-04 00:00:00', 6, 116, 'Licensed Rubber Fish', 'https://loremflickr.com/640/480?lock=1031570076991488'),
(23, '2023-09-30 00:00:00', 49, 853, 'Unbranded Fresh Towels', 'https://picsum.photos/seed/R8ML0Ub/640/480'),
(21, '2023-10-04 00:00:00', 21, 186, 'Awesome Wooden Keyboard', 'https://loremflickr.com/640/480?lock=5519156518584320'),
(48, '2023-09-23 00:00:00', 17, 952, 'Practical Granite Fish', 'https://loremflickr.com/640/480?lock=7408558964473856'),
(36, '2023-10-23 00:00:00', 26, 933, 'Incredible Frozen Sausages', 'https://picsum.photos/seed/1xv775uA/640/480'),
(26, '2023-10-21 00:00:00', 47, 731, 'Electronic Rubber Shoes', 'https://picsum.photos/seed/YCebJq/640/480'),
(43, '2023-10-20 00:00:00', 20, 326, 'Oriental Cotton Gloves', 'https://picsum.photos/seed/LxcfUL/640/480'),
(40, '2023-10-07 00:00:00', 3, 890, 'Fantastic Granite Mouse', 'https://picsum.photos/seed/sBgRNh/640/480'),
(12, '2023-10-13 00:00:00', 4, 530, 'Handcrafted Cotton Soap', 'https://picsum.photos/seed/G61K8Zb8M/640/480'),
(36, '2023-10-17 00:00:00', 2, 472, 'Fantastic Wooden Cheese', 'https://loremflickr.com/640/480?lock=8116906835836928'),
(44, '2023-10-06 00:00:00', 22, 312, 'Licensed Rubber Ball', 'https://picsum.photos/seed/6Vz8u1sdau/640/480'),
(38, '2023-09-26 00:00:00', 5, 714, 'Fantastic Soft Mouse', 'https://picsum.photos/seed/gGAEE43Lnk/640/480'),
(11, '2023-10-13 00:00:00', 8, 827, 'Luxurious Bronze Chips', 'https://loremflickr.com/640/480?lock=8314029934116864'),
(26, '2023-10-06 00:00:00', 6, 684, 'Generic Soft Chair', 'https://picsum.photos/seed/zAXm0/640/480'),
(41, '2023-10-18 00:00:00', 43, 754, 'Sleek Granite Bacon', 'https://picsum.photos/seed/rkLVf/640/480'),
(28, '2023-09-25 00:00:00', 35, 28, 'Unbranded Soft Pizza', 'https://picsum.photos/seed/6jm07/640/480'),
(40, '2023-10-15 00:00:00', 50, 124, 'Intelligent Bronze Chips', 'https://loremflickr.com/640/480?lock=7468365119488'),
(34, '2023-10-04 00:00:00', 49, 841, 'Tasty Bronze Shoes', 'https://loremflickr.com/640/480?lock=162935387193344'),
(38, '2023-10-14 00:00:00', 30, 971, 'Small Steel Hat', 'https://picsum.photos/seed/TDSmWWUrvL/640/480'),
(28, '2023-10-16 00:00:00', 19, 475, 'Bespoke Soft Bike', 'https://loremflickr.com/640/480?lock=2999823997337600'),
(19, '2023-10-22 00:00:00', 30, 490, 'Intelligent Granite Cheese', 'https://picsum.photos/seed/kJ9hnuzGX/640/480'),
(31, '2023-10-18 00:00:00', 30, 401, 'Handmade Plastic Cheese', 'https://loremflickr.com/640/480?lock=6063983704408064'),
(6, '2023-10-10 00:00:00', 2, 510, 'Modern Fresh Tuna', 'https://picsum.photos/seed/kdS9WCC/640/480'),
(15, '2023-10-22 00:00:00', 1, 839, 'Oriental Steel Table', 'https://picsum.photos/seed/CnUU2G3GNi/640/480'),
(31, '2023-10-08 00:00:00', 22, 464, 'Gorgeous Bronze Car', 'https://picsum.photos/seed/oN1o6b6N/640/480'),
(35, '2023-10-22 00:00:00', 7, 651, 'Practical Bronze Chair', 'https://picsum.photos/seed/GGvp0/640/480'),
(10, '2023-10-10 00:00:00', 30, 684, 'Modern Bronze Keyboard', 'https://loremflickr.com/640/480?lock=2750362809270272'),
(48, '2023-10-05 00:00:00', 17, 307, 'Sleek Plastic Shoes', 'https://loremflickr.com/640/480?lock=8743877938774016'),
(18, '2023-10-10 00:00:00', 22, 356, 'Sleek Metal Pants', 'https://picsum.photos/seed/YgBtHmW/640/480'),
(4, '2023-10-01 00:00:00', 25, 598, 'Modern Rubber Pizza', 'https://loremflickr.com/640/480?lock=2372826510131200'),
(27, '2023-09-30 00:00:00', 1, 448, 'Unbranded Rubber Shoes', 'https://picsum.photos/seed/Fo4Z4K7/640/480'),
(20, '2023-10-23 00:00:00', 27, 232, 'Unbranded Granite Car', 'https://loremflickr.com/640/480?lock=391159662772224'),
(43, '2023-10-14 00:00:00', 23, 178, 'Awesome Rubber Pizza', 'https://picsum.photos/seed/DKjuMhpGu/640/480'),
(12, '2023-10-19 00:00:00', 25, 476, 'Handmade Fresh Tuna', 'https://picsum.photos/seed/RcGMcdQv/640/480'),
(26, '2023-10-15 00:00:00', 33, 493, 'Licensed Steel Soap', 'https://picsum.photos/seed/ax4l2j2/640/480'),
(25, '2023-10-07 00:00:00', 12, 613, 'Practical Fresh Tuna', 'https://picsum.photos/seed/HJLISqpTtC/640/480'),
(7, '2023-10-04 00:00:00', 35, 810, 'Handcrafted Soft Ball', 'https://loremflickr.com/640/480?lock=6015119473508352'),
(18, '2023-10-15 00:00:00', 16, 814, 'Refined Bronze Pizza', 'https://picsum.photos/seed/ybcgU026vf/640/480'),
(40, '2023-10-16 00:00:00', 32, 60, 'Oriental Granite Sausages', 'https://picsum.photos/seed/WkBepArkq/640/480'),
(4, '2023-09-24 00:00:00', 24, 16, 'Elegant Plastic Fish', 'https://picsum.photos/seed/xZ327qSars/640/480'),
(30, '2023-10-03 00:00:00', 8, 843, 'Oriental Fresh Shoes', 'https://picsum.photos/seed/tYoD4tld/640/480'),
(20, '2023-10-15 00:00:00', 43, 562, 'Oriental Plastic Computer', 'https://picsum.photos/seed/iqCJ8kF/640/480'),
(13, '2023-10-07 00:00:00', 6, 756, 'Sleek Fresh Bike', 'https://picsum.photos/seed/vjq348/640/480'),
(24, '2023-10-17 00:00:00', 26, 573, 'Rustic Frozen Pants', 'https://picsum.photos/seed/illUWIJFv/640/480'),
(12, '2023-10-23 00:00:00', 44, 8, 'Oriental Concrete Bacon', 'https://loremflickr.com/640/480?lock=2661679552790528'),
(20, '2023-09-28 00:00:00', 3, 230, 'Awesome Concrete Tuna', 'https://picsum.photos/seed/Hct808/640/480'),
(25, '2023-10-15 00:00:00', 46, 215, 'Intelligent Concrete Salad', 'https://picsum.photos/seed/CbOk4I/640/480'),
(10, '2023-09-24 00:00:00', 32, 500, 'Rustic Wooden Gloves', 'https://loremflickr.com/640/480?lock=6642684898836480'),
(23, '2023-09-29 00:00:00', 25, 390, 'Electronic Wooden Tuna', 'https://loremflickr.com/640/480?lock=2723540520402944'),
(46, '2023-10-15 00:00:00', 40, 580, 'Recycled Bronze Shoes', 'https://loremflickr.com/640/480?lock=3859027912032256'),
(42, '2023-10-11 00:00:00', 34, 873, 'Rustic Fresh Shoes', 'https://loremflickr.com/640/480?lock=3313372024012800'),
(46, '2023-09-28 00:00:00', 44, 820, 'Licensed Metal Chicken', 'https://loremflickr.com/640/480?lock=7384082231066624'),
(32, '2023-10-01 00:00:00', 23, 843, 'Electronic Frozen Ball', 'https://loremflickr.com/640/480?lock=2975035012677632'),
(9, '2023-10-19 00:00:00', 2, 299, 'Luxurious Wooden Soap', 'https://loremflickr.com/640/480?lock=269770542809088'),
(16, '2023-10-11 00:00:00', 14, 344, 'Fantastic Granite Salad', 'https://loremflickr.com/640/480?lock=8108756766294016'),
(15, '2023-10-03 00:00:00', 35, 296, 'Oriental Steel Shirt', 'https://loremflickr.com/640/480?lock=2585982589206528'),
(17, '2023-09-27 00:00:00', 49, 78, 'Generic Cotton Sausages', 'https://loremflickr.com/640/480?lock=6300145987616768'),
(23, '2023-09-26 00:00:00', 22, 547, 'Ergonomic Steel Ball', 'https://picsum.photos/seed/9RDHwd/640/480'),
(13, '2023-10-05 00:00:00', 44, 483, 'Handcrafted Plastic Ball', 'https://loremflickr.com/640/480?lock=1504194922020864'),
(49, '2023-10-13 00:00:00', 14, 353, 'Unbranded Steel Shirt', 'https://picsum.photos/seed/KuzBP2Ices/640/480'),
(45, '2023-10-19 00:00:00', 45, 524, 'Ergonomic Plastic Tuna', 'https://picsum.photos/seed/ONyXf/640/480'),
(27, '2023-10-21 00:00:00', 36, 330, 'Elegant Bronze Chips', 'https://picsum.photos/seed/yh9ZN/640/480'),
(40, '2023-10-12 00:00:00', 41, 419, 'Electronic Rubber Ball', 'https://picsum.photos/seed/iYIuBjDxPY/640/480'),
(14, '2023-09-29 00:00:00', 24, 822, 'Recycled Granite Sausages', 'https://picsum.photos/seed/DQbWW/640/480'),
(5, '2023-09-26 00:00:00', 37, 501, 'Rustic Steel Bike', 'https://picsum.photos/seed/4NKHm/640/480'),
(20, '2023-10-14 00:00:00', 34, 845, 'Oriental Steel Cheese', 'https://picsum.photos/seed/bXnSJxK/640/480'),
(20, '2023-09-27 00:00:00', 2, 926, 'Practical Concrete Tuna', 'https://picsum.photos/seed/W7Qj4F7j/640/480'),
(10, '2023-09-27 00:00:00', 38, 369, 'Refined Concrete Cheese', 'https://loremflickr.com/640/480?lock=5246363847622656'),
(42, '2023-10-01 00:00:00', 18, 50, 'Oriental Metal Table', 'https://loremflickr.com/640/480?lock=7861930605674496'),
(22, '2023-09-29 00:00:00', 47, 23, 'Small Steel Fish', 'https://picsum.photos/seed/eGgqw/640/480'),
(46, '2023-10-17 00:00:00', 18, 403, 'Fantastic Steel Pants', 'https://loremflickr.com/640/480?lock=34028530958336'),
(28, '2023-09-25 00:00:00', 10, 203, 'Incredible Bronze Shoes', 'https://loremflickr.com/640/480?lock=2729417776300032'),
(31, '2023-09-26 00:00:00', 50, 657, 'Small Rubber Chair', 'https://loremflickr.com/640/480?lock=4237952477560832'),
(25, '2023-10-10 00:00:00', 11, 882, 'Ergonomic Plastic Keyboard', 'https://loremflickr.com/640/480?lock=6364663447027712'),
(27, '2023-10-19 00:00:00', 18, 670, 'Electronic Plastic Shoes', 'https://picsum.photos/seed/QVQkiE2Lm/640/480'),
(8, '2023-10-14 00:00:00', 25, 814, 'Licensed Concrete Pants', 'https://loremflickr.com/640/480?lock=4937949164601344'),
(44, '2023-10-17 00:00:00', 27, 256, 'Generic Rubber Pants', 'https://picsum.photos/seed/BRkQD/640/480'),
(2, '2023-09-23 00:00:00', 19, 26, 'Handcrafted Metal Mouse', 'https://loremflickr.com/640/480?lock=2826904151261184'),
(4, '2023-10-04 00:00:00', 12, 137, 'Awesome Fresh Towels', 'https://picsum.photos/seed/ooELZF/640/480'),
(13, '2023-10-10 00:00:00', 3, 945, 'Bespoke Plastic Towels', 'https://picsum.photos/seed/orCIgzsXPR/640/480'),
(42, '2023-10-04 00:00:00', 6, 507, 'Modern Bronze Chair', 'https://picsum.photos/seed/dxIeJe5S/640/480'),
(15, '2023-10-19 00:00:00', 45, 322, 'Licensed Steel Bacon', 'https://picsum.photos/seed/oZ49c/640/480'),
(22, '2023-09-23 00:00:00', 39, 261, 'Modern Fresh Bacon', 'https://picsum.photos/seed/WlUrDiJo6N/640/480'),
(40, '2023-10-09 00:00:00', 49, 546, 'Sleek Soft Computer', 'https://loremflickr.com/640/480?lock=8382075247788032'),
(3, '2023-09-24 00:00:00', 20, 529, 'Gorgeous Frozen Gloves', 'https://loremflickr.com/640/480?lock=6952204191662080'),
(48, '2023-10-19 00:00:00', 20, 478, 'Bespoke Fresh Pants', 'https://loremflickr.com/640/480?lock=3051837852745728'),
(41, '2023-10-14 00:00:00', 31, 103, 'Awesome Soft Soap', 'https://loremflickr.com/640/480?lock=1013841020321792'),
(2, '2023-10-17 00:00:00', 9, 681, 'Small Soft Car', 'https://picsum.photos/seed/PEEH6/640/480'),
(22, '2023-10-04 00:00:00', 21, 421, 'Awesome Concrete Pizza', 'https://picsum.photos/seed/d0RPfGFlk6/640/480'),
(5, '2023-10-03 00:00:00', 46, 962, 'Incredible Wooden Chair', 'https://loremflickr.com/640/480?lock=756134147260416'),
(31, '2023-10-08 00:00:00', 22, 791, 'Generic Wooden Cheese', 'https://picsum.photos/seed/DHB18/640/480'),
(40, '2023-10-11 00:00:00', 5, 194, 'Incredible Cotton Chips', 'https://loremflickr.com/640/480?lock=3242910237589504'),
(51, '2023-10-08 22:02:32', 38, 859, 'Generic Frozen Towels', 'https://loremflickr.com/640/480?lock=3494130598543360');

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
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT voor een tabel `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT voor een tabel `bids`
--
ALTER TABLE `bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `bidshistory`
--
ALTER TABLE `bidshistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `notification_read`
--
ALTER TABLE `notification_read`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `products`
-- AUTO_INCREMENT voor een tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT voor een tabel `product_categories`
-- AUTO_INCREMENT voor een tabel `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 06 okt 2023 om 15:25
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
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `products`
--

INSERT INTO `products` (`id`, `userid`, `categoryid`, `name`, `description`, `price`, `imageUrl`, `updatedAt`, `createdAt`) VALUES
(1, 24, 15, 'Rustic Granite Soap', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 962.00, 'https://picsum.photos/seed/agNRHhy/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(2, 4, 20, 'Tasty Frozen Bacon', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 421.00, 'https://picsum.photos/seed/vkaqU/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(3, 17, 1, 'Rustic Soft Towels', 'The Football Is Good For Training And Recreational Purposes', 610.00, 'https://picsum.photos/seed/WaE4GE7I/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(4, 43, 1, 'Oriental Cotton Sausages', 'The Football Is Good For Training And Recreational Purposes', 114.00, 'https://picsum.photos/seed/x1ReqDwTO0/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(5, 9, 7, 'Handcrafted Concrete Keyboard', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 434.00, 'https://picsum.photos/seed/lq99q8/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(6, 34, 3, 'Intelligent Plastic Sausages', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 263.00, 'https://picsum.photos/seed/Lfc0n/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(7, 22, 7, 'Sleek Frozen Shirt', 'The Football Is Good For Training And Recreational Purposes', 882.00, 'https://picsum.photos/seed/xOWEQSCfo/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(8, 27, 21, 'Sleek Concrete Computer', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 282.00, 'https://picsum.photos/seed/O6HtYrfM/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(9, 20, 11, 'Luxurious Plastic Shoes', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 211.00, 'https://picsum.photos/seed/98gojVW/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(10, 49, 14, 'Intelligent Frozen Keyboard', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 254.00, 'https://picsum.photos/seed/ibFCS/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(11, 29, 6, 'Tasty Frozen Shirt', 'The Football Is Good For Training And Recreational Purposes', 349.00, 'https://picsum.photos/seed/QT5uWNon/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(12, 2, 5, 'Bespoke Granite Chips', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 11.00, 'https://picsum.photos/seed/7kj48j/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(13, 46, 7, 'Practical Bronze Salad', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 87.00, 'https://picsum.photos/seed/i5sj3vM/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(14, 39, 3, 'Awesome Rubber Salad', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 594.00, 'https://picsum.photos/seed/6shvF8/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(15, 38, 13, 'Unbranded Plastic Hat', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 508.00, 'https://picsum.photos/seed/UQg9mMiz/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(16, 8, 21, 'Incredible Rubber Chair', 'The Football Is Good For Training And Recreational Purposes', 719.00, 'https://picsum.photos/seed/9yL67W7/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(17, 31, 8, 'Elegant Wooden Chair', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 902.00, 'https://picsum.photos/seed/yT0Nozd8A/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(18, 12, 21, 'Licensed Steel Car', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 363.00, 'https://picsum.photos/seed/IU8UJ/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(19, 40, 4, 'Oriental Steel Pants', 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 590.00, 'https://picsum.photos/seed/ux8dGsw/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(20, 7, 8, 'Rustic Steel Computer', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 23.00, 'https://picsum.photos/seed/ZuuKyQhd9m/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(21, 3, 22, 'Electronic Concrete Soap', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 362.00, 'https://picsum.photos/seed/wpqbWZA/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(22, 37, 19, 'Oriental Wooden Sausages', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 375.00, 'https://picsum.photos/seed/j7zsbzjNZ/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(23, 47, 8, 'Intelligent Wooden Chair', 'The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J', 36.00, 'https://picsum.photos/seed/5FaVrss/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(24, 21, 12, 'Generic Cotton Computer', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 874.00, 'https://picsum.photos/seed/fkZuGL0/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(25, 1, 21, 'Oriental Metal Gloves', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 401.00, 'https://picsum.photos/seed/9melp7K/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(26, 32, 3, 'Small Bronze Computer', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 94.00, 'https://picsum.photos/seed/07Rtb/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(27, 11, 19, 'Intelligent Steel Fish', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 603.00, 'https://picsum.photos/seed/ZPogMP9Z/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(28, 18, 19, 'Rustic Soft Bike', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 460.00, 'https://picsum.photos/seed/E5Kgjx4h5z/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(29, 41, 7, 'Elegant Metal Chair', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 538.00, 'https://picsum.photos/seed/Nu2lZ8nrW/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(30, 10, 21, 'Oriental Fresh Chicken', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 492.00, 'https://picsum.photos/seed/mcnw18/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(31, 35, 5, 'Ergonomic Bronze Chicken', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 359.00, 'https://picsum.photos/seed/HPpG9HyY5f/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(32, 19, 13, 'Bespoke Plastic Fish', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 851.00, 'https://picsum.photos/seed/nSFJdmP0/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(33, 42, 5, 'Electronic Granite Table', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 522.00, 'https://picsum.photos/seed/OHCZ9dY4/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(34, 45, 21, 'Licensed Granite Shirt', 'Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support', 531.00, 'https://picsum.photos/seed/k1ZqWNKsy/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(35, 23, 14, 'Small Bronze Hat', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 292.00, 'https://picsum.photos/seed/sQPGoFEpUS/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(36, 30, 14, 'Licensed Metal Cheese', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 89.00, 'https://picsum.photos/seed/HnJ07uZre/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(37, 36, 9, 'Tasty Bronze Shirt', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 213.00, 'https://picsum.photos/seed/q9bC5Y/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(38, 15, 1, 'Sleek Metal Chips', 'Boston\'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles', 258.00, 'https://picsum.photos/seed/2VSTWj2KKp/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(39, 14, 19, 'Luxurious Steel Soap', 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 950.00, 'https://picsum.photos/seed/7sttnKwv0H/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(40, 13, 8, 'Ergonomic Cotton Pizza', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 512.00, 'https://picsum.photos/seed/27Xi6ZOX/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(41, 48, 10, 'Handcrafted Frozen Salad', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 662.00, 'https://picsum.photos/seed/ZZMJ2yKA44/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(42, 50, 3, 'Fantastic Rubber Chair', 'New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016', 550.00, 'https://picsum.photos/seed/WYwRdGF/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(43, 28, 16, 'Modern Steel Bacon', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 124.00, 'https://picsum.photos/seed/AnqNW6o6/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(44, 6, 21, 'Unbranded Wooden Computer', 'Carbonite web goalkeeper gloves are ergonomically designed to give easy fit', 842.00, 'https://picsum.photos/seed/Fuh8fz7AmX/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(45, 25, 9, 'Sleek Frozen Mouse', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 820.00, 'https://picsum.photos/seed/JPJAg/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(46, 16, 7, 'Recycled Steel Table', 'New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart', 624.00, 'https://picsum.photos/seed/lRbqOgDNH/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(47, 5, 13, 'Elegant Soft Towels', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 221.00, 'https://picsum.photos/seed/IJa8pwRqY/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(48, 26, 3, 'Luxurious Fresh Soap', 'The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality', 830.00, 'https://picsum.photos/seed/Xo6w4J/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(49, 44, 2, 'Oriental Soft Sausages', 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 270.00, 'https://picsum.photos/seed/U4QIoGLgy/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(50, 33, 3, 'Oriental Frozen Pizza', 'The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients', 197.00, 'https://picsum.photos/seed/3XRrTk/640/480', '2023-10-02 20:31:41', '2023-10-02 20:31:41');

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
(10, 'Automotive'),
(19, 'Baby'),
(17, 'Beauty'),
(7, 'Books'),
(9, 'Clothing'),
(15, 'Computers'),
(4, 'Electronics'),
(14, 'Games'),
(11, 'Garden'),
(5, 'Grocery'),
(2, 'Health'),
(22, 'Home'),
(21, 'Industrial'),
(8, 'Jewelery'),
(20, 'Kids'),
(18, 'Movies'),
(3, 'Music'),
(1, 'Outdoors'),
(16, 'Shoes'),
(6, 'Sports'),
(12, 'Tools'),
(13, 'Toys');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `translation`
--

CREATE TABLE `translation` (
  `id` int(11) NOT NULL,
  `location` text DEFAULT NULL,
  `text_en` text NOT NULL DEFAULT 'UNAVAILABLE',
  `text_nl` text NOT NULL DEFAULT 'ONBESCHIKBAAR',
  `text_fr` text NOT NULL DEFAULT 'INDISPONIBLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `translation`
--

INSERT INTO `translation` (`id`, `location`, `text_en`, `text_nl`, `text_fr`) VALUES
(0, '***DISCLAIMER***', 'DO NOT DELETE ANY RECORDS IN THIS TABLE', 'DONT DELETE ANY', 'AT ALL'),
(1, 'nav', '2nd-chance auctions', '2dekans veilingen', '2ème-chance enchères'),
(2, 'nav', 'Log out', 'Log uit', 'Se déconnecter'),
(3, 'footer', 'Services', 'Diensten', 'Service'),
(4, 'footer', 'UNAVAILABLE', 'Branding', 'INDISPONIBLE'),
(5, 'footer', 'UNAVAILABLE', 'Ontwerp', 'INDISPONIBLE'),
(6, 'footer', 'UNAVAILABLE', 'Marketing', 'INDISPONIBLE'),
(7, 'footer', 'UNAVAILABLE', 'Advertentie', 'INDISPONIBLE'),
(8, 'footer', 'Business', 'Bedrijf', 'Enterprise'),
(9, 'footer', 'UNAVAILABLE', 'Over ons', 'INDISPONIBLE'),
(10, 'footer', 'Contact', 'Contact', 'INDISPONIBLE'),
(11, 'footer', 'UNAVAILABLE', 'Vacatures', 'INDISPONIBLE'),
(12, 'footer', 'UNAVAILABLE', 'Perskit', 'INDISPONIBLE'),
(13, 'footer', 'UNAVAILABLE', 'Juridisch', 'INDISPONIBLE'),
(14, 'footer', 'Terms', 'Gebruiksvoorwaarden', 'INDISPONIBLE'),
(15, 'footer', 'UNAVAILABLE', 'Privacybeleid', 'Politique de confidentialité'),
(16, 'footer', 'UNAVAILABLE', 'Cookiebeleid', 'INDISPONIBLE'),
(17, 'nav', 'Auctions', 'Veilingen', 'Enchères'),
(22, 'nav', 'Location', 'Locatie', 'Emplacement'),
(23, 'nav', 'Products', 'Producten', 'Produits');

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
(1, 'Adrienne_Sporer61', 'Vivianne.Hintz88@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$OJToSvl15eFWO/92gxWnyA$LSIuipKvg/7TkAmxIS1mlShOc5haofNPRegUpQlJ2mc', 'Zechariah', 'Bins', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(2, 'Rico_Bartoletti57', 'Joy_Miller22@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$683fZMsvPVjnwTnpemz7uA$pP7jqPJ7hd6gNC+42IbPETSdPQn2XGEvlz264nOlZ2Q', 'Hortense', 'White', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(3, 'Martina.Kuphal42', 'Erick_Wolf89@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$cM4r/hhfjnxqLsCtPM1wCQ$SwheGMFaC3xDy9/wBxL74lqGqFILtkwAkgkdTlhhhJ4', 'Chaim', 'Hegmann', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(4, 'Maximillia_Langworth78', 'Amaya26@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$x7NX8w94M7DGKpjZukOGHQ$by6eDLqOLVIcR7cMnBsvtnoCOvACXVj+K2+ZvjN8amU', 'Lamar', 'Ullrich', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(5, 'Jedediah_McClure64', 'Janae.Mitchell@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$6WM5+vZELc2eGvWTncuRcA$OhmuWkuxtFHcJRdCFBxuiRyxOEF3xAg8EZShRGkbyDs', 'Toy', 'Glover', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(6, 'Juvenal69', 'Alexandria.Marquardt12@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$WgwlJdPxL5l7B3oAcfBT7g$q5rnTOq9jrl4XnwnwfadIZK6DGyM6Vzl+h5mSDPcLls', 'Khalid', 'Kreiger', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(7, 'Guy.Schiller', 'Tate40@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$0DlS/87uiw6ykZVu2aRu5w$3aRhoZe+uoe2Z1WpPwZKroXR2ybTQhwe5hBnmjjlWbk', 'Raheem', 'Price', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(8, 'Emmanuelle_Howe', 'Gabrielle41@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$nwCCW5VZsyUNPyrykO1pnQ$5+j17CSVIYVkzcygD8olD6JlM3zB+cLgbplrJI6ijA4', 'Shakira', 'Herman', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(9, 'Jaeden.Strosin78', 'Corene29@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$IPz+vKBW8qNyRYxRfsVWNg$DQ1JtFUUg99KNhn+IKEDB/dll+n3sTg3k6j6wiu1ELg', 'Webster', 'Raynor', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(10, 'Melany_Schoen32', 'Savanah_Moore31@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$dBl8MZM01DHlN5HRz8GrqA$9aFcPttsqwvneiIF9ZHKnOf43d369dhQu6rv3SzeUQk', 'Matilde', 'Casper', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(11, 'Earnestine.Fritsch65', 'Karl.Jenkins37@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$pXok6GsnD5wuFi5qh4a5Pw$iFqGopTGzo3O2PLa9YH7JEoHemKPRP2H0xB342SgCak', 'Charlene', 'Ullrich', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(12, 'Jack_Satterfield91', 'Wiley.Hickle16@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$9D7D6iv++/piBlPw5b7ldw$6RIrIPNnX+G8Fzjdy3N18xak/Kc83zBXbXw+ROX4O0g', 'Vada', 'Davis', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(13, 'Osbaldo7', 'Cordell88@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$8e7YN35SM0fclz/WTV9OnQ$xouXnxresPtx5ClVDFwxQ228jM1hTCUalxcp7Py3qB8', 'Joelle', 'Wiegand', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(14, 'Jedidiah19', 'Dawn86@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$sgcIl0ehtNxi4cmtZzDN2g$lX/a1qr6kRw8dScQEJt6X4jKvuD4CT1/xAnb+hP755Q', 'Garrison', 'Kub', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(15, 'Cody_Rolfson51', 'Pietro.Schmitt@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$ttulVI1izGNu5pVrkLp50w$2KIrbtYE/KNs3uPxAAH4sXZC7pywZsJFns1OfUE/CbQ', 'Laverne', 'Wiegand', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(16, 'Chanel.Runolfsson45', 'Gonzalo.Herzog72@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$XhAOD4x2hIH5McwrotqS0g$yck4oXwQCED6p7ooIywjpgmZxZ6RfJHL57YcniBri58', 'Cassie', 'McCullough', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(17, 'Marina.Brekke', 'Freddie81@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$BuE3yDXFEtbYvWG2dN8PrQ$D+RtZep/gUEyU9qJpQ73WXqIh2iPwr+ANtFIbLmN7Jw', 'Lucie', 'Thompson', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(18, 'Evie_Pacocha', 'Jakob97@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$BUXZSRy3ttuPY/3Pj7JUMw$c1/Iew4KcjpADZ9ZKmaBc7AglPG3U2b+YXqpGBh/Z78', 'Otha', 'O\'Kon', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(19, 'Lenora25', 'Jennie_Johns27@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$XAOhkHPqa8u3rS2OBF3KYQ$ZdYeig8wFUOtWfgujRKrF8c6MArHZlvSlvLQ82WS3pc', 'Norberto', 'Bernier', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(20, 'Spencer51', 'Clyde70@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$tbD/NAczk7ThkBH0CGonKQ$YgIWIcjxpu9vAxGd6fR8z3ZCl9LS7U3OksLXW3bxpKA', 'Ara', 'Nader', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(21, 'Amaya_Heaney93', 'Genesis99@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$XjJrD3Wuz9+gZqTZRSzWIA$nCD1UIHEbD4/JEb1ro6Zr23J+74miZGqn8qAPIt4344', 'Laisha', 'Johns', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(22, 'Arnold49', 'Molly_Becker28@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$vrW9UIy1/GBvGN5zG8QoPA$pmFuFuY/YwZXhQSfk1IJzhVqxMWGHYG48u/HfdpsKFY', 'Colt', 'Becker', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(23, 'Darrick_Kuvalis62', 'Norval.Pfannerstill@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$9TY3CxaD6ahhn85lZQAzgg$jFRXMO6NhcGl84KlbodKU685y64+4H/dUPIM5xT8ijg', 'Amira', 'Wiegand-Cole', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(24, 'Celestino8', 'Domenic_Rau36@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$m+Nvv4zJzLNTujchXQpGQg$wBNzABeI/LPpB3dCU3i2RuLXCdRmVwZo+rxVf4rZJJQ', 'Piper', 'Cassin', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(25, 'Milan70', 'Adelia_Quitzon@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$5my85jPdyTfL2oW+NM266w$0hqXrA5CB7khYqwM+ehWcH8df6F5/bNwve4DUgbbxVY', 'Annabel', 'Kiehn', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(26, 'Lisandro.Lindgren', 'Kariane88@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$vB6DV57QTJKVFTDWkuZw3A$o5TcANUoYrtJAeUJXRrx91wszVbDLG7QEV48Q+KnZ6Q', 'April', 'Boehm', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(27, 'Rory92', 'Pierce_Mohr58@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$SixKHysQNTONi4RuSLByZg$EzHo4WCUGTbu5/orbFmCKt39nS4/jf773yrOw1Txsqw', 'Lukas', 'Paucek', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(28, 'Cristobal.Kemmer40', 'Myron.Wilderman@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$dY0l9GhfB+/Pnz2CK1dRzA$ZhDl8qIW89qOdgoETvRh2MAzWotzjtLoycs9ejGvakQ', 'Elody', 'Beer', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(29, 'Jermey_Pacocha', 'Doris_Kulas@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$U35wItKY4gAquaRSw/P9pQ$z1O18Lmxwicv7lJ4RzVwIYmETccXE/6Wp8QBcR/m6Uo', 'Rose', 'Howell', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(30, 'Ana.Ritchie', 'Arnoldo54@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$wE5L95tYZvDEnYTd3+MdbQ$bLxdYyjmcazlyETXvv7tmBShbZHLnCY4Th6lybQqDgU', 'Jaycee', 'Lesch-Roberts', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(31, 'Scottie.Kunze-Braun', 'Mason_Murray@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$7B+/9fO4HVGCUOrZzLcuKQ$A71yhjfjGA6FUGaq09Tn9FSdQ+CKCdgWDkAvWYDNv9I', 'Kelsi', 'Effertz', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(32, 'Thea95', 'Jordi_Bogan31@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$EU+g99OiGF5T6gujxw6ZBA$/77tutR/IvG9r2IHHxiiiNIxAPIZzPOO6r/evTLhO/g', 'Savanah', 'Gerlach', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(33, 'Cristopher32', 'Hoyt84@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$TbWWEaFWwMY76jZZWchbPQ$H7hIlsKs0Xqu9Nl9Xbo2XPpP/EyNWxpNvS0Af+ANSEo', 'Spencer', 'Dach', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(34, 'Peter.Dach', 'Bonita0@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$QdsJAFLtWO5ic0Ih7gWCbQ$0YT43ATy8ES+TT7HkHCJRyqVrlwLv6E2tcDYgU0ITVc', 'Stevie', 'Weimann', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(35, 'Jailyn_Ledner', 'Allison44@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$13WodRJ159VOhVye7/fJDQ$JuLNRySYwLP9vsaxZWcAUU32zONnx6WExpihNnT4TLo', 'Drake', 'Dickens', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(36, 'Carmelo92', 'Jamaal.Russel39@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$5oF9L0/L1A6L0hGP5l1EdA$iDu99iKlZR/BJJYOV2WubYlYpN1TLDtukCs21P4+LJ8', 'Nyasia', 'Halvorson', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(37, 'Nestor39', 'Blanche_Langworth96@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$bbUILccYnUuzWzutBDbwwg$5mqBbW7lRc/dDcYtGTG5E6OAbgw65ymCDJGtJCTXe4Q', 'Stephon', 'Klocko', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(38, 'Sheila_Walsh', 'Izabella.Bednar@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Rd5Njcvp6oM7AAc/qLJclg$YoQJxBSDo/YbDMHUClynvjDOTHpG5ysSfFw0p2f50YU', 'Jacey', 'McClure', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(39, 'Rebecca.Powlowski19', 'Frieda.Moore49@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$kkuiqE85/KPHBpSoqZlM3w$zO8OgHodQ0mf0HkeDisRDQs7Dz7ehGeo+OOfQKktltE', 'Mireya', 'Windler', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(40, 'Luis79', 'Jewell.Terry@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$dtfWPrrYqIdggwOwAbWoyw$2gwJ+J6V9gy8WUJ7ixvghdzG6Ejxtmw5HnvwTwlF2qc', 'Bobbie', 'Kohler', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(41, 'Janick.Hansen15', 'Lucious_Batz@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$H4yZ+BGzRAxLYLEw6MpIvQ$NFen/c4CVsXOkse4BlY3MZLr8AHg55Xj7laBl4fLBEg', 'Michele', 'Wolff', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(42, 'Jules.Mohr', 'Antone.Ward@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$KQZFcGFDoGUpEqOPZxWE1Q$c3Z8ElpvFu3IlrnAc49EmrivoaDhnn8ZK8+LzFV4gWI', 'Laron', 'Kirlin-Pacocha', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(43, 'Helga.Osinski', 'Kristian51@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$b5/aSiK9h7DEaJwk4PoQOA$t2IkoHE4A5R7YH10V6TAGQoER3iUbadiD6Xi/BMsZKA', 'Ryan', 'Hartmann', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(44, 'Shawna_Mayer93', 'Karl7@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$UXE1uDDt8W6VKksKWyeidg$AnqohikrMP+TV8CH4Gw4S8m3NLygUgUE0HAdnNsmLj4', 'Nicholas', 'Botsford', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(45, 'Harvey21', 'Terrance.Wisozk@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$zrFWDPs1djPvOlyQbCdiLw$r7mOnvrW6UQn5UNJCl1NZF7WxFBBjDwq4lcCdAuGknM', 'Rylee', 'Casper', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(46, 'Lavern.Gutkowski', 'Brando.Bernhard@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$4uAOLwJ7OEO1iyb62cEmEg$8tq2io3Bj8BdOclRK6ZsAYNh3airAEY1YN0HOcTmdF4', 'Darrion', 'Fisher', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(47, 'Sarina_Muller14', 'Consuelo.Hettinger86@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$zR/is7PHDgaXhoFMLYh08A$2DBOqEpwU4tWQybihu8cBPST7H6Ve4UbpfPmybXKEG4', 'Celia', 'Pacocha', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(48, 'Jannie.Konopelski', 'Ewald.Upton84@yahoo.com', '$argon2id$v=19$m=65536,t=3,p=4$XW3f/uaOmMha3QWbVUCgcQ$nHdjFdR0b/g1BiqThw1bcWwFRVBfQgEP0GbA3U0NZto', 'Era', 'D\'Amore', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(49, 'Rashawn56', 'Deangelo.Fadel-Daniel89@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Zn5zWIV89SjAWayEMi5WoA$FhzDiGcMrlWyiTOJfd7rEw8cjecO6QNbdAk4dcMvDY4', 'Darryl', 'Ferry', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(50, 'Donato_Kilback86', 'Bobby_Roberts64@hotmail.com', '$argon2id$v=19$m=65536,t=3,p=4$iXx58okK6BlfJxDPrmaMsw$FC1TyEF6aw96k0CMoH7Y75PT3AjhFBYsHRMabi9DIHQ', 'Onie', 'Boyer', '2023-10-02 20:31:41', '2023-10-02 20:31:41'),
(51, 'gorge', 'gorge@blimely.com', '$argon2id$v=19$m=65536,t=4,p=1$d1p1eS9QQTN6ekViME85ag$nGDQynpdeCN/xj8xwnsP6/OVbtjbpWaKFB6MXCObvnE', 'gorge', 'blimley', '2023-10-03 17:08:51', '2023-10-03 17:08:51'),
(52, 'jojohnson', 'john@johnson.com', '$argon2id$v=19$m=65536,t=4,p=1$czRFWS9UWWJjbTZxRkNMcw$7h3E0xTdEAJ9LohaVDLvGNiL3II3BxMMJeevCm5Od7s', 'John', 'Johnson', '2023-10-06 11:47:17', '2023-10-06 11:47:17');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user_profile`
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
-- Gegevens worden geëxporteerd voor tabel `user_profile`
--

INSERT INTO `user_profile` (`id`, `userid`, `profilePictureUrl`, `about`, `theme`, `language`) VALUES
(1, 37, 'https://avatars.githubusercontent.com/u/76832611', 'Ago arma expedita reiciendis carcer sed sub. Suasoria cubo necessitatibus cinis. Atqui placeat qui officiis cunctatio tricesimus calco alias audio argentum.', 'dark', 'text_en'),
(2, 39, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/175.jpg', 'Ullus avarus censura sufficio cui coniuratio aufero victus. Tepesco copia decerno deludo adnuo. Ullus defero solio cura demoror.', 'dark', 'text_en'),
(3, 13, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1177.jpg', 'Summa volaticus somniculosus repellendus. Ulciscor denego cohibeo desino. Decerno conatus dens nisi aperiam crux provident artificiose.', 'dark', 'text_en'),
(4, 48, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/802.jpg', 'Adamo antepono ut maxime decimus strenuus conculco acervus caritas. Sursum libero video velit apparatus tyrannus blandior. Decumbo aggredior distinctio tantillus omnis cimentarius amitto demergo ago.', 'light', 'text_en'),
(5, 5, 'https://avatars.githubusercontent.com/u/46731538', 'Inflammatio ocer vestigium velit suppono. Harum alioqui tondeo consuasor pecus sufficio reiciendis. Theca vinco comis reiciendis cruciamentum subnecto barba contigo.', 'light', 'text_en'),
(6, 27, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/330.jpg', 'Viduo ulciscor aliquam utpote vito demitto cursus eius. Deinde confido curatio tener utor copia civitas cultura. Corrupti possimus delectatio inventore concido.', 'dark', 'text_en'),
(7, 4, 'https://avatars.githubusercontent.com/u/43715701', 'Aro creo deprimo amo conculco supellex vomito curto clibanus. Tantillus tego corporis neque cuppedia spectaculum. Id dolor rem adicio cuius stips tabgo vicissitudo vix tergeo.', 'dark', 'text_en'),
(8, 42, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/380.jpg', 'Ultio ad attonbitus comprehendo vulnero ater cavus tactus suppono admoveo. Taceo mollitia pauper amplus id adipisci utor degenero. Claustrum strenuus creator commemoro bestia dicta volo quas iusto currus.', 'light', 'text_en'),
(9, 25, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/708.jpg', 'Adfero teneo aegrotatio bonus. Attonbitus appositus aeternus cimentarius tabella absens damno vito. Soleo valeo dedecor.', 'light', 'text_en'),
(10, 16, 'https://avatars.githubusercontent.com/u/15989489', 'Capio fugiat ter audax aureus alii utor. Acerbitas nihil inflammatio capio decens. Soluta arcesso ambulo tolero.', 'light', 'text_en'),
(11, 28, 'https://avatars.githubusercontent.com/u/80196603', 'Tantillus defendo cetera defessus ab decerno. Aegrotatio ulciscor vereor tondeo arcesso tergum administratio. Vulgaris umerus vado volubilis verecundia trepide adipisci spargo.', 'light', 'text_en'),
(12, 29, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1241.jpg', 'Hic sum turpis alienus cunabula. Ademptio tenuis chirographum communis turba cogo tabula. Solutio labore stella suscipio calculus auxilium deprimo.', 'dark', 'text_en'),
(13, 19, 'https://avatars.githubusercontent.com/u/40809923', 'Cresco tepidus suffoco iure quaerat ipsum contigo vorax adiuvo arca. Curatio utilis expedita recusandae copia depereo charisma. Vivo cupiditate curtus vulticulus voluptas arcesso theca.', 'light', 'text_en'),
(14, 41, 'https://avatars.githubusercontent.com/u/9089171', 'Vindico ipsa astrum vomica apparatus. Qui tabesco coaegresco totus appello videlicet. Tremo clam strenuus caelestis admitto optio iste.', 'light', 'text_en'),
(15, 44, 'https://avatars.githubusercontent.com/u/94396936', 'Circumvenio cometes comptus deduco arguo crinis arbitro. Acceptus hic defleo ipsum cur coadunatio amissio sortitus adimpleo. Bibo cotidie trans consequatur aliquam tot tot termes vilicus apud.', 'dark', 'text_en'),
(16, 17, 'https://avatars.githubusercontent.com/u/36819511', 'Utor doloremque adipiscor volup canonicus tonsor defessus ceno volutabrum. Suppono tener cognomen exercitationem bis angulus volup apostolus credo communis. Verus cubo canto.', 'light', 'text_en'),
(17, 23, 'https://avatars.githubusercontent.com/u/61284055', 'Aeger volutabrum cedo valetudo tyrannus deprimo texo demum. Depromo confido usque subseco ultio aedificium cattus sum. Assumenda careo absque demoror aeternus congregatio vestigium.', 'dark', 'text_en'),
(18, 24, 'https://avatars.githubusercontent.com/u/78828950', 'Benevolentia tabernus dedico. Animadverto spoliatio velut rerum socius una vulnus curia. Vinculum accommodo voluptas vos certe tempora vomica tum accedo cogo.', 'dark', 'text_en'),
(19, 33, 'https://avatars.githubusercontent.com/u/42002681', 'Tempora theca adduco ademptio. Cado candidus corroboro custodia delectus una occaecati vicissitudo trans. Libero cernuus custodia aveho viridis demulceo.', 'dark', 'text_en'),
(20, 46, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/86.jpg', 'Surculus atrox crur vitium aggero vallum commodo chirographum. Sonitus turba defetiscor commodi. Adeo omnis cunae spectaculum dignissimos agnitio thesaurus.', 'light', 'text_en'),
(21, 21, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/238.jpg', 'Cuppedia quos certe textilis cervus ambulo volaticus bestia acerbitas solutio. Audacia tibi auxilium damno alo terga tutamen. Complectus statua carmen tametsi.', 'dark', 'text_en'),
(22, 47, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/286.jpg', 'Creptio suadeo crepusculum. Vix aqua curiositas bos voluptatem totidem. Corona adduco arx ascit perspiciatis derelinquo vetus ducimus adipiscor.', 'light', 'text_en'),
(23, 15, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/665.jpg', 'Quas capio pel tibi teres talus chirographum vicinus adnuo comburo. Patruus quam corpus succurro accommodo facere victoria advenio. Cicuta titulus bardus.', 'dark', 'text_en'),
(24, 30, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1012.jpg', 'Argumentum vulticulus creator. Atrocitas comburo peccatus crur vobis quia conspergo aestus charisma conatus. Alius antepono crux allatus solutio copiose canis balbus.', 'light', 'text_en'),
(25, 45, 'https://avatars.githubusercontent.com/u/67797305', 'Nesciunt placeat arbitro delinquo magnam statua sit arcesso truculenter celer. Officia nihil talis averto curriculum degero. Cimentarius angustus autem capto ventito decipio.', 'dark', 'text_en'),
(26, 2, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1243.jpg', 'Tergeo contigo tendo modi beatus corroboro audacia undique. Fuga arbustum totus bestia. Vulgivagus articulus cornu non sapiente soluta carcer dignissimos.', 'light', 'text_en'),
(27, 22, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/759.jpg', 'Degero tamdiu cursim avaritia vitae barba auditor celer abbas. Ultio amissio verumtamen apud utrimque censura. Testimonium vobis apostolus cernuus.', 'light', 'text_en'),
(28, 26, 'https://avatars.githubusercontent.com/u/48241458', 'Ultio tego venia stabilis stipes omnis bardus colo molestias. Depereo similique ratione molestias damno dolorum ea stips volutabrum. Aranea amissio defero.', 'light', 'text_en'),
(29, 40, 'https://avatars.githubusercontent.com/u/74053279', 'Aspernatur eveniet cattus verus amo currus viriliter attero deorsum. Tergo dignissimos uxor deprimo aperiam. Optio baiulus et celo.', 'dark', 'text_en'),
(30, 12, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1029.jpg', 'Coaegresco aptus sit dolorem defaeco supellex argumentum talis esse. Antiquus averto curo solutio. Benevolentia dolores arbustum apto depereo tutamen balbus callide bellum.', 'dark', 'text_en'),
(31, 11, 'https://avatars.githubusercontent.com/u/91136548', 'Saepe acervus coniecto vapulus sit vallum demitto sit vel tertius. Universe carus tunc creator conor dignissimos consuasor demo. Vitiosus verbum recusandae acervus altus ago adficio constans curis dolorum.', 'dark', 'text_en'),
(32, 38, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/596.jpg', 'Assentator qui vae nihil patria quod. Argentum brevis vix curto suscipit stillicidium denego ago umerus ara. Suppono communis consequatur.', 'dark', 'text_en'),
(33, 18, 'https://avatars.githubusercontent.com/u/52555842', 'Conforto verecundia timidus ocer tertius vomito pax casso. Angustus volo consectetur vacuus comis curso impedit. Repellat triduana vindico una volup curo abutor fuga pecco.', 'dark', 'text_en'),
(34, 6, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1067.jpg', 'Currus fuga thema tibi odio decimus vorago pauci volo. Deludo aurum vallum usitas spes. Pariatur creber suppellex minus versus modi degero creptio.', 'light', 'text_en'),
(35, 3, 'https://avatars.githubusercontent.com/u/58667215', 'Audentia stella arx villa. Animadverto degero campana patrocinor curvo volubilis arca numquam civis. Denuo cribro tondeo deludo.', 'light', 'text_en'),
(36, 1, 'https://avatars.githubusercontent.com/u/21479848', 'Sequi canis soleo deleniti pecto conitor architecto. Curiositas tremo talis. Temperantia cuius ratione accusantium deprecator texo.', 'light', 'text_en'),
(37, 32, 'https://avatars.githubusercontent.com/u/573966', 'Civis complectus blandior apparatus. Arx charisma stips. Pecto deprecator argumentum thymbra adopto.', 'light', 'text_en'),
(38, 31, 'https://avatars.githubusercontent.com/u/95269003', 'Adamo carcer adfero tergeo. Aqua benigne iusto. Trans tantum tubineus bestia audacia autem.', 'light', 'text_en'),
(39, 7, 'https://avatars.githubusercontent.com/u/55705137', 'Suffragium coerceo varietas vulticulus itaque molestias vis exercitationem viscus sortitus. Aspicio sed tempora delibero dapifer nemo currus aeger artificiose. Comitatus audeo vitium vigilo vaco quam.', 'dark', 'text_en'),
(40, 50, 'https://avatars.githubusercontent.com/u/1876960', 'Paulatim bonus tardus conscendo sonitus astrum calamitas turba decens cibo. Usque contigo maiores curiositas vulgus deleniti constans suasoria delinquo abeo. Vinculum creo alias.', 'dark', 'text_en'),
(41, 10, 'https://avatars.githubusercontent.com/u/46902389', 'Compono ubi nostrum decet natus pauci tibi. Canto ago tamquam patrocinor ante. Acervus terga sub collum viridis desino depono sol.', 'dark', 'text_en'),
(42, 49, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/551.jpg', 'Textus aufero provident cilicium uredo distinctio occaecati. Patria cicuta sumo ars terra ager spiritus. Ultio cohors copiose vilicus asper suggero adnuo.', 'light', 'text_en'),
(43, 36, 'https://avatars.githubusercontent.com/u/86040489', 'Catena capillus studio quia. Aestas arbor substantia. Varius deripio studio spoliatio adsidue tum.', 'light', 'text_en'),
(44, 20, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/12.jpg', 'Administratio cimentarius caecus depono. Contra deputo sursum acer volubilis vitiosus ver doloremque armarium adstringo. Amiculum tempore admoveo.', 'light', 'text_en'),
(45, 9, 'https://avatars.githubusercontent.com/u/9243017', 'Sit campana nostrum. Aer acies combibo tutamen atrox comedo sit. Celebrer celo adamo angelus pel aliqua aetas delibero.', 'dark', 'text_en'),
(46, 14, 'https://avatars.githubusercontent.com/u/92252783', 'Thema nesciunt concedo dicta vorax totidem cribro voluptates adopto cresco. Ut nisi cariosus spero vetus. Arceo error sophismata convoco dolorum tracto sequi tempore.', 'light', 'text_en'),
(47, 35, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/132.jpg', 'Campana aliquid corrumpo cibus cotidie advoco sumo surculus turbo alter. Spero eligendi arceo. Cognomen bene creber adulatio.', 'light', 'text_en'),
(48, 43, 'https://avatars.githubusercontent.com/u/46480378', 'Alter tametsi quis bardus sum corona basium casso trucido voco. Correptius deporto auctus sponte sophismata astrum iure. Votum fugiat corrumpo thalassinus testimonium textilis sonitus stultus.', 'light', 'text_en'),
(49, 34, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1051.jpg', 'Succedo canonicus strenuus sono delicate nisi vulgivagus earum. Delibero ceno caelum creta. Defleo cupio anser laborum voluntarius copia consuasor.', 'light', 'text_en'),
(50, 8, 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/256.jpg', 'Nobis sulum territo. Doloremque alienus expedita tenetur astrum quo venia deprecator modi vicinus. Sursum thymum spes custodia alveus spiritus termes.', 'light', 'text_en'),
(51, 51, 'https://avatars.githubusercontent.com/u/64209400?v=4', 'Hello!', 'dark', 'text_en'),
(52, 52, 'https://avatars.githubusercontent.com/u/64209400?v=4', 'Hello!', 'dark', 'text_en');

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
(1, 24, 1),
(2, 29, 3),
(3, 4, 2),
(4, 20, 2),
(5, 37, 3),
(6, 35, 1),
(7, 6, 3),
(8, 30, 1),
(9, 42, 1),
(10, 2, 1),
(11, 18, 3),
(12, 17, 3),
(13, 31, 1),
(14, 27, 1),
(15, 1, 1),
(16, 12, 1),
(17, 50, 3),
(18, 34, 1),
(19, 32, 3),
(20, 26, 2),
(21, 10, 3),
(22, 3, 1),
(23, 22, 3),
(24, 44, 1),
(25, 5, 1),
(26, 11, 2),
(27, 49, 2),
(28, 46, 3),
(29, 28, 2),
(30, 14, 3),
(31, 38, 1),
(32, 15, 1),
(33, 48, 2),
(34, 33, 3),
(35, 47, 3),
(36, 7, 2),
(37, 21, 2),
(38, 40, 1),
(39, 16, 3),
(40, 36, 3),
(41, 45, 3),
(42, 8, 3),
(43, 41, 3),
(44, 9, 3),
(45, 13, 2),
(46, 25, 1),
(47, 23, 2),
(48, 19, 2),
(49, 39, 1),
(50, 43, 2);

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
-- Indexen voor tabel `translation`
--
ALTER TABLE `translation`
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
-- AUTO_INCREMENT voor een tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT voor een tabel `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT voor een tabel `translation`
--
ALTER TABLE `translation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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

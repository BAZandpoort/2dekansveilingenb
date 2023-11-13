-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 13 nov 2023 om 16:20
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
(52, 'Abdullah Evloev', 'abdevl76@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$RmROZi5ENlFkRlQuZERHRQ$rZ5tKCMiCefQa0qw271IcnIbEibdLH2YCSyK0B5psBY', 'Abdullah', 'Evloev', 'Offline now', '2023-11-13 08:26:44', '2023-11-13 07:44:22');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

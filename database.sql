-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2017 at 06:06 AM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trattoria`
--

-- --------------------------------------------------------

--
-- Table structure for table `image_upload`
--

CREATE TABLE `image_upload` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image_upload`
--

INSERT INTO `image_upload` (`id`, `image`) VALUES
(22, 'owl1.jpg'),
(23, 'owl2.jpg'),
(24, 'owl3.jpg'),
(25, 'owl4.jpg'),
(26, 'owl5.jpg'),
(27, 'owl6.jpg'),
(28, 'owl7.jpg'),
(29, 'owl8.jpg'),
(30, 'owl9.jpg'),
(31, 'owl10.jpg'),
(33, 'owl12.jpg'),
(34, 'owl13.jpg'),
(35, 'owl14.jpg'),
(36, 'owl15.jpg'),
(37, 'owl16.jpg'),
(38, 'owl17.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `jelovnik`
--

CREATE TABLE `jelovnik` (
  `id` int(11) NOT NULL,
  `vrsta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jelo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `opis` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `cena` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jelovnik`
--

INSERT INTO `jelovnik` (`id`, `vrsta`, `jelo`, `opis`, `cena`) VALUES
(1, 'dorucak', 'Jaje na oko', '(3 jajeta, pavlaka, paradajz, z.salata, 1/4 cebata)', '120.00'),
(2, 'dorucak', 'Jaja sa pancetom', '(3 jajeta, pavlaka, paradajz, z.salata, pancetta, 1/4cebata)', '140.00'),
(3, 'dorucak', 'Kajgana sa pancetom', '(3 jajeta, pavlaka, paradajz, z.salata, pancetta, 1/4cebata)', '140.00'),
(4, 'dorucak', 'Kajgana sa povrćem', '(3 jajeta, pavlaka, paradajz, z.salata, gril. povrce, 1/4cebata)', '140.00'),
(5, 'dorucak', 'Kajgana sa feta sirom i šampinjonima', '(3 jajeta, pavlaka, paradajz, z.salata, šampinjoni, feta sirom, 1/4cebata)', '150.00'),
(6, 'dorucak', 'Fit jaja', '(3 belanceta, paradajz, z.salata, gril. povrće, 1/4cebata)', '120.00'),
(7, 'dorucak', 'Vapene doručak\r\n', '(3 jajeta, dressing, paradajz, z. salata, pancetta, feta sir, cebata)', '190.00'),
(8, 'predjela', 'Paradajz potaž', '(Potaž odlikuje pikantan mix svinjskog mesa i paradajza)', '120.00'),
(9, 'predjela', 'Pileći potaž', '(Potaž sastavljen od svežeg povrća i pilećeg filea)', '120.00'),
(10, 'predjela', 'Sezonski potaž (VEGE)', '(Sveže sezonsko povrće bez ikakvog prisustva mesa)', '120.00'),
(11, 'predjela', 'Antipasta', '(Šunkarica, suvi vrat, kulen, panceta, kačkavalj, feta sir, paradajz, masline, 1/4 cebata)', '250.00'),
(12, 'predjela', 'Bruschetti pomodoro', '(Bruschetti, paradajz, luk, aceto)', '120.00'),
(13, 'predjela', 'Bruschetti feta olive', '', '140.00'),
(14, 'sendvici', 'Cebata šunkarica', '(Šunkarica, kuvano jaje, kačkavalj, z.salata, paradajz)', '160.00'),
(15, 'sendvici', 'Cebata kulen', '(Kulen, feta sir, kačkavalj, z.salata)', '160.00'),
(16, 'sendvici', 'Cebata suvi vrat', '(Dressing, suvi vrat, kačkavalj, z.salata, paradajz)', '160.00'),
(17, 'sendvici', 'Cebata tunjevina', '(Majonez, tunjevina, luk, z.salata)', '160.00'),
(18, 'salata', 'Mediteranska', '(Z. salata, masline, paradajz, feta, luk, aceto, krutoni)', '210.00'),
(19, 'salata', 'Cezar', '(Z. salata, pileći file, paradajz, dressing, krutoni)', '230.00'),
(20, 'salata', 'Šumska', '(Z. salata, pečurke, kajmak, lešnici)', '230.00'),
(21, 'salata', 'Glišina', '(Z. salata, pileći file sa senfom, orasi, suva kajsija, grožđice)', '230.00'),
(22, 'salata', 'Vapene', '(Rukola, pileći file, aceto, paradajz, krutoni)', '260.00'),
(23, 'salata', 'Vitaminska (VEGE)', '(Z. salata, celer, šargarepa, jabuka, dressing od narandze, grožđice)', '210.00'),
(24, 'salata', 'Sezonska', '(Kupus, paradajz)', '80.00'),
(25, 'salata', 'Zelena', '(Porcija zelene salate, aceto, maslinovo ulje)', '100.00'),
(38, 'pizza', 'Capricosa', '(Pelat, šunkarica, kačkavalj, šampinjoni, origano)', '160.00 / 340.00'),
(39, 'pizza', 'Margarita', '(Pelat, kačkavalj, masline, origano)', '160.00 / 300.00'),
(40, 'pizza', 'Quattro Formaggi', '(Pelat/n.pavlaka, kačkavalj, gorgonzola, feta sir, mocarela, origano)', '210.00 / 400.00'),
(41, 'pizza', 'Gourmet', '(Pelat, šunkarica, suvi vrat, kačkavalj, jaje, šampinjoni, kulen, pancetta, origano)', '230.00 / 430.00'),
(42, 'pizza', 'Frutti di Mare', '(Pelat, šunkarica, kačkavalj, šampinjoni, plodovi mora, origano)', '430.00'),
(43, 'pizza', 'Vapene', '(Pelat, kačkavalj, šampinjoni, paprika, luk, rukola, origano)', '180.00 / 360.00'),
(44, 'pizza', 'Vegeteriana', '(Pelat, krompir, šargarepa, šampinjoni, origano, crni luk, paprika, paradajz i rukola)', '180.00 / 340.00'),
(45, 'pizza', 'Stella Champione', '(Pelat, šunkarica, kačkavalj, šampinjoni, paradajz, rikota, origano)', '200.00 / 400.00'),
(46, 'pizza', 'Pepperoni', '(Šunkarica, pelat, kačkavalj, šampinjoni, kulen, feferoni, origano)', '00.00 / 400.00'),
(47, 'pizza', 'Bianca', '(N. pavlaka, kačkavalj, panceta, b.luk, origano)', '180.00 / 360.00'),
(48, 'pizza', 'Tonno', '(Pelat, kačkavalj, luk, tunjevina, masline, origano)', '190.00 / 390.00'),
(49, 'pizza', 'Pizza Fratello\r\n', '(Pelat, šunkarica, kačkavalj, suvi vrat, kulen, šampinjoni, rikota, rukola, parmezan, origano, susam)', '550.00'),
(50, 'desert', 'Nutella pizza\r\n', '(Nutella, banana, šlag)', '190.00 / 390.00'),
(51, 'desert', 'Cheese cake', '', '90.00'),
(52, 'desert', 'Testo s\' makom', '', '200.00'),
(53, 'desert', 'Testo s\' orasima', '', '200.00'),
(54, 'pasta', 'Arrabiata', '(Pelat, tuc. paprika, čili, parmezan)', '210.00'),
(55, 'pasta', 'Napolitana', '(N. pavlaka, luk, šampinjoni, mocarela)', '210.00'),
(56, 'pasta', 'Olive piccanti', '(Pelat, čili, masline, mocarela)', '210.00'),
(57, 'pasta', 'Aglio Olio', '(Maslinovo ulje, masline, beli luk, ljuta papričica)', '210.00'),
(58, 'pasta', 'Di Verdure', '(Pelat, luk, mix povrća)', '210.00'),
(59, 'pasta', 'Pesto Genovesse', '(Pesto sos)', '210.00'),
(60, 'pasta', 'Testo sa sirom', '', '210.00'),
(61, 'pasta', 'Nasuvo', '(Luk, krompir)', '210.00'),
(62, 'pasta', 'Vapene Piatto\r\n', '(N. pavlaka, njoke, pileći file, suvi vrat, kačkavalj)', '280.00'),
(63, 'pasta', 'Zingara', '(Pelat, n. pavlaka, šunkarica, šampinjoni)', '250.00'),
(64, 'pasta', 'Carbonara', '(N. pavlaka, pileći file, panceta, parmezan)', '250.00'),
(65, 'pasta', 'Bolognese', '(Pelat, mleveno juneće meso, crno vino)', '250.00'),
(66, 'pasta', 'Frutti di Mare', '(Pelat, belo vino, plodovi mora)', '250.00'),
(67, 'pasta', 'Da Meljina', '(N. pavlaka, luk, tunjevina, masline)', '250.00'),
(68, 'pasta', 'Funghi', '(N. pavlaka, vrganj)', '250.00'),
(69, 'pasta', 'Quattro Formaggi', '(N. pavlaka, kačkavalj, gorgonzola, mocarela, parmezan)', '250.00'),
(70, 'pasta', 'Eger', '(N. pavlaka/pelat, krmenadla, luk, šampinjoni)\r\n\r\n', '250.00'),
(71, 'pasta', 'Il Pirata', '(N. pavlaka, pileći file, praziluk, šargarepa)', '250.00'),
(72, 'pasta', 'All’ Amatriciana *\r\n', '(Pelat, luk, pancetta, čili, parmezan)\r\n<br><br>\r\n* Jelo koje je Italijansku kuhinju proslavilo! Naziv potice od malog mesta nadomak Rima- Amatrice.', '250.00'),
(73, 'pasta', 'Al Forno *', '(Izaberite omiljenu pastu i mi ćemo Vam je zapeći u našoj pećnici)', '290.00');

-- --------------------------------------------------------

--
-- Table structure for table `remembered_logins`
--

CREATE TABLE `remembered_logins` (
  `token_hash` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `remembered_logins`
--

INSERT INTO `remembered_logins` (`token_hash`, `user_id`, `expires_at`) VALUES
('f59290a870b0c0ac60f6d3b1d5fa9a29c0d6c827fee1f86ba1160eaf362afc59', 3, '2017-08-18 05:27:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`) VALUES
(3, 'Igor', 'vapenskiigor@trat.com', '$2y$10$y1j1YjbEcr9yL9dM96eFYu5P.si/9bdgl57xd3MH2.z6J6TWu3Mw6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `image_upload`
--
ALTER TABLE `image_upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jelovnik`
--
ALTER TABLE `jelovnik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `remembered_logins`
--
ALTER TABLE `remembered_logins`
  ADD PRIMARY KEY (`token_hash`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `image_upload`
--
ALTER TABLE `image_upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `jelovnik`
--
ALTER TABLE `jelovnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

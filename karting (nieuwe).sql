-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 23 apr 2021 om 09:33
-- Serverversie: 10.4.14-MariaDB
-- PHP-versie: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `karting`
--
CREATE DATABASE IF NOT EXISTS `karting` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `karting`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `activiteiten`
--

CREATE TABLE `activiteiten` (
  `id` int(11) NOT NULL,
  `soort_id` int(11) DEFAULT NULL,
  `datum` date NOT NULL,
  `tijd` time NOT NULL,
  `max_deelnemers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `activiteiten`
--

INSERT INTO `activiteiten` (`id`, `soort_id`, `datum`, `tijd`, `max_deelnemers`) VALUES
(9, 1, '2018-03-01', '09:00:00', 3),
(10, 2, '2018-03-01', '11:00:00', 0),
(11, 3, '2018-03-01', '15:00:00', 0),
(12, 4, '2018-03-02', '10:00:00', 0),
(13, 1, '2021-04-26', '09:00:00', 2),
(14, 4, '2021-04-26', '10:00:00', 1),
(15, 2, '2021-04-26', '11:00:00', 0),
(16, 1, '2021-05-03', '09:00:00', 0),
(17, 4, '2021-05-03', '10:00:00', 0),
(18, 2, '2021-05-03', '11:00:00', 1),
(19, 1, '2021-06-06', '09:00:00', 1),
(20, 1, '2021-06-06', '10:00:00', 0),
(21, 4, '2021-06-06', '11:00:00', 1),
(22, 4, '2021-06-13', '11:30:00', 0),
(23, 1, '2021-06-13', '12:00:00', 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `app_users`
--

CREATE TABLE `app_users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `voorletters` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `tussenvoegsel` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `achternaam` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `adres` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `postcode` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `woonplaats` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `telefoon` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `app_users`
--

INSERT INTO `app_users` (`id`, `username`, `password`, `email`, `roles`, `voorletters`, `tussenvoegsel`, `achternaam`, `adres`, `postcode`, `woonplaats`, `telefoon`) VALUES
(1, 'max', '$2y$13$DdPGoIbFovmPiWfg5OHyc.qYrNCAwKyOzJ9RU7V7DlpsTpC1gHmVK', 'max@wxs.nl', '[\"ROLE_ADMIN\"]', 'M.', NULL, 'Verstappen', 'Eijk 7', '1234HJ', 'Maaseik', '0682342343'),
(5, 'guus', '$2y$13$LBpQns643Tmfj0QrE0Kadu5vX27SWqhAaUf85m5JC3ng1WBRr8.eS', 'guus@duckstad.nl', '[\"ROLE_USER\"]', 'G.', NULL, 'Geluk', 'Guuslaan 1', '1234AS', 'Duckstad', '0612345678'),
(6, 'donald', '$2y$13$oDeyygHX.xlg7jp/e4eLcutMP5gduQPX1EtvAdbsZF3p//Cmn6yEW', 'donald@duckstad.nl', '[\"ROLE_USER\"]', 'D.', NULL, 'Duck', 'Donald Ducklaan 2', '1234AS', 'Duckstad', '0687654321'),
(7, 'katrien', '$2y$13$V.2gLuNAhA63pouMHu7iSu/a3yVCn95UX8FJApY62ExMLib/rntMu', 'katrien@duckstad.nl', '[\"ROLE_USER\"]', 'K.', NULL, 'Duck', 'Donald Ducklaan 3', '1234AS', 'Duckstad', '0687654567'),
(8, 'jorden', '$2y$13$Fiq1Yuah15YG7tI7Uvf//.52UI6I2uoAGw0YSrMqTpWUoVv5J76GO', 'Jordendebruin2001@gmail.com', '[\"ROLE_ADMIN\"]', 'J', 'de', 'Bruin', 'Pluimzegge 65', '2498DG', 'Den haag', '0612345678'),
(9, 'jorden2', '$2y$13$uxPBN4AXHkQVKSPbwLO6Nem7NQUc4C4fiKsT6yH1gKi.3HNkXs5.6', 'Jordendebruin2001@gmail.com', '[\"ROLE_USER\"]', 'J', 'de', 'Bruin', 'Pluimzegge 65', '2498DG', 'Den haag', '0612345678'),
(10, 'jorden3', '$2y$13$s.uQPjfZYMEZeqDzzxEOGOmmYSSRpXPtSi0joEMMLgT5VKtLpnmtK', 'Jordendebruin2001@gmail.com', '[\"ROLE_USER\"]', '1', 'de', 'Bruin', 'Pluimzegge 65', '2498DG', 'Den Haag', '0612345678');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `deelnames`
--

CREATE TABLE `deelnames` (
  `user_id` int(11) NOT NULL,
  `activiteit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `deelnames`
--

INSERT INTO `deelnames` (`user_id`, `activiteit_id`) VALUES
(6, 12),
(7, 10),
(7, 12),
(8, 9),
(9, 9),
(9, 10),
(9, 11),
(9, 12),
(9, 13),
(9, 14),
(9, 15),
(9, 16);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210409082719', '2021-04-09 10:27:41', 664),
('DoctrineMigrations\\Version20210423071145', '2021-04-23 09:12:04', 649);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `soortactiviteiten`
--

CREATE TABLE `soortactiviteiten` (
  `id` int(11) NOT NULL,
  `naam` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `min_leeftijd` int(11) NOT NULL,
  `tijdsduur` int(11) NOT NULL,
  `prijs` decimal(6,2) NOT NULL,
  `beschrijving` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `soortactiviteiten`
--

INSERT INTO `soortactiviteiten` (`id`, `naam`, `min_leeftijd`, `tijdsduur`, `prijs`, `beschrijving`) VALUES
(1, 'Vrije training', 12, 15, '15.00', 'vrij rijden'),
(2, 'Grand Prix', 12, 60, '50.00', 'Wie het snelst meerdere rondes heeft gereden'),
(3, 'Endurance race', 16, 90, '65.00', 'lang racen'),
(4, 'Kinder race', 8, 10, '18.00', 'race voor kinderen'),
(6, 'Senioren race', 45, 30, '15.50', 'Zo veel mogelijk rondjes rijden'),
(7, 'Duo race', 16, 45, '20.00', 'Deelnemers worden aan elkaar gekoppeld. De langzaamste deelnemer bepaald de positie op de scorelijst');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `activiteiten`
--
ALTER TABLE `activiteiten`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1C50895F3DEE50DF` (`soort_id`);

--
-- Indexen voor tabel `app_users`
--
ALTER TABLE `app_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C2502824F85E0677` (`username`);

--
-- Indexen voor tabel `deelnames`
--
ALTER TABLE `deelnames`
  ADD PRIMARY KEY (`user_id`,`activiteit_id`),
  ADD KEY `IDX_ED2478E7A76ED395` (`user_id`),
  ADD KEY `IDX_ED2478E75A8A0A1` (`activiteit_id`);

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `soortactiviteiten`
--
ALTER TABLE `soortactiviteiten`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `activiteiten`
--
ALTER TABLE `activiteiten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT voor een tabel `app_users`
--
ALTER TABLE `app_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `soortactiviteiten`
--
ALTER TABLE `soortactiviteiten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `activiteiten`
--
ALTER TABLE `activiteiten`
  ADD CONSTRAINT `FK_1C50895F3DEE50DF` FOREIGN KEY (`soort_id`) REFERENCES `soortactiviteiten` (`id`);

--
-- Beperkingen voor tabel `deelnames`
--
ALTER TABLE `deelnames`
  ADD CONSTRAINT `FK_ED2478E75A8A0A1` FOREIGN KEY (`activiteit_id`) REFERENCES `activiteiten` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_ED2478E7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

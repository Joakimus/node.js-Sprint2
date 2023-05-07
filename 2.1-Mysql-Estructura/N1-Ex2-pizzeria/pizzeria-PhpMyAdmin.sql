-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Temps de generació: 01-05-2023 a les 21:29:38
-- Versió del servidor: 8.0.32-0ubuntu0.20.04.2
-- Versió de PHP: 7.4.3-4ubuntu2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `pizzeria`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `botiga`
--

CREATE TABLE `botiga` (
  `botiga_id` int NOT NULL,
  `adresa` varchar(100) NOT NULL,
  `zip_codi` varchar(5) NOT NULL,
  `localitat` varchar(50) NOT NULL,
  `provincia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Bolcament de dades per a la taula `botiga`
--

INSERT INTO `botiga` (`botiga_id`, `adresa`, `zip_codi`, `localitat`, `provincia`) VALUES
(1, 'Carrer de Pallars 77', '08012', 'Barcelona', 'Barcelona'),
(2, 'Avinguda San Ramon 15', '08892', 'Cerdantola', 'Barcelona'),
(3, 'Rambla Egara 99', '09912', 'Terrassa', 'Barcelona'),
(4, 'Prat de la Riba 20', '09808', 'Sabadell', 'Barcelona');

-- --------------------------------------------------------

--
-- Estructura de la taula `categories_pizza`
--

CREATE TABLE `categories_pizza` (
  `categoria_id` int NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Bolcament de dades per a la taula `categories_pizza`
--

INSERT INTO `categories_pizza` (`categoria_id`, `nom`) VALUES
(1, 'Cat1'),
(2, 'Cat2'),
(3, 'Cat3');

-- --------------------------------------------------------

--
-- Estructura de la taula `client`
--

CREATE TABLE `client` (
  `client_id` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  `cognoms` varchar(50) NOT NULL,
  `adresa` varchar(100) NOT NULL,
  `zip_codi` varchar(5) NOT NULL,
  `localitat` varchar(50) NOT NULL,
  `provincia` varchar(50) NOT NULL,
  `telefon` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Bolcament de dades per a la taula `client`
--

INSERT INTO `client` (`client_id`, `nom`, `cognoms`, `adresa`, `zip_codi`, `localitat`, `provincia`, `telefon`) VALUES
(1, 'Pep', 'Camunyes', 'Rambla de la Muntanya 88', '08029', 'Barcelona', 'Barcelona', 666999666),
(2, 'Mariona', 'Palindrom', 'Av de la Plata 14', '08990', 'Badalona', 'Barcelona', 777666888),
(3, 'Ramonet', 'Espingarda', 'Carrer del Bodrio 9', '08999', 'Balaguer', 'Lleida', 678909876),
(4, 'Rosa', 'Morada', 'Carrer de Prat de la Riba 1', '08199', 'Alguaire', 'Lleida', 612345678);

-- --------------------------------------------------------

--
-- Estructura de la taula `comanda`
--

CREATE TABLE `comanda` (
  `comanda_id` int NOT NULL,
  `data_comanda` datetime NOT NULL,
  `tipus_comanda` enum('Repartiment','Domicili') NOT NULL,
  `quantitat_prod` int NOT NULL,
  `preu_producte` float NOT NULL,
  `client_id` int NOT NULL,
  `empleat_id` int NOT NULL,
  `botiga_id` int NOT NULL,
  `producte_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Bolcament de dades per a la taula `comanda`
--

INSERT INTO `comanda` (`comanda_id`, `data_comanda`, `tipus_comanda`, `quantitat_prod`, `preu_producte`, `client_id`, `empleat_id`, `botiga_id`, `producte_id`) VALUES
(1, '2020-08-22 00:00:00', 'Repartiment', 4, 10, 3, 1, 1, 6),
(2, '2019-05-19 00:00:00', 'Domicili', 2, 19.1, 2, 2, 2, 5),
(3, '2022-06-20 00:00:00', 'Repartiment', 1, 13.99, 3, 3, 3, 4),
(4, '2022-09-21 00:00:00', 'Domicili', 5, 14.75, 2, 4, 4, 3),
(5, '2021-03-23 00:00:00', 'Repartiment', 2, 28.5, 4, 2, 2, 2),
(6, '2018-11-11 00:00:00', 'Domicili', 1, 14.9, 2, 3, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `empleat`
--

CREATE TABLE `empleat` (
  `empleat_id` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  `cognoms` varchar(50) NOT NULL,
  `nif` varchar(9) NOT NULL,
  `telefon` int NOT NULL,
  `botiga_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Bolcament de dades per a la taula `empleat`
--

INSERT INTO `empleat` (`empleat_id`, `nom`, `cognoms`, `nif`, `telefon`, `botiga_id`) VALUES
(1, 'Elisabet', 'Panotxa Rupit', '12345678F', 931234567, 1),
(2, 'Obelus', 'Pelagius Pompaelus', '98765432T', 666555777, 2),
(3, 'Rosalinda', 'Rubicunda', '99845678F', 691234567, 3),
(4, 'Asterix', 'Panoramix', '82345678H', 935671234, 4);

-- --------------------------------------------------------

--
-- Estructura de la taula `producte`
--

CREATE TABLE `producte` (
  `producte_id` int NOT NULL,
  `tipus_producte` enum('Pizza','Hamburguesa','Beguda') NOT NULL,
  `nom` varchar(20) NOT NULL,
  `descripcio` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `imatge` varchar(50) NOT NULL,
  `preu` float NOT NULL,
  `categoria_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Bolcament de dades per a la taula `producte`
--

INSERT INTO `producte` (`producte_id`, `tipus_producte`, `nom`, `descripcio`, `imatge`, `preu`, `categoria_id`) VALUES
(1, 'Pizza', 'Rabiatta', 'Pizza molt picant', 'Imatge1', 14.9, 1),
(2, 'Hamburguesa', 'Angus', 'Autentic Angus de Nebraska', 'Imatge2', 14.25, 2),
(3, 'Beguda', 'Aquarius', 'Beguda Energètica', 'Imatge3', 2.95, 3),
(4, 'Pizza', 'Pepperoni', 'La més sabrosa', 'Imatge4', 13.99, 1),
(5, 'Hamburguesa', 'Tofu', 'Vegetariana', 'Imatge5', 9.55, 2),
(6, 'Beguda', 'Coca-cola', 'De tota la vida', 'Imatge6', 2.5, 3);

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `botiga`
--
ALTER TABLE `botiga`
  ADD PRIMARY KEY (`botiga_id`);

--
-- Índexs per a la taula `categories_pizza`
--
ALTER TABLE `categories_pizza`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Índexs per a la taula `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`);

--
-- Índexs per a la taula `comanda`
--
ALTER TABLE `comanda`
  ADD PRIMARY KEY (`comanda_id`),
  ADD KEY `comanda_ibfk_1` (`producte_id`),
  ADD KEY `botiga_id` (`botiga_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `empleat_id` (`empleat_id`);

--
-- Índexs per a la taula `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`empleat_id`);

--
-- Índexs per a la taula `producte`
--
ALTER TABLE `producte`
  ADD PRIMARY KEY (`producte_id`),
  ADD KEY `producte_ibfk_1` (`categoria_id`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `botiga`
--
ALTER TABLE `botiga`
  MODIFY `botiga_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la taula `categories_pizza`
--
ALTER TABLE `categories_pizza`
  MODIFY `categoria_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la taula `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la taula `empleat`
--
ALTER TABLE `empleat`
  MODIFY `empleat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la taula `producte`
--
ALTER TABLE `producte`
  MODIFY `producte_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `comanda`
--
ALTER TABLE `comanda`
  ADD CONSTRAINT `comanda_ibfk_1` FOREIGN KEY (`producte_id`) REFERENCES `producte` (`producte_id`);

--
-- Restriccions per a la taula `producte`
--
ALTER TABLE `producte`
  ADD CONSTRAINT `producte_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categories_pizza` (`categoria_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

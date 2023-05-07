CREATE TABLE `client` (
  `client_id` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  `cognom` varchar(50) NOT NULL,
  `carrer` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `pis` varchar(10) DEFAULT NULL,
  `ciutat` varchar(50) NOT NULL,
  `zip_codi` varchar(5) NOT NULL,
  `telefon` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_registre` date NOT NULL,
  `recomana_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `client` (`client_id`, `nom`, `cognom`, `carrer`, `numero`, `pis`, `ciutat`, `zip_codi`, `telefon`, `email`, `data_registre`, `recomana_id`) VALUES
(1, 'Pep', 'Calçaces', 'Rambla de la Muntanya', '88', '14', 'Barcelona', '08029', '666999666', 'peporro@gmail.com', '2012-05-19', NULL),
(2, 'Mariona', 'Palique', 'Av de la Plata', '14', '2', 'Badalona', '08990', '777666888', 'mariadelao@gmail.com', '2016-08-22', NULL),
(3, 'Ramonet', 'Porrompopom', 'Carrer del Bodrio', '9', '3', 'Argentona', '08999', '678909876', 'ramoncin@gmail.com', '2024-06-20', 1),
(4, 'Rosa', 'Mockejada', 'Carrer de Prat de la Riba', '1', '4', 'Sant Cugat del Valles', '08199', '612345678', 'rosinha@gmail.com', '2015-09-21', 3);


CREATE TABLE `compres` (
  `compra_id` int NOT NULL,
  `client_id` int NOT NULL,
  `ulleres_id` int NOT NULL,
  `empleat_id` int NOT NULL,
  `compra_data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `compres` (`compra_id`, `client_id`, `ulleres_id`, `empleat_id`, `compra_data`) VALUES
(1, 2, 1, 1, '2020-08-22'),
(2, 1, 2, 2, '2019-05-19'),
(3, 3, 3, 2, '2022-06-20'),
(4, 4, 4, 1, '2022-09-21'),
(5, 2, 5, 2, '2021-03-23'),
(6, 3, 6, 1, '2018-11-11');

CREATE TABLE `empleat` (
  `empleat_id` int NOT NULL,
  `nom` varchar(100) NOT NULL,
  `cognom` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `empleat` (`empleat_id`, `nom`, `cognom`) VALUES
(1, 'Elisabet', 'Panotxa'),
(2, 'Josele', 'Pelagius');


CREATE TABLE `proveidor` (
  `proveidor_id` int NOT NULL,
  `nom` varchar(100) NOT NULL,
  `carrer` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `pis` varchar(5) DEFAULT NULL,
  `porta` varchar(5) DEFAULT NULL,
  `ciutat` varchar(50) NOT NULL,
  `zip_codi` varchar(10) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `numero_fax` varchar(20) DEFAULT NULL,
  `nif` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `proveidor` (`proveidor_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `zip_codi`, `pais`, `telefon`, `numero_fax`, `nif`) VALUES
(1, 'Exilor', 'Av Mistral', '33', '1', '2', 'Barcelona', '08970', 'Cat', '931234567', '939988776', '12345678F'),
(2, 'EchoLenses', 'Cantersbury', '77', '1', '1', 'London', '66977', 'UK', '+44551234567', '+44551234567', '11223344S'),
(3, 'ZEISS', 'FreudinStrasse', '33', '10', '3', 'Berlin', '45678', 'Alemanya', '+49123456789', '+49123456789', '98765432T');


CREATE TABLE `ulleres` (
  `ulleres_id` int NOT NULL,
  `marca` varchar(100) NOT NULL,
  `graduacio_esq` float NOT NULL,
  `graduacio_dret` float NOT NULL,
  `muntura` enum('Flotant','Pasta','Metallic') NOT NULL,
  `color_muntura` varchar(20) NOT NULL,
  `color_esq` varchar(20) NOT NULL,
  `color_dret` varchar(20) NOT NULL,
  `preu` float NOT NULL,
  `proveidor_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `ulleres` (`ulleres_id`, `marca`, `graduacio_esq`, `graduacio_dret`, `muntura`, `color_muntura`, `color_esq`, `color_dret`, `preu`, `proveidor_id`) VALUES
(1, 'Cottet', 3, 5, 'Flotant', 'metalic', 'transparent', 'transparent', 349, 2),
(2, 'Reiban', 2, 2, 'Pasta', 'negre', 'verd fosc', 'verd fosc', 355, 1),
(3, 'Munich', 1, 2.5, 'Pasta', 'marró', 'verd clar', 'verd pastel', 480, 3),
(4, 'Etnia', 4.5, 6, 'Metallic', 'gris', 'transparent', 'transparent', 399, 1),
(5, 'Armanio', 2.5, 3.5, 'Flotant', 'gris', 'transparent', 'transparent', 599, 2),
(6, 'Guzzi', 3.5, 5, 'Pasta', 'fucsia', 'rosa', 'rosa', 555, 3);


--
-- Índexs per a la taula `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `recomana_id` (`recomana_id`);

--
-- Índexs per a la taula `compres`
--
ALTER TABLE `compres`
  ADD PRIMARY KEY (`compra_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `ulleres_id` (`ulleres_id`),
  ADD KEY `empleat_id` (`empleat_id`);

--
-- Índexs per a la taula `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`empleat_id`);

--
-- Índexs per a la taula `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`proveidor_id`);

--
-- Índexs per a la taula `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`ulleres_id`),
  ADD KEY `proveidor_id` (`proveidor_id`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la taula `compres`
--
ALTER TABLE `compres`
  MODIFY `compra_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la taula `empleat`
--
ALTER TABLE `empleat`
  MODIFY `empleat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la taula `proveidor`
--
ALTER TABLE `proveidor`
  MODIFY `proveidor_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la taula `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `ulleres_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`recomana_id`) REFERENCES `client` (`client_id`);

--
-- Restriccions per a la taula `compres`
--
ALTER TABLE `compres`
  ADD CONSTRAINT `compres_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `compres_ibfk_2` FOREIGN KEY (`ulleres_id`) REFERENCES `ulleres` (`ulleres_id`),
  ADD CONSTRAINT `compres_ibfk_3` FOREIGN KEY (`empleat_id`) REFERENCES `empleat` (`empleat_id`);

--
-- Restriccions per a la taula `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidor` (`proveidor_id`);
COMMIT;






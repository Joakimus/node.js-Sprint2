-- PIZZERIA

CREATE TABLE `client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `cognoms` varchar(50) NOT NULL,
  `adresa` varchar(100) NOT NULL,
  `zip_codi` varchar(5) NOT NULL,
  `localitat` varchar(50) NOT NULL,
  `provincia` varchar(50) NOT NULL,
  `telefon` int NOT NULL,
   PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `botiga` (
  `botiga_id` int NOT NULL AUTO_INCREMENT,
  `adresa` varchar(100) NOT NULL,
  `zip_codi` varchar(5) NOT NULL,
  `localitat` varchar(50) NOT NULL,
  `provincia` varchar(50) NOT NULL,
   PRIMARY KEY (`botiga_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `empleat` (
  `empleat_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `cognoms` varchar(50) NOT NULL,
  `nif` varchar(9) NOT NULL,
  `telefon` int NOT NULL,
  `botiga_id` int NOT NULL,
   PRIMARY KEY (`empleat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `categories_pizza` (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
   PRIMARY KEY (`categoria_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `producte` (
  `producte_id` int NOT NULL  AUTO_INCREMENT,
  `tipus_producte`  enum('Pizza','Hamburguesa','Beguda') NOT NULL,
  `nom` varchar(20) NOT NULL,
  `descripcio` varchar(50) NOT NULL,
  `imatge` varchar(50) NOT NULL,
  `preu` float NOT NULL,
  `categoria_id` int NOT NULL,
  CONSTRAINT `producte_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categories_pizza` (`categoria_id`),
  PRIMARY KEY (`producte_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `comanda` (
  `comanda_id` int NOT NULL,
  `data_comanda` datetime NOT NULL,
  `tipus_comanda`  enum('Repartiment','Domicili') NOT NULL,
  `quantitat_prod` int NOT NULL, 
  `preu_producte` float NOT NULL, 
  `client_id` int NOT NULL,
  `empleat_id` int NOT NULL,
  `botiga_id` int NOT NULL,
  `producte_id` int NOT NULL,
   CONSTRAINT `comanda_ibfk_1` FOREIGN KEY (`producte_id`) REFERENCES `producte` (`producte_id`),
   KEY `botiga_id` (`botiga_id`),
   KEY `client_id` (`client_id`),
   KEY `empleat_id` (`empleat_id`),
   PRIMARY KEY (`comanda_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserció de dades

INSERT INTO `client` (`client_id`, `nom`, `cognoms`, `adresa`, `zip_codi`, `localitat`, `provincia`, `telefon`) VALUES
(1, 'Pep', 'Camunyes', 'Rambla de la Muntanya 88', '08029', 'Barcelona', 'Barcelona', '666999666'),
(2, 'Mariona', 'Palindrom', 'Av de la Plata 14', '08990', 'Badalona',  'Barcelona', '777666888'),
(3, 'Ramonet', 'Espingarda', 'Carrer del Bodrio 9', '08999', 'Balaguer',  'Lleida', '678909876'),
(4, 'Rosa', 'Morada', 'Carrer de Prat de la Riba 1', '08199', 'Alguaire', 'Lleida', '612345678');


INSERT INTO `botiga` (`botiga_id`, `adresa`, `zip_codi`, `localitat`, `provincia`) VALUES
(1, 'Carrer de Pallars 77', '08012', 'Barcelona', 'Barcelona'),
(2, 'Avinguda San Ramon 15', '08892', 'Cerdantola', 'Barcelona'),
(3, 'Rambla Egara 99', '09912', 'Terrassa', 'Barcelona'),
(4, 'Prat de la Riba 20', '09808', 'Sabadell', 'Barcelona');


INSERT INTO `empleat` (`empleat_id`, `nom`, `cognoms`, `nif`, `telefon`, `botiga_id`) VALUES
(1, 'Elisabet', 'Panotxa Rupit', '12345678F','931234567','1'),
(2, 'Obelus', 'Pelagius Pompaelus', '98765432T', '666555777' ,'2'),
(3, 'Rosalinda', 'Rubicunda', '99845678F','691234567','3'),
(4, 'Asterix', 'Panoramix', '82345678H','935671234','4');


INSERT INTO `categories_pizza` (`categoria_id`, `nom`) VALUES
(1, 'Cat1'),
(2, 'Cat2'),
(3, 'Cat3');

 
INSERT INTO `producte` (`producte_id`, `tipus_producte`, `nom`, `descripcio`, `imatge`, `preu`, `categoria_id`) VALUES
(1, 'Pizza', 'Rabiatta', 'Pizza molt picant', 'Imatge1', 14.9, 1),
(2, 'Hamburguesa', 'Angus', 'Autentic Angus de Nebraska', 'Imatge2', 14.25, 2),
(3, 'Beguda', 'Aquarius', 'Beguda Energètica', 'Imatge3', 2.95, 3),
(4, 'Pizza', 'Pepperoni', 'La més sabrosa', 'Imatge4',  13.99, 1),
(5, 'Hamburguesa','Tofu', 'Vegetariana', 'Imatge5', 9.55, 2),
(6, 'Beguda', 'Coca-cola', 'De tota la vida', 'Imatge6', 2.5 , 3);


INSERT INTO `comanda` (`comanda_id`, `data_comanda`, `tipus_comanda`, `quantitat_prod`, `preu_producte`, `client_id`, `empleat_id`, `botiga_id`, `producte_id`) VALUES
(1, '2020-08-22', 'Repartiment', 4, 10, 3, 1, 1, 6),
(2, '2019-05-19', 'Domicili', 2, 19.10, 2, 2, 2, 5),
(3, '2022-06-20', 'Repartiment', 1, 13.99, 3, 3, 3, 4), 
(4, '2022-09-21', 'Domicili', 5, 14.75, 2, 4, 4 ,3),
(5, '2021-03-23', 'Repartiment',2 ,28.5, 4, 2, 2 ,2),
(6, '2018-11-11', 'Domicili',1 ,14.9 ,2, 3, 3 ,1);

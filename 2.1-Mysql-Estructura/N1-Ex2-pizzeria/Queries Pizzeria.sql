--Queries Pizzeria-
--1) Llista quants productes de tipus “Begudes”. s'han venut en una determinada localitat

SELECT prod.producte_id,prod.nom,botig.localitat  FROM producte prod JOIN botiga botig JOIN comanda com ON prod.tipus_producte = 'beguda' and prod.producte_id = com.producte_id AND botig.botiga_id = com.botiga_id AND botig.localitat = 'Barcelona';
SELECT prod.producte_id,prod.nom,botig.localitat  FROM producte prod JOIN botiga botig JOIN comanda com ON prod.tipus_producte = 'beguda' and prod.producte_id = com.producte_id AND botig.botiga_id = com.botiga_id AND botig.localitat = 'Sabadell';

--2) Llista quantes comandes ha efectuat un determinat empleat/da
-- Llista de les comandes que ha gestionat un determinat empleat
SELECT * FROM comanda com WHERE com.empleat_id = 4;

-- Quantes comandes que ha tramitat un determinat empleat
SELECT  COUNT(DISTINCT com.comanda_id) AS nombreDeComandes, empleat_id  
FROM comanda com
WHERE com.empleat_id = 3;


 

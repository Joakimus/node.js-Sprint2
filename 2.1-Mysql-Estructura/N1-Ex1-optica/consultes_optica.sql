-- CONUSLTES Mysql

--Llista la suma de les compres (import total de les compres) d'un client: 
select sum(preu) as Total_factura  
from ulleres u join client cli  join compres comp 
where cli.client_id = 2 and cli.client_id = comp.client_id and u.ulleres_id = comp.ulleres_id;

    
-- Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
SELECT     marca FROM ulleres u JOIN empleat emp JOIN compres comp WHERE emp.empleat_id = 1     
AND comp.empleat_id = emp.empleat_id and u.ulleres_id = comp.ulleres_id  
AND comp.compra_data BETWEEN '2018-01-01' AND '2018-12-31';
 
 SELECT marca FROM ulleres u JOIN empleat emp JOIN compres comp
WHERE year(comp.compra_data) = 2022 and emp.empleat_id = 2 AND comp.empleat_id = emp.empleat_id and u.ulleres_id = comp.ulleres_id;


--Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
        
SELECT DISTINCT  prov.proveidor_id, nom 
FROM  proveidor prov 
JOIN  ulleres u JOIN  compres comp  
WHERE  prov.proveidor_id = u.proveidor_id  AND u.ulleres_id = comp.ulleres_id;

-- A una sola linia
SELECT DISTINCT  prov.proveidor_id,nom FROM proveidor prov  JOIN  ulleres u JOIN  compres comp WHERE prov.proveidor_id = u.proveidor_id  AND u.ulleres_id = comp.ulleres_id;



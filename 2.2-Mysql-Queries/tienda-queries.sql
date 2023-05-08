--1)
SELECT nombre FROM producto;
--2)
SELECT nombre, precio FROM producto;
--3)
SELECT * FROM producto;
--Canvi actual 1€ = 1.10195&
--4)
SELECT nombre, precio as 'preu em €', (precio*1.10195) as 'dolars $'  from producto;
--5)
SELECT nombre AS 'nom de producto', precio AS 'euros', (precio*1.10195) AS 'dòlars' FROM producto;
--6)
SELECT UPPER(nombre), precio FROM producto;
--7)
SELECT LOWER(nombre), precio FROM producto;
--8)
SELECT nombre, UPPER(SUBSTR(nombre,1,2)) FROM fabricante;
--9)
SELECT nombre, ROUND(precio) FROM producto;
--10)
SELECT nombre, FLOOR(precio) FROM producto;
--11)
SELECT codigo_fabricante FROM producto ORDER BY codigo_fabricante ASC;
--12)
SELECT DISTINCT(codigo_fabricante) FROM producto ORDER BY codigo_fabricante ASC;
--13)
SELECT nombre FROM fabricante ORDER BY nombre ASC;
--14) 
SELECT nombre FROM fabricante ORDER BY nombre DESC;
--15) 
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
--16) 
SELECT * FROM fabricante LIMIT 5;
--17)
SELECT * FROM fabricante LIMIT 3,2;
--18)
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
--19)
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
--20)
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
--21)
SELECT prod.nombre AS producte, precio AS preu, fab.nombre AS fabricant FROM producto prod JOIN fabricante fab  ON (fab.codigo = prod.codigo_fabricante);
--22)
SELECT prod.nombre AS producte, precio AS preu, fab.nombre AS fabricant FROM producto prod JOIN fabricante fab  ON (fab.codigo = prod.codigo_fabricante) order by fabricant ASC;
--23)
SELECT p.codigo AS 'codigo producto', p.nombre AS producte, f.codigo AS 'codigo fabricante', f.nombre AS fabricant FROM producto p JOIN fabricante f ON (f.codigo = p.codigo_fabricante);
--24)
SELECT p.nombre AS producte, precio AS preu, f.nombre AS fabricant FROM producto p JOIN fabricante f ON (f.codigo = p.codigo_fabricante) ORDER BY preu ASC LIMIT 1;
--25)
SELECT p.nombre AS producte, precio AS preu, f.nombre AS fabricant FROM producto p JOIN fabricante f ON (f.codigo = p.codigo_fabricante) ORDER BY preu DESC LIMIT 1;
--26)
SELECT p.nombre FROM producto p JOIN fabricante f ON (f.codigo = p.codigo_fabricante) WHERE f.nombre = 'Lenovo';
--27)
SELECT p.nombre FROM producto p JOIN fabricante f ON (f.codigo = p.codigo_fabricante) WHERE f.nombre = 'Crucial' AND precio > 200;
--28)
SELECT f.nombre AS 'Fabricante', p.nombre AS 'Producto'FROM producto p JOIN fabricante f ON (f.codigo = p.codigo_fabricante) WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';
--29)
SELECT f.nombre AS 'Fabricante', p.nombre AS 'Producto'FROM producto p JOIN fabricante f ON (f.codigo = p.codigo_fabricante) WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
--30)
SELECT f.nombre AS 'Fabricante', p.nombre AS 'Producto', precio FROM producto p JOIN fabricante f ON (f.codigo = p.codigo_fabricante) WHERE f.nombre REGEXP('e$');
--31)
SELECT f.nombre AS 'Fabricante', p.nombre AS 'Producto', precio FROM producto p JOIN fabricante f ON (f.codigo = p.codigo_fabricante) WHERE f.nombre LIKE '%w%';
--32)
SELECT p.nombre AS 'Producto', precio, f.nombre AS 'Fabricante'FROM producto p JOIN fabricante f ON (f.codigo = p.codigo_fabricante) WHERE precio >= 180 ORDER BY precio DESC, Producto ASC;
--33)
SELECT f.codigo, f.nombre FROM fabricante f JOIN producto p ON (f.codigo = p.codigo_fabricante) GROUP BY (f.codigo);
--34)
SELECT f.codigo, f.nombre AS 'Frabricante', p.nombre AS 'Producto'FROM fabricante f LEFT JOIN producto p ON (f.codigo = p.codigo_fabricante);
--35)
SELECT f.codigo, f.nombre AS 'Frabricante', p.nombre AS 'Producto'FROM fabricante f LEFT JOIN producto p ON (f.codigo = p.codigo_fabricante) WHERE p.nombre IS NULL;
--36)
SELECT p.nombre FROM producto p, fabricante f WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Lenovo';
--37)
SELECT p.codigo, p.nombre, p.precio, codigo_fabricante FROM producto p, fabricante f WHERE f.codigo = p.codigo_fabricante AND precio = (SELECT p.precio FROM producto p, fabricante f WHERE (f.codigo = p.codigo_fabricante) AND f.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1);
--38)
SELECT p.nombre FROM producto p, fabricante f WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1;
--39)
SELECT p.nombre FROM producto p, fabricante f WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Hewlett-Packard'ORDER BY p.precio ASC LIMIT 1;
--40)
SELECT p.codigo, p.nombre, p.precio, codigo_fabricante FROM producto p, fabricante f WHERE (f.codigo = p.codigo_fabricante) AND precio >= (SELECT p.precio FROM producto p, fabricante f WHERE (f.codigo = p.codigo_fabricante) AND f.nombre = 'Lenovo'  ORDER BY p.precio DESC LIMIT 1);
--41
SELECT p.codigo, p.nombre, p.precio, codigo_fabricante FROM producto p, fabricante f WHERE (f.codigo = p.codigo_fabricante) AND f.nombre = 'Asus' AND precio >= (SELECT AVG(p.precio) FROM producto p, fabricante f WHERE (f.codigo = p.codigo_fabricante) AND f.nombre = 'Asus'ORDER BY p.precio DESC);

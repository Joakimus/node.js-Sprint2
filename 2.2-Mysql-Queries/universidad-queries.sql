-- University QUERIES
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
-- 2
SELECT nombre, apellido1, apellido2, telefono FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
-- 3 
SELECT nombre, apellido1, apellido2, fecha_nacimiento FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
-- 4
SELECT nombre, apellido1, apellido2, telefono, nif FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif REGEXP('K$');
SELECT nombre, apellido1, apellido2, telefono, nif FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND SUBSTR(nif,9,1)='K';
SELECT nombre, apellido1, apellido2, telefono, nif FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';
-- 5
SELECT id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado FROM asignatura WHERE cuatrimestre=1 and curso=3 and id_grado =7;
-- 6
SELECT p.apellido1, p.apellido2, p.nombre as 'Profesor', dep.nombre as 'Departamento' FROM persona p join profesor prof join departamento dep WHERE (tipo = 'profesor') AND (p.id = prof.id_profesor) AND (prof.id_departamento = dep.id) order by p.apellido1 ASC, p.apellido2 ASC,  Profesor ASC;
SELECT apellido1, apellido2, p.nombre AS 'nombre', d.nombre 'departamento' FROM persona p JOIN profesor prof ON (id_profesor = p.id) JOIN departamento d ON (d.id = prof.id_departamento) WHERE tipo = 'profesor' ORDER BY apellido1, apellido2, nombre;
-- 7
SELECT a.nombre, anyo_inicio, anyo_fin FROM persona p JOIN alumno_se_matricula_asignatura ama ON p.id = ama.id_alumno JOIN curso_escolar ce ON ce.id = ama.id_curso_escolar JOIN asignatura a ON a.id = ama.id_asignatura WHERE nif = '26902806M';
-- 8
SELECT d.nombre AS 'departamento' FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN asignatura a USING(id_profesor) JOIN grado g ON g.id = a.id_grado WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)'GROUP BY departamento;
-- 9
SELECT p.nombre 'alumno/a'FROM persona p JOIN alumno_se_matricula_asignatura ama ON p.id = ama.id_alumno JOIN curso_escolar ce ON ce.id = ama.id_curso_escolar WHERE p.tipo = 'alumno' AND ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019 GROUP BY p.nombre;
-- 10 - llistat amb els noms de tots els professors/es i els departaments que tenen vinculats
SELECT d.nombre AS 'departamento', p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', p.nombre AS 'nom'FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON d.id = pr.id_departamento WHERE p.tipo = 'profesor'ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
-- 11 - llistat amb els professors/es que no estan associats a un departament (NO n'hi ha cap = Empty set)            
SELECT d.nombre AS 'departamento', p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', p.nombre AS 'nom'FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON d.id = pr.id_departamento WHERE p.tipo = 'profesor' AND d.nombre IS NULL;
-- 12 - llistat amb els departaments que no tenen professors/es associats
SELECT d.nombre AS 'departamento', p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', p.nombre AS 'nom'FROM persona p RIGHT JOIN profesor pr ON p.id = pr.id_profesor RIGHT JOIN departamento d ON d.id = pr.id_departamento WHERE p.nombre IS NULL;
-- 13 - llistat amb els professors/es que no imparteixen cap assignatura
SELECT p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', p.nombre AS 'nom', a.nombre AS 'Asignatura'FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a USING (id_profesor) WHERE p.tipo = 'profesor' AND a.nombre IS NULL;
-- 14 - listat amb les assignatures que no tenen un professor/a assignat
SELECT p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', p.nombre AS 'nom', a.nombre AS 'Asignatura'FROM persona p RIGHT JOIN profesor pr ON p.id = pr.id_profesor RIGHT JOIN asignatura a USING (id_profesor) WHERE p.nombre IS NULL;
-- 15 - llistat amb tots els departaments que no han impartit assignatures en cap curs escolar             
SELECT d.nombre, COUNT(ama.id_curso_escolar) FROM universidad.departamento d LEFT JOIN universidad.profesor p ON p.id_departamento = d.id LEFT JOIN universidad.asignatura a USING (id_profesor) LEFT JOIN universidad.alumno_se_matricula_asignatura ama ON (ama.id_asignatura = a.id) GROUP BY d.nombre HAVING COUNT(ama.id_curso_escolar) = 0;
-- Consultes resum:
-- 16 - Retorna el nombre total d'alumnes que hi ha
SELECT count(id) FROM persona WHERE tipo = 'alumno';
-- 17- Calcula quants alumnes van néixer en 1999
SELECT count(id) FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
-- 18 -Calcula quants professors/es hi ha en cada departament.
SELECT d.nombre AS 'departamento', count(p.id) AS Total FROM persona p JOIN profesor pr ON p.id = pr.id_profesor JOIN departamento d ON d.id = pr.id_departamento GROUP BY d.nombre ORDER BY Total DESC;
-- 19 - llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells
SELECT d.nombre AS 'departamento', count(p.id) AS Total FROM persona p RIGHT JOIN profesor pr ON p.id = pr.id_profesor RIGHT JOIN departamento d ON d.id = pr.id_departamento GROUP BY d.nombre ORDER BY Total DESC;
-- 20 - llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun
SELECT g.id, g.nombre AS 'Grado', COUNT(a.id) AS 'Total'FROM grado g LEFT JOIN asignatura a ON a.id_grado = g.id GROUP BY g.id ORDER BY total DESC;
-- 21 - llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades
SELECT g.id, g.nombre AS 'Grado', COUNT(a.id) AS 'Total'FROM grado g LEFT JOIN asignatura a ON a.id_grado = g.id GROUP BY g.id HAVING Total > 40 ORDER BY total DESC;
-- 22 -  llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura  
select g.nombre, asig.tipo, sum(creditos) as suma_creditos from asignatura asig inner join grado g on (asig.id_grado = g.id) group by asig.tipo, asig.id_grado;
-- 23 - llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars
SELECT anyo_inicio, COUNT(DISTINCT(ama.id_alumno)) FROM curso_escolar ce JOIN alumno_se_matricula_asignatura ama ON ce.id = ama.id_curso_escolar GROUP BY anyo_inicio;
-- 24 - llistat amb el nombre d'assignatures que imparteix cada professor/a
SELECT p.id, p.nombre, p.apellido1, p.apellido2, count(a.nombre) 'total'FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a USING (id_profesor) WHERE p.tipo = 'profesor'GROUP BY p.id ORDER BY total DESC;
-- 25 - Retorna totes les dades de l'alumne/a més jove
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
-- 26 - llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura
SELECT apellido1, apellido2, p.nombre AS 'nombre', d.nombre AS 'departamento', a.nombre AS 'asignatura'FROM persona p JOIN profesor pr ON (id_profesor = p.id) JOIN departamento d ON d.id = pr.id_departamento LEFT JOIN asignatura a USING (id_profesor) WHERE p.tipo = 'profesor' AND a.id IS NULL ORDER BY departamento;

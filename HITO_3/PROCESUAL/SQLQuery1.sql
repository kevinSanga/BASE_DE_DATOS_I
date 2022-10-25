create database procesual;

use procesual;

create table CAMPEONATO(

id_CAMPEONATO VARCHAR(12) PRIMARY KEY not null,
NOMBRE_CAMPEONATO VARCHAR (30) not null,
SEDE VARCHAR(20) not null,

);



create table EQUIPO(

ID_EQUIPO VARCHAR(12)PRIMARY KEY not null,
NOMBRE_EQUIPO VARCHAR(30) not null,
CATEGORIA VARCHAR(50) not null,
id_CAMPEONATO VARCHAR(50) not null,
);


CREATE TABLE JUGADOR(

id_JUDAGOR VARCHAR(12) PRIMARY KEY not null,
NOMBRES VARCHAR(30)not null,
APELLIDOS VARCHAR(50)not null,
CI varchar(12)not null,
EDAD INTEGER not null,
ID_EQUIPO VARCHAR(50) not null,

);


INSERT INTO CAMPEONATO (id_CAMPEONATO,NOMBRE_CAMPEONATO,SEDE)
VALUES('camp-111','Campeonato Unifranz','El Alto'),
('camp-222','Campeonato Unifranz','Cochabamba');


INSERT INTO EQUIPO(ID_EQUIPO,NOMBRE_EQUIPO,CATEGORIA,id_CAMPEONATO)
VALUES('equ-111','Google','varones','camp-111'),
('equ-222','404 Not found','varones','camp-111'),
('equ-333','girls unifranz','mujeres','camp-111');


INSERT INTO JUGADOR (id_JUDAGOR,NOMBRES,APELLIDOS,CI,EDAD,ID_EQUIPO)
VALUES
('jug-111','Carlos','Villa','8997811LP',19,'equ-222'),
('jug-222','Pedro','Salas','8997822LP',20,'equ-222'),
('jug-333','Saul','Araj','8997833LP',21,'equ-222'),
('jug-444','Sandra','Solis','8997844LP',20,'equ-333'),
('jug-555','Ana','Mica','8997855LP',23,'equ-333');



---Mostrar que jugadores que son del equipo equ-222
SELECT ju.*
FROM JUGADOR AS Ju
	INNER JOIN EQUIPO AS Equi ON Ju.ID_EQUIPO = Equi.ID_EQUIPO
WHERE Equi.ID_EQUIPO = 'equ-222';


--Mostrar que jugadores(nombres, apellidos) que juegan en la sede de El Alto

SELECT Ju.NOMBRES,Ju.APELLIDOS
FROM JUGADOR AS Ju
	INNER JOIN EQUIPO AS Equi ON Ju.ID_EQUIPO = Equi.ID_EQUIPO
	INNER JOIN CAMPEONATO AS Camp ON Equi.id_CAMPEONATO=Camp.id_CAMPEONATO
WHERE Camp.SEDE = 'El AlTO';



--Mostrar aquellos jugadores mayores o igual a 21 años que sean de la categoría VARONES.
SELECT ju.*
FROM JUGADOR AS Ju
	INNER JOIN EQUIPO AS Equi ON Ju.ID_EQUIPO = Equi.ID_EQUIPO
	INNER JOIN CAMPEONATO AS Camp ON Equi.id_CAMPEONATO=Camp.id_CAMPEONATO
WHERE Equi.CATEGORIA = 'VARONES' AND Ju.EDAD >= 21;



--Mostrar a todos los estudiantes en donde su apellido empiece con la letra S
SELECT Ju.*
FROM JUGADOR AS Ju
	INNER JOIN EQUIPO AS Equi ON Ju.ID_EQUIPO = Equi.ID_EQUIPO
WHERE Ju.APELLIDOS LIKE 'S%';



--Podría utilizar la instrucción LIKE
SELECT Ju.*,Camp.id_CAMPEONATO,Equi.CATEGORIA
FROM JUGADOR AS Ju
	INNER JOIN EQUIPO AS Equi ON Ju.ID_EQUIPO = Equi.ID_EQUIPO
	INNER JOIN CAMPEONATO AS Camp ON Equi.id_CAMPEONATO=Camp.id_CAMPEONATO
WHERE Equi.CATEGORIA = 'MUJERES' AND Camp.id_CAMPEONATO='camp-111'



--Mostrar que equipos forman parte del campeonato camp-111 y además sean de la categoría MUJERES.
SELECT Equi.NOMBRE_EQUIPO
FROM JUGADOR AS Ju
	INNER JOIN EQUIPO AS Equi ON Ju.ID_EQUIPO = Equi.ID_EQUIPO
	INNER JOIN CAMPEONATO AS Camp ON Equi.id_CAMPEONATO=Camp.id_CAMPEONATO
WHERE Ju.id_JUDAGOR='jug-333'



--Mostrar el nombre del equipo del jugador con id_jugador igual a jug-333
SELECT Camp.NOMBRE_CAMPEONATO
FROM JUGADOR AS Ju
	INNER JOIN EQUIPO AS Equi ON Ju.ID_EQUIPO = Equi.ID_EQUIPO
	INNER JOIN CAMPEONATO AS Camp ON Equi.id_CAMPEONATO=Camp.id_CAMPEONATO
WHERE Ju.id_JUDAGOR='jug-333'



--Mostrar el nombre del campeonato del jugador con id_jugador igual a jug-333
SELECT Equi.ID_EQUIPO,Camp.id_CAMPEONATO,Ju.id_JUDAGOR*
FROM JUGADOR AS Ju
	INNER JOIN EQUIPO AS Equi ON Ju.ID_EQUIPO = Equi.ID_EQUIPO
	INNER JOIN CAMPEONATO AS Camp ON Equi.id_CAMPEONATO=Camp.id_CAMPEONATO
	



--Crear una consulta SQL que maneje las 3 tablas de la base de datos.

SELECT COUNT(E.ID_EQUIPO)
FROM EQUIPO AS E


--¿Qué estrategia utilizaría para determinar cuántos equipos inscritos hay?

SELECT COUNT(Ju.id_JUDAGOR)
FROM JUGADOR AS Ju
	INNER JOIN EQUIPO AS Equi ON Ju.ID_EQUIPO = Equi.ID_EQUIPO
	INNER JOIN CAMPEONATO AS Camp ON Equi.id_CAMPEONATO=Camp.id_CAMPEONATO
WHERE Equi.CATEGORIA='MUJERES';




















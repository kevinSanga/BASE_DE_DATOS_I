create database procesual_4;

use procesual_4;

create table CAMPEONATO(
id_CAMPEONATO VARCHAR(12) PRIMARY KEY NOT NULL,
NOMBRE_CAMPEONATO VARCHAR(30) NOT NULL,
SEDE VARCHAR(20) NOT NULL
);

create table EQUIPO(
ID_EQUIPO VARCHAR(12)PRIMARY KEY NOT NULL,
NOMBRE_EQUIPO VARCHAR(30) NOT NULL,
CATEGORIA VARCHAR(8) NOT NULL,
id_CAMPEONATO VARCHAR(12) NOT NULL,
FOREIGN KEY (id_CAMPEONATO) REFERENCES CAMPEONATO (id_CAMPEONATO),
);

CREATE TABLE JUGADOR(
id_JUDAGOR VARCHAR(12) PRIMARY KEY NOT NULL,
NOMBRES VARCHAR(30) not null,
APELLIDOS VARCHAR(50) not null,
CI   varchar(15) not null,
EDAD INTEGER not null,
ID_EQUIPO VARCHAR(12) not null,
FOREIGN KEY (ID_EQUIPO) REFERENCES EQUIPO (ID_EQUIPO)
);

INSERT INTO CAMPEONATO (id_CAMPEONATO,NOMBRE_CAMPEONATO,SEDE)
VALUES('camp-111','Campeonato Unifranz','El Alto'),
      ('camp-222','Campeonato Unifranz','Cochabamba');

INSERT INTO EQUIPO(ID_EQUIPO,NOMBRE_EQUIPO,CATEGORIA,id_CAMPEONATO)
VALUES('equ-111','Google','varones','camp-111'),
      ('equ-222','404 Not found','varones','camp-111'),
      ('equ-333','girls unifranz','mujeres','camp-111');

INSERT INTO JUGADOR (id_JUDAGOR,NOMBRES,APELLIDOS,CI,EDAD,ID_EQUIPO)
VALUES('jug-111','Carlos','Villa','8997811LP',19,'equ-222'),
	  ('jug-222','Pedro','Salas','8997822LP',20,'equ-222'),
	  ('jug-333','Saul','Araj','8997833LP',21,'equ-222'),
	  ('jug-444','Sandra','Solis','8997844LP',20,'equ-333'),
	  ('jug-555','Ana','Mica','8997855LP',23,'equ-333');

---------------------------------------------------------------
-------------------ejercicios de funciones-----------------------1.Mostrar que jugadores que formen parte del equipo equ-333--select *
from JUGADOR as jug
where jug.id_EQUIPO = 'equ-333';--2. Crear una función que permita saber cuántos jugadores están inscritos.
--■ La función debe llamarse F1_CantidadJugadores()

create function F1_CantidadJugadores()
returns integer as 
begin
declare @respuesta int
		select @respuesta = count (jug.id_JUDAGOR)
		from JUGADOR as jug
		return @respuesta
end;

select dbo.F1_CantidadJugadores() as jugadores
--3. Crear una función que permita saber cuántos jugadores están inscritos y que sean de la categoría varones o
--mujeres.
--■ La función debe llamarse F2_CantidadJugadoresParam()
--■ La función debe recibir un parámetro “Varones” o “Mujeres”create function F2_CantidadJugadoresParam(@gen varchar(50))
returns int as 
begin
declare @respuesta int
		select @respuesta = count (jug.id_JUDAGOR)
		from JUGADOR as jug
		inner join EQUIPO as eq on eq.id_EQUIPO=jug.id_EQUIPO
		where eq.CATEGORIA = @gen
		return @respuesta
end;

select dbo.F2_CantidadJugadoresParam('Mujeres') as jugadores--4. Crear una función que obtenga el promedio de las edades mayores a una cierta edad.
--■ La función debe llamarse F3_PromedioEdades()
--■ La función debe recibir como parámetro 2 valores.
--■ La categoría. (Varones o Mujeres)
--■ La edad con la que se comparara (21 años ejemplo)
--■ Es decir mostrar el promedio de edades que sean de una categoría y que sean mayores a 21 años.create function F3_PromedioEdades(@EDAD varchar(50),@gen varchar(50))
returns int as 
begin
declare @respuesta int
		select @respuesta = avg (jug.EDAD)
		from JUGADOR as jug
		inner join EQUIPO as eq on eq.id_EQUIPO=jug.id_EQUIPO
		where eq.CATEGORIA = @gen and jug.EDAD >@EDAD;
		return @respuesta
end;

select dbo.F3_PromedioEdades(21,'VARONES') as jugadores--5. Crear una función que permita concatenar 3 parámetros.
--■ La función debe llamarse F4_ConcatItems()
--■ La función debe de recibir 3 parámetros.
--■ La función debe de concatenar los 3 valores.
--■ Para verificar la correcta creación de la función debe mostrar lo siguiente.
--■ Mostrar los nombres de los jugadores, el nombre del equipo y la sede concatenada, utilizando la función
--que acaba de crear.

create function F4_ConcatItems()
returns varchar(100) as 
begin
declare @respuesta varchar(100)
		select @respuesta = jug.NOMBRES +' ' + eq.NOMBRE_EQUIPO+' ' + cam.SEDE
		from JUGADOR as jug
		inner join EQUIPO as eq on eq.id_EQUIPO=jug.id_EQUIPO
		inner join CAMPEONATO AS cam on  cam.id_CAMPEONATO=eq.id_CAMPEONATO
		where jug.NOMBRES = 'Carlos' and eq.NOMBRE_EQUIPO = '404 Not found' and cam.SEDE='El Alto'
		return @respuesta
end;
select dbo.F4_ConcatItems() as jugadores 
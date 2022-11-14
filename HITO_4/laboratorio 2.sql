create table escuela (
id_esc integer identity primary key not null,
nombres varchar (50) not null,
direccion varchar (50) not null,
turno varchar (50) not null
);
insert into escuela (nombres, direccion, turno) values
('san simon', 'cochabamba', 'manana'),
('andres bellos', 'El Alto', 'manana-tarde'),
('amor de dios fe y alegria','El Alto','manana-tarde'),
('don bosco', 'La Paz', 'manana-tarde-noche');



drop table estudiantes

create table estudiantes(
id_est integer identity primary key not null,
nombres varchar (50) not null,  
apellidos varchar (50) not null,
edad integer not null,
fono integer not null,
email varchar (50) not null,
direccion varchar (50) not null,
genero varchar (50) not null,
id_esc integer not null,
licencia_conducir bit not null,
foreign key (id_esc) REFERENCES escuela(id_esc) 
);

use hito_4; 

insert into estudiantes (nombres, apellidos, edad, fono, email, direccion, genero, licencia_conducir, id_esc)
values ('miguel', 'gonzales valiz', 20, 29322115, 'miguel@gmail.com', 'Av. 6 de agosto','masculino',0, 1),
       ('sandra', 'mavir udria', 25, 2832116, 'sandra@gmail.com', 'Av. 6 de agosto', 'femenino',0, 2),
       ('joel', 'adubiri mondar', 30, 29322117, 'joel@gmail.com', 'Av. 6 de agosto','masculino',0, 3),
       ('andrea', 'arias ballesteros', 21, 29322118, 'andrea@gmail.com', 'Av. 6 de agosto','femenino',0, 4),
       ('santos', 'montes valezuela', 24, 29322119, 'santos@gmail.com', 'Av. 6 de agosto','masculino',0, 1);
	   	  
insert into estudiantes (nombres, apellidos, edad, fono, email, direccion, genero, licencia_conducir, id_esc)
values ('ana', 'gonzales valiz', 20, 29322115, 'ana@gmail.com', 'Av. 6 de agosto','femenino', 1, 2);

insert into estudiantes (nombres, apellidos, edad, fono, email, direccion, genero, licencia_conducir, id_esc)
values ('pepe', 'gonzales valiz', 20, 29322115, 'pepe@gmail.com', 'Av. 6 de agosto','masculino',0, 3);
------------------------------------------------------
select est.*
from estudiantes as est; 
------------------------------------------------------
select COUNT (est.id_est)
from estudiantes as est
where est.edad < 20 and est.licencia_conducir = 1;
----------determina cuantos estudiantes estudian en el colegio amor de dios fe y alegria---------------------------
select count (est.id_est)
from estudiantes as est 
inner join escuela as esc on est.id_esc = esc.id_esc
where esc.nombres = 'amor de dios fe y alegria';
----------determinar cuantos estudiantes pasan en la tarde---------------------------------------------------------
select count (est.id_est)
from estudiantes as est 
inner join escuela as esc on est.id_esc = esc.id_esc
where esc.turno = 'manana-tarde';
-----determinar cuantos estudiantes mayores a 25 años estan en escuelas y tiene solo el turno de la tarde----------
select count (est.id_est)
from estudiantes as est 
inner join escuela as esc on est.id_esc = esc.id_esc
where est.edad > 25 and esc.turno like '%tarde%';

------------------------FUNCIONES DIFINIDA POR EL USUARIO------------------------------------------------------------------

create function retorna_nombre_materia ()
returns varchar(20) as
begin 
return 'base de datos I'
END; 
----------en dbo siempre debe utilizarse-------------------------------
select dbo.retorna_nombre_materia()as BDA;

create function retorna_nombre_materia_v2 ()
returns varchar (25) as
begin

DECLARE @NOMBRE VARCHAR (25); --@nombre

set @nombre = 'base de datos II';
return @nombre;
END;


select dbo.retorna_nombre_materia_v2()as BDA;
------------------------------------------------
CREATE function retorna_nombre_materia_v3(@nombreMateria varchar(25))
returns varchar (25) as
begin
declare @nombre varchar(25);
set @nombre = @nombreMateria;
return @nombre;
end;

select dbo.retornar_nombre_materia_v3('DBA I');
---------crear una funcion cualquiera  que no recive parametro el parametro debe sumar 2 numeros cualquiera la funcion retorna la suma----------

create function suma_dos_numeros()
returns integer as
begin
declare @resultado integer;
set @resultado= 5+5;
return @resultado;
end;

select dbo.suma_dos_numeros();

create function 
returns integer as 
begin
declare @num1 integer =5;
declare @num2 integer =5;
declare @resultado = @num1 + @num2;



-------
create function suma_tres_suma (@num1 int, @num2 int, @num3 int)

returns integer as 
begin
declare @resultado integer;
set @resultado = @num1 + @num2+ @num3; ;
end;

return @resultado
select dbo.suma_tres_suma();

--------------------------------------------LABORATORIO 2

alter function operacion(@num1 integer, @num2 integer, @action varchar (20))
returns integer as 
begin 
declare @response integer = 0;

if (@action = 'suma')

  begin 
  set @response = @num1 + @num2

  end;

  if (@action = 'division')
  begin 
  set @response = @num1 / @num2

  end;

  return @response;

  end;

  select dbo.operacion(13,0, 'DIVICION')as DIVICION;

 create function operacion_v2 (@num1 integer, @num2 integer, @action varchar (20))
returns integer as 
begin
if (@action = 'suma')

  return @num1 + @num2

if (@action = 'division')
   
  return @num1 / @num2

  return 1;


  end;

select dbo.operacion_v2 (12,6, 'suma') as suma;
select dbo.operacion_v2 (12,6, 'division') as division; 


select est.*
from estudiantes as est;

---determinar cuantos estudiantes son mayores de 25 años;

select count (est.id_est)
from estudiantes as est 
where est.edad > 25 ;

----crear una funcion que permita saber cuantos estudiantes son mayores de una cierta edad------

create function cierta_edad(@edad integer)
returns integer as 
begin
 declare @response integer = 0;

 select @response = count (est.id_est)
from estudiantes as est 
where est.edad > @edad;

return @response;

end; 

select dbo.cierta_Edad( );

---parte 
alter function escuela_v2 (@edad integer, @genero varchar(50))
returns integer as 
begin
 declare @response integer = 0;



select @response = count (est.id_est)
from estudiantes as est 
inner join escuela as esc on est.id_esc = esc.id_esc
where est.genero = @genero and
      est.edad > @edad and
	  esc.nombres = 'andrea bello';


return @response;

end; 

select dbo.escuela_v2 (20,'femenino')estudiantes;

------TABLA ESTUDIANTES ----------

select max (est.id_est)
from estudiantes as est 
where est.id_est = 7;


create function funcion() 
returns integer as 
begin

declare @response integer = 0;
 
select @response = max (est.id_est)
from estudiantes as est;
 
return @response;

end;


select dbo.funcion();
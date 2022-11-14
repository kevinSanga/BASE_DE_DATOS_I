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
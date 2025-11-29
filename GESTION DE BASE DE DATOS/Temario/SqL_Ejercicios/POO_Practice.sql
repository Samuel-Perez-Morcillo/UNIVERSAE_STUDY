SET SERVEROUTPUT ON;

create or replace Type t_usuario as object (
  id number,
  nombre varchar(50),
  edad number,
  
  member procedure saludar,
  member function es_mayor return varchar2
);
/

create or replace type body t_usuario as
  member procedure saludar is
  begin
    dbms_output.Put_Line('Hola soy ' || nombre || ' y tengo ' || edad || ' anos ');
  end saludar;
  
  member function es_mayor return varchar2 is 
  begin 
    if edad >= 18 then 
      return 'Si';
    else 
      return 'No';
    end if;
  end es_mayor;
end;
/

declare
  us t_usuario := t_usuario(1,'Samuel',23);
begin
  us.saludar;
  dbms_output.Put_Line('Es mayor de edad ?' || us.es_mayor);
end;
/

// Primer Ejercicio Real

create or replace type t_producto as object(
  id number,
  nombre varchar2(50),
  precios number,
  
  member procedure informacion,
  member function con_iva return number
  
);
/

create or replace type body t_producto as 

  member procedure informacion is
    begin 
    dbms_output.Put_line('Producto: ' || nombre ||  ' - Precio: ' || precios);
    end informacion;
    
  member Function con_iva return number is
    begin 
       return precios * 1.21;
    end con_iva;
  end;
/


declare 
  p t_producto := t_producto(1,'Coca-Cola', 26);
begin   
  p.informacion;
  dbms_output.Put_line('Si le sumamos el iva serian ' || p.con_iva);
end;
/
  
    
    
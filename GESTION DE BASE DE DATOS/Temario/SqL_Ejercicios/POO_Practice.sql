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


// Segundo ejercicio inventado

create or replace type t_CostaCoffee as object (
  id number,
  employees number,
  name varchar(50),
  
  member procedure plantilla,
  member function mitad_plantilla return number
  
);
/

create or replace type body t_CostaCoffee as

  member procedure plantilla is 
    begin
      dbms_output.Put_line('En nuestra plantilla hay : ' || employees || ' personas Pero el empleado del mes a sido: ' || name);
    end plantilla;

  member function mitad_plantilla return number is
    begin
    return employees / 2;
    end mitad_plantilla;
end;
/

declare 
  Cf t_CostaCoffee  := t_CostaCoffee(1,12,'Ericky');
    begin
      Cf.plantilla;
      dbms_output.put_line('Si calculamos la mitad de la plantilla serian : ' || Cf.mitad_plantilla);
    end;
  /
  

// PL/Sql avanzado


Create or replace type t_empleados as table of varchar(50);
/

create or replace type t_CostaCoffee as object(
  id number,
  name_store varchar2(50),
  empleados t_empleados,
  
  member procedure plantilla,
  member function contar_empleados return number
);
/
  
create or replace type body t_CostaCoffee as 

  member procedure plantilla is
      i number := 1;
  begin
    dbms_output.put_line('Plantilla de ' || name_store || ': ' );
      
      while i <= empleados.Count Loop
        dbms_output.put_line('Empleado ' || i || ' ' || empleados(i));
        i:= i+1 ;
      end loop;
    
    /*
    for i in 1 .. empleados.Count Loop
      dbms_output.put_line('Empleado ' || i || ' ' || empleados(i));
    end loop;
    */
    
  end plantilla;
  
  member function contar_empleados return number is 
    begin
      return empleados.Count;
    end contar_empleados;
    
  end;
  /
    

declare 
  CF t_CostaCoffee := t_CostaCoffee(1,'CityWest',t_empleados('Ericky','Samu','Sinem','Natalia','Danka','Gosia','Gary'));
  begin
    Cf.plantilla;
    dbms_output.put_line('Numero total de empleados : ' || Cf.contar_empleados);
  end;
/
    
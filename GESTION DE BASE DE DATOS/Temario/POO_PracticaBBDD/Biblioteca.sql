Drop TYPE t_libro FORCE;
Drop TYPE t_autor FORCE;
Drop TYPE t_libros FORCE;
Drop TYPE t_bibiliotecas FORCE;


create or replace type t_autor as object(
  id number,
  nombre varchar2(50)
);
/

create or replace type t_libro as object(
  id number,
  titulo varchar2(100),
  precio number,
  autor t_autor,
  
  member function precio_con_iva return number
);
/

create or replace type body t_libro as 
  member function precio_con_iva return number is
    begin
      return precio * 1.21;
    end precio_con_iva;
  end;
  /

create or replace type t_libros as table of t_libro;
/

create or replace type t_biblioteca as object (
  id number,
  nombre varchar2(100),
  libros t_libros,
  
  member procedure mostrar_libros,
  member function total_libros return number,
  member function valor_total return number
);
/


create or replace type body t_biblioteca as 
  
  member procedure mostrar_libros is 
    begin
      if libros is null or libros.Count = 0 then
        dbms_output.put_line('No hay libros disponibles');
      else 
        for i in 1..libros.Count loop
          dbms_output.put_line('libro :' || i || libros(i).titulo || ' Con el autor ' || libros(i).autor.nombre || ' y un precio de ' || libros(i).precio);
        end loop;
      end if;
    end mostrar_libros;
    
  member function total_libros return number is 
    begin 
      return NVL(libros.COUNT,0);
    end total_libros;
  
  member function valor_total return number is 
    total number := 0;
    begin
      if libros is not null then 
        for i in 1..libros.Count LOOP
          total := total + libros(i).precio;
        end loop;
      end if;
      return total;
    end valor_total;
  
  end;
/
  
  
// ahora podremos crear las tablas relacionales basadas en objetos

CREATE TABLE bibliotecas OF t_biblioteca
  NESTED TABLE libros STORE AS libros_nt;
/
    

// anadimos los datos correspondientes para que sea una tabla con utilidad

INSERT INTO  bibliotecas VALUES(
  t_biblioteca(1, 'City Center Dublin', 
    t_libros(
        t_libro(1,'SpiderMan',20, t_autor(1,'Jorge')),
        t_libro(2,'Hulk',12, t_autor(1,'Rodrigo')),
        t_libro(3,'Lobezno',22, t_autor(1,'Rocio'))                                             
    )
  )
);

SELECT b.nombre, l.titulo
FROM bibliotecas b,
     TABLE(b.libros) l;


select l.titulo, l.precio, l.precio_con_iva()
  from bibliotecas b,
    TABLE(b.libros) l;
    
  
    
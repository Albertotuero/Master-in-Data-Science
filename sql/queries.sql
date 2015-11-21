-- Ciudades con una elevación superior a la media

select name, 
       country_name, 
       elevation
from optd_por_public
where elevation > (
    select avg(elevation) 
    from optd_por_public
    where location_type = 'C' and 
          elevation is not null
) and location_type = 'C'
order by elevation desc
limit 10;

-- Número de ciudades por pais por encima de la media de elevación y con al menos 2 ciudades
select country_name, 
       count(*) as n_cities
from optd_por_public
where elevation > (
    select avg(elevation) 
    from optd_por_public
    where location_type = 'C' and 
          elevation is not null
) and location_type = 'C'
group by country_name
having count(*) >= 2;

-- 11 resultados


-- Número de ciudades por pais por encima de la media de elevación del país
select a.country_name, 
       count(*) as n_cities
from optd_por_public a, 
    (
    select country_name, 
           avg(elevation) as avg_elevation
    from optd_por_public
    where elevation is not null and 
          location_type = 'C'
    group by country_name
    ) b
where a.country_name = b.country_name and 
      a.location_type = 'C' and 
      a.elevation is not null and
      a.elevation > b.avg_elevation
group by a.country_name;

-- 20 resultados

-- Modelo de Datos TIENDA DE INFORMATICA
-- Creación de tablas
CREATE TABLE fabricante (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE articulo (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(100),
    precio FLOAT,
    fabricante INT REFERENCES fabricante (codigo)
);

-- Queries del modelo de datos TIENDA DE INFORMATICA
SELECT nombre, 
       precio 
FROM articulo;

SELECT DISTINCT nombre 
FROM fabricante
WHERE codigo in (
    SELECT fabricante FROM articulo WHERE 60 <= precio <= 200
);

SELECT a.nombre, 
       count(*) as n_articulos
FROM fabricante a
    LEFT OUTER JOIN articulo b ON a.codigo = b.fabricante
WHERE b.precio BETWEEN 60 AND 200
GROUP BY a.nombre;




-- Modelo de Datos CINE
--Creación de tablas
CREATE TABLE pelicula (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(100),
    calif_edad INT
);

CREATE TABLE sala (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE emision (
    codigo_pelicula INT REFERENCES pelicula (codigo),
    codigo_sala INT REFERENCES sala(codigo),
    inicio_emision DATE,
    fin_emision DATE
);

-- Queries del modelo de datos CINE


-- Modelo de Datos GRANDES ALMACENES
-- Creacion de tablas
CREATE TABLE cajero (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellidos VARCHAR(100)
);

CREATE TABLE producto (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(100),
    precio FLOAT 
);

CREATE TABLE maquina_registradora (
    codigo INT PRIMARY KEY,
    piso INT
);

CREATE TABLE VENTA (
    cajero INT REFERENCES cajero(codigo),
    producto INT REFERENCES producto(codigo),
    maquina_registradora INT REFERENCES maquina_registradora (codigo),
    fecha DATE
);

-- Queries del modelo de datos GRANDES ALMACENES

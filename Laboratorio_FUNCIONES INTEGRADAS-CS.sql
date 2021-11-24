use curso;
-- ************************************************************
-- LABORATORIO  FUNCIONES INTEGRADAS
-- Carlos Selman 2018325 IN5BM
-- ************************************************************
-- 01. Funciones Integradas básicas:
-- ************************************************************
-- ------------------------------------------------------------
-- FUNCION COUNT
-- ------------------------------------------------------------
-- 1) Utilizando la función COUNT() mostrar la cantidad de productos.


	select count(Prod_Id) from productos;
   
	select count(*) from productos;
    

-- 2) Utilizando la función COUNT() mostrar la cantidad de productos que su estado sea 0.


	select count(Prod_Id) from productos where Prod_Status=0; 

	select count(*) from productos where Prod_Status=0;
    

-- 3) Utilizando la función COUNT() mostrar la cantidad de productos que su estado sea 1.


	select count(Prod_Id) from productos where Prod_Status=1;
    
	select count(*) from productos where Prod_Status=1;
    

-- 4) Utilizando la función COUNT() mostrar el total de ventas del mes de enero del 2018.

    
    select count(*) as "VENTAS ENERO 2018" from ventas where month(Ventas_Fecha) = 1 and year(Ventas_Fecha) = 2018;
    
	select count(Ventas_Id) as "VENTAS ENERO 2018" from ventas where Ventas_Fecha between "2018-01-01" and "2018-01-31"; 
    
-- ------------------------------------------------------------
-- FUNCION SUM
-- ------------------------------------------------------------
-- 5) Utilizando la función SUM mostrar la suma del total de ventas


	select sum(Ventas_Total) as "TOTAL VENTAS" from ventas;
    
    
-- 6) Utilizando la función SUM, sumar el total de ventas del mes de enero del año 2018.

			
	select sum(Ventas_Total) as "TOTAL VENTAS ENERO 2018" from ventas where month(Ventas_Fecha) = 1 and year(Ventas_Fecha) = 2018;
    
    select sum(Ventas_Total) as "TOTAL VENTAS ENERO 2018" from ventas where Ventas_Fecha between "2018-01-01" and "2018-01-31";
    
-- ------------------------------------------------------------
-- FUNCION MAX
-- ------------------------------------------------------------
-- 7) Utilizando la función MAX, mostrar la venta máxima.


    select max(Ventas_Total) as "VENTA MAXIMA" FROM VENTAS; 
    
    
-- 8) Utilizando la función MAX, mostrar la Venta máxima del mes de febrero del año 2018.


    select max(Ventas_Total) as "VENTA MAXIMA FEBRERO 2018" FROM VENTAS; 
    
-- ------------------------------------------------------------
-- FUNCION MIN
-- ------------------------------------------------------------
-- 9) Utilizando la función MIN mostrar la venta mínima.


	select  min(Ventas_Total) as "VENTA MINIMA" from ventas;
    
    
-- 10) Utilizando la función MIN mostrar la venta mínima del mes de febrero del año 2018.

	
    select min(Ventas_Total) as "VENTA MINIMA FEBRERO 2018" from ventas where month(Ventas_Fecha) = 2 and year(Ventas_Fecha) = 2018; 
    
-- ------------------------------------------------------------
-- FUNCION AVG(PROMEDIO)
-- ------------------------------------------------------------
-- 11) Utilizando la función AVG mostrar el promedio de ventas.

	select avg(Ventas_Total) as "PROMEDIO DE VENTAS" from ventas;
    
    
 -- ************************************************************   
-- 02. Funciones integradas de fecha y hora:
-- ************************************************************
-- ------------------------------------------------------------
-- FUNCIONES DE FECHA Y HORA
-- ------------------------------------------------------------
-- 1) Función que muestre la fecha actual.

	select current_date();
    
-- 2) Función que muestre la hora actual.

    select current_time();
    
-- 3) Función que muestre la fecha y hora actual juntas.

    select current_timestamp();
    
-- 4) Función para saber la base de datos actual.

    select database();
    
-- 5) Función para mostrar la diferencia de días entre dos
-- fechas.

    select datediff("2018-06-01","2018-01-01");
    
-- 6) Mostrar los días transcurridos entre una compra y la
-- fecha actual. cuantos días han pasado.

	select current_date() as "FECHA ACTUAL", Ventas_Fecha as "FECHA VENTA", datediff(current_date(), Ventas_Fecha) as "Dias", Ventas_NroFactura as "FACTURA"
    from ventas;
    
-- 7) Mostrar el número del día actual usando una función
-- integrada.

	select dayofweek(current_date);
-- ************************************************************
-- 03. Otras funciones:
-- ************************************************************
-- 1)Mostrar todos los id de clientes que han hecho
-- compras utilizando la cláusula DISTINCT para no
-- repetirlos (Estos se encuentran en la tabla ventas).

	select distinct (Ventas_CliId) as 'Clientes' from ventas;

-- 2)Utilizando la función CONCAT para "unir" la
-- descripción y el color de un producto, utilizando
-- LIKE para mostrar los productos que contengan
-- los caracteres 'AD' ya sea en descripción o en color.

    select Prod_Id, Prod_Descripcion,Prod_Color
    from productos
    where CONCAT(Prod_Descripcion,Prod_Color) LIKE '%AD%';

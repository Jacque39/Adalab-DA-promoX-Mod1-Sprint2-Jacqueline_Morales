
/*Ejercicio1 Selecciona todos los campos de los productos, que pertenezcan a los proveedores con códigos: 1, 3, 7, 8 y 9,
 que tengan stock en el almacén, y al mismo tiempo que sus precios unitarios estén entre 50 y 100. Por último, 
 ordena los resultados por código de proveedor de forma ascendente.*/
 
 SELECT product_name, supplier_id, unit_price, units_in_stock
 FROM products AS products1
 WHERE unit_price BETWEEN 50 AND 100;/* esquema para hacer la tabla*/
 
     SELECT  *
	 FROM products AS products2
     WHERE supplier_id IN(1,3,7,8,9)
	  AND units-in_stock IS NOT NULL
	   AND unit_price BETWEEN 50 AND 100
		ORDER BY suplier_id;
 
 
 
 
 /*Ejercico 2 Devuelve el nombre y apellidos y el id de los empleados con códigos entre el 3 y el 6, 
 además que hayan vendido a clientes que tengan códigos que comiencen con las letras de la A hasta la G. Por último,
 en esta búsqueda queremos filtrar solo por aquellos envíos que la fecha de pedido este comprendida entre el 22 y el 31 de Diciembre de cualquier año.*/
 
 SELECT employees.first_name, employees.last_name, employees.employee_id
 FROM employees
 INNER JOIN orders
 ON employees.employee_id = orders.employee_id
  WHERE (MONTH(orders.order_date) = 12 AND DAY (orders.order_date)<=31)
  AND orders.customer_id REGEXP '^[A-G].*'
  AND employees.employee_id BETWEEN 3 AND 6;
 

 
 
 /*Ejercicio 3 Calcula el precio de venta de cada pedido una vez aplicado el descuento. Muestra el id del la orden, 
 el id del producto, el nombre del producto, el precio unitario, la cantidad, el descuento y el precio de venta después de haber aplicado el descuento*/
 
 SELECT order_details.order_id, products.product_id, products.product_name, order_details.quantity, order_details.unit_price, 
		order_details.discount, ((order_details.unit_price *quantity)*(1-discount)) AS precio_pedido_con_descuento
FROM products
CROSS JOIN order_details
WHERE order_details.unit_price = products.unit_price; 
 
 
/*ejercicio 4 Usando una subconsulta, muestra los productos cuyos precios estén por encima del precio medio total de los productos de la BBDD.*/

SELECT*
FROM products
WHERE unit_price>(SELECT ROUND(AVG(unit_price),2)
FROM products);


/*ejercicio 5 ¿Qué productos ha vendido cada empleado y cuál es la cantidad vendida de cada uno de ellos?*/



/*ejercicio 6 Basándonos en la query anterior, ¿qué empleado es el que vende más productos? Soluciona este ejercicio con una subquery*/

SELECT SUM(quantity), product_id, employee_id
FROM order_details 
NATURAL JOIN orders
GROUP BY product_id, employed_id;

SELECT employee_id, last_name, first_name
FROM employees
WHERE employee_id> ALL (SELECT SUM(QUANTITY)
                   FROM order_details 
                   NATURAL JOIN orders
                   GROUP BY product_id, employee_id);

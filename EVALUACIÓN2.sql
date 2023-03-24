
/*Selecciona todos los campos de los productos, que pertenezcan a los proveedores con códigos: 1, 3, 7, 8 y 9,
 que tengan stock en el almacén, y al mismo tiempo que sus precios unitarios estén entre 50 y 100. Por último, 
 ordena los resultados por código de proveedor de forma ascendente.*/
 
 SELECT product_name, supplier_id, unit_price, units_in_stock
 FROM products
 WHERE unit_price BETWEEN 50 AND 100
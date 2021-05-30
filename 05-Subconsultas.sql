#SUBCONSULTAS

#### SUBCONSULTA ESACLONADA
#ESta sería un subconsulta interna
SELECT AVG(PRECIO) 
FROM practicandobd.productos;

#En base a la subconsulta podemos hacer otra consulta
SELECT NOMBREARTÍCULO, SECCIÓN, PRECIO
FROM practicandobd.productos
WHERE PRECIO > (SELECT AVG(PRECIO) 
FROM practicandobd.productos)
ORDER BY PRECIO; 

#### SUBCONSULTA DE LISTA
SELECT * FROM practicandobd.productos
WHERE PRECIO > ALL (
SELECT PRECIO FROM practicandobd.productos
WHERE SECCIÓN = 'CERÁMICA');

SELECT * FROM practicandobd.productos
WHERE PRECIO > ANY (
SELECT PRECIO FROM practicandobd.productos
WHERE SECCIÓN = 'CERÁMICA');

####### 

SELECT PRECIO FROM practicandobd.productos
WHERE SECCIÓN = 'JUGUETERÍA';

SELECT * FROM practicandobd.productos
WHERE PRECIO > ANY (
SELECT PRECIO FROM practicandobd.productos
WHERE SECCIÓN = 'JUGUETERÍA');

SELECT * FROM practicandobd.productos
WHERE PRECIO > ALL (
SELECT PRECIO FROM practicandobd.productos
WHERE SECCIÓN = 'JUGUETERÍA');


#### QUIERO LOS PRECIOS Y NOMBRE DE LOS ARTICULOS CON PEDIDOS MAYORES A 20
SELECT PRECIO, NOMBREARTÍCULO FROM practicandobd.productos
WHERE CODARTICULO IN ('AR12');

SELECT * FROM practicandobd.`productos- pedidos`
WHERE UNIDADES > 20;


###### IN
SELECT PRECIO, NOMBREARTÍCULO FROM practicandobd.productos
WHERE CODARTICULO IN (SELECT CODARTICULO FROM practicandobd.`productos- pedidos`
WHERE UNIDADES > 20);

# OTRO MODO
SELECT PRECIO, NOMBREARTÍCULO FROM practicandobd.productos AS p
INNER JOIN practicandobd.`productos- pedidos` AS pp ON
pp.CODARTICULO = p.CODARTICULO
WHERE pp.UNIDADES > 20
ORDER BY PRECIO;


### QUIENES NO HAN PAGADO CON TARJETA 
SELECT `CÓDIGO CLIENTE` FROM practicandobd.pedidos
WHERE `FORMA DE PAGO` = 'TARJETA';

SELECT EMPRESA, POBLACIÓN FROM practicandobd.clientes
WHERE CÓDIGOCLIENTE NOT IN (
SELECT `CÓDIGO CLIENTE` FROM practicandobd.pedidos
WHERE `FORMA DE PAGO` = 'TARJETA');
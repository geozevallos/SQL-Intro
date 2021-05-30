CREATE TABLE practicandobd.ARTICULOS_DEPORTES
SELECT * FROM practicandobd.productos
WHERE SECCIÓN = 'DEPORTES';

CREATE TABLE practicandobd.pedidos_con_tarjeta
SELECT * FROM practicandobd.pedidos
WHERE `FORMA DE PAGO` = 'TARJETA';


UPDATE practicandobd.articulos_deportes
SET PRECIO = (PRECIO * 0.18);


UPDATE practicandobd.pedidos_con_tarjeta
SET DESCUENTO = 0.05
WHERE DESCUENTO < 0.05
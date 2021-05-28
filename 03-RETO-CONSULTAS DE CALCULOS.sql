##
#DESCUETO 7%
SELECT NOMBREARTÍCULO, SECCIÓN, PRECIO,
ROUND(PRECIO * 0.93, 2) AS DESCUENTO_7
FROM practicandobd.productos;

SELECT FECHA, NOMBREARTÍCULO, SECCIÓN, PRECIO,
ROUND(PRECIO - 2, 2) AS DCTOCERAMICA
FROM practicandobd.productos
WHERE SECCIÓN = 'CERÁMICA'
ORDER BY FECHA DESC;

SELECT NOMBREARTÍCULO, SECCIÓN, PRECIO,
ROUND(PRECIO * 1.02, 2) AS PRECIOAUMENTADO2
FROM practicandobd.productos
WHERE SECCIÓN = 'FERRETERÍA';

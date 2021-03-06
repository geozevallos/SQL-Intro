### VISTAS
#LAS VISTAS SE ACTUALIZAN


CREATE VIEW `practicandobd`.ART_DEPORTES AS
SELECT NOMBREARTÍCULO, SECCIÓN, PRECIO
FROM `practicandobd`.productos
WHERE SECCIÓN = 'DEPORTES';

#ELIMINAR VISTA
DROP VIEW `practicandobd`.ART_DEPORTES;

UPDATE `practicandobd`.productos
SET precio = precio + 10
WHERE CODARTICULO = 'AR04';

#VER LA VISTA
SELECT * FROM `practicandobd`.ART_DEPORTES;

#MODIFICAR VISTA
ALTER VIEW `practicandobd`.ART_DEPORTES AS
SELECT NOMBREARTÍCULO, SECCIÓN, PRECIO, IMPORTADO, PAÍSDEORIGEN
FROM `practicandobd`.productos
WHERE SECCIÓN = 'DEPORTES';

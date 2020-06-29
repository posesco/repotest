SELECT COUNT(*) FROM autores;
SELECT SUM(ventas) AS SUMA_TOTAL FROM libros;
SELECT MAX(ventas) AS NUMERO_MAX FROM libros;
SELECT MIN(ventas) AS NUMERO_MINIMO FROM libros;
SELECT AVG(ventas) AS PROMEDIO FROM libros;

SELECT autor_id, SUM(ventas) AS TOTAL_VENTAS FROM libros GROUP BY autor_id ORDER BY TOTAL_VENTAS DESC;

SELECT autor_id, SUM(ventas) AS TOTAL_VENTAS FROM libros GROUP BY autor_id HAVING SUM(ventas)>6999;

    SELECT CONCAT(nombre," ",apellido) AS Nombre_Completo, "" AS EMAIL
    FROM autores
UNION
    SELECT CONCAT(nombre," ",apellidos) AS Nombre_Completo, email
    FROM usuarios;


SELECT AVG(ventas) FROM libros;

SET @promedio = (SELECT AVG(ventas)FROM libros);
SELECT autor_id FROM libros GROUP BY autor_id HAVING SUM(ventas) > @promedio;

SELECT CONCAT(nombre," ",apellido) AS Nombre_Completo
FROM autores
WHERE autor_id IN(
SELECT autor_id
FROM libros
GROUP BY autor_id
HAVING SUM(ventas) > (SELECT AVG(ventas)
FROM libros)
)

SELECT IF(
    EXISTS(SELECT libro_id FROM libros WHERE titulo LIKE '_'),
    'Disponible',
    'No disponible'
) AS Resultado;

SELECT libros.titulo, 
    CONCAT(autores.nombre," ",autores.apellido) AS Nombre_del_Autor,
    libros.fecha_creacion
FROM libros
INNER JOIN autores ON libros.autor_id = autores.autor_id;

SELECT li.titulo, 
    CONCAT(au.nombre," ",au.apellido) AS Nombre_del_Autor,
    li.fecha_creacion
FROM libros AS li
INNER JOIN autores AS au USING(autor_id) LIMIT 10;


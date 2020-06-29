SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER //
    CREATE FUNCTION obterner_paginas()
    RETURNS INT
    BEGIN
     SET @paginas = (SELECT (ROUND(RAND()*1000)*4));
     RETURN @paginas;
    END//

    CREATE FUNCTION obterner_ventas()
    RETURNS INT
    BEGIN
     SET @ventas = (SELECT (ROUND(RAND()*1000)));
     RETURN @ventas;
    END//

    CREATE FUNCTION agregar_dias(fecha DATE, dias INT)
    RETURNS DATE
    BEGIN
     RETURN fecha + INTERVAL dias DAY;
    END//

DELIMITER ; 


SET @ahora = CURDATE();
SELECT @ahora;
SELECT agregar_dias(@ahora, 365);

UPDATE libros SET paginas = obterner_paginas();
UPDATE libros SET ventas = obterner_ventas();
SELECT * FROM libros;
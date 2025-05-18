/**
-----------------Proyecto--------
**/
/*Consulta 1*/
SELECT TipoHabitacion, COUNT(idHuesped) AS CantidadClientes
FROM Recibo
	WHERE 
    Recibo.Checkout > '2024-06-03'
GROUP BY TipoHabitacion ;


/*Consulta 2*/
SELECT 
    r.TipoPago,
    COUNT(r.idHuesped) AS CantidadClientes
FROM 
    Recibo r
JOIN 
    Huesped h ON r.idHuesped = h.idHuesped
    WHERE 
    r.Checkout > '2024-06-03'
GROUP BY 
    r.TipoPago;

/*Consulta 3*/
SELECT 
    h.NombreEstablecimiento, 
    COUNT(r.idHuesped) AS CantidadClientes
FROM 
    Hotel h
JOIN 
    Recibo r ON h.idHotel = r.idHotel
     WHERE 
    r.Checkout > '2024-06-03'
GROUP BY 
    h.NombreEstablecimiento;

/*Consulta 4*/
SELECT COUNT(*) AS CantidadClientesConMembresia
FROM Recibo
JOIN Huesped ON Recibo.idHuesped = Huesped.idHuesped
WHERE Recibo.esMiembro = true


/*Consulta 5*/
SELECT 
    R.idHuesped,
    MIN(R.CheckIn) AS FechaInicioMembresia,
    MAX(R.Checkout) AS FechaFinMembresia,
    (MAX(R.Checkout) - MIN(R.CheckIn)) AS PeriodoMembresiaDias
FROM Recibo R
INNER JOIN Huesped H ON R.idHuesped = H.idHuesped
WHERE R.esMiembro = true
GROUP BY R.idHuesped
order by idhuesped

/*Consulta 6*/
SELECT NombreEstablecimiento, Calle, NumeroInterior, NumeroExterior, Colonia, Estado
FROM Hotel
WHERE PetFriendly = true;

/*Consulta 7*/
SELECT COUNT(DISTINCT r.idHuesped) AS Cantidad_Clientes_Con_Mascota
FROM Recibo r
JOIN Hotel h ON r.idHotel = h.idHotel
WHERE r.Mascota = true
AND h.PetFriendly = true
AND r.Checkout <= '2024-06-03';

/*Consulta 8*/
SELECT
    A.idEmpleado,
    A.Nombre,
    RH.TipoHabitacion,
    COUNT(*) AS NumHuespedes
FROM
    Apoyo A
JOIN
    Recibo R ON A.idHotel = R.idHotel
JOIN
    Huesped H ON R.idHuesped = H.idHuesped
JOIN
    (
        SELECT DISTINCT
            idHotel,
            TipoHabitacion
        FROM
            Recibo
    ) RH ON R.idHotel = RH.idHotel
GROUP BY
    A.idEmpleado,
    A.Nombre,
    RH.TipoHabitacion
ORDER BY
    NumHuespedes DESC,
    A.idEmpleado ASC;

/*Consulta 9*/
SELECT 
    H.idHuesped AS idHuesped,
    H.Nombre AS NombreHuesped,
    H.ApellidoP AS ApellidoPaterno,
    H.ApellidoM AS ApellidoMaterno,
    EXTRACT(YEAR FROM R.CheckIn) AS Año,
    COUNT(R.idRecibo) AS VisitasPorAño
FROM 
    Huesped H
LEFT JOIN 
    Recibo R ON H.idHuesped = R.idHuesped
GROUP BY 
    H.idHuesped, H.Nombre, H.ApellidoP, H.ApellidoM, EXTRACT(YEAR FROM R.CheckIn)
ORDER BY 
    idHuesped ASC,  Año, VisitasPorAño;

/*Consulta 10*/
SELECT 
    H.idHuesped AS idHuesped,
    H.Nombre AS NombreHuesped,
    H.ApellidoP AS ApellidoPaterno,
    H.ApellidoM AS ApellidoMaterno,
    EXTRACT(YEAR FROM R.CheckIn) AS Año,
    CASE 
        WHEN EXTRACT(MONTH FROM R.CheckIn) BETWEEN 1 AND 3 THEN 'Trimestre 1'
        WHEN EXTRACT(MONTH FROM R.CheckIn) BETWEEN 4 AND 6 THEN 'Trimestre 2'
        WHEN EXTRACT(MONTH FROM R.CheckIn) BETWEEN 7 AND 9 THEN 'Trimestre 3'
        WHEN EXTRACT(MONTH FROM R.CheckIn) BETWEEN 10 AND 12 THEN 'Trimestre 4'
    END AS Trimestre,
    COUNT(R.idRecibo) AS VisitasPorTrimestre
FROM 
    Huesped H
LEFT JOIN 
    Recibo R ON H.idHuesped = R.idHuesped
GROUP BY 
    H.idHuesped, H.Nombre, H.ApellidoP, H.ApellidoM, EXTRACT(YEAR FROM R.CheckIn), Trimestre
ORDER BY 
     idHuesped ASC, Año,Trimestre, VisitasPorTrimestre;

/*Consulta 11*/
SELECT 
    H.idHuesped AS idHuesped,
    H.Nombre AS NombreHuesped,
    H.ApellidoP AS ApellidoPaterno,
    H.ApellidoM AS ApellidoMaterno,
    EXTRACT(YEAR FROM R.CheckIn) AS Año,
    EXTRACT(MONTH FROM R.CheckIn) AS Mes,
    COUNT(R.idRecibo) AS VisitasPorMes
FROM 
    Huesped H
LEFT JOIN 
    Recibo R ON H.idHuesped = R.idHuesped
GROUP BY 
    H.idHuesped, H.Nombre, H.ApellidoP, H.ApellidoM, EXTRACT(YEAR FROM R.CheckIn), EXTRACT(MONTH FROM R.CheckIn)
ORDER BY 
    idHuesped ASC, Año,Mes, VisitasPorMes;

/*Consulta 12*/
SELECT 
    H.Genero,
    COUNT(R.idRecibo) AS VisitasPorGenero
FROM 
    Huesped H
LEFT JOIN 
    Recibo R ON H.idHuesped = R.idHuesped
GROUP BY 
    H.Genero
ORDER BY 
    VisitasPorGenero DESC;


/*Consulta 13 : */
SELECT 
    H.idHotel,
    H.NombreEstablecimiento,
    COUNT(A.idEmpleado) AS Apoyo,
    COUNT(R.idEmpleado) AS Recepcionista,
    COUNT(L.idEmpleado) AS Limpieza,
    COUNT(C.idEmpleado) AS Comida
FROM 
    Hotel H
LEFT JOIN 
    Apoyo A ON H.idHotel = A.idHotel
LEFT JOIN 
    Recepcionista R ON H.idHotel = R.idHotel
LEFT JOIN 
    Limpieza L ON H.idHotel = L.idHotel
LEFT JOIN 
    Comida C ON H.idHotel = C.idHotel
GROUP BY 
    H.idHotel, H.NombreEstablecimiento
ORDER BY 
    H.idHotel;

/*Consulta 14*/
SELECT 
    H.idHotel,
    H.NombreEstablecimiento,
    'Apoyo' AS TipoEmpleado,
    AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, A.FechaNacimiento))) AS PromedioEdad
FROM 
    Hotel H
LEFT JOIN 
    Apoyo A ON H.idHotel = A.idHotel
GROUP BY 
    H.idHotel, H.NombreEstablecimiento

UNION ALL

SELECT 
    H.idHotel,
    H.NombreEstablecimiento,
    'Recepcionista' AS TipoEmpleado,
    AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, R.FechaNacimiento))) AS PromedioEdad
FROM 
    Hotel H
LEFT JOIN 
    Recepcionista R ON H.idHotel = R.idHotel
GROUP BY 
    H.idHotel, H.NombreEstablecimiento

UNION ALL

SELECT 
    H.idHotel,
    H.NombreEstablecimiento,
    'Limpieza' AS TipoEmpleado,
    AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, L.FechaNacimiento))) AS PromedioEdad
FROM 
    Hotel H
LEFT JOIN 
    Limpieza L ON H.idHotel = L.idHotel
GROUP BY 
    H.idHotel, H.NombreEstablecimiento

UNION ALL

SELECT 
    H.idHotel,
    H.NombreEstablecimiento,
    'Comida' AS TipoEmpleado,
    AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, C.FechaNacimiento))) AS PromedioEdad
FROM 
    Hotel H
LEFT JOIN 
    Comida C ON H.idHotel = C.idHotel
GROUP BY 
    H.idHotel, H.NombreEstablecimiento
ORDER BY
    idHotel, TipoEmpleado;

/*Consulta 15 */
SELECT 
    H.idHotel,
    H.NombreEstablecimiento,
    'Apoyo' AS TipoEmpleado,
    A.Genero,
    COUNT(A.idEmpleado) AS CantidadEmpleados
FROM 
    Hotel H
LEFT JOIN 
    Apoyo A ON H.idHotel = A.idHotel
GROUP BY 
    H.idHotel, H.NombreEstablecimiento, A.Genero

UNION ALL

SELECT 
    H.idHotel,
    H.NombreEstablecimiento,
    'Recepcionista' AS TipoEmpleado,
    R.Genero,
    COUNT(R.idEmpleado) AS CantidadEmpleados
FROM 
    Hotel H
LEFT JOIN 
    Recepcionista R ON H.idHotel = R.idHotel
GROUP BY 
    H.idHotel, H.NombreEstablecimiento, R.Genero

UNION ALL

SELECT 
    H.idHotel,
    H.NombreEstablecimiento,
    'Limpieza' AS TipoEmpleado,
    L.Genero,
    COUNT(L.idEmpleado) AS CantidadEmpleados
FROM 
    Hotel H
LEFT JOIN 
    Limpieza L ON H.idHotel = L.idHotel
GROUP BY 
    H.idHotel, H.NombreEstablecimiento, L.Genero

UNION ALL

SELECT 
    H.idHotel,
    H.NombreEstablecimiento,
    'Comida' AS TipoEmpleado,
    C.Genero,
    COUNT(C.idEmpleado) AS CantidadEmpleados
FROM 
    Hotel H
LEFT JOIN 
    Comida C ON H.idHotel = C.idHotel
GROUP BY 
    H.idHotel, H.NombreEstablecimiento, C.Genero
ORDER BY
    idHotel, TipoEmpleado, Genero;

/*Consulta 16*/
SELECT 
    H.idHotel,
    H.NombreEstablecimiento,
    AVG(EXTRACT(YEAR FROM AGE(Hues.FechaNacimiento))) AS EdadPromedio,
    COUNT(*) AS TotalHuespedes,
    COUNT(DISTINCT Hues.Nacionalidad) AS TotalNacionalidades,
    STRING_AGG(DISTINCT Hues.Nacionalidad, ', ') AS Nacionalidades
FROM 
    Hotel H
JOIN 
    Recibo R ON H.idHotel = R.idHotel
JOIN 
    Huesped Hues ON R.idHuesped = Hues.idHuesped
GROUP BY 
    H.idHotel, H.NombreEstablecimiento
ORDER BY 
    H.idHotel;
---------------- UDF ESCALAR ----------------------
use LibreriaDB

CREATE FUNCTION ObtenerPrecioLibroPorISBN (@ISBN VARCHAR(20))
RETURNS MONEY
AS
BEGIN
    DECLARE @Precio MONEY
    SELECT @Precio = Precio
    FROM Libros
    WHERE ISBN = @ISBN

    RETURN @Precio
END

SELECT dbo.ObtenerPrecioLibroPorISBN('244-0-78-898778-0') AS Precio;

select *from Libros

---------------- UDF CON VALORES POR TABLA ----------------
CREATE FUNCTION ObtenerLibrosPrestadosPorCliente (@ClienteID INT)
RETURNS TABLE
AS
RETURN (
    SELECT L.Titulo, P.FechaPrestamo
    FROM Prestamos P
    JOIN Libros L ON P.PrestamoID = L.LibroID
    WHERE P.ClienteID = @ClienteID
)

SELECT * FROM dbo.ObtenerLibrosPrestadosPorCliente(3);


select *from Prestamos
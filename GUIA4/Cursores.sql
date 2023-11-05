-- CURSOR DE SOLO AVANCE -----------------------------------------------

-- Ejemplos de Cursores
use LibreriaDB;

-- Declaracion de variables para almacenar los resultados
declare @Titulo varchar(225)
declare	@AnioPublicacion int
declare @Nombre varchar(50)

-- Declaración del cursor

declare CursorAvanceLibros cursor for	-- Query
select EMP.Titulo, EMP.AnioPublicacion, CAR.Nombre
from Libros EMP, Generos CAR
where CAR.GeneroID = EMP.GeneroID
order by EMP.GeneroID

-- Abrir el cursor
open CursorAvanceLibros

-- Obtener el primer registro
fetch next from CursorAvanceLibros into @Titulo, @AnioPublicacion, @Nombre
print 'libros registrados:'

-- Recorrer los registros
while @@FETCH_STATUS = 0
begin
    -- Realizar operación con los datos
	print 'Titulo: ' + @Titulo + ' ' + @AnioPublicacion + ' - ' + @Nombre

    -- Obtener el siguiente registro
    fetch next from CursorSoloAvance into @Titulo, @AnioPublicacion, @Nombre
end

-- Cerrar y liberar el cursor
close CursorAvanceLibros
deallocate CursorAvanceLibros


--------------------------------------------
-- Inserccion para cursor de solo avance
-- Nuevo Empleado
insert into Libros values
-- Titulo, AutorID, GeneroID, EditorialID, AnioPublicacion, ISBN
	('boulevard', '2', '1', '2', '1995', '7883-958-345');

delete from Libros
where Titulo = 'boulevard';
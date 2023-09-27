use LibreriaDB;

INSERT INTO Autores(Nombre, Pais) VALUES
('Juan', 'EEUU'),
('Pedro', 'Venezuela'),
('Ivan', 'Mexico'),
('Daniela', 'EEUU'),
('Karla', 'Brazil');

INSERT INTO Clientes(Nombre, Apellido, Direccion, Email, Telefono) VALUES
('Juan', 'Hernandez', 'Sonsonate', 'juan@gmail.com', '36563545'),
('Andres', 'Gonzales', 'Nahuizalco', 'andres@gmail.com', '96746545'),
('Paola', 'Rodriguez', 'Izalco', 'paola@gmail.com', '86754265'),
('Sandra', 'Cruz', 'Sonzacate', 'sandra@gmail.com', '26549835'),
('Bryan', 'Tepaz', 'Nahuilingo', 'bryan@gmail.com', '76653545');

INSERT INTO Editoriales(Nombre, Pais) VALUES
('Penguin', 'EEUU'),
('Wiley', 'Venezuela'),
('Elsevier', 'Mexico'),
('Springer', 'peru'),
('Oxford', 'Brazil');

INSERT INTO Ejemplares(Estado, Ubicacion) VALUES
('Diponible','Sononate'),
('Reservado','Nahuizalco'),
('Disponible','Juayua'),
('NoDisponible','Ahuachapan'),
('Disponible','Metapan');

INSERT INTO Empleados(Nombre, Apellido, Cargo, Email, Telefono) VALUES
('Mario', 'Hernandez', 'Cajero', 'mario@gmail.com', '74563545'),
('Rina', 'Gonzales', 'Bibliotecario', 'rina@gmail.com', '24746545'),
('Fernando', 'Rodriguez', 'Gerente', 'fernandoa@gmail.com', '86464265'),
('Raul', 'Cruz', 'Vendedor', 'raul@gmail.com', '98549835'),
('Vannesa', 'Tepaz', 'Recepcionista', 'vannesa@gmail.com', '65653545');

INSERT INTO Generos(Nombre) VALUES
('Ficcion'),
('Poesia'),
('Religion'),
('Drama'),
('Juvenil');

INSERT INTO Libros(Titulo, AutorID, GeneroID, EditorialID, AnioPublicacion, ISBN ) VALUES
('Cien años de soledad', '2', '4', '1', '1998', '244-0-78-898778-0'),
('El camino','3','5','2', '2005', '983-1-78-896548-1'),
('El mundo','4','3','3', '2004', '986-4-78-458778-9'),
('La momia','5','2','4', '1988', '556-6-78-898778-7'),
('El pefume','2','1','5', '1995', '383-8-78-898778-5');

INSERT INTO Prestamos(ClienteID,EjemplarID, FechaPrestamo, FechaDevolucion) VALUES
('1', '6', '21-09-2023', '26-09-2023'),
('2', '7', '21-09-2023', '26-09-2023'),
('3', '8', '21-09-2023', '26-09-2023'),
('4', '9', '21-09-2023', '26-09-2023'),
('5', '10', '21-09-2023', '26-09-2023');


------ CONSULTAS CON OPERADORES ARITMETICOS O LOGICOS --------

-- selecciona los libros escritos por un autor especifico 
select Titulo
from Libros
where AutorID = 2;

-- Muestra el titulo y el año igual o mayor a 2000 y al mismo tiempo igual o menor a 2020
SELECT Titulo, AnioPublicacion
FROM Libros
WHERE AnioPublicacion >= 2000 AND AnioPublicacion <= 2020;


-- Muestra el estado de un libro y su ubicacion     
SELECT Estado, Ubicacion
FROM Ejemplares
WHERE EjemplarID = 6;

-- Muestra la edad en años de los libros
SELECT Titulo, 
       AnioPublicacion,
       DATEDIFF(YEAR, AnioPublicacion, GETDATE()) AS EdadLibros
FROM libros;

-- Muestra los libros prestados en un día específico
SELECT COUNT(*) AS 'Libros Prestados'
FROM Prestamos
WHERE CONVERT(DATE, FechaPrestamo) = '21-09-2023';

-- Muestra la cantidad de libros disponibles 
SELECT COUNT(*) AS 'Libros Disponibles'
FROM Ejemplares
WHERE Estado = 'Disponible';

---------------- CONSULTAS MULTITABLA-------------------------

-- Muestra la lista de todos los libros con sus autores y editoriales
SELECT Libros.Titulo AS 'Titulo', Autores.Nombre AS 'Autor', Editoriales.Nombre AS 'Editorial'
FROM Libros
JOIN Autores ON libros.AutorID = Autores.AutorID
JOIN Editoriales ON libros.EditorialID = Editoriales.EditorialID;

-- Encuentra el libro escrito por un autor especifico
SELECT Titulo
FROM Libros
WHERE AutorID IN (SELECT AutorID FROM Autores WHERE Nombre = 'Ivan');

-- Muestra el listado de todos los libros de una editorial en particular:
SELECT Libros.Titulo AS 'Titulo', Autores.Nombre AS 'Autor'
FROM Libros
JOIN Autores ON Libros.AutorID = Autores.AutorID
WHERE Libros.EditorialID IN (SELECT EditorialID FROM Editoriales WHERE Nombre = 'Wiley');

-- Muestra los autores que han escrito más de un libro
SELECT Autores.Nombre AS 'Autor', COUNT(Libros.LibroID) AS 'Cantidad de Libros'
FROM Autores
JOIN Libros ON Autores.AutorID = Libros.AutorID
GROUP BY Autores.Nombre
HAVING COUNT(Libros.LibroID) > 1;

--Muestra los libros de un género específico publicados por una editorial en particular:
SELECT Libros.Titulo AS 'Titulo', Generos.Nombre AS 'Genero'
FROM Libros
JOIN Editoriales ON Libros.EditorialID = Editoriales.EditorialID
JOIN Generos ON Libros.GeneroID = Generos.GeneroID
WHERE Generos.Nombre = 'Ficcion' AND editoriales.nombre = 'Oxford';


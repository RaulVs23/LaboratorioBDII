USE Libreria;

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

INSERT INTO Ejemplar(Estado, Ubicacion, LibroID) VALUES
('Diponible','Sononate', '1'),
('Reservado','Nahuizalco', '3'),
('Disponible','Juayua', '5'),
('NoDisponible','Ahuachapan', '4'),
('Disponible','Metapan', '2');

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
('Cien anios de soledad', '2', '4', '1', '1998', '244-0-78-898778-0'),
('El camino','3','5','2', '2005', '983-1-78-896548-1'),
('El mundo','4','3','3', '2004', '986-4-78-458778-9'),
('La momia','5','2','4', '1988', '556-6-78-898778-7'),
('El pefume','2','1','5', '1995', '383-8-78-898778-5');

Use Libreria;
INSERT INTO Prestamos(FechaPrestamo, FechaDevolucion, ClienteID) VALUES
('2023-09-21', '2023-09-26', '1'),
('2023-09-22', '2023-09-27', '2'),
('2023-09-23', '2023-09-28', '3'),
('2023-09-24', '2023-09-29', '4'),
('2023-09-25', '2023-09-30', '5');

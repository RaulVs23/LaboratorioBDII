CREATE DATABASE LibreriaDB;
GO

-- Usar la base de datos
USE LibreriaDB;
GO

-- Tabla para autores
CREATE TABLE Autores (
    AutorID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Pais VARCHAR(50)
);

-- Tabla para géneros
CREATE TABLE Generos (
    GeneroID INT PRIMARY KEY,
    Nombre VARCHAR(50)
);

-- Tabla para editoriales
CREATE TABLE Editoriales (
    EditorialID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Pais VARCHAR(50)
);

-- Tabla para libros
CREATE TABLE Libros (
    LibroID INT PRIMARY KEY,
    Titulo VARCHAR(255),
    AutorID INT,
    GeneroID INT,
    EditorialID INT,
    AnioPublicacion INT,
    ISBN VARCHAR(20) UNIQUE
);

-- Tabla para ejemplares de libros
CREATE TABLE Ejemplares (
    EjemplarID INT PRIMARY KEY,
    LibroID INT,
    Estado VARCHAR(50),
    Ubicacion VARCHAR(100)
);

-- Tabla para clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Direccion VARCHAR(255),
    Email VARCHAR(100) UNIQUE,
    Telefono VARCHAR(20)
);

-- Tabla para préstamos
CREATE TABLE Prestamos (
    PrestamoID INT PRIMARY KEY,
    ClienteID INT,
    EjemplarID INT,
    FechaPrestamo DATE,
    FechaDevolucion DATE
);

-- Tabla para empleados de la librería
CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Cargo VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Telefono VARCHAR(20)
);

-- Establecer relaciones con ALTER TABLE
ALTER TABLE Libros ADD CONSTRAINT FK_Libros_Autores FOREIGN KEY (AutorID) REFERENCES Autores(AutorID);
ALTER TABLE Libros ADD CONSTRAINT FK_Libros_Generos FOREIGN KEY (GeneroID) REFERENCES Generos(GeneroID);
ALTER TABLE Libros ADD CONSTRAINT FK_Libros_Editoriales FOREIGN KEY (EditorialID) REFERENCES Editoriales(EditorialID);
ALTER TABLE Ejemplares ADD CONSTRAINT FK_Ejemplares_Libros FOREIGN KEY (LibroID) REFERENCES Libros(LibroID);
ALTER TABLE Prestamos ADD CONSTRAINT FK_Prestamos_Clientes FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID);
ALTER TABLE Prestamos ADD CONSTRAINT FK_Prestamos_Ejemplares FOREIGN KEY (EjemplarID) REFERENCES Ejemplares(EjemplarID);
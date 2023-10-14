use LibreriaDB

-- Procedimiento Almacenado 1
create procedure AgregarCliente
 --Variables 
	@Nombre varchar(100),
	@Apellido varchar(100),
	@Direccion varchar(225),
	@Email varchar(100),
	@Telefono varchar(20)

	as 
	begin

	   insert into Clientes values 
		   (@Nombre ,
			@Apellido,
			@Direccion ,
			@Email,
			@Telefono);

		select * from Clientes;
	end

	execute AgregarCliente
			@Nombre = 'Juan Antonio',
			@Apellido  = 'Peres Hernandez',
			@Direccion = 'Sonsonate',
			@Email = 'juanantonio@gmail.com',
			@Telefono = '7868-9867'

-------------------------------------------------------

-- Procedimiento Almacenado 2
create procedure AgregarEmpleado
 --Variables 
	@Nombre varchar(100),
	@Apellido varchar(100),
	@Cargo varchar(50),
	@Email varchar(100),
	@Telefono varchar(20)

	as 
	begin

	   insert into Empleados values 
		   (@Nombre ,
			@Apellido,
			@Cargo,
			@Email,
			@Telefono);

		select * from Empleados;
	end

	execute AgregarEmpleado
			@Nombre = 'Francisco Javier',
			@Apellido  = 'Zavaleta Cruz',
			@Cargo = 'Auditor',
			@Email = 'franciscojavier@gmail.com',
			@Telefono = '2445-6775'
USE Libreria;
-- ***********
GO
CREATE ROLE Administrador;
-- ***********
go
create login login_admin
with password = 'root';
-- ***********
go
create user administradorRaul
for login login_admin;
-- **********
go
alter role Administrador add member administradorRaul;
-- Administrador
go
grant control on database::Libreria to Administrador;
-- CONSULTAS
go
-- Consulta para obtener una lista de logins en la instancia de SQL Server
select name from sys.server_principals where type_desc = 'SQL_LOGIN';
go
-- Consulta para obtener una lista de usuarios en la instancia de SQL Server
select name from sys.database_principals where type_desc = 'SQL_USER';
go
-- Consulta para obtener una lista de roles en la instancia de SQL Server
select name from sys.database_principals where type_desc = 'DATABASE_ROLE';
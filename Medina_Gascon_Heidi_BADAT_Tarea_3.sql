-- Crea Base de datos nueva llamada Medina_Gascon_Heidi_Actividad
USE master;
GO

DROP DATABASE IF EXISTS Medina_Gascon_Heidi_Actividad;
GO

CREATE DATABASE Medina_Gascon_Heidi_Actividad;
GO

--Crea el Esquema2
USE Medina_Gascon_Heidi_Actividad;
GO

DROP SCHEMA IF EXISTS Esquema2;
GO

CREATE SCHEMA Esquema2;
GO

--Crea tablaB
DROP TABLE IF EXISTS B;
GO

CREATE TABLE B(
	DatoB INT
);
GO

--modifica el esquema por defecto dbo para añadir en Esquema1
ALTER schema Esquema1
TRANSFER dbo.B;
GO

--Crea tabla C directamente en Esquema2
DROP TABLE IF EXISTS C;
GO

CREATE TABLE Esquema2.C (
	DatoC INT
);
GO

--Crea nuevo login "login_admin"
CREATE LOGIN login_admin WITH PASSWORD='login_admin';
GO

--Crea usuarios user_writer (Esquema1 por defecto) user_reader (Esquema2 por defecto)
--Crea nuevo login "login1" y "login2" conexión original
CREATE LOGIN login1 WITH PASSWORD='login1';
GO
CREATE LOGIN login2 WITH PASSWORD='login2';
GO
--conexión con login_admin
CREATE USER user_writer FOR LOGIN login1
WITH DEFAULT_SCHEMA = Esquema1;
GO

CREATE USER user_reader FOR LOGIN login2
WITH DEFAULT_SCHEMA = Esquema2;
GO

--"user_reader" rol: "db_datareader". "user_writer" roles: "db_datareader" y "db_datawriter".
USE Medina_Gascon_Heidi_Actividad;
GO

ALTER ROLE db_datareader ADD MEMBER user_reader
GO

ALTER ROLE db_datareader ADD MEMBER user_writer
ALTER ROLE db_datawriter ADD MEMBER user_writer
GO


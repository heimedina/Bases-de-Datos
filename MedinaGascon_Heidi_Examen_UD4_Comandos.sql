USE MedinaGascon_Heidi_Alquiler
GO

INSERT INTO Cliente(ClienteID, NombreCliente, Edad)
VALUES(11,'Fernando Alonso',50);
GO

INSERT INTO Coche(CocheID, Matricula, color, AnioMatriculacion)
VALUES(11, '1A2B3C4','Negro',2020);
GO

INSERT INTO Cliente(ClienteID, NombreCliente, Edad)
VALUES(12,'Chindasvinto García',66);
GO

INSERT INTO ClienteCoche (ClienteCocheID, ClienteID, CocheID, Dias, Kms)
VALUES (1, 11, 11, 20, 384400);
GO

--No existe el coche 10 por lo que lo insertamos
INSERT INTO Coche(CocheID, Matricula, Color, AnioMatriculacion)
VALUES (10, '5D6E7F8', 'Rosa', 2018);
INSERT INTO ClienteCoche (ClienteCocheID, ClienteID, CocheID, Dias)
VALUES (2, 12, 10, 5);
GO

----------------------------------------
----------------------------------------
--Añadir edad cuando FechaNacimiento no es nula
UPDATE Cliente SET Edad = YEAR(GETDATE()) - YEAR(FechaNacimiento)
WHERE FechaNacimiento IS NOT NULL;
GO
--Suma un año a la matriculación si el color contiene la 'e'
UPDATE Coche SET AnioMatriculacion += 1
WHERE Color LIKE '%e%';
GO
--ClienteCoches con algún Km tiene un día más
UPDATE ClienteCoche SET Dias += 1
WHERE Kms > 0;
GO
--Borra Cliente con ClienteID Par
DELETE FROM Cliente WHERE ClienteID % 2 = 0;
GO
--Borra Coche con color termina en 'o'
DELETE FROM Coche WHERE Color LIKE '%o';
GO
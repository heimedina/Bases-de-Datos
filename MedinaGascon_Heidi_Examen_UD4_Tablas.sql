USE MedinaGascon_Heidi_Alquiler;
GO

DROP TABLE IF EXISTS Coche;

--Crea tabla Coche solo con atributos
CREATE TABLE Coche (
    CocheID INT NOT NULL,
    Matricula NCHAR(7) NOT NULL,
    Color VARCHAR(20) NOT NULL,
    AnioMatriculacion INT NOT NULL
);
GO

-- Clave primaria
ALTER TABLE dbo.Coche
ADD CONSTRAINT PK_Coche PRIMARY KEY (CocheID);
GO
-- Datos numéricos positivos >0
ALTER TABLE dbo.Coche
ADD CONSTRAINT CK_Coche_CocheID CHECK (CocheID > 0);
GO
-- Datos numéricos positivos >0
ALTER TABLE dbo.Coche
ADD CONSTRAINT CK_Coche_AnioMatriculacion CHECK (AnioMatriculacion > 0);
GO
-- Matrícula debe contener algún número
ALTER TABLE dbo.Coche
ADD CONSTRAINT CK_Coche_Matricula CHECK (Matricula LIKE '%[0-9]%');
GO
-- Colores permitidos
ALTER TABLE dbo.Coche
ADD CONSTRAINT CK_Coche_Color
CHECK (Color IN ('Rojo','Azul','Verde','Gris','Blanco','Negro','Rosa'));
GO

--Crea tabla solo con atributos
CREATE TABLE ClienteCoche (
    ClienteCocheID INT NOT NULL,
    ClienteID INT NOT NULL,
    CocheID INT NOT NULL,
    Dias INT NOT NULL,
    Kms FLOAT
);
GO
-- Clave primaria
ALTER TABLE dbo.ClienteCoche
ADD CONSTRAINT PK_ClienteCoche PRIMARY KEY (ClienteCocheID);
GO
-- Datos numéricos positivos >0
ALTER TABLE dbo.ClienteCoche
ADD CONSTRAINT CK_ClienteCoche_ClienteCocheID CHECK (ClienteCocheID > 0);
GO

ALTER TABLE dbo.ClienteCoche
ADD CONSTRAINT CK_ClienteCoche_Dias CHECK (Dias > 0);
GO

ALTER TABLE dbo.ClienteCoche
ADD CONSTRAINT CK_ClienteCoche_Kms CHECK (Kms > 0);
GO

--Foreign Key en borrado y modificación: en cascada
ALTER TABLE dbo.ClienteCoche ADD CONSTRAINT FK_ClienteCoche_Cliente
FOREIGN KEY (ClienteID)
REFERENCES Cliente(ClienteID)
ON DELETE CASCADE
ON UPDATE CASCADE;
GO

ALTER TABLE dbo.ClienteCoche ADD CONSTRAINT FK_ClienteCoche_Coche
FOREIGN KEY (CocheID)
REFERENCES Coche(CocheID)
ON DELETE CASCADE
ON UPDATE CASCADE;
GO
CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nome NVARCHAR(100) NOT NULL,
    CPF CHAR(11) NOT NULL,
    DataNascimento DATE NOT NULL,
    Email NVARCHAR(100),
    Logradouro NVARCHAR(200),
    Numero NVARCHAR(10),
    Bairro NVARCHAR(100),
    Cidade NVARCHAR(100),
    Estado NVARCHAR(2),
    CEP CHAR(8)
);

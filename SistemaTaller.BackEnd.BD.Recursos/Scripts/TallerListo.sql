CREATE DATABASE Taller2
GO

USE Taller2
GO 

CREATE TABLE Mecanicos(
	Identificaciones VARCHAR(20),
	Nombre VARCHAR(20) NOT NULL,
	Apellidos VARCHAR(30) NOT NULL,
	Telefono VARCHAR(15) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	Activo BIT DEFAULT 1 NOT NULL,
	FechaCreacion DATETIME DEFAULT GETDATE(),
	FechaModificacion DATETIME,
	CreadoPor VARCHAR(20),
	ModificadoPor VARCHAR(20),
	CONSTRAINT PK_Mecanicos PRIMARY KEY(Identificaciones)
)
GO

-----Documentacion a Tabla

EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Datos del mecanico',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Mecanicos'
GO

-----Documentacion a campos

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Identificacion del mecanico',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Mecanicos', 
   	@level2type = N'Column',	@level2name = 'Identificaciones'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del mecanico',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Mecanicos', 
   	@level2type = N'Column',	@level2name = 'Nombre'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Apellidos del mecanico',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Mecanicos', 
   	@level2type = N'Column',	@level2name = 'Apellidos'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Numero telefonico del mecanico',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Mecanicos', 
   	@level2type = N'Column',	@level2name = 'Telefono'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Correo electronico del mecanico',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Mecanicos', 
   	@level2type = N'Column',	@level2name = 'Email'

GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condicion en la que se encuentra el mecanico',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Mecanicos', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creacion del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Mecanicos', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificacion del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Mecanicos', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del Usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Mecanicos', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Mecanicos', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

CREATE TABLE Clientes(
	Identificacion VARCHAR(20),
	Nombre VARCHAR(20) NOT NULL,
	Apellidos VARCHAR(30) NOT NULL,
	Telefono VARCHAR(15) NOT NULL,
	Email VARCHAR(30) NOT NULL, 
	Direccion VARCHAR(15) NOT NULL,
	Activo BIT DEFAULT 1,
	FechaCreacion DATETIME DEFAULT GETDATE(),
	FechaModificacion DATETIME,
	CreadoPor VARCHAR(20),
	ModificadoPor VARCHAR(20),
	CONSTRAINT PK_Cliente PRIMARY KEY(Identificacion)
)
GO

----Documentación a tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Datos del Cliente',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Clientes'
GO
----Documentación a campos
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Identificacion del Cliente',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clientes', 
   	@level2type = N'Column',	@level2name = 'Identificacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del cliente',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clientes', 
   	@level2type = N'Column',	@level2name = 'Nombre'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Apellidos del Cliente',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clientes', 
   	@level2type = N'Column',	@level2name = 'Apellidos'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Numero telefonico del cliente',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clientes', 
   	@level2type = N'Column',	@level2name = 'Telefono'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Correo electronico del Cliente',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clientes', 
   	@level2type = N'Column',	@level2name = 'Email'

GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Lugar donde vive el cliente',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clientes', 
   	@level2type = N'Column',	@level2name = 'Direccion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condicion en la que se encuentra el cliente',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clientes', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creacion del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clientes', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificacion del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clientes', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO


EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del Usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clientes', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clientes', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

CREATE TABLE Talleres(
	Id INT IDENTITY(1,1),
	Nombre VARCHAR(45) NOT NULL,
	Telefono VARCHAR(15) NOT NULL,
	Canton VARCHAR(15) NOT NULL,
	Direccion VARCHAR(80) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	Activo BIT DEFAULT 1,
	FechaCreacion DATETIME DEFAULT GETDATE(),
	FechaModificacion DATETIME,
	CreadoPor VARCHAR(20),
	ModificadoPor VARCHAR(20),
	CONSTRAINT PK_Talleres PRIMARY KEY(Id)
)

GO

----Documentación a tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Datos del Taller donde estaran los vehiculos',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Talleres'
GO
----Documentación a campos
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Identificacion del Taller',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Talleres', 
   	@level2type = N'Column',	@level2name = 'Id'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del Taller',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Talleres', 
   	@level2type = N'Column',	@level2name = 'Nombre'
GO


EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Numero telefonico del Taller',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Talleres', 
   	@level2type = N'Column',	@level2name = 'Telefono'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Canton donde se encuentra el Taller',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Talleres', 
   	@level2type = N'Column',	@level2name = 'Canton'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Direccion de ubicacion del Taller',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Talleres', 
   	@level2type = N'Column',	@level2name = 'Direccion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Correo electronico del Taller',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Talleres', 
   	@level2type = N'Column',	@level2name = 'Email'

GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condicion en la que se encuentra el registro :1 = Activo; 0 = Inactivo o Borrado',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Talleres', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO


EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creacion del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Talleres', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificacion del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Talleres', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO


EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del Usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Talleres', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Talleres', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

CREATE TABLE MarcaRepuestos(
	Id INT IDENTITY(1,1),
	Nombre VARCHAR(20) NOT NULL,
	Activo BIT DEFAULT 1,
	FechaCreacion DATETIME DEFAULT GETDATE(),
	FechaModificacion DATETIME,
	CreadoPor VARCHAR(20),
	ModificadoPor VARCHAR(20),
	CONSTRAINT PK_MarcaRepuesto PRIMARY KEY(Id)
)
GO


----Documentación a tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Datos de la marca del repuesto, que recomendara el mecanico al cliente',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'MarcaRepuestos'
GO
----Documentación a campos
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Id o codigo de la marca del respuesto',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MarcaRepuestos', 
   	@level2type = N'Column',	@level2name = 'Id'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre de la marca del respuesto',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MarcaRepuestos', 
   	@level2type = N'Column',	@level2name = 'Nombre'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condicion en la que se encuentra el registro :1 = Activo; 0 = Inactivo o Borrado',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MarcaRepuestos', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creacion del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MarcaRepuestos', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificacion del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MarcaRepuestos', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del Usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MarcaRepuestos', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MarcaRepuestos', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

CREATE TABLE Repuestos(
	CodigoRepuesto VARCHAR(25),
	Nombre VARCHAR(20) NOT NULL,
	IdMarca INT,
	Precio DECIMAL(18,3) NOT NULL,
	Activo BIT DEFAULT 1,
	FechaCreacion DATETIME DEFAULT GETDATE(),
	FechaModificacion DATETIME,
	CreadoPor VARCHAR(20),
	ModificadoPor VARCHAR(20),
	CONSTRAINT PK_Repuestos PRIMARY KEY(CodigoRepuesto),
	CONSTRAINT FK_Repuestos_IdMarca FOREIGN KEY(IdMarca) REFERENCES MarcaRepuestos(Id)
)
GO


----Documentación a tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Datos sobre los respuestos que necesitaran los vehiculos ',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Repuestos'
GO
----Documentación a campos
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Codigo del respuesto',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Repuestos', 
   	@level2type = N'Column',	@level2name = 'CodigoRepuesto'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del repuesto que se utilizara',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Repuestos', 
   	@level2type = N'Column',	@level2name = 'Nombre'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Id o codigo para encontrar la marca del repuesto que se utilizara',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Repuestos', 
   	@level2type = N'Column',	@level2name = 'IdMarca'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Valor del precio del repuesto en el mercado',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Repuestos', 
   	@level2type = N'Column',	@level2name = 'Precio'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condicion en la que se encuentra el registro :1 = Activo; 0 = Inactivo o Borrado',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Repuestos', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Repuestos', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Repuestos', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Repuestos', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Repuestos', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

CREATE TABLE MarcaVehiculos(
	Id INT IDENTITY(1,1),
	Nombre VARCHAR(20) NOT NULL,
	Activo BIT DEFAULT 1,
	FechaCreacion DATETIME DEFAULT GETDATE(),
	FechaModificacion DATETIME ,
	CreadoPor VARCHAR(20),
	ModificadoPor VARCHAR(20),
	CONSTRAINT PK_MarcaVehiculos PRIMARY KEY(Id)
)
GO


----Documentación a tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Catálogo de la marca de vehiculos',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'MarcaVehiculos'
GO
----Documentación a campos
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Id o codigo de la marca del vehiculo',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MarcaVehiculos', 
   	@level2type = N'Column',	@level2name = 'Id'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre de la marca del vehiculo',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MarcaVehiculos', 
   	@level2type = N'Column',	@level2name = 'Nombre'
GO


EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creacion del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MarcaVehiculos', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificacion del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MarcaVehiculos', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MarcaVehiculos', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MarcaVehiculos', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

Create table Vehiculos(
	Placa VARCHAR(10),
	IdMarca INT,
	Modelo INT NOT NULL,
	Activo BIT DEFAULT 1,
	FechaCreacion DATETIME DEFAULT GETDATE(),
	FechaModificacion DATETIME,
	CreadoPor VARCHAR(20),
	ModificadoPor VARCHAR(20),
	CONSTRAINT PK_Vehiculos PRIMARY KEY (Placa),
	CONSTRAINT FK_Vehiculos_IdMarca FOREIGN KEY(IdMarca) REFERENCES MarcaVehiculos(Id)  
)
GO

----Documentación a tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Datos sobre los vehiculos que se reparan ',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Vehiculos'
GO
----Documentación a campos
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Placa que presenta el vehiculo',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Vehiculos', 
   	@level2type = N'Column',	@level2name = 'Placa'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Id o codigo de la marca del vehiculo que se reparara',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Vehiculos', 
   	@level2type = N'Column',	@level2name = 'IdMarca'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Modelo del vehiculo en reparacion',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Vehiculos', 
   	@level2type = N'Column',	@level2name = 'Modelo'
GO


EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condicion si puede reparar el vehiculo',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Vehiculos', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Vehiculos', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Vehiculos', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Vehiculos', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Vehiculos', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

CREATE TABLE VehiculosCliente(
	IdentificacionCliente VARCHAR(20),
	Placa VARCHAR(10),
	Activo BIT DEFAULT 1,
	FechaCreacion DATETIME DEFAULT GETDATE(),
	FechaModificacion DATETIME,
	CreadoPor VARCHAR(20),
	ModificadoPor VARCHAR(20),
	CONSTRAINT FK_VehiculosCliente_Identificacion FOREIGN KEY(IdentificacionCliente) REFERENCES Clientes(Identificacion),
	CONSTRAINT FK_VehiculosCliente_Placa FOREIGN KEY(Placa) REFERENCES Vehiculos(Placa),
	CONSTRAINT PK_VehiculosCliente PRIMARY KEY(IdentificacionCliente, Placa)	
)
GO


----Documentación a tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Datos sobre los vehiculos de los clientes',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'VehiculosCliente'
GO
----Documentación a campos
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Identificacion del cliente en atencion',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'VehiculosCliente', 
   	@level2type = N'Column',	@level2name = 'IdentificacionCliente'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Placa del vehiculo del cliente',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'VehiculosCliente', 
   	@level2type = N'Column',	@level2name = 'Placa'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condicion del vehiculo del cliente',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'VehiculosCliente', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'VehiculosCliente', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'VehiculosCliente', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'VehiculosCliente', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'VehiculosCliente', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

CREATE TABLE MecanicosTaller(
	IdMecanicos VARCHAR(20),
	IdTalleres INT,
	Activo BIT DEFAULT 1,
	FechaCreacion DATETIME DEFAULT GETDATE(),
	FechaModificacion DATETIME,
	CreadoPor VARCHAR(20),
	ModificadoPor VARCHAR(20),
	CONSTRAINT FK_MecanicosTaller_IdMecanico FOREIGN KEY(IdMecanicos) REFERENCES Mecanicos(Identificaciones),
	CONSTRAINT FK_MecanicosTaller_Taller FOREIGN KEY(IdTalleres) REFERENCES Talleres(Id),
	CONSTRAINT PK_MecanicosTaller PRIMARY KEY(IdMecanicos, IdTalleres)	
)
GO

----Documentación a tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Datos sobre el taller donde trabaja el mecanico',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'MecanicosTaller'
GO
----Documentación a campos
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Id o codigo del mecanico',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MecanicosTaller', 
   	@level2type = N'Column',	@level2name = 'IdMecanicos'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Id o codigo del Taller',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MecanicosTaller', 
   	@level2type = N'Column',	@level2name = 'IdTalleres'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condicion en que se encuentra el taller del mecanico',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MecanicosTaller', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MecanicosTaller', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MecanicosTaller', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MecanicosTaller', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MecanicosTaller', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

CREATE TABLE EstadoReparaciones(
	Id INT IDENTITY(1,1),
	Estados VARCHAR(15) NOT NULL,
	Activo BIT DEFAULT 1,
	FechaCreacion DATETIME DEFAULT GETDATE(),
	FechaModificacion DATETIME,
	CreadoPor VARCHAR(20),
	ModificadoPor VARCHAR(20),
	CONSTRAINT PK_EstadoReparaciones PRIMARY KEY(Id)
)
GO

----Documentación a tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Datos de estado de las reparaciones de los vehiculos ',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'EstadoReparaciones'
GO
----Documentación a campos
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Id del vehiculo que esta en reparacion',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'EstadoReparaciones', 
   	@level2type = N'Column',	@level2name = 'Id'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Estado en que se encuentra el vehiculo en reparacion',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'EstadoReparaciones', 
   	@level2type = N'Column',	@level2name = 'Estados'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condicion en que se encuentra el vehiuculo en reparacion',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'EstadoReparaciones', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'EstadoReparaciones', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'EstadoReparaciones', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'EstadoReparaciones', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'EstadoReparaciones', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

CREATE TABLE Reparaciones(
	IdReparaciones INT IDENTITY(1,1),
	FechasIngreso DATE NOT NULL,
	FechasSalida DATE NOT NULL,
	PlacasVehiculos VARCHAR(10),
	IdMecanicos VARCHAR(20),
	DiagnosticosReparaciones VARCHAR(100) NOT NULL,
	IdEstadosReparacion INT,
	MontosDeObra DECIMAL(18,3) NOT NULL, 
	MontosRepuestos DECIMAL(18,3) NOT NULL,
	MontosTotales AS MontosDeObra + MontosRepuestos, --Campo calculado
	Activo BIT DEFAULT 1,
	FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
	FechaModificacion DATETIME,
	CreadoPor VARCHAR(20),
	ModificadoPor VARCHAR(20),
	CONSTRAINT PK_Reparaciones PRIMARY KEY(IdReparaciones),
	CONSTRAINT FK_Reparaciones_PlacaVehiculos FOREIGN KEY(PlacasVehiculos) REFERENCES Vehiculos(Placa),
	CONSTRAINT FK_Reparaciones_IdMecanicos FOREIGN KEY(IdMecanicos) REFERENCES Mecanicos(Identificaciones),
	CONSTRAINT FK_Reparaciones_IdEstadoReparacion FOREIGN KEY(IdEstadosReparacion) REFERENCES EstadoReparaciones(Id)
)
GO

----Documentación a tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Datos sobre las reparaciones',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Reparaciones'
GO

----Documentación a campos
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Id de las reparaciones',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Reparaciones', 
   	@level2type = N'Column',	@level2name = 'IdReparaciones'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha en la que ingresa un vehiculo al taller',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Reparaciones', 
   	@level2type = N'Column',	@level2name = 'FechasIngreso'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha en la que se termina la reparacion del vehiculo',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Reparaciones', 
   	@level2type = N'Column',	@level2name = 'FechasSalida'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Numero de placa de los vehiculos',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Reparaciones', 
   	@level2type = N'Column',	@level2name = 'PlacasVehiculos'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Id del mecanico que reparo el vehiculo',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Reparaciones', 
   	@level2type = N'Column',	@level2name = 'IdMecanicos'

GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'El desperfecto que se le reparo al vehiculo',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Reparaciones', 
   	@level2type = N'Column',	@level2name = 'DiagnosticosReparaciones'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Id sobre el estado de reparacion del vehiculo',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Reparaciones', 
   	@level2type = N'Column',	@level2name = 'IdEstadosReparacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Monto sobre la obra realizada',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Reparaciones', 
   	@level2type = N'Column',	@level2name = 'MontosDeObra'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Monto del repuesto instalado en el vehiculo',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Reparaciones', 
   	@level2type = N'Column',	@level2name = 'MontosRepuestos'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'La suma de los campos MontosDeObra y MontosRepuestos',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Reparaciones', 
   	@level2type = N'Column',	@level2name = 'MontosTotales'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Indica si la reparacion sigue activa o no',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Reparaciones', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Reparaciones', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Reparaciones', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Reparaciones', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Reparaciones', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

CREATE TABLE RepuestoReparaciones(
	IdReparaciones INT,
	CodigoRepuestos VARCHAR(25),
	Activo BIT DEFAULT 1,
	FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
	FechaModificacion DATETIME,
	CreadoPor VARCHAR(20),
	ModificadoPor VARCHAR(20),
	CONSTRAINT PK_RepuestoReparaciones PRIMARY KEY(IdReparaciones, CodigoRepuestos),
	CONSTRAINT FK_RepuestoReparaciones_IdReparaciones FOREIGN KEY(IdReparaciones) REFERENCES Reparaciones(IdReparaciones),
	CONSTRAINT FK_RepuestoReparaciones_CodigoRepuestos FOREIGN KEY(CodigoRepuestos) REFERENCES Repuestos(CodigoRepuesto)
)

GO

----Documentación a tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Repuestos que se necesitan en cada reparacion',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'RepuestoReparaciones'
GO

----Documentación a campos
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Id de la reparacion ',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'RepuestoReparaciones', 
   	@level2type = N'Column',	@level2name = 'IdReparaciones'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Codigo del respuesto obtenido ',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'RepuestoReparaciones', 
   	@level2type = N'Column',	@level2name = 'CodigoRepuestos'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condicion en que se entrega el repuesto',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'RepuestoReparaciones', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'RepuestoReparaciones', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'RepuestoReparaciones', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'RepuestoReparaciones', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',   
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'RepuestoReparaciones', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

----------------------------------------------------------------------------------------------------------------

CREATE TABLE ErroresBD(
	IdError INT IDENTITY(1, 1),
    NumeroDeError INT,
	MensajeDelError VARCHAR(MAX),
	LineaDelError INT,	
	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL,	
	CreadoPor VARCHAR(60),
	CONSTRAINT PK_ErroresBD PRIMARY KEY(IdError)
)
GO

EXEC sp_addextendedproperty
	@name = N'MS_Description',	@value = 'Errores que se generen a nivel de Base de Datos',
   	@level0type = N'Schema',	@level0name = 'dbo',
  	@level1type = N'Table',		@level1name = 'ErroresBD'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Identificador único de cada error que se presente a nivel de base de datos',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'IdError'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Número de error del SGBD para cada error que se presente a nivel de base de datos',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'NumeroDeError'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Mensaje de error del SGBD para cada error que se presente a nivel de base de datos',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'MensajeDelError'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Línea del código donde está el problema para cada error que se presente a nivel de base de datos',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'LineaDelError'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario conectado a la BD que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO

---------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE SP_ErroresBD_Insertar
	@CreadoPor VARCHAR(60)
	AS 
	BEGIN
		INSERT INTO ErroresBD (NumeroDeError, MensajeDelError, LineaDelError, CreadoPor)
		VALUES (ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE(), @CreadoPor)

		RETURN @@IDENTITY
	END
GO
---------------------------------------------------------------------------------------------------------------

----FN's y vistas Mecanicos

CREATE VIEW VW_Mecanicos_SeleccionarTodos
AS 
	SELECT Identificaciones, Nombre, Apellidos FROM Mecanicos WHERE Activo = 1

GO
CREATE FUNCTION FN_Mecanicos_VerificaExistenciaPorIdentificaciones (
	@Identificaciones VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteMecanico BIT;
	
	SET @ExisteMecanico = (SELECT count(Identificaciones) FROM Mecanicos WHERE Identificaciones = @Identificaciones)
	 
    RETURN @ExisteMecanico
END;
GO
CREATE FUNCTION FN_Mecanicos_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Mecanicos_SeleccionarTodos

GO
CREATE FUNCTION FN_Mecanicos_SeleccionarPorIdentificaciones(
	@Identificaciones VARCHAR(20)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Mecanicos_SeleccionarTodos AS Mecanicos
		WHERE 
			Mecanicos.Identificaciones = @Identificaciones


GO
------SPs Mecanicos------

CREATE PROCEDURE SP_Mecanicos_Insertar
	@Identificaciones VARCHAR(20),
	@Nombre VARCHAR(20),
	@Apellidos VARCHAR(30),
	@Telefono VARCHAR(15),
	@Email VARCHAR(30),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Mecanicos(Identificaciones, Nombre, Apellidos,Telefono,Email, CreadoPor)
			VALUES(@Identificaciones, @Nombre, @Apellidos,@Telefono,@Email, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un Mecanico'		
	END CATCH

GO
CREATE PROCEDURE SP_Mecanicos_Desactivar
	@Identificaciones VARCHAR(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteMecanico BIT

			SET @ExisteMecanico = dbo.FN_Mecanicos_VerificaExistenciaPorIdentificaciones(@Identificaciones)

			IF(@ExisteMecanico = 1)
				BEGIN
					UPDATE Mecanicos 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Identificaciones = @Identificaciones

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Mecanico: '+	@Identificaciones	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Mecanico: '+	@Identificaciones	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
GO

CREATE PROCEDURE SP_Mecanico_Actualizar
	@Identificaciones VARCHAR(20),
	@Nombre VARCHAR(20),
	@Apellidos VARCHAR(30),
	@Telefono VARCHAR(15),
	@Email VARCHAR(30),
	@Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteMecanico BIT
		
		SET @ExisteMecanico = dbo.FN_Mecanicos_VerificaExistenciaPorIdentificaciones(@Identificaciones)
		
		IF(@ExisteMecanico = 1)
			BEGIN
				UPDATE Mecanicos
				SET
					
					Nombre = @Nombre,
					Apellidos=@Apellidos,
					Telefono= @Telefono,
					Email = @Email,
					Activo= @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					Identificaciones = @Identificaciones

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'Mecanicos: '+ @Identificaciones +' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION

	    DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando el Mecanico '+	@Identificaciones+'. Número de Error: ' + @NumeroDeError

	END CATCH

GO
-----FN's y vistas tabla Clientes

 CREATE VIEW VW_Clientes_SeleccionarTodos
   AS 
	SELECT Identificacion, Nombre, Apellidos FROM Clientes WHERE Activo = 1

GO
CREATE FUNCTION FN_Clientes_VerificaExistenciaPorIdentificacion ( 
	@Identificacion VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteCliente BIT;
	
	SET @ExisteCliente = (SELECT count(Identificacion) FROM Clientes WHERE Identificacion = @Identificacion)
	 
    RETURN @ExisteCliente
END;
GO
CREATE FUNCTION FN_Clientes_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Clientes_SeleccionarTodos
GO
CREATE FUNCTION FN_Clientes_SeleccionarPorIdentificacion(
	@Identificacion VARCHAR(20)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Clientes_SeleccionarTodos AS Clientes
		WHERE 
			Clientes.Identificacion = @Identificacion
GO
--------SP's Tabla Clientes

CREATE OR ALTER PROCEDURE SP_Clientes_Insertar
	@Identificacion VARCHAR(20),
	@Nombre VARCHAR(20),
	@Apellidos VARCHAR(30),
	@Telefono VARCHAR(15),
	@Email VARCHAR(30),
	@Direccion VARCHAR(15),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Clientes(Identificacion, Nombre, Apellidos,Telefono,Email, Direccion, CreadoPor)
			VALUES(@Identificacion, @Nombre, @Apellidos,@Telefono,@Email, @Direccion, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

	DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un Cliente: ' + @NumeroDeError
	END CATCH
GO
CREATE OR ALTER PROCEDURE SP_Clientes_Desactivar
	@Identificacion VARCHAR(20),
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCliente BIT

			SET @ExisteCliente = dbo.FN_Clientes_VerificaExistenciaPorIdentificacion(@Identificacion)

			IF(@ExisteCliente = 1)
				BEGIN
					UPDATE Clientes 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Identificacion = @Identificacion

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Cliente: '+	@Identificacion	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Cliente: '+	@Identificacion	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
GO
CREATE OR ALTER PROCEDURE SP_Clientes_Actualizar
	@Identificacion VARCHAR(20),
	@Nombre VARCHAR(20),
	@Apellidos VARCHAR(30),
	@Telefono VARCHAR(15),
	@Email VARCHAR(30),
	@Direccion VARCHAR(15),
	@Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteCliente BIT
		
		SET @ExisteCliente = dbo.FN_Clientes_VerificaExistenciaPorIdentificacion(@Identificacion)
		
		IF(@ExisteCliente = 1)
			BEGIN
				UPDATE Clientes
				SET
					
					Nombre = @Nombre,
					Apellidos=@Apellidos,
					Telefono= @Telefono,
					Email = @Email,
					Direccion=@Direccion,
					Activo= @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					Identificacion = @Identificacion

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'Cliente: '+ @Identificacion +' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION

			DECLARE @NumeroDeError INT 
			EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando el Cliente '+	@Identificacion
		
	END CATCH
GO
----- Fn's y vistas Tabla Talleres

CREATE VIEW VW_Talleres_SeleccionarTodos
AS 
	SELECT Id, Nombre FROM Talleres WHERE Activo = 1
GO
CREATE FUNCTION FN_Talleres_VerificaExistenciaPorId ( 
	@Id VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteTaller BIT;
	
	SET @ExisteTaller = (SELECT count(Id) FROM Talleres WHERE Id = @Id)
	 
    RETURN @ExisteTaller
END;
GO
CREATE FUNCTION FN_Talleres_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Talleres_SeleccionarTodos
GO
CREATE FUNCTION FN_Talleres_SeleccionarPorId(
	@Id INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Talleres_SeleccionarTodos AS Talleres
		WHERE 
			Talleres.Id = @Id
GO
-----SP's Tabla Talleres

CREATE OR ALTER PROCEDURE SP_Talleres_Insertar
	@Id INT,
	@Nombre VARCHAR(45),
	@Telefono VARCHAR(15),
	@Canton VARCHAR(15),
	@Direccion VARCHAR(80),
	@Email VARCHAR(30),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Talleres(Id, Nombre,Telefono,Canton,Direccion, Email, CreadoPor)
			VALUES(@Id, @Nombre,@Telefono,@Canton,@Direccion, @Email, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un Taller' + @NumeroDeError		
	END CATCH

GO
CREATE OR ALTER PROCEDURE SP_Talleres_Eliminar
	@Id VARCHAR(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteTaller BIT

			SET @ExisteTaller = dbo.FN_Talleres_VerificaExistenciaPorId(@Id)

			IF(@ExisteTaller = 1)
				BEGIN
					UPDATE Talleres 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Id = @Id

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Taller: '+	@Id	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Taller: '+	@Id	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
GO
CREATE OR ALTER PROCEDURE SP_talleres_Actualizar
	@Id INT,
	@Nombre VARCHAR(45),
	@Telefono VARCHAR(15),
	@Canton VARCHAR(15),
	@Direccion VARCHAR(80),
	@Email VARCHAR(30),
    @Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteTaller BIT
		
		SET @ExisteTaller = dbo.FN_Talleres_VerificaExistenciaPorId(@Id)
		
		IF(@ExisteTaller = 1)
			BEGIN
				UPDATE Talleres
				SET
					
					Nombre = @Nombre,
					Telefono= @Telefono,
					Canton=@Canton,
					Direccion=@Direccion,
					Email = @Email,
					Activo= @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					Id = @Id

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'Taller: '+ @Id +' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando el Taller '+ @Id + '. Número de Error: ' + @NumeroDeError		
	END CATCH
GO
------ FN's y vistas Tabla MarcaRepuestos

CREATE VIEW VW_MarcaRepuestos_SeleccionarTodos
AS 
	SELECT Id, Nombre FROM MarcaRepuestos WHERE Activo = 1
GO

CREATE FUNCTION FN_MarcaRepuestos_VerificaExistenciaPorId ( 
	@Id INT)
RETURNS BIT AS
BEGIN
	DECLARE @ExisteMarcaRepuesto BIT;
	
	SET @ExisteMarcaRepuesto = (SELECT count(Id) FROM MarcaRepuestos WHERE Id = @Id)
	 
    RETURN @ExisteMarcaRepuesto
END;
GO

CREATE FUNCTION FN_MarcaRepuestos_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_MarcaRepuestos_SeleccionarTodos
GO

CREATE FUNCTION FN_MarcaRepuestos_SeleccionarPorId(
	@Id INT)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_MarcaRepuestos_SeleccionarTodos AS MarcaRepuestos
		WHERE 
			MarcaRepuestos.Id = @Id
GO
----SP's Tabla MarcaRepuestos

CREATE OR ALTER PROCEDURE SP_MarcaRepuestos_Insertar
	@Id INT,
	@Nombre VARCHAR(20),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO MarcaRepuestos(Id, Nombre,CreadoPor)
			VALUES(@Id, @Nombre, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando una Marca de Repuesto'		
	END CATCH

GO

CREATE OR ALTER PROCEDURE SP_MarcasRepuestos_Desactivar 
	@Id INT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteMarcaRepuesto BIT

			SET @ExisteMarcaRepuesto = dbo.FN_MarcaRepuestos_VerificaExistenciaPorId(@Id)

			IF(@ExisteMarcaRepuesto = 1)
				BEGIN
					UPDATE MarcaRepuestos
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Id = @Id

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'MarcaRepuesto: '+	@Id	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar la marca del repuesto: '+	@Id	+ '. Número de Error: ' + @NumeroDeError

	END CATCH

	GO

CREATE OR ALTER PROCEDURE SP_MarcaRepuestos_Actualizar
	@Id INT,
	@Nombre VARCHAR(20),
    @Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteMarcaRepuesto BIT
		
		SET @ExisteMarcaRepuesto = dbo.FN_MarcaRepuestos_VerificaExistenciaPorId(@Id)
		
		IF(@ExisteMarcaRepuesto= 1)
			BEGIN
				UPDATE MarcaRepuestos
				SET
					
					Nombre = @Nombre,
		            Activo= @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					Id = @Id

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'MarcaRepuesto: '+ @Id +' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando la Marca del Repuesto '+ @Id + '. Número de Error: ' + @NumeroDeError		
	END CATCH

	GO

------FN's y vistas Tabla Repuestos

CREATE VIEW VW_Repuestos_SeleccionarTodos
AS 
	SELECT CodigoRepuesto, Nombre, IdMarca, Precio FROM Repuestos WHERE Activo = 1

	GO

CREATE FUNCTION FN_Repuestos_VerificaExistenciaPorCodigoRepuesto ( 
	@CodigoRepuesto VARCHAR(25))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteTaller BIT;
	
	SET @ExisteTaller = (SELECT count(@CodigoRepuesto) FROM Repuestos WHERE CodigoRepuesto = @CodigoRepuesto)
	 
    RETURN @ExisteTaller
END;

GO

CREATE FUNCTION FN_Repuestos_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Repuestos_SeleccionarTodos

		GO

CREATE FUNCTION FN_Repuestos_SeleccionarPorCodigoRepuesto(
	@CodigoRepuesto VARCHAR (25)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Repuestos_SeleccionarTodos AS Repuestos
		WHERE 
			Repuestos.CodigoRepuesto = @CodigoRepuesto

GO

---SP's Tabla Repuestos

CREATE PROCEDURE SP_Repuestos_Insertar
	@CodigoRepuesto VARCHAR(25),
	@Nombre VARCHAR(20),
	@IdMarca INT,
	@Precio DECIMAL(18,3),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Repuestos(CodigoRepuesto,Nombre,IdMarca,Precio, CreadoPor)
			VALUES(@CodigoRepuesto,@Nombre,@IdMarca,@Precio,  @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un Repuesto'		
	END CATCH

GO

CREATE OR ALTER PROCEDURE SP_Repuestos_Desactivar
	@CodigoRepuesto VARCHAR (25),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteRepuesto BIT

			SET @ExisteRepuesto = dbo.FN_Repuestos_VerificaExistenciaPorCodigoRepuesto(@CodigoRepuesto)

			IF(@ExisteRepuesto = 1)
				BEGIN
					UPDATE Repuestos
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoRepuesto = @CodigoRepuesto

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Repuesto: '+	@CodigoRepuesto	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Mecanico: '+	@CodigoRepuesto	+ '. Número de Error: ' + @NumeroDeError

	END CATCH

GO

CREATE OR ALTER PROCEDURE SP_Repuestos_Actualizar
    @CodigoRepuesto VARCHAR(25),
	@Nombre VARCHAR(20) ,
	@IdMarca INT,
	@Precio DECIMAL(18,3),
    @Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteRepuesto BIT
		
		SET @ExisteRepuesto = dbo.FN_Repuestos_VerificaExistenciaPorCodigoRepuesto(@CodigoRepuesto)
		
		IF(@ExisteRepuesto = 1)
			BEGIN
				UPDATE Repuestos
				SET
					
					Nombre = @Nombre,
					IdMarca= @IdMarca,
	                Precio = @Precio,
					Activo= @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					CodigoRepuesto= @CodigoRepuesto

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'Repuesto: '+ @CodigoRepuesto+' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando el Repuesto '+ @CodigoRepuesto+ '. Número de Error: ' + @NumeroDeError		
	END CATCH

GO

-----FN's y vistas Tabla MarcaVehiculos

CREATE VIEW VW_MarcaVehiculos_SeleccionarTodos
AS 
	SELECT Id, Nombre FROM MarcaVehiculos WHERE Activo = 1

GO

CREATE FUNCTION FN_MarcaVehiculos_VerificaExistenciaPorId ( 
	@Id INT)
RETURNS BIT AS
BEGIN
	DECLARE @ExisteMarcaVehiculo BIT;
	
	SET @ExisteMarcaVehiculo = (SELECT count(Id) FROM MarcaVehiculos WHERE Id = @Id)
	 
    RETURN @ExisteMarcaVehiculo
END;

GO

CREATE FUNCTION FN_MarcaVehiculos_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_MarcaVehiculos_SeleccionarTodos

GO

CREATE FUNCTION FN_MarcaVehiculos_SeleccionarPorId(
	@Id INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_MarcaVehiculos_SeleccionarTodos AS MarcaVehiculos
		WHERE 
			MarcaVehiculos.Id = @Id	
			
GO

----SP's de la Tabla MarcaVehiculos


CREATE OR ALTER PROCEDURE SP_MarcaVehiculos_Insertar
	@Id INT,
	@Nombre VARCHAR(20),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO MarcaRepuestos(Id, Nombre, CreadoPor)
			VALUES(@Id, @Nombre, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

	DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando una Marca: ' + @NumeroDeError
	END CATCH

GO

CREATE OR ALTER PROCEDURE SP_MarcaVehiculos_Desactivar
	@Id INT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteMarcaVehiculo BIT

			SET @ExisteMarcaVehiculo = dbo.FN_MarcaVehiculos_VerificaExistenciaPorId(@Id)
			
			IF(@ExisteMarcaVehiculo = 1)
				BEGIN
					UPDATE MarcaVehiculos
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Id = @Id

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Marca Vehiculo: '+	@Id+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar la marca del vehiculo: '+	@Id	+ '. Número de Error: ' + @NumeroDeError

	END CATCH

GO

CREATE OR ALTER PROCEDURE SP_MarcaVehiculos_Actualizar
	@Id INT,
	@Nombre VARCHAR(20),
	@Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteMarcaVehiculo BIT
		
		SET @ExisteMarcaVehiculo = dbo.FN_MarcaVehiculos_VerificaExistenciaPorId (@Id)
		
		IF(@ExisteMarcaVehiculo= 1)
			BEGIN
				UPDATE MarcaVehiculos
				SET
					
					Nombre = @Nombre,
					Activo= @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					Id = @Id

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'Marca Vehiculos: '+ @Id +' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION

	    DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando la marca de vehiculo '+	@Id+'. Número de Error: ' + @NumeroDeError

	END CATCH

GO

-----FN's y vista de la Tabla Vehiculos

CREATE VIEW VW_Vehiculos_SeleccionarTodos
AS 
	SELECT Placa, IdMarca FROM Vehiculos WHERE Activo = 1

GO

CREATE FUNCTION FN_Vehiculo_VerificaExistenciaPorPlaca ( 
	@Placa VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteVehiculo BIT;
	
	SET @ExisteVehiculo = (SELECT count(Placa) FROM Vehiculos WHERE Placa = @Placa)
	 
    RETURN @ExisteVehiculo
END;

GO

CREATE FUNCTION FN_Vehiculos_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Vehiculos_SeleccionarTodos

GO

CREATE FUNCTION FN_Vehiculos_SeleccionarPorId(
	@Placa VARCHAR(10)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Vehiculos_SeleccionarTodos AS Vehiculos
		WHERE 
			Vehiculos.Placa = @Placa

GO
------SP's de la Tabla Vehiculos

CREATE OR ALTER PROCEDURE SP_Vehiculos_Insertar
	@Placa VARCHAR(10),
	@IdMarca INT,
	@Modelo INT,
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION

			INSERT INTO Vehiculos(Placa,IdMarca,Modelo,CreadoPor)
			VALUES(@Placa,@IdMarca,@Modelo,@CreadoPor)

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un Vehiculo'+	@Placa+ '. Número de Error: ' + @NumeroDeError		
	END CATCH

GO

CREATE OR ALTER PROCEDURE SP_Vehiculos_Desactivar
	@Placa VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteVehiculo BIT

			SET @ExisteVehiculo = dbo.FN_Vehiculo_VerificaExistenciaPorPlaca(@Placa)

			IF(@ExisteVehiculo = 1)
				BEGIN
					UPDATE Vehiculos 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Placa = @Placa

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Vehiculo: '+	@Placa	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Vehiculo: '+	@Placa	+ '. Número de Error: ' + @NumeroDeError

	END CATCH

GO

CREATE OR ALTER PROCEDURE SP_Vehiuculo_Actualizar
	@Placa VARCHAR(10),
	@IdMarca INT,
	@Modelo INT,
	@Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteVehiculo BIT
		
		SET @ExisteVehiculo = dbo.FN_Vehiculo_VerificaExistenciaPorPlaca(@Placa)
		
		IF(@ExisteVehiculo = 1)
			BEGIN
				UPDATE Vehiculos
				SET
					IdMarca = @IdMarca,
					Modelo = @Modelo,
					Activo = @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					Placa = @Placa

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'Vehiculo: '+ @Placa +' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando el Vehiuculo '+	@Placa + '. Número de Error: ' + @NumeroDeError
	END CATCH

GO

-----FN's y vistas de la tabla 

CREATE VIEW VW_VehiculosCliente_SeleccionarTodos
AS 
	SELECT IdentificacionCliente, Placa  FROM VehiculosCliente WHERE Activo = 1

GO

CREATE FUNCTION FN_VehiculosCliente_VerificaExistenciaPorPlacaVehiculo ( 
	@Placa VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteVehiculoCliente BIT;
	
	SET @ExisteVehiculoCliente = (SELECT count(Placa) FROM VehiculosCliente WHERE Placa = @Placa)
	 
    RETURN @ExisteVehiculoCliente
END;

GO

CREATE FUNCTION FN_VehiculosCliente_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_VehiculosCliente_SeleccionarTodos

GO

CREATE FUNCTION FN_VehiculosCliente_SeleccionarPorId(
	@IdentificacionCliente VARCHAR(20)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_VehiculosCliente_SeleccionarTodos AS VehiculosCliente
		WHERE 
			VehiculosCliente.IdentificacionCliente = @IdentificacionCliente

GO

------SP's de la Tabla VehiculosCliente


CREATE OR ALTER PROCEDURE SP_VehiculosCliente_Insertar
	@IdentificacionCliente VARCHAR(20),
	@Placa VARCHAR(10),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION

			INSERT INTO VehiculosCliente(IdentificacionCliente, Placa, CreadoPor)
			VALUES(@IdentificacionCliente, @Placa, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un Vehiculo de cliente ' +	@Placa+ '. Número de Error: ' + @NumeroDeError		
	END CATCH

GO

CREATE PROCEDURE SP_VehiculosCliente_Desactivar
	@Placa VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteVehiculoCliente BIT

			SET @ExisteVehiculoCliente = dbo.FN_VehiculosCliente_VerificaExistenciaPorPlacaVehiculo(@Placa)

			IF(@ExisteVehiculoCliente = 1)
				BEGIN
					UPDATE VehiculosCliente 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Placa = @Placa

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Vehiculos de Cliente: '+	@Placa	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Vehiculo del Cliente: '+	@Placa	+ '. Número de Error: ' + @NumeroDeError

	END CATCH

GO

CREATE OR ALTER PROCEDURE SP_VehiculosCliente_Actualizar
	@Placa VARCHAR(10),
	@Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteVehiculosCliente BIT
		
		SET @ExisteVehiculosCliente = dbo.FN_VehiculosCliente_VerificaExistenciaPorPlacaVehiculo(@Placa)
		
		IF(@ExisteVehiculosCliente = 1)
			BEGIN
				UPDATE VehiculosCliente 
				SET
					Activo = @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					Placa = @Placa

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'VehiculoCliente: '+	@Placa	+' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor


		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizado el VehiculoCliente '+	@Placa + '. Número de Error: ' + @NumeroDeError	
	END CATCH

GO
-------FN's y vistas de la Tabla MecanicosTaller

CREATE VIEW VW_MecanicosTaller_SeleccionarTodos
AS 
	SELECT IdMecanicos, IdTalleres FROM MecanicosTaller WHERE Activo = 1

GO

CREATE FUNCTION FN_MecanicosTaller_VerificaExistenciaPorIdMecanicos ( 
	@IdMecanicos VARCHAR(20))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteMecanicosTaller BIT;
	
	SET @ExisteMecanicosTaller = (SELECT count(IdMecanicos) FROM MecanicosTaller WHERE IdMecanicos = @IdMecanicos)
	 
    RETURN @ExisteMecanicosTaller
END;

GO

CREATE FUNCTION FN_MecanicosTaller_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_MecanicosTaller_SeleccionarTodos

GO

CREATE FUNCTION FN_MecanicosTaller_SeleccionarPorId(
	@IdMecanicos VARCHAR(20) 
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_MecanicosTaller_SeleccionarTodos AS MecanicosTaller
		WHERE 
			MecanicosTaller.IdMecanicos = @IdMecanicos

GO

------SP's de la Tabla MecanicosTaller

CREATE OR ALTER PROCEDURE SP_MecanicosTaller_Insertar
	@IdMecanicos VARCHAR(20),
	@IdTalleres INT,
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO MecanicosTaller(IdMecanicos, IdTalleres, CreadoPor)
			VALUES(@IdMecanicos, @IdTalleres, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un Vehiculo'+	@IdMecanicos+ '. Número de Error: ' + @NumeroDeError		
	END CATCH

GO

CREATE OR ALTER PROCEDURE SP_MecanicosTaller_Desactivar
	@IdMecanicos VARCHAR(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteMecanicosTaller BIT

			SET @ExisteMecanicosTaller = dbo.FN_MecanicosTaller_VerificaExistenciaPorIdMecanicos(@IdMecanicos)

			IF(@ExisteMecanicosTaller = 1)
				BEGIN
					UPDATE MecanicosTaller 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						IdMecanicos = @IdMecanicos

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Aula: '+	@IdMecanicos	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el MecanicoTaller: '+	@IdMecanicos	+ '. Número de Error: ' + @NumeroDeError

	END CATCH

GO

CREATE OR ALTER PROCEDURE SP_MecanicosTaller_Actualizar
	@IdMecanicos VARCHAR(20),
	@IdTalleres INT,
	@Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteMecanicosTaller BIT
		
		SET @ExisteMecanicosTaller = dbo.FN_MecanicosTaller_VerificaExistenciaPorIdMecanicos(@IdMecanicos)
		
		IF(@ExisteMecanicosTaller = 1)
			BEGIN
				UPDATE MecanicosTaller
				SET
					IdTalleres = @IdTalleres,
					Activo = @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					IdMecanicos = @IdMecanicos

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'MecanicosTaller: '+	@IdMecanicos	+' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizado el MecanicosTaller '+	@IdMecanicos+ '. Número de Error: ' + @NumeroDeError
	END CATCH

GO
---------FN's y vistas de la tabla EstadoReparaciones

CREATE VIEW VW_EstadoReparaciones_SeleccionarTodos
AS 
	SELECT Id FROM EstadoReparaciones WHERE Activo = 1

GO
CREATE  FUNCTION FN_EstadoReparaciones_VerificaExistenciaPorId ( 
	@Id INT)
RETURNS BIT AS
BEGIN
	DECLARE @ExisteEstadoReparaciones BIT;
	
	SET @ExisteEstadoReparaciones = (SELECT count(Id) FROM EstadoReparaciones WHERE Id = @Id)
	 
    RETURN @ExisteEstadoReparaciones
END;

GO
CREATE FUNCTION FN_EstadoReparaciones_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_EstadoReparaciones_SeleccionarTodos

GO
CREATE FUNCTION FN_EstadoReparaciones_SeleccionarPorId(
	@Id INT
) 
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_EstadoReparaciones_SeleccionarTodos AS EstadoReparaciones
		WHERE 
			EstadoReparaciones.Id = @Id
GO
-----SP's de la tabla EstadoReparaciones

CREATE OR ALTER PROCEDURE SP_EstadosReparaciones_Insertar
	@Id INT,
    @Estados VARCHAR (20),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO EstadoReparaciones(Id, Estados, CreadoPor)
			VALUES(@Id, @Estados, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

	DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un EstadoReparación: ' + @NumeroDeError
	END CATCH
GO
CREATE OR ALTER PROCEDURE SP_EstadosReparaciones_Desactivar
	@Id INT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteEstadoReparaciones BIT

			SET @ExisteEstadoReparaciones = dbo.FN_EstadoReparaciones_VerificaExistenciaPorId(@Id)

			IF(@ExisteEstadoReparaciones = 1)
				BEGIN
					UPDATE EstadoReparaciones 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Id = @Id

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'EstadoReparación: '+	@Id	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el EstadoReparación: '+	@Id	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
GO
CREATE OR ALTER PROCEDURE SP_EstadosReparaciones_Actualizar
    @Id INT,
	@Estados VARCHAR(15),
	@Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteEstadoReparaciones BIT
		
		SET @ExisteEstadoReparaciones = dbo.FN_EstadoReparaciones_VerificaExistenciaPorId(@Id)
		
		IF(@ExisteEstadoReparaciones = 1)
			BEGIN
				UPDATE EstadoReparaciones
				SET
					
					Activo= @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					Id = @Id

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'EstadoReparación: '+ @Id +' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION

			DECLARE @NumeroDeError INT 
			EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando el Cliente '+	@Id
		
	END CATCH
GO
----- FN's y vistas de la tabla Reparaciones


CREATE VIEW VW_Reparaciones_SeleccionarTodos
AS 
	SELECT IdReparaciones FROM Reparaciones WHERE Activo = 1
GO
CREATE FUNCTION FN_Reparaciones_VerificaExistenciaPorIdReparaciones ( 
	@IdReparaciones INT)
RETURNS BIT AS
BEGIN
	DECLARE @ExisteReparaciones BIT;
	
	SET @ExisteReparaciones = (SELECT count(IdReparaciones) FROM Reparaciones WHERE IdReparaciones = @IdReparaciones)
	 
    RETURN @ExisteReparaciones
END;
GO
CREATE FUNCTION FN_Reparaciones_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Reparaciones_SeleccionarTodos
GO
CREATE FUNCTION FN_Reparaciones_SeleccionarPorIdReparaciones(
	@IdReparaciones INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Reparaciones_SeleccionarTodos AS Reparaciones
		WHERE 
			Reparaciones.IdReparaciones = @IdReparaciones

GO
-----SP's de la tabla Reparaciones

CREATE OR ALTER PROCEDURE SP_EstadosReparaciones_Insertar
@IdReparaciones INT,
	@FechasIngreso DATE,
	@FechasSalida DATE,
	@PlacasVehiculos VARCHAR(10),
	@IdMecanicos VARCHAR(20),
	@DiagnosticosReparaciones VARCHAR(100),
	@IdEstadosReparacion INT,
	@MontosDeObra DECIMAL(18,3), 
	@MontosRepuestos DECIMAL(18,3),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Reparaciones(IdReparaciones, FechasIngreso, FechasSalida, PlacasVehiculos,
			IdMecanicos, DiagnosticosReparaciones, IdEstadosReparacion, MontosDeObra, MontosRepuestos, CreadoPor)
			VALUES(@IdReparaciones, @FechasIngreso, @FechasSalida, @PlacasVehiculos, @IdMecanicos,
		@DiagnosticosReparaciones, @IdEstadosReparacion, @MontosDeObra, @MontosRepuestos, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

	DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando una Reparación: ' + @NumeroDeError
	END CATCH

GO
CREATE OR ALTER PROCEDURE SP_Reparaciones_Desactivar
@IdReparaciones INT,
	@FechasIngreso DATE,
	@FechasSalida DATE,
	@PlacasVehiculos VARCHAR(10),
	@IdMecanicos VARCHAR(20),
	@DiagnosticosReparaciones VARCHAR(100),
	@IdEstadosReparacion INT,
	@MontosDeObra DECIMAL(18,3), 
	@MontosRepuestos DECIMAL(18,3),
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteReparaciones BIT

			SET @ExisteReparaciones = dbo.FN_Reparaciones_VerificaExistenciaPorIdReparaciones(@IdReparaciones)

			IF(@ExisteReparaciones = 1)
				BEGIN
					UPDATE Reparaciones 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						@IdReparaciones = @IdReparaciones

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Reparación: '+	@IdReparaciones	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar la Reparación: '+	@IdReparaciones	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
GO
CREATE OR ALTER PROCEDURE SP_Reparaciones_Actualizar
@IdReparaciones INT,
	@FechasIngreso DATE,
	@FechasSalida DATE,
	@PlacasVehiculos VARCHAR(10),
	@IdMecanicos VARCHAR(20),
	@DiagnosticosReparaciones VARCHAR(100),
	@IdEstadosReparacion INT,
	@MontosDeObra DECIMAL(18,3), 
	@MontosRepuestos DECIMAL(18,3),
	@Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteReparaciones BIT
		
		SET @ExisteReparaciones = dbo.FN_Reparaciones_VerificaExistenciaPorIdReparaciones(@IdReparaciones)
		
		IF(@ExisteReparaciones = 1)
			BEGIN
				UPDATE Reparaciones
				SET
					
					Activo= @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					IdReparaciones = @IdReparaciones

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'Reparación: '+ @IdReparaciones +' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION

			DECLARE @NumeroDeError INT 
			EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando la Reparación '+	@IdReparaciones
		
		END CATCH

GO
--------FN's y vista de la tabla RepuestoReparaciones

CREATE VIEW VW_RepuestoReparaciones_SeleccionarTodos
AS 
	SELECT IdReparaciones FROM RepuestoReparaciones WHERE Activo = 1

GO
CREATE FUNCTION FN_RepuestoReparaciones_VerificaExistenciaPorIdReparaciones ( 
	@IdReparaciones INT)
RETURNS BIT AS
BEGIN
	DECLARE @ExisteRepuestoReparaciones BIT;
	
	SET @ExisteRepuestoReparaciones = (SELECT count(IdReparaciones) FROM RepuestoReparaciones WHERE IdReparaciones = @IdReparaciones)
	 
    RETURN @ExisteRepuestoReparaciones
END;

GO
CREATE FUNCTION FN_RepuestoReparaciones_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_RepuestoReparaciones_SeleccionarTodos

GO

CREATE FUNCTION FN_RepuestoReparaciones_SeleccionarPorIdReparaciones(
	@IdReparaciones INT
) 
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_RepuestoReparaciones_SeleccionarTodos AS RepuestoReparaciones
		WHERE 
			RepuestoReparaciones.IdReparaciones = @IdReparaciones

GO
------------SP's de la tabla RepuestoReparaciones


CREATE OR ALTER PROCEDURE SP_RepuestoReparaciones_Insertar
@IdReparaciones INT,
	@CodigoRepuestos VARCHAR(25),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO RepuestoReparaciones(IdReparaciones, CodigoRepuestos, CreadoPor)
			VALUES(@IdReparaciones, @CodigoRepuestos, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

	DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un RepuestoReparación: ' + @NumeroDeError
	END CATCH
GO
CREATE OR ALTER PROCEDURE SP_RepuestoReparaciones_Desactivar
	@IdReparaciones INT,
	@CodigoRepuestos VARCHAR(25),
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteRepuestoReparaciones BIT

			SET @ExisteRepuestoReparaciones = dbo.FN_RepuestoReparaciones_VerificaExistenciaPorIdReparaciones(@IdReparaciones)

			IF(@ExisteRepuestoReparaciones = 1)
				BEGIN
					UPDATE RepuestoReparaciones 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						IdReparaciones = @IdReparaciones

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'RepuestoReparación: '+	@IdReparaciones	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el RepuestoReparación: '+	@IdReparaciones	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
GO
CREATE OR ALTER PROCEDURE SP_RepuestoReparaciones_Actualizar
    @IdReparaciones INT,
	@CodigoRepuestos VARCHAR(25),
	@Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteRepuestoReparaciones BIT
		
		SET @ExisteRepuestoReparaciones = dbo.FN_RepuestoReparaciones_VerificaExistenciaPorIdReparaciones(@IdReparaciones)
		
		IF(@ExisteRepuestoReparaciones = 1)
			BEGIN
				UPDATE RepuestoReparaciones
				SET					
					Activo= @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					IdReparaciones = @IdReparaciones
				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'RepuestoReparación: '+ @IdReparaciones +' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION

			DECLARE @NumeroDeError INT 
			EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando el Repuesto '+	@IdReparaciones
		
	END CATCH
	GO
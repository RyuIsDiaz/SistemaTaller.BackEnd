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
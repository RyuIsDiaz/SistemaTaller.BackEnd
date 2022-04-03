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
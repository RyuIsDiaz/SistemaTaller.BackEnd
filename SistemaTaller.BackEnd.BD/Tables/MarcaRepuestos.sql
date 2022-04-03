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
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
EXEC sp_addextendedproperty 
    @name = N'MS_Description',	@value = 'Datos del mecanico',
    @level0type = N'Schema',	@level0name = 'dbo',
    @level1type = N'Table',		@level1name = 'Mecanicos'
GO
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
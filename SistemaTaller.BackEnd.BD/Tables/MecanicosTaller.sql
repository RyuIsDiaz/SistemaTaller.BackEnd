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
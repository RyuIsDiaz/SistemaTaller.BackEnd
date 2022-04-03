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
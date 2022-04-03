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
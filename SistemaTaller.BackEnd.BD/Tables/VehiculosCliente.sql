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
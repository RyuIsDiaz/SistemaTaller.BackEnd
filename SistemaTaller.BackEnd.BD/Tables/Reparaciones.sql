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
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
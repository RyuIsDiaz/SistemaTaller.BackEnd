------FN's y vistas Tabla Repuestos

CREATE VIEW VW_Repuestos_SeleccionarTodos
AS 
	SELECT CodigoRepuesto, Nombre, IdMarca, Precio FROM Repuestos WHERE Activo = 1
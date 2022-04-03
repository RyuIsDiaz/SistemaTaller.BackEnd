-----FN's y vistas Tabla MarcaVehiculos

CREATE VIEW VW_MarcaVehiculos_SeleccionarTodos
AS 
	SELECT Id, Nombre FROM MarcaVehiculos WHERE Activo = 1
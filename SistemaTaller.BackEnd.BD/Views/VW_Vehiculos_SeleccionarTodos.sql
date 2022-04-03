-----FN's y vista de la Tabla Vehiculos

CREATE VIEW VW_Vehiculos_SeleccionarTodos
AS 
	SELECT Placa, IdMarca FROM Vehiculos WHERE Activo = 1
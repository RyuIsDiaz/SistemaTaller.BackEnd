----- Fn's y vistas Tabla Talleres

CREATE VIEW VW_Talleres_SeleccionarTodos
AS 
	SELECT Id, Nombre FROM Talleres WHERE Activo = 1
-----FN's y vistas de la tabla 

CREATE VIEW VW_VehiculosCliente_SeleccionarTodos
AS 
	SELECT IdentificacionCliente, Placa  FROM VehiculosCliente WHERE Activo = 1
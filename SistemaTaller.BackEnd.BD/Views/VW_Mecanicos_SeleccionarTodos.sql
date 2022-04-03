---------------------------------------------------------------------------------------------------------------

----FN's y vistas Mecanicos

CREATE VIEW VW_Mecanicos_SeleccionarTodos
AS 
	SELECT Identificaciones, Nombre, Apellidos FROM Mecanicos WHERE Activo = 1
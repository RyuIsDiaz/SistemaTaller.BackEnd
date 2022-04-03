-------FN's y vistas de la Tabla MecanicosTaller

CREATE VIEW VW_MecanicosTaller_SeleccionarTodos
AS 
	SELECT IdMecanicos, IdTalleres FROM MecanicosTaller WHERE Activo = 1
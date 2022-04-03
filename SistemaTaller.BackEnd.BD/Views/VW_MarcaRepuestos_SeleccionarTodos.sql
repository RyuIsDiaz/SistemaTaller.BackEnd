------ FN's y vistas Tabla MarcaRepuestos

CREATE VIEW VW_MarcaRepuestos_SeleccionarTodos
AS 
	SELECT Id, Nombre FROM MarcaRepuestos WHERE Activo = 1
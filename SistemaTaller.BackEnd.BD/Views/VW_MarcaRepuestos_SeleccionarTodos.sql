------ FN's y vistas Tabla MarcaRepuestos

CREATE VIEW VW_MarcaRepuestos_SeleccionarTodos
AS 
	SELECT * FROM MarcaRepuestos WHERE Activo = 1
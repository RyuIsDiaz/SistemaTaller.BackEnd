-----FN's y vistas tabla Clientes

 CREATE VIEW VW_Clientes_SeleccionarTodos
   AS 
	SELECT Identificacion, Nombre, Apellidos FROM Clientes WHERE Activo = 1
CREATE VIEW vista_productos_categoria_proveedor AS
SELECT p.ProductoID, p.Nombre AS ProductoNombre, c.Nombre AS CategoriaNombre, pr.Nombre AS ProveedorNombre, p.Precio, p.Slock
FROM Productos p
JOIN Categorias c ON p.CategoriaID = c.CategoriaID
JOIN Proveedores pr ON p.ProveedorID = pr.ProveedorID;

CREATE VIEW vista_inventario_detalles AS
SELECT i.InventarioID, e.Nombre AS EmpleadoNombre, p.Nombre AS ProductoNombre, i.Cantidad, i.FechaActualizada
FROM Inventario i
JOIN Empleados e ON i.EmpleadoID = e.EmpleadoID
JOIN Productos p ON i.ProductoID = p.ProductoID;

CREATE VIEW vista_ventas_cliente AS
SELECT v.VentaID, v.Fecha AS VentaFecha, c.Nombre AS ClienteNombre, v.Total AS VentaTotal
FROM Ventas v
JOIN Clientes c ON v.CedulaID = c.CedulaID;

CREATE VIEW vista_proveedores_productos AS
SELECT pr.ProveedorID, pr.Nombre AS ProveedorNombre, p.Nombre AS ProductoNombre
FROM Proveedores pr
JOIN Productos p ON pr.ProveedorID = p.ProveedorID;

CREATE VIEW vista_compras_proveedor AS
SELECT o.OrdenCompraID, o.Fecha AS CompraFecha, pr.Nombre AS ProveedorNombre, o.Total, o.Estado
FROM OrdenesCompra o
JOIN Proveedores pr ON o.ProveedorID = pr.ProveedorID;

CREATE VIEW vista_categorias_conteo_productos AS
SELECT c.CategoriaID, c.Nombre AS CategoriaNombre, COUNT(p.ProductoID) AS NumeroProductos
FROM Categorias c
LEFT JOIN Productos p ON c.CategoriaID = p.CategoriaID
GROUP BY c.CategoriaID, c.Nombre;

CREATE VIEW vista_historico_ordenes_compra AS
SELECT h.HistoricoID, o.Fecha AS OrdenFecha, p.Nombre AS ProductoNombre, h.Cantidad, h.Estado
FROM HistoricoOrdenesCompra h
JOIN OrdenesCompra o ON h.OrdenCompraID = o.OrdenCompraID
JOIN Productos p ON h.ProductoID = p.ProductoID;

CREATE VIEW vista_empleados_detalles AS
SELECT EmpleadoID, Nombre AS EmpleadoNombre, Telefono AS EmpleadoTelefono, Email AS EmpleadoEmail, Posicion AS EmpleadoPosicion, Salario AS EmpleadoSalario, FechaContratacion AS EmpleadoFechaContratacion
FROM Empleados;

CREATE VIEW vista_clientes_detalles AS
SELECT CedulaID, Nombre AS ClienteNombre, Telefono AS ClienteTelefono, Direccion AS ClienteDireccion, Email AS ClienteEmail
FROM Clientes;

CREATE VIEW vista_factura_detalles AS
SELECT f.FacturaID, v.Fecha AS VentaFecha, c.Nombre AS ClienteNombre, p.Nombre AS ProductoNombre, f.Cantidad, f.PrecioUnitario, f.PrecioTotal
FROM Factura f
JOIN Ventas v ON f.VentaID = v.VentaID
JOIN Productos p ON f.ProductoID = p.ProductoID
JOIN Clientes c ON v.CedulaID = c.CedulaID;


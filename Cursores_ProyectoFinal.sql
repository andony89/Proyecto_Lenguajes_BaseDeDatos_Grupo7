--Cursor Empleados
CREATE OR REPLACE PROCEDURE ObtenerEmpleados(empleados OUT SYS_REFCURSOR) IS
BEGIN
    OPEN empleados FOR
        SELECT EmpleadoID, Nombre, Telefono, Email, Posicion, FechaContratacion, Salario
        FROM Empleados;
END ObtenerEmpleados;
/

--Cursor Categorias
CREATE OR REPLACE PROCEDURE ObtenerCategorias(p_cursor OUT SYS_REFCURSOR) IS
BEGIN
    OPEN p_cursor FOR
        SELECT CategoriaID, Nombre, Descripcion
        FROM Categorias;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al obtener las categorías: ' || SQLERRM);
        IF p_cursor%ISOPEN THEN
            CLOSE p_cursor;
        END IF;
END ObtenerCategorias;
/


--Cursor Provedores
CREATE OR REPLACE PROCEDURE ObtenerProveedores (
    p_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_cursor FOR
        SELECT ProveedorID, Nombre, Telefono, Direccion, Email
        FROM Proveedores;
END ObtenerProveedores;
/


--Cursor Clientes
CREATE OR REPLACE PROCEDURE ObtenerClientes (
    p_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_cursor FOR
        SELECT CedulaID, Nombre, Telefono, Direccion, Email
        FROM Clientes;
END ObtenerClientes;
/



--Cursor Productos
CREATE OR REPLACE PROCEDURE ObtenerProductos (
    p_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_cursor FOR
        SELECT ProductoID, Nombre, CategoriaID, Precio, Slock, ProveedorID
        FROM Productos;
END ObtenerProductos;
/

--Cursor Inventario
CREATE OR REPLACE PROCEDURE ObtenerInventario (
    p_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_cursor FOR
        SELECT InventarioID, EmpleadoID, ProductoID, Cantidad, FechaActualizada
        FROM Inventario;
END ObtenerInventario;
/


--Cursor OrdenesCompra
CREATE OR REPLACE PROCEDURE ObtenerOrdenesCompra (
    p_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_cursor FOR
        SELECT OrdenCompraID, Fecha, ProveedorID, Total, Estado
        FROM OrdenesCompra;
END ObtenerOrdenesCompra;
/

--Cursor Ventas
CREATE OR REPLACE PROCEDURE ObtenerVentas (
    p_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_cursor FOR
        SELECT VentaID, Fecha, CedulaID, Total
        FROM Ventas;
END ObtenerVentas;
/


--Cursor Factura
CREATE OR REPLACE PROCEDURE ObtenerFactura (
    p_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_cursor FOR
        SELECT FacturaID, VentaID, ProductoID, Cantidad, PrecioUnitario, PrecioTotal
        FROM Factura;
END ObtenerFactura;
/



--Cursor HistoricoOrdenesCompra
CREATE OR REPLACE PROCEDURE ObtenerHistoricoOrdenesCompra (
    p_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_cursor FOR
        SELECT HistoricoID, OrdenCompraID, ProductoID, Cantidad, Estado
        FROM HistoricoOrdenesCompra;
END ObtenerHistoricoOrdenesCompra;
/

--Curso Empleados (Posicion)
CREATE OR REPLACE PROCEDURE ObtenerEmpleadosPorPosicion (
    p_Posicion VARCHAR2,
    p_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_cursor FOR
        SELECT EmpleadoID, Nombre, Telefono, Email, Posicion, FechaContratacion, Salario
        FROM Empleados
        WHERE Posicion = p_Posicion;
END ObtenerEmpleadosPorPosicion;
/


--Cursor Empleados con mayor salario
CREATE OR REPLACE PROCEDURE ObtenerEmpleadosPorSalario (
    p_SalarioMinimo NUMBER,
    p_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_cursor FOR
        SELECT EmpleadoID, Nombre, Telefono, Email, Posicion, FechaContratacion, Salario
        FROM Empleados
        WHERE Salario > p_SalarioMinimo;
END ObtenerEmpleadosPorSalario;
/


--Cursor Producto (Categoria)
CREATE OR REPLACE PROCEDURE ObtenerProductosPorCategoria (
    p_CategoriaNombre VARCHAR2,
    p_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_cursor FOR
        SELECT p.ProductoID, p.Nombre, p.Precio, p.Slock, p.ProveedorID
        FROM Productos p
        JOIN Categorias c ON p.CategoriaID = c.CategoriaID
        WHERE c.Nombre = p_CategoriaNombre;
END ObtenerProductosPorCategoria;
/



--Curso OrdenesCompra (Estado)
CREATE OR REPLACE PROCEDURE ObtenerOrdenesCompraPorEstado (
    p_Estado VARCHAR2,
    p_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_cursor FOR
        SELECT OrdenCompraID, Fecha, ProveedorID, Total
        FROM OrdenesCompra
        WHERE Estado = p_Estado;
END ObtenerOrdenesCompraPorEstado;
/



--Curso Ventas (Fecha)
CREATE OR REPLACE PROCEDURE ObtenerVentasPorFecha (
    p_FechaInicio DATE,
    p_FechaFin DATE,
    p_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_cursor FOR
        SELECT VentaID, Fecha, CedulaID, Total
        FROM Ventas
        WHERE Fecha BETWEEN p_FechaInicio AND p_FechaFin;
END ObtenerVentasPorFecha;
/



------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION ObtenerEmpleados
RETURN SYS_REFCURSOR IS
    empleados SYS_REFCURSOR;
BEGIN
    OPEN empleados FOR
        SELECT EmpleadoID, Nombre, Telefono, Email, Posicion, FechaContratacion, Salario
        FROM Empleados;
    RETURN empleados;
END ObtenerEmpleados;
/
    
----------------------------------------------------------
    
CREATE OR REPLACE FUNCTION ObtenerCategorias
RETURN SYS_REFCURSOR IS
    p_cursor SYS_REFCURSOR;
BEGIN
    OPEN p_cursor FOR
        SELECT CategoriaID, Nombre, Descripcion
        FROM Categorias;
    RETURN p_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al obtener las categorías: ' || SQLERRM);
        IF p_cursor%ISOPEN THEN
            CLOSE p_cursor;
        END IF;
        RETURN NULL;
END ObtenerCategorias;
/
    
----------------------------------------------------------------------
    
CREATE OR REPLACE FUNCTION ObtenerProveedores
RETURN SYS_REFCURSOR IS
    p_cursor SYS_REFCURSOR;
BEGIN
    OPEN p_cursor FOR
        SELECT ProveedorID, Nombre, Telefono, Direccion, Email
        FROM Proveedores;
    RETURN p_cursor;
END ObtenerProveedores;
/
    
------------------------------------------------------------------
    
CREATE OR REPLACE FUNCTION ObtenerClientes
RETURN SYS_REFCURSOR IS
    p_cursor SYS_REFCURSOR;
BEGIN
    OPEN p_cursor FOR
        SELECT CedulaID, Nombre, Telefono, Direccion, Email
        FROM Clientes;
    RETURN p_cursor;
END ObtenerClientes;
/
    
------------------------------------------------------------------------
    
CREATE OR REPLACE FUNCTION ObtenerProductos
RETURN SYS_REFCURSOR IS
    p_cursor SYS_REFCURSOR;
BEGIN
    OPEN p_cursor FOR
        SELECT ProductoID, Nombre, CategoriaID, Precio, Slock, ProveedorID
        FROM Productos;
    RETURN p_cursor;
END ObtenerProductos;
/
    
--------------------------------------------------------------------
    
CREATE OR REPLACE FUNCTION ObtenerInventario
RETURN SYS_REFCURSOR IS
    p_cursor SYS_REFCURSOR;
BEGIN
    OPEN p_cursor FOR
        SELECT InventarioID, EmpleadoID, ProductoID, Cantidad, FechaActualizada
        FROM Inventario;
    RETURN p_cursor;
END ObtenerInventario;
/
    
---------------------------------------------------------------
    
CREATE OR REPLACE FUNCTION ObtenerOrdenesCompra
RETURN SYS_REFCURSOR IS
    p_cursor SYS_REFCURSOR;
BEGIN
    OPEN p_cursor FOR
        SELECT OrdenCompraID, Fecha, ProveedorID, Total, Estado
        FROM OrdenesCompra;
    RETURN p_cursor;
END ObtenerOrdenesCompra;
/
    
--------------------------------------------------------------
    
CREATE OR REPLACE FUNCTION ObtenerVentas
RETURN SYS_REFCURSOR IS
    p_cursor SYS_REFCURSOR;
BEGIN
    OPEN p_cursor FOR
        SELECT VentaID, Fecha, CedulaID, Total
        FROM Ventas;
    RETURN p_cursor;
END ObtenerVentas;
/
    
--------------------------------------------------------
    
CREATE OR REPLACE FUNCTION ObtenerFactura
RETURN SYS_REFCURSOR IS
    p_cursor SYS_REFCURSOR;
BEGIN
    OPEN p_cursor FOR
        SELECT FacturaID, VentaID, ProductoID, Cantidad, PrecioUnitario, PrecioTotal
        FROM Factura;
    RETURN p_cursor;
END ObtenerFactura;
/
    
-----------------------------------------------------------------
    
CREATE OR REPLACE FUNCTION ObtenerHistoricoOrdenesCompra
RETURN SYS_REFCURSOR IS
    p_cursor SYS_REFCURSOR;
BEGIN
    OPEN p_cursor FOR
        SELECT HistoricoID, OrdenCompraID, ProductoID, Cantidad, Estado
        FROM HistoricoOrdenesCompra;
    RETURN p_cursor;
END ObtenerHistoricoOrdenesCompra;
/
    
----------------------------------------------------------
    
CREATE OR REPLACE FUNCTION ObtenerEmpleadosPorPosicion(p_Posicion VARCHAR2)
RETURN SYS_REFCURSOR IS
    p_cursor SYS_REFCURSOR;
BEGIN
    OPEN p_cursor FOR
        SELECT EmpleadoID, Nombre, Telefono, Email, Posicion, FechaContratacion, Salario
        FROM Empleados
        WHERE Posicion = p_Posicion;
    RETURN p_cursor;
END ObtenerEmpleadosPorPosicion;
/
    
--------------------------------------------------------
    
CREATE OR REPLACE FUNCTION ObtenerEmpleadosPorSalario(p_SalarioMinimo NUMBER)
RETURN SYS_REFCURSOR IS
    p_cursor SYS_REFCURSOR;
BEGIN
    OPEN p_cursor FOR
        SELECT EmpleadoID, Nombre, Telefono, Email, Posicion, FechaContratacion, Salario
        FROM Empleados
        WHERE Salario > p_SalarioMinimo;
    RETURN p_cursor;
END ObtenerEmpleadosPorSalario;
/
    
------------------------------------------------------------------
    
Copiar código
CREATE OR REPLACE FUNCTION ObtenerProductosPorCategoria(p_CategoriaNombre VARCHAR2)
RETURN SYS_REFCURSOR IS
    p_cursor SYS_REFCURSOR;
BEGIN
    OPEN p_cursor FOR
        SELECT p.ProductoID, p.Nombre, p.Precio, p.Slock, p.ProveedorID
        FROM Productos p
        JOIN Categorias c ON p.CategoriaID = c.CategoriaID
        WHERE c.Nombre = p_CategoriaNombre;
    RETURN p_cursor;
END ObtenerProductosPorCategoria;
/
    
---------------------------------------------------------
    
CREATE OR REPLACE FUNCTION ObtenerOrdenesCompraPorEstado(p_Estado VARCHAR2)
RETURN SYS_REFCURSOR IS
    p_cursor SYS_REFCURSOR;
BEGIN
    OPEN p_cursor FOR
        SELECT OrdenCompraID, Fecha, ProveedorID, Total
        FROM OrdenesCompra
        WHERE Estado = p_Estado;
    RETURN p_cursor;
END ObtenerOrdenesCompraPorEstado;
/

---------------------------------------------
    
CREATE OR REPLACE FUNCTION ObtenerVentasPorFecha(p_FechaInicio DATE, p_FechaFin DATE)
RETURN SYS_REFCURSOR IS
    p_cursor SYS_REFCURSOR;
BEGIN
    OPEN p_cursor FOR
        SELECT VentaID, Fecha, CedulaID, Total
        FROM Ventas
        WHERE Fecha BETWEEN p_FechaInicio AND p_FechaFin;
    RETURN p_cursor;
END ObtenerVentasPorFecha;
/




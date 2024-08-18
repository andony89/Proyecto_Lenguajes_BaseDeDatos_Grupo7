-- Crear Empleado
CREATE OR REPLACE PROCEDURE crear_empleado (
    p_nombre IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2,
    p_posicion IN VARCHAR2,
    p_fechaContratacion IN DATE,
    p_salario IN NUMBER
)
IS
BEGIN
    INSERT INTO Empleados (Nombre, Telefono, Email, Posicion, FechaContratacion, Salario)
    VALUES (p_nombre, p_telefono, p_email, p_posicion, p_fechaContratacion, p_salario);
END crear_empleado;
/

-- Leer Empleado
CREATE OR REPLACE PROCEDURE leer_empleado (
    p_empleadoID IN NUMBER,
    cur OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN cur FOR SELECT * FROM Empleados WHERE EmpleadoID = p_empleadoID;
END leer_empleado;
/

-- Actualizar Empleado
CREATE OR REPLACE PROCEDURE actualizar_empleado (
    p_empleadoID IN NUMBER,
    p_nombre IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_email IN VARCHAR2,
    p_posicion IN VARCHAR2,
    p_fechaContratacion IN DATE,
    p_salario IN NUMBER
)
IS
BEGIN
    UPDATE Empleados
    SET Nombre = p_nombre,
        Telefono = p_telefono,
        Email = p_email,
        Posicion = p_posicion,
        FechaContratacion = p_fechaContratacion,
        Salario = p_salario
    WHERE EmpleadoID = p_empleadoID;
END actualizar_empleado;
/

-- Eliminar Empleado
CREATE OR REPLACE PROCEDURE eliminar_empleado (
    p_empleadoID IN NUMBER
)
IS
BEGIN
    DELETE FROM Empleados WHERE EmpleadoID = p_empleadoID;
END eliminar_empleado;
/
-- Crear Categoria
CREATE OR REPLACE PROCEDURE crear_categoria (
    p_nombre IN VARCHAR2,
    p_descripcion IN VARCHAR2
)
IS
BEGIN
    INSERT INTO Categorias (Nombre, Descripcion)
    VALUES (p_nombre, p_descripcion);
END crear_categoria;
/

-- Leer Categoria
CREATE OR REPLACE PROCEDURE leer_categoria (
    p_categoriaID IN NUMBER,
    cur OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN cur FOR SELECT * FROM Categorias WHERE CategoriaID = p_categoriaID;
END leer_categoria;
/

-- Actualizar Categoria
CREATE OR REPLACE PROCEDURE actualizar_categoria (
    p_categoriaID IN NUMBER,
    p_nombre IN VARCHAR2,
    p_descripcion IN VARCHAR2
)
IS
BEGIN
    UPDATE Categorias
    SET Nombre = p_nombre,
        Descripcion = p_descripcion
    WHERE CategoriaID = p_categoriaID;
END actualizar_categoria;
/

-- Eliminar Categoria
CREATE OR REPLACE PROCEDURE eliminar_categoria (
    p_categoriaID IN NUMBER
)
IS
BEGIN
    DELETE FROM Categorias WHERE CategoriaID = p_categoriaID;
END eliminar_categoria;
/
-- Crear Proveedor
CREATE OR REPLACE PROCEDURE crear_proveedor (
    p_nombre IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_direccion IN VARCHAR2,
    p_email IN VARCHAR2
)
IS
BEGIN
    INSERT INTO Proveedores (Nombre, Telefono, Direccion, Email)
    VALUES (p_nombre, p_telefono, p_direccion, p_email);
END crear_proveedor;
/

-- Leer Proveedor
CREATE OR REPLACE PROCEDURE leer_proveedor (
    p_proveedorID IN NUMBER,
    cur OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN cur FOR SELECT * FROM Proveedores WHERE ProveedorID = p_proveedorID;
END leer_proveedor;
/

-- Actualizar Proveedor
CREATE OR REPLACE PROCEDURE actualizar_proveedor (
    p_proveedorID IN NUMBER,
    p_nombre IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_direccion IN VARCHAR2,
    p_email IN VARCHAR2
)
IS
BEGIN
    UPDATE Proveedores
    SET Nombre = p_nombre,
        Telefono = p_telefono,
        Direccion = p_direccion,
        Email = p_email
    WHERE ProveedorID = p_proveedorID;
END actualizar_proveedor;
/

-- Eliminar Proveedor
CREATE OR REPLACE PROCEDURE eliminar_proveedor (
    p_proveedorID IN NUMBER
)
IS
BEGIN
    DELETE FROM Proveedores WHERE ProveedorID = p_proveedorID;
END eliminar_proveedor;
/
-- CRUD Clientes
CREATE OR REPLACE PROCEDURE CrearCliente(
    p_Nombre VARCHAR2,
    p_Telefono NUMBER,
    p_Direccion VARCHAR2,
    p_Email VARCHAR2
) AS
BEGIN
    INSERT INTO Clientes (Nombre, Telefono, Direccion, Email)
    VALUES (p_Nombre, p_Telefono, p_Direccion, p_Email);
END CrearCliente;
/

CREATE OR REPLACE PROCEDURE LeerCliente(
    p_CedulaID NUMBER,
    p_Nombre OUT VARCHAR2,
    p_Telefono OUT NUMBER,
    p_Direccion OUT VARCHAR2,
    p_Email OUT VARCHAR2
) AS
BEGIN
    SELECT Nombre, Telefono, Direccion, Email
    INTO p_Nombre, p_Telefono, p_Direccion, p_Email
    FROM Clientes
    WHERE CedulaID = p_CedulaID;
END LeerCliente;
/

CREATE OR REPLACE PROCEDURE ActualizarCliente(
    p_CedulaID NUMBER,
    p_Nombre VARCHAR2,
    p_Telefono NUMBER,
    p_Direccion VARCHAR2,
    p_Email VARCHAR2
) AS
BEGIN
    UPDATE Clientes
    SET Nombre = p_Nombre, Telefono = p_Telefono, Direccion = p_Direccion, Email = p_Email
    WHERE CedulaID = p_CedulaID;
END ActualizarCliente;
/

CREATE OR REPLACE PROCEDURE EliminarCliente(
    p_CedulaID NUMBER
) AS
BEGIN
    DELETE FROM Clientes
    WHERE CedulaID = p_CedulaID;
END EliminarCliente;
/


-- Crear Producto
CREATE OR REPLACE PROCEDURE crear_producto (
    p_nombre IN VARCHAR2,
    p_categoriaID IN NUMBER,
    p_precio IN NUMBER,
    p_slock IN NUMBER,
    p_proveedorID IN NUMBER
)
IS
BEGIN
    INSERT INTO Productos (Nombre, CategoriaID, Precio, Slock, ProveedorID)
    VALUES (p_nombre, p_categoriaID, p_precio, p_slock, p_proveedorID);
END crear_producto;
/

-- Leer Producto
CREATE OR REPLACE PROCEDURE leer_producto (
    p_productoID IN NUMBER,
    cur OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN cur FOR SELECT * FROM Productos WHERE ProductoID = p_productoID;
END leer_producto;
/

-- Actualizar Producto
CREATE OR REPLACE PROCEDURE actualizar_producto (
    p_productoID IN NUMBER,
    p_nombre IN VARCHAR2,
    p_categoriaID IN NUMBER,
    p_precio IN NUMBER,
    p_slock IN NUMBER,
    p_proveedorID IN NUMBER
)
IS
BEGIN
    UPDATE Productos
    SET Nombre = p_nombre,
        CategoriaID = p_categoriaID,
        Precio = p_precio,
        Slock = p_slock,
        ProveedorID = p_proveedorID
    WHERE ProductoID = p_productoID;
END actualizar_producto;
/

-- Eliminar Producto
CREATE OR REPLACE PROCEDURE eliminar_producto (
    p_productoID IN NUMBER
)
IS
BEGIN
    DELETE FROM Productos WHERE ProductoID = p_productoID;
END eliminar_producto;
/
-- Crear Inventario
CREATE OR REPLACE PROCEDURE crear_inventario (
    p_empleadoID IN NUMBER,
    p_productoID IN NUMBER,
    p_cantidad IN NUMBER,
    p_fechaActualizada IN DATE
)
IS
BEGIN
    INSERT INTO Inventario (EmpleadoID, ProductoID, Cantidad, FechaActualizada)
    VALUES (p_empleadoID, p_productoID, p_cantidad, p_fechaActualizada);
END crear_inventario;
/

-- Leer Inventario
CREATE OR REPLACE PROCEDURE leer_inventario (
    p_inventarioID IN NUMBER,
    cur OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN cur FOR SELECT * FROM Inventario WHERE InventarioID = p_inventarioID;
END leer_inventario;
/

-- Actualizar Inventario
CREATE OR REPLACE PROCEDURE actualizar_inventario (
    p_inventarioID IN NUMBER,
    p_empleadoID IN NUMBER,
    p_productoID IN NUMBER,
    p_cantidad IN NUMBER,
    p_fechaActualizada IN DATE
)
IS
BEGIN
    UPDATE Inventario
    SET EmpleadoID = p_empleadoID,
        ProductoID = p_productoID,
        Cantidad = p_cantidad,
        FechaActualizada = p_fechaActualizada
    WHERE InventarioID = p_inventarioID;
END actualizar_inventario;
/

-- Eliminar Inventario
CREATE OR REPLACE PROCEDURE eliminar_inventario (
    p_inventarioID IN NUMBER
)
IS
BEGIN
    DELETE FROM Inventario WHERE InventarioID = p_inventarioID;
END eliminar_inventario;
/

-- CRUD Ordenes Compra
CREATE OR REPLACE PROCEDURE CrearOrdenCompra(
    p_Fecha DATE,
    p_ProveedorID NUMBER,
    p_Total NUMBER,  -- Cambiado de DOUBLE a NUMBER
    p_Estado VARCHAR2
) AS
BEGIN
    INSERT INTO OrdenesCompra (Fecha, ProveedorID, Total, Estado)
    VALUES (p_Fecha, p_ProveedorID, p_Total, p_Estado);
END CrearOrdenCompra;
/

CREATE OR REPLACE PROCEDURE LeerOrdenCompra(
    p_OrdenCompraID NUMBER,
    p_Fecha OUT DATE,
    p_ProveedorID OUT NUMBER,
    p_Total OUT NUMBER,  -- Cambiado de DOUBLE a NUMBER
    p_Estado OUT VARCHAR2
) AS
BEGIN
    SELECT Fecha, ProveedorID, Total, Estado
    INTO p_Fecha, p_ProveedorID, p_Total, p_Estado
    FROM OrdenesCompra
    WHERE OrdenCompraID = p_OrdenCompraID;
END LeerOrdenCompra;
/

CREATE OR REPLACE PROCEDURE ActualizarOrdenCompra(
    p_OrdenCompraID NUMBER,
    p_Fecha DATE,
    p_ProveedorID NUMBER,
    p_Total NUMBER,  -- Cambiado de DOUBLE a NUMBER
    p_Estado VARCHAR2
) AS
BEGIN
    UPDATE OrdenesCompra
    SET Fecha = p_Fecha, ProveedorID = p_ProveedorID, Total = p_Total, Estado = p_Estado
    WHERE OrdenCompraID = p_OrdenCompraID;
END ActualizarOrdenCompra;
/

CREATE OR REPLACE PROCEDURE EliminarOrdenCompra(
    p_OrdenCompraID NUMBER
) AS
BEGIN
    DELETE FROM OrdenesCompra
    WHERE OrdenCompraID = p_OrdenCompraID;
END EliminarOrdenCompra;
/

-- CRUD Ventas
CREATE OR REPLACE PROCEDURE CrearVenta(
    p_Fecha DATE,
    p_CedulaID NUMBER,
    p_Total DOUBLE
) AS
BEGIN
    INSERT INTO Ventas (Fecha, CedulaID, Total)
    VALUES (p_Fecha, p_CedulaID, p_Total);
END CrearVenta;


CREATE OR REPLACE PROCEDURE LeerVenta(
    p_VentaID NUMBER,
    p_Fecha OUT DATE,
    p_CedulaID OUT NUMBER,
    p_Total OUT DOUBLE
) AS
BEGIN
    SELECT Fecha, CedulaID, Total
    INTO p_Fecha, p_CedulaID, p_Total
    FROM Ventas
    WHERE VentaID = p_VentaID;
END LeerVenta;


CREATE OR REPLACE PROCEDURE ActualizarVenta(
    p_VentaID NUMBER,
    p_Fecha DATE,
    p_CedulaID NUMBER,
    p_Total DOUBLE
) AS
BEGIN
    UPDATE Ventas
    SET Fecha = p_Fecha, CedulaID = p_CedulaID, Total = p_Total
    WHERE VentaID = p_VentaID;
END ActualizarVenta;


CREATE OR REPLACE PROCEDURE EliminarVenta(
    p_VentaID NUMBER
) AS
BEGIN
    DELETE FROM Ventas
    WHERE VentaID = p_VentaID;
END EliminarVenta;

-- CRUD Facturas
CREATE OR REPLACE PROCEDURE CrearFactura(
    p_VentaID NUMBER,
    p_ProductoID NUMBER,
    p_Cantidad NUMBER,
    p_PrecioUnitario DOUBLE,
    p_PrecioTotal DOUBLE
) AS
BEGIN
    INSERT INTO Factura (VentaID, ProductoID, Cantidad, PrecioUnitario, PrecioTotal)
    VALUES (p_VentaID, p_ProductoID, p_Cantidad, p_PrecioUnitario, p_PrecioTotal);
END CrearFactura;


CREATE OR REPLACE PROCEDURE LeerFactura(
    p_FacturaID NUMBER,
    p_VentaID OUT NUMBER,
    p_ProductoID OUT NUMBER,
    p_Cantidad OUT NUMBER,
    p_PrecioUnitario OUT DOUBLE,
    p_PrecioTotal OUT DOUBLE
) AS
BEGIN
    SELECT VentaID, ProductoID, Cantidad, PrecioUnitario, PrecioTotal
    INTO p_VentaID, p_ProductoID, p_Cantidad, p_PrecioUnitario, p_PrecioTotal
    FROM Factura
    WHERE FacturaID = p_FacturaID;
END LeerFactura;


CREATE OR REPLACE PROCEDURE ActualizarFactura(
    p_FacturaID NUMBER,
    p_VentaID NUMBER,
    p_ProductoID NUMBER,
    p_Cantidad NUMBER,
    p_PrecioUnitario DOUBLE,
    p_PrecioTotal DOUBLE
) AS
BEGIN
    UPDATE Factura
    SET VentaID = p_VentaID, ProductoID = p_ProductoID, Cantidad = p_Cantidad, PrecioUnitario = p_PrecioUnitario, PrecioTotal = p_PrecioTotal
    WHERE FacturaID = p_FacturaID;
END ActualizarFactura;


CREATE OR REPLACE PROCEDURE EliminarFactura(
    p_FacturaID NUMBER
) AS
BEGIN
    DELETE FROM Factura
    WHERE FacturaID = p_FacturaID;
END EliminarFactura;

-- CRUD Historico
CREATE OR REPLACE PROCEDURE CrearHistoricoOrdenCompra(
    p_OrdenCompraID NUMBER,
    p_ProductoID NUMBER,
    p_Cantidad NUMBER,
    p_Estado VARCHAR2
) AS
BEGIN
    INSERT INTO HistoricoOrdenesCompra (OrdenCompraID, ProductoID, Cantidad, Estado)
    VALUES (p_OrdenCompraID, p_ProductoID, p_Cantidad, p_Estado);
END CrearHistoricoOrdenCompra;


CREATE OR REPLACE PROCEDURE LeerHistoricoOrdenCompra(
    p_HistoricoID NUMBER,
    p_OrdenCompraID OUT NUMBER,
    p_ProductoID OUT NUMBER,
    p_Cantidad OUT NUMBER,
    p_Estado OUT VARCHAR2
) AS
BEGIN
    SELECT OrdenCompraID, ProductoID, Cantidad, Estado
    INTO p_OrdenCompraID, p_ProductoID, p_Cantidad, p_Estado
    FROM HistoricoOrdenesCompra
    WHERE HistoricoID = p_HistoricoID;
END LeerHistoricoOrdenCompra;


CREATE OR REPLACE PROCEDURE ActualizarHistoricoOrdenCompra(
    p_HistoricoID NUMBER,
    p_OrdenCompraID NUMBER,
    p_ProductoID NUMBER,
    p_Cantidad NUMBER,
    p_Estado VARCHAR2
) AS
BEGIN
    UPDATE HistoricoOrdenesCompra
    SET OrdenCompraID = p_OrdenCompraID, ProductoID = p_ProductoID, Cantidad = p_Cantidad, Estado = p_Estado
    WHERE HistoricoID = p_HistoricoID;
END ActualizarHistoricoOrdenCompra;


CREATE OR REPLACE PROCEDURE EliminarHistoricoOrdenCompra(
    p_HistoricoID NUMBER
) AS
BEGIN
    DELETE FROM HistoricoOrdenesCompra
    WHERE HistoricoID = p_HistoricoID;
END EliminarHistoricoOrdenCompra;


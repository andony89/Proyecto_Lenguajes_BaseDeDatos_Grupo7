--Paquete Empleados
CREATE OR REPLACE PACKAGE pkg_empleados AS
    PROCEDURE CrearEmpleado(
        p_Nombre VARCHAR2,
        p_Telefono VARCHAR2,
        p_Email VARCHAR2,
        p_Posicion VARCHAR2,
        p_FechaContratacion DATE,
        p_Salario NUMBER
    );

    PROCEDURE LeerEmpleado(
        p_EmpleadoID NUMBER,
        p_Nombre OUT VARCHAR2,
        p_Telefono OUT VARCHAR2,
        p_Email OUT VARCHAR2,
        p_Posicion OUT VARCHAR2,
        p_FechaContratacion OUT DATE,
        p_Salario OUT NUMBER
    );

    PROCEDURE ActualizarEmpleado(
        p_EmpleadoID NUMBER,
        p_Nombre VARCHAR2,
        p_Telefono VARCHAR2,
        p_Email VARCHAR2,
        p_Posicion VARCHAR2,
        p_FechaContratacion DATE,
        p_Salario NUMBER
    );

    PROCEDURE EliminarEmpleado(
        p_EmpleadoID NUMBER
    );
END pkg_empleados;
/

CREATE OR REPLACE PACKAGE BODY pkg_empleados AS
    PROCEDURE CrearEmpleado(
        p_Nombre VARCHAR2,
        p_Telefono VARCHAR2,
        p_Email VARCHAR2,
        p_Posicion VARCHAR2,
        p_FechaContratacion DATE,
        p_Salario NUMBER
    ) AS
    BEGIN
        INSERT INTO Empleados (Nombre, Telefono, Email, Posicion, FechaContratacion, Salario)
        VALUES (p_Nombre, p_Telefono, p_Email, p_Posicion, p_FechaContratacion, p_Salario);
    END CrearEmpleado;

    PROCEDURE LeerEmpleado(
        p_EmpleadoID NUMBER,
        p_Nombre OUT VARCHAR2,
        p_Telefono OUT VARCHAR2,
        p_Email OUT VARCHAR2,
        p_Posicion OUT VARCHAR2,
        p_FechaContratacion OUT DATE,
        p_Salario OUT NUMBER
    ) AS
    BEGIN
        SELECT Nombre, Telefono, Email, Posicion, FechaContratacion, Salario
        INTO p_Nombre, p_Telefono, p_Email, p_Posicion, p_FechaContratacion, p_Salario
        FROM Empleados
        WHERE EmpleadoID = p_EmpleadoID;
    END LeerEmpleado;

    PROCEDURE ActualizarEmpleado(
        p_EmpleadoID NUMBER,
        p_Nombre VARCHAR2,
        p_Telefono VARCHAR2,
        p_Email VARCHAR2,
        p_Posicion VARCHAR2,
        p_FechaContratacion DATE,
        p_Salario NUMBER
    ) AS
    BEGIN
        UPDATE Empleados
        SET Nombre = p_Nombre,
            Telefono = p_Telefono,
            Email = p_Email,
            Posicion = p_Posicion,
            FechaContratacion = p_FechaContratacion,
            Salario = p_Salario
        WHERE EmpleadoID = p_EmpleadoID;
    END ActualizarEmpleado;

    PROCEDURE EliminarEmpleado(
        p_EmpleadoID NUMBER
    ) AS
    BEGIN
        DELETE FROM Empleados
        WHERE EmpleadoID = p_EmpleadoID;
    END EliminarEmpleado;
END pkg_empleados;
/

--Paquete Categorias
CREATE OR REPLACE PACKAGE pkg_categorias AS
    PROCEDURE CrearCategoria(
        p_Nombre VARCHAR2,
        p_Descripcion VARCHAR2
    );

    PROCEDURE LeerCategoria(
        p_CategoriaID NUMBER,
        p_Nombre OUT VARCHAR2,
        p_Descripcion OUT VARCHAR2
    );

    PROCEDURE ActualizarCategoria(
        p_CategoriaID NUMBER,
        p_Nombre VARCHAR2,
        p_Descripcion VARCHAR2
    );

    PROCEDURE EliminarCategoria(
        p_CategoriaID NUMBER
    );
END pkg_categorias;
/

CREATE OR REPLACE PACKAGE BODY pkg_categorias AS
    PROCEDURE CrearCategoria(
        p_Nombre VARCHAR2,
        p_Descripcion VARCHAR2
    ) AS
    BEGIN
        INSERT INTO Categorias (Nombre, Descripcion)
        VALUES (p_Nombre, p_Descripcion);
    END CrearCategoria;

    PROCEDURE LeerCategoria(
        p_CategoriaID NUMBER,
        p_Nombre OUT VARCHAR2,
        p_Descripcion OUT VARCHAR2
    ) AS
    BEGIN
        SELECT Nombre, Descripcion
        INTO p_Nombre, p_Descripcion
        FROM Categorias
        WHERE CategoriaID = p_CategoriaID;
    END LeerCategoria;

    PROCEDURE ActualizarCategoria(
        p_CategoriaID NUMBER,
        p_Nombre VARCHAR2,
        p_Descripcion VARCHAR2
    ) AS
    BEGIN
        UPDATE Categorias
        SET Nombre = p_Nombre,
            Descripcion = p_Descripcion
        WHERE CategoriaID = p_CategoriaID;
    END ActualizarCategoria;

    PROCEDURE EliminarCategoria(
        p_CategoriaID NUMBER
    ) AS
    BEGIN
        DELETE FROM Categorias
        WHERE CategoriaID = p_CategoriaID;
    END EliminarCategoria;
END pkg_categorias;
/

--Paquete Proveedores
CREATE OR REPLACE PACKAGE pkg_proveedores AS
    PROCEDURE CrearProveedor(
        p_Nombre VARCHAR2,
        p_Telefono VARCHAR2,
        p_Direccion VARCHAR2,
        p_Email VARCHAR2
    );

    PROCEDURE LeerProveedor(
        p_ProveedorID NUMBER,
        p_Nombre OUT VARCHAR2,
        p_Telefono OUT VARCHAR2,
        p_Direccion OUT VARCHAR2,
        p_Email OUT VARCHAR2
    );

    PROCEDURE ActualizarProveedor(
        p_ProveedorID NUMBER,
        p_Nombre VARCHAR2,
        p_Telefono VARCHAR2,
        p_Direccion VARCHAR2,
        p_Email VARCHAR2
    );

    PROCEDURE EliminarProveedor(
        p_ProveedorID NUMBER
    );
END pkg_proveedores;
/

CREATE OR REPLACE PACKAGE BODY pkg_proveedores AS
    PROCEDURE CrearProveedor(
        p_Nombre VARCHAR2,
        p_Telefono VARCHAR2,
        p_Direccion VARCHAR2,
        p_Email VARCHAR2
    ) AS
    BEGIN
        INSERT INTO Proveedores (Nombre, Telefono, Direccion, Email)
        VALUES (p_Nombre, p_Telefono, p_Direccion, p_Email);
    END CrearProveedor;

    PROCEDURE LeerProveedor(
        p_ProveedorID NUMBER,
        p_Nombre OUT VARCHAR2,
        p_Telefono OUT VARCHAR2,
        p_Direccion OUT VARCHAR2,
        p_Email OUT VARCHAR2
    ) AS
    BEGIN
        SELECT Nombre, Telefono, Direccion, Email
        INTO p_Nombre, p_Telefono, p_Direccion, p_Email
        FROM Proveedores
        WHERE ProveedorID = p_ProveedorID;
    END LeerProveedor;

    PROCEDURE ActualizarProveedor(
        p_ProveedorID NUMBER,
        p_Nombre VARCHAR2,
        p_Telefono VARCHAR2,
        p_Direccion VARCHAR2,
        p_Email VARCHAR2
    ) AS
    BEGIN
        UPDATE Proveedores
        SET Nombre = p_Nombre,
            Telefono = p_Telefono,
            Direccion = p_Direccion,
            Email = p_Email
        WHERE ProveedorID = p_ProveedorID;
    END ActualizarProveedor;

    PROCEDURE EliminarProveedor(
        p_ProveedorID NUMBER
    ) AS
    BEGIN
        DELETE FROM Proveedores
        WHERE ProveedorID = p_ProveedorID;
    END EliminarProveedor;
END pkg_proveedores;
/

--Paquete Clientes
CREATE OR REPLACE PACKAGE pkg_clientes AS
    PROCEDURE CrearCliente(
        p_Nombre VARCHAR2,
        p_Telefono NUMBER,
        p_Direccion VARCHAR2,
        p_Email VARCHAR2
    );

    PROCEDURE LeerCliente(
        p_CedulaID NUMBER,
        p_Nombre OUT VARCHAR2,
        p_Telefono OUT NUMBER,
        p_Direccion OUT VARCHAR2,
        p_Email OUT VARCHAR2
    );

    PROCEDURE ActualizarCliente(
        p_CedulaID NUMBER,
        p_Nombre VARCHAR2,
        p_Telefono NUMBER,
        p_Direccion VARCHAR2,
        p_Email VARCHAR2
    );

    PROCEDURE EliminarCliente(
        p_CedulaID NUMBER
    );
END pkg_clientes;
/

CREATE OR REPLACE PACKAGE BODY pkg_clientes AS
    PROCEDURE CrearCliente(
        p_Nombre VARCHAR2,
        p_Telefono NUMBER,
        p_Direccion VARCHAR2,
        p_Email VARCHAR2
    ) AS
    BEGIN
        INSERT INTO Clientes (Nombre, Telefono, Direccion, Email)
        VALUES (p_Nombre, p_Telefono, p_Direccion, p_Email);
    END CrearCliente;

    PROCEDURE LeerCliente(
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

    PROCEDURE ActualizarCliente(
        p_CedulaID NUMBER,
        p_Nombre VARCHAR2,
        p_Telefono NUMBER,
        p_Direccion VARCHAR2,
        p_Email VARCHAR2
    ) AS
    BEGIN
        UPDATE Clientes
        SET Nombre = p_Nombre,
            Telefono = p_Telefono,
            Direccion = p_Direccion,
            Email = p_Email
        WHERE CedulaID = p_CedulaID;
    END ActualizarCliente;

    PROCEDURE EliminarCliente(
        p_CedulaID NUMBER
    ) AS
    BEGIN
        DELETE FROM Clientes
        WHERE CedulaID = p_CedulaID;
    END EliminarCliente;
END pkg_clientes;
/

--Paquete Productos
CREATE OR REPLACE PACKAGE pkg_productos AS
    PROCEDURE CrearProducto(
        p_Nombre VARCHAR2,
        p_CategoriaID NUMBER,
        p_Precio NUMBER,
        p_Slock NUMBER,
        p_ProveedorID NUMBER
    );

    PROCEDURE LeerProducto(
        p_ProductoID NUMBER,
        p_Nombre OUT VARCHAR2,
        p_CategoriaID OUT NUMBER,
        p_Precio OUT NUMBER,
        p_Slock OUT NUMBER,
        p_ProveedorID OUT NUMBER
    );

    PROCEDURE ActualizarProducto(
        p_ProductoID NUMBER,
        p_Nombre VARCHAR2,
        p_CategoriaID NUMBER,
        p_Precio NUMBER,
        p_Slock NUMBER,
        p_ProveedorID NUMBER
    );

    PROCEDURE EliminarProducto(
        p_ProductoID NUMBER
    );
END pkg_productos;
/

CREATE OR REPLACE PACKAGE BODY pkg_productos AS
    PROCEDURE CrearProducto(
        p_Nombre VARCHAR2,
        p_CategoriaID NUMBER,
        p_Precio NUMBER,
        p_Slock NUMBER,
        p_ProveedorID NUMBER
    ) AS
    BEGIN
        INSERT INTO Productos (Nombre, CategoriaID, Precio, Slock, ProveedorID)
        VALUES (p_Nombre, p_CategoriaID, p_Precio, p_Slock, p_ProveedorID);
    END CrearProducto;

    PROCEDURE LeerProducto(
        p_ProductoID NUMBER,
        p_Nombre OUT VARCHAR2,
        p_CategoriaID OUT NUMBER,
        p_Precio OUT NUMBER,
        p_Slock OUT NUMBER,
        p_ProveedorID OUT NUMBER
    ) AS
    BEGIN
        SELECT Nombre, CategoriaID, Precio, Slock, ProveedorID
        INTO p_Nombre, p_CategoriaID, p_Precio, p_Slock, p_ProveedorID
        FROM Productos
        WHERE ProductoID = p_ProductoID;
    END LeerProducto;

    PROCEDURE ActualizarProducto(
        p_ProductoID NUMBER,
        p_Nombre VARCHAR2,
        p_CategoriaID NUMBER,
        p_Precio NUMBER,
        p_Slock NUMBER,
        p_ProveedorID NUMBER
    ) AS
    BEGIN
        UPDATE Productos
        SET Nombre = p_Nombre,
            CategoriaID = p_CategoriaID,
            Precio = p_Precio,
            Slock = p_Slock,
            ProveedorID = p_ProveedorID
        WHERE ProductoID = p_ProductoID;
    END ActualizarProducto;

    PROCEDURE EliminarProducto(
        p_ProductoID NUMBER
    ) AS
    BEGIN
        DELETE FROM Productos
        WHERE ProductoID = p_ProductoID;
    END EliminarProducto;
END pkg_productos;
/

--Paquete Inventario
CREATE OR REPLACE PACKAGE pkg_inventario AS
    PROCEDURE CrearInventario(
        p_EmpleadoID NUMBER,
        p_ProductoID NUMBER,
        p_Cantidad NUMBER,
        p_FechaActualizada DATE
    );

    PROCEDURE LeerInventario(
        p_InventarioID NUMBER,
        p_EmpleadoID OUT NUMBER,
        p_ProductoID OUT NUMBER,
        p_Cantidad OUT NUMBER,
        p_FechaActualizada OUT DATE
    );

    PROCEDURE ActualizarInventario(
        p_InventarioID NUMBER,
        p_EmpleadoID NUMBER,
        p_ProductoID NUMBER,
        p_Cantidad NUMBER,
        p_FechaActualizada DATE
    );

    PROCEDURE EliminarInventario(
        p_InventarioID NUMBER
    );
END pkg_inventario;
/

CREATE OR REPLACE PACKAGE BODY pkg_inventario AS
    PROCEDURE CrearInventario(
        p_EmpleadoID NUMBER,
        p_ProductoID NUMBER,
        p_Cantidad NUMBER,
        p_FechaActualizada DATE
    ) AS
    BEGIN
        INSERT INTO Inventario (EmpleadoID, ProductoID, Cantidad, FechaActualizada)
        VALUES (p_EmpleadoID, p_ProductoID, p_Cantidad, p_FechaActualizada);
    END CrearInventario;

    PROCEDURE LeerInventario(
        p_InventarioID NUMBER,
        p_EmpleadoID OUT NUMBER,
        p_ProductoID OUT NUMBER,
        p_Cantidad OUT NUMBER,
        p_FechaActualizada OUT DATE
    ) AS
    BEGIN
        SELECT EmpleadoID, ProductoID, Cantidad, FechaActualizada
        INTO p_EmpleadoID, p_ProductoID, p_Cantidad, p_FechaActualizada
        FROM Inventario
        WHERE InventarioID = p_InventarioID;
    END LeerInventario;

    PROCEDURE ActualizarInventario(
        p_InventarioID NUMBER,
        p_EmpleadoID NUMBER,
        p_ProductoID NUMBER,
        p_Cantidad NUMBER,
        p_FechaActualizada DATE
    ) AS
    BEGIN
        UPDATE Inventario
        SET EmpleadoID = p_EmpleadoID,
            ProductoID = p_ProductoID,
            Cantidad = p_Cantidad,
            FechaActualizada = p_FechaActualizada
        WHERE InventarioID = p_InventarioID;
    END ActualizarInventario;

    PROCEDURE EliminarInventario(
        p_InventarioID NUMBER
    ) AS
    BEGIN
        DELETE FROM Inventario
        WHERE InventarioID = p_InventarioID;
    END EliminarInventario;
END pkg_inventario;
/

--Paquete OrdenesCompra
CREATE OR REPLACE PACKAGE pkg_ordenes_compra AS
    PROCEDURE CrearOrdenCompra(
        p_Fecha DATE,
        p_ProveedorID NUMBER,
        p_Total NUMBER,
        p_Estado VARCHAR2
    );

    PROCEDURE LeerOrdenCompra(
        p_OrdenCompraID NUMBER,
        p_Fecha OUT DATE,
        p_ProveedorID OUT NUMBER,
        p_Total OUT NUMBER,
        p_Estado OUT VARCHAR2
    );

    PROCEDURE ActualizarOrdenCompra(
        p_OrdenCompraID NUMBER,
        p_Fecha DATE,
        p_ProveedorID NUMBER,
        p_Total NUMBER,
        p_Estado VARCHAR2
    );

    PROCEDURE EliminarOrdenCompra(
        p_OrdenCompraID NUMBER
    );
END pkg_ordenes_compra;
/

CREATE OR REPLACE PACKAGE BODY pkg_ordenes_compra AS
    PROCEDURE CrearOrdenCompra(
        p_Fecha DATE,
        p_ProveedorID NUMBER,
        p_Total NUMBER,
        p_Estado VARCHAR2
    ) AS
    BEGIN
        INSERT INTO OrdenesCompra (Fecha, ProveedorID, Total, Estado)
        VALUES (p_Fecha, p_ProveedorID, p_Total, p_Estado);
    END CrearOrdenCompra;

    PROCEDURE LeerOrdenCompra(
        p_OrdenCompraID NUMBER,
        p_Fecha OUT DATE,
        p_ProveedorID OUT NUMBER,
        p_Total OUT NUMBER,
        p_Estado OUT VARCHAR2
    ) AS
    BEGIN
        SELECT Fecha, ProveedorID, Total, Estado
        INTO p_Fecha, p_ProveedorID, p_Total, p_Estado
        FROM OrdenesCompra
        WHERE OrdenCompraID = p_OrdenCompraID;
    END LeerOrdenCompra;

    PROCEDURE ActualizarOrdenCompra(
        p_OrdenCompraID NUMBER,
        p_Fecha DATE,
        p_ProveedorID NUMBER,
        p_Total NUMBER,
        p_Estado VARCHAR2
    ) AS
    BEGIN
        UPDATE OrdenesCompra
        SET Fecha = p_Fecha,
            ProveedorID = p_ProveedorID,
            Total = p_Total,
            Estado = p_Estado
        WHERE OrdenCompraID = p_OrdenCompraID;
    END ActualizarOrdenCompra;

    PROCEDURE EliminarOrdenCompra(
        p_OrdenCompraID NUMBER
    ) AS
    BEGIN
        DELETE FROM OrdenesCompra
        WHERE OrdenCompraID = p_OrdenCompraID;
    END EliminarOrdenCompra;
END pkg_ordenes_compra;
/

--Paquete Ventas
CREATE OR REPLACE PACKAGE pkg_ventas AS
    PROCEDURE CrearVenta(
        p_Fecha DATE,
        p_CedulaID NUMBER,
        p_Total NUMBER
    );

    PROCEDURE LeerVenta(
        p_VentaID NUMBER,
        p_Fecha OUT DATE,
        p_CedulaID OUT NUMBER,
        p_Total OUT NUMBER
    );

    PROCEDURE ActualizarVenta(
        p_VentaID NUMBER,
        p_Fecha DATE,
        p_CedulaID NUMBER,
        p_Total NUMBER
    );

    PROCEDURE EliminarVenta(
        p_VentaID NUMBER
    );
END pkg_ventas;
/

CREATE OR REPLACE PACKAGE BODY pkg_ventas AS
    PROCEDURE CrearVenta(
        p_Fecha DATE,
        p_CedulaID NUMBER,
        p_Total NUMBER
    ) AS
    BEGIN
        INSERT INTO Ventas (Fecha, CedulaID, Total)
        VALUES (p_Fecha, p_CedulaID, p_Total);
    END CrearVenta;

    PROCEDURE LeerVenta(
        p_VentaID NUMBER,
        p_Fecha OUT DATE,
        p_CedulaID OUT NUMBER,
        p_Total OUT NUMBER
    ) AS
    BEGIN
        SELECT Fecha, CedulaID, Total
        INTO p_Fecha, p_CedulaID, p_Total
        FROM Ventas
        WHERE VentaID = p_VentaID;
    END LeerVenta;

    PROCEDURE ActualizarVenta(
        p_VentaID NUMBER,
        p_Fecha DATE,
        p_CedulaID NUMBER,
        p_Total NUMBER
    ) AS
    BEGIN
        UPDATE Ventas
        SET Fecha = p_Fecha,
            CedulaID = p_CedulaID,
            Total = p_Total
        WHERE VentaID = p_VentaID;
    END ActualizarVenta;

    PROCEDURE EliminarVenta(
        p_VentaID NUMBER
    ) AS
    BEGIN
        DELETE FROM Ventas
        WHERE VentaID = p_VentaID;
    END EliminarVenta;
END pkg_ventas;
/

--Paquete Factura
CREATE OR REPLACE PACKAGE pkg_factura AS
    PROCEDURE CrearFactura(
        p_VentaID NUMBER,
        p_ProductoID NUMBER,
        p_Cantidad NUMBER,
        p_PrecioUnitario NUMBER,
        p_PrecioTotal NUMBER
    );

    PROCEDURE LeerFactura(
        p_FacturaID NUMBER,
        p_VentaID OUT NUMBER,
        p_ProductoID OUT NUMBER,
        p_Cantidad OUT NUMBER,
        p_PrecioUnitario OUT NUMBER,
        p_PrecioTotal OUT NUMBER
    );

    PROCEDURE ActualizarFactura(
        p_FacturaID NUMBER,
        p_VentaID NUMBER,
        p_ProductoID NUMBER,
        p_Cantidad NUMBER,
        p_PrecioUnitario NUMBER,
        p_PrecioTotal NUMBER
    );

    PROCEDURE EliminarFactura(
        p_FacturaID NUMBER
    );
END pkg_factura;
/

CREATE OR REPLACE PACKAGE BODY pkg_factura AS
    PROCEDURE CrearFactura(
        p_VentaID NUMBER,
        p_ProductoID NUMBER,
        p_Cantidad NUMBER,
        p_PrecioUnitario NUMBER,
        p_PrecioTotal NUMBER
    ) AS
    BEGIN
        INSERT INTO Factura (VentaID, ProductoID, Cantidad, PrecioUnitario, PrecioTotal)
        VALUES (p_VentaID, p_ProductoID, p_Cantidad, p_PrecioUnitario, p_PrecioTotal);
    END CrearFactura;

    PROCEDURE LeerFactura(
        p_FacturaID NUMBER,
        p_VentaID OUT NUMBER,
        p_ProductoID OUT NUMBER,
        p_Cantidad OUT NUMBER,
        p_PrecioUnitario OUT NUMBER,
        p_PrecioTotal OUT NUMBER
    ) AS
    BEGIN
        SELECT VentaID, ProductoID, Cantidad, PrecioUnitario, PrecioTotal
        INTO p_VentaID, p_ProductoID, p_Cantidad, p_PrecioUnitario, p_PrecioTotal
        FROM Factura
        WHERE FacturaID = p_FacturaID;
    END LeerFactura;

    PROCEDURE ActualizarFactura(
        p_FacturaID NUMBER,
        p_VentaID NUMBER,
        p_ProductoID NUMBER,
        p_Cantidad NUMBER,
        p_PrecioUnitario NUMBER,
        p_PrecioTotal NUMBER
    ) AS
    BEGIN
        UPDATE Factura
        SET VentaID = p_VentaID,
            ProductoID = p_ProductoID,
            Cantidad = p_Cantidad,
            PrecioUnitario = p_PrecioUnitario,
            PrecioTotal = p_PrecioTotal
        WHERE FacturaID = p_FacturaID;
    END ActualizarFactura;

    PROCEDURE EliminarFactura(
        p_FacturaID NUMBER
    ) AS
    BEGIN
        DELETE FROM Factura
        WHERE FacturaID = p_FacturaID;
    END EliminarFactura;
END pkg_factura;
/
--Paquete HistoricoOrdenesCompra
CREATE OR REPLACE PACKAGE pkg_historico_ordenes_compra AS
    PROCEDURE CrearHistoricoOrdenCompra(
        p_OrdenCompraID NUMBER,
        p_ProductoID NUMBER,
        p_Cantidad NUMBER,
        p_Estado VARCHAR2
    );

    PROCEDURE LeerHistoricoOrdenCompra(
        p_HistoricoID NUMBER,
        p_OrdenCompraID OUT NUMBER,
        p_ProductoID OUT NUMBER,
        p_Cantidad OUT NUMBER,
        p_Estado OUT VARCHAR2
    );

    PROCEDURE ActualizarHistoricoOrdenCompra(
        p_HistoricoID NUMBER,
        p_OrdenCompraID NUMBER,
        p_ProductoID NUMBER,
        p_Cantidad NUMBER,
        p_Estado VARCHAR2
    );

    PROCEDURE EliminarHistoricoOrdenCompra(
        p_HistoricoID NUMBER
    );
END pkg_historico_ordenes_compra;
/

CREATE OR REPLACE PACKAGE BODY pkg_historico_ordenes_compra AS
    PROCEDURE CrearHistoricoOrdenCompra(
        p_OrdenCompraID NUMBER,
        p_ProductoID NUMBER,
        p_Cantidad NUMBER,
        p_Estado VARCHAR2
    ) AS
    BEGIN
        INSERT INTO HistoricoOrdenesCompra (OrdenCompraID, ProductoID, Cantidad, Estado)
        VALUES (p_OrdenCompraID, p_ProductoID, p_Cantidad, p_Estado);
    END CrearHistoricoOrdenCompra;

    PROCEDURE LeerHistoricoOrdenCompra(
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

    PROCEDURE ActualizarHistoricoOrdenCompra(
        p_HistoricoID NUMBER,
        p_OrdenCompraID NUMBER,
        p_ProductoID NUMBER,
        p_Cantidad NUMBER,
        p_Estado VARCHAR2
    ) AS
    BEGIN
        UPDATE HistoricoOrdenesCompra
        SET OrdenCompraID = p_OrdenCompraID,
            ProductoID = p_ProductoID,
            Cantidad = p_Cantidad,
            Estado = p_Estado
        WHERE HistoricoID = p_HistoricoID;
    END ActualizarHistoricoOrdenCompra;

    PROCEDURE EliminarHistoricoOrdenCompra(
        p_HistoricoID NUMBER
    ) AS
    BEGIN
        DELETE FROM HistoricoOrdenesCompra
        WHERE HistoricoID = p_HistoricoID;
    END EliminarHistoricoOrdenCompra;
END pkg_historico_ordenes_compra;
/

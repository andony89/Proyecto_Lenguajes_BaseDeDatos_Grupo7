--Cursor Empleados
CREATE OR REPLACE PROCEDURE ObtenerEmpleados IS
    CURSOR c_empleados IS
        SELECT EmpleadoID, Nombre, Telefono, Email, Posicion, FechaContratacion, Salario
        FROM Empleados;
    
    v_empleado c_empleados%ROWTYPE;
BEGIN
    IF NOT c_empleados%ISOPEN THEN
        OPEN c_empleados;
    END IF;
    
    LOOP
        FETCH c_empleados INTO v_empleado;
        EXIT WHEN c_empleados%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_empleado.Nombre || ' - ' || v_empleado.Telefono);
    END LOOP;
    
    IF c_empleados%ISOPEN THEN
        CLOSE c_empleados;
    END IF;
END ObtenerEmpleados;
/

--Cursor Categorias
CREATE OR REPLACE PROCEDURE ObtenerCategorias IS
    CURSOR c_categorias IS
        SELECT CategoriaID, Nombre, Descripcion
        FROM Categorias;
    
    v_categoria c_categorias%ROWTYPE;
BEGIN
    IF NOT c_categorias%ISOPEN THEN
        OPEN c_categorias;
    END IF;
    
    LOOP
        FETCH c_categorias INTO v_categoria;
        EXIT WHEN c_categorias%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_categoria.Nombre || ' - ' || v_categoria.Descripcion);
    END LOOP;
    
    IF c_categorias%ISOPEN THEN
        CLOSE c_categorias;
    END IF;
END ObtenerCategorias;
/

--Cursor Provedores
CREATE OR REPLACE PROCEDURE ObtenerProveedores IS
    CURSOR c_proveedores IS
        SELECT ProveedorID, Nombre, Telefono, Direccion, Email
        FROM Proveedores;
    
    v_proveedor c_proveedores%ROWTYPE;
BEGIN
    IF NOT c_proveedores%ISOPEN THEN
        OPEN c_proveedores;
    END IF;
    
    LOOP
        FETCH c_proveedores INTO v_proveedor;
        EXIT WHEN c_proveedores%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_proveedor.Nombre || ' - ' || v_proveedor.Telefono);
    END LOOP;
    
    IF c_proveedores%ISOPEN THEN
        CLOSE c_proveedores;
    END IF;
END ObtenerProveedores;
/


--Cursor Clientes
CREATE OR REPLACE PROCEDURE ObtenerClientes IS
    CURSOR c_clientes IS
        SELECT CedulaID, Nombre, Telefono, Direccion, Email
        FROM Clientes;
    
    v_cliente c_clientes%ROWTYPE;
BEGIN
    IF NOT c_clientes%ISOPEN THEN
        OPEN c_clientes;
    END IF;
    
    LOOP
        FETCH c_clientes INTO v_cliente;
        EXIT WHEN c_clientes%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_cliente.Nombre || ' - ' || v_cliente.Telefono);
    END LOOP;
    
    IF c_clientes%ISOPEN THEN
        CLOSE c_clientes;
    END IF;
END ObtenerClientes;
/


--Cursor Productos
CREATE OR REPLACE PROCEDURE ObtenerProductos IS
    CURSOR c_productos IS
        SELECT ProductoID, Nombre, CategoriaID, Precio, Slock, ProveedorID
        FROM Productos;
    
    v_producto c_productos%ROWTYPE;
BEGIN
    IF NOT c_productos%ISOPEN THEN
        OPEN c_productos;
    END IF;
    
    LOOP
        FETCH c_productos INTO v_producto;
        EXIT WHEN c_productos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_producto.Nombre || ' - ' || v_producto.Precio);
    END LOOP;
    
    IF c_productos%ISOPEN THEN
        CLOSE c_productos;
    END IF;
END ObtenerProductos;
/

--Cursor Inventario
CREATE OR REPLACE PROCEDURE ObtenerInventario IS
    CURSOR c_inventario IS
        SELECT InventarioID, EmpleadoID, ProductoID, Cantidad, FechaActualizada
        FROM Inventario;
    
    v_inventario c_inventario%ROWTYPE;
BEGIN
    IF NOT c_inventario%ISOPEN THEN
        OPEN c_inventario;
    END IF;
    
    LOOP
        FETCH c_inventario INTO v_inventario;
        EXIT WHEN c_inventario%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_inventario.EmpleadoID || ' - ' || v_inventario.ProductoID);
    END LOOP;
    
    IF c_inventario%ISOPEN THEN
        CLOSE c_inventario;
    END IF;
END ObtenerInventario;
/


--Cursor OrdenesCompra
CREATE OR REPLACE PROCEDURE ObtenerOrdenesCompra IS
    CURSOR c_ordenes_compra IS
        SELECT OrdenCompraID, Fecha, ProveedorID, Total, Estado
        FROM OrdenesCompra;
    
    v_orden_compra c_ordenes_compra%ROWTYPE;
BEGIN
    IF NOT c_ordenes_compra%ISOPEN THEN
        OPEN c_ordenes_compra;
    END IF;
    
    LOOP
        FETCH c_ordenes_compra INTO v_orden_compra;
        EXIT WHEN c_ordenes_compra%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_orden_compra.Fecha || ' - ' || v_orden_compra.Total);
    END LOOP;
    
    IF c_ordenes_compra%ISOPEN THEN
        CLOSE c_ordenes_compra;
    END IF;
END ObtenerOrdenesCompra;
/

--Cursor Ventas
CREATE OR REPLACE PROCEDURE ObtenerVentas IS
    CURSOR c_ventas IS
        SELECT VentaID, Fecha, CedulaID, Total
        FROM Ventas;
    
    v_venta c_ventas%ROWTYPE;
BEGIN
    OPEN c_ventas;
    
    LOOP
        FETCH c_ventas INTO v_venta;
        EXIT WHEN c_ventas%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_venta.Fecha || ' - ' || v_venta.Total);
    END LOOP;
    
    CLOSE c_ventas;
END ObtenerVentas;
/

--Cursor Factura
CREATE OR REPLACE PROCEDURE ObtenerFactura IS
    CURSOR c_factura IS
        SELECT FacturaID, VentaID, ProductoID, Cantidad, PrecioUnitario, PrecioTotal
        FROM Factura;
    
    v_factura c_factura%ROWTYPE;
BEGIN
    OPEN c_factura;
    
    LOOP
        FETCH c_factura INTO v_factura;
        EXIT WHEN c_factura%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_factura.VentaID || ' - ' || v_factura.PrecioTotal);
    END LOOP;
    
    CLOSE c_factura;
END ObtenerFactura;
/


--Cursor HistoricoOrdenesCompra
CREATE OR REPLACE PROCEDURE ObtenerHistoricoOrdenesCompra IS
    CURSOR c_historico_ordenes_compra IS
        SELECT HistoricoID, OrdenCompraID, ProductoID, Cantidad, Estado
        FROM HistoricoOrdenesCompra;
    
    v_historico c_historico_ordenes_compra%ROWTYPE;
BEGIN
    OPEN c_historico_ordenes_compra;
    
    LOOP
        FETCH c_historico_ordenes_compra INTO v_historico;
        EXIT WHEN c_historico_ordenes_compra%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_historico.OrdenCompraID || ' - ' || v_historico.ProductoID);
    END LOOP;
    
    CLOSE c_historico_ordenes_compra;
END ObtenerHistoricoOrdenesCompra;
/

--Curso Empleados (Posicion)
CREATE OR REPLACE PROCEDURE ObtenerEmpleadosPorPosicion(p_Posicion VARCHAR2) IS
    CURSOR c_empleados_posicion IS
        SELECT EmpleadoID, Nombre, Telefono, Email, Posicion, FechaContratacion, Salario
        FROM Empleados
        WHERE Posicion = p_Posicion;
    
    v_empleado c_empleados_posicion%ROWTYPE;
BEGIN
    OPEN c_empleados_posicion;
    
    LOOP
        FETCH c_empleados_posicion INTO v_empleado;
        EXIT WHEN c_empleados_posicion%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_empleado.Nombre || ' - ' || v_empleado.Telefono);
    END LOOP;
    
    CLOSE c_empleados_posicion;
END ObtenerEmpleadosPorPosicion;
/

--Cursor Empleados con mayor salario
CREATE OR REPLACE PROCEDURE ObtenerEmpleadosPorSalario(p_SalarioMinimo NUMBER) IS
    CURSOR c_empleados_salario IS
        SELECT EmpleadoID, Nombre, Telefono, Email, Posicion, FechaContratacion, Salario
        FROM Empleados
        WHERE Salario > p_SalarioMinimo;
    
    v_empleado c_empleados_salario%ROWTYPE;
BEGIN
    OPEN c_empleados_salario;
    
    LOOP
        FETCH c_empleados_salario INTO v_empleado;
        EXIT WHEN c_empleados_salario%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_empleado.Nombre || ' - ' || v_empleado.Salario);
    END LOOP;
    
    CLOSE c_empleados_salario;
END ObtenerEmpleadosPorSalario;
/

--Cursor Producto (Categoria)
CREATE OR REPLACE PROCEDURE ObtenerProductosPorCategoria(p_CategoriaID NUMBER) IS
    CURSOR c_productos_categoria IS
        SELECT ProductoID, Nombre, Precio, Slock, ProveedorID
        FROM Productos
        WHERE CategoriaID = p_CategoriaID;
    
    v_producto c_productos_categoria%ROWTYPE;
BEGIN
    OPEN c_productos_categoria;
    
    LOOP
        FETCH c_productos_categoria INTO v_producto;
        EXIT WHEN c_productos_categoria%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_producto.Nombre || ' - ' || v_producto.Precio);
    END LOOP;
    
    CLOSE c_productos_categoria;
END ObtenerProductosPorCategoria;
/


--Curso OrdenesCompra (Estado)
CREATE OR REPLACE PROCEDURE ObtenerOrdenesCompraPorEstado(p_Estado VARCHAR2) IS
    CURSOR c_ordenes_compra_estado IS
        SELECT OrdenCompraID, Fecha, ProveedorID, Total
        FROM OrdenesCompra
        WHERE Estado = p_Estado;
    
    v_orden_compra c_ordenes_compra_estado%ROWTYPE;
BEGIN
    OPEN c_ordenes_compra_estado;
    
    LOOP
        FETCH c_ordenes_compra_estado INTO v_orden_compra;
        EXIT WHEN c_ordenes_compra_estado%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_orden_compra.Fecha || ' - ' || v_orden_compra.Total);
    END LOOP;
    
    CLOSE c_ordenes_compra_estado;
END ObtenerOrdenesCompraPorEstado;
/


--Curso Ventas (Fecha)
CREATE OR REPLACE PROCEDURE ObtenerVentasPorFecha(p_FechaInicio DATE, p_FechaFin DATE) IS
    CURSOR c_ventas_fecha IS
        SELECT VentaID, Fecha, CedulaID, Total
        FROM Ventas
        WHERE Fecha BETWEEN p_FechaInicio AND p_FechaFin;
    
    v_venta c_ventas_fecha%ROWTYPE;
BEGIN
    OPEN c_ventas_fecha;
    
    LOOP
        FETCH c_ventas_fecha INTO v_venta;
        EXIT WHEN c_ventas_fecha%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_venta.Fecha || ' - ' || v_venta.Total);
    END LOOP;
    
    CLOSE c_ventas_fecha;
END ObtenerVentasPorFecha;
/

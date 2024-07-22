--funciones 8 de las 15

CREATE OR REPLACE FUNCTION calcular_precio_total_producto (
    p_productoID IN NUMBER
) RETURN NUMBER
IS
    v_precio NUMBER;
    v_cantidad NUMBER;
    v_precio_total NUMBER;
BEGIN
    SELECT Precio INTO v_precio
    FROM Productos
    WHERE ProductoID = p_productoID;

    SELECT Cantidad INTO v_cantidad
    FROM Inventario
    WHERE ProductoID = p_productoID;

    v_precio_total := v_precio * v_cantidad;

    RETURN v_precio_total;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END calcular_precio_total_producto;


CREATE OR REPLACE FUNCTION obtener_nombre_proveedor (
    p_proveedorID IN NUMBER
) RETURN VARCHAR2
IS
    v_nombre VARCHAR2(100);
BEGIN
    SELECT Nombre INTO v_nombre
    FROM Proveedores
    WHERE ProveedorID = p_proveedorID;

    RETURN v_nombre;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END obtener_nombre_proveedor;


CREATE OR REPLACE FUNCTION verificar_stock_bajo (
    p_productoID IN NUMBER,
    p_umbral IN NUMBER
) RETURN BOOLEAN
IS
    v_stock NUMBER;
BEGIN
    SELECT Cantidad INTO v_stock
    FROM Inventario
    WHERE ProductoID = p_productoID;

    RETURN v_stock < p_umbral;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END verificar_stock_bajo;


CREATE OR REPLACE FUNCTION total_ventas_producto (
    p_productoID IN NUMBER
) RETURN NUMBER
IS
    v_total NUMBER;
BEGIN
    SELECT SUM(v.total) INTO v_total
    FROM Ventas v
    JOIN Productos p ON v.ProductoID = p.ProductoID
    WHERE p.ProductoID = p_productoID;

    RETURN v_total;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END total_ventas_producto;



CREATE OR REPLACE FUNCTION obtener_saldo_proveedor (
    p_proveedorID IN NUMBER
) RETURN NUMBER
IS
    v_saldo NUMBER;
BEGIN
    SELECT SUM(o.Total) INTO v_saldo
    FROM OrdenesCompa o
    WHERE o.ProveedorID = p_proveedorID;

    RETURN v_saldo;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END obtener_saldo_proveedor;


CREATE OR REPLACE FUNCTION calcular_total_compras (
    p_proveedorID IN NUMBER
) RETURN NUMBER
IS
    v_total NUMBER;
BEGIN
    SELECT SUM(Total) INTO v_total
    FROM OrdenesCompa
    WHERE ProveedorID = p_proveedorID;

    RETURN v_total;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END calcular_total_compras;


CREATE OR REPLACE FUNCTION obtener_fecha_ultima_venta (
    p_productoID IN NUMBER
) RETURN DATE
IS
    v_fecha DATE;
BEGIN
    SELECT MAX(Fecha) INTO v_fecha
    FROM Ventas
    WHERE ProductoID = p_productoID;

    RETURN v_fecha;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END obtener_fecha_ultima_venta;


CREATE OR REPLACE FUNCTION cantidad_total_productos (
) RETURN NUMBER
IS
    v_total NUMBER;
BEGIN
    SELECT SUM(Cantidad) INTO v_total
    FROM Inventario;

    RETURN v_total;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END cantidad_total_productos;


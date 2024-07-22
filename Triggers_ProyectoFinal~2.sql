
CREATE OR REPLACE TRIGGER trg_actualizar_fecha_modificacion_producto
BEFORE UPDATE ON Productos
FOR EACH ROW
BEGIN
    :NEW.FechaUltimaModificacion := SYSDATE;
END;

CREATE OR REPLACE TRIGGER trg_log_cambios_inventario
AFTER UPDATE ON Inventario
FOR EACH ROW
BEGIN
    INSERT INTO LogCambiosInventario (ProductoID, CantidadAnterior, CantidadNueva, FechaCambio)
    VALUES (:OLD.ProductoID, :OLD.Cantidad, :NEW.Cantidad, SYSDATE);
END;


CREATE OR REPLACE TRIGGER trg_validar_cantidad_producto
BEFORE INSERT ON Productos
FOR EACH ROW
BEGIN
    IF :NEW.Cantidad < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'La cantidad no puede ser negativa.');
    END IF;
END;


CREATE OR REPLACE TRIGGER trg_actualizar_stock_venta
AFTER INSERT ON Ventas
FOR EACH ROW
BEGIN
    UPDATE Inventario
    SET Cantidad = Cantidad - :NEW.Cantidad
    WHERE ProductoID = :NEW.ProductoID;
END;


CREATE OR REPLACE TRIGGER trg_log_eliminacion_proveedor
BEFORE DELETE ON Proveedores
FOR EACH ROW
BEGIN
    INSERT INTO LogEliminacionProveedores (ProveedorID, Nombre, FechaEliminacion)
    VALUES (:OLD.ProveedorID, :OLD.Nombre, SYSDATE);
END;

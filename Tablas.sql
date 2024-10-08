-- 1. Empleados (independiente)
CREATE TABLE Empleados (
    EmpleadoID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR2(100) NOT NULL,
    Telefono VARCHAR2(15) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    Posicion VARCHAR2(50) NOT NULL,
    FechaContratacion DATE NOT NULL,
    Salario NUMBER NOT NULL
);

-- 2. Categorias (independiente)
CREATE TABLE Categorias (
    CategoriaID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR2(100) NOT NULL,
    Descripcion VARCHAR2(255)
);

-- 3. Proveedores (independiente)
CREATE TABLE Proveedores (
    ProveedorID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR2(100) NOT NULL,
    Telefono VARCHAR2(15) NOT NULL,
    Direccion VARCHAR2(255),
    Email VARCHAR2(100) NOT NULL
);

-- 4. Clientes (independiente)
CREATE TABLE Clientes (
    CedulaID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR2(100) NOT NULL,
    Telefono NUMBER NOT NULL,
    Direccion VARCHAR2(300) NOT NULL,
    Email VARCHAR2(100) NOT NULL
);

-- 5. Productos (depende de Categorias y Proveedores)
CREATE TABLE Productos (
    ProductoID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Nombre VARCHAR2(100) NOT NULL,
    CategoriaID NUMBER NOT NULL,
    Precio NUMBER NOT NULL,
    Slock NUMBER NOT NULL,
    ProveedorID NUMBER NOT NULL,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID),
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

-- 6. Inventario (depende de Empleados y Productos)
CREATE TABLE Inventario (
    InventarioID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    EmpleadoID NUMBER NOT NULL,
    ProductoID NUMBER NOT NULL,
    Cantidad NUMBER NOT NULL,
    FechaActualizada DATE NOT NULL,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- 7. OrdenesCompra (depende de Proveedores)
CREATE TABLE OrdenesCompra (
    OrdenCompraID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Fecha DATE NOT NULL,
    ProveedorID NUMBER NOT NULL,
    Total NUMBER NOT NULL,
    Estado VARCHAR2(50) NOT NULL,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

-- 8. Ventas (depende de Clientes)
CREATE TABLE Ventas (
    VentaID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Fecha DATE NOT NULL,
    CedulaID NUMBER NOT NULL,
    Total NUMBER NOT NULL,
    FOREIGN KEY (CedulaID) REFERENCES Clientes(CedulaID)
);

-- 9. Factura (depende de Ventas y Productos)
CREATE TABLE Factura (
    FacturaID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    VentaID NUMBER NOT NULL,
    ProductoID NUMBER NOT NULL,
    Cantidad NUMBER NOT NULL,
    PrecioUnitario NUMBER NOT NULL,
    PrecioTotal NUMBER NOT NULL,
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- 10. HistoricoOrdenesCompra (depende de OrdenesCompra y Productos)
CREATE TABLE HistoricoOrdenesCompra (
    HistoricoID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    OrdenCompraID NUMBER NOT NULL,
    ProductoID NUMBER NOT NULL,
    Cantidad NUMBER NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (OrdenCompraID) REFERENCES OrdenesCompra(OrdenCompraID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

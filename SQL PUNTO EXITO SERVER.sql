--se elimina la base de datos en caso de que ya exista para que no de error jeje 
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'punto_exitoo')
BEGIN
    ALTER DATABASE punto_exitoo SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE punto_exitoo;
END 
GO

CREATE DATABASE punto_exitoo;
GO 

USE punto_exitoo;
GO

-- Tabla de Usuario
CREATE TABLE usuario (
    ID_usuario INT PRIMARY KEY,
    rol VARCHAR(20),
    nombre VARCHAR(50),
    correo VARCHAR(50),
    contraseña VARCHAR(50),
    telefono VARCHAR(20),
    fecha_nac DATE 
);

-- Tabla de Categoria 
CREATE TABLE categoria (
    ID_categoria INT PRIMARY KEY,
    nombre_cate VARCHAR(20),
    descripccion VARCHAR(100)
);

-- Tabla de Proveedor 
CREATE TABLE proveedor (
    ID_proveedor INT PRIMARY KEY,
    nombre VARCHAR(20),
    direccion VARCHAR(50),
    contacto VARCHAR(50)  
);

-- Tabla Producto
CREATE TABLE producto (
    ID_producto INT PRIMARY KEY,
    nombre VARCHAR(20),
    precio DECIMAL(10,2),
    stock_minimo INT,
    stock_maximo INT,
    fecha_caducidad DATE,
    ID_categoria INT,
    ID_proveedor INT,
    FOREIGN KEY (ID_categoria) REFERENCES categoria(ID_categoria),
    FOREIGN KEY (ID_proveedor) REFERENCES proveedor(ID_proveedor)
);

-- Tabla Cliente 
CREATE TABLE cliente (
    ID_cliente INT PRIMARY KEY
);

-- Tabla Orden de Entrada
CREATE TABLE orden_entrada (
    ID_orden_e INT PRIMARY KEY,
    fecha_entrada DATE,
    tipo_de_entrada VARCHAR(20),
    ID_usuario INT,
    FOREIGN KEY (ID_usuario) REFERENCES usuario(ID_usuario)
);

-- Tabla Detalle Entrada 
CREATE TABLE detalle_entrada (
    ID_detalle_entrada INT IDENTITY(1,1) PRIMARY KEY,
    ID_orden_e INT,
    ID_producto INT,
    cantidad INT,
    FOREIGN KEY (ID_orden_e) REFERENCES orden_entrada(ID_orden_e),
    FOREIGN KEY (ID_producto) REFERENCES producto(ID_producto)
);

-- Tabla Orden de Salida
CREATE TABLE orden_salida (
    ID_orden_s INT PRIMARY KEY,
    fecha_salida DATE,
    tipo_salida VARCHAR(20),
    ID_usuario INT,
    ID_cliente INT,
    FOREIGN KEY (ID_usuario) REFERENCES usuario(ID_usuario),
    FOREIGN KEY (ID_cliente) REFERENCES cliente(ID_cliente)
);

-- Tabla Detalle Salida 
CREATE TABLE detalle_salida (
    ID_detalle_salida INT IDENTITY(1,1) PRIMARY KEY,
    ID_orden_s INT,
    ID_producto INT,
    cantidad INT,
    FOREIGN KEY (ID_orden_s) REFERENCES orden_salida(ID_orden_s),
    FOREIGN KEY (ID_producto) REFERENCES producto(ID_producto)
);

-- Tabla Devolución 
CREATE TABLE devolucion (
    ID_devolucion INT PRIMARY KEY,
    cantidad INT,
    motivo VARCHAR(250),
    fecha_devolucion DATE,
    ID_orden_s INT,
    ID_producto INT,
    FOREIGN KEY (ID_orden_s) REFERENCES orden_salida(ID_orden_s),
    FOREIGN KEY (ID_producto) REFERENCES producto(ID_producto)
);

-- REGISTROS: 

--usuarios 
INSERT INTO usuario (ID_usuario, rol, nombre, correo, contraseña, telefono, fecha_nac) VALUES
(1, 'Administrador', 'Juan Pérez', 'juan.perez@email.com', 'pass123', '3001234567', '1980-05-15'),
(2, 'Empleado', 'María Gómez', 'maria.gomez@email.com', 'pass456', '3007654321', '1990-10-20');
GO

--categorías 
INSERT INTO categoria (ID_categoria, nombre_cate, descripccion) VALUES
(1, 'Bebidas', 'Bebidas alcohólicas y no alcohólicas'),
(2, 'Aseo', 'Productos de limpieza y cuidado personal');
GO

--proveedores 
INSERT INTO proveedor (ID_proveedor, nombre, direccion, contacto) VALUES
(1, 'Distribuciones ABC', 'Calle 123 #45-67', 'distribuciones@abc.com'),
(2, 'Limpiezas SA', 'Avenida 10 #20-30', 'contacto@limpiezassa.com');
GO

--productos 
INSERT INTO producto (ID_producto, nombre, precio, stock_minimo, stock_maximo, fecha_caducidad, ID_categoria, ID_proveedor) VALUES
(1, 'Coca-Cola 1L', 2500.00, 10, 100, '2025-12-31', 1, 1),
(2, 'Detergente Líquido', 12000.00, 5, 50, '2026-06-30', 2, 2);
GO

-- cliente 
INSERT INTO cliente (ID_cliente) VALUES (1);
GO

--orden de entrada 
INSERT INTO orden_entrada (ID_orden_e, fecha_entrada, tipo_de_entrada, ID_usuario) VALUES
(1, '2025-06-01', 'Compra', 1);
GO

--detalle entrada 
INSERT INTO detalle_entrada (ID_orden_e, ID_producto, cantidad) VALUES
(1, 1, 50), -- 50 unidades de Coca-Cola entran en la orden 1
(1, 2, 20); -- 20 unidades de detergente entran en la orden 1
GO

--orden de salida 
INSERT INTO orden_salida (ID_orden_s, fecha_salida, tipo_salida, ID_usuario, ID_cliente) VALUES
(1, '2025-06-02', 'Venta', 2, 1);
GO

--detalle salida 
INSERT INTO detalle_salida (ID_orden_s, ID_producto, cantidad) VALUES
(1, 1, 5); -- Se venden 5 unidades de Coca-Cola en la orden 1
GO

--devoluciones
INSERT INTO devolucion (ID_devolucion, cantidad, motivo, fecha_devolucion, ID_orden_s, ID_producto) VALUES
(1, 1, 'Producto dañado', '2025-06-03', 1, 1);
GO
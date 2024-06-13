#Creación de tablas

CREATE TABLE familia (
    codigo_familia BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre_familia VARCHAR(50) NOT NULL
);

SELECT * FROM familia;

CREATE TABLE producto(
		codigo_producto BIGINT AUTO_INCREMENT PRIMARY KEY,
		nombre_producto VARCHAR(50) NOT NULL,
		costo_producto DECIMAL(10, 2) NOT NULL,
		margen_producto DECIMAL(10, 4) NOT NULL,
		codigo_familia BIGINT NOT NULL,
		FOREIGN KEY (codigo_familia) REFERENCES familia(codigo_familia)
);

SELECT * FROM producto;

CREATE TABLE cliente(
		codigo_cliente BIGINT AUTO_INCREMENT PRIMARY KEY,
		nombre_cliente VARCHAR(50),
		telefono_cliente VARCHAR(9),
		mail_cliente VARCHAR(50),
		direccion_cliente VARCHAR(50)
);

SELECT * FROM cliente;

CREATE TABLE ventas(
		numero_factura BIGINT PRIMARY KEY,
		fecha_venta DATE NOT NULL,
		codigo_producto BIGINT NOT NULL,
		cantidad_venta BIGINT NOT NULL,
		codigo_cliente BIGINT NOT NULL
);

SELECT * FROM ventas;

# Modificar la tabla "cliente" para que los campos "nombre_cliente" y "telefono_cliente" sean obligatorios:

ALTER TABLE cliente
MODIFY nombre_cliente VARCHAR(50) NOT NULL;

ALTER TABLE cliente
MODIFY telefono_cliente VARCHAR(9) NOT NULL;

# Ingreso de registros en las tablas

INSERT INTO familia (nombre_familia) VALUES
('electrónico'),
('belleza'),
('juguetes'),
('accesorios'),
('ropa');

SELECT * FROM familia;

INSERT INTO producto (nombre_producto, costo_producto, margen_producto, codigo_familia) VALUES
-- Familia 1: Electrónico
('Teléfono Móvil', 199.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 1),
('Tablet', 299.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 1),
('Laptop', 799.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 1),
('Smartwatch', 149.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 1),
('Auriculares', 79.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 1),
('Altavoz Bluetooth', 49.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 1),
('Cámara Digital', 499.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 1),
('Impresora', 129.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 1),
('Monitor', 199.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 1),
('Teclado', 39.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 1),
-- Familia 2: Belleza
('Perfume', 49.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 2),
('Shampoo', 9.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 2),
('Crema Facial', 19.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 2),
('Labial', 14.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 2),
('Esmalte de Uñas', 4.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 2),
('Sérum', 24.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 2),
('Lima de Uñas', 2.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 2),
('Peine', 3.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 2),
('Mascarilla Facial', 12.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 2),
('Depiladora', 39.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 2),
-- Familia 3: Juguetes
('Muñeca', 19.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 3),
('Auto de Juguete', 14.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 3),
('Lego', 29.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 3),
('Pelota', 9.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 3),
('Peluche', 14.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 3),
('Rompecabezas', 12.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 3),
('Juego de Mesa', 24.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 3),
('Carrito a Control Remoto', 34.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 3),
('Juego de Bloques', 19.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 3),
('Avión de Juguete', 22.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 3),
-- Familia 4: Accesorios
('Bolso', 39.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 4),
('Reloj', 79.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 4),
('Gafas de Sol', 19.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 4),
('Sombrero', 14.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 4),
('Bufanda', 9.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 4),
('Cinturón', 12.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 4),
('Guantes', 9.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 4),
('Pulsera', 24.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 4),
('Collar', 29.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 4),
('Anillo', 19.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 4),
-- Familia 5: Ropa
('Camiseta', 14.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 5),
('Pantalones', 29.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 5),
('Chaqueta', 49.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 5),
('Vestido', 39.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 5),
('Zapatos', 59.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 5),
('Gorra', 9.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 5),
('Calcetines', 4.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 5),
('Suéter', 34.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 5),
('Falda', 24.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 5),
('Abrigo', 79.99, ROUND(RAND() * (0.40 - 0.25) + 0.25, 4), 5);

SELECT * FROM producto;

INSERT INTO cliente (nombre_cliente, telefono_cliente, mail_cliente, direccion_cliente) VALUES
('Juan Pérez', '1234-6781', NULL, 'Antigua Guatemala'),
('María García', '1234-6782', NULL, 'Antigua Guatemala'),
('Pedro Gómez', '1234-6783', NULL, 'Jocotenango'),
('Laura Fernández', '1234-6784', NULL, 'Antigua Guatemala'),
('Luis Martínez', '1234-6785', NULL, NULL),
('Ana Rodríguez', '1234-6786', NULL, NULL),
('Carlos López', '1234-6787', NULL, 'Antigua Guatemala'),
('Marta Sánchez', '1234-6788', NULL, 'Ciudad Vieja'),
('José Hernández', '1234-6789', NULL, 'Ciudad Vieja'),
('Elena Díaz', '1234-6780', NULL, 'Antigua Guatemala'),
('Sofía Torres', '1234-6781', 'sofia.torres@ejemplo.com', 'Antigua Guatemala'),
('Ricardo Ruiz', '1234-6782', 'ricardo.ruiz@ejemplo.com', 'Jocotenango'),
('Gabriela Ramírez', '1234-6783', 'gabriela.ramirez@ejemplo.com', 'Pastores'),
('David Castillo', '1234-6784', 'david.castillo@ejemplo.com', 'Antigua Guatemala'),
('Natalia Morales', '1234-6785', 'natalia.morales@ejemplo.com', 'Ciudad Vieja'),
('Miguel Ortiz', '1234-6786', 'miguel.ortiz@ejemplo.com', 'Antigua Guatemala'),
('Lucía Ibáñez', '1234-6787', 'lucia.ibanez@ejemplo.com', 'Antigua Guatemala'),
('Andrés Campos', '1234-6788', 'andres.campos@ejemplo.com', 'Antigua Guatemala'),
('Patricia Vázquez', '1234-6789', 'patricia.vazquez@ejemplo.com', 'Ciudad Vieja'),
('Sergio Guerrero', '1234-6780', 'sergio.guerrero@ejemplo.com', 'Jocotenango'),
('Isabel Molina', '1234-6781', 'isabel.molina@ejemplo.com', 'Ciudad Vieja'),
('Diego Méndez', '1234-6782', 'diego.mendez@ejemplo.com', 'Ciudad Vieja'),
('Paula Navarro', '1234-6783', 'paula.navarro@ejemplo.com', 'Pastores'),
('Tomás Vega', '1234-6784', 'tomas.vega@ejemplo.com', 'Antigua Guatemala'),
('Adriana Reyes', '1234-6785', 'adriana.reyes@ejemplo.com', 'Antigua Guatemala');

SELECT * FROM cliente;

SELECT * FROM ventas;
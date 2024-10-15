DROP DATABASE IF EXISTS supermercado;
CREATE DATABASE supermercado;
USE supermercado;

CREATE TABLE Articulo (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DOUBLE NOT NULL
);

CREATE TABLE ArticuloVenta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    articulo_codigo INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (articulo_codigo) REFERENCES Articulo(codigo)
);

CREATE TABLE Venta (
    nroTicket INT PRIMARY KEY,
    fechaCompra DATETIME NOT NULL,
    listaArticuloVenta INT,
    FOREIGN KEY (listaArticuloVenta) REFERENCES ArticuloVenta(id)
);

CREATE TABLE ArticuloStock (
    id INT PRIMARY KEY AUTO_INCREMENT,
    articulo_codigo INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (articulo_codigo) REFERENCES Articulo(codigo)
);

CREATE TABLE ListaArticulo (
    supermercado_id INT,
    articulo_codigo INT,
    PRIMARY KEY (supermercado_id, articulo_codigo),
    FOREIGN KEY (articulo_codigo) REFERENCES Articulo(codigo)
);

CREATE TABLE ListaArticuloStock (
    supermercado_id INT,
    articuloStock_id INT,
    PRIMARY KEY (supermercado_id, articuloStock_id),
    FOREIGN KEY (articuloStock_id) REFERENCES ArticuloStock(id)
);

CREATE TABLE Caja (
    numero INT PRIMARY KEY,
    listaVenta INT,
    FOREIGN KEY (listaVenta) REFERENCES Venta(nroTicket)
);

CREATE TABLE Supermercado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL
);

CREATE TABLE VectorCaja (
    supermercado_id INT,
    caja_numero INT,
    PRIMARY KEY (supermercado_id, caja_numero),
    FOREIGN KEY (caja_numero) REFERENCES Caja(numero),
    FOREIGN KEY (supermercado_id) REFERENCES Supermercado(id)
);

INSERT INTO Articulo (codigo, nombre, precio) VALUES (1, 'Leche', 1.50);
INSERT INTO Articulo (codigo, nombre, precio) VALUES (2, 'Pan', 0.80);
INSERT INTO Articulo (codigo, nombre, precio) VALUES (3, 'Queso', 3.25);
INSERT INTO Articulo (codigo, nombre, precio) VALUES (4, 'Café', 2.75);

INSERT INTO ArticuloStock (articulo_codigo, cantidad) VALUES (1, 50); 
INSERT INTO ArticuloStock (articulo_codigo, cantidad) VALUES (2, 100);
INSERT INTO ArticuloStock (articulo_codigo, cantidad) VALUES (3, 40); 
INSERT INTO ArticuloStock (articulo_codigo, cantidad) VALUES (4, 30); 

INSERT INTO Supermercado (nombre, direccion) VALUES ('Supermercado Central', 'Av. Principal 123');
INSERT INTO Supermercado (nombre, direccion) VALUES ('Supermercado Norte', 'Calle Secundaria 456');

INSERT INTO ListaArticulo (supermercado_id, articulo_codigo) VALUES (1, 1);
INSERT INTO ListaArticulo (supermercado_id, articulo_codigo) VALUES (1, 2);
INSERT INTO ListaArticulo (supermercado_id, articulo_codigo) VALUES (1, 3);
INSERT INTO ListaArticulo (supermercado_id, articulo_codigo) VALUES (2, 2);
INSERT INTO ListaArticulo (supermercado_id, articulo_codigo) VALUES (2, 4);

INSERT INTO Caja (numero, listaVenta) VALUES (1, NULL);
INSERT INTO Caja (numero, listaVenta) VALUES (2, NULL);

INSERT INTO VectorCaja (supermercado_id, caja_numero) VALUES (1, 1);
INSERT INTO VectorCaja (supermercado_id, caja_numero) VALUES (1, 2);

INSERT INTO VectorCaja (supermercado_id, caja_numero) VALUES (2, 1);

INSERT INTO Venta (nroTicket, fechaCompra, listaArticuloVenta) VALUES (1001, '2024-10-15 10:30:00', NULL);
INSERT INTO Venta (nroTicket, fechaCompra, listaArticuloVenta) VALUES (1002, '2024-10-15 11:00:00', NULL);

INSERT INTO ArticuloVenta (articulo_codigo, cantidad) VALUES (1, 2);
INSERT INTO ArticuloVenta (articulo_codigo, cantidad) VALUES (2, 5);

INSERT INTO ArticuloVenta (articulo_codigo, cantidad) VALUES (3, 1);

// Comentario
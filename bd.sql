
CREATE DATABASE nueva_base_datos;


CREATE TABLE Usuarios (
  id INT  PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  contrasena VARCHAR(255) NOT NULL,
  fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Productos (
  id INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(10, 2) NOT NULL,
  existencia INT NOT NULL DEFAULT 0
);
CREATE TABLE Pedidos (
  id INT  PRIMARY KEY,
  id_usuario INT NOT NULL,
  fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id)
);
CREATE TABLE Comentarios (
  id INT  PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_producto INT NOT NULL,
  comentario TEXT NOT NULL,
  fecha_comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id),
  FOREIGN KEY (id_producto) REFERENCES Productos(id)
);

CREATE TABLE Roles (
  id INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);



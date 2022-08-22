--
-- Base de datos: `banco`
--
-- DROP DATABASE IF EXISTS banco;
CREATE DATABASE banco;
USE banco;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `IDADMIN` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `IDUSUARIO` int(11) NOT NULL
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `IDCLIENTE` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `CEDULACLIENTE` varchar(15) NOT NULL UNIQUE,
  `NOMBRE` varchar(50) NOT NULL,
  `TELEFONO` varchar(15) NOT NULL,
  `IDCUENTA` int(11) NOT NULL,
  `IDUSUARIO` int(11) NOT NULL
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `IDCUENTA` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `NUMEROCTA` varchar(50) NOT NULL,
  `TITULAR` varchar(20) NOT NULL,
  `SALDO` double NOT NULL,
  `FECHAAPERTURA` DATE NOT NULL,
  `ESTADO` varchar(20) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IDUSUARIO` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `LOGIN` varchar(50) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `IDROL` int(11) NOT NULL
);

CREATE TABLE `rol` (
  `IDROL` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `NOMBRE` varchar(50) NOT NULL
);


ALTER table administrador 
ADD CONSTRAINT administrador_usuario
FOREIGN KEY (IDUSUARIO)
REFERENCES USUARIO(IDUSUARIO);


ALTER table cliente 
ADD CONSTRAINT cliente_usuario
FOREIGN KEY (IDUSUARIO)
REFERENCES USUARIO(IDUSUARIO) ON DELETE CASCADE;


ALTER table cliente 
ADD CONSTRAINT cliente_cuenta
FOREIGN KEY (IDCUENTA)
REFERENCES cuenta(idcuenta) ON DELETE CASCADE;

ALTER table usuario 
ADD CONSTRAINT usuario_rol
FOREIGN KEY (IDROL)
REFERENCES rol(idROL);

INSERT INTO rol VALUES (null, 'Administrador'),(null, 'cliente');

INSERT INTO `cuenta`(`NUMEROCTA`, `TITULAR`, `SALDO`, `FECHAAPERTURA`, `ESTADO`) VALUES ('123','Prueba','3120000', now(),'Abierta');

INSERT INTO `usuario` (`IDUSUARIO`, `LOGIN`, `PASSWORD`, `IDROL`) VALUES (NULL, 'Prueba', '123', '1');

INSERT INTO `cliente`(`CEDULACLIENTE`, `NOMBRE`, `TELEFONO`, `IDCUENTA`, `IDUSUARIO`) VALUES ('1234567890', 'Prueba','3124561245', 1,1)

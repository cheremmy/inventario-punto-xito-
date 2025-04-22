-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: base_de_datos_.exito
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `almacenan`
--

DROP TABLE IF EXISTS `almacenan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacenan` (
  `ID_Cantidad_Almacenada` int NOT NULL,
  `ID_Orden de entrada` int NOT NULL,
  `ID_Producto` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`ID_Cantidad_Almacenada`),
  KEY `ID_orden de entrada1_idx` (`ID_Orden de entrada`),
  KEY `ID_Producto2_idx` (`ID_Producto`),
  CONSTRAINT `ID_orden de entrada1` FOREIGN KEY (`ID_Orden de entrada`) REFERENCES `orden_de_entrada` (`ID_Orden de entrada`),
  CONSTRAINT `ID_Producto2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacenan`
--

LOCK TABLES `almacenan` WRITE;
/*!40000 ALTER TABLE `almacenan` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacenan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_Cliente` int NOT NULL,
  `ID_Orden de salida` int NOT NULL,
  `ID_producto` int NOT NULL,
  PRIMARY KEY (`ID_Cliente`),
  KEY `ID_Orden de salida _idx` (`ID_Orden de salida`),
  KEY `ID_Producto1_idx` (`ID_producto`),
  CONSTRAINT `ID_Orden de salida ` FOREIGN KEY (`ID_Orden de salida`) REFERENCES `orden_de_salida` (`ID_Orden de salida`),
  CONSTRAINT `ID_Producto1` FOREIGN KEY (`ID_producto`) REFERENCES `producto` (`ID_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expiden`
--

DROP TABLE IF EXISTS `expiden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expiden` (
  `ID_Cantidad_expedida` varchar(45) NOT NULL,
  `ID_Orden de salida` int NOT NULL,
  `ID_Producto` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`ID_Cantidad_expedida`),
  KEY `ID_orden de salida _idx` (`ID_Orden de salida`),
  KEY `ID_Producto3_idx` (`ID_Producto`),
  CONSTRAINT `ID_orden de salida1` FOREIGN KEY (`ID_Orden de salida`) REFERENCES `orden_de_salida` (`ID_Orden de salida`),
  CONSTRAINT `ID_Producto3` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expiden`
--

LOCK TABLES `expiden` WRITE;
/*!40000 ALTER TABLE `expiden` DISABLE KEYS */;
/*!40000 ALTER TABLE `expiden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_de_entrada`
--

DROP TABLE IF EXISTS `orden_de_entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_de_entrada` (
  `ID_Orden de entrada` int NOT NULL,
  `fecha de entrada` datetime NOT NULL,
  `tipo de entrada` varchar(45) NOT NULL,
  `ID_Usuario` int NOT NULL,
  PRIMARY KEY (`ID_Orden de entrada`),
  KEY `FK_Usuario _idx` (`ID_Usuario`),
  CONSTRAINT `FK-usuario ` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_de_entrada`
--

LOCK TABLES `orden_de_entrada` WRITE;
/*!40000 ALTER TABLE `orden_de_entrada` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_de_entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_de_salida`
--

DROP TABLE IF EXISTS `orden_de_salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_de_salida` (
  `ID_Orden de salida` int NOT NULL,
  `fecha de salida` date NOT NULL,
  `tipo de salida` varchar(45) NOT NULL,
  `ID_Producto` int NOT NULL,
  `ID_Usuario` int NOT NULL,
  PRIMARY KEY (`ID_Orden de salida`),
  KEY `ID_producto _idx` (`ID_Producto`),
  KEY `ID_Usuario1_idx` (`ID_Usuario`),
  CONSTRAINT `ID_producto ` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_producto`),
  CONSTRAINT `ID_Usuario1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_de_salida`
--

LOCK TABLES `orden_de_salida` WRITE;
/*!40000 ALTER TABLE `orden_de_salida` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_de_salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `ID_producto` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `precio` float NOT NULL,
  `stock_minimo` int NOT NULL,
  `stock_maximo` int NOT NULL,
  `fecha_caducidad` date NOT NULL,
  `ID_Proveedor` int NOT NULL,
  PRIMARY KEY (`ID_producto`),
  KEY `FK_Proveedor _idx` (`ID_Proveedor`),
  CONSTRAINT `FK_Proveedor ` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedores` (`ID_Proveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `ID_Proveedores` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `contacto` varchar(45) NOT NULL,
  `ID_Usuario` int NOT NULL,
  PRIMARY KEY (`ID_Proveedores`),
  KEY `FK_Usuario_idx` (`ID_Usuario`),
  CONSTRAINT `FK_Usuario` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID_Usuario` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `rol` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `contraseña` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `fecha de nacimiento` date NOT NULL,
  PRIMARY KEY (`ID_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-21  1:44:59

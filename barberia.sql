-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: barberia
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `barbero`
--

DROP TABLE IF EXISTS `barbero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barbero` (
  `id_barbero` int NOT NULL AUTO_INCREMENT,
  `nom_barbero` varchar(80) DEFAULT NULL,
  `correo_barbero` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_barbero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barbero`
--

LOCK TABLES `barbero` WRITE;
/*!40000 ALTER TABLE `barbero` DISABLE KEYS */;
INSERT INTO `barbero` VALUES (1,'Yesid','yesid@123'),(2,'Alex','Alex@123');
/*!40000 ALTER TABLE `barbero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_producto`
--

DROP TABLE IF EXISTS `categoria_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_producto` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nom_categoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_producto`
--

LOCK TABLES `categoria_producto` WRITE;
/*!40000 ALTER TABLE `categoria_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita` (
  `id_cita` int NOT NULL AUTO_INCREMENT,
  `id_cliente_fk` int NOT NULL,
  `id_barbero_fk` int NOT NULL,
  `fecha_cita` date DEFAULT NULL,
  `id_TipodePago_fk` int NOT NULL,
  `id_tipo_depago_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_cita`),
  KEY `cita_cliente_idx` (`id_cliente_fk`),
  KEY `cita_fk_barbero_idx` (`id_barbero_fk`),
  KEY `cita_fk_tipopago_idx` (`id_TipodePago_fk`),
  KEY `FKtj4qkvvmjjd0qjw9jp8ytcq40` (`id_tipo_depago_fk`),
  CONSTRAINT `cita_fk_barbero` FOREIGN KEY (`id_barbero_fk`) REFERENCES `barbero` (`id_barbero`),
  CONSTRAINT `cita_fk_cliente` FOREIGN KEY (`id_cliente_fk`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `cita_fk_tipopago` FOREIGN KEY (`id_TipodePago_fk`) REFERENCES `tipodepago` (`id_TipoDePago`),
  CONSTRAINT `FKtj4qkvvmjjd0qjw9jp8ytcq40` FOREIGN KEY (`id_tipo_depago_fk`) REFERENCES `tipo_de_pago` (`id_tipo_de_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nom_cliente` varchar(80) DEFAULT NULL,
  `telefono` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_serv`
--

DROP TABLE IF EXISTS `detalle_serv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_serv` (
  `id_detalleServ` int NOT NULL,
  `id_cita_fk` int NOT NULL,
  `id_servicio` int NOT NULL,
  `id_detalle_serv` int NOT NULL,
  PRIMARY KEY (`id_detalleServ`),
  KEY `detalleServ_fk_cita_idx` (`id_cita_fk`),
  KEY `detalleServ_fk_servicio_idx` (`id_servicio`),
  CONSTRAINT `detalleServ_fk_cita` FOREIGN KEY (`id_cita_fk`) REFERENCES `cita` (`id_cita`),
  CONSTRAINT `detalleServ_fk_servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_serv`
--

LOCK TABLES `detalle_serv` WRITE;
/*!40000 ALTER TABLE `detalle_serv` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_serv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `id_producto_fk` int NOT NULL,
  `fecha_inventario` datetime NOT NULL,
  `cantidad_produc` int DEFAULT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `inventario_fk_producto_idx` (`id_producto_fk`),
  CONSTRAINT `inventario_fk_producto` FOREIGN KEY (`id_producto_fk`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nom_producto` varchar(45) DEFAULT NULL,
  `precio_producto` float DEFAULT NULL,
  `id_proveedor_fk` int NOT NULL,
  `id_categoria_fk` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `producto_fk_proveedor_idx` (`id_proveedor_fk`),
  KEY `producto_fk_categoria_idx` (`id_categoria_fk`),
  CONSTRAINT `producto_fk_categoria` FOREIGN KEY (`id_categoria_fk`) REFERENCES `categoria_producto` (`id_categoria`),
  CONSTRAINT `producto_fk_proveedor` FOREIGN KEY (`id_proveedor_fk`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nom_proveedor` varchar(45) DEFAULT NULL,
  `tel_proveedor` varchar(45) DEFAULT NULL,
  `email_proveedor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `nom_servicio` varchar(100) DEFAULT NULL,
  `valor_servicio` float NOT NULL,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_pago`
--

DROP TABLE IF EXISTS `tipo_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_de_pago` (
  `id_tipo_de_pago` int NOT NULL,
  `detalle_de_pago` varchar(255) DEFAULT NULL,
  `nom_tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_de_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_pago`
--

LOCK TABLES `tipo_de_pago` WRITE;
/*!40000 ALTER TABLE `tipo_de_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_de_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodepago`
--

DROP TABLE IF EXISTS `tipodepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipodepago` (
  `id_TipoDePago` int NOT NULL AUTO_INCREMENT,
  `nom_tipo` varchar(45) DEFAULT NULL,
  `detalle_dePago` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_TipoDePago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodepago`
--

LOCK TABLES `tipodepago` WRITE;
/*!40000 ALTER TABLE `tipodepago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipodepago` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-12 11:51:53

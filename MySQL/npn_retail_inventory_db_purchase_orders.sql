-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: npn_retail_inventory_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `purchase_orders`
--

DROP TABLE IF EXISTS `purchase_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_orders` (
  `po_number` varchar(30) NOT NULL,
  `supplier_code` varchar(20) NOT NULL,
  `supplier_po_no` varchar(40) DEFAULT NULL,
  `sku` varchar(30) NOT NULL,
  `warehouse_code` varchar(12) NOT NULL,
  `ordered_qty` int NOT NULL,
  `unit_cost` decimal(12,2) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `idempotency_key` varchar(80) NOT NULL,
  `requested_date` date DEFAULT NULL,
  `confirmed_date` date DEFAULT NULL,
  `raised_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `active_status_guard` varchar(20) GENERATED ALWAYS AS ((case when (`status` in (_utf8mb4'RAISED',_utf8mb4'CONFIRMED',_utf8mb4'PARTIAL')) then `status` else NULL end)) STORED,
  PRIMARY KEY (`po_number`),
  UNIQUE KEY `uq_po_idem` (`idempotency_key`),
  UNIQUE KEY `uq_po_open_sku` (`sku`,`warehouse_code`,`active_status_guard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_orders`
--

LOCK TABLES `purchase_orders` WRITE;
/*!40000 ALTER TABLE `purchase_orders` DISABLE KEYS */;
INSERT INTO `purchase_orders` (`po_number`, `supplier_code`, `supplier_po_no`, `sku`, `warehouse_code`, `ordered_qty`, `unit_cost`, `status`, `idempotency_key`, `requested_date`, `confirmed_date`, `raised_at`) VALUES ('PO-MANUAL-000','SUP-001',NULL,'SKU-HOME-5013','WHHYD01',50,NULL,'SUBMITTED','135fbfa2-e15e-4766-8669-dfd61c88c177',NULL,NULL,'2026-10-15 17:31:36');
/*!40000 ALTER TABLE `purchase_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-16 12:10:52

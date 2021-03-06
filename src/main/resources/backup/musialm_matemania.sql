-- MySQL dump 10.19  Distrib 10.3.28-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: musialm_matemania
-- ------------------------------------------------------
-- Server version	10.3.28-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (53);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic_layer_1`
--

DROP TABLE IF EXISTS `topic_layer_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic_layer_1` (
  `id_layer_1` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp(),
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`id_layer_1`),
  UNIQUE KEY `unique_orderid_layer_1` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_layer_1`
--

LOCK TABLES `topic_layer_1` WRITE;
/*!40000 ALTER TABLE `topic_layer_1` DISABLE KEYS */;
INSERT INTO `topic_layer_1` VALUES (1,1,'Licealista','a',1,'2020-08-07','2021-02-19'),(2,4,'Maturzysta','a',1,'2020-08-07','2020-12-27'),(3,5,'Studia','a',1,'2020-08-11','2020-12-30'),(8,6,'Pusty layer 1','a',0,'2020-12-30','2021-01-19'),(9,7,'test5','',0,'2020-12-30','2021-01-19'),(12,9,'t3','',0,'2020-12-30','2020-12-30'),(14,2,'w2','',0,'2020-12-30','2021-01-26'),(15,3,'w5','',0,'2020-12-30','2020-12-30'),(29,8,'t4','',0,'2020-12-30',NULL),(41,10,'Psycholog','',0,'2021-01-07','2021-01-19');
/*!40000 ALTER TABLE `topic_layer_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic_layer_2`
--

DROP TABLE IF EXISTS `topic_layer_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic_layer_2` (
  `id_layer_2` int(10) NOT NULL AUTO_INCREMENT,
  `fk_id_layer_1` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `fe_menu_icon` varchar(100) DEFAULT NULL,
  `fe_menu_color` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `counter_layer_4` int(10) DEFAULT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp(),
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`id_layer_2`),
  UNIQUE KEY `unique_orderid_layer_2` (`fk_id_layer_1`,`order_id`),
  CONSTRAINT `topic_layer_2_ibfk_1` FOREIGN KEY (`fk_id_layer_1`) REFERENCES `topic_layer_1` (`id_layer_1`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_layer_2`
--

LOCK TABLES `topic_layer_2` WRITE;
/*!40000 ALTER TABLE `topic_layer_2` DISABLE KEYS */;
INSERT INTO `topic_layer_2` VALUES (2,2,1,'Teoria',NULL,'ion-calculator','bg-green',1,0,'2020-08-11',NULL),(3,1,1,'Wiedza','','ion-calculator','bg-red',1,12,'2020-08-11','2021-05-10'),(4,1,2,'Praktyka','','ion-calculator','bg-red',1,0,'2020-08-11','2021-05-10'),(5,2,4,'Matura 2020','','ion-calculator','bg-green',1,0,'2020-08-11','2020-12-30'),(6,3,1,'Całki',NULL,'ion-calculator','bg-yellow',1,0,'2020-08-11','2020-12-29'),(10,2,2,'Trening',NULL,'ion-calculator','bg-green',1,0,'2020-08-12',NULL),(11,2,3,'Zadania CKE',NULL,'ion-calculator','bg-green',1,0,'2020-08-12',NULL),(13,1,98,'w2','',NULL,NULL,0,0,'2020-12-30','2020-12-30'),(16,2,5,'matura 2021','','ion-calculator','bg-green',1,0,'2020-12-30','2020-12-30'),(17,3,2,'Różniczki','','ion-calculator','bg-yellow',1,0,'2020-12-30','2020-12-30'),(31,1,4,'Zadania trudne','','ion-calculator','bg-red',1,0,'2020-12-30','2020-12-30'),(32,14,1,'nowe_pod_w2','',NULL,NULL,1,0,'2021-01-02','2021-01-26'),(33,8,1,'Pusty layer 2','',NULL,NULL,1,2,'2021-01-02','2021-01-02'),(42,41,1,'Psycholog kliniczny','',NULL,NULL,1,1,'2021-01-07','2021-01-07');
/*!40000 ALTER TABLE `topic_layer_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic_layer_3`
--

DROP TABLE IF EXISTS `topic_layer_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic_layer_3` (
  `id_layer_3` int(10) NOT NULL AUTO_INCREMENT,
  `fk_id_layer_2` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `fe_menu_icon` varchar(100) DEFAULT NULL,
  `fe_menu_color` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp(),
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`id_layer_3`),
  UNIQUE KEY `unique_orderid_layer_3` (`fk_id_layer_2`,`order_id`),
  CONSTRAINT `topic_layer_3_ibfk_1` FOREIGN KEY (`fk_id_layer_2`) REFERENCES `topic_layer_2` (`id_layer_2`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_layer_3`
--

LOCK TABLES `topic_layer_3` WRITE;
/*!40000 ALTER TABLE `topic_layer_3` DISABLE KEYS */;
INSERT INTO `topic_layer_3` VALUES (2,3,1,'Liczby                 ','','ion-calculator','bg-red',1,'2020-08-12','2021-02-24'),(3,3,2,'Potęgi i pierwiastki','','ion-calculator','bg-red',1,'2020-08-12','2021-05-15'),(4,4,1,'zad 1',NULL,NULL,NULL,1,'2020-08-12',NULL),(5,3,3,'Logarytmy',NULL,'ion-calculator','bg-red',1,'2020-08-12',NULL),(6,6,1,'oznaczone',NULL,NULL,NULL,1,'2020-08-12','2020-12-29'),(7,6,2,'nieoznaczone',NULL,NULL,NULL,1,'2020-08-12',NULL),(8,3,4,'Procenty',NULL,'ion-calculator','bg-red',1,'2020-08-13',NULL),(9,3,5,'Wartość bezwzględna','','ion-calculator','bg-red',1,'2020-08-13','2021-02-01'),(10,3,6,'Równania i nierówności',NULL,'ion-calculator','bg-red',1,'2020-08-13',NULL),(11,3,8,'Funkcja liniowa',NULL,'ion-calculator','bg-red',1,'2020-08-13',NULL),(12,3,9,'Funkcja kwadratowa',NULL,'ion-calculator','bg-red',1,'2020-08-13',NULL),(13,3,10,'Warażenia algebraiczne',NULL,'ion-calculator','bg-red',1,'2020-08-13',NULL),(14,3,7,'Funkcje',NULL,'ion-calculator','bg-red',1,'2020-08-13','2020-12-28'),(15,3,11,'Trygonometria',NULL,'ion-calculator','bg-red',1,'2020-08-13',NULL),(16,3,12,'Ciągi',NULL,'ion-calculator','bg-red',1,'2020-08-13',NULL),(17,3,13,'Planimetria',NULL,'ion-calculator','bg-red',1,'2020-08-13',NULL),(18,3,14,'Stereometria',NULL,'ion-calculator','bg-red',1,'2020-08-13',NULL),(19,3,15,'Statystyka',NULL,'ion-calculator','bg-red',1,'2020-08-13',NULL),(20,3,16,'Kombinatoryka',NULL,'ion-calculator','bg-red',1,'2020-08-13','2020-12-28'),(21,3,17,'Prawdopodobieństwo',NULL,'ion-calculator','bg-red',1,'2020-08-13','2020-12-28'),(22,3,18,'Geometria analityczna',NULL,'ion-calculator','bg-red',1,'2020-08-13','2020-12-28'),(23,3,19,'Dowody geometria',NULL,'ion-calculator','bg-red',1,'2020-08-13',NULL),(24,3,20,'Dowody algebra',NULL,'ion-calculator','bg-red',1,'2020-08-13',NULL),(25,3,21,'21','',NULL,NULL,1,'2020-12-30','2021-02-19'),(26,4,2,'zad2','',NULL,NULL,1,'2020-12-30','2020-12-30'),(34,33,1,'pusty layer 3','',NULL,NULL,1,'2021-01-02','2021-01-02'),(43,42,1,'1','',NULL,NULL,1,'2021-01-07','2021-01-07'),(44,42,2,'2','',NULL,NULL,1,'2021-01-07','2021-01-07');
/*!40000 ALTER TABLE `topic_layer_3` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`musialm_matemania`@`%`*/ /*!50003 trigger after_insert_topic_layer_3
    after insert
    on topic_layer_3
    for each row
begin
    update topic_layer_2 t2_master,
        (select t2.id_layer_2 as layer2id, count(*) l4_counter
         from topic_layer_4 t4,
              topic_layer_3 t3,
              topic_layer_2 t2
         where t2.id_layer_2 = t3.fk_id_layer_2
           and t4.fk_id_layer_3 = t3.id_layer_3
           and t4.is_active = 1
           and t3.is_active = 1
         group by t2.id_layer_2) as counter_to_update
    set t2_master.counter_layer_4 = counter_to_update.l4_counter
    where t2_master.id_layer_2 = counter_to_update.layer2id;
    update topic_layer_2 set counter_layer_4 = 0 where counter_layer_4 is null;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`musialm_matemania`@`%`*/ /*!50003 trigger after_update_topic_layer_3
    after update
    on topic_layer_3
    for each row
begin
    update topic_layer_2 t2_master,
        (select t2.id_layer_2 as layer2id, count(*) l4_counter
         from topic_layer_4 t4,
              topic_layer_3 t3,
              topic_layer_2 t2
         where t2.id_layer_2 = t3.fk_id_layer_2
           and t4.fk_id_layer_3 = t3.id_layer_3
           and t4.is_active = 1
           and t3.is_active = 1
         group by t2.id_layer_2) as counter_to_update
    set t2_master.counter_layer_4 = counter_to_update.l4_counter
    where t2_master.id_layer_2 = counter_to_update.layer2id;
    update topic_layer_2 set counter_layer_4 = 0 where counter_layer_4 is null;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`musialm_matemania`@`%`*/ /*!50003 trigger after_delete_topic_layer_3
    after delete
    on topic_layer_3
    for each row
begin
    update topic_layer_2 t2_master,
        (select t2.id_layer_2 as layer2id, count(*) l4_counter
         from topic_layer_4 t4,
              topic_layer_3 t3,
              topic_layer_2 t2
         where t2.id_layer_2 = t3.fk_id_layer_2
           and t4.fk_id_layer_3 = t3.id_layer_3
           and t4.is_active = 1
           and t3.is_active = 1
         group by t2.id_layer_2) as counter_to_update
    set t2_master.counter_layer_4 = counter_to_update.l4_counter
    where t2_master.id_layer_2 = counter_to_update.layer2id;
    update topic_layer_2 set counter_layer_4 = 0 where counter_layer_4 is null;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `topic_layer_4`
--

DROP TABLE IF EXISTS `topic_layer_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic_layer_4` (
  `id_layer_4` int(10) NOT NULL AUTO_INCREMENT,
  `fk_id_layer_3` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `content` text DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp(),
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`id_layer_4`),
  UNIQUE KEY `unique_orderid_layer_4` (`fk_id_layer_3`,`order_id`),
  CONSTRAINT `topic_layer_4_ibfk_1` FOREIGN KEY (`fk_id_layer_3`) REFERENCES `topic_layer_3` (`id_layer_3`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_layer_4`
--

LOCK TABLES `topic_layer_4` WRITE;
/*!40000 ALTER TABLE `topic_layer_4` DISABLE KEYS */;
INSERT INTO `topic_layer_4` VALUES (1,2,1,'Podział i rodzaje liczb','\r\n                \r\n                \r\n                <p>\r\n                \r\n                \r\n                \r\n                \r\n                \r\n                </p><p>Wyróżniamy kilka rodzajów liczb:<br></p><ul><li>Naturalne (oznaczane duża literą N)<br></li><li>Całkowite (oznaczane dużą literą C)<br></li><li>Wymierne (oznaczane dużą literą W)<br></li><li>Niewymierne (oznaczane jako NW)</li></ul><p>Wszystkie wyżej wymienone rodzaje liczb tworzą razem zbiór liczb Rzeczywistych (R)<br></p><p>Zależność pomiędzy poszczególnymi liczbami przestawia poniższy obrazek. Warto zauważyć że:</p><ul><li>każda liczba naturalna (np: 5, 16, 27) jest też liczbą całkowitą i wymierną</li><li>każda liczba całkowita (np: -5,-17,10) jest też liczbą wymierną</li></ul><p>Nie działa to w drugą stronę, to znaczy:</p><ul><li>nie każda liczba całkowita (np: -12) jest liczbą naturalną</li><li>nie każda liczba wymierna (np:&nbsp; <img src=\"https://latex.codecogs.com/gif.latex?\\frac{3}{4}\" title=\"\\frac{3}{4}\"> ) jest liczbą całkowitą lub naturalną</li></ul><hr><p>Liczby <b>naturalne </b>to: 0,1,2,3,4.... </p><p>Liczby naturalne \r\noznaczamy literą dużą literą N. Najczęściej przyjmuje się że zero \r\nzawiera się w zbiorze liczb naturalnych, chyba że jest wprost \r\npowiedziane że rozpartujemy zbiór liczb naturalnych dodatnich \r\n(1,2,3,4...)</p><p>Zbiór liczb naturalnych posiada najmniejszą liczbę \r\n(0), nie posiada natomiast liczby największej (zawsze istnieje liczba \r\nwiększa od danej liczby) - możemy więc powiedzieć że zbiór liczb \r\nnaturalych jest <b>nieskończony</b>.</p><hr><p>Liczby <b>całkowite </b>to liczby naturalne wraz z liczbami do nich przeciwnymi (włącznie z zerem):</p><p>... ,-15,-14, ... , -7, ... , -1,0,1,2,3, ... , 18,19, ....</p>Zbiór\r\n liczb całkowitych nie posiada liczby najmniejszej i największej - jest \r\nzatem, podobnie jak zbiór liczb naturalnych, nieskończony.\r\n            \r\n            \r\n            \r\n            \r\n            \r\n            <hr><p>\r\n                \r\n                \r\n                \r\n                Liczby <b>wymierne </b>to liczby które można zapisać w postaci ułamka zwykłego <img src=\"https://latex.codecogs.com/gif.latex?\\frac{m}{n}\" title=\"\\frac{m}{n}\">, gdzie m i n są liczbami całkowitymi i jednocześnie <img src=\"https://latex.codecogs.com/gif.latex?n\\neq&amp;space;0\" title=\"n\\neq 0\"><br>\r\n            \r\n            \r\n            \r\n            \r\n            \r\n            </p><p>Przykłady liczb wymiernych:&nbsp; <img src=\"https://latex.codecogs.com/gif.latex?-5;&amp;space;0;&amp;space;7;&amp;space;\\frac{1}{2};&amp;space;-\\frac{7}{5};&amp;space;\\frac{32}{9};&amp;space;0,234;&amp;space;0,(3)\" title=\"-5; 0; 7; \\frac{1}{2}; -\\frac{7}{5}; \\frac{32}{9}; 0,234; 0,(3)\"></p><hr><p>Liczby <b>niewymierne </b>to liczby które nie można przedstawić w postaci ułamka zwykłego <img src=\"https://latex.codecogs.com/gif.latex?\\frac{a}{b}\" title=\"\\frac{a}{b}\"></p><p>Przykłady liczb niewymiernych: <img src=\"https://latex.codecogs.com/gif.latex?\\sqrt{2};&amp;space;-\\sqrt[3]{5};&amp;space;\\Pi;&amp;space;-1+\\sqrt{6}\" title=\"\\sqrt{2}; -\\sqrt[3]{5}; \\Pi; -1+\\sqrt{6}\"></p><hr><p>Liczby <b>pierwsze </b>to liczby które dzielą się tylko przez 1 i przez siebie. Najmniejszą liczbą pierwszą jest liczba 2.</p><p>Przykłady liczb pierwszych: 2,3,5,7,11,13,17,19</p><hr><p>Liczby <b>złożone </b>to liczby które nie są liczbami pierwszymi.</p><p>Przykłady liczb złożonych: 4,6,9,25,98<br></p>\r\n            \r\n            \r\n            ','',1,'2020-08-20','2021-05-16'),(2,2,2,'Działania na liczbach','\r\n                <p>Poniższa tabela przedstawia własności dodawania i mnożenia:</p><p></p><table class=\"table table-bordered\"><tbody><tr><td><b>Własności dodawania</b><br></td><td>przykład<br></td></tr><tr><td>łączność<br></td><td><img src=\"https://latex.codecogs.com/gif.latex?(a&amp;space;+&amp;space;b)&amp;space;+&amp;space;c&amp;space;=&amp;space;a&amp;space;+&amp;space;(b&amp;space;+&amp;space;c)\" title=\"(a + b) + c = a + (b + c)\"><br></td></tr><tr><td>przemienność<br></td><td><img src=\"https://latex.codecogs.com/gif.latex?(a&amp;space;+&amp;space;b)&amp;space;=&amp;space;b&amp;space;+&amp;space;a\" title=\"(a + b) = b + a\"><br></td></tr><tr><td>element neutralny: 0<br></td><td><img src=\"https://latex.codecogs.com/gif.latex?a&amp;space;+&amp;space;0&amp;space;=&amp;space;0&amp;space;+&amp;space;a&amp;space;=&amp;space;a\" title=\"a + 0 = 0 + a = a\"><br></td></tr><tr><td>liczba przeciwna do a: -a<br></td><td><img src=\"https://latex.codecogs.com/gif.latex?a&amp;space;+&amp;space;(-a)&amp;space;=&amp;space;0\" title=\"a + (-a) = 0\"><br></td></tr><tr><td><b>Własności mnożenia</b><br></td><td><br></td></tr><tr><td>łaczność<br></td><td><img src=\"https://latex.codecogs.com/gif.latex?(a&amp;space;*&amp;space;b)&amp;space;*&amp;space;c&amp;space;=&amp;space;a&amp;space;*&amp;space;(b&amp;space;*&amp;space;c)\" title=\"(a * b) * c = a * (b * c)\"><br></td></tr><tr><td>przemienność<br></td><td><img src=\"https://latex.codecogs.com/gif.latex?a&amp;space;*&amp;space;b&amp;space;=&amp;space;b&amp;space;*&amp;space;a\" title=\"a * b = b * a\"><br></td></tr><tr><td>element neutralny: 1<br></td><td><img src=\"https://latex.codecogs.com/gif.latex?a&amp;space;*&amp;space;1&amp;space;=&amp;space;1&amp;space;*&amp;space;a&amp;space;=&amp;space;a\" title=\"a * 1 = 1 * a = a\"><br></td></tr><tr><td>liczb odwrotna do a:&nbsp; <img src=\"https://latex.codecogs.com/gif.latex?\\frac{1}{a}\" title=\"\\frac{1}{a}\"><br></td><td><img src=\"https://latex.codecogs.com/gif.latex?a&amp;space;*&amp;space;\\frac{1}{a}&amp;space;=&amp;space;1\" title=\"a * \\frac{1}{a} = 1\"><br></td></tr></tbody></table><p><br></p><p>Wnioski z własności działań na liczbach:</p><ul><li>różnicę dwóch liczb można zastąpić dodawaniem, np: <img src=\"https://latex.codecogs.com/gif.latex?5&amp;space;-&amp;space;2&amp;space;=&amp;space;5&amp;space;+&amp;space;(-2)\" title=\"5 - 2 = 5 + (-2)\"></li><li>iloraz (dzielenie) dwóch liczb możemy zastapić mnożeniem, np: <img src=\"https://latex.codecogs.com/gif.latex?5&amp;space;:&amp;space;2&amp;space;=&amp;space;5&amp;space;*&amp;space;\\frac{1}{2}\" title=\"5 : 2 = 5 * \\frac{1}{2}\"></li><li>jeżeli iloczyn kilku czynników jest równy zero, to przynajmniej jeden z czynników jest równy zero<br></li></ul>\r\n            <p></p>\r\n            ','',1,'2020-08-20','2021-04-20'),(3,2,99,'Liczby całkowite','\r\n                \r\n                \r\n                \r\n                \r\n                <p>Liczby <b>całkowite </b>to liczby naturalne wraz z liczbami do nich przeciwnymi (włącznie z zerem):</p><p>... ,-15,-14, ... , -7, ... , -1,0,1,2,3, ... , 18,19, ....</p><p>Zbiór liczb całkowitych nie posiada liczby najmniejszej i największej - jest zatem, podobnie jak zbiór liczb naturalnych, nieskończony.<br></p>\r\n            \r\n            \r\n            \r\n            \r\n            ','',0,'2020-08-20','2021-05-06'),(4,2,98,'Liczby wymierne','\r\n                \r\n                \r\n                \r\n                \r\n                \r\n                <p>\r\n                \r\n                \r\n                \r\n                Liczby <b>wymierne </b>to liczby które można zapisać w postaci ułamka zwykłego <img src=\"https://latex.codecogs.com/gif.latex?\\frac{m}{n}\" title=\"\\frac{m}{n}\">, gdzie m i n są liczbami całkowitymi i jednocześnie <img src=\"https://latex.codecogs.com/gif.latex?n\\neq&space;0\" title=\"n\\neq 0\"><br>\r\n            \r\n            \r\n            \r\n            \r\n            \r\n            </p><p>Przykłady liczb wymiernych:  <img src=\"https://latex.codecogs.com/gif.latex?-5;&space;0;&space;7;&space;\\frac{1}{2};&space;-\\frac{7}{5};&space;\\frac{32}{9};&space;0,234;&space;0,(3)\" title=\"-5; 0; 7; \\frac{1}{2}; -\\frac{7}{5}; \\frac{32}{9}; 0,234; 0,(3)\"></p><br>\r\n            \r\n            \r\n            \r\n            ','',0,'2020-08-20','2021-05-10'),(27,2,134,'Podział i rodzaje liczb','<p>\r\n                \r\n                \r\n                \r\n                \r\n                \r\n                <p>Wyróżniamy kilka rodzajów liczb:<br></p><ul><li>Naturalne (oznaczane duża literą N)<br></li><li>Całkowite (oznaczane dużą literą C)<br></li><li>Wymierne (oznaczane dużą literą W)<br></li><li>Niewymierne (oznaczane jako NW)</li></ul><p>Wszystkie wyżej wymienone rodzaje liczb tworzą razem zbiór liczb Rzeczywistych (R)<br></p><p>Zależność pomiędzy poszczególnymi liczbami przestawia poniższy obrazek. Warto zauważyć że:</p><ul><li>każda liczba naturalna (np: 5, 16, 27) jest też liczbą całkowitą i wymierną</li><li>każda liczba całkowita (np: -5,-17,10) jest też liczbą wymierną</li></ul><p>Nie działa to w drugą stronę, to znaczy:</p><ul><li>nie każda liczba całkowita (np: -12) jest liczbą naturalną</li><li>nie każda liczba wymierna (np:&nbsp; <img src=\"https://latex.codecogs.com/gif.latex?\\frac{3}{4}\" title=\"\\frac{3}{4}\"> ) jest liczbą całkowitą lub naturalną</li></ul><hr><p>Liczby <b>naturalne </b>to: 0,1,2,3,4.... </p><p>Liczby naturalne \r\noznaczamy literą dużą literą N. Najczęściej przyjmuje się że zero \r\nzawiera się w zbiorze liczb naturalnych, chyba że jest wprost \r\npowiedziane że rozpartujemy zbiór liczb naturalnych dodatnich \r\n(1,2,3,4...)</p><p>Zbiór liczb naturalnych posiada najmniejszą liczbę \r\n(0), nie posiada natomiast liczby największej (zawsze istnieje liczba \r\nwiększa od danej liczby) - możemy więc powiedzieć że zbiór liczb \r\nnaturalych jest <b>nieskończony</b>.</p><hr><p>Liczby <b>całkowite </b>to liczby naturalne wraz z liczbami do nich przeciwnymi (włącznie z zerem):</p><p>... ,-15,-14, ... , -7, ... , -1,0,1,2,3, ... , 18,19, ....</p>Zbiór\r\n liczb całkowitych nie posiada liczby najmniejszej i największej - jest \r\nzatem, podobnie jak zbiór liczb naturalnych, nieskończony.\r\n            \r\n            \r\n            \r\n            \r\n            \r\n            </p><hr><p>\r\n                \r\n                \r\n                \r\n                Liczby <b>wymierne </b>to liczby które można zapisać w postaci ułamka zwykłego <img src=\"https://latex.codecogs.com/gif.latex?\\frac{m}{n}\" title=\"\\frac{m}{n}\">, gdzie m i n są liczbami całkowitymi i jednocześnie <img src=\"https://latex.codecogs.com/gif.latex?n\\neq&amp;space;0\" title=\"n\\neq 0\"><br>\r\n            \r\n            \r\n            \r\n            \r\n            \r\n            </p><p>Przykłady liczb wymiernych:&nbsp; <img src=\"https://latex.codecogs.com/gif.latex?-5;&amp;space;0;&amp;space;7;&amp;space;\\frac{1}{2};&amp;space;-\\frac{7}{5};&amp;space;\\frac{32}{9};&amp;space;0,234;&amp;space;0,(3)\" title=\"-5; 0; 7; \\frac{1}{2}; -\\frac{7}{5}; \\frac{32}{9}; 0,234; 0,(3)\"></p><hr><p>Liczby <b>niewymierne </b>to liczby które nie można przedstawić w postaci ułamka zwykłego <img src=\"https://latex.codecogs.com/gif.latex?\\frac{a}{b}\" title=\"\\frac{a}{b}\"></p><p>Przykłady liczb niewymiernych: <img src=\"https://latex.codecogs.com/gif.latex?\\sqrt{2};&amp;space;-\\sqrt[3]{5};&amp;space;\\Pi;&amp;space;-1+\\sqrt{6}\" title=\"\\sqrt{2}; -\\sqrt[3]{5}; \\Pi; -1+\\sqrt{6}\"></p>','',0,'2020-12-30','2021-05-06'),(28,2,96,'Działania w zbiorze liczb rzeczywistych','\r\n                \r\n                \r\n                \r\n                <font color=\"#FF0000\"><br></font>\r\n            \r\n            \r\n            \r\n            ','',0,'2020-12-30','2021-05-10'),(30,2,97,'Liczby rzeczywiste','\r\n                \r\n                \r\n                \r\n                <br>\r\n            \r\n            \r\n            \r\n            ','',0,'2020-12-30','2021-05-10'),(35,34,1,'Pusty layer 4',NULL,'',1,'2021-01-02','2021-01-02'),(36,34,2,'pusty layer 4_2',NULL,'',1,'2021-01-02','2021-01-02'),(37,3,1,'Definicja potęgi','\r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                <p>\r\n                \r\n                <b>Potęga o wykładniku naturalnym</b> <img src=\"https://latex.codecogs.com/gif.latex?a^{n}\" title=\"a^{n}\"> (gdzie &lt;img src=\"https://latex.codecogs.com/gif.latex?a\\neq&amp;space;0\" title=\"a\\neq 0\" /&gt;)oznacza iloczyn n czynników a, tzn. <img src=\"https://latex.codecogs.com/gif.latex?a^{n}=a*a*a*...*a\" title=\"a^{n}=a*a*a*...*a\">, gdzie a występuje n razy</p><p>Liczbę a nazywamy <b>podstawą potęgi</b>, liczbę n nazywamy <b>wykładnikiem</b><br></p><p>Przykładowo:</p><p><img src=\"https://latex.codecogs.com/gif.latex?5^{3}=5*5*5\" title=\"5^{3}=5*5*5\"></p><p><img src=\"https://latex.codecogs.com/gif.latex?2^{6}=2*2*2*2*2*2\" title=\"2^{6}=2*2*2*2*2*2\"></p><p>Liczba podniesiona do potęgi zerowej zawsze daje 1</p><p><img src=\"https://latex.codecogs.com/gif.latex?a^{0}=1\" title=\"a^{0}=1\"></p><hr><p><b>Potęgę o wykładniku całkowitym</b> definiujemy jako <img src=\"https://latex.codecogs.com/gif.latex?a^{-n}\" title=\"a^{-n}\"></p><p>Aby\r\n obliczyć potęgę o wykładniku całkowitym ujemnym, w pierwszej kolejności\r\n pozbywamy się minusa z wykładnika, korzystając z definicji potęgi o \r\nwykładniku całkowitym<br></p><p><img src=\"https://latex.codecogs.com/gif.latex?a^{-n}=(\\frac{1}{a})^n\" title=\"a^{-n}=(\\frac{1}{a})^n\"><br></p><p>Zapis <img src=\"https://latex.codecogs.com/gif.latex?\\frac{1}{a}\" title=\"\\frac{1}{a}\"> oznacza odwrotność liczby a<br></p><p>Przykładowo</p><img src=\"https://latex.codecogs.com/gif.latex?5^{-2}=(\\frac{1}{5})^2=\\frac{1}{5}*\\frac{1}{5}=\\frac{1}{25}\" title=\"5^{-2}=(\\frac{1}{5})^2=\\frac{1}{5}*\\frac{1}{5}=\\frac{1}{25}\"><hr><p><b>Potęgę o wykładniku wymiernym</b> definiujemy jako <img src=\"https://latex.codecogs.com/gif.latex?a^{\\frac{n}{m}}=\\sqrt[m]{a^{n}}\" title=\"a^{\\frac{n}{m}}=\\sqrt[m]{a^{n}}\"></p><p>Przykładowo:</p><p><img src=\"https://latex.codecogs.com/gif.latex?2^{\\frac{3}{4}}=\\sqrt[4]{2^{3}}=\\sqrt[4]{8}\" title=\"2^{\\frac{3}{4}}=\\sqrt[4]{2^{3}}=\\sqrt[4]{8}\"></p><p><br><br></p><p>\r\n            \r\n            </p>\r\n            \r\n            \r\n            \r\n            \r\n            \r\n            \r\n            \r\n            ','',1,'2021-01-02','2021-05-16'),(38,3,2,'Działania na potęgach','\r\n                \r\n                <p>Poniższa tabela zawiera listę działań na potęgach</p><table class=\"table table-bordered\"><tbody><tr><td><img src=\"https://latex.codecogs.com/gif.latex?a^{n}*a^{m}=a^{n+m}\" title=\"a^{n}*a^{m}=a^{n+m}\"><br></td><td>iloczyn potęg o tej samej podstawie<br></td></tr><tr><td><img src=\"https://latex.codecogs.com/gif.latex?a^{n}:a^{m}=a^{n-m}\" title=\"a^{n}:a^{m}=a^{n-m}\"><br></td><td>iloraz potęg o tej samej podstawie</td></tr><tr><td><img src=\"https://latex.codecogs.com/gif.latex?a^{n}*b^{n}=(a*b)^{n}\" title=\"a^{n}*b^{n}=(a*b)^{n}\"><br></td><td>iloczyn potęg o tym samym wykładniku<br></td></tr><tr><td><img src=\"https://latex.codecogs.com/gif.latex?a^{n}:b^{n}=(a:b)^{n}\" title=\"a^{n}:b^{n}=(a:b)^{n}\"><br></td><td>iloraz potęg o tym samym wykładniku</td></tr><tr><td><img src=\"https://latex.codecogs.com/gif.latex?({a^{n}})^m=a^{n*m}\" title=\"({a^{n}})^m=a^{n*m}\"><br></td><td>potęga potęgi<br></td></tr><tr><td><img src=\"https://latex.codecogs.com/gif.latex?a^{-n}=(\\frac{1}{a})^n\" title=\"a^{-n}=(\\frac{1}{a})^n\"></td><td>definicja potęgi o wykładniku całkowitym<br></td></tr><tr><td><img src=\"https://latex.codecogs.com/gif.latex?a^{0}=1\" title=\"a^{0}=1\"><br></td><td>z definicji potęgi<br></td></tr></tbody></table><p><br></p>\r\n            \r\n            ','',1,'2021-01-02','2021-05-16'),(39,3,3,'Potęga o wykładniku wymiernym','<p>Potęgę o wykładniku wymiernym definiujemy jako &lt;img src=\"https://latex.codecogs.com/gif.latex?a^{\\frac{n}{m}}=\\sqrt[m]{a^{n}}\" title=\"a^{\\frac{n}{m}}=\\sqrt[m]{a^{n}}\" /&gt;</p><p>Przykładowo:</p><p>&lt;img src=\"https://latex.codecogs.com/gif.latex?2^{\\frac{3}{4}}=\\sqrt[4]{2^{3}}=\\sqrt[4]{8}\" title=\"2^{\\frac{3}{4}}=\\sqrt[4]{2^{3}}=\\sqrt[4]{8}\" /&gt;</p><p><br></p>','',1,'2021-01-02','2021-05-16'),(40,14,1,'Funkcja kwadratowa','\r\n                <p>\r\n                <span class=\"note-math\"><span class=\"katex\"><span class=\"katex-mathml\"><math xmlns=\"http://www.w3.org/1998/Math/MathML\"><semantics><mrow><msup><mi>x</mi><mn>2</mn></msup><mo>&gt;</mo><mn>0</mn></mrow><annotation encoding=\"application/x-tex\">x^2 &gt; 0</annotation></semantics></math></span><span class=\"katex-html\" aria-hidden=\"true\"><span class=\"base\"><span class=\"strut\" style=\"height: 0.853208em; vertical-align: -0.0391em;\"></span><span class=\"mord\"><span class=\"mord mathnormal\">x</span><span class=\"msupsub\"><span class=\"vlist-t\"><span class=\"vlist-r\"><span class=\"vlist\" style=\"height: 0.814108em;\"><span class=\"\" style=\"top: -3.063em; margin-right: 0.05em;\"><span class=\"pstrut\" style=\"height: 2.7em;\"></span><span class=\"sizing reset-size6 size3 mtight\"><span class=\"mord mtight\">2</span></span></span></span></span></span></span></span><span class=\"mspace\" style=\"margin-right: 0.277778em;\"></span><span class=\"mrel\">&gt;</span><span class=\"mspace\" style=\"margin-right: 0.277778em;\"></span></span><span class=\"base\"><span class=\"strut\" style=\"height: 0.64444em; vertical-align: 0em;\"></span><span class=\"mord\">0</span></span></span></span><span class=\"note-latex\" style=\"display: none;\">x^2 &gt; 0</span></span></p>\r\n            ','',1,'2021-01-05','2021-01-05'),(45,43,1,'11','tutaj <b>bedize <u>nowa <strike>tresc i tabela </strike></u></b><table class=\"table table-bordered\"><tbody><tr><td><ul><li>a</li><li>g</li><li><br></li></ul></td><td><br></td><td><br></td></tr><tr><td><br></td><td><br></td><td><br></td></tr><tr><td><br></td><td><br></td><td><br></td></tr><tr><td><br></td><td><br></td><td><br></td></tr></tbody></table><b><u><strike><br></strike></u></b><br>','',1,'2021-01-07','2021-01-07'),(46,5,1,'tw',NULL,'',1,'2021-01-10','2021-01-10'),(48,2,4,'Kolejność wykonywania działań','\r\n                \r\n                <ol><li>Na samym początku wykonujemy działania które są w nawiasach (w przypadku\r\n zagnieżdżonych nawiasów - wykonujemy działania w nawiasach, w których \r\nnie ma już żadnego innego nawiasu, w ten sposób redukujemy ilość \r\nnawiasów)</li><li>Potęgowanie / pierwiastkowanie - w kolejności wystepowania</li><li>Mnożenie / dzielenie - w kolejności wystepowania</li><li>Dodawanie / odejmowanie - w kolejności występowania<br></li></ol>\r\n            \r\n            ','',1,'2021-04-19','2021-05-10'),(49,2,3,'Symboliczny zapis liczb','\r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                <p>Bardzo często w zadaniach (szczególnie tych na dowodzenie) wykorzystujemy symboliczny zapis liczb. Najczęściej spotykane i wykorzystwane zapisy to:</p><table class=\"table table-bordered\"><tbody><tr><td><img src=\"https://latex.codecogs.com/gif.latex?k\" title=\"k\"><br></td><td>dowolna liczb całkowita<br></td></tr><tr><td><img src=\"https://latex.codecogs.com/gif.latex?2k\" title=\"2k\"><br></td><td>dowolna liczba całkowita parzysta<br></td></tr><tr><td><img src=\"https://latex.codecogs.com/gif.latex?2k&amp;space;+&amp;space;1\" title=\"2k + 1\"><br></td><td>dowolna liczba całkowita nieparzysta<br></td></tr><tr><td><img src=\"https://latex.codecogs.com/gif.latex?k,&amp;space;k&amp;space;+&amp;space;1,&amp;space;k&amp;space;+&amp;space;2\" title=\"k, k + 1, k + 2\"><br></td><td>trzy kolejne liczby całkowite<br></td></tr><tr><td><img src=\"https://latex.codecogs.com/gif.latex?2k,&amp;space;2k&amp;space;+&amp;space;2,&amp;space;2k&amp;space;+&amp;space;4\" title=\"2k, 2k + 2, 2k + 4\"><br></td><td>trzy kolejne liczby parzyste<br></td></tr><tr><td><img src=\"https://latex.codecogs.com/gif.latex?2k&amp;space;+&amp;space;1,&amp;space;2k&amp;space;+&amp;space;3,&amp;space;2k&amp;space;+&amp;space;5\" title=\"2k + 1, 2k + 3, 2k + 5\"><br></td><td>trzy kolejne liczby nieparzyste<br></td></tr><tr><td><img src=\"https://latex.codecogs.com/gif.latex?5k\" title=\"5k\"><br></td><td>liczba całkowita podzielna przez 5<br></td></tr><tr><td><img src=\"https://latex.codecogs.com/gif.latex?5k&amp;space;+&amp;space;3\" title=\"5k + 3\"><br></td><td>liczba całkowita która przy dzieleniu przez pięc daje reszte dwa<br></td></tr><tr><td><img src=\"https://latex.codecogs.com/gif.latex?3k&amp;space;+1,&amp;space;3k&amp;space;+&amp;space;2\" title=\"3k +1, 3k + 2\"><br></td><td>liczba niepodzielna przez trzy (przy dzieleniu przez trzy daje resztę 1 lub 2)<br></td></tr></tbody></table><p><br></p><p>Uwagi:<br></p><p><img src=\"https://latex.codecogs.com/gif.latex?2k&amp;space;\\mapsto\" title=\"2k \\mapsto\"> oznacza liczbę parzystą, gdyż dowolna liczba k pomnożona przez dwa daje w wyniku zawsze liczbę parzystą / podzielną przez dwa</p><p><img src=\"https://latex.codecogs.com/gif.latex?2k&amp;space;+&amp;space;1&amp;space;\\mapsto\" title=\"2k + 1 \\mapsto\"> oznacza liczbę nieparzystą, gdyż jest to liczba parzysta (2k) powiększona o 1. Zauważ że zapisy <img src=\"https://latex.codecogs.com/gif.latex?2k&amp;space;-1,&amp;space;2k&amp;space;+&amp;space;5,&amp;space;2k&amp;space;-&amp;space;99\" title=\"2k -1, 2k + 5, 2k - 99\"> również oznaczają liczby parzyste<br></p><p><br></p>\r\n            \r\n            \r\n            \r\n            \r\n            \r\n            \r\n            ','',1,'2021-04-19','2021-04-20'),(50,2,6,'Liczby przeciwne i odwrotne','\r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                \r\n                <p><b>Liczba przeciwna</b> do do danej liczby to dana liczba z przeciwnym znakiem, tzn liczba przeciwna do a to -a</p><p>Aby znaleźć liczbę przeciwną do danej liczby, zmieniamy jej po prostu znak.</p><p><br></p><hr><p><b>Liczba odwrotna</b> do danej liczby a to liczba&nbsp; <b><img src=\"https://latex.codecogs.com/gif.latex?\\frac{1}{a}\" title=\"\\frac{1}{a}\"></b></p><p>Aby znaleźć liczbę odwrotną do danej liczby, zapisujemy daną liczbę w postaci ułamka zwykłego i zamieniamy licznik z mianownikiem.</p><table class=\"table table-bordered\"><tbody><tr><td><p><span style=\"background-color: inherit;\">dana liczba (a)</span><br></p></td><td>liczba przeciwna (-a)<br></td><td>liczba odwrotna (<img src=\"https://latex.codecogs.com/gif.latex?\\frac{1}{a}\" title=\"\\frac{1}{a}\">)</td></tr><tr><td>3<br></td><td>-3<br></td><td><img src=\"https://latex.codecogs.com/gif.latex?\\frac{1}{3}\" title=\"\\frac{1}{3}\"></td></tr><tr><td>-6,2</td><td>6,2<br></td><td><img src=\"https://latex.codecogs.com/gif.latex?\\frac{5}{31}\" title=\"\\frac{5}{31}\"><br></td></tr><tr><td><img src=\"https://latex.codecogs.com/gif.latex?\\sqrt{3}\" title=\"\\sqrt{3}\"></td><td><img src=\"https://latex.codecogs.com/gif.latex?-\\sqrt{3}\" title=\"-\\sqrt{3}\"></td><td><img src=\"https://latex.codecogs.com/gif.latex?\\frac{\\sqrt{3}}{3}\" title=\"\\frac{\\sqrt{3}}{3}\"><br></td></tr><tr><td><img src=\"https://latex.codecogs.com/gif.latex?\\frac{5}{6}\" title=\"\\frac{5}{6}\"></td><td><img src=\"https://latex.codecogs.com/gif.latex?-\\frac{{5}}{6}\" title=\"-\\frac{{5}}{6}\"><br></td><td><img src=\"https://latex.codecogs.com/gif.latex?\\frac{6}{5}\" title=\"\\frac{6}{5}\"></td></tr><tr><td><img src=\"https://latex.codecogs.com/gif.latex?4\\frac{3}{7}\" title=\"4\\frac{3}{7}\"></td><td><img src=\"https://latex.codecogs.com/gif.latex?-4\\frac{{3}}{7}\" title=\"-4\\frac{{3}}{7}\"><br></td><td><p> <img src=\"https://latex.codecogs.com/gif.latex?\\frac{7}{31}\" title=\"\\frac{7}{31}\"></p></td></tr></tbody></table><p><br></p><p>Warto zapamiętać że</p><ul><li>liczba przeciwna - ma po prostu przeciwny znak</li><li>iloczyn danej liczby i jej odwrotności zawsza daje w wyniku 1 (np <img src=\"https://latex.codecogs.com/gif.latex?\\frac{8}{11}*\\frac{11}{8}=1\" title=\"\\frac{8}{11}*\\frac{11}{8}=1\">)</li><li>zero jest jedyną liczbą która nie posiada liczby odwrotnej (bo nie dzielimy przez zero)<br></li><li>liczba zero to jedyna liczba która jest równa liczbie przeciwnej do siebie <br></li><li>liczba odwrotna do liczby całkowitej to ułamek który w liczniku ma 1, a w mianowniku daną liczbę, tzn <img src=\"https://latex.codecogs.com/gif.latex?-7\\rightarrow&amp;space;-\\frac{1}{7}\" title=\"-7\\rightarrow -\\frac{1}{7}\"></li><li>znajdując liczbę przeciwną do liczby mieszanej, należy pamiętać aby najpierw zamienić liczbę mieszaną na ułamek niewłaściwy</li><li>jeśli liczba odwrotna ma w mianowniku ułamek, usuwamy go poprzez jej rozszerzenie o ten ułamek<br></li></ul>\r\n            \r\n            \r\n            \r\n            \r\n            \r\n            \r\n            \r\n            \r\n            \r\n            \r\n            ','',1,'2021-04-19','2021-05-16'),(51,2,5,'Zapis dziesiętny liczb','\r\n                \r\n                <p>Przypomnijmy - liczby <b>wymierne </b>to liczby które możemy zapisać w postaci ułamka zwykłego <img src=\"https://latex.codecogs.com/gif.latex?\\frac{m}{n}\" title=\"\\frac{m}{n}\">, gdzie m i n są liczbami całkowitymi i jednocześnie <img src=\"https://latex.codecogs.com/gif.latex?n\\neq&amp;space;0\" title=\"n\\neq 0\"></p><hr><p>\r\n                \r\n                \r\n            \r\n            \r\n            </p><p>Każda liczba wymierna posiada rozwinięcie dziesiętne:</p><ul><li>skończone, np 12,56</li><li>nieskończone okresowe, np 12,(56)=12,56565656...<br></li></ul><p> Aby wyznaczyć rozwinięcie dziesiętne danej liczby, wystarczy zapisać ją w postaci ułamka <img src=\"https://latex.codecogs.com/gif.latex?\\frac{m}{n}\" title=\"\\frac{m}{n}\">, a nastepnie wykonać dzielenie.</p><p>Często spotykane rozwinięcia dziesiętne nieskończone to:</p><p><img src=\"https://latex.codecogs.com/gif.latex?\\\\&amp;space;\\frac{1}{3}=&amp;space;0,33333...&amp;space;=&amp;space;0,(3)\\\\\\\\&amp;space;\\quad\\quad\\frac{2}{3}=&amp;space;0,66666...&amp;space;=&amp;space;0,(6)\\\\\" title=\"\\\\ \\frac{1}{3}= 0,33333... = 0,(3)\\\\\\\\ \\quad\\quad\\frac{2}{3}= 0,66666... = 0,(6)\\\\\"><br></p><hr><p>Trochę trudniejsza jest zamiana w drugą stronę, mając ułamke okresowy, zamienić na ułamek zwykły.</p><p>Prześledźmy to na przykładzie gdzie zamienimy liczbę 0,(56) na ułamek zwykły</p><img src=\"https://latex.codecogs.com/gif.latex?\\\\&amp;space;0,(56)&amp;space;=&amp;space;x\\quad\\quad\\quad\\quad\\quad\\quad|\\quad*100\\quad(mnozymy\\quad&amp;space;obustronnie\\quad&amp;space;przez\\quad100)\\\\&amp;space;0,(56)*100=100x\\\\&amp;space;56,(56)=100x\\\\&amp;space;56+0,(56)=100x\\quad\\quad|\\quad&amp;space;wykorzystujemy\\quad&amp;space;podstawienie\\quad&amp;space;0,(56)=x\\\\&amp;space;56+x=100x&amp;space;56=99x\\\\&amp;space;x=\\frac{56}{99}\" title=\"\\\\ 0,(56) = x\\quad\\quad\\quad\\quad\\quad\\quad|\\quad*100\\quad(mnozymy\\quad obustronnie\\quad przez\\quad100)\\\\ 0,(56)*100=100x\\\\ 56,(56)=100x\\\\ 56+0,(56)=100x\\quad\\quad|\\quad wykorzystujemy\\quad podstawienie\\quad 0,(56)=x\\\\ 56+x=100x 56=99x\\\\ x=\\frac{56}{99}\">\r\n            <p></p><p>Zauważ że w przypadku ułamka którego okresem są trzy liczby, np 45,(734) musielibyśmy przemnożyć ten ułamek przez 1000<br></p>\r\n            \r\n            ','',1,'2021-04-19','2021-05-10'),(52,2,7,'Przedziały','\r\n                \r\n                \r\n                <p>\r\n                \r\n                </p><p>Przedział liczbowy opisuje zbiór elementów danego zbioru liczbowego, zawartych pomiędzy dwoma elementami tego zbioru.</p><p>O ile w zadaniu nie jest podane inaczej, będziemy rozpatrywać przedziały zbiory liczb rzeczywistych<br></p><p>Rozróżniamy przedziały</p><ul><li>ograniczone</li><li>nieograniczone</li><li>domknięte</li><li>otwarte</li></ul><p>Przykłady przedziałów</p><table class=\"table table-bordered\"><tbody><tr><td>A = <img src=\"https://latex.codecogs.com/gif.latex?(-2;3)\" title=\"(-2;3)\"><br></td><td>przedział liczb zawartych pomiędziy liczbą -2 (bez liczby -2) a liczbą 3 (bez liczby 3)<br></td></tr><tr><td>B = <img src=\"https://latex.codecogs.com/gif.latex?(-\\frac{1}{2};4>\" title=\"(-\\frac{1}{2};4>\"><br></td><td>przedział liczb zawartych pomiędziy liczbą <img src=\"https://latex.codecogs.com/gif.latex?-\\frac{1}{2}\" title=\"-\\frac{1}{2}\"> (bez liczby <img src=\"https://latex.codecogs.com/gif.latex?-\\frac{1}{2}\" title=\"-\\frac{1}{2}\">) a liczbą 4 (razem z liczbą 4)</td></tr><tr><td>C = <img src=\"https://latex.codecogs.com/gif.latex?(-\\infty&amp;space;;&amp;space;9>\" title=\"(-\\infty ; 9>\"><br></td><td>przedział liczb mniejszych lub równych 9<br></td></tr><tr><td>D = <img src=\"https://latex.codecogs.com/gif.latex?(\\sqrt{3};\\infty&amp;space;)\" title=\"(\\sqrt{3};\\infty )\"><br></td><td>przedział liczb większych od <img src=\"https://latex.codecogs.com/gif.latex?\\sqrt{3}\" title=\"\\sqrt{3}\"><br></td></tr></tbody></table><p>Jak możemy zauważyć powyżej</p><ul><li>przedziały najczęściej oznaczamy dużą literą (A, B, C ...)<br></li><li>jesli przedział zaczyna się / kończy nawiasem otwartym, jest to przedział otwarty. Liczba na skraju przedziału otwartego nie należy do danego przedziału</li><li>jesli przedział zaczyna się / kończy nawiasem trójkątnym, jest to \r\nprzedział domknięty. Liczba na skraju przedziału domkniętego należy do \r\ndanego przedziału</li></ul><hr>Na przedziałach możemy wykonywać następujące operacje<br><p></p><ul><li><img src=\"https://latex.codecogs.com/gif.latex?A\\cup&amp;space;B\" title=\"A\\cup B\"> oznacza sumę przedziałów A i B, należą do niego wszystkie elementy które należą do przedziału A <b>lub </b>B</li><li><img src=\"https://latex.codecogs.com/gif.latex?A\\cap&amp;space;B\" title=\"A\\cap B\"> oznacza iloczyn przedziałów A i B, należą do niego wszystkie elementy które należą do przedziału A <b>lub </b>B</li><li><img src=\"https://latex.codecogs.com/gif.latex?A\\setminus&amp;space;B\" title=\"A\\setminus B\"> oznacza różnicę przedziałów A i B, należą do niego wszystkie elementy które należą do A i jednocześnie nie należą do B (innymi słowy, z przedziału A wyrzucamy przedział B)<br></li><li><img src=\"https://latex.codecogs.com/gif.latex?A\'\" title=\"A\'\"> oznacza dopełnienie zbioru A (najczęściej jest to <img src=\"https://latex.codecogs.com/gif.latex?R\\setminus&amp;space;A\'\" title=\"R\\setminus A\'\">)<br></li></ul><p><br></p>\r\n            \r\n            \r\n            ','',1,'2021-05-16','2021-05-16');
/*!40000 ALTER TABLE `topic_layer_4` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`musialm_matemania`@`%`*/ /*!50003 trigger after_insert_topic_layer_4
    after insert
    on topic_layer_4
    for each row
begin
    update topic_layer_2 t2_master,
        (select t2.id_layer_2 as layer2id, count(*) l4_counter
         from topic_layer_4 t4,
              topic_layer_3 t3,
              topic_layer_2 t2
         where t2.id_layer_2 = t3.fk_id_layer_2
           and t4.fk_id_layer_3 = t3.id_layer_3
           and t4.is_active = 1
           and t3.is_active = 1
         group by t2.id_layer_2) as counter_to_update
    set t2_master.counter_layer_4 = counter_to_update.l4_counter
    where t2_master.id_layer_2 = counter_to_update.layer2id;
    update topic_layer_2 set counter_layer_4 = 0 where counter_layer_4 is null;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`musialm_matemania`@`%`*/ /*!50003 trigger after_update_topic_layer_4
    after update
    on topic_layer_4
    for each row
begin
    update topic_layer_2 t2_master,
        (select t2.id_layer_2 as layer2id, count(*) l4_counter
         from topic_layer_4 t4,
              topic_layer_3 t3,
              topic_layer_2 t2
         where t2.id_layer_2 = t3.fk_id_layer_2
           and t4.fk_id_layer_3 = t3.id_layer_3
           and t4.is_active = 1
           and t3.is_active = 1
         group by t2.id_layer_2) as counter_to_update
    set t2_master.counter_layer_4 = counter_to_update.l4_counter
    where t2_master.id_layer_2 = counter_to_update.layer2id;
    update topic_layer_2 set counter_layer_4 = 0 where counter_layer_4 is null;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`musialm_matemania`@`%`*/ /*!50003 trigger after_delete_topic_layer_4
    after delete
    on topic_layer_4
    for each row
begin
    update topic_layer_2 t2_master,
        (select t2.id_layer_2 as layer2id, count(*) l4_counter
         from topic_layer_4 t4,
              topic_layer_3 t3,
              topic_layer_2 t2
         where t2.id_layer_2 = t3.fk_id_layer_2
           and t4.fk_id_layer_3 = t3.id_layer_3
           and t4.is_active = 1
           and t3.is_active = 1
         group by t2.id_layer_2) as counter_to_update
    set t2_master.counter_layer_4 = counter_to_update.l4_counter
    where t2_master.id_layer_2 = counter_to_update.layer2id;
    update topic_layer_2 set counter_layer_4 = 0 where counter_layer_4 is null;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `login` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phoneNumber` varchar(100) DEFAULT NULL,
  `userType` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp(),
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,'b','b','b','b','b','1','user',1,'2020-09-02',NULL),(1,'a','a','a','a','a','1','admin',1,'2020-09-01',NULL),(3,'mm','m','mm3','3','mmm@m3','4334','user',1,'2020-12-13','2020-12-20'),(4,'mmm','m','kkkii','aads','','34','user',1,'2020-12-13','2020-12-20'),(5,'michal.olaf.musial@gmail.com','mm','Michał','Musiał','','5','user',1,'2020-12-15','2021-01-10'),(6,'test','test','Test',NULL,NULL,NULL,'user',1,'2020-12-17','2020-12-20'),(7,'test1','test1','Imie1','Nazw','','','user',0,'2020-12-17','2021-01-19');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_topic_layer_4_without_content`
--

DROP TABLE IF EXISTS `vw_topic_layer_4_without_content`;
/*!50001 DROP VIEW IF EXISTS `vw_topic_layer_4_without_content`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_topic_layer_4_without_content` (
  `id_layer_4` tinyint NOT NULL,
  `fk_id_layer_3` tinyint NOT NULL,
  `order_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `comment` tinyint NOT NULL,
  `is_active` tinyint NOT NULL,
  `date_created` tinyint NOT NULL,
  `date_modified` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_topic_layer_4_without_content`
--

/*!50001 DROP TABLE IF EXISTS `vw_topic_layer_4_without_content`*/;
/*!50001 DROP VIEW IF EXISTS `vw_topic_layer_4_without_content`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`musialm_matemania`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_topic_layer_4_without_content` AS select `topic_layer_4`.`id_layer_4` AS `id_layer_4`,`topic_layer_4`.`fk_id_layer_3` AS `fk_id_layer_3`,`topic_layer_4`.`order_id` AS `order_id`,`topic_layer_4`.`name` AS `name`,`topic_layer_4`.`comment` AS `comment`,`topic_layer_4`.`is_active` AS `is_active`,`topic_layer_4`.`date_created` AS `date_created`,`topic_layer_4`.`date_modified` AS `date_modified` from `topic_layer_4` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-24  0:14:12

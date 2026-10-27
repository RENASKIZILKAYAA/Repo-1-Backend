-- MySQL dump 10.13  Distrib 8.0.46, for macos15 (x86_64)
--
-- Host: localhost    Database: pokemon
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
-- Table structure for table `body_shape`
--

DROP TABLE IF EXISTS `body_shape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `body_shape` (
  `body_shape_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `number_of_legs` int DEFAULT NULL,
  `has_wings` tinyint(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`body_shape_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body_shape`
--

LOCK TABLES `body_shape` WRITE;
/*!40000 ALTER TABLE `body_shape` DISABLE KEYS */;
INSERT INTO `body_shape` VALUES (1,'Quadruped',4,0,'Walks primarily on four legs'),(2,'Biped',2,0,'Walks primarily on two legs'),(3,'Winged',2,1,'Has wings'),(4,'Serpentine',0,0,'Long body with no legs'),(5,'Aquatic',0,0,'Body adapted primarily for swimming'),(6,'Insectoid',6,1,'Body structure similar to an insect'),(7,'Blob',0,0,'Body has no clearly defined limbs'),(8,'Humanoid',2,0,'Body structure resembles a human');
/*!40000 ALTER TABLE `body_shape` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon` (
  `pokedex_number` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `speed` int DEFAULT NULL,
  `special_defence` int DEFAULT NULL,
  `special_attack` int DEFAULT NULL,
  `defence` int DEFAULT NULL,
  `attack` int DEFAULT NULL,
  `hp` int DEFAULT NULL,
  `primary_type` varchar(45) DEFAULT NULL,
  `secondary_type` varchar(45) DEFAULT NULL,
  `body_shape_id` int DEFAULT NULL,
  PRIMARY KEY (`pokedex_number`),
  KEY `body_shape_id` (`body_shape_id`),
  CONSTRAINT `pokemon_ibfk_1` FOREIGN KEY (`body_shape_id`) REFERENCES `body_shape` (`body_shape_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
INSERT INTO `pokemon` VALUES (1,'Bulbasaur',45,65,65,49,49,45,'Grass','Poison',1),(2,'Ivysaur',60,80,80,63,62,60,'Grass','Poison',1),(3,'Venusaur',80,100,100,83,82,80,'Grass','Poison',1),(4,'Charmander',65,50,60,43,52,39,'Fire',NULL,2),(5,'Charmeleon',80,65,80,58,64,58,'Fire',NULL,2),(6,'Charizard',100,85,109,78,84,78,'Fire','Flying',3),(7,'Squirtle',43,64,50,65,48,44,'Water',NULL,2),(8,'Wartortle',58,80,65,80,63,59,'Water',NULL,2),(9,'Blastoise',78,105,85,100,83,79,'Water',NULL,2),(10,'Caterpie',45,20,20,35,30,45,'Bug',NULL,6),(11,'Metapod',30,25,25,55,20,50,'Bug',NULL,6),(12,'Butterfree',70,80,90,50,45,60,'Bug','Flying',6),(13,'Weedle',50,20,20,30,35,40,'Bug','Poison',6),(14,'Kakuna',35,25,25,50,25,45,'Bug','Poison',6),(15,'Beedrill',75,80,45,40,90,65,'Bug','Poison',6),(16,'Pidgey',56,35,35,40,45,40,'Normal','Flying',3),(17,'Pidgeotto',71,50,50,55,60,63,'Normal','Flying',3),(18,'Pidgeot',101,70,70,75,80,83,'Normal','Flying',3),(19,'Rattata',72,35,25,35,56,30,'Normal',NULL,1),(20,'Raticate',97,70,50,60,81,55,'Normal',NULL,1),(21,'Spearow',70,31,31,30,60,40,'Normal','Flying',3),(22,'Fearow',100,61,61,65,90,65,'Normal','Flying',3),(23,'Ekans',55,54,40,44,60,35,'Poison',NULL,4),(24,'Arbok',80,79,65,69,85,60,'Poison',NULL,4),(25,'Pikachu',90,50,50,40,55,35,'Electric',NULL,2),(26,'Raichu',110,80,90,55,90,60,'Electric',NULL,2),(27,'Sandshrew',40,30,20,85,75,50,'Ground',NULL,2),(28,'Sandslash',65,55,45,110,100,75,'Ground',NULL,2),(29,'Nidoran-f',41,40,40,52,47,55,'Poison',NULL,1),(30,'Nidorina',56,55,55,67,62,70,'Poison',NULL,1),(31,'Nidoqueen',76,85,75,87,92,90,'Poison','Ground',2),(32,'Nidoran-m',50,40,40,40,57,46,'Poison',NULL,1),(33,'Nidorino',65,55,55,57,72,61,'Poison',NULL,1),(34,'Nidoking',85,75,85,77,102,81,'Poison','Ground',2),(35,'Clefairy',35,65,60,48,45,70,'Fairy',NULL,2),(36,'Clefable',60,90,95,73,70,95,'Fairy',NULL,2),(37,'Vulpix',65,65,50,40,41,38,'Fire',NULL,1),(38,'Ninetales',100,100,81,75,76,73,'Fire',NULL,1),(39,'Jigglypuff',20,25,45,20,45,115,'Normal','Fairy',2),(40,'Wigglytuff',45,50,85,45,70,140,'Normal','Fairy',2),(41,'Zubat',55,40,30,35,45,40,'Poison','Flying',3),(42,'Golbat',90,75,65,70,80,75,'Poison','Flying',3),(43,'Oddish',30,65,75,55,50,45,'Grass','Poison',2),(44,'Gloom',40,75,85,70,65,60,'Grass','Poison',2),(45,'Vileplume',50,90,110,85,80,75,'Grass','Poison',2),(46,'Paras',25,55,45,55,70,35,'Bug','Grass',6),(47,'Parasect',30,80,60,80,95,60,'Bug','Grass',6),(48,'Venonat',45,55,40,50,55,60,'Bug','Poison',6),(49,'Venomoth',90,75,90,60,65,70,'Bug','Poison',6),(50,'Diglett',95,45,35,25,55,10,'Ground',NULL,7),(51,'Dugtrio',120,70,50,50,80,35,'Ground',NULL,7),(52,'Meowth',90,40,40,35,45,40,'Normal',NULL,1),(53,'Persian',115,65,65,60,70,65,'Normal',NULL,1),(54,'Psyduck',55,50,65,48,52,50,'Water',NULL,2),(55,'Golduck',85,80,95,78,82,80,'Water',NULL,2),(56,'Mankey',70,45,35,35,80,40,'Fighting',NULL,2),(57,'Primeape',95,70,60,60,105,65,'Fighting',NULL,2),(58,'Growlithe',60,50,70,45,70,55,'Fire',NULL,1),(59,'Arcanine',95,80,100,80,110,90,'Fire',NULL,1),(60,'Poliwag',90,40,40,40,50,40,'Water',NULL,5),(61,'Poliwhirl',90,50,50,65,65,65,'Water',NULL,2),(62,'Poliwrath',70,90,70,95,95,90,'Water','Fighting',2),(63,'Abra',90,55,105,15,20,25,'Psychic',NULL,8),(64,'Kadabra',105,70,120,30,35,40,'Psychic',NULL,8),(65,'Alakazam',120,95,135,45,50,55,'Psychic',NULL,8),(66,'Machop',35,35,35,50,80,70,'Fighting',NULL,8),(67,'Machoke',45,60,50,70,100,80,'Fighting',NULL,8),(68,'Machamp',55,85,65,80,130,90,'Fighting',NULL,8),(69,'Bellsprout',40,30,70,35,75,50,'Grass','Poison',2),(70,'Weepinbell',55,45,85,50,90,65,'Grass','Poison',2),(71,'Victreebel',70,70,100,65,105,80,'Grass','Poison',2),(72,'Tentacool',70,100,50,35,40,40,'Water','Poison',5),(73,'Tentacruel',100,120,80,65,70,80,'Water','Poison',5),(74,'Geodude',20,30,30,100,80,40,'Rock','Ground',8),(75,'Graveler',35,45,45,115,95,55,'Rock','Ground',8),(76,'Golem',45,65,55,130,120,80,'Rock','Ground',8),(77,'Ponyta',90,65,65,55,85,50,'Fire',NULL,1),(78,'Rapidash',105,80,80,70,100,65,'Fire',NULL,1),(79,'Slowpoke',15,40,40,65,65,90,'Water','Psychic',1),(80,'Slowbro',30,80,100,110,75,95,'Water','Psychic',2),(81,'Magnemite',45,55,95,70,35,25,'Electric','Steel',7),(82,'Magneton',70,70,120,95,60,50,'Electric','Steel',7),(83,'Farfetchd',60,62,58,55,65,52,'Normal','Flying',3),(84,'Doduo',75,35,35,45,85,35,'Normal','Flying',2),(85,'Dodrio',100,60,60,70,110,60,'Normal','Flying',2),(86,'Seel',45,70,45,55,45,65,'Water',NULL,5),(87,'Dewgong',70,95,70,80,70,90,'Water','Ice',5),(88,'Grimer',25,50,40,50,80,80,'Poison',NULL,7),(89,'Muk',50,100,65,75,105,105,'Poison',NULL,7),(90,'Shellder',40,25,45,100,65,30,'Water',NULL,5),(91,'Cloyster',70,45,85,180,95,50,'Water','Ice',5),(92,'Gastly',80,35,100,30,35,30,'Ghost','Poison',7),(93,'Haunter',95,55,115,45,50,45,'Ghost','Poison',8),(94,'Gengar',110,75,130,60,65,60,'Ghost','Poison',8),(95,'Onix',70,45,30,160,45,35,'Rock','Ground',4),(96,'Drowzee',42,90,43,45,48,60,'Psychic',NULL,8),(97,'Hypno',67,115,73,70,73,85,'Psychic',NULL,8),(98,'Krabby',50,25,25,90,105,30,'Water',NULL,6),(99,'Kingler',75,50,50,115,130,55,'Water',NULL,6),(100,'Voltorb',100,55,55,50,30,40,'Electric',NULL,7),(101,'Electrode',140,80,80,70,50,60,'Electric',NULL,7),(102,'Exeggcute',40,45,60,80,40,60,'Grass','Psychic',7),(103,'Exeggutor',55,65,125,85,95,95,'Grass','Psychic',2),(104,'Cubone',35,50,40,95,50,50,'Ground',NULL,2),(105,'Marowak',45,80,50,110,80,60,'Ground',NULL,2),(106,'Hitmonlee',87,110,35,53,120,50,'Fighting',NULL,8),(107,'Hitmonchan',76,110,35,79,105,50,'Fighting',NULL,8),(108,'Lickitung',30,75,60,75,55,90,'Normal',NULL,2),(109,'Koffing',35,45,60,95,65,40,'Poison',NULL,7),(110,'Weezing',60,70,85,120,90,65,'Poison',NULL,7),(111,'Rhyhorn',25,30,30,95,85,80,'Ground','Rock',1),(112,'Rhydon',40,45,45,120,130,105,'Ground','Rock',2),(113,'Chansey',50,105,35,5,5,250,'Normal',NULL,2),(114,'Tangela',60,40,100,115,55,65,'Grass',NULL,7),(115,'Kangaskhan',90,80,40,80,95,105,'Normal',NULL,2),(116,'Horsea',60,25,70,70,40,30,'Water',NULL,5),(117,'Seadra',85,45,95,95,65,55,'Water',NULL,5),(118,'Goldeen',63,50,35,60,67,45,'Water',NULL,5),(119,'Seaking',68,80,65,65,92,80,'Water',NULL,5),(120,'Staryu',85,55,70,55,45,30,'Water',NULL,5),(121,'Starmie',115,85,100,85,75,60,'Water','Psychic',5),(122,'Mr-mime',90,120,100,65,45,40,'Psychic','Fairy',8),(123,'Scyther',105,80,55,80,110,70,'Bug','Flying',6),(124,'Jynx',95,95,115,35,50,65,'Ice','Psychic',8),(125,'Electabuzz',105,85,95,57,83,65,'Electric',NULL,8),(126,'Magmar',93,85,100,57,95,65,'Fire',NULL,8),(127,'Pinsir',85,70,55,100,125,65,'Bug',NULL,6),(128,'Tauros',110,70,40,95,100,75,'Normal',NULL,1),(129,'Magikarp',80,20,15,55,10,20,'Water',NULL,5),(130,'Gyarados',81,100,60,79,125,95,'Water','Flying',4),(131,'Lapras',60,95,85,80,85,130,'Water','Ice',5),(132,'Ditto',48,48,48,48,48,48,'Normal',NULL,7),(133,'Eevee',55,65,45,50,55,55,'Normal',NULL,1),(134,'Vaporeon',65,95,110,60,65,130,'Water',NULL,1),(135,'Jolteon',130,95,110,60,65,65,'Electric',NULL,1),(136,'Flareon',65,110,95,60,130,65,'Fire',NULL,1),(137,'Porygon',40,75,85,70,60,65,'Normal',NULL,7),(138,'Omanyte',35,55,90,100,40,35,'Rock','Water',5),(139,'Omastar',55,70,115,125,60,70,'Rock','Water',5),(140,'Kabuto',55,45,55,90,80,30,'Rock','Water',5),(141,'Kabutops',80,70,65,105,115,60,'Rock','Water',2),(142,'Aerodactyl',130,75,60,65,105,80,'Rock','Flying',3),(143,'Snorlax',30,110,65,65,110,160,'Normal',NULL,2),(144,'Articuno',85,125,95,100,85,90,'Ice','Flying',3),(145,'Zapdos',100,90,125,85,90,90,'Electric','Flying',3),(146,'Moltres',90,85,125,90,100,90,'Fire','Flying',3),(147,'Dratini',50,50,50,45,64,41,'Dragon',NULL,4),(148,'Dragonair',70,70,70,65,84,61,'Dragon',NULL,4),(149,'Dragonite',80,100,100,95,134,91,'Dragon','Flying',3),(150,'Mewtwo',130,90,154,90,110,106,'Psychic',NULL,8),(151,'Mew',100,100,100,100,100,100,'Psychic',NULL,2);
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_season`
--

DROP TABLE IF EXISTS `pokemon_season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon_season` (
  `pokedex_number` int NOT NULL,
  `season_id` int NOT NULL,
  PRIMARY KEY (`pokedex_number`,`season_id`),
  KEY `fk_ps_season` (`season_id`),
  CONSTRAINT `fk_ps_pokemon` FOREIGN KEY (`pokedex_number`) REFERENCES `pokemon` (`pokedex_number`),
  CONSTRAINT `fk_ps_season` FOREIGN KEY (`season_id`) REFERENCES `season` (`season_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_season`
--

LOCK TABLES `pokemon_season` WRITE;
/*!40000 ALTER TABLE `pokemon_season` DISABLE KEYS */;
INSERT INTO `pokemon_season` VALUES (1,1),(4,1),(6,1),(7,1),(25,1),(150,1),(25,2),(25,3);
/*!40000 ALTER TABLE `pokemon_season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `season` (
  `season_id` int NOT NULL,
  `season_name` varchar(45) NOT NULL,
  PRIMARY KEY (`season_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1,'Indigo League'),(2,'Orange Islands'),(3,'The Johto Journeys'),(4,'Johto League Champions'),(5,'Master Quest');
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer` (
  `trainer_id` int NOT NULL AUTO_INCREMENT,
  `trainer_name` varchar(50) NOT NULL,
  `age` int DEFAULT NULL,
  `hometown` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`trainer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES (1,'Ash',10,'Pallet Town'),(2,'Misty',10,'Cerulean City'),(3,'Brock',15,'Pewter City'),(4,'Gary',10,'Pallet Town'),(5,'Jessie',20,'Unknown'),(6,'James',20,'Unknown');
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer_pokemon`
--

DROP TABLE IF EXISTS `trainer_pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer_pokemon` (
  `trainer_id` int NOT NULL,
  `pokedex_number` int NOT NULL,
  PRIMARY KEY (`trainer_id`,`pokedex_number`),
  KEY `pokedex_number` (`pokedex_number`),
  CONSTRAINT `trainer_pokemon_ibfk_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`trainer_id`),
  CONSTRAINT `trainer_pokemon_ibfk_2` FOREIGN KEY (`pokedex_number`) REFERENCES `pokemon` (`pokedex_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_pokemon`
--

LOCK TABLES `trainer_pokemon` WRITE;
/*!40000 ALTER TABLE `trainer_pokemon` DISABLE KEYS */;
INSERT INTO `trainer_pokemon` VALUES (1,1),(1,6),(4,9),(1,12),(5,24),(1,25),(4,25),(3,41),(5,52),(6,52),(2,54),(4,59),(3,74),(3,95),(6,110),(2,118),(2,120),(2,121),(4,133),(1,143);
/*!40000 ALTER TABLE `trainer_pokemon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-27 14:11:10

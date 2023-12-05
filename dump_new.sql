-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: flp
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES ('DoctrineMigrations\\Version20231205124953','2023-12-05 12:50:12',40);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `image_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C53D045F4584665A` (`product_id`),
  CONSTRAINT `FK_C53D045F4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` (`id`, `product_id`, `image_name`, `updated_at`) VALUES (1,NULL,'aloe-vera-barbadensis-p227-1492-image-656e967a56282589631067.jpg','2023-12-05 03:18:18'),
(2,NULL,'aloe-vera-barbadensis-p227-25259-image-656e96866b64a215465843.png','2023-12-05 03:18:30'),
(3,NULL,'aloe-vera-barbadensis-p227-25260-image-656e9696a8003878527624.png','2023-12-05 03:18:46'),
(4,NULL,'aloe-vera-barbadensis-p227-25261-image-656e96a3b1b6e163460377.png','2023-12-05 03:18:59'),
(5,NULL,'aloe-vera-barbadensis-p227-25262-image-656e96b792982174864315.png','2023-12-05 03:19:19');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measurement`
--

DROP TABLE IF EXISTS `measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurement`
--

LOCK TABLES `measurement` WRITE;
/*!40000 ALTER TABLE `measurement` DISABLE KEYS */;
INSERT INTO `measurement` (`id`, `title`) VALUES (1,'милилитра'),
(2,'грама'),
(3,'килограм'),
(4,'килограма'),
(5,'литра'),
(6,'литър');
/*!40000 ALTER TABLE `measurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_messages`
--

LOCK TABLES `messenger_messages` WRITE;
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `measurement_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `ingredients` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recommended_use` longtext COLLATE utf8mb4_unicode_ci,
  `storage_conditions` longtext COLLATE utf8mb4_unicode_ci,
  `main_characteristics` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD924EA134` (`measurement_id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`),
  CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`),
  CONSTRAINT `FK_D34A04AD924EA134` FOREIGN KEY (`measurement_id`) REFERENCES `measurement` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `measurement_id`, `category_id`, `title`, `sub_title`, `description`, `code`, `amount`, `price`, `ingredients`, `recommended_use`, `storage_conditions`, `main_characteristics`) VALUES (1,6,1,'Aloe Drinks TriPack','ТриПак - алое напитки','Нашето алое вера се отглежда в плодородна почва и при климат с над 2 000 слънчеви часа годишно. Представете си, че разрязвате листо от растението и изпивате гела директно от вътрешността му. Напитката, която ви предлагаме, е възможно най-близка до свежото растение и е сертифицирана от Международния научен съвет за алое за чистотата и качеството си.\r\n<br/><br/>\r\nАлое вера притежава естествени изчистващи свойства, които помагат на храносмилателната система да усвоява полезните вещества от приеманите храни, като същевременно допринася и за растежа на полезните чревни бактерии. То е чудесно и за кожата, а уникалният полизахарид ацеманан и другите нутриенти в състава му допринасят за подкрепа на имунната система. Всъщност ацемананът е един от ключовите маркери, с който Международният научен съвет за алое определя качеството на алое вера. Гелът на Форевър съдържа близо два пъти по-високо количество от изискваното за сертифициране. Сега напитката съдържа и много витамин C, който пък допринася за нормалната функция на имунната система и за нормалното протичане на метаболизма и производството на енергия.\r\n<br/><br/>\r\nГелът от алое вера на Форевър се преработва асептично, което ни позволява да не добавяме никакви консерванти. Новата ни формула може да се похвали с 99,7% чист гел от вътрешността на листата на растението, внимателно извлечен на ръка, за да се наслаждавате на истинската сила на природата. Сега в Тетра Пак опаковка, изработена от 100% рециклируеми материали, гелът от алое вера ви дава възможност да се насладите на свежия вкус на неразреденото алое вера с всички негови полезни съставки - така, както природата го е създала.','715','1',15999.00,'Хидролизиран рибен колаген (вода, хидролизиран рибен колаген (21,4%)), плодов сок [ябълка (Malus domestica), ацерола (Malpighia glabra L.)] концентрат (19.6%), подсладител (еритритол, стевиол гликозиди), регулатор на киселинността (лимонена киселина), витамин C (натриев аскорбат), сгъстител (акациева гума, пектин), l-изолевцин, витамин A (бета каротин), концентрат сок от морков (Daucus carota L.), екстракт от плод годжи (Lycium barbarum L.), аромат (грозде мускат, авокадо), екстракт от листа на зелен чай (Camellia sinensis L.), цинк (цинков глюконат), емулгатор (лецитин), коензим Q10, консервант (калиев сорбат), екстракт от черен пипер (Piper nigrum), биотин (D-биотин). Алергените са отбелязани в получер шрифт.','Изпивайте по едно пакетче на ден.',NULL,'Спомага за подобряване на хидратацията на кожата.\r\nДопринася за подобряване на структурата на кожата.\r\nСъдейства за по-стегнат вид на кожата.\r\nПодкрепя здравето на кожата.'),
(2,5,1,'Aloe Vera Gel','Гел от алое вера','Нашето алое вера се отглежда в плодородна почва и при климат с над 2 000 слънчеви часа годишно. Представете си, че разрязвате листо от растението и изпивате гела директно от вътрешността му. Напитката, която ви предлагаме, е възможно най-близка до свежото растение и е сертифицирана от Международния научен съвет за алое за чистотата и качеството си.\r\n\r\nАлое вера притежава естествени изчистващи свойства, които помагат на храносмилателната система да усвоява полезните вещества от приеманите храни, като същевременно допринася и за растежа на полезните чревни бактерии. То е чудесно и за кожата, а уникалният полизахарид ацеманан и другите нутриенти в състава му допринасят за подкрепа на имунната система. Всъщност ацемананът е един от ключовите маркери, с който Международният научен съвет за алое определя качеството на алое вера. Гелът на Форевър съдържа близо два пъти по-високо количество от изискваното за сертифициране. Сега напитката съдържа и много витамин C, който пък допринася за нормалната функция на имунната система и за нормалното протичане на метаболизма и производството на енергия.','71612','3',25999.00,'','','',''),
(3,1,1,'Aloe Berry Nectar','Алое бери нектар','Форевър алое бери нектарът съдържа 90,7% гел от вътрешността на листата на растението плюс натурални плодови концентрати, за да подкрепя имунната ви система и да ви зарежда с жизненост.\r\n<br/><br/>\r\nАлоето притежава естествени изчистващи свойства, които помагат на храносмилателната система да усвоява полезните вещества от приеманите храни, като същевременно допринася за растежа на полезните чревни бактерии. То е чудесно и за кожата, а уникалният полизахарид ацеманан и другите нутриенти в състава му допринасят за подкрепа на имунната система.\r\n<br/><br/>\r\nЕксплозия от червени боровинки и ароматни ябълки придава на тази напитка сладък и приятно тръпчив вкус от натурални източници. Наричат червените боровинки суперхрана, защото антиоксидантната им сила е 20 пъти по-висока от тази на витамин С, а и техните проантоцианидини предлагат подкрепа за пикочната система. Специалният фитонутриент в ябълките – кверцетинът, също е мощен антиоксидант. Тези великолепни съставки плюс 90,7% чист гел от вътрешността на листата на алое вера превръщат този нектар в отличен избор.\r\n<br/><br/>\r\nАлое бери нектарът на Форевър се преработва асептично, което ни позволява да не добавяме никакви консерванти. Сега в Тетра Пак опаковка, изработена от 100% рециклируеми материали, алое бери нектарът ви дава възможност да се насладите на свежия вкус на неразреденото алое вера с всички негови полезни съставки - така, както природата го е създала.','73512','12 x 330',23812.00,'Стабилизиран гел от алое вера [гел от алое вера (90,7%), витамин С (аскорбинова киселина), антиоксидант (аскорбинова киселина), регулатор на киселинността (лимонена киселина)], натурален концентрат от ябълков сок, фруктоза, натурален концентрат от червени боровинки.','Разклатете добре преди употреба! Три приема дневно по 40 мл. Сипвайте всяка доза в чаша и разреждайте в 240 мл вода или сок. Сипвайте напитката в чаша, не пийте директно от опаковката, за да не попадат в нея бактерии, които могат да ускорят развалянето.','На сухо и хладно място. След отваряне съхранявайте изправен в хладилник (макс. 7°С) и консумирайте до 30 дни. Не вдигайте опаковката за гърлото, за да не я повредите.','90,7% чист гел от вътрешността на листата\r\nБез консерванти\r\nПодпомага храносмилането\r\nПодкрепя имунната система\r\nЧервените боровинки допринасят за здравето на пикочната система\r\nСъдейства за поддържане на естествените енергийни нива');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` (`id`, `title`) VALUES (1,'Напитки'),
(2,'Добавки и хранене'),
(3,'Етерични масла'),
(4,'Пчелни продукти'),
(5,'Контрол на теглото'),
(6,'Грижа за лицето');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_image` (
  `product_id` int NOT NULL,
  `image_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`image_id`),
  KEY `IDX_64617F034584665A` (`product_id`),
  KEY `IDX_64617F033DA5256D` (`image_id`),
  CONSTRAINT `FK_64617F033DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_64617F034584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` (`product_id`, `image_id`) VALUES (1,1),
(1,2),
(2,2),
(2,3),
(2,4),
(3,2),
(3,3),
(3,4),
(3,5);
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`, `created_at`) VALUES (1,'schonov@flp.bg','[\"ROLE_ADMIN\"]','$2y$13$DDV/bBGDuaBo1sx.rPGmf.E2ZFgjgRJ6UHBuzm775ZHOLU09co5Su','schonov','2023-12-05 05:12:26');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-05 12:52:11

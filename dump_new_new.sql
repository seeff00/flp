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
INSERT INTO `image` (`id`, `image_name`, `product_id`, `updated_at`) VALUES (1,'aloe-vera-barbadensis-p227-1492-image-656e967a56282589631067.jpg',NULL,'2023-12-05 03:18:18'),
(2,'aloe-vera-barbadensis-p227-25259-image-656e96866b64a215465843.png',NULL,'2023-12-05 03:18:30'),
(3,'aloe-vera-barbadensis-p227-25260-image-656e9696a8003878527624.png',NULL,'2023-12-05 03:18:46'),
(4,'aloe-vera-barbadensis-p227-25261-image-656e96a3b1b6e163460377.png',NULL,'2023-12-05 03:18:59'),
(5,'aloe-vera-barbadensis-p227-25262-image-656e96b792982174864315.png',NULL,'2023-12-05 03:19:19');
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
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`amount`, `category_id`, `code`, `description`, `id`, `ingredients`, `main_characteristics`, `measurement_id`, `price`, `recommended_use`, `storage_conditions`, `sub_title`, `title`) VALUES ('1',3,'715','Нашето алое вера се отглежда в плодородна почва и при климат с над 2 000 слънчеви часа годишно. Представете си, че разрязвате листо от растението и изпивате гела директно от вътрешността му. Напитката, която ви предлагаме, е възможно най-близка до свежото растение и е сертифицирана от Международния научен съвет за алое за чистотата и качеството си.\r\n<br/><br/>\r\nАлое вера притежава естествени изчистващи свойства, които помагат на храносмилателната система да усвоява полезните вещества от приеманите храни, като същевременно допринася и за растежа на полезните чревни бактерии. То е чудесно и за кожата, а уникалният полизахарид ацеманан и другите нутриенти в състава му допринасят за подкрепа на имунната система. Всъщност ацемананът е един от ключовите маркери, с който Международният научен съвет за алое определя качеството на алое вера. Гелът на Форевър съдържа близо два пъти по-високо количество от изискваното за сертифициране. Сега напитката съдържа и много витамин C, който пък допринася за нормалната функция на имунната система и за нормалното протичане на метаболизма и производството на енергия.\r\n<br/><br/>\r\nГелът от алое вера на Форевър се преработва асептично, което ни позволява да не добавяме никакви консерванти. Новата ни формула може да се похвали с 99,7% чист гел от вътрешността на листата на растението, внимателно извлечен на ръка, за да се наслаждавате на истинската сила на природата. Сега в Тетра Пак опаковка, изработена от 100% рециклируеми материали, гелът от алое вера ви дава възможност да се насладите на свежия вкус на неразреденото алое вера с всички негови полезни съставки - така, както природата го е създала.',1,'Хидролизиран рибен колаген (вода, хидролизиран рибен колаген (21,4%)), плодов сок [ябълка (Malus domestica), ацерола (Malpighia glabra L.)] концентрат (19.6%), подсладител (еритритол, стевиол гликозиди), регулатор на киселинността (лимонена киселина), витамин C (натриев аскорбат), сгъстител (акациева гума, пектин), l-изолевцин, витамин A (бета каротин), концентрат сок от морков (Daucus carota L.), екстракт от плод годжи (Lycium barbarum L.), аромат (грозде мускат, авокадо), екстракт от листа на зелен чай (Camellia sinensis L.), цинк (цинков глюконат), емулгатор (лецитин), коензим Q10, консервант (калиев сорбат), екстракт от черен пипер (Piper nigrum), биотин (D-биотин). Алергените са отбелязани в получер шрифт.','Спомага за подобряване на хидратацията на кожата.\r\nДопринася за подобряване на структурата на кожата.\r\nСъдейства за по-стегнат вид на кожата.\r\nПодкрепя здравето на кожата.',6,15999.00,'Изпивайте по едно пакетче на ден.',NULL,'ТриПак - алое напитки','Aloe Drinks TriPack'),
('3 x 1',1,'71612','Нашето алое вера се отглежда в плодородна почва и при климат с над 2 000 слънчеви часа годишно. Представете си, че разрязвате листо от растението и изпивате гела директно от вътрешността му. Напитката, която ви предлагаме, е възможно най-близка до свежото растение и е сертифицирана от Международния научен съвет за алое за чистотата и качеството си.\r\n\r\nАлое вера притежава естествени изчистващи свойства, които помагат на храносмилателната система да усвоява полезните вещества от приеманите храни, като същевременно допринася и за растежа на полезните чревни бактерии. То е чудесно и за кожата, а уникалният полизахарид ацеманан и другите нутриенти в състава му допринасят за подкрепа на имунната система. Всъщност ацемананът е един от ключовите маркери, с който Международният научен съвет за алое определя качеството на алое вера. Гелът на Форевър съдържа близо два пъти по-високо количество от изискваното за сертифициране. Сега напитката съдържа и много витамин C, който пък допринася за нормалната функция на имунната система и за нормалното протичане на метаболизма и производството на енергия.',2,NULL,NULL,6,25999.00,NULL,NULL,'Гел от алое вера','Aloe Vera Gel'),
('12 x 330',1,'73512','Форевър алое бери нектарът съдържа 90,7% гел от вътрешността на листата на растението плюс натурални плодови концентрати, за да подкрепя имунната ви система и да ви зарежда с жизненост.\r\n<br/><br/>\r\nАлоето притежава естествени изчистващи свойства, които помагат на храносмилателната система да усвоява полезните вещества от приеманите храни, като същевременно допринася за растежа на полезните чревни бактерии. То е чудесно и за кожата, а уникалният полизахарид ацеманан и другите нутриенти в състава му допринасят за подкрепа на имунната система.\r\n<br/><br/>\r\nЕксплозия от червени боровинки и ароматни ябълки придава на тази напитка сладък и приятно тръпчив вкус от натурални източници. Наричат червените боровинки суперхрана, защото антиоксидантната им сила е 20 пъти по-висока от тази на витамин С, а и техните проантоцианидини предлагат подкрепа за пикочната система. Специалният фитонутриент в ябълките – кверцетинът, също е мощен антиоксидант. Тези великолепни съставки плюс 90,7% чист гел от вътрешността на листата на алое вера превръщат този нектар в отличен избор.\r\n<br/><br/>\r\nАлое бери нектарът на Форевър се преработва асептично, което ни позволява да не добавяме никакви консерванти. Сега в Тетра Пак опаковка, изработена от 100% рециклируеми материали, алое бери нектарът ви дава възможност да се насладите на свежия вкус на неразреденото алое вера с всички негови полезни съставки - така, както природата го е създала.',3,'Стабилизиран гел от алое вера [гел от алое вера (90,7%), витамин С (аскорбинова киселина), антиоксидант (аскорбинова киселина), регулатор на киселинността (лимонена киселина)], натурален концентрат от ябълков сок, фруктоза, натурален концентрат от червени боровинки.','90,7% чист гел от вътрешността на листата\r\nБез консерванти\r\nПодпомага храносмилането\r\nПодкрепя имунната система\r\nЧервените боровинки допринасят за здравето на пикочната система\r\nСъдейства за поддържане на естествените енергийни нива',1,23812.00,'Разклатете добре преди употреба! Три приема дневно по 40 мл. Сипвайте всяка доза в чаша и разреждайте в 240 мл вода или сок. Сипвайте напитката в чаша, не пийте директно от опаковката, за да не попадат в нея бактерии, които могат да ускорят развалянето.','На сухо и хладно място. След отваряне съхранявайте изправен в хладилник (макс. 7°С) и консумирайте до 30 дни. Не вдигайте опаковката за гърлото, за да не я повредите.','Алое бери нектар','Aloe Berry Nectar'),
('269',1,'721','Дайте си тласъка, който ви е необходим, за да се справите с деня си с енергийната напитка ФАБ. Тя съдържа витамини B6 и B12, които допринасят за намаляване на чувството за умора и за контрол върху психични функции като мислене, емоции и интуиция.\r\n<br/><br/>\r\nФАБ е вкусна комбинация от екзотични аромати от гуарана, екстракти от асаи и ацерола, плюс червени боровинки. Доверете се на ФАБ винаги когато имате нужда от допълнителен тласък.\r\n<br/><br/>\r\nТой има мощно действие с екстракти от кафе, таурин и глюкоронолактон, съчетани с витамини B2 и B3 в подкрепа на нормалната функция на нервната система, метаболизма и производството на енергия.\r\n<br/><br/>\r\nНосете прогресивната енергийна напитка на Форевър навсякъде, за да можете винаги да презаредите, когато енергията ви спадне.',4,'Газирана вода, захароза, регулатори на киселинността (лимонена киселина, тринатриев цитрат), таурин, глюкоронолактон, аромати (гуарана, тути фрути), витамини [ниацин (никотинамид), витамин B6 (пиридоксин хидрохлорид), рибофлавин, витамин B12 (цианокобаламин)], екстракт от зърна на кафе (coffea arabica), сок от червени боровинки (Vaccinium macrocarpon) на прах, консервант (калиев сорбат), инозитол, екстракт от плодов сок на асаи (Euterpe sp.), екстракт от семе на гуарана (Paullinia cupana), плодов сок от ацерола (Malpighia emarginata) на прах, оцветител (сулфит амония карамел).\r\n<b>Високо съдържание на кофеин (32 mg/100 ml). Не се препоръва за деца, бременни жени или кърмачки.</b>','С високо съдържание на витамини В2, В3, В6 и В12.\r\n100% рециклируем алуминий.\r\n86 мг кофеин в опаковка.\r\nВитамини В6 и В12 подкрепят нормалната функция на имунната система.\r\nОбогатен с аминокиселината таурин.\r\nПоднасяйте изстуден.\r\nБез глутен.\r\nПодходящ за вегетарианци.',1,858.00,NULL,NULL,'ФАБ енергийна напитка','FAB Forever Active Boost'),
('1',5,'0000','Програма C9 ще ви помогне да поемете по пътя към своята по-здрава и по-елегантна същност. Този ефективен и лесен за спазване режим ще ви предостави необходимите инструменти да започнете да преобразявате тялото си още днес!',5,NULL,NULL,2,27032.00,NULL,NULL,NULL,'C9'),
('4,25',6,'022','Успокояващите свойства на алое вера са изключително подходящи за вашите устни. Те ги предпазват от слънцето и вятъра. Съчетахме най-добрите съставки, като масло от жожоба и пчелен восък, за да ви предложим най-ефикасния в света продукт за устни, подходящ за употреба през цялата година.\r\nБалсамът „Алое липс“ успокоява, омекотява и овлажнява напукани и сухи устни и защитава дори в най-екстремни атмосферни условия.\r\nНо това не е всичко. Независимо дали карате ски или правите слънчеви бани край реката или пък сте на барбекю в двора, нека „Алое липс“ ви е винаги под ръка. Той е идеална първа помощ при ухапвания, леки порязвания или изгаряния, а с компактния си размер лесно се побира в личната чанта или семейната аптечка.',6,NULL,'Овлажняващ устните балсам.\r\nЧудесен за първа помощ.\r\nБлясък за устни.\r\nЗащита при високи и ниски температури.',2,800.00,'Редовно нанасяйте на устните, за да ги овлажните, особено в сурови атмосферни условия. Като средство за първа помощ нанесете върху леки порезни рани, изгаряния или ухапвания.',NULL,'Алое липс','Aloe Lips'),
('473',4,'040','Алое фърст е прекрасна добавка към всяка аптечка за първа помощ. Тази изключителна формула защитава кожата от инфекции и възпаления. Създаден с висок процент стабилизиран гел от алое вера, Алое фърст съдържа и други подбрани съставки, поради което е незаменим продукт за различни кожни проблеми.\r\nПчелният прополис увеличава естествените антибиотични свойства на алое вера.\r\nАлантоинът защитава кожата и се среща в множество растения, включително във външната кора на листата на алоето.<br/>\r\nЕдинайсет внимателно подбрани билки, известни с благотворните си свойства, са добавени за още по-силен ефект.<br/>\r\nВсички тези съставки се съчетават в един естествено успокояващ спрей, подходящ при кожни раздразнения – обриви, ожулвания, прорезни рани и натъртвания. Лесен за употреба дори когато допирът с кожата е много болезнен, Алое фърст помага при леки порязвания, битови и слънчеви изгаряния. Алое фърст е с балансирано рН и има успокояващо действие дори върху най-чувствителната кожа. Успокоява и при тропически лишеи.\r\n<br/><br/>\r\nАлое фърст може да се пръска и върху косата, за да я защити от вредните ултравиолетови лъчи на слънцето. Използва се във фризьорски салони преди къдрене, за предотвратяване изсушаването на косата в резултат на използваните препарати. В козметичните салони Алое фърст действа особено успокояващо след кола маска.\r\n<br/><br/>\r\nАлое фърст е изключителен продукт, действително ненадминат в класа си.',7,NULL,'Трябва да присъства във всеки дом.\r\nУспокоява при изгаряния, обриви, ухапвания и ужилвания.\r\nПредпазва косата от слънчевите лъчи и от хлорни увреждания.\r\nЗащитава косата преди къдрене.',1,4524.00,'Нанесете обилно върху кожата, за да я успокоите и овлажните.',NULL,'Успокояващ алое спрей','Aloe First'),
('92',2,'067','Дезодорант, който повишава самочувствието ви и запазва усещането за свежест през целия ден. „Алое евършилд“ осигурява ефективна целодневна защита срещу неприятен мирис и може да се нанася веднага след като сте взели душ или сте приключили с кола-маската без да дразни кожата. Продуктът на Форевър Ливинг се възползва максимално от дезодориращите свойства на алоето и го съчетава с други отлични съставки.<br/>\r\nНежната формула със стабилизиран гел от алое вера не съдържа вредни алуминиеви соли, потискащи изпотяването, каквито намираме в много дезодоранти на пазара. Алуминият е токсичен метал. Смята се, че натрупването му в организма уврежда нервната система, а някои учени свързват „претоварването“ с алуминий с болестта на Алцхаймер. Алуминият може да наруши калциевия баланс в организма, поради влиянието си върху дейността на паращитовидната жлеза. Прекалено голямо количество паращитовиден хормон води до високо ниво на калция в кръвта, което се свърза с болки в костите, психиатрични симптоми и запек. Гордеем се, че можем да ви предоставим продукт, при който тези опасности са избегнати, без това да се е отразило на качеството.\r\n<br/><br/>\r\nУдобната форма на дезодоранта позволява нанасяне само там, където желаете. Специалната формула се плъзга гладко и не зацапва дрехите дори след продължителна употреба.',8,NULL,'Не съдържа алуминиеви соли.\r\nНе оставя петна по дрехите.\r\nМоже да се използва непосредствено след бръснене или депилиране.\r\nУдобната форма на дезодоранта го прави изключително икономичен.',2,1660.00,'Ежедневно нанасяйте сухият алое дезодорант под мишниците и се наслаждавайте на чувство за свежест и чистота през целия ден.',NULL,'Сух алое дезодорант','Aloe Ever-Shield Deodorant Stick');
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
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` (`color`, `id`, `title`) VALUES ('#ffb452',1,'Напитки'),
('#90f52c',2,'Добавки и хранене'),
('#c43cfa',3,'Етерични масла'),
('#f5d72c',4,'Пчелни продукти'),
('#f77cf7',5,'Контрол на теглото'),
('#8cc9ff',6,'Грижа за лицето');
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
INSERT INTO `product_image` (`image_id`, `product_id`) VALUES (1,1),
(2,1),
(2,2),
(3,2),
(4,2),
(2,3),
(3,3),
(4,3),
(5,3),
(2,4),
(1,5),
(2,5),
(3,5),
(1,6),
(2,6),
(3,6),
(4,6),
(2,7),
(3,7),
(4,7),
(1,8),
(3,8),
(4,8);
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_request`
--

DROP TABLE IF EXISTS `product_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `executed_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int DEFAULT NULL,
  `price` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_request`
--

LOCK TABLES `product_request` WRITE;
/*!40000 ALTER TABLE `product_request` DISABLE KEYS */;
INSERT INTO `product_request` (`client_name`, `comment`, `count`, `created_at`, `email`, `executed_at`, `id`, `message`, `phone`, `price`, `product_id`) VALUES ('Стефан Чонов',NULL,NULL,'2023-12-06 05:27:54','schonov@flp.bg',NULL,1,'Заявка за \"Гел от алое вера\" 1 брой с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 05:46:09','schonov@flp.bg',NULL,2,'Заявка за \"Гел от алое вера\" 1 брой с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 05:48:20','schonov@flp.bg',NULL,3,'Заявка за \"Гел от алое вера\" 1 брой с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 05:51:11','stefan.chonov@gmail.com',NULL,4,'Заявка за \"Гел от алое вера\" 1 брой с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 05:51:49','stefan.chonov@gmail.com',NULL,5,'Заявка за \"Гел от алое вера\" 1 брой с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 05:55:16','schonov@flp.bg',NULL,6,'Заявка за \"Гел от алое вера\" 1 брой с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 06:00:04','schonov@flp.bg',NULL,7,'Заявка за \"Алое бери нектар\" 1 брой с код \"73512\".','0877787178',NULL,3),
('Стефан Чонов',NULL,NULL,'2023-12-06 06:06:53','stefan.chonov@gmail.com',NULL,8,'Заявка за \"Гел от алое вера\" 1 брой с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 06:08:22','schonov@flp.bg',NULL,9,'Заявка за \"Гел от алое вера\" 1 брой с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 06:10:57','schonov@flp.bg',NULL,10,'Заявка за \"Гел от алое вера\" 1 брой с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 06:13:37','schonov@flp.bg',NULL,11,'Заявка за \"ТриПак - алое напитки\" 1 брой с код \"715\".','0877787178',NULL,1),
('Стефан Чонов',NULL,NULL,'2023-12-06 06:16:08','schonov@flp.bg',NULL,12,'Заявка за \"ТриПак - алое напитки\" 1 брой с код \"715\".','0877787178',NULL,1),
('Стефан Чонов',NULL,NULL,'2023-12-06 06:17:42','schonov@flp.bg',NULL,13,'Заявка за \"ТриПак - алое напитки\" 1 брой с код \"715\".','0877787178',NULL,1),
('Стефан Чонов',NULL,NULL,'2023-12-06 06:20:11','schonov@flp.bg',NULL,14,'Заявка за \"ТриПак - алое напитки\" 1 брой с код \"715\".','0877787178',NULL,1),
('Стефан Чонов',NULL,NULL,'2023-12-06 06:23:03','schonov@flp.bg',NULL,15,'Заявка за \"ТриПак - алое напитки\" 1 брой с код \"715\".','0877787178',NULL,1),
('Стефан Чонов',NULL,NULL,'2023-12-06 06:32:27','schonov@flp.bg',NULL,16,'Заявка за \"Гел от алое вера\" 1 брой с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 06:34:07','schonov@flp.bg',NULL,17,'Заявка за \"Гел от алое вера\" 1 брой с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 06:35:02','schonov@flp.bg',NULL,18,'Заявка за \"Гел от алое вера\" 1 брой с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 06:44:55','schonov@flp.bg',NULL,19,'Заявка за \"Гел от алое вера\" 1 брой с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 06:48:49','schonov@flp.bg',NULL,20,'Заявка за \"ТриПак - алое напитки\" 1 брой с код \"715\".','0877787178',NULL,1),
('Стефан Чонов',NULL,NULL,'2023-12-06 06:49:04','schonov@flp.bg',NULL,21,'Заявка за \"Алое бери нектар\" 1 брой с код \"73512\".','0877787178',NULL,3),
('Стефан Чонов',NULL,NULL,'2023-12-06 06:52:00','stefan.chonov@gmail.com',NULL,22,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 10:28:09','schonov@flp.bg',NULL,23,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 10:32:59','schonov@flp.bg',NULL,24,'Заявка за 1 брой \"ТриПак - алое напитки\" с код \"715\".','0877787178',NULL,1),
('Стефан Чонов',NULL,NULL,'2023-12-06 10:52:36','schonov@flp.bg',NULL,25,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 10:52:48','schonov@flp.bg',NULL,26,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 11:04:48','schonov@flp.bg',NULL,27,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 11:07:07','schonov@flp.bg',NULL,28,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 11:09:03','schonov@flp.bg',NULL,29,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 11:09:14','schonov@flp.bg',NULL,30,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 11:11:29','schonov@flp.bg',NULL,31,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 11:13:20','schonov@flp.bg',NULL,32,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 11:13:25','schonov@flp.bg',NULL,33,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 11:13:40','schonov@flp.bg',NULL,34,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 11:14:24','stefan.chonov@gmail.com',NULL,35,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 11:16:51','schonov@flp.bg',NULL,36,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 11:16:59','schonov@flp.bg',NULL,37,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 11:17:48','schonov@flp.bg',NULL,38,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 12:42:24','schonov@flp.bg',NULL,39,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 12:44:09','schonov@flp.bg',NULL,40,'Заявка за 1 брой \"Алое бери нектар\" с код \"73512\".','0877787178',NULL,3),
('Стефан Чонов',NULL,NULL,'2023-12-06 12:48:32','schonov@flp.bg',NULL,41,'Заявка за 1 брой \"Алое бери нектар\" с код \"73512\".','0877787178',NULL,3),
('Стефан Чонов',NULL,NULL,'2023-12-06 12:50:18','schonov@flp.bg',NULL,42,'Заявка за 1 брой \"Алое бери нектар\" с код \"73512\".','0877787178',NULL,3),
('Стефан Чонов',NULL,NULL,'2023-12-06 12:51:14','schonov@flp.bg',NULL,43,'Заявка за 1 брой \"Алое бери нектар\" с код \"73512\".','0877787178',NULL,3),
('Стефан Чонов',NULL,NULL,'2023-12-06 12:58:30','schonov@flp.bg',NULL,44,'Заявка за 1 брой \"Алое бери нектар\" с код \"73512\".','0877787178',NULL,3),
('Стефан Чонов',NULL,NULL,'2023-12-06 13:01:31','schonov@flp.bg',NULL,45,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 13:01:34','schonov@flp.bg',NULL,46,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 13:01:36','schonov@flp.bg',NULL,47,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 13:01:37','schonov@flp.bg',NULL,48,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 13:01:38','schonov@flp.bg',NULL,49,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 13:01:39','schonov@flp.bg',NULL,50,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 13:01:39','schonov@flp.bg',NULL,51,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 13:01:40','schonov@flp.bg',NULL,52,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 13:01:40','schonov@flp.bg',NULL,53,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 13:01:40','schonov@flp.bg',NULL,54,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 13:01:40','schonov@flp.bg',NULL,55,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 13:01:41','schonov@flp.bg',NULL,56,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 13:01:45','schonov@flp.bg',NULL,57,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('',NULL,NULL,'2023-12-06 13:01:52','',NULL,58,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 13:08:33','schonov@flp.bg',NULL,59,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 13:45:39','stefan.chonov@gmail.com',NULL,60,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 13:47:48','schonov@flp.bg',NULL,61,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 14:11:37','schonov@flp.bg',NULL,62,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-06 15:27:22','stefan.chonov@gmail.com',NULL,63,'Заявка за 1 брой \"Гел от алое вера\" с код \"71612\".','0877787178',NULL,2),
('Стефан Чонов',NULL,NULL,'2023-12-07 05:06:05','schonov@flp.bg',NULL,64,'Заявка за 1 брой \"ФАБ енергийна напитка\" с продуктов код \"721\".','',NULL,4),
('Стефан Чонов',NULL,NULL,'2023-12-07 05:06:18','schonov@flp.bg',NULL,65,'Заявка за 1 брой \"ФАБ енергийна напитка\" с продуктов код \"721\".','',NULL,4);
/*!40000 ALTER TABLE `product_request` ENABLE KEYS */;
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
INSERT INTO `user` (`created_at`, `email`, `id`, `password`, `roles`, `username`) VALUES ('2023-12-05 05:12:26','schonov@flp.bg',1,'$2y$13$DDV/bBGDuaBo1sx.rPGmf.E2ZFgjgRJ6UHBuzm775ZHOLU09co5Su','[\"ROLE_ADMIN\"]','schonov');
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

-- Dump completed on 2023-12-07  5:30:55

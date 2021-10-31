-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.17-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for gta_rp2
CREATE DATABASE IF NOT EXISTS `gta_rp2` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `gta_rp2`;

-- Dumping structure for table gta_rp2.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL DEFAULT 'John',
  `last_name` varchar(50) NOT NULL DEFAULT 'Doe',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dob` varchar(50) DEFAULT 'NULL',
  `cash` int(9) DEFAULT 2500,
  `bank` int(9) NOT NULL DEFAULT 10000,
  `phone_number` longtext NOT NULL,
  `story` text NOT NULL,
  `new` int(1) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `gender` int(1) NOT NULL DEFAULT 0,
  `jail_time` int(11) NOT NULL DEFAULT 0,
  `stress_level` int(11) DEFAULT 0,
  `metaData` varchar(1520) DEFAULT '{"thirst":100,"hunger":100,"armour":0,"health":200}',
  `bones` mediumtext DEFAULT '{}',
  `emotes` varchar(4160) DEFAULT '{}',
  `paycheck` int(11) DEFAULT 0,
  `meta` text DEFAULT 'move_m@gangster@var_e',
  `casino` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.characters: ~0 rows (approximately)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.characters_cars
CREATE TABLE IF NOT EXISTS `characters_cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `purchase_price` float DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `vehicle_state` longtext DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `name` varchar(50) DEFAULT NULL,
  `engine_damage` bigint(19) unsigned DEFAULT 1000,
  `body_damage` bigint(20) DEFAULT 1000,
  `degredation` longtext DEFAULT '100,100,100,100,100,100,100,100',
  `current_garage` varchar(50) DEFAULT 'I',
  `financed` int(11) DEFAULT 0,
  `last_payment` int(11) DEFAULT 0,
  `coords` longtext DEFAULT NULL,
  `license_plate` varchar(255) NOT NULL DEFAULT '',
  `payments_left` int(3) DEFAULT 0,
  `server_number` int(11) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `repoed` int(11) NOT NULL DEFAULT 0,
  `finance_time` int(11) NOT NULL DEFAULT 10080,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.characters_cars: ~0 rows (approximately)
/*!40000 ALTER TABLE `characters_cars` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters_cars` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.characters_weapons
CREATE TABLE IF NOT EXISTS `characters_weapons` (
  `id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `ammo` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.characters_weapons: ~0 rows (approximately)
/*!40000 ALTER TABLE `characters_weapons` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters_weapons` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.character_current
CREATE TABLE IF NOT EXISTS `character_current` (
  `cid` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `drawables` mediumtext DEFAULT NULL,
  `props` mediumtext DEFAULT NULL,
  `drawtextures` mediumtext DEFAULT NULL,
  `proptextures` mediumtext DEFAULT NULL,
  `assExists` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.character_current: ~0 rows (approximately)
/*!40000 ALTER TABLE `character_current` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_current` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.character_face
CREATE TABLE IF NOT EXISTS `character_face` (
  `cid` int(11) DEFAULT NULL,
  `hairColor` mediumtext DEFAULT NULL,
  `headBlend` mediumtext DEFAULT NULL,
  `headOverlay` mediumtext DEFAULT NULL,
  `headStructure` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.character_face: ~0 rows (approximately)
/*!40000 ALTER TABLE `character_face` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_face` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.character_outfits
CREATE TABLE IF NOT EXISTS `character_outfits` (
  `cid` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  `drawables` text DEFAULT '{}',
  `props` text DEFAULT '{}',
  `drawtextures` text DEFAULT '{}',
  `proptextures` text DEFAULT '{}',
  `hairColor` text DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.character_outfits: ~0 rows (approximately)
/*!40000 ALTER TABLE `character_outfits` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_outfits` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.character_passes
CREATE TABLE IF NOT EXISTS `character_passes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `rank` int(11) NOT NULL DEFAULT 1,
  `name` text NOT NULL,
  `giver` text NOT NULL,
  `pass_type` text NOT NULL,
  `business_name` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.character_passes: ~0 rows (approximately)
/*!40000 ALTER TABLE `character_passes` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_passes` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.delivery_job
CREATE TABLE IF NOT EXISTS `delivery_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` float DEFAULT NULL,
  `jobType` varchar(50) DEFAULT NULL,
  `dropAmount` int(2) DEFAULT NULL,
  `pickup` varchar(255) DEFAULT NULL,
  `drop` varchar(255) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table gta_rp2.delivery_job: ~30 rows (approximately)
/*!40000 ALTER TABLE `delivery_job` DISABLE KEYS */;
INSERT INTO `delivery_job` (`id`, `active`, `jobType`, `dropAmount`, `pickup`, `drop`) VALUES
	(1, 0, 'trucker', 5, '{2747.82, 3454.10,56.01}', '{-441.81, -75.55, 41.18}'),
	(2, 0, 'trucker', 6, '{2747.82, 3454.10,56.01}', '{1170.60, -291.72, 69.02}'),
	(3, 0, 'trucker', 4, '{2747.82, 3454.10,56.01}', '{-45.31, -1662.97, 29.28}'),
	(4, 0, 'trucker', 5, '{2747.82, 3454.10,56.01}', '{378.23, -1028.82, 29.33}'),
	(5, 0, 'trucker', 3, '{2747.82, 3454.10,56.01}', '{-580.60, -1008.78, 22.32}'),
	(1, 0, 'trucker', 5, '{2747.82, 3454.10,56.01}', '{-441.81, -75.55, 41.18}'),
	(2, 0, 'trucker', 6, '{2747.82, 3454.10,56.01}', '{1170.60, -291.72, 69.02}'),
	(3, 0, 'trucker', 4, '{2747.82, 3454.10,56.01}', '{-45.31, -1662.97, 29.28}'),
	(4, 0, 'trucker', 5, '{2747.82, 3454.10,56.01}', '{378.23, -1028.82, 29.33}'),
	(5, 0, 'trucker', 3, '{2747.82, 3454.10,56.01}', '{-580.60, -1008.78, 22.32}'),
	(1, 0, 'trucker', 5, '{2747.82, 3454.10,56.01}', '{-441.81, -75.55, 41.18}'),
	(2, 0, 'trucker', 6, '{2747.82, 3454.10,56.01}', '{1170.60, -291.72, 69.02}'),
	(3, 0, 'trucker', 4, '{2747.82, 3454.10,56.01}', '{-45.31, -1662.97, 29.28}'),
	(4, 0, 'trucker', 5, '{2747.82, 3454.10,56.01}', '{378.23, -1028.82, 29.33}'),
	(5, 0, 'trucker', 3, '{2747.82, 3454.10,56.01}', '{-580.60, -1008.78, 22.32}'),
	(1, 0, 'trucker', 5, '{2747.82, 3454.10,56.01}', '{-441.81, -75.55, 41.18}'),
	(2, 0, 'trucker', 6, '{2747.82, 3454.10,56.01}', '{1170.60, -291.72, 69.02}'),
	(3, 0, 'trucker', 4, '{2747.82, 3454.10,56.01}', '{-45.31, -1662.97, 29.28}'),
	(4, 0, 'trucker', 5, '{2747.82, 3454.10,56.01}', '{378.23, -1028.82, 29.33}'),
	(5, 0, 'trucker', 3, '{2747.82, 3454.10,56.01}', '{-580.60, -1008.78, 22.32}'),
	(1, 0, 'trucker', 5, '{2747.82, 3454.10,56.01}', '{-441.81, -75.55, 41.18}'),
	(2, 0, 'trucker', 6, '{2747.82, 3454.10,56.01}', '{1170.60, -291.72, 69.02}'),
	(3, 0, 'trucker', 4, '{2747.82, 3454.10,56.01}', '{-45.31, -1662.97, 29.28}'),
	(4, 0, 'trucker', 5, '{2747.82, 3454.10,56.01}', '{378.23, -1028.82, 29.33}'),
	(5, 0, 'trucker', 3, '{2747.82, 3454.10,56.01}', '{-580.60, -1008.78, 22.32}'),
	(1, 0, 'trucker', 5, '{2747.82, 3454.10,56.01}', '{-441.81, -75.55, 41.18}'),
	(2, 0, 'trucker', 6, '{2747.82, 3454.10,56.01}', '{1170.60, -291.72, 69.02}'),
	(3, 0, 'trucker', 4, '{2747.82, 3454.10,56.01}', '{-45.31, -1662.97, 29.28}'),
	(4, 0, 'trucker', 5, '{2747.82, 3454.10,56.01}', '{378.23, -1028.82, 29.33}'),
	(5, 0, 'trucker', 3, '{2747.82, 3454.10,56.01}', '{-580.60, -1008.78, 22.32}');
/*!40000 ALTER TABLE `delivery_job` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.exploiters
CREATE TABLE IF NOT EXISTS `exploiters` (
  `type` text DEFAULT NULL,
  `log` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `steam_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.exploiters: ~0 rows (approximately)
/*!40000 ALTER TABLE `exploiters` DISABLE KEYS */;
/*!40000 ALTER TABLE `exploiters` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `jailtime` int(11) DEFAULT 0,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table gta_rp2.fine_types: ~112 rows (approximately)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `jailtime`, `category`) VALUES
	(1, 'Illegal Passing', 30, 2, 0),
	(2, 'Excessive vehicle noise', 30, 2, 0),
	(3, 'Failure to Stop', 50, 3, 0),
	(4, 'Following too closely', 50, 3, 0),
	(5, 'Failure to Yield', 100, 3, 0),
	(6, 'Illegal Parking', 100, 3, 0),
	(7, 'Illegal Passing', 100, 3, 0),
	(8, 'Impeding traffic flow', 120, 3, 0),
	(10, 'Criminal Negligence', 750, 12, 0),
	(11, 'Operation of a Non-Street Legal Vehicle', 500, 10, 0),
	(12, 'Operating a Motor Vehicle Without a License', 700, 10, 0),
	(13, 'Reckless Driving', 800, 10, 0),
	(14, 'Felony Speeding', 800, 10, 0),
	(15, 'Exceeding Speeds Over 5-15 mph', 80, 3, 0),
	(16, 'Exceeding Speeds Over 15-30 mph', 175, 6, 0),
	(27, 'Vehicle Tampering', 800, 10, 0),
	(28, 'Theft of a Government Vehicle', 3750, 45, 0),
	(30, 'Grand Theft Auto', 1200, 15, 0),
	(31, 'Hit and Run', 1000, 10, 0),
	(32, 'Aggravated Hit and Run', 1250, 15, 0),
	(33, 'Felony Evasion', 2000, 20, 0),
	(34, 'Misuse of 911', 400, 5, 0),
	(35, 'Loitering', 420, 2, 0),
	(37, 'Idecent Exposure', 500, 3, 0),
	(38, 'Tresspassing on Government Property', 1500, 10, 0),
	(39, 'Trespassing', 500, 3, 0),
	(40, 'Harassment', 500, 3, 0),
	(44, 'Failure to Identify', 500, 5, 0),
	(45, 'Stalking', 750, 10, 0),
	(47, 'Disturbing the Peace', 500, 8, 0),
	(48, 'Theft', 500, 10, 0),
	(49, 'Battery', 1200, 10, 0),
	(50, 'Tampering with Evidence', 1500, 15, 0),
	(51, 'Criminal Threats', 750, 15, 0),
	(52, 'Brandishing a Firearm', 1500, 10, 0),
	(53, 'Failure to Comply with a Lawful Order', 1500, 10, 0),
	(54, 'Vandalism of Goverment Property', 1600, 15, 0),
	(56, 'Assault', 1125, 12, 0),
	(57, 'Unlawful Discharge of a Firearm', 2200, 15, 0),
	(58, 'Brandishing a Deadly Weapon', 1000, 15, 0),
	(59, 'Resisting Arrest', 750, 12, 0),
	(60, 'Obstruction of Justice', 1125, 18, 0),
	(62, 'Bribery', 1000, 10, 0),
	(65, 'Maintaining a Place for the Purpose of Distribution', 1500, 20, 0),
	(67, 'Possession of Illegal Ammunition', 1000, 10, 0),
	(69, 'Possession of a Controlled Substance with Intent to Distribute', 1250, 15, 0),
	(70, 'Weapons Trafficking', 6000, 25, 0),
	(72, 'Money Laundering', 1500, 20, 0),
	(75, 'Drug Trafficking', 850, 10, 0),
	(79, 'Drug Cultivation and Manufacturing', 2000, 20, 0),
	(80, 'Racketeering / RICO', 50000, 99999999, 0),
	(81, 'Terroristic Threat', 750, 12, 0),
	(84, 'Attempted Robbery', 1000, 15, 0),
	(85, 'Kidnapping', 1000, 15, 0),
	(86, 'Terroristic Acts', 1000, 15, 0),
	(87, 'Armed Robbery', 2000, 20, 0),
	(88, 'Aggravated Assault', 2000, 20, 0),
	(89, 'Vehicular Manslaughter', 1500, 20, 0),
	(90, 'Aggravated Battery', 3000, 25, 0),
	(91, 'Attempted Murder', 3500, 20, 0),
	(92, 'Armed Bank Robbery', 5000, 20, 0),
	(93, 'Second Degree Murder', 4000, 25, 0),
	(94, 'Voluntary Manslaughter', 3500, 30, 0),
	(95, 'Arson', 2000, 15, 0),
	(96, 'First Degree Murder', 5000, 45, 0),
	(97, 'Aggravated Attempted Murder', 3000, 30, 0),
	(98, 'Organ Harvesting', 1500, 35, 0),
	(99, 'Possession of Class 1 Weapon', 250, 3, 0),
	(100, 'Possession of Class 2 Weapon', 1000, 6, 0),
	(101, 'Possession of Government Equipment', 1000, 10, 0),
	(102, 'Possession of Class 3 Firearm', 2500, 15, 0),
	(103, 'Possession of Explosives', 1500, 10, 0),
	(104, 'Drug Cultivation and Manufacturing', 500, 10, 0),
	(105, 'Drug Distribution/Intent to Distrubute - Class 1', 500, 5, 0),
	(106, 'Drug Distribution/Intent to Distrubute - Class 2', 1000, 10, 0),
	(107, 'Possession of Class 1 Narcotics', 500, 10, 0),
	(108, 'Possession of Class 2 Narcotics', 1000, 15, 0),
	(109, 'Aiding & Abetting', 1000, 10, 0),
	(110, 'Escaping Custody', 750, 12, 0),
	(111, 'Sucessful Prison Break', 1500, 15, 0),
	(112, 'Joy Riding', 350, 10, 0),
	(113, 'Fleeing & Eluding', 800, 10, 0),
	(114, 'Burglary', 500, 10, 0),
	(115, 'Impersonation of a Government Official', 1000, 15, 0),
	(116, 'Destruction of Property', 500, 5, 0),
	(118, 'Possession of Illegal Weapon Attachment', 1000, 15, 0),
	(119, 'Possession of Contraband', 100, 5, 0),
	(120, 'Disorderly Conduct', 250, 5, 0),
	(125, 'Possession of Stolen Goods', 500, 10, 0),
	(126, 'Corruption', 15000, 120, 0),
	(129, 'Violation of a No Fly Zone', 1000, 15, 0),
	(130, 'Operation of Non-Street Legal Vehicle', 500, 5, 0),
	(131, 'Perjury', 1000, 18, 0),
	(132, 'Obstruction of Justice', 1000, 15, 0),
	(133, 'Contempt of Court', 2000, 15, 0),
	(134, 'Breaking and Entering', 150, 10, 0),
	(136, 'Conspiracy', 500, 10, 0),
	(137, 'Solicitation', 100, 5, 0),
	(138, 'Attempted Commission of a Crime', 500, 10, 0),
	(140, 'Possession Of A PD Weapon', 10000, 25, 0),
	(144, 'Armed Robbery of the Union Depository', 10000, 50, 0),
	(145, 'Armed Robbery of the Pacific Standard Bank', 8000, 45, 0),
	(146, 'Usage Of A AirCraft without proper license', 5000, 30, 0),
	(147, 'Aggravated Assault', 2000, 27, 0),
	(148, 'Armed Bank Truck Robbery', 2500, 30, 0),
	(149, 'Involuntary Manslaughter', 3000, 25, 0),
	(150, 'Robbery', 1500, 15, 0),
	(151, 'Weapons Distribution', 2000, 20, 0),
	(152, 'Failure to Yeild to an Emergency Vehicle', 200, 5, 0),
	(153, 'Assault with a Deadly Weapon', 2000, 15, 0),
	(201, 'Sexual Harassment', 1000, 20, 0),
	(202, 'Attempted Prison Break', 1500, 15, 0);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.group_banking
CREATE TABLE IF NOT EXISTS `group_banking` (
  `group_type` mediumtext DEFAULT NULL,
  `bank` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.group_banking: ~12 rows (approximately)
/*!40000 ALTER TABLE `group_banking` DISABLE KEYS */;
INSERT INTO `group_banking` (`group_type`, `bank`) VALUES
	('burger_shot', 0),
	('police', 958396),
	('ems', 0),
	('car_shop', 416338),
	('tuner_shop', 59121),
	('harmony_autos', 3861),
	('arcade', 0),
	('VU', 0),
	('bahamas_bar', 0),
	('auto_exotics', 42742),
	('weed_store', 10000),
	('news', 0);
/*!40000 ALTER TABLE `group_banking` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.jobs_whitelist
CREATE TABLE IF NOT EXISTS `jobs_whitelist` (
  `owner` varchar(50) NOT NULL,
  `cid` int(11) NOT NULL,
  `job` varchar(50) DEFAULT 'unemployed',
  `rank` int(11) DEFAULT 0,
  `callsign` varchar(255) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.jobs_whitelist: ~0 rows (approximately)
/*!40000 ALTER TABLE `jobs_whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs_whitelist` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `type` text DEFAULT NULL,
  `log` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `steam_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `incident` longtext DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `jailtime` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.mdt_reports: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdt_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_reports` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.mdt_warrants
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `char_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_title` varchar(255) DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `expire` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.mdt_warrants: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdt_warrants` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_warrants` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.mech_materials
CREATE TABLE IF NOT EXISTS `mech_materials` (
  `Shop` mediumtext NOT NULL,
  `rubber` int(11) NOT NULL DEFAULT 0,
  `aluminium` int(11) NOT NULL DEFAULT 0,
  `scrapmetal` int(11) NOT NULL DEFAULT 0,
  `plastic` int(11) NOT NULL DEFAULT 0,
  `copper` int(11) NOT NULL DEFAULT 0,
  `steel` int(11) NOT NULL DEFAULT 0,
  `glass` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table gta_rp2.mech_materials: ~3 rows (approximately)
/*!40000 ALTER TABLE `mech_materials` DISABLE KEYS */;
INSERT INTO `mech_materials` (`Shop`, `rubber`, `aluminium`, `scrapmetal`, `plastic`, `copper`, `steel`, `glass`) VALUES
	('auto_exotics', 51, 50, 50, 50, 50, 50, 55),
	('tuner_shop', 32, 32, 118, 83, 49, 40, 92),
	('harmony_autos', 50, 50, 50, 50, 50, 50, 50);
/*!40000 ALTER TABLE `mech_materials` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.modded_cars
CREATE TABLE IF NOT EXISTS `modded_cars` (
  `id` int(11) DEFAULT NULL,
  `license_plate` varchar(255) DEFAULT NULL,
  `Extractors` varchar(255) DEFAULT '{}',
  `Filter` varchar(255) DEFAULT '{}',
  `Suspension` varchar(255) DEFAULT '{}',
  `Rollbars` varchar(255) DEFAULT '{}',
  `Bored` varchar(255) DEFAULT '{}',
  `Carbon` varchar(255) DEFAULT '{}',
  `LFront` varchar(255) DEFAULT '{}',
  `RFront` varchar(255) DEFAULT '{}',
  `LBack` varchar(255) DEFAULT '{}',
  `RBack` varchar(255) DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.modded_cars: ~0 rows (approximately)
/*!40000 ALTER TABLE `modded_cars` DISABLE KEYS */;
/*!40000 ALTER TABLE `modded_cars` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.phone_yp
CREATE TABLE IF NOT EXISTS `phone_yp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `job` varchar(500) DEFAULT NULL,
  `phonenumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.phone_yp: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_yp` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_yp` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.playerstattoos
CREATE TABLE IF NOT EXISTS `playerstattoos` (
  `identifier` int(11) DEFAULT NULL,
  `tattoos` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.playerstattoos: ~0 rows (approximately)
/*!40000 ALTER TABLE `playerstattoos` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerstattoos` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.racing_tracks
CREATE TABLE IF NOT EXISTS `racing_tracks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkpoints` text DEFAULT NULL,
  `track_name` text DEFAULT NULL,
  `creator` text DEFAULT NULL,
  `distance` text DEFAULT NULL,
  `races` text DEFAULT NULL,
  `fastest_car` text DEFAULT NULL,
  `fastest_name` text DEFAULT NULL,
  `fastest_lap` int(11) DEFAULT NULL,
  `fastest_sprint` int(11) DEFAULT NULL,
  `fastest_sprint_name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.racing_tracks: ~0 rows (approximately)
/*!40000 ALTER TABLE `racing_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `racing_tracks` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.transaction_history
CREATE TABLE IF NOT EXISTS `transaction_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text NOT NULL,
  `trans_id` int(11) NOT NULL,
  `account` text NOT NULL,
  `amount` int(11) NOT NULL,
  `trans_type` text NOT NULL,
  `receiver` text NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.transaction_history: ~0 rows (approximately)
/*!40000 ALTER TABLE `transaction_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_history` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.tweets
CREATE TABLE IF NOT EXISTS `tweets` (
  `handle` longtext NOT NULL,
  `message` varchar(500) NOT NULL,
  `time` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.tweets: ~0 rows (approximately)
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tweets` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hex_id` varchar(100) DEFAULT NULL,
  `steam_id` varchar(50) DEFAULT NULL,
  `community_id` varchar(100) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'Uknown',
  `rank` varchar(50) NOT NULL DEFAULT 'user',
  `date_created` timestamp NULL DEFAULT current_timestamp(),
  `controls` text DEFAULT '{}',
  `settings` mediumtext DEFAULT '{"ctrlMovesHalf":true,"holdToDrag":true,"closeOnClick":true,"enableBlur":true,"showTooltips":false}',
  `inventory_settings` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.user_bans
CREATE TABLE IF NOT EXISTS `user_bans` (
  `steam_id` longtext NOT NULL DEFAULT '',
  `discord_id` longtext NOT NULL DEFAULT '',
  `steam_name` longtext NOT NULL DEFAULT '',
  `reason` longtext NOT NULL DEFAULT '',
  `details` longtext NOT NULL,
  `date_banned` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.user_bans: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_bans` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.user_contacts
CREATE TABLE IF NOT EXISTS `user_contacts` (
  `identifier` varchar(40) NOT NULL,
  `name` longtext NOT NULL,
  `number` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.user_contacts: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_contacts` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.user_convictions
CREATE TABLE IF NOT EXISTS `user_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=788 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.user_convictions: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_convictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_convictions` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.user_inventory2
CREATE TABLE IF NOT EXISTS `user_inventory2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `item_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `quality` int(11) NOT NULL DEFAULT 100,
  `information` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `slot` int(11) NOT NULL,
  `dropped` tinyint(4) NOT NULL DEFAULT 0,
  `creationDate` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table gta_rp2.user_inventory2: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_inventory2` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_inventory2` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `owner` longtext NOT NULL,
  `type` longtext NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.user_licenses: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.user_mdt
CREATE TABLE IF NOT EXISTS `user_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL,
  `bail` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.user_mdt: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_mdt` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_mdt` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.user_messages
CREATE TABLE IF NOT EXISTS `user_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table gta_rp2.user_messages: 0 rows
/*!40000 ALTER TABLE `user_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_messages` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.vehicle_mdt
CREATE TABLE IF NOT EXISTS `vehicle_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) DEFAULT NULL,
  `stolen` bit(1) DEFAULT b'0',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.vehicle_mdt: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_mdt` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_mdt` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.weapon_serials
CREATE TABLE IF NOT EXISTS `weapon_serials` (
  `owner` text NOT NULL,
  `serial` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.weapon_serials: ~0 rows (approximately)
/*!40000 ALTER TABLE `weapon_serials` DISABLE KEYS */;
/*!40000 ALTER TABLE `weapon_serials` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.weed
CREATE TABLE IF NOT EXISTS `weed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` int(11) DEFAULT 0,
  `y` int(11) DEFAULT 0,
  `z` int(11) DEFAULT 0,
  `growth` int(11) DEFAULT 0,
  `type` varchar(50) DEFAULT NULL,
  `time` longtext DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table gta_rp2.weed: ~0 rows (approximately)
/*!40000 ALTER TABLE `weed` DISABLE KEYS */;
/*!40000 ALTER TABLE `weed` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.__banking_logs
CREATE TABLE IF NOT EXISTS `__banking_logs` (
  `cid` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `reason` longtext NOT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `business` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table gta_rp2.__banking_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `__banking_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `__banking_logs` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.__housedata
CREATE TABLE IF NOT EXISTS `__housedata` (
  `cid` int(11) NOT NULL,
  `house_id` int(11) DEFAULT NULL,
  `house_model` int(11) DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `upfront` int(11) DEFAULT NULL,
  `housename` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `garages` longtext COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `furniture` longtext COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `status` mediumtext COLLATE utf8mb4_bin NOT NULL DEFAULT 'locked',
  `force_locked` mediumtext COLLATE utf8mb4_bin NOT NULL DEFAULT 'unlocked',
  `due` int(11) NOT NULL,
  `overall` int(11) NOT NULL,
  `payments` int(11) NOT NULL,
  `days` int(11) NOT NULL,
  `can_pay` mediumtext COLLATE utf8mb4_bin NOT NULL DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table gta_rp2.__housedata: ~0 rows (approximately)
/*!40000 ALTER TABLE `__housedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `__housedata` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.__housekeys
CREATE TABLE IF NOT EXISTS `__housekeys` (
  `cid` int(11) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `house_model` int(11) DEFAULT NULL,
  `housename` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `name` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `garages` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Dumping data for table gta_rp2.__housekeys: ~0 rows (approximately)
/*!40000 ALTER TABLE `__housekeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `__housekeys` ENABLE KEYS */;

-- Dumping structure for table gta_rp2.__motels
CREATE TABLE IF NOT EXISTS `__motels` (
  `cid` longtext COLLATE utf8mb4_bin NOT NULL,
  `roomType` int(11) NOT NULL,
  `roomNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table gta_rp2.__motels: ~0 rows (approximately)
/*!40000 ALTER TABLE `__motels` DISABLE KEYS */;
/*!40000 ALTER TABLE `__motels` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

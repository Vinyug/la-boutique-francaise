-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 01, 2023 at 08:14 AM
-- Server version: 8.0.31
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laboutiquefrancaise`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D4E6F81A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `user_id`, `lastname`, `firstname`, `company`, `address`, `postal`, `city`, `country`, `phone`, `name`) VALUES
(1, 2, 'nom', 'prenom', 'Société', '1 rue Jean', '00000', 'VILLE', 'FR', '0202020202', 'Ma maison'),
(4, 2, 'Nom', 'Prénom', 'Société', '2, rue Travail', '00001', 'VILLETRAVAILLE', 'FR', '0101010101', 'Mon travail'),
(5, 13, 'NomTest2', 'PrénomTest2', NULL, '1 rue test2', '00000', 'TEST2', 'France', '0000000000', 'Maison Test2'),
(6, 15, 'test', 'test', NULL, 'test', '0', 'test', 'FR', '0', 'test'),
(7, 16, 'ntesta', 'ptesta', NULL, '1 rue test', '00000', 'VILLE', 'FR', '0000000000', 'maison testa');

-- --------------------------------------------------------

--
-- Table structure for table `carrier`
--

DROP TABLE IF EXISTS `carrier`;
CREATE TABLE IF NOT EXISTS `carrier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES
(1, 'Colissimo', 'Profitez d\'une livraison premium avec un colis chez vous dans les 72 prochaines heures.', 990),
(2, 'Chronopost', 'Profitez de la livraison Express pour être livré le lendemain de votre commande.', 1490);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Manteaux'),
(2, 'Bonnets'),
(3, 'T-shirts'),
(4, 'Echarpes');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230120115430', '2023-01-20 11:56:30', 77),
('DoctrineMigrations\\Version20230120141556', '2023-01-20 14:31:33', 434),
('DoctrineMigrations\\Version20230123080712', '2023-01-23 08:07:27', 525),
('DoctrineMigrations\\Version20230123082332', '2023-01-23 08:23:43', 94),
('DoctrineMigrations\\Version20230125132544', '2023-01-25 13:25:56', 585),
('DoctrineMigrations\\Version20230125133158', '2023-01-25 13:32:03', 37),
('DoctrineMigrations\\Version20230125162801', '2023-01-25 16:28:07', 483),
('DoctrineMigrations\\Version20230126082240', '2023-01-26 08:22:52', 45),
('DoctrineMigrations\\Version20230126091105', '2023-01-26 09:11:17', 562),
('DoctrineMigrations\\Version20230126113928', '2023-01-26 11:39:39', 40),
('DoctrineMigrations\\Version20230127113737', '2023-01-27 11:37:42', 513),
('DoctrineMigrations\\Version20230127135912', '2023-01-27 13:59:17', 507),
('DoctrineMigrations\\Version20230130154933', '2023-01-30 15:49:45', 492),
('DoctrineMigrations\\Version20230131081526', '2023-01-31 08:15:31', 525),
('DoctrineMigrations\\Version20230131084303', '2023-01-31 08:43:11', 37),
('DoctrineMigrations\\Version20230131101033', '2023-01-31 10:10:40', 110);

-- --------------------------------------------------------

--
-- Table structure for table `header`
--

DROP TABLE IF EXISTS `header`;
CREATE TABLE IF NOT EXISTS `header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `header`
--

INSERT INTO `header` (`id`, `title`, `content`, `btn_title`, `btn_url`, `illustration`) VALUES
(1, 'Test', 'Test', 'Test', '/nos-produits', '695ebe79dee0f44b0ac461607c17a3b325b4478b.jpg'),
(2, 'Chic et élégant', 'Le style minimaliste est toujours à la mode et ce look n\'y fait pas exception.', 'Chic et élégant', '/nos-produits', '010fe8470c4d84827836b5f2f152940ecef79b2e.jpg'),
(3, 'Accessoires statement', 'Les accessoires peuvent faire toute la différence, comme en témoigne ce sac à main extravagant.', 'Accessoires statement', '/nos-produits?string=&categories%5B%5D=2&categories%5B%5D=4&submit=', '26a83771d5371409d5481cc1abad6accf82272c3.jpg'),
(4, 'Le style urbain', 'Mélangez le confort et la tendance avec ce look urbain.', 'Le style urbain', '/nos-produits', '1578f07474e5ae0e37b16cc7316ab15764c35153.jpg'),
(5, 'Accessoires de mode à la boutique', 'Complétez votre look avec les derniers accessoires de mode disponibles à la boutique.', 'Accessoires de mode à la boutique', '/nos-produits', '5a756796049d10556a7ae65939dd2b4881a89c1c.jpg'),
(6, 'Tenue décontractée pour les soirées', 'Soyez à l\'aise et élégant lors de vos soirées avec cette tenue décontractée.', 'Tenue décontractée pour les soirées', '/nos-produits', 'b6bbd764daddec372726b73e2582154b693f517a.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `carrier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F5299398A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `created_at`, `carrier_name`, `carrier_price`, `delivery`, `reference`, `stripe_session_id`, `state`) VALUES
(1, 2, '2023-01-26 12:42:55', 'Chronopost', 14.9, 'Prénom Nom</br>0101010101</br>Sociétée</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '', NULL, 0),
(2, 2, '2023-01-27 11:43:25', 'Chronopost', 14.9, 'prenom nom</br>0202020202</br>Société</br>1 rue Jean</br>00000 VILLE</br>FR', '27012023-63d3b8dd7eece', NULL, 0),
(3, 2, '2023-01-27 11:48:58', 'Chronopost', 14.9, 'prenom nom</br>0202020202</br>Société</br>1 rue Jean</br>00000 VILLE</br>FR', '27012023-63d3ba2a853f4', NULL, 0),
(4, 2, '2023-01-27 11:49:45', 'Chronopost', 14.9, 'prenom nom</br>0202020202</br>Société</br>1 rue Jean</br>00000 VILLE</br>FR', '27012023-63d3ba59373c0', NULL, 0),
(5, 2, '2023-01-27 11:50:55', 'Chronopost', 14.9, 'prenom nom</br>0202020202</br>Société</br>1 rue Jean</br>00000 VILLE</br>FR', '27012023-63d3ba9f08097', NULL, 0),
(6, 2, '2023-01-27 11:53:37', 'Chronopost', 14.9, 'prenom nom</br>0202020202</br>Société</br>1 rue Jean</br>00000 VILLE</br>FR', '27012023-63d3bb41bc622', NULL, 0),
(7, 2, '2023-01-27 11:54:51', 'Chronopost', 14.9, 'prenom nom</br>0202020202</br>Société</br>1 rue Jean</br>00000 VILLE</br>FR', '27012023-63d3bb8b77bec', NULL, 0),
(8, 2, '2023-01-27 11:56:25', 'Colissimo', 9.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3bbe9a0c04', NULL, 0),
(9, 2, '2023-01-27 11:57:26', 'Colissimo', 9.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3bc264f330', NULL, 0),
(10, 2, '2023-01-27 11:57:45', 'Colissimo', 9.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3bc3993e31', NULL, 0),
(11, 2, '2023-01-27 11:58:45', 'Colissimo', 9.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3bc759672e', NULL, 0),
(12, 2, '2023-01-27 12:00:37', 'Colissimo', 9.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3bce5ac56d', NULL, 0),
(13, 2, '2023-01-27 12:05:27', 'Colissimo', 9.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3be0780b76', NULL, 0),
(14, 2, '2023-01-27 12:07:51', 'Chronopost', 14.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3be97e8998', NULL, 0),
(15, 2, '2023-01-27 12:27:03', 'Chronopost', 14.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3c3178bf4f', NULL, 0),
(16, 2, '2023-01-27 12:27:33', 'Chronopost', 14.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3c3358c9a4', NULL, 0),
(17, 2, '2023-01-27 12:43:10', 'Chronopost', 14.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3c6de68f3e', NULL, 0),
(18, 2, '2023-01-27 12:44:07', 'Chronopost', 14.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3c717b334c', NULL, 0),
(19, 2, '2023-01-27 12:45:23', 'Chronopost', 14.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3c763e1e59', NULL, 0),
(20, 2, '2023-01-27 12:50:45', 'Chronopost', 14.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3c8a5069f8', NULL, 0),
(21, 2, '2023-01-27 14:01:07', 'Chronopost', 14.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3d92367334', 'cs_test_b12QZ8HR4PgrgGwcwpPVKrdLERjHCAL3duxJCx5qZZEz7ujSnqL7Bhe3Cd', 0),
(22, 2, '2023-01-27 14:23:37', 'Chronopost', 14.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3de69d44dc', 'cs_test_b1glDJqgRSPllp0kuY3HudnwOpuILN06glySvPy7Mvn4iDxB9hzVMJQlxB', 0),
(23, 2, '2023-01-27 14:36:37', 'Colissimo', 9.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3e17522fb2', 'cs_test_b1bghYrbBSjsHKDsT1NQlkHuv4OGb6LJf5mpn7U7BJf0EbEqANG6TMJBH7', 0),
(24, 2, '2023-01-27 14:45:31', 'Colissimo', 9.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3e38b8adff', 'cs_test_b1W2CsbE1Co3vdXVNQShiQy9bt8XvAAEeG8NGo4czdaGI5zpcpSydrCGz9', 0),
(25, 2, '2023-01-27 14:49:03', 'Colissimo', 9.9, 'prenom nom</br>0202020202</br>Société</br>1 rue Jean</br>00000 VILLE</br>FR', '27012023-63d3e45f545d4', 'cs_test_b11YyIDuQEigg6KSwMHwjTNg1J3UXHBIo0OHaLBKTiVUZyketWOIDA8ASs', 0),
(26, 2, '2023-01-27 14:54:04', 'Colissimo', 9.9, 'prenom nom</br>0202020202</br>Société</br>1 rue Jean</br>00000 VILLE</br>FR', '27012023-63d3e58c51212', 'cs_test_b1fcrelQZgJyChULj5tKmLWSZuVqL2Tkdnoy8Ain0khzjnCp1T7h50dQFI', 0),
(27, 2, '2023-01-27 15:13:16', 'Colissimo', 9.9, 'prenom nom</br>0202020202</br>Société</br>1 rue Jean</br>00000 VILLE</br>FR', '27012023-63d3ea0c603c9', 'cs_test_b1yhadztSdLJ65QxpR3mhuaGNISs63puUa0YgIGRbtLMmppk4IfmhPTkE5', 0),
(28, 2, '2023-01-27 15:17:33', 'Chronopost', 14.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3eb0da07e4', 'cs_test_b10cLDfI77T1x2lu85JCfqVtKSw7krCmv1dohyJh2QYln2fss9HRvjtPdX', 0),
(29, 2, '2023-01-27 15:27:02', 'Colissimo', 9.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3ed467a867', NULL, 0),
(30, 2, '2023-01-27 15:39:52', 'Colissimo', 9.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3f048db7bf', NULL, 0),
(31, 2, '2023-01-27 15:41:46', 'Chronopost', 14.9, 'prenom nom</br>0202020202</br>Société</br>1 rue Jean</br>00000 VILLE</br>FR', '27012023-63d3f0ba8bd8c', 'cs_test_b1DmPjzYfymDDOU4oVgNraRMGjrDuAVLEzM8OTyZrxNNYbMcFafCeU0odH', 0),
(32, 2, '2023-01-27 15:50:52', 'Chronopost', 14.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d3f2dc46254', 'cs_test_b1GpCTHV931ExozsPTfyNAlHghfWD7NWPq1mGnq7r6C4GiNumDH9N2mNFj', 0),
(33, 2, '2023-01-27 17:03:57', 'Colissimo', 9.9, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d403fd651da', 'cs_test_b1DqTDslx7SlNeKGRz6CI2UN8EzNXwwKPkEJmQRes62BZKof7bjxjXAyy3', 0),
(34, 2, '2023-01-27 17:05:25', 'Chronopost', 14.9, 'prenom nom</br>0202020202</br>Société</br>1 rue Jean</br>00000 VILLE</br>FR', '27012023-63d404554b8b1', 'cs_test_b1b75asLm14Iugq3wxZHe6ljyEZomSnzfkFv1CyteT5u0hGJ8bN4CdCfik', 0),
(35, 2, '2023-01-27 17:25:15', 'Colissimo', 990, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d408fbb8af7', NULL, 0),
(36, 2, '2023-01-27 17:27:04', 'Colissimo', 990, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d4096854e8a', NULL, 0),
(37, 2, '2023-01-27 17:27:18', 'Colissimo', 990, 'Prénom Nom</br>0101010101</br>Société</br>2, rue Travail</br>00001 VILLETRAVAILLE</br>FR', '27012023-63d4097658f6f', 'cs_test_b1iX28HFlRlOYIpSAuplUJmHHjvqiR2Phc70H27lmus6pfDEczFeX7lA5o', 0),
(38, 2, '2023-01-30 08:08:12', 'Chronopost', 1490, 'prenom nom</br>0202020202</br>Société</br>1 rue Jean</br>00000 VILLE</br>FR', '30012023-63d77aec90ab6', NULL, 0),
(39, 2, '2023-01-30 08:08:21', 'Chronopost', 1490, 'prenom nom</br>0202020202</br>Société</br>1 rue Jean</br>00000 VILLE</br>FR', '30012023-63d77af51a713', NULL, 0),
(40, 2, '2023-01-30 08:08:27', 'Chronopost', 1490, 'prenom nom</br>0202020202</br>Société</br>1 rue Jean</br>00000 VILLE</br>FR', '30012023-63d77afbe9d0a', NULL, 0),
(41, 2, '2023-01-30 09:05:38', 'Colissimo', 990, 'prenom nom</br>0202020202</br>Société</br>1 rue Jean</br>00000 VILLE</br>FR', '30012023-63d7886294f73', 'cs_test_b1ZU0dqmxI5z81TIO8HNO5dJyhxwnhfCVwYxXy7NMEFZGgEg5uBJ6UHgfZ', 0),
(42, 16, '2023-01-30 15:31:03', 'Colissimo', 990, 'ptesta ntesta</br>0000000000</br>1 rue test</br>00000 VILLE</br>FR', '30012023-63d7e2b79d0ee', 'cs_test_b1Na17jLT47pfbV9heyPFDo6mXuJvtZktfVAlH2HaTS19mV9oZVYgWShXf', 0),
(43, 16, '2023-01-30 15:55:04', 'Colissimo', 990, 'ptesta ntesta</br>0000000000</br>1 rue test</br>00000 VILLE</br>FR', '30012023-63d7e858487bb', 'cs_test_b1f8Km7HdxN3HwTs2aOKqcvf0tkclTL4wIZCSAIHoo5CC6o9Zu4ejm8OUr', 2),
(44, 16, '2023-01-31 11:15:31', 'Chronopost', 1490, 'ptesta ntesta</br>0000000000</br>1 rue test</br>00000 VILLE</br>FR', '31012023-63d8f85363364', 'cs_test_b1FkCTkLafqgfrFPu4FXe6KGZwID64T67pk3tJFOuDwRVtfxvsDkapHqze', 1),
(45, 16, '2023-01-31 11:17:35', 'Colissimo', 990, 'ptesta ntesta</br>0000000000</br>1 rue test</br>00000 VILLE</br>FR', '31012023-63d8f8cf84209', 'cs_test_b1jElV7O2HsrughzpaDo87KSoFi7b137R6w8gpAoSjoPAWWaJ418QGFHqM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `my_order_id` int NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_845CA2C1BFCDF877` (`my_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `my_order_id`, `product`, `quantity`, `price`, `total`) VALUES
(1, 1, 'Bonnet Rouge', 1, 900, 900),
(2, 1, 'Le Bonnet du skieur', 2, 1200, 2400),
(3, 1, 'Le manteau famille', 1, 7990, 7990),
(4, 2, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(5, 2, 'Le manteau de soiree', 1, 6900, 6900),
(6, 3, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(7, 3, 'Le manteau de soiree', 1, 6900, 6900),
(8, 4, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(9, 4, 'Le manteau de soiree', 1, 6900, 6900),
(10, 5, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(11, 5, 'Le manteau de soiree', 1, 6900, 6900),
(12, 6, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(13, 6, 'Le manteau de soiree', 1, 6900, 6900),
(14, 7, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(15, 7, 'Le manteau de soiree', 1, 6900, 6900),
(16, 8, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(17, 8, 'Le manteau de soiree', 1, 6900, 6900),
(18, 9, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(19, 9, 'Le manteau de soiree', 1, 6900, 6900),
(20, 10, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(21, 10, 'Le manteau de soiree', 1, 6900, 6900),
(22, 11, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(23, 11, 'Le manteau de soiree', 1, 6900, 6900),
(24, 12, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(25, 12, 'Le manteau de soiree', 1, 6900, 6900),
(26, 13, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(27, 13, 'Le manteau de soiree', 1, 6900, 6900),
(28, 14, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(29, 14, 'Le manteau de soiree', 1, 6900, 6900),
(30, 15, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(31, 15, 'Le manteau de soiree', 1, 6900, 6900),
(32, 16, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(33, 16, 'Le manteau de soiree', 1, 6900, 6900),
(34, 17, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(35, 17, 'Le manteau de soiree', 1, 6900, 6900),
(36, 18, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(37, 18, 'Le manteau de soiree', 1, 6900, 6900),
(38, 19, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(39, 19, 'Le manteau de soiree', 1, 6900, 6900),
(40, 20, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(41, 20, 'Le manteau de soiree', 1, 6900, 6900),
(42, 21, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(43, 21, 'Le manteau de soiree', 1, 6900, 6900),
(44, 22, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(45, 22, 'Le manteau de soiree', 1, 6900, 6900),
(46, 23, 'L\'écharpe du samedi soir', 2, 1400, 2800),
(47, 23, 'Le manteau de soiree', 1, 6900, 6900),
(48, 24, 'L\'écharpe du loveur', 1, 1900, 1900),
(49, 25, 'Le manteau de soiree', 1, 6900, 6900),
(50, 25, 'Le T-shirt manche longue', 2, 1490, 2980),
(51, 26, 'Le manteau de soiree', 1, 6900, 6900),
(52, 26, 'Le T-shirt manche longue', 1, 1490, 1490),
(53, 27, 'Le manteau famille', 1, 7990, 7990),
(54, 27, 'L\'écharpe du samedi soir', 1, 1400, 1400),
(55, 27, 'L\'écharpe du loveur', 2, 1900, 3800),
(56, 28, 'Le Bonnet du skieur', 1, 1200, 1200),
(57, 29, 'Le Bonnet du skieur', 1, 1200, 1200),
(58, 30, 'Le Bonnet du skieur', 1, 1200, 1200),
(59, 31, 'Le Bonnet du skieur', 2, 1200, 2400),
(60, 32, 'Le Bonnet du skieur', 2, 1200, 2400),
(61, 33, 'Le Bonnet du skieur', 2, 1200, 2400),
(62, 34, 'Le Bonnet du skieur', 2, 1200, 2400),
(63, 35, 'Le Bonnet du skieur', 1, 1200, 1200),
(64, 36, 'Le Bonnet du skieur', 1, 1200, 1200),
(65, 37, 'Le Bonnet du skieur', 1, 1200, 1200),
(66, 38, 'Le Bonnet du skieur', 1, 1200, 1200),
(67, 39, 'Le Bonnet du skieur', 1, 1200, 1200),
(68, 40, 'Le Bonnet du skieur', 1, 1200, 1200),
(69, 41, 'Le Bonnet du skieur', 2, 1200, 2400),
(70, 41, 'Le manteau de soiree', 1, 6900, 6900),
(71, 42, 'Bonnet Rouge', 1, 900, 900),
(72, 42, 'Le manteau de soiree', 1, 6900, 6900),
(73, 43, 'Le manteau de soiree', 1, 6900, 6900),
(74, 44, 'Le Bonnet du skieur', 1, 1200, 1200),
(75, 45, 'Le Bonnet du skieur', 1, 1200, 1200);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `is_best` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `illustration`, `subtitle`, `description`, `price`, `is_best`) VALUES
(2, 2, 'Bonnet Rouge', 'bonnet-rouge', '077ff0703d80df92e02c72e2848158505e40a74e.jpg', 'Le bonnet parfait pour l\'hiver', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Incidunt fugit nihil architecto assumenda labore vero repellat totam reprehenderit modi quaerat animi voluptatem esse perferendis eum commodi, autem dicta nisi beatae accusamus accusantium. Iure, doloribus sapiente vero cum blanditiis nobis ab adipisci voluptatibus, placeat incidunt ad non quisquam error animi mollitia?', 900, 1),
(3, 2, 'Le Bonnet du skieur', 'le-bonnet-du-skieur', '2da6b945abe27cd4d2abda2310113420d01cbce5.jpg', 'Le bonnet parfait pour le ski', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Officia minus enim excepturi labore voluptatum, officiis ipsam error doloribus saepe eius accusamus laborum ad sit ducimus nostrum! Adipisci molestiae temporibus nisi consectetur molestias praesentium dolore minima!', 1200, 0),
(4, 4, 'L\'écharpe du loveur', 'lecharpe-du-loveur', 'e658930a6b8c6f528d806622b9942f58f0addc34.jpg', 'L\'écharpe parfaite pour les soirées romantiques', 'Praesentium a neque alias, consectetur corrupti aut voluptas? Corrupti eum, sed alias eligendi explicabo quos ipsam illum unde veritatis cupiditate, voluptates laboriosam adipisci accusantium praesentium nihil aperiam. Non, architecto hic voluptas dignissimos ut sint, fugiat sit vitae distinctio asperiores itaque iusto corporis perspiciatis nam porro eligendi aut dolorem et.', 1900, 1),
(5, 4, 'L\'écharpe du samedi soir', 'lecharpe-du-samedi-soir', 'fde4ed62458a04a39868f88760baf95849ec785d.jpg', 'L\'écharpe parfaite pour vos weekends', 'Voluptatem amet, repudiandae voluptates, dicta nulla ad pariatur officia consectetur voluptas commodi est. Accusamus temporibus saepe ab autem natus aliquam quam, dolorum laudantium illum laborum. Iure dolorem explicabo hic numquam saepe iusto pariatur consectetur recusandae.', 1400, 1),
(6, 1, 'Le manteau de soiree', 'le-manteau-de-soiree', '0d955459e9d85f71f9b3a730d6d659e9acf7d4e8.jpg', 'Le manteau Français pour vos soirées', 'Accusamus temporibus saepe ab autem natus aliquam quam, dolorum laudantium illum laborum. Iure dolorem explicabo hic numquam saepe iusto pariatur consectetur recusandae.', 6900, 1),
(7, 1, 'Le manteau famille', 'le-manteau-famille', '4f9111c8d0378b224dab5ac7353766ab22dd11ea.jpg', 'Le manteau pour vos sorties en famille', 'Dolore non fuga, iusto magni ipsum numquam vero cum et facere iure error inventore quae molestias quo hic repellat quia optio maxime omnis distinctio reiciendis debitis voluptates dignissimos alias?', 7990, 0),
(8, 3, 'Le T-shirt manche longue', 'le-t-shirt-manche-longue', 'fec9de51944eab8bdd505299c9af15bdfb4dd4bf.jpg', 'Le T-shirt taillé pour les hommes', 'Voluptatem amet, repudiandae voluptates, dicta nulla ad pariatur officia consectetur voluptas commodi est. Accusamus temporibus saepe ab autem natus aliquam quam, dolorum laudantium illum laborum.', 1490, 0),
(9, 3, 'Le T-shirt classic', 'le-t-shirt-classic', 'ff49cbe9912a82226246fa4f2d3fa538e07b228e.jpg', 'Le Basic parfait pour les hommes', 'Fugit error beatae voluptates saepe totam similique asperiores voluptatem esse earum, eveniet est corrupti maiores consectetur temporibus optio. Ipsa ex vel officiis.', 960, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reset_password`
--

DROP TABLE IF EXISTS `reset_password`;
CREATE TABLE IF NOT EXISTS `reset_password` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_B9983CE5A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reset_password`
--

INSERT INTO `reset_password` (`id`, `user_id`, `token`, `created_at`) VALUES
(1, 2, '63d8fd8cbd6e7', '2023-01-31 11:37:48'),
(2, 2, '63d9057bcdb7a', '2023-01-31 12:11:39'),
(3, 2, '63d908e085751', '2023-01-31 12:26:08');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(1, 'test@test.test', '[]', 'test', 'test', 'test'),
(2, 'prenomnom@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$InU.WzB5yIgmVlnxgo9QAe8qZpYin.y8g8aTGzUvSvTbYmNsA38zm', 'prenom', 'nom'),
(13, 'test2@test.test', '[]', '$2y$13$S5bNeD5u0BFccGq98QZui.Hs5GmNq2/i9M5BJdmNKcQwcbNQEdmNa', 'test', 'test'),
(15, 'test@gmail.com', '[]', '$2y$13$zYUXszyYppyV6FlohSo0w.5GqfSbpBYL8uJmQq9PwHiDisj9bqjpC', 'test', 'test'),
(16, 'ptestantesta@gmail.com', '[]', '$2y$13$Ko54g83qB4nEKGnJEvEZ5OmzxyOdZvcRUKpi96QlM33NZ9b65GdYG', 'ptesta', 'ntesta');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_D4E6F81A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C1BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `order` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `reset_password`
--
ALTER TABLE `reset_password`
  ADD CONSTRAINT `FK_B9983CE5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

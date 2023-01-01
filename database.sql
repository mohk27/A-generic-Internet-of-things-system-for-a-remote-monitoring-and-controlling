-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 13 juin 2019 à 23:41
-- Version du serveur :  5.7.21
-- Version de PHP :  5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `database`
--

-- --------------------------------------------------------

--
-- Structure de la table `appareil`
--

DROP TABLE IF EXISTS `appareil`;
CREATE TABLE IF NOT EXISTS `appareil` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `app_nom` varchar(30) NOT NULL,
  `app_type` int(1) NOT NULL,
  `description` text NOT NULL,
  `app_date_ajout` varchar(30) NOT NULL,
  `carte_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carte_id` (`carte_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `appareil`
--

INSERT INTO `appareil` (`id`, `app_nom`, `app_type`, `description`, `app_date_ajout`, `carte_id`) VALUES
(2, 'dht22', 1, '', '2019-04-21 11:25:05', 2),
(6, 'pir', 1, 'app', '2019-05-01 15:37:41', 2),
(9, 'photoresistence', 1, 'Cet appareil est un capteur qui permet de rÃ©colter le taux de luminositÃ©', '2019-05-09 08:50:15', 2),
(10, 'ledrouge', 2, '', '', 2),
(11, 'ledverte', 2, '', '', 2),
(12, 'ledjaune', 2, '', '2019-05-17 21:20:47', 2);

-- --------------------------------------------------------

--
-- Structure de la table `carte`
--

DROP TABLE IF EXISTS `carte`;
CREATE TABLE IF NOT EXISTS `carte` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `marque` varchar(30) NOT NULL,
  `mac_address` varchar(30) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text NOT NULL,
  `date_ajout` varchar(30) NOT NULL,
  `site_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `carte`
--

INSERT INTO `carte` (`id`, `marque`, `mac_address`, `type`, `description`, `date_ajout`, `site_id`) VALUES
(2, 'esp8266', 'xxxxxxxx.xxxxxxxx.xxxxxxx', 1, 'jhhjjjh', '2019-04-21 22:28:30', 2),
(9, 'RASERY PI2', 'xxxxxxxx.xxxxxxxx.xxxxxxx', 2, 'description', '2019-04-21 22:28:30', 2),
(10, 'RASERY PI8', 'xxxxxxxx.xxxxxxxx.xxxxxxx', 2, 'rgregrtghbtrhbgthgbt', '2019-05-01 03:24:08', 2);

-- --------------------------------------------------------

--
-- Structure de la table `chef_entreprise`
--

DROP TABLE IF EXISTS `chef_entreprise`;
CREATE TABLE IF NOT EXISTS `chef_entreprise` (
  `id_chef_en` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id_chef_en`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `chef_entreprise`
--

INSERT INTO `chef_entreprise` (`id_chef_en`, `user_id`) VALUES
(1, 14);

-- --------------------------------------------------------

--
-- Structure de la table `chef_projet`
--

DROP TABLE IF EXISTS `chef_projet`;
CREATE TABLE IF NOT EXISTS `chef_projet` (
  `id_chef_pro` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_chef_pro`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `chef_projet`
--

INSERT INTO `chef_projet` (`id_chef_pro`, `user_id`) VALUES
(2, 27);

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

DROP TABLE IF EXISTS `etat`;
CREATE TABLE IF NOT EXISTS `etat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etat_val` varchar(20) NOT NULL,
  `etat_date` varchar(40) NOT NULL,
  `app_id` int(11) NOT NULL,
  `etat_app` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_id` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14917 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `etat_val`, `etat_date`, `app_id`, `etat_app`) VALUES
(14827, 'OFF', '2019-05-24 01:09:18.481097', 10, 'ledrouge'),
(14916, 'ON', '2019-05-29 00:21:47.523747', 12, 'ledjaune');

-- --------------------------------------------------------

--
-- Structure de la table `metrique`
--

DROP TABLE IF EXISTS `metrique`;
CREATE TABLE IF NOT EXISTS `metrique` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `met_nom` varchar(30) NOT NULL,
  `met_val` varchar(10) NOT NULL,
  `met_date` varchar(30) NOT NULL,
  `app_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_id` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16448 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `metrique`
--

INSERT INTO `metrique` (`id`, `met_nom`, `met_val`, `met_date`, `app_id`) VALUES
(16304, 'Temperature', '26.60', '2019-05-29 00:17:47.246405', 2),
(16305, 'Humidity', '72.90', '2019-05-29 00:17:47.719119', 2),
(16306, 'movement', '1', '2019-05-29 00:17:47.738070', 6),
(16307, 'Temperature', '26.50', '2019-05-29 00:17:48.051026', 2),
(16308, 'Humidity', '72.50', '2019-05-29 00:17:48.059007', 2),
(16309, 'movement', '1', '2019-05-29 00:17:48.068978', 6),
(16310, 'Temperature', '26.50', '2019-05-29 00:17:53.273375', 2),
(16311, 'Humidity', '73.10', '2019-05-29 00:17:53.317436', 2),
(16312, 'movement', '1', '2019-05-29 00:17:53.325416', 6),
(16313, 'Temperature', '26.50', '2019-05-29 00:17:58.540616', 2),
(16314, 'Humidity', '73.40', '2019-05-29 00:17:58.586103', 2),
(16315, 'movement', '1', '2019-05-29 00:17:58.591053', 6),
(16316, 'Temperature', '26.40', '2019-05-29 00:18:03.817118', 2),
(16317, 'Humidity', '73.80', '2019-05-29 00:18:04.942884', 2),
(16318, 'movement', '1', '2019-05-29 00:18:04.949865', 6),
(16319, 'Temperature', '26.40', '2019-05-29 00:18:07.642777', 2),
(16320, 'Humidity', '73.80', '2019-05-29 00:18:07.660684', 2),
(16321, 'movement', '1', '2019-05-29 00:18:07.681669', 6),
(16322, 'Temperature', '26.40', '2019-05-29 00:18:09.104759', 2),
(16323, 'Humidity', '74.40', '2019-05-29 00:18:10.683045', 2),
(16324, 'movement', '1', '2019-05-29 00:18:10.690989', 6),
(16325, 'Temperature', '26.40', '2019-05-29 00:18:14.403136', 2),
(16326, 'Humidity', '75.40', '2019-05-29 00:18:15.163012', 2),
(16327, 'movement', '1', '2019-05-29 00:18:15.170954', 6),
(16328, 'Temperature', '26.30', '2019-05-29 00:18:19.650924', 2),
(16329, 'Humidity', '75.20', '2019-05-29 00:18:19.784566', 2),
(16330, 'movement', '1', '2019-05-29 00:18:19.793547', 6),
(16331, 'Temperature', '26.40', '2019-05-29 00:18:24.929477', 2),
(16332, 'Humidity', '75.10', '2019-05-29 00:18:24.970967', 2),
(16333, 'movement', '1', '2019-05-29 00:18:24.977949', 6),
(16334, 'Temperature', '26.40', '2019-05-29 00:18:30.202717', 2),
(16335, 'Humidity', '75.60', '2019-05-29 00:18:30.250318', 2),
(16336, 'movement', '1', '2019-05-29 00:18:30.259291', 6),
(16337, 'Temperature', '26.40', '2019-05-29 00:18:40.004529', 2),
(16338, 'Humidity', '75.20', '2019-05-29 00:18:40.180231', 2),
(16339, 'movement', '1', '2019-05-29 00:18:40.190205', 6),
(16340, 'Temperature', '26.40', '2019-05-29 00:18:41.645003', 2),
(16341, 'Humidity', '75.00', '2019-05-29 00:18:41.653978', 2),
(16342, 'movement', '1', '2019-05-29 00:18:41.660959', 6),
(16343, 'Temperature', '26.40', '2019-05-29 00:18:46.066768', 2),
(16344, 'Humidity', '75.20', '2019-05-29 00:18:46.110943', 2),
(16345, 'movement', '1', '2019-05-29 00:18:46.116929', 6),
(16346, 'Temperature', '26.40', '2019-05-29 00:18:51.310088', 2),
(16347, 'Humidity', '74.90', '2019-05-29 00:18:51.351982', 2),
(16348, 'movement', '1', '2019-05-29 00:18:51.358963', 6),
(16349, 'Temperature', '26.40', '2019-05-29 00:18:56.583777', 2),
(16350, 'Humidity', '75.50', '2019-05-29 00:18:56.632646', 2),
(16351, 'movement', '1', '2019-05-29 00:18:56.642620', 6),
(16352, 'Temperature', '26.40', '2019-05-29 00:19:01.858397', 2),
(16353, 'Humidity', '75.30', '2019-05-29 00:19:01.904256', 2),
(16354, 'movement', '1', '2019-05-29 00:19:01.978603', 6),
(16355, 'Temperature', '26.40', '2019-05-29 00:19:07.146565', 2),
(16356, 'Humidity', '75.00', '2019-05-29 00:19:07.183453', 2),
(16357, 'movement', '1', '2019-05-29 00:19:07.189439', 6),
(16358, 'Temperature', '26.30', '2019-05-29 00:19:12.415665', 2),
(16359, 'Humidity', '75.10', '2019-05-29 00:19:12.460156', 2),
(16360, 'movement', '1', '2019-05-29 00:19:12.468090', 6),
(16361, 'Temperature', '26.30', '2019-05-29 00:19:17.690691', 2),
(16362, 'Humidity', '75.00', '2019-05-29 00:19:17.731993', 2),
(16363, 'movement', '1', '2019-05-29 00:19:17.738976', 6),
(16364, 'Temperature', '26.30', '2019-05-29 00:19:22.974201', 2),
(16365, 'Humidity', '75.10', '2019-05-29 00:19:23.011152', 2),
(16366, 'movement', '1', '2019-05-29 00:19:23.016138', 6),
(16367, 'Temperature', '26.20', '2019-05-29 00:19:28.240996', 2),
(16368, 'Humidity', '75.30', '2019-05-29 00:19:28.285088', 2),
(16369, 'movement', '1', '2019-05-29 00:19:28.291073', 6),
(16370, 'Temperature', '26.20', '2019-05-29 00:19:33.519546', 2),
(16371, 'Humidity', '75.50', '2019-05-29 00:19:33.562431', 2),
(16372, 'movement', '1', '2019-05-29 00:19:33.570410', 6),
(16373, 'Temperature', '26.20', '2019-05-29 00:19:38.792650', 2),
(16374, 'Humidity', '75.60', '2019-05-29 00:19:38.837528', 2),
(16375, 'movement', '1', '2019-05-29 00:19:38.845508', 6),
(16376, 'Temperature', '26.20', '2019-05-29 00:19:44.068636', 2),
(16377, 'Humidity', '75.70', '2019-05-29 00:19:44.117507', 2),
(16378, 'movement', '1', '2019-05-29 00:19:44.123491', 6),
(16379, 'Temperature', '26.10', '2019-05-29 00:19:49.344508', 2),
(16380, 'Humidity', '75.90', '2019-05-29 00:19:49.390387', 2),
(16381, 'movement', '1', '2019-05-29 00:19:49.397369', 6),
(16382, 'Temperature', '26.10', '2019-05-29 00:19:54.622336', 2),
(16383, 'Humidity', '76.00', '2019-05-29 00:19:54.665747', 2),
(16384, 'movement', '1', '2019-05-29 00:19:54.672728', 6),
(16385, 'Temperature', '26.10', '2019-05-29 00:19:59.897311', 2),
(16386, 'Humidity', '76.00', '2019-05-29 00:19:59.944188', 2),
(16387, 'movement', '1', '2019-05-29 00:19:59.953163', 6),
(16388, 'Temperature', '26.10', '2019-05-29 00:20:05.175229', 2),
(16389, 'Humidity', '76.30', '2019-05-29 00:20:05.220107', 2),
(16390, 'movement', '1', '2019-05-29 00:20:05.229083', 6),
(16391, 'Temperature', '26.10', '2019-05-29 00:20:10.451392', 2),
(16392, 'Humidity', '76.40', '2019-05-29 00:20:10.495274', 2),
(16393, 'movement', '1', '2019-05-29 00:20:10.503254', 6),
(16394, 'Temperature', '26.10', '2019-05-29 00:20:15.726305', 2),
(16395, 'Humidity', '76.20', '2019-05-29 00:20:15.773179', 2),
(16396, 'movement', '1', '2019-05-29 00:20:15.804096', 6),
(16397, 'Temperature', '26.30', '2019-05-29 00:20:21.000850', 2),
(16398, 'Humidity', '76.90', '2019-05-29 00:20:21.045731', 2),
(16399, 'movement', '1', '2019-05-29 00:20:21.078640', 6),
(16400, 'Temperature', '26.50', '2019-05-29 00:20:26.280619', 2),
(16401, 'Humidity', '76.70', '2019-05-29 00:20:26.324500', 2),
(16402, 'movement', '1', '2019-05-29 00:20:26.332481', 6),
(16403, 'Temperature', '26.50', '2019-05-29 00:20:31.559341', 2),
(16404, 'Humidity', '76.50', '2019-05-29 00:20:31.603223', 2),
(16405, 'movement', '1', '2019-05-29 00:20:31.611203', 6),
(16406, 'Temperature', '26.60', '2019-05-29 00:20:36.835639', 2),
(16407, 'Humidity', '76.50', '2019-05-29 00:20:36.881193', 2),
(16408, 'movement', '1', '2019-05-29 00:20:36.888174', 6),
(16409, 'Temperature', '26.60', '2019-05-29 00:20:42.113725', 2),
(16410, 'Humidity', '76.10', '2019-05-29 00:20:42.156610', 2),
(16411, 'movement', '1', '2019-05-29 00:20:42.164590', 6),
(16412, 'Temperature', '26.50', '2019-05-29 00:20:47.388245', 2),
(16413, 'Humidity', '76.20', '2019-05-29 00:20:47.433126', 2),
(16414, 'movement', '1', '2019-05-29 00:20:47.441104', 6),
(16415, 'Temperature', '26.70', '2019-05-29 00:20:52.666081', 2),
(16416, 'Humidity', '88.80', '2019-05-29 00:20:52.710670', 2),
(16417, 'movement', '1', '2019-05-29 00:20:52.718648', 6),
(16418, 'Temperature', '27.00', '2019-05-29 00:20:57.945393', 2),
(16419, 'Humidity', '82.80', '2019-05-29 00:20:57.990273', 2),
(16420, 'movement', '1', '2019-05-29 00:20:57.998251', 6),
(16421, 'Temperature', '27.20', '2019-05-29 00:21:03.223698', 2),
(16422, 'Humidity', '77.90', '2019-05-29 00:21:03.268248', 2),
(16423, 'movement', '1', '2019-05-29 00:21:03.277222', 6),
(16424, 'Temperature', '27.20', '2019-05-29 00:21:08.497123', 2),
(16425, 'Humidity', '75.70', '2019-05-29 00:21:08.543041', 2),
(16426, 'movement', '1', '2019-05-29 00:21:08.550020', 6),
(16427, 'Temperature', '27.30', '2019-05-29 00:21:13.774722', 2),
(16428, 'Humidity', '74.40', '2019-05-29 00:21:13.820231', 2),
(16429, 'movement', '1', '2019-05-29 00:21:13.828207', 6),
(16430, 'Temperature', '27.20', '2019-05-29 00:21:21.080797', 2),
(16431, 'Humidity', '72.70', '2019-05-29 00:21:21.125678', 2),
(16432, 'movement', '1', '2019-05-29 00:21:21.132658', 6),
(16433, 'Temperature', '27.20', '2019-05-29 00:21:26.357275', 2),
(16434, 'Humidity', '72.40', '2019-05-29 00:21:26.402155', 2),
(16435, 'movement', '1', '2019-05-29 00:21:26.413127', 6),
(16436, 'Temperature', '27.20', '2019-05-29 00:21:31.631717', 2),
(16437, 'Humidity', '72.00', '2019-05-29 00:21:31.674603', 2),
(16438, 'movement', '1', '2019-05-29 00:21:31.683578', 6),
(16439, 'Temperature', '27.10', '2019-05-29 00:21:36.906689', 2),
(16440, 'Humidity', '71.70', '2019-05-29 00:21:36.949985', 2),
(16441, 'movement', '1', '2019-05-29 00:21:36.957965', 6),
(16442, 'Temperature', '27.10', '2019-05-29 00:21:42.183831', 2),
(16443, 'Humidity', '71.70', '2019-05-29 00:21:42.227769', 2),
(16444, 'movement', '1', '2019-05-29 00:21:42.235747', 6),
(16445, 'Temperature', '27.00', '2019-05-29 00:21:47.460932', 2),
(16446, 'Humidity', '71.60', '2019-05-29 00:21:47.507790', 2),
(16447, 'movement', '1', '2019-05-29 00:21:47.516765', 6);

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

DROP TABLE IF EXISTS `projet`;
CREATE TABLE IF NOT EXISTS `projet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projet_nom` varchar(30) NOT NULL,
  `projet_description` text NOT NULL,
  `date_creation` varchar(20) NOT NULL,
  `date_modification` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `projet`
--

INSERT INTO `projet` (`id`, `projet_nom`, `projet_description`, `date_creation`, `date_modification`) VALUES
(2, 'cub3', '      Projet de surveillance de la rÃ©sidence universitaire rub3 2019', '2019-04-20 14:07:17', '2019-05-08 14:31:01');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_nom` varchar(30) NOT NULL,
  `site_description` text NOT NULL,
  `ip_address` varchar(30) NOT NULL,
  `date_creation` varchar(30) NOT NULL,
  `date_modification` varchar(30) NOT NULL,
  `projet_id` int(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projet_id` (`projet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `site`
--

INSERT INTO `site` (`id`, `site_nom`, `site_description`, `ip_address`, `date_creation`, `date_modification`, `projet_id`) VALUES
(2, 'N38', '  Chambre 38 Pavillon N', 'YYYY.XXXX.XXXX.XXXX', '', '2019-05-06 02:18:26', 2);

-- --------------------------------------------------------

--
-- Structure de la table `technicien`
--

DROP TABLE IF EXISTS `technicien`;
CREATE TABLE IF NOT EXISTS `technicien` (
  `id_tec` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_tec`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `temperature`
--

DROP TABLE IF EXISTS `temperature`;
CREATE TABLE IF NOT EXISTS `temperature` (
  `value` varchar(3) NOT NULL,
  `nom` varchar(8) NOT NULL,
  UNIQUE KEY `nom` (`nom`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `temperature`
--

INSERT INTO `temperature` (`value`, `nom`) VALUES
('2', 'yacine');

-- --------------------------------------------------------

--
-- Structure de la table `temperatures`
--

DROP TABLE IF EXISTS `temperatures`;
CREATE TABLE IF NOT EXISTS `temperatures` (
  `value` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `temperatures`
--

INSERT INTO `temperatures` (`value`) VALUES
(13);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `adresse` varchar(30) NOT NULL,
  `mail` varchar(40) NOT NULL,
  `tel` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date_creation` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `adresse`, `mail`, `tel`, `password`, `date_creation`) VALUES
(14, 'Djibrilla Boukary', 'Yacine', 'residence universitaire ', 'yacine@usthb.dz', '+213790226698', '$2y$10$jeJvpXg8VMXLKtHZEdBEjud3YrzK0KSVAg2Iv9Sb/efpxFpjPtmk6', '2019-05-01 01:15:35'),
(27, 'test', 'tes', 'test', 'test@test.dz', 'test', '$2y$10$tz6kvuiWrTAKXJoXzsnaiOnev4CAODnkptiyng13EHOLCTLYNypAu', '2019-06-12 21:47:33');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `nom` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `nom`) VALUES
(1, 'yacine');

-- --------------------------------------------------------

--
-- Structure de la table `user_normal`
--

DROP TABLE IF EXISTS `user_normal`;
CREATE TABLE IF NOT EXISTS `user_normal` (
  `id_normal` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id_normal`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user_projet`
--

DROP TABLE IF EXISTS `user_projet`;
CREATE TABLE IF NOT EXISTS `user_projet` (
  `user_id` int(10) NOT NULL,
  `projet_id` int(10) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `projet_id` (`projet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user_projet`
--

INSERT INTO `user_projet` (`user_id`, `projet_id`) VALUES
(14, 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appareil`
--
ALTER TABLE `appareil`
  ADD CONSTRAINT `appareil_ibfk_1` FOREIGN KEY (`carte_id`) REFERENCES `carte` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `carte`
--
ALTER TABLE `carte`
  ADD CONSTRAINT `carte_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `chef_entreprise`
--
ALTER TABLE `chef_entreprise`
  ADD CONSTRAINT `chef_entreprise_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `chef_projet`
--
ALTER TABLE `chef_projet`
  ADD CONSTRAINT `chef_projet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `etat`
--
ALTER TABLE `etat`
  ADD CONSTRAINT `etat_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `appareil` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `metrique`
--
ALTER TABLE `metrique`
  ADD CONSTRAINT `metrique_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `appareil` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `site_ibfk_1` FOREIGN KEY (`projet_id`) REFERENCES `projet` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `technicien`
--
ALTER TABLE `technicien`
  ADD CONSTRAINT `technicien_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `user_normal`
--
ALTER TABLE `user_normal`
  ADD CONSTRAINT `user_normal_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `user_projet`
--
ALTER TABLE `user_projet`
  ADD CONSTRAINT `user_projet_ibfk_1` FOREIGN KEY (`projet_id`) REFERENCES `projet` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_projet_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

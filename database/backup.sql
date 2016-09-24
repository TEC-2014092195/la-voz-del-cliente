-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.14 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para programathon2016
DROP DATABASE IF EXISTS `programathon2016`;
CREATE DATABASE IF NOT EXISTS `programathon2016` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `programathon2016`;


-- Volcando estructura para tabla programathon2016.estado
DROP TABLE IF EXISTS `estado`;
CREATE TABLE IF NOT EXISTS `estado` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` char(50) NOT NULL,
  `PaisID` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_STATE_COUNTRY_idx` (`PaisID`),
  CONSTRAINT `FK_STATE_COUNTRY` FOREIGN KEY (`PaisID`) REFERENCES `pais` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla programathon2016.estado: ~7 rows (aproximadamente)
DELETE FROM `estado`;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` (`Id`, `Nombre`, `PaisID`) VALUES
	(1, 'Alajuela', 52),
	(2, 'Heredia', 52),
	(3, 'Guanacaste', 52),
	(4, 'San José', 52),
	(5, 'Puntarenas', 52),
	(6, 'Limón', 52),
	(7, 'Cartago', 52);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;


-- Volcando estructura para tabla programathon2016.genero
DROP TABLE IF EXISTS `genero`;
CREATE TABLE IF NOT EXISTS `genero` (
  `Id` varchar(1) NOT NULL,
  `Nombre` char(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla programathon2016.genero: ~3 rows (aproximadamente)
DELETE FROM `genero`;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` (`Id`, `Nombre`) VALUES
	('F', 'Femenino'),
	('M', 'Masculino'),
	('N', 'No Aplica');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;


-- Volcando estructura para procedimiento programathon2016.insertPYME
DROP PROCEDURE IF EXISTS `insertPYME`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPYME`(IN `NombreComercio` CHAR(100), IN `Estado` INT, IN `Sector` INT, IN `CedulaJuridica` VARCHAR(50), IN `GeneroPropietario` INT, IN `Telefono` CHAR(50), IN `EsActiva` BIT(1), IN `EsNegocioFamiliar` BIT(1), IN `Logo` LONGTEXT, IN `AnnioInicioOperaciones` TINYINT(4))
BEGIN
INSERT into pyme(pyme.NombreComercio, pyme.EstadoID, pyme.SectorID, pyme.CedJuridica, 
pyme.GeneroPropietarioID, pyme.NumeroTelefono, pyme.EsActiva, pyme.EsNegocioFamiliar,
pyme.Logo, pyme.AnnoInicioOperaciones) values
(NombreComercio, Estado, Sector, CedulaJuridica, GeneroPropietario, Telefono,EsActiva, EsNegocioFamiliar, Logo, AnnioInicioOperaciones);
END//
DELIMITER ;


-- Volcando estructura para tabla programathon2016.pais
DROP TABLE IF EXISTS `pais`;
CREATE TABLE IF NOT EXISTS `pais` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Iso` varchar(2) NOT NULL,
  `Iso3` varchar(3) DEFAULT NULL,
  `CodigoNumerico` int(11) DEFAULT NULL,
  `CodigoTelefono` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla programathon2016.pais: ~239 rows (aproximadamente)
DELETE FROM `pais`;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` (`Id`, `Nombre`, `Iso`, `Iso3`, `CodigoNumerico`, `CodigoTelefono`) VALUES
	(1, 'Afghanistan', 'AF', 'AFG', 4, 93),
	(2, 'Albania', 'AL', 'ALB', 8, 355),
	(3, 'Algeria', 'DZ', 'DZA', 12, 213),
	(4, 'American Samoa', 'AS', 'ASM', 16, 1684),
	(5, 'Andorra', 'AD', 'AND', 20, 376),
	(6, 'Angola', 'AO', 'AGO', 24, 244),
	(7, 'Anguilla', 'AI', 'AIA', 660, 1264),
	(8, 'Antarctica', 'AQ', NULL, NULL, 0),
	(9, 'Antigua and Barbuda', 'AG', 'ATG', 28, 1268),
	(10, 'Argentina', 'AR', 'ARG', 32, 54),
	(11, 'Armenia', 'AM', 'ARM', 51, 374),
	(12, 'Aruba', 'AW', 'ABW', 533, 297),
	(13, 'Australia', 'AU', 'AUS', 36, 61),
	(14, 'Austria', 'AT', 'AUT', 40, 43),
	(15, 'Azerbaijan', 'AZ', 'AZE', 31, 994),
	(16, 'Bahamas', 'BS', 'BHS', 44, 1242),
	(17, 'Bahrain', 'BH', 'BHR', 48, 973),
	(18, 'Bangladesh', 'BD', 'BGD', 50, 880),
	(19, 'Barbados', 'BB', 'BRB', 52, 1246),
	(20, 'Belarus', 'BY', 'BLR', 112, 375),
	(21, 'Belgium', 'BE', 'BEL', 56, 32),
	(22, 'Belize', 'BZ', 'BLZ', 84, 501),
	(23, 'Benin', 'BJ', 'BEN', 204, 229),
	(24, 'Bermuda', 'BM', 'BMU', 60, 1441),
	(25, 'Bhutan', 'BT', 'BTN', 64, 975),
	(26, 'Bolivia', 'BO', 'BOL', 68, 591),
	(27, 'Bosnia and Herzegovina', 'BA', 'BIH', 70, 387),
	(28, 'Botswana', 'BW', 'BWA', 72, 267),
	(29, 'Bouvet Island', 'BV', NULL, NULL, 0),
	(30, 'Brazil', 'BR', 'BRA', 76, 55),
	(31, 'British Indian Ocean Territory', 'IO', NULL, NULL, 246),
	(32, 'Brunei Darussalam', 'BN', 'BRN', 96, 673),
	(33, 'Bulgaria', 'BG', 'BGR', 100, 359),
	(34, 'Burkina Faso', 'BF', 'BFA', 854, 226),
	(35, 'Burundi', 'BI', 'BDI', 108, 257),
	(36, 'Cambodia', 'KH', 'KHM', 116, 855),
	(37, 'Cameroon', 'CM', 'CMR', 120, 237),
	(38, 'Canada', 'CA', 'CAN', 124, 1),
	(39, 'Cape Verde', 'CV', 'CPV', 132, 238),
	(40, 'Cayman Islands', 'KY', 'CYM', 136, 1345),
	(41, 'Central African Republic', 'CF', 'CAF', 140, 236),
	(42, 'Chad', 'TD', 'TCD', 148, 235),
	(43, 'Chile', 'CL', 'CHL', 152, 56),
	(44, 'China', 'CN', 'CHN', 156, 86),
	(45, 'Christmas Island', 'CX', NULL, NULL, 61),
	(46, 'Cocos (Keeling) Islands', 'CC', NULL, NULL, 672),
	(47, 'Colombia', 'CO', 'COL', 170, 57),
	(48, 'Comoros', 'KM', 'COM', 174, 269),
	(49, 'Congo', 'CG', 'COG', 178, 242),
	(50, 'Congo, the Democratic Republic of the', 'CD', 'COD', 180, 242),
	(51, 'Cook Islands', 'CK', 'COK', 184, 682),
	(52, 'Costa Rica', 'CR', 'CRI', 188, 506),
	(53, 'Cote D\'Ivoire', 'CI', 'CIV', 384, 225),
	(54, 'Croatia', 'HR', 'HRV', 191, 385),
	(55, 'Cuba', 'CU', 'CUB', 192, 53),
	(56, 'Cyprus', 'CY', 'CYP', 196, 357),
	(57, 'Czech Republic', 'CZ', 'CZE', 203, 420),
	(58, 'Denmark', 'DK', 'DNK', 208, 45),
	(59, 'Djibouti', 'DJ', 'DJI', 262, 253),
	(60, 'Dominica', 'DM', 'DMA', 212, 1767),
	(61, 'Dominican Republic', 'DO', 'DOM', 214, 1809),
	(62, 'Ecuador', 'EC', 'ECU', 218, 593),
	(63, 'Egypt', 'EG', 'EGY', 818, 20),
	(64, 'El Salvador', 'SV', 'SLV', 222, 503),
	(65, 'Equatorial Guinea', 'GQ', 'GNQ', 226, 240),
	(66, 'Eritrea', 'ER', 'ERI', 232, 291),
	(67, 'Estonia', 'EE', 'EST', 233, 372),
	(68, 'Ethiopia', 'ET', 'ETH', 231, 251),
	(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 238, 500),
	(70, 'Faroe Islands', 'FO', 'FRO', 234, 298),
	(71, 'Fiji', 'FJ', 'FJI', 242, 679),
	(72, 'Finland', 'FI', 'FIN', 246, 358),
	(73, 'France', 'FR', 'FRA', 250, 33),
	(74, 'French Guiana', 'GF', 'GUF', 254, 594),
	(75, 'French Polynesia', 'PF', 'PYF', 258, 689),
	(76, 'French Southern Territories', 'TF', NULL, NULL, 0),
	(77, 'Gabon', 'GA', 'GAB', 266, 241),
	(78, 'Gambia', 'GM', 'GMB', 270, 220),
	(79, 'Georgia', 'GE', 'GEO', 268, 995),
	(80, 'Germany', 'DE', 'DEU', 276, 49),
	(81, 'Ghana', 'GH', 'GHA', 288, 233),
	(82, 'Gibraltar', 'GI', 'GIB', 292, 350),
	(83, 'Greece', 'GR', 'GRC', 300, 30),
	(84, 'Greenland', 'GL', 'GRL', 304, 299),
	(85, 'Grenada', 'GD', 'GRD', 308, 1473),
	(86, 'Guadeloupe', 'GP', 'GLP', 312, 590),
	(87, 'Guam', 'GU', 'GUM', 316, 1671),
	(88, 'Guatemala', 'GT', 'GTM', 320, 502),
	(89, 'Guinea', 'GN', 'GIN', 324, 224),
	(90, 'Guinea-Bissau', 'GW', 'GNB', 624, 245),
	(91, 'Guyana', 'GY', 'GUY', 328, 592),
	(92, 'Haiti', 'HT', 'HTI', 332, 509),
	(93, 'Heard Island and Mcdonald Islands', 'HM', NULL, NULL, 0),
	(94, 'Holy See (Vatican City State)', 'VA', 'VAT', 336, 39),
	(95, 'Honduras', 'HN', 'HND', 340, 504),
	(96, 'Hong Kong', 'HK', 'HKG', 344, 852),
	(97, 'Hungary', 'HU', 'HUN', 348, 36),
	(98, 'Iceland', 'IS', 'ISL', 352, 354),
	(99, 'India', 'IN', 'IND', 356, 91),
	(100, 'Indonesia', 'ID', 'IDN', 360, 62),
	(101, 'Iran, Islamic Republic of', 'IR', 'IRN', 364, 98),
	(102, 'Iraq', 'IQ', 'IRQ', 368, 964),
	(103, 'Ireland', 'IE', 'IRL', 372, 353),
	(104, 'Israel', 'IL', 'ISR', 376, 972),
	(105, 'Italy', 'IT', 'ITA', 380, 39),
	(106, 'Jamaica', 'JM', 'JAM', 388, 1876),
	(107, 'Japan', 'JP', 'JPN', 392, 81),
	(108, 'Jordan', 'JO', 'JOR', 400, 962),
	(109, 'Kazakhstan', 'KZ', 'KAZ', 398, 7),
	(110, 'Kenya', 'KE', 'KEN', 404, 254),
	(111, 'Kiribati', 'KI', 'KIR', 296, 686),
	(112, 'Korea, Democratic People\'s Republic of', 'KP', 'PRK', 408, 850),
	(113, 'Korea, Republic of', 'KR', 'KOR', 410, 82),
	(114, 'Kuwait', 'KW', 'KWT', 414, 965),
	(115, 'Kyrgyzstan', 'KG', 'KGZ', 417, 996),
	(116, 'Lao People\'s Democratic Republic', 'LA', 'LAO', 418, 856),
	(117, 'Latvia', 'LV', 'LVA', 428, 371),
	(118, 'Lebanon', 'LB', 'LBN', 422, 961),
	(119, 'Lesotho', 'LS', 'LSO', 426, 266),
	(120, 'Liberia', 'LR', 'LBR', 430, 231),
	(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', 434, 218),
	(122, 'Liechtenstein', 'LI', 'LIE', 438, 423),
	(123, 'Lithuania', 'LT', 'LTU', 440, 370),
	(124, 'Luxembourg', 'LU', 'LUX', 442, 352),
	(125, 'Macao', 'MO', 'MAC', 446, 853),
	(126, 'Macedonia, the Former Yugoslav Republic of', 'MK', 'MKD', 807, 389),
	(127, 'Madagascar', 'MG', 'MDG', 450, 261),
	(128, 'Malawi', 'MW', 'MWI', 454, 265),
	(129, 'Malaysia', 'MY', 'MYS', 458, 60),
	(130, 'Maldives', 'MV', 'MDV', 462, 960),
	(131, 'Mali', 'ML', 'MLI', 466, 223),
	(132, 'Malta', 'MT', 'MLT', 470, 356),
	(133, 'Marshall Islands', 'MH', 'MHL', 584, 692),
	(134, 'Martinique', 'MQ', 'MTQ', 474, 596),
	(135, 'Mauritania', 'MR', 'MRT', 478, 222),
	(136, 'Mauritius', 'MU', 'MUS', 480, 230),
	(137, 'Mayotte', 'YT', NULL, NULL, 269),
	(138, 'Mexico', 'MX', 'MEX', 484, 52),
	(139, 'Micronesia, Federated States of', 'FM', 'FSM', 583, 691),
	(140, 'Moldova, Republic of', 'MD', 'MDA', 498, 373),
	(141, 'Monaco', 'MC', 'MCO', 492, 377),
	(142, 'Mongolia', 'MN', 'MNG', 496, 976),
	(143, 'Montserrat', 'MS', 'MSR', 500, 1664),
	(144, 'Morocco', 'MA', 'MAR', 504, 212),
	(145, 'Mozambique', 'MZ', 'MOZ', 508, 258),
	(146, 'Myanmar', 'MM', 'MMR', 104, 95),
	(147, 'Namibia', 'NA', 'NAM', 516, 264),
	(148, 'Nauru', 'NR', 'NRU', 520, 674),
	(149, 'Nepal', 'NP', 'NPL', 524, 977),
	(150, 'Netherlands', 'NL', 'NLD', 528, 31),
	(151, 'Netherlands Antilles', 'AN', 'ANT', 530, 599),
	(152, 'New Caledonia', 'NC', 'NCL', 540, 687),
	(153, 'New Zealand', 'NZ', 'NZL', 554, 64),
	(154, 'Nicaragua', 'NI', 'NIC', 558, 505),
	(155, 'Niger', 'NE', 'NER', 562, 227),
	(156, 'Nigeria', 'NG', 'NGA', 566, 234),
	(157, 'Niue', 'NU', 'NIU', 570, 683),
	(158, 'Norfolk Island', 'NF', 'NFK', 574, 672),
	(159, 'Northern Mariana Islands', 'MP', 'MNP', 580, 1670),
	(160, 'Norway', 'NO', 'NOR', 578, 47),
	(161, 'Oman', 'OM', 'OMN', 512, 968),
	(162, 'Pakistan', 'PK', 'PAK', 586, 92),
	(163, 'Palau', 'PW', 'PLW', 585, 680),
	(164, 'Palestinian Territory, Occupied', 'PS', NULL, NULL, 970),
	(165, 'Panama', 'PA', 'PAN', 591, 507),
	(166, 'Papua New Guinea', 'PG', 'PNG', 598, 675),
	(167, 'Paraguay', 'PY', 'PRY', 600, 595),
	(168, 'Peru', 'PE', 'PER', 604, 51),
	(169, 'Philippines', 'PH', 'PHL', 608, 63),
	(170, 'Pitcairn', 'PN', 'PCN', 612, 0),
	(171, 'Poland', 'PL', 'POL', 616, 48),
	(172, 'Portugal', 'PT', 'PRT', 620, 351),
	(173, 'Puerto Rico', 'PR', 'PRI', 630, 1787),
	(174, 'Qatar', 'QA', 'QAT', 634, 974),
	(175, 'Reunion', 'RE', 'REU', 638, 262),
	(176, 'Romania', 'RO', 'ROM', 642, 40),
	(177, 'Russian Federation', 'RU', 'RUS', 643, 70),
	(178, 'Rwanda', 'RW', 'RWA', 646, 250),
	(179, 'Saint Helena', 'SH', 'SHN', 654, 290),
	(180, 'Saint Kitts and Nevis', 'KN', 'KNA', 659, 1869),
	(181, 'Saint Lucia', 'LC', 'LCA', 662, 1758),
	(182, 'Saint Pierre and Miquelon', 'PM', 'SPM', 666, 508),
	(183, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 670, 1784),
	(184, 'Samoa', 'WS', 'WSM', 882, 684),
	(185, 'San Marino', 'SM', 'SMR', 674, 378),
	(186, 'Sao Tome and Principe', 'ST', 'STP', 678, 239),
	(187, 'Saudi Arabia', 'SA', 'SAU', 682, 966),
	(188, 'Senegal', 'SN', 'SEN', 686, 221),
	(189, 'Serbia and Montenegro', 'CS', NULL, NULL, 381),
	(190, 'Seychelles', 'SC', 'SYC', 690, 248),
	(191, 'Sierra Leone', 'SL', 'SLE', 694, 232),
	(192, 'Singapore', 'SG', 'SGP', 702, 65),
	(193, 'Slovakia', 'SK', 'SVK', 703, 421),
	(194, 'Slovenia', 'SI', 'SVN', 705, 386),
	(195, 'Solomon Islands', 'SB', 'SLB', 90, 677),
	(196, 'Somalia', 'SO', 'SOM', 706, 252),
	(197, 'South Africa', 'ZA', 'ZAF', 710, 27),
	(198, 'South Georgia and the South Sandwich Islands', 'GS', NULL, NULL, 0),
	(199, 'Spain', 'ES', 'ESP', 724, 34),
	(200, 'Sri Lanka', 'LK', 'LKA', 144, 94),
	(201, 'Sudan', 'SD', 'SDN', 736, 249),
	(202, 'Suriname', 'SR', 'SUR', 740, 597),
	(203, 'Svalbard and Jan Mayen', 'SJ', 'SJM', 744, 47),
	(204, 'Swaziland', 'SZ', 'SWZ', 748, 268),
	(205, 'Sweden', 'SE', 'SWE', 752, 46),
	(206, 'Switzerland', 'CH', 'CHE', 756, 41),
	(207, 'Syrian Arab Republic', 'SY', 'SYR', 760, 963),
	(208, 'Taiwan, Province of China', 'TW', 'TWN', 158, 886),
	(209, 'Tajikistan', 'TJ', 'TJK', 762, 992),
	(210, 'Tanzania, United Republic of', 'TZ', 'TZA', 834, 255),
	(211, 'Thailand', 'TH', 'THA', 764, 66),
	(212, 'Timor-Leste', 'TL', NULL, NULL, 670),
	(213, 'Togo', 'TG', 'TGO', 768, 228),
	(214, 'Tokelau', 'TK', 'TKL', 772, 690),
	(215, 'Tonga', 'TO', 'TON', 776, 676),
	(216, 'Trinidad and Tobago', 'TT', 'TTO', 780, 1868),
	(217, 'Tunisia', 'TN', 'TUN', 788, 216),
	(218, 'Turkey', 'TR', 'TUR', 792, 90),
	(219, 'Turkmenistan', 'TM', 'TKM', 795, 7370),
	(220, 'Turks and Caicos Islands', 'TC', 'TCA', 796, 1649),
	(221, 'Tuvalu', 'TV', 'TUV', 798, 688),
	(222, 'Uganda', 'UG', 'UGA', 800, 256),
	(223, 'Ukraine', 'UA', 'UKR', 804, 380),
	(224, 'United Arab Emirates', 'AE', 'ARE', 784, 971),
	(225, 'United Kingdom', 'GB', 'GBR', 826, 44),
	(226, 'United States', 'US', 'USA', 840, 1),
	(227, 'United States Minor Outlying Islands', 'UM', NULL, NULL, 1),
	(228, 'Uruguay', 'UY', 'URY', 858, 598),
	(229, 'Uzbekistan', 'UZ', 'UZB', 860, 998),
	(230, 'Vanuatu', 'VU', 'VUT', 548, 678),
	(231, 'Venezuela', 'VE', 'VEN', 862, 58),
	(232, 'Viet Nam', 'VN', 'VNM', 704, 84),
	(233, 'Virgin Islands, British', 'VG', 'VGB', 92, 1284),
	(234, 'Virgin Islands, U.s.', 'VI', 'VIR', 850, 1340),
	(235, 'Wallis and Futuna', 'WF', 'WLF', 876, 681),
	(236, 'Western Sahara', 'EH', 'ESH', 732, 212),
	(237, 'Yemen', 'YE', 'YEM', 887, 967),
	(238, 'Zambia', 'ZM', 'ZMB', 894, 260),
	(239, 'Zimbabwe', 'ZW', 'ZWE', 716, 263);
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;


-- Volcando estructura para tabla programathon2016.pyme
DROP TABLE IF EXISTS `pyme`;
CREATE TABLE IF NOT EXISTS `pyme` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NombreComercio` char(100) NOT NULL,
  `EstadoID` int(11) NOT NULL,
  `SectorID` int(11) NOT NULL,
  `AnnoInicioOperaciones` tinyint(4) NOT NULL,
  `NumeroTelefono` char(50) NOT NULL,
  `Direccion` char(200) NOT NULL,
  `EsActiva` bit(1) NOT NULL,
  `EsNegocioFamiliar` bit(1) DEFAULT NULL,
  `Logo` blob NOT NULL,
  `ExtensionLogo` char(3) NOT NULL,
  `FechaCreacion` datetime NOT NULL,
  `FechaUltimaActualizacion` datetime NOT NULL,
  `EsFacebookAppInstalado` bit(1) NOT NULL,
  `UsuarioID` int(11) NOT NULL,
  `GeneroPropietarioID` varchar(1) NOT NULL,
  `CedJuridica` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_PYME_SECTOR_idx` (`SectorID`),
  KEY `FK_PYME_STATE_idx` (`EstadoID`),
  KEY `FK_PYME_USER_idx` (`UsuarioID`),
  KEY `FK_PYME_GENDER_idx` (`GeneroPropietarioID`),
  CONSTRAINT `FK_PYME_GENDER` FOREIGN KEY (`GeneroPropietarioID`) REFERENCES `genero` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PYME_SECTOR` FOREIGN KEY (`SectorID`) REFERENCES `sector` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PYME_STATE` FOREIGN KEY (`EstadoID`) REFERENCES `estado` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PYME_USER` FOREIGN KEY (`UsuarioID`) REFERENCES `usuario` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla programathon2016.pyme: ~0 rows (aproximadamente)
DELETE FROM `pyme`;
/*!40000 ALTER TABLE `pyme` DISABLE KEYS */;
/*!40000 ALTER TABLE `pyme` ENABLE KEYS */;


-- Volcando estructura para tabla programathon2016.redsocial
DROP TABLE IF EXISTS `redsocial`;
CREATE TABLE IF NOT EXISTS `redsocial` (
  `TipoRedSocialID` int(11) NOT NULL,
  `Comentario` varchar(300) DEFAULT NULL,
  `InformacionContacto` varchar(300) DEFAULT NULL,
  `PymeID` int(11) NOT NULL,
  `Link` varchar(300) NOT NULL,
  PRIMARY KEY (`TipoRedSocialID`,`PymeID`),
  KEY `FK_SocialNetwork_Type_idx` (`TipoRedSocialID`),
  KEY `FK_SOCIALNETWORK_PYME_idx` (`PymeID`),
  CONSTRAINT `FK_SOCIALNETWORK_PYME` FOREIGN KEY (`PymeID`) REFERENCES `pyme` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SOCIALNETWORK_TYPE` FOREIGN KEY (`TipoRedSocialID`) REFERENCES `tiporedsocial` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla programathon2016.redsocial: ~0 rows (aproximadamente)
DELETE FROM `redsocial`;
/*!40000 ALTER TABLE `redsocial` DISABLE KEYS */;
/*!40000 ALTER TABLE `redsocial` ENABLE KEYS */;


-- Volcando estructura para tabla programathon2016.respuesta
DROP TABLE IF EXISTS `respuesta`;
CREATE TABLE IF NOT EXISTS `respuesta` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Respuesta01` int(11) NOT NULL,
  `Respuesta02` int(11) NOT NULL,
  `Respuesta03` int(11) NOT NULL,
  `Respuesta04` int(11) NOT NULL,
  `Respuesta05` int(11) NOT NULL,
  `FechaRespuesta` datetime NOT NULL,
  `GeneroID` varchar(1) NOT NULL,
  `Campo01` varchar(100) DEFAULT NULL,
  `Campo02` varchar(100) DEFAULT NULL,
  `RangoEdad` tinyint(1) NOT NULL,
  `PymeID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ANSWER_GENDER_idx` (`GeneroID`),
  KEY `FK_RESPUESTA_PYME_idx` (`PymeID`),
  CONSTRAINT `FK_ANSWER_GENDER` FOREIGN KEY (`GeneroID`) REFERENCES `genero` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_RESPUESTA_PYME` FOREIGN KEY (`PymeID`) REFERENCES `pyme` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla programathon2016.respuesta: ~0 rows (aproximadamente)
DELETE FROM `respuesta`;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;


-- Volcando estructura para tabla programathon2016.sector
DROP TABLE IF EXISTS `sector`;
CREATE TABLE IF NOT EXISTS `sector` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` char(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla programathon2016.sector: ~11 rows (aproximadamente)
DELETE FROM `sector`;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` (`Id`, `Nombre`) VALUES
	(1, 'Agroindustria'),
	(2, 'Ambiental'),
	(3, 'Automotriz'),
	(4, 'Banca'),
	(5, 'Construcción'),
	(6, 'Comercio'),
	(7, 'Tecnológico'),
	(8, 'Transporte'),
	(9, 'Servicio de Alimentos'),
	(10, 'Bebidas'),
	(11, 'Otros Servicios');
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;


-- Volcando estructura para tabla programathon2016.tiporedsocial
DROP TABLE IF EXISTS `tiporedsocial`;
CREATE TABLE IF NOT EXISTS `tiporedsocial` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla programathon2016.tiporedsocial: ~5 rows (aproximadamente)
DELETE FROM `tiporedsocial`;
/*!40000 ALTER TABLE `tiporedsocial` DISABLE KEYS */;
INSERT INTO `tiporedsocial` (`Id`, `Nombre`) VALUES
	(1, 'Facebook'),
	(2, 'Twitter'),
	(3, 'Linkedin'),
	(4, 'YouTube'),
	(5, 'Website');
/*!40000 ALTER TABLE `tiporedsocial` ENABLE KEYS */;


-- Volcando estructura para tabla programathon2016.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(50) NOT NULL,
  `NombreCompleto` varchar(100) NOT NULL,
  `Clave` varchar(50) NOT NULL,
  `EmailContacto` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla programathon2016.usuario: ~0 rows (aproximadamente)
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

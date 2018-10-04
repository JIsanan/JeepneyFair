-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2018 at 05:18 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jeepney`
--
CREATE DATABASE IF NOT EXISTS `jeepney` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `jeepney`;

-- --------------------------------------------------------

--
-- Table structure for table `direction`
--

DROP TABLE IF EXISTS `direction`;
CREATE TABLE `direction` (
  `route_id` int(11) NOT NULL,
  `stop_id` int(11) NOT NULL,
  `next_stop` int(11) NOT NULL,
  `interchange` tinyint(1) NOT NULL DEFAULT '0',
  `direction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `direction`
--

INSERT INTO `direction` (`route_id`, `stop_id`, `next_stop`, `interchange`, `direction_id`) VALUES
(1, 1, 2, 0, 1),
(1, 2, 3, 0, 2),
(1, 3, 4, 0, 3),
(1, 4, 5, 0, 4),
(1, 5, 6, 0, 5),
(1, 6, 7, 0, 6),
(1, 7, 8, 0, 7),
(1, 8, 9, 0, 8),
(1, 9, 10, 0, 9),
(1, 10, 11, 0, 10),
(1, 11, 12, 0, 11),
(1, 12, 13, 0, 12),
(1, 13, 14, 0, 13),
(1, 14, 15, 0, 14),
(1, 15, 16, 0, 15),
(1, 16, 17, 0, 16),
(1, 17, 18, 0, 17),
(1, 18, 19, 0, 18),
(1, 19, 20, 0, 19),
(1, 20, 21, 0, 20),
(1, 21, 22, 0, 21),
(1, 22, 23, 0, 22),
(1, 23, 24, 0, 23),
(1, 24, 25, 0, 24),
(1, 25, 26, 0, 25),
(1, 26, 27, 0, 26),
(1, 27, 28, 0, 27),
(1, 28, 29, 0, 28),
(1, 29, 30, 0, 29),
(1, 30, 31, 0, 30),
(1, 31, 32, 0, 31),
(1, 32, 33, 0, 32),
(1, 33, 34, 0, 33),
(1, 34, 35, 0, 34),
(1, 35, 36, 0, 35),
(1, 36, 37, 0, 36),
(1, 37, 38, 0, 37),
(1, 39, 40, 0, 38),
(1, 40, 41, 0, 39),
(1, 41, 42, 0, 40),
(1, 42, 43, 0, 41),
(1, 43, 44, 0, 42),
(1, 44, 45, 0, 43),
(1, 45, 46, 0, 44),
(1, 46, 47, 0, 45),
(1, 47, 48, 0, 46),
(1, 48, 49, 0, 47),
(1, 49, 50, 0, 48),
(1, 50, 51, 0, 49);

-- --------------------------------------------------------

--
-- Table structure for table `fares`
--

DROP TABLE IF EXISTS `fares`;
CREATE TABLE `fares` (
  `base_fare` double NOT NULL DEFAULT '6.5',
  `base_km` int(11) NOT NULL DEFAULT '4',
  `fare_increment` double NOT NULL DEFAULT '0.9'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `metro_area`
--

DROP TABLE IF EXISTS `metro_area`;
CREATE TABLE `metro_area` (
  `metro_id` int(11) NOT NULL,
  `metro_name` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `metro_area`
--

INSERT INTO `metro_area` (`metro_id`, `metro_name`) VALUES
(1, 'Cebu');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
CREATE TABLE `route` (
  `route_id` int(11) NOT NULL,
  `route_code` varchar(6) COLLATE utf8_spanish_ci DEFAULT NULL,
  `route_name` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`route_id`, `route_code`, `route_name`) VALUES
(1, '01K', 'Urgello St.-Parkmall'),
(2, '01B', 'Sambag 1(Private)-Pier 2 & 3'),
(3, '11A', 'Inayawan-Colon'),
(4, '01C', 'V. Rama Ave.-Pier 3'),
(5, '04C', 'Carbon Market-Lahug'),
(6, '04D', 'Carbon Market-Busay(Plaza Housing)'),
(7, '12L', 'Labangon-Ayala Center Cebu'),
(8, '04I', 'Carbon Market-Busay(Plaza Housing)'),
(9, '06B', 'Sto. Niño-Guadalupe'),
(10, '06C', 'Sto. Niño-Guadalupe'),
(11, '04H', 'Carbon Market-Busay(Plaza Housing)'),
(12, '13B', 'Carbon Market-Talamban'),
(13, '13C', 'Colon-Talamban'),
(14, '62B', 'Carbon Market-Pit-os'),
(15, '62C', 'Carbon Market-Pit-os'),
(16, '08G', 'Alumnos-Colon/Parian(Zulueta St.)'),
(17, '17B', 'Carbon Market-Apas'),
(18, '17C', 'Carbon Market-Apas'),
(19, '10F', 'Bulacao-Junquera St./USC Main'),
(20, '09F', 'Basak-Ibabao(Quiot)-Colon/Parian(Zulueta St.)'),
(21, '14D', 'Colon/V. Gullas St.-Ayala Center Cebu'),
(22, '06H', 'Guadalupe-SM City Cebu (via Ayala Center Cebu)'),
(23, '07B', 'Carbon Market-Banawa'),
(24, '13H', 'Pit-os-Mandaue Public Market');

-- --------------------------------------------------------

--
-- Table structure for table `stop`
--

DROP TABLE IF EXISTS `stop`;
CREATE TABLE `stop` (
  `stop_id` int(11) NOT NULL,
  `stop_name` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `stop_latitude` double DEFAULT NULL,
  `stop_longitude` double DEFAULT NULL,
  `metro_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `stop`
--

INSERT INTO `stop` (`stop_id`, `stop_name`, `stop_latitude`, `stop_longitude`, `metro_id`) VALUES
(1, 'V. Urgello St.', 10.304625, 123.892387, 1),
(2, 'Sacred Heart Hospital/Southwestern University', 10.303787, 123.892731, 1),
(3, 'J. Urgello St.', 10.301435, 123.893224, 1),
(4, 'Librando Transit Terminal', 10.299066, 123.89437, 1),
(5, 'Elizabeth Mall', 10.297974, 123.895718, 1),
(6, 'Cebu Coliseum (Leon Kilat)', 10.296681, 123.89613, 1),
(7, 'Gaisano South', 10.295657, 123.897093, 1),
(8, 'Metro Gaisano Colon', 10.296449, 123.898657, 1),
(9, 'Colonnade Mall (Colon)', 10.297042, 123.899679, 1),
(10, 'Gaisano Main (Colon)', 10.297671, 123.901151, 1),
(11, 'Colon Obelisk', 10.297833, 123.902948, 1),
(12, 'Mabini St.(Heritage of Cebu Parian)', 10.298599, 123.903753, 1),
(13, 'Zulueta St.', 10.298583, 123.904713, 1),
(14, 'M.J. Cuenco-G. Lavilles', 10.29967, 123.906359, 1),
(15, 'M.J. Cuenco-T. Padilla', 10.301722, 123.906603, 1),
(16, 'CPILS', 10.302651, 123.906512, 1),
(17, 'Museo Sugbo', 10.303943, 123.906331, 1),
(18, 'Tejero Sabungan', 10.305766, 123.906158, 1),
(19, 'Department of Social Welfare and Development (DSWD)', 10.308407, 123.907514, 1),
(20, 'Carreta Elementary School', 10.307455, 123.909144, 1),
(21, 'White Gold Club', 10.308345, 123.911408, 1),
(22, 'A. Soriano Ave.', 10.310948, 123.914595, 1),
(23, 'F. Cabahug St.', 10.313588, 123.920747, 1),
(24, 'SM Hypermarket Mandaue', 10.315107, 123.923783, 1),
(25, 'Gatewalk Central/North Bus Terminal', 10.31744, 123.925259, 1),
(26, 'E.O. Perez St.', 10.320155, 123.928604, 1),
(27, 'Cebu Doctor''s University', 10.320215, 123.9329, 1),
(28, 'Northdrive', 10.321635, 123.934227, 1),
(29, 'Cebu International Convention Center (CICC)', 10.325825, 123.935472, 1),
(30, 'Parkmall', 10.324898, 123.932853, 1),
(31, 'Chong Hua Hospital Mandaue', 10.322991, 123.930824, 1),
(32, 'Cebu Westown Lagoon', 10.321445, 123.929842, 1),
(33, 'E.O. Perez St.', 10.320871, 123.927022, 1),
(34, 'North Bus Terminal', 10.318696, 123.925541, 1),
(35, 'SM Hypermarket Mandaue', 10.315218, 123.923647, 1),
(36, 'F. Cabahug St. (City Pound)', 10.313898, 123.920616, 1),
(37, 'APM Shopping Center', 10.313372, 123.917361, 1),
(38, 'A. Soriano Ave.', 10.310619, 123.91402, 1),
(39, 'Queen City Memorial Garden', 10.309349, 123.91244, 1),
(40, 'White Gold House', 10.306702, 123.91006, 1),
(41, '13th Ave.-B. Benedicto St.', 10.304674, 123.909461, 1),
(42, 'B. Benedicto St.', 10.30305, 123.909204, 1),
(43, 'B. Benedicto-T. Padilla St.', 10.30196, 123.908722, 1),
(44, 'Tejero Elementary School', 10.301046, 123.906438, 1),
(45, 'M.J. Cuenco-G. Lavilles (former NSO)', 10.29941, 123.906178, 1),
(46, 'Commission of Audit', 10.297913, 123.905911, 1),
(47, 'Cebu Technological University', 10.296885, 123.905706, 1),
(48, 'V. Gullas-P. Burgos St.', 10.297189, 123.903553, 1),
(49, 'Gaisano Main (V. Gullas)', 10.296935, 123.901659, 1),
(50, 'Colonnade Mall/Cine Oriente (Legaspi St.)', 10.296451, 123.899764, 1),
(51, 'Hotel de Mercedes', 10.297453, 123.898695, 1),
(52, 'University of Cebu Main Campus', 10.297561, 123.896774, 1),
(53, 'GSIS/Elizabeth Mall', 10.297898, 123.895902, 1),
(54, 'Librando Transit Terminal', 10.29913, 123.894452, 1),
(55, 'J. Urgello St.', 10.301444, 123.893286, 1),
(56, 'J. Urgello-Uytengsu St.', 10.303393, 123.892905, 1),
(57, 'Ascencion St.', 10.304132, 123.893222, 1),
(58, 'J. Alcantara St.-V. Rama Ave.', 10.298737, 123.888065, 1),
(59, 'University of San Carlos South Campus', 10.29952, 123.889149, 1),
(60, 'J. Alcantara-Sambag 1st (Private)', 10.299726, 123.892062, 1),
(61, 'A. Bonifacio-Sikatuna St.', 10.3004, 123.903193, 1),
(62, 'A. Bonifacio-D. Jakosalem St.', 10.30034, 123.90151, 1),
(63, 'P. del Rosario (Day-as)', 10.301746, 123.901581, 1),
(64, 'Sikatuna-T. Padilla St.', 10.30167, 123.902855, 1),
(65, 'T. Padilla Public Market', 10.301762, 123.904423, 1),
(66, 'B. Benedicto-T. Padilla St.', 10.301868, 123.908829, 1),
(67, 'Sergio Osmeña Jr. "Serging" Blvd. (Villagonzalo)', 10.300532, 123.90947, 1),
(68, 'Sergio Osmeña Jr. "Serging" Blvd.-V. Sotto St.', 10.299187, 123.908722, 1),
(69, 'Pier 3', 10.298107, 123.909287, 1),
(70, 'Pier 2', 10.295586, 123.908155, 1),
(71, 'Pier 3', 10.298202, 123.909291, 1),
(72, 'Sergio Osmeña Jr. "Serging" Blvd.-V. Sotto St.', 10.29928, 123.908966, 1),
(73, 'Sergio Osmeña Jr. "Serging" Blvd. (Villagonzalo)', 10.300956, 123.909909, 1),
(74, 'T.Padilla-M.J. Cuenco', 10.301926, 123.905892, 1),
(75, 'Gaisano Saversmart T. Padilla', 10.301792, 123.90359, 1),
(76, '61-69 Sikatuna St.', 10.300735, 123.902865, 1),
(77, 'Parian Barangay Hall', 10.298985, 123.903032, 1),
(78, 'University of the Visayas (Sanciangko)', 10.29918, 123.900978, 1),
(79, 'University of San Carlos Main Campus (Sanciangko)', 10.298635, 123.899213, 1),
(80, 'Colon St. (Super Metro)', 10.297245, 123.899766, 1),
(81, 'University of San Carlos Main Campus (Pelaez)', 10.299501, 123.898147, 1),
(82, 'Imus Ave. (Zapatera)', 10.303122, 123.90303, 1),
(83, 'Imus Ave. (Lorega San Miguel)', 10.307035, 123.905863, 1),
(84, 'Cebu Skin Clinic (Carreta)', 10.309306, 123.907679, 1),
(85, 'Hipodromo', 10.311213, 123.909188, 1),
(86, 'Cebu Business Park (Leyte Loop East)', 10.315221, 123.909223, 1),
(87, 'Cebu Business Park (Skyrise Alpha)', 10.317385, 123.90897, 1),
(88, 'Cebu Business Park (Mercedes Benz Tower/Ayala Cebu Terraces)', 10.319548, 123.906609, 1),
(89, 'Grand Convention Center', 10.322213, 123.905062, 1),
(90, 'Bureau of Internal Revenue (Talamban-bound)', 10.323558, 123.905903, 1),
(91, 'M. Cuenco Ave.-Bauhinia', 10.329281, 123.90927, 1),
(92, 'Aboitiz', 10.332736, 123.910439, 1),
(93, 'Paradise Village', 10.335014, 123.910885, 1),
(94, 'GQS Plaza/University of Cebu Banilad Campus', 10.337937, 123.911435, 1),
(95, 'Banilad Elementary School', 10.346627, 123.912906, 1),
(96, 'Sto. Niño Village', 10.348634, 123.913265, 1),
(97, 'University of San Carlos Talamban Campus', 10.351891, 123.91389, 1),
(98, 'Family Park', 10.354574, 123.914636, 1),
(99, 'M. Cuenco-M.L. Quezon Ave.', 10.360551, 123.915421, 1),
(100, 'Gaisano Grand Talamban', 10.366569, 123.913955, 1),
(101, 'Talamban Barangay Hall/Time Square Talamban', 10.369546, 123.918202, 1),
(102, 'Tintay Market', 10.370937, 123.924752, 1),
(103, 'Talamban Barangay Hall/Time Square Talamban', 10.369748, 123.918428, 1),
(104, 'Gaisano Grand Talamban', 10.366346, 123.913812, 1),
(105, 'M. Cuenco Ave. (Piazza Elesia)', 10.360851, 123.915278, 1),
(106, 'Park Terrace Nasipit', 10.355782, 123.915001, 1),
(107, 'University of San Carlos Talamban Campus (Portal)', 10.353163, 123.914135, 1),
(108, 'University of San Carlos Talamban Campus (Bunzel Building)', 10.351943, 123.913813, 1),
(109, 'Gullas Memorial Hospital', 10.347566, 123.912945, 1),
(110, 'Foodland', 10.343886, 123.912269, 1),
(111, 'Gaisano Country Mall', 10.339514, 123.911343, 1),
(112, 'Paradise Village', 10.334996, 123.910793, 1),
(113, 'Cebu Country Club', 10.331295, 123.909983, 1),
(114, 'Crossroads/National Food Authority', 10.328479, 123.908808, 1),
(115, 'Bureau of Internal Revenue/Barrio Luz', 10.323746, 123.905927, 1),
(116, 'Ayala Center Cebu (The Terraces)', 10.31932, 123.906534, 1),
(117, 'Cebu Business Park (Lexmark)', 10.317504, 123.908626, 1),
(118, 'Cebu Business Park (Samar Loop South)', 10.315587, 123.907623, 1),
(119, 'Ayala Center Cebu (Luzon Ave.)', 10.316673, 123.904461, 1),
(120, 'Acacia/Hotel Elizabeth', 10.316843, 123.902125, 1),
(121, 'Asilo de la Milagrosa', 10.314426, 123.902033, 1),
(122, 'Colegio de la Inmaculada Concepcion', 10.311957, 123.903294, 1),
(123, 'Gen. Echavez St.', 10.309428, 123.903506, 1),
(124, 'Gen. Echavez-Sikatuna St.', 10.305396, 123.901534, 1),
(125, 'Zapatera Elementary School', 10.304136, 123.901704, 1),
(126, 'Sikatuna St. (Heritage of Cebu Parian)', 10.298586, 123.90354, 1),
(127, 'Colon St. (Colon Obelisk)', 10.297901, 123.902632, 1),
(128, 'University of the Visayas (Colon)', 10.297822, 123.901419, 1),
(129, 'Carbon Market', 10.292022, 123.899678, 1),
(130, 'Cebu City Hall (D. Jakosalem)', 10.292597, 123.901108, 1),
(131, 'Basilica Minore del Sto. Niño (D. Jakosalem)', 10.295111, 123.901681, 1),
(132, 'D. Jakosalem-F. Urdaneta St.', 10.29604, 123.901946, 1),
(133, 'University of the Visayas (D. Jakosalem)', 10.298242, 123.901953, 1),
(134, 'D. Jakosalem-R. Landon St.', 10.303038, 123.900256, 1),
(135, 'Ramos Public Market', 10.304659, 123.899926, 1),
(136, 'BayanTel', 10.306461, 123.89978, 1),
(137, 'Gen. Echavez-Lorega San Miguel', 10.308141, 123.903164, 1),
(138, 'Gen. Echavez St.', 10.309333, 123.903541, 1),
(139, 'Colegio de la Inmaculada Concepcion', 10.311627, 123.903581, 1),
(140, '13 Gorordo Ave.', 10.313783, 123.902472, 1),
(141, 'Asilo de la Milagrosa', 10.314946, 123.901878, 1),
(142, 'Hotel Elizabeth', 10.316583, 123.902132, 1),
(143, 'Ayala Center Cebu (PUV Terminal)', 10.318803, 123.903506, 1),
(144, 'Talamban Market', 10.368808, 123.915948, 1),
(145, 'Kauswagan', 10.370843, 123.916924, 1),
(146, 'Maryville Subdivision', 10.373783, 123.918757, 1),
(147, '1614 Talamban Rd.', 10.377764, 123.919938, 1),
(148, 'Pristina North', 10.381777, 123.920813, 1),
(149, 'Bacayan', 10.386493, 123.921326, 1),
(150, 'Cebu International School', 10.395024, 123.921924, 1),
(151, 'Pit-os', 10.395964, 123.921636, 1),
(152, 'Cebu International School', 10.395001, 123.921878, 1),
(153, 'Bacayan', 10.385805, 123.921253, 1),
(154, 'Pristina North', 10.381385, 123.92074, 1),
(155, '1614 Talamban Rd. (Geminie Gas Station)', 10.377988, 123.919934, 1),
(156, 'Maryville Subdivision', 10.374152, 123.918864, 1),
(157, 'Kauswagan', 10.371146, 123.916968, 1),
(158, 'Talamban Market', 10.368974, 123.916057, 1),
(159, 'The Greenery', 10.324623, 123.908253, 1),
(160, 'The Gallery', 10.323479, 123.908957, 1),
(161, 'San Carlos Seminary College', 10.322229, 123.90979, 1),
(162, 'Cardinal Rosales-P. Cabantan', 10.31955, 123.908927, 1),
(163, 'BayanTel', 10.306332, 123.899735, 1),
(164, 'Ramos Public Market', 10.304994, 123.899082, 1),
(165, 'Junquera-R. Landon', 10.302704, 123.898207, 1),
(166, 'Philippine Christian Gospel School', 10.301659, 123.898354, 1),
(167, 'University of San Carlos Main Campus (Junquera)', 10.299981, 123.899289, 1),
(168, 'Legaspi-V. Gullas-Osmeña', 10.296046, 123.899753, 1),
(169, 'Pacific Tourist Inn', 10.294982, 123.899187, 1),
(170, '278 Manalili St.', 10.293131, 123.898664, 1),
(171, 'Progreso St.', 10.292211, 123.898919, 1),
(172, 'Ayala Center Cebu (Luzon Ave.)', 10.316451, 123.904508, 1),
(173, 'Cebu Holdings Center', 10.317536, 123.907354, 1),
(174, 'Carreta Cemetery', 10.309436, 123.906162, 1),
(175, 'Cebu Business Park (2Quad)', 10.314431, 123.905156, 1),
(176, 'Cebu Business Park (Negros Rd.)', 10.313029, 123.904601, 1),
(177, 'Rosedale Building', 10.35085, 123.913535, 1),
(178, 'Banilad Elementary School', 10.346106, 123.912661, 1),
(179, 'Bureau of Internal Revenue (non-Talamban)', 10.324174, 123.906411, 1),
(180, 'Cebu Grand Convention Center', 10.322759, 123.905282, 1),
(193, 'Lorega', 10.306042, 123.905145, 1),
(194, 'St. Anthony Mother and Child Hospital', 10.286663, 123.871072, 1),
(195, 'C. Padilla-Tabada St.', 10.289097, 123.874477, 1),
(196, 'Candido Padilla St-SRP Mambaling', 10.290559, 123.876787, 1),
(197, 'Jai-alai', 10.291295, 123.88007, 1),
(198, 'C. Padilla St.-R. Padilla St.', 10.292385, 123.883821, 1),
(199, 'C.Padilla St.-Carlock St', 10.293113, 123.886871, 1),
(200, 'Ludo', 10.292128, 123.88876, 1),
(201, 'San Nicolas De Tolentino Parish Church', 10.293889, 123.8915, 1),
(202, 'M.J. Cuenco-Legaspi', 10.294351, 123.904687, 1),
(203, 'Cebu Metropolitan Cathedral', 10.295204, 123.902749, 1),
(204, 'Legaspi St.', 10.295924, 123.900983, 1),
(205, 'University of San Jose-Recoletos Main Campus(Magallanes)', 10.29407, 123.89857, 1),
(206, 'Tres de Abril-Guadalupe River', 10.293659, 123.894259, 1),
(207, 'San Nicolas De Tolentino Parish Church', 10.294005, 123.891479, 1),
(208, 'Don Carlos A. Gothong Memorial High School', 10.293748, 123.889907, 1),
(209, 'Tabada St.', 10.286588, 123.875027, 1),
(210, 'Cebu City Hall (M.C. Briones)', 10.292432, 123.901571, 1),
(211, 'La Nueva', 10.292389, 123.902639, 1),
(212, 'Dept of Trade and Industry', 10.294028, 123.903917, 1),
(213, 'Bangko Sentral ng Pilipinas', 10.300589, 123.89657, 1),
(214, 'Camp Sergio Osmeña', 10.303236, 123.895593, 1),
(215, 'Old Philamlife', 10.304856, 123.895013, 1),
(216, 'Visayas Community Medical Center', 10.306386, 123.894496, 1),
(217, 'Crown Regency Hotel', 10.307583, 123.894056, 1),
(218, 'Metrobank Plaza Cebu', 10.308183, 123.893893, 1),
(219, 'Cocomall', 10.311944, 123.892512, 1),
(220, 'Cebu Doctors University Hospital', 10.313505, 123.891961, 1),
(221, 'Capitol Site', 10.316683, 123.892396, 1),
(222, 'Capitol Square', 10.317316, 123.8942, 1),
(223, 'Our Lady of the Sacred Heart Parish', 10.3177, 123.896104, 1),
(224, 'Harolds Hotel', 10.319181, 123.899689, 1),
(225, 'University of the Philippines-Visayas Cebu Campus', 10.322275, 123.89882, 1),
(226, 'Gorordo-Kamagong', 10.325729, 123.898132, 1),
(227, 'The Church of Jesus Christ of Latter-day Saints Cebu Central Temple', 10.327426, 123.897813, 1),
(228, 'JY Square', 10.329999, 123.897766, 1),
(229, 'The Church of Jesus Christ of Latter-day Saints Salinas Drive', 10.330269, 123.899852, 1),
(230, 'University of Southern Philippines Foundation Lahug', 10.32971, 123.900991, 1),
(231, 'Cebu IT Park (The Walk)', 10.328674, 123.906032, 1),
(232, 'Skyrise 1', 10.331417, 123.90775, 1),
(233, 'PNP Training Center Field', 10.335, 123.907444, 1),
(234, 'Camp Lapu-Lapu Elementary School', 10.33675, 123.90625, 1),
(235, 'Apas', 10.340472, 123.906278, 1),
(236, 'Skyrise 1', 10.331271, 123.907716, 1),
(237, 'Cebu IT Park (Block 11 Central Bloc)', 10.328866, 123.906113, 1),
(238, 'University of Southern Philippines Foundation Lahug/STI Colleges', 10.329147, 123.902306, 1),
(239, 'Salinas-Wilson', 10.330651, 123.899258, 1),
(240, 'University of the Philippines-Visayas Cebu Campus', 10.323726, 123.898414, 1),
(241, 'Harolds Hotel', 10.319828, 123.899046, 1),
(242, 'Vibo Place', 10.317841, 123.896208, 1),
(243, 'Escario Central Mall', 10.317384, 123.893989, 1),
(244, 'Cebu Provincial Capitol (Escario)', 10.31674, 123.892149, 1),
(245, 'The Strip', 10.315228, 123.891154, 1),
(246, 'Cebu Doctors University Hospital', 10.313755, 123.891666, 1),
(247, 'Cebu City Public Library', 10.312094, 123.892247, 1),
(248, 'Department of Health', 10.308059, 123.893636, 1),
(249, 'Paulines', 10.304764, 123.894841, 1),
(250, 'Abellana Sports Complex', 10.301247, 123.896059, 1),
(251, 'University of Cebu Main Campus (Osmeña Blvd.)', 10.29712, 123.897706, 1),
(252, 'University of San Jose-Recoletos Main Campus (P. Lopez)', 10.294072, 123.897947, 1),
(253, 'Borromeo Arcade', 10.306005, 123.897358, 1),
(254, 'Cebu Velez General Hospital', 10.307194, 123.8965, 1),
(255, 'Raintree Mall', 10.309351, 123.894825, 1),
(256, 'One Mango Avenue', 10.310405, 123.896023, 1),
(257, 'Horizons 101', 10.31096, 123.897612, 1),
(258, 'Fooda Saversmart', 10.311321, 123.899002, 1),
(259, 'University of San Carlos North Campus', 10.311452, 123.901183, 1),
(260, 'QC Pavilion', 10.316896, 123.900853, 1),
(261, 'QC Pavilion', 10.316964, 123.900709, 1),
(262, 'Albulario Bldg.', 10.31127, 123.90267, 1),
(263, 'University of San Carlos North Campus', 10.311552, 123.901163, 1),
(264, 'Fooda Saversmart', 10.31144, 123.898902, 1),
(265, 'St. Theresa''s College', 10.310982, 123.897403, 1),
(266, 'Mango Square', 10.310542, 123.896063, 1),
(267, 'Raintree Mall', 10.309107, 123.894872, 1),
(268, 'ABC Hotel', 10.307097, 123.896402, 1),
(269, 'St. Paul College Foundation Ramos', 10.305071, 123.897939, 1),
(270, 'Elizabeth Mall/Cebu Coliseum', 10.297105, 123.895248, 1),
(271, 'Sanciangko-Panganiban', 10.296104, 123.892709, 1),
(272, 'Panganiban-Dimas-alang', 10.293865, 123.894828, 1),
(273, 'Freedom Park', 10.293399, 123.897855, 1),
(274, 'St. Paul College Foundation Bulacao', 10.272333, 123.848167, 1),
(275, 'Newtown Estate', 10.276938, 123.852841, 1),
(276, 'Sto. Tomas de Villanueva Parish', 10.279361, 123.855333, 1),
(277, 'Pardo', 10.280768, 123.856555, 1),
(278, 'N. Bacalso-F. Jaca', 10.28307, 123.858578, 1),
(279, 'University of San Jose-Recoletos Basak Campus', 10.287612, 123.863476, 1),
(280, 'Mambaling', 10.289345, 123.868867, 1),
(281, 'Shopwise', 10.289718, 123.871274, 1),
(282, 'Mambaling Flyover', 10.290115, 123.87471, 1),
(283, 'Cebu Institute of Technology University', 10.294226, 123.881771, 1),
(284, 'Salazar Colleges', 10.295303, 123.883263, 1),
(285, 'N. Bacalso-Tres de Abril', 10.296596, 123.885562, 1),
(286, 'Citilink', 10.297253, 123.889317, 1),
(287, 'South Bus Terminal', 10.298396, 123.893306, 1),
(288, 'Asian College of Technology', 10.299102, 123.89613, 1),
(289, 'Gaisano South', 10.295808, 123.897182, 1),
(290, 'Borromeo-Climaco', 10.29607, 123.895235, 1),
(291, 'Cebu City Medical Center', 10.297422, 123.892038, 1),
(292, 'College of Technological Sciences/Citilink', 10.297587, 123.890263, 1),
(293, 'N. Bacalso-Tres de Abril', 10.296709, 123.885351, 1),
(294, 'Salazar Colleges', 10.295432, 123.883145, 1),
(295, 'Cebu Institute of Technology University', 10.293977, 123.881142, 1),
(296, 'Mambaling Flyover', 10.290279, 123.874721, 1),
(297, 'Super Metro Mambaling', 10.289735, 123.869819, 1),
(298, 'Don Vicente Rama Memorial Elementary School (N. Bacalso)', 10.288647, 123.865628, 1),
(299, 'University of San Jose-Recoletos Basak Campus', 10.287176, 123.862233, 1),
(300, 'N. Bacalso-F. Jaca', 10.283261, 123.85855, 1),
(301, 'Sto. Tomas de Villanueva Parish', 10.279658, 123.855393, 1),
(302, 'Newtown Estate', 10.277401, 123.853136, 1),
(303, 'Quiot', 10.292722, 123.860667, 1),
(304, 'Southwestern University Basak Campus', 10.292576, 123.863208, 1),
(305, 'Don Vicente Rama Memorial Elementary School (Macopa)', 10.29041, 123.866217, 1),
(306, 'Quiot Barangay Hall', 10.288402, 123.859212, 1),
(307, 'Mountain View Village Quiot', 10.291119, 123.859345, 1),
(308, 'Mancing Building', 10.297055, 123.897865, 1),
(309, 'North Escario', 10.318945, 123.90095, 1),
(310, 'Apitong St.', 10.320442, 123.902107, 1),
(311, 'C. Rosal St.', 10.320648, 123.90071, 1),
(312, 'J. Labra St.', 10.331146, 123.880375, 1),
(313, 'Guadalupe Church', 10.329325, 123.880913, 1),
(314, 'Queensville Subdivision', 10.326852, 123.882113, 1),
(315, 'Fooda Guadalupe', 10.323645, 123.883617, 1),
(316, 'Guadalupe Elementary School', 10.32077, 123.884283, 1),
(317, 'Nichols Heights', 10.31769, 123.884951, 1),
(318, 'M. Velez St.', 10.315955, 123.886242, 1),
(319, 'Cebu Provincial Capitol (Don Gil Garcia)', 10.316595, 123.889855, 1),
(320, 'Don Gil Garcia St.', 10.315264, 123.890459, 1),
(321, 'Lincoln Street', 10.293164, 123.899509, 1),
(322, 'Basilica Minore del Sto. Niño (Osmeña Boulevard)', 10.294671, 123.902116, 1),
(323, 'Osmeña Boulevard-F. Gonzales', 10.295126, 123.901029, 1),
(324, 'Luym Building', 10.295491, 123.900151, 1),
(325, 'Cebu Provincial Capitol (Don Gil Garcia)', 10.316659, 123.890039, 1),
(326, 'M. Velez St.', 10.315997, 123.886052, 1),
(327, 'Canberry Hotel', 10.317428, 123.885072, 1),
(328, 'Guadalupe Elementary School', 10.32165, 123.88416, 1),
(329, 'Fooda Guadalupe', 10.323412, 123.883761, 1),
(330, 'Queensville Subdivision', 10.326704, 123.882253, 1),
(331, 'Guadalupe Church', 10.329436, 123.880924, 1),
(332, 'Court of Appeals', 10.305317, 123.876506, 1),
(333, 'South Hills International School', 10.306808, 123.876089, 1),
(334, 'R. Arcenas St.', 10.309719, 123.876103, 1),
(335, 'Good Shepherd St.', 10.312447, 123.877996, 1),
(336, 'J. Fortich St.', 10.314621, 123.882495, 1),
(337, 'One Pavilion', 10.315477, 123.884743, 1),
(338, 'Sundance Residences', 10.314949, 123.883317, 1),
(339, 'J. Fortich St.', 10.314666, 123.882244, 1),
(340, 'Good Shepherd St.', 10.312451, 123.877885, 1),
(341, 'R. Arcenas St.', 10.309234, 123.875958, 1),
(342, 'South Hills International School', 10.306743, 123.875996, 1),
(343, 'Hi-way 11', 10.371526, 123.918358, 1),
(344, 'Cebu Home & Builders Banilad', 10.343087, 123.915508, 1),
(345, 'Oakridge', 10.342207, 123.917701, 1),
(346, 'Oftana Suites', 10.341235, 123.919669, 1),
(347, 'A.S. Fortuna-H. Cortes', 10.339562, 123.924284, 1),
(348, 'Allure Hotel and Suites', 10.338371, 123.928863, 1),
(349, 'Benedicto College', 10.337273, 123.930664, 1),
(350, 'San Miguel Brewery (A.S. Fortuna)', 10.336066, 123.932332, 1),
(351, 'Norkis Mandaue', 10.333663, 123.934439, 1),
(352, 'A.S. Fortuna-B.B. Cabahug', 10.331114, 123.936538, 1),
(353, 'A.S. Fortuna-A. del Rosario', 10.330239, 123.937747, 1),
(354, 'Old Mandaue Public Market', 10.327874, 123.940991, 1),
(355, 'Colonnade Mandaue', 10.326892, 123.940658, 1),
(356, 'United Rebuilders Inc.', 10.325202, 123.939357, 1),
(357, 'Mandaue City Sports and Cultural Complex', 10.324028, 123.940901, 1),
(358, 'New Mandaue Public Market', 10.322398, 123.941384, 1),
(359, 'Mandaue Social Development Center', 10.324465, 123.942726, 1),
(360, 'Mandaue City Hall Post Office', 10.326642, 123.942645, 1),
(361, 'Mandaue City Hall', 10.326965, 123.942597, 1),
(362, 'Gaisano Grand Mandaue Centro', 10.328442, 123.942185, 1),
(363, 'A. del Rosario-A.S. Fortuna', 10.330349, 123.937507, 1),
(364, 'Colegio de la Inmaculada Concepcion Mandaue (A. del Rosario)', 10.329964, 123.933746, 1),
(365, 'Coca-Cola Bottlers Philippines Cebu', 10.330372, 123.93319, 1),
(366, 'Norkis Mandaue', 10.333306, 123.934841, 1),
(367, 'J Centre Mall', 10.334928, 123.9337, 1),
(368, 'The Orchard Cebu Hotel and Suites', 10.337117, 123.931116, 1),
(369, 'Allure Hotel and Suites', 10.338423, 123.928936, 1),
(370, 'Metro Supermarket A.S. Fortuna', 10.33984, 123.923806, 1),
(371, 'The Space/Lightside Parc', 10.341481, 123.919444, 1),
(372, 'Oakridge', 10.342114, 123.918169, 1),
(373, 'Cebu Home & Builders Banilad', 10.343156, 123.915653, 1),
(374, 'Alumnos\r\n', 10.283639, 123.87275, 1),
(375, 'Taft East Gate', 10.320145, 123.911017, 1),
(376, 'Carmelite Monastery', 10.319002, 123.911712, 1),
(377, 'John Paul II-S. Cabahug', 10.317852, 123.912444, 1),
(378, 'St. Joseph Parish', 10.315346, 123.91396, 1),
(379, 'Mabolo Elementary School/Mabolo National High School', 10.313364, 123.915234, 1),
(380, 'SM City Cebu', 10.310419, 123.918176, 1),
(381, 'Mazda Cebu', 10.313134, 123.915709, 1),
(382, 'St. Joseph Parish', 10.31524, 123.914201, 1),
(383, 'John Paul II-S. Cabahug', 10.317428, 123.912837, 1),
(384, 'PLDT Mabolo', 10.319265, 123.911694, 1),
(385, 'USC Montessori Academy', 10.313332, 123.900947, 1),
(386, 'Queen''s Rd.', 10.312873, 123.899629, 1),
(387, 'Vicente Sotto Memorial Medical Center', 10.309023, 123.891861, 1),
(388, 'City Soho Mall', 10.30836, 123.889896, 1),
(389, 'Cebu Bethel Temple', 10.308047, 123.887708, 1),
(390, 'Securities and Exchange Commission', 10.313344, 123.885987, 1),
(391, '168 Hypermart', 10.314546, 123.88573, 1),
(392, 'APM', 10.314086, 123.918384, 1);

-- --------------------------------------------------------

--
-- Table structure for table `terminus`
--

DROP TABLE IF EXISTS `terminus`;
CREATE TABLE `terminus` (
  `route_id` int(11) NOT NULL,
  `stop_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `terminus`
--

INSERT INTO `terminus` (`route_id`, `stop_id`) VALUES
(1, 1),
(1, 30),
(2, 58),
(2, 70),
(12, 129),
(12, 102),
(13, 80),
(13, 102),
(14, 129),
(14, 151),
(15, 129),
(15, 151),
(7, 143),
(16, 374),
(16, 10),
(17, 129),
(17, 235),
(18, 235),
(18, 129),
(19, 274),
(19, 167),
(20, 303),
(20, 203),
(21, 143),
(21, 168),
(23, 129),
(23, 332),
(24, 151),
(24, 358),
(22, 312),
(22, 380),
(9, 312),
(9, 211);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `direction`
--
ALTER TABLE `direction`
  ADD PRIMARY KEY (`direction_id`),
  ADD KEY `route_id` (`route_id`),
  ADD KEY `stop_id` (`stop_id`),
  ADD KEY `next_stop` (`next_stop`);

--
-- Indexes for table `metro_area`
--
ALTER TABLE `metro_area`
  ADD PRIMARY KEY (`metro_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`),
  ADD UNIQUE KEY `route_code` (`route_code`);

--
-- Indexes for table `stop`
--
ALTER TABLE `stop`
  ADD PRIMARY KEY (`stop_id`),
  ADD KEY `metro_id` (`metro_id`);

--
-- Indexes for table `terminus`
--
ALTER TABLE `terminus`
  ADD KEY `route_id` (`route_id`),
  ADD KEY `stop_id` (`stop_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `direction`
--
ALTER TABLE `direction`
  MODIFY `direction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `metro_area`
--
ALTER TABLE `metro_area`
  MODIFY `metro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `stop`
--
ALTER TABLE `stop`
  MODIFY `stop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=393;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `direction`
--
ALTER TABLE `direction`
  ADD CONSTRAINT `direction_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`),
  ADD CONSTRAINT `direction_ibfk_2` FOREIGN KEY (`stop_id`) REFERENCES `stop` (`stop_id`),
  ADD CONSTRAINT `direction_ibfk_3` FOREIGN KEY (`next_stop`) REFERENCES `stop` (`stop_id`);

--
-- Constraints for table `stop`
--
ALTER TABLE `stop`
  ADD CONSTRAINT `stop_ibfk_1` FOREIGN KEY (`metro_id`) REFERENCES `metro_area` (`metro_id`);

--
-- Constraints for table `terminus`
--
ALTER TABLE `terminus`
  ADD CONSTRAINT `terminus_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`),
  ADD CONSTRAINT `terminus_ibfk_2` FOREIGN KEY (`stop_id`) REFERENCES `stop` (`stop_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

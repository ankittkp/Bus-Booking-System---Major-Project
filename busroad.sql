-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 12, 2019 at 12:32 PM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `busroad`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add routes', 7, 'add_routes'),
(26, 'Can change routes', 7, 'change_routes'),
(27, 'Can delete routes', 7, 'delete_routes'),
(28, 'Can view routes', 7, 'view_routes'),
(29, 'Can add routes', 8, 'add_routes'),
(30, 'Can change routes', 8, 'change_routes'),
(31, 'Can delete routes', 8, 'delete_routes'),
(32, 'Can view routes', 8, 'view_routes'),
(33, 'Can add PayPal IPN', 9, 'add_paypalipn'),
(34, 'Can change PayPal IPN', 9, 'change_paypalipn'),
(35, 'Can delete PayPal IPN', 9, 'delete_paypalipn'),
(36, 'Can view PayPal IPN', 9, 'view_paypalipn');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$uE1PDrl7vYJd$pyU9z7T3g9chKTymvSEB8+OB73RD4oybYoL4k0ZDG/8=', '2019-11-11 13:28:34.849556', 1, 'admin', '', '', 'ankit.2official@gmail.com', 1, 1, '2019-11-11 05:22:55.813327');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blogsite_routes`
--

CREATE TABLE `blogsite_routes` (
  `id` int(11) NOT NULL,
  `source` varchar(25) NOT NULL,
  `destination` varchar(25) NOT NULL,
  `time` time(6) NOT NULL,
  `fare` int(11) NOT NULL,
  `dte` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `buses_routes`
--

CREATE TABLE `buses_routes` (
  `id` int(11) NOT NULL,
  `bus_name` varchar(255) NOT NULL,
  `source` varchar(25) NOT NULL,
  `destination` varchar(25) NOT NULL,
  `date` date NOT NULL,
  `fare` int(11) NOT NULL,
  `time` time(6) NOT NULL,
  `ava_seats` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buses_routes`
--

INSERT INTO `buses_routes` (`id`, `bus_name`, `source`, `destination`, `date`, `fare`, `time`, `ava_seats`) VALUES
(1, 'Thakur Holidays', 'Hamirpur', 'Kangra', '2019-11-22', 220, '05:00:00.000000', 36),
(2, 'Kangra Travels', 'Hamirpur', 'Kangra', '2019-11-22', 220, '06:00:00.000000', 27),
(3, 'Shimla Express', 'Dharmshala', 'Shimla', '2019-11-24', 500, '06:10:17.000000', 40),
(4, 'Dharamshala Travels', 'Dharamshala', 'Shimla', '2019-12-01', 350, '15:30:00.000000', 36),
(5, 'Dharamshala Travels', 'Dharamshala', 'Kangra', '2019-12-22', 350, '16:30:00.000000', 40),
(6, 'Dharamshala Travels', 'Dharmshala', 'Shimla', '2019-12-10', 450, '14:50:00.000000', 40),
(7, 'Dharamshala Travels', 'Dharamshala', 'Hamirpur', '2019-12-01', 300, '15:40:00.000000', 40),
(8, 'Dharamshala Travels', 'Dharamshala', 'Kullu', '2019-12-02', 550, '10:30:00.000000', 40),
(9, 'Dharamshala Travels', 'Dharamshala', 'Solan', '2019-12-09', 400, '13:40:00.000000', 39),
(10, 'Dharamshala Travels', 'Dharamshala', 'Chamba', '2019-12-15', 700, '19:30:00.000000', 40),
(11, 'Dharamshala Travels', 'Dharamshala', 'Pathankot', '2019-12-11', 300, '22:30:00.000000', 40),
(12, 'Dharamshala Travels', 'Dharamshala', 'Una', '2019-12-23', 250, '15:15:00.000000', 40),
(13, 'Dharamshala Travels', 'Dharamshala', 'Palampur', '2019-12-25', 150, '15:45:00.000000', 40),
(14, 'Dharamshala Travels', 'Dharamshala', 'Nahan', '2019-12-14', 750, '18:30:00.000000', 40),
(15, 'Dharamshala Travels', 'Dharamshala', 'Sujanpur', '2019-12-04', 100, '19:30:00.000000', 40),
(16, 'Dharamshala Travels', 'Dharamshala', 'Mccleodganj', '2019-12-13', 50, '15:30:00.000000', 40),
(17, 'Dharamshala Travels', 'Dharamshala', 'Mandi', '2019-12-18', 350, '20:30:00.000000', 40),
(18, 'Dharamshala Travels', 'Dharamshala', 'Keylong', '2019-12-28', 950, '20:10:00.000000', 40),
(19, 'Dharamshala Travels', 'Dharamshala', 'Baijnath', '2019-12-27', 200, '15:20:00.000000', 40),
(20, 'Dharamshala Travels', 'Dharamshala', 'Jogindernagar', '2019-12-17', 150, '15:30:00.000000', 40),
(21, 'Dharamshala Travels', 'Dharamshala', 'Dharampur', '2019-12-26', 250, '15:45:00.000000', 40),
(22, 'Dharamshala Travels', 'Dharamshala', 'Sarkaghat', '2019-12-21', 150, '07:50:00.000000', 40),
(23, 'Dharamshala Travels', 'Dharamshala', 'Sundernagar', '2019-12-29', 157, '04:30:00.000000', 40),
(24, 'Dharamshala Travels', 'Dharamshala', 'Nalagarh', '2019-12-30', 150, '13:30:00.000000', 40),
(25, 'Kangra Travels', 'Kangra', 'Dharamshala', '2019-12-22', 350, '06:40:00.000000', 30),
(26, 'Kangra Travels', 'Kangra', 'Shimla', '2019-12-10', 450, '14:50:00.000000', 40),
(27, 'Kangra Travels', 'Kangra', 'Hamirpur', '2019-12-01', 300, '11:50:00.000000', 40),
(28, 'Kangra Travels', 'Kangra', 'Kullu', '2019-12-02', 550, '10:25:00.000000', 38),
(29, 'Kangra Travels', 'Kangra', 'Solan', '2019-12-09', 400, '13:50:00.000000', 40),
(30, 'Kangra Travels', 'Kangra', 'Chamba', '2019-12-15', 700, '19:20:00.000000', 40),
(31, 'Kangra Travels', 'Kangra', 'Pathankot', '2019-12-11', 300, '22:10:00.000000', 40),
(32, 'Kangra Travels', 'Kangra', 'Una', '2019-12-23', 250, '17:15:00.000000', 40),
(33, 'Kangra Travels', 'Kangra', 'Palampur', '2019-12-25', 150, '15:45:00.000000', 40),
(34, 'Kangra Travels', 'Kangra', 'Nahan', '2019-12-14', 750, '18:30:00.000000', 40),
(35, 'Kangra Travels', 'Kangra', 'Sujanpur', '2019-12-04', 100, '19:30:00.000000', 40),
(36, 'Kangra Travels', 'Kangra', 'Mccleodganj', '2019-12-13', 50, '15:30:00.000000', 40),
(37, 'Kangra Travels', 'Kangra', 'Mandi', '2019-12-18', 350, '20:30:00.000000', 40),
(38, 'Kangra Travels', 'Kangra', 'Keylong', '2019-12-28', 950, '20:10:00.000000', 40),
(39, 'Kangra Travels', 'Kangra', 'Baijnath', '2019-12-27', 200, '15:20:00.000000', 40),
(40, 'Kangra Travels', 'Kangra', 'Jogindernagar', '2019-12-17', 150, '15:30:00.000000', 40),
(41, 'Kangra Travels', 'Kangra', 'Dharampur', '2019-12-26', 250, '15:45:00.000000', 40),
(42, 'Kangra Travels', 'Kangra', 'Sarkaghat', '2019-12-21', 150, '07:50:00.000000', 40),
(43, 'Kangra Travels', 'Kangra', 'Sundernagar', '2019-12-29', 157, '04:30:00.000000', 40),
(44, 'Kangra Travels', 'Kangra', 'Nalagarh', '2019-12-30', 150, '18:30:00.000000', 40),
(45, 'Shimla Travels', 'Shimla', 'Kangra', '2019-12-22', 350, '16:30:00.000000', 40),
(46, 'Shimla Travels', 'Shimla', 'Dharamshala', '2019-12-10', 450, '14:20:00.000000', 40),
(47, 'Shimla Travels', 'Shimla', 'Hamirpur', '2019-12-01', 300, '15:45:00.000000', 40),
(48, 'Shimla Travels', 'Shimla', 'Kullu', '2019-12-02', 550, '10:35:00.000000', 40),
(49, 'Shimla Travels', 'Shimla', 'Solan', '2019-12-09', 400, '13:40:00.000000', 40),
(50, 'Shimla Travels', 'Shimla', 'Chamba', '2019-12-15', 700, '19:30:00.000000', 40),
(51, 'Shimla Travels', 'Shimla', 'Pathankot', '2019-12-11', 300, '22:35:00.000000', 40),
(52, 'Shimla Travels', 'Shimla', 'Una', '2019-12-23', 250, '13:15:00.000000', 40),
(53, 'Shimla Travels', 'Shimla', 'Palampur', '2019-12-25', 150, '14:45:00.000000', 40),
(54, 'Shimla Travels', 'Shimla', 'Nahan', '2019-12-14', 750, '19:30:00.000000', 40),
(55, 'Shimla Travels', 'Shimla', 'Sujanpur', '2019-12-04', 100, '18:15:00.000000', 40),
(56, 'Shimla Travels', 'Shimla', 'Mccleodganj', '2019-12-13', 50, '15:30:00.000000', 40),
(57, 'Shimla Travels', 'Shimla', 'Mandi', '2019-12-18', 350, '20:30:00.000000', 40),
(58, 'Shimla Travels', 'Shimla', 'Keylong', '2019-12-28', 950, '20:25:00.000000', 40),
(59, 'Shimla Travels', 'Shimla', 'Baijnath', '2019-12-27', 200, '15:20:00.000000', 40),
(60, 'Shimla Travels', 'Shimla', 'Jogindernagar', '2019-12-17', 150, '15:30:00.000000', 40),
(61, 'Shimla Travels', 'Shimla', 'Dharampur', '2019-12-26', 250, '15:45:00.000000', 40),
(62, 'Shimla Travels', 'Shimla', 'Sarkaghat', '2019-12-21', 150, '07:50:00.000000', 40),
(63, 'Shimla Travels', 'Shimla', 'Sundernagar', '2019-12-29', 157, '04:30:00.000000', 40),
(64, 'Shimla Travels', 'Shimla', 'Nalagarh', '2019-12-30', 150, '18:30:00.000000', 40),
(65, 'Kullu Travels', 'Kullu', 'Kangra', '2019-12-22', 350, '16:30:00.000000', 40),
(66, 'Kullu Travels', 'Kullu', 'Shimla', '2019-12-10', 450, '14:50:00.000000', 40),
(67, 'Kullu Travels', 'Kullu', 'Hamirpur', '2019-12-01', 300, '15:40:00.000000', 40),
(68, 'Kullu Travels', 'Kullu', 'Dharamshala', '2019-12-02', 550, '10:30:00.000000', 38),
(69, 'Kullu Travels', 'Kullu', 'Solan', '2019-12-09', 400, '13:40:00.000000', 40),
(70, 'Kullu Travels', 'Kullu', 'Chamba', '2019-12-15', 700, '19:30:00.000000', 40),
(71, 'Kullu Travels', 'Kullu', 'Pathankot', '2019-12-11', 300, '22:20:00.000000', 40),
(72, 'Kullu Travels', 'Kullu', 'Una', '2019-12-23', 250, '15:15:00.000000', 40),
(73, 'Kullu Travels', 'Kullu', 'Palampur', '2019-12-25', 150, '15:25:00.000000', 40),
(74, 'Kullu Travels', 'Kullu', 'Nahan', '2019-12-14', 750, '18:17:00.000000', 40),
(75, 'Kullu Travels', 'Kullu', 'Sujanpur', '2019-12-04', 100, '19:20:00.000000', 40),
(76, 'Kullu Travels', 'Kullu', 'Mccleodganj', '2019-12-13', 50, '15:30:00.000000', 40),
(77, 'Kullu Travels', 'Kullu', 'Mandi', '2019-12-18', 350, '20:30:00.000000', 40),
(78, 'Kullu Travels', 'Kullu', 'Keylong', '2019-12-28', 950, '20:10:00.000000', 40),
(79, 'Kullu Travels', 'Kullu', 'Baijnath', '2019-12-27', 200, '15:20:00.000000', 40),
(80, 'Kullu Travels', 'Kullu', 'Jogindernagar', '2019-12-17', 150, '15:30:00.000000', 38),
(81, 'Kullu Travels', 'Kullu', 'Dharampur', '2019-12-26', 250, '15:45:00.000000', 40),
(82, 'Kullu Travels', 'Kullu', 'Sarkaghat', '2019-12-21', 150, '07:50:00.000000', 40),
(83, 'Kullu Travels', 'Kullu', 'Sundernagar', '2019-12-29', 157, '04:30:00.000000', 40),
(84, 'Kullu Travels', 'Kullu', 'Nalagarh', '2019-12-30', 150, '18:30:00.000000', 40),
(85, 'Chamba Travels', 'Chamba', 'Kangra', '2019-12-22', 350, '16:30:00.000000', 40),
(86, 'Chamba Travels', 'Chamba', 'Shimla', '2019-12-10', 450, '14:50:00.000000', 40),
(87, 'Chamba Travels', 'Chamba', 'Hamirpur', '2019-12-01', 300, '15:40:00.000000', 40),
(88, 'Chamba Travels', 'Chamba', 'Kullu', '2019-12-02', 550, '10:30:00.000000', 40),
(89, 'Chamba Travels', 'Chamba', 'Solan', '2019-12-09', 400, '13:40:00.000000', 40),
(90, 'Chamba Travels', 'Chamba', 'Dharamshala', '2019-12-15', 700, '19:30:00.000000', 40),
(91, 'Chamba Travels', 'Chamba', 'Pathankot', '2019-12-11', 300, '20:10:00.000000', 40),
(92, 'Chamba Travels', 'Chamba', 'Una', '2019-12-23', 250, '15:25:00.000000', 40),
(93, 'Chamba Travels', 'Chamba', 'Palampur', '2019-12-25', 150, '15:25:00.000000', 40),
(94, 'Chamba Travels', 'Chamba', 'Nahan', '2019-12-14', 750, '18:30:00.000000', 40),
(95, 'Chamba Travels', 'Chamba', 'Sujanpur', '2019-12-04', 100, '19:30:00.000000', 40),
(96, 'Chamba Travels', 'Chamba', 'Mccleodganj', '2019-12-13', 50, '15:30:00.000000', 40),
(97, 'Chamba Travels', 'Chamba', 'Mandi', '2019-12-18', 350, '20:30:00.000000', 40),
(98, 'Chamba Travels', 'Chamba', 'Keylong', '2019-12-28', 950, '20:10:00.000000', 40),
(99, 'Chamba Travels', 'Chamba', 'Baijnath', '2019-12-27', 200, '15:20:00.000000', 40),
(100, 'Chamba Travels', 'Chamba', 'Jogindernagar', '2019-12-17', 150, '15:30:00.000000', 40),
(101, 'Chamba Travels', 'Chamba', 'Dharampur', '2019-12-26', 250, '15:45:00.000000', 40),
(102, 'Chamba Travels', 'Chamba', 'Sarkaghat', '2019-12-21', 150, '07:50:00.000000', 40),
(103, 'Chamba Travels', 'Chamba', 'Sundernagar', '2019-12-29', 157, '04:30:00.000000', 40),
(104, 'Chamba Travels', 'Chamba', 'Nalagarh', '2019-12-30', 150, '18:30:00.000000', 40),
(105, 'Solan Travels', 'Solan', 'Kangra', '2019-12-22', 350, '16:30:00.000000', 40),
(106, 'Solan Travels', 'Solan', 'Shimla', '2019-12-10', 450, '14:50:00.000000', 40),
(107, 'Solan Travels', 'Solan', 'Hamirpur', '2019-12-01', 300, '15:40:00.000000', 40),
(108, 'Solan Travels', 'Solan', 'Kullu', '2019-12-02', 550, '10:30:00.000000', 40),
(109, 'Palampur Travels', 'Palampur', 'Solan', '2019-12-09', 400, '13:40:00.000000', 40),
(110, 'Palampur Travels', 'Palampur', 'Chamba', '2019-12-15', 700, '19:30:00.000000', 40),
(111, 'Palampur Travels', 'Palampur', 'Pathankot', '2019-12-11', 300, '22:30:00.000000', 40),
(112, 'Palampur Travels', 'Palampur', 'Una', '2019-12-23', 250, '15:15:00.000000', 40),
(113, 'Mccleodganj Travels', 'Mccleodganj', 'Palampur', '2019-12-25', 150, '15:25:00.000000', 40),
(114, 'Mccleodganj Travels', 'Mccleodganj', 'Nahan', '2019-12-14', 750, '18:35:00.000000', 40),
(115, 'Baijnath Travels', 'Baijnath', 'Sujanpur', '2019-12-04', 100, '19:40:00.000000', 40),
(116, 'Baijnath Travels', 'Baijnath', 'Mccleodganj', '2019-12-13', 50, '17:30:00.000000', 40),
(117, 'Baijnath Travels', 'Baijnath', 'Mandi', '2019-12-18', 350, '20:30:00.000000', 40),
(118, 'Dharampur Travels', 'Dharamshala', 'Keylong', '2019-12-28', 950, '20:10:00.000000', 40),
(119, 'Mandi Travels', 'Mandi', 'Baijnath', '2019-12-27', 200, '15:20:00.000000', 40),
(120, 'Nahan Travels', 'Nahan', 'Jogindernagar', '2019-12-17', 150, '15:30:00.000000', 40),
(121, 'Nahan Travels', 'Nahan', 'Dharampur', '2019-12-26', 250, '15:45:00.000000', 40),
(122, 'Nahan Travels', 'Nahan', 'Sarkaghat', '2019-12-21', 150, '07:50:00.000000', 40),
(123, 'Mandi Travels', 'Mandi', 'Sundernagar', '2019-12-29', 157, '04:30:00.000000', 38),
(124, 'Una Travels', 'Una', 'Nalagarh', '2019-12-30', 150, '18:30:00.000000', 39);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(8, 'blogsite', 'routes'),
(7, 'buses', 'routes'),
(5, 'contenttypes', 'contenttype'),
(9, 'ipn', 'paypalipn'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-11-11 05:21:10.343722'),
(2, 'auth', '0001_initial', '2019-11-11 05:21:12.205632'),
(3, 'admin', '0001_initial', '2019-11-11 05:21:23.525153'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-11-11 05:21:25.077042'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-11-11 05:21:25.128803'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-11-11 05:21:26.266080'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-11-11 05:21:26.414213'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-11-11 05:21:26.538694'),
(9, 'auth', '0004_alter_user_username_opts', '2019-11-11 05:21:26.612096'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-11-11 05:21:27.273421'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-11-11 05:21:27.321859'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-11-11 05:21:27.381268'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-11-11 05:21:27.548058'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-11-11 05:21:27.738355'),
(15, 'auth', '0010_alter_group_name_max_length', '2019-11-11 05:21:27.894581'),
(16, 'auth', '0011_update_proxy_permissions', '2019-11-11 05:21:27.990530'),
(17, 'sessions', '0001_initial', '2019-11-11 05:21:28.491945'),
(18, 'buses', '0001_initial', '2019-11-13 10:16:47.252457'),
(19, 'buses', '0002_auto_20191120_1002', '2019-11-20 10:02:48.231645'),
(20, 'blogsite', '0001_initial', '2019-11-20 10:12:20.141863'),
(21, 'blogsite', '0002_auto_20191204_1324', '2019-12-04 13:24:56.333408'),
(22, 'ipn', '0001_initial', '2019-12-07 17:19:33.891723'),
(23, 'ipn', '0002_paypalipn_mp_id', '2019-12-07 17:19:34.779863'),
(24, 'ipn', '0003_auto_20141117_1647', '2019-12-07 17:19:36.058071'),
(25, 'ipn', '0004_auto_20150612_1826', '2019-12-07 17:19:38.924966'),
(26, 'ipn', '0005_auto_20151217_0948', '2019-12-07 17:19:40.502163'),
(27, 'ipn', '0006_auto_20160108_1112', '2019-12-07 17:19:41.811705'),
(28, 'ipn', '0007_auto_20160219_1135', '2019-12-07 17:19:41.888727'),
(29, 'ipn', '0008_auto_20181128_1032', '2019-12-07 17:19:41.936251');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('m90f98ppqtsk3vln8rab7xxe3fonpdcw', 'YWMxMjA5ZTg0NmM3ZGUzNjI1NmQ3NmExZjRmNTM1Y2QxNzE1M2VjNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiY2JkMjBkOGIxYWUzNTE5NDkwOGVmMzQ3NWJjYjQ2M2RiZDM0YWM3In0=', '2019-11-25 13:28:34.939831');

-- --------------------------------------------------------

--
-- Table structure for table `paypal_ipn`
--

CREATE TABLE `paypal_ipn` (
  `id` int(11) NOT NULL,
  `business` varchar(127) NOT NULL,
  `charset` varchar(255) NOT NULL,
  `custom` varchar(256) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(254) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(255) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(255) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int(11) DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(255) NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `pending_reason` varchar(255) NOT NULL,
  `protection_eligibility` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reason_code` varchar(255) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(255) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime(6) DEFAULT NULL,
  `auction_multi_item` int(11) DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime(6) DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(255) NOT NULL,
  `period_type` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `profile_status` varchar(255) NOT NULL,
  `recurring_payment_id` varchar(255) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime(6) DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(255) NOT NULL,
  `period2` varchar(255) NOT NULL,
  `period3` varchar(255) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int(11) DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime(6) DEFAULT NULL,
  `subscr_date` datetime(6) DEFAULT NULL,
  `subscr_effective` datetime(6) DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime(6) DEFAULT NULL,
  `case_id` varchar(255) NOT NULL,
  `case_type` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(256) NOT NULL,
  `ipaddress` char(39) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  `mp_id` varchar(128) DEFAULT NULL,
  `option_selection1` varchar(200) NOT NULL,
  `option_selection2` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_db`
--

CREATE TABLE `user_db` (
  `user_name` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `user_gender` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `bus_id` int(5) NOT NULL,
  `user_bus` varchar(255) NOT NULL,
  `user_source` varchar(255) NOT NULL,
  `user_destination` varchar(255) NOT NULL,
  `user_date` date NOT NULL,
  `user_time` time(6) NOT NULL,
  `user_seatNo` int(5) NOT NULL,
  `user_fare` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_db`
--

INSERT INTO `user_db` (`user_name`, `user_phone`, `user_gender`, `user_email`, `bus_id`, `user_bus`, `user_source`, `user_destination`, `user_date`, `user_time`, `user_seatNo`, `user_fare`) VALUES
('archit', '7018268807', 'M', 'architiiitmahajan@gmail.com', 2, 'Kangra Travels', 'Hamirpur', 'Kangra', '2019-11-22', '06:00:00.000000', 1, 220),
('wazir', '7018268807', 'M', 'adityawazir92@gmail.com', 2, 'Kangra Travels', 'Hamirpur', 'Kangra', '2019-11-22', '06:00:00.000000', 4, 220),
('archit', '7018268807', 'M', 'architiiitmahajan@gmail.com', 2, 'Kangra Travels', 'Hamirpur', 'Kangra', '2019-11-22', '06:00:00.000000', 3, 220),
('Tarun', '7355124598', 'M', 'tkj012@gmail.com', 2, 'Kangra Travels', 'Hamirpur', 'Kangra', '2019-11-22', '06:00:00.000000', 9, 220),
('MD Aftab Raini', '08840904901', 'M', 'aftabraini8090@gmail.com', 1, 'Thakur Holidays', 'Hamirpur', 'Kangra', '2019-11-22', '05:00:00.000000', 24, 220),
('yooo', '9858123456', 'M', 'babec72155@imail1.net', 1, 'Thakur Holidays', 'Hamirpur', 'Kangra', '2019-11-22', '05:00:00.000000', 12, 220),
('archit', '7018268807', 'M', 'architiiitmahajan@gmail.com', 2, 'Kangra Travels', 'Hamirpur', 'Kangra', '2019-11-22', '06:00:00.000000', 25, 220),
('Kartik', '7018390615', 'M', 'architiiitmahajan@gmail.com', 25, 'Kangra Travels', 'Kangra', 'Dharamshala', '2019-12-22', '06:40:00.000000', 5, 350),
('Kartik', '7018390615', 'M', 'architiiitmahajan@gmail.com', 25, 'Kangra Travels', 'Kangra', 'Dharamshala', '2019-12-22', '06:40:00.000000', 5, 350),
('Divyanshu', '7355124598', 'M', 'architiiitmahajan@gmail.com', 25, 'Kangra Travels', 'Kangra', 'Dharamshala', '2019-12-22', '06:40:00.000000', 25, 350),
('Divyanshu', '7355124598', 'M', 'architiiitmahajan@gmail.com', 25, 'Kangra Travels', 'Kangra', 'Dharamshala', '2019-12-22', '06:40:00.000000', 25, 350),
('archit', '7355124598', 'M', 'architiiitmahajan@gmail.com', 25, 'Kangra Travels', 'Kangra', 'Dharamshala', '2019-12-22', '06:40:00.000000', 17, 350),
('archit', '7355124598', 'M', 'architiiitmahajan@gmail.com', 25, 'Kangra Travels', 'Kangra', 'Dharamshala', '2019-12-22', '06:40:00.000000', 17, 350),
('archit', '7355124598', 'M', 'architiiitmahajan@gmail.com', 25, 'Kangra Travels', 'Kangra', 'Dharamshala', '2019-12-22', '06:40:00.000000', 17, 350),
('archit', '7355124598', 'M', 'architiiitmahajan@gmail.com', 25, 'Kangra Travels', 'Kangra', 'Dharamshala', '2019-12-22', '06:40:00.000000', 17, 350),
('archit', '7355124598', 'M', 'architiiitmahajan@gmail.com', 25, 'Kangra Travels', 'Kangra', 'Dharamshala', '2019-12-22', '06:40:00.000000', 17, 350),
('Tarun', '7355124598', 'M', 'architiiitmahajan@gmail.com', 25, 'Kangra Travels', 'Kangra', 'Dharamshala', '2019-12-22', '06:40:00.000000', 13, 350),
('Ankita', '8351802506', 'F', '16574@nith.ac.in', 80, 'Kullu Travels', 'Kullu', 'Jogindernagar', '2019-12-17', '15:30:00.000000', 16, 150),
('Ankit', '1234567890', 'M', 'cs16574@nith.ac.in', 80, 'Kullu Travels', 'Kullu', 'Jogindernagar', '2019-12-17', '15:30:00.000000', 17, 150),
('archit', '7018268807', 'M', 'architiiitmahajan@gmail.com', 2, 'Kangra Travels', 'Hamirpur', 'Kangra', '2019-11-22', '06:00:00.000000', 6, 220),
('archit', '7018268807', 'M', 'architiiitmahajan@gmail.com', 2, 'Kangra Travels', 'Hamirpur', 'Kangra', '2019-11-22', '06:00:00.000000', 0, 220),
('archit', '7018268807', 'M', 'architiiitmahajan@gmail.com', 2, 'Kangra Travels', 'Hamirpur', 'Kangra', '2019-11-22', '06:00:00.000000', 36, 220),
('archit', '7018268807', 'M', 'architiiitmahajan@gmail.com', 2, 'Kangra Travels', 'Hamirpur', 'Kangra', '2019-11-22', '06:00:00.000000', 37, 220),
('archit', '7018268807', 'M', 'architiiitmahajan@gmail.com', 2, 'Kangra Travels', 'Hamirpur', 'Kangra', '2019-11-22', '06:00:00.000000', 20, 220),
('archit', '7018268807', 'M', 'architiiitmahajan@gmail.com', 2, 'Kangra Travels', 'Hamirpur', 'Kangra', '2019-11-22', '06:00:00.000000', 16, 220),
('archit', '7018268807', 'M', 'architiiitmahajan@gmail.com', 2, 'Kangra Travels', 'Hamirpur', 'Kangra', '2019-11-22', '06:00:00.000000', 8, 220),
('Ankit', '8351802578', 'M', 'ankit.2official@gmail.com', 28, 'Kangra Travels', 'Kangra', 'Kullu', '2019-12-02', '10:25:00.000000', 7, 550),
('Ankit', '8351802578', 'M', 'ankit.2official@gmail.com', 28, 'Kangra Travels', 'Kangra', 'Kullu', '2019-12-02', '10:25:00.000000', 7, 550),
('Rupesh', '7845472547', 'M', 'sharma.17divyanshu@gmail.com', 9, 'Dharamshala Travels', 'Dharamshala', 'Solan', '2019-12-09', '13:40:00.000000', 12, 400),
('Ankit', '8351802578', 'M', 'cs16574@nith.ac.in', 1, 'Thakur Holidays', 'Hamirpur', 'Kangra', '2019-11-22', '05:00:00.000000', 28, 220),
('Rupesh', '7018268807', 'M', 'rupeshsharma134@gmail.com', 124, 'Una Travels', 'Una', 'Nalagarh', '2019-12-30', '18:30:00.000000', 8, 150),
('Tarun', '7355124598', 'M', 'cs16574@nith.ac.in', 68, 'Kullu Travels', 'Kullu', 'Dharamshala', '2019-12-02', '10:30:00.000000', 5, 550),
('Tarun', '7355124598', 'M', 'cs16574@nith.ac.in', 68, 'Kullu Travels', 'Kullu', 'Dharamshala', '2019-12-02', '10:30:00.000000', 5, 550),
('archit', '7018268807', 'M', 'tkj012@gmail.com', 123, 'Mandi Travels', 'Mandi', 'Sundernagar', '2019-12-29', '04:30:00.000000', 4, 157),
('nps', '7007907254', 'M', 'nps@nith.ac.in', 123, 'Mandi Travels', 'Mandi', 'Sundernagar', '2019-12-29', '04:30:00.000000', 10, 157);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `blogsite_routes`
--
ALTER TABLE `blogsite_routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buses_routes`
--
ALTER TABLE `buses_routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paypal_ipn_txn_id_8fa22c44` (`txn_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blogsite_routes`
--
ALTER TABLE `blogsite_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `buses_routes`
--
ALTER TABLE `buses_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

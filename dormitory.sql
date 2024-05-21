-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 21, 2024 at 05:33 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dormitory`
--

-- --------------------------------------------------------

--
-- Table structure for table `absent`
--

DROP TABLE IF EXISTS `absent`;
CREATE TABLE IF NOT EXISTS `absent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `building_id` int DEFAULT NULL,
  `dormitory_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `dormitory_admin_id` int DEFAULT NULL,
  `create_date` varchar(20) DEFAULT NULL,
  `reason` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `absent`
--

INSERT INTO `absent` (`id`, `building_id`, `dormitory_id`, `student_id`, `dormitory_admin_id`, `create_date`, `reason`) VALUES
(13, 1, 2, 5, 16, '2024-05-16', 'Nghỉ có phép'),
(14, 1, 1, 1, 1, '2024-05-26', 'Nghỉ có phép'),
(15, 2, 5, 63, 1, '2024-04-13', 'Nghỉ có phép');

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
CREATE TABLE IF NOT EXISTS `building` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `introduction` varchar(1000) DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`id`, `name`, `introduction`, `admin_id`) VALUES
(1, 'Toà nhà 1', '6 tầng. 50 phòng. Xây dựng 07/1980.', 1),
(2, 'Toà nhà 2', '8 tầng. 65 phòng. Xây dựng 02/1997.', 2),
(3, 'Toà nhà 3', '6 tầng. 49 phòng. Xây dựng 05/2018.', 3);

-- --------------------------------------------------------

--
-- Table structure for table `dormitory`
--

DROP TABLE IF EXISTS `dormitory`;
CREATE TABLE IF NOT EXISTS `dormitory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `building_id` int DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `available` int DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_dorm` (`building_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `dormitory`
--

INSERT INTO `dormitory` (`id`, `building_id`, `name`, `type`, `available`, `telephone`) VALUES
(1, 1, '101', 4, 0, '0363037187'),
(2, 1, '102', 4, 0, '0935066647'),
(3, 1, '201', 4, 0, '0931915108'),
(4, 2, '111', 6, 1, '0905400329'),
(5, 2, '112', 8, 6, '0932536332'),
(6, 2, '113', 10, 10, '0334726475'),
(7, 1, '202', 6, 6, '0943359997');

-- --------------------------------------------------------

--
-- Table structure for table `dormitory_admin`
--

DROP TABLE IF EXISTS `dormitory_admin`;
CREATE TABLE IF NOT EXISTS `dormitory_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `dormitory_admin`
--

INSERT INTO `dormitory_admin` (`id`, `username`, `password`, `name`, `gender`, `telephone`) VALUES
(1, 'dinhmanh', 'dinhmanh', 'Đỗ Đình Mạnh', 'nam', '0332842309'),
(2, 'haidang', 'haidang', 'Huỳnh Hải Đăng', 'nam', '0787614533'),
(3, 'vanluyn', 'vanluyn', 'Võ Thị Vân Luyn', 'nữ', '0905847287'),
(21, 'trancong', 'trancong', 'Võ Trần Công', 'nam', '0387981525'),
(22, 'thucvi', 'thucvi', 'Huỳnh Thị Thục Vi	', 'nữ', '0376719322');

-- --------------------------------------------------------

--
-- Table structure for table `moveout`
--

DROP TABLE IF EXISTS `moveout`;
CREATE TABLE IF NOT EXISTS `moveout` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(11) DEFAULT NULL,
  `dormitory_id` varchar(50) DEFAULT NULL,
  `reason` varchar(11) DEFAULT NULL,
  `create_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `moveout`
--

INSERT INTO `moveout` (`id`, `student_id`, `dormitory_id`, `reason`, `create_date`) VALUES
(15, '63', '6', 'tốt nghiệp', '2024-02-17'),
(17, '18', '4', 'tốt nghiệp', '2024-03-27');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(11) DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `dormitory_id` int DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `create_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `number`, `name`, `gender`, `dormitory_id`, `state`, `create_date`) VALUES
(1, '102210028', 'Nguyễn Viết Hoài Bảo', 'nam', 1, 'đang ở', '2021-07-23'),
(2, '102210029', 'Hoàng Lê Anh Bình', 'nữ', 1, 'đang ở', '2020-01-13'),
(3, '102210031', 'Lê Minh Duy', 'nam', 1, 'đang ở', '2019-12-30'),
(4, '102210032', 'Nguyễn Thị Thu Hà', 'nữ', 1, 'đang ở', '2022-09-03'),
(5, '102210350', 'Phan Thị Thanh Nhàn', 'nữ', 2, 'đang ở', '2023-11-01'),
(6, '102210034', 'Phạm Trung Hiếu', 'nam', 2, 'đang ở', '2022-09-11'),
(7, '102210035', 'Trần Kim Hiếu', 'nam', 2, 'đang ở', '2021-03-03'),
(8, '102210036', 'Châu Diễm Hoàng', 'nữ', 2, 'đang ở', '2024-04-19'),
(9, '102210037', 'Đoàn Thị Phước Huyền', 'nữ', 3, 'đang ở', '2021-04-22'),
(10, '102210039', 'Đặng Nhật Minh', 'nam', 3, 'đang ở', '2022-05-23'),
(11, '102210040', 'Nguyễn Trương Anh Mi', 'nam', 3, 'đang ở', '2021-06-15'),
(12, '102210041', 'Trần Lê Minh', 'nam', 3, 'đang ở', '2023-07-16'),
(13, '102210042', 'Nguyễn Minh Ngọc', 'nam', 4, 'đang ở', '2022-10-12'),
(14, '102210043', 'Nguyễn Ngọc Bảo Nhân', 'nam', 4, 'đang ở', '2021-08-22'),
(15, '102210044', 'Nguyễn Hồ Minh Quân', 'nam', 4, 'đang ở', '2022-05-28'),
(16, '102210045', 'Trần Tấn Thành', 'nam', 4, 'đang ở', '2023-07-23'),
(17, '102210047', 'Ngô Mậu Trường', 'nam', 4, 'đang ở', '2021-06-24'),
(18, '102210048', 'Phạm Thành Vinh', 'nam', 4, 'rời đi', '2019-07-02'),
(63, '102210049', 'Nguyễn Phạm Nhật Vỹ', 'nữ', 5, 'rời đi', '2016-08-17');

-- --------------------------------------------------------

--
-- Table structure for table `system_admin`
--

DROP TABLE IF EXISTS `system_admin`;
CREATE TABLE IF NOT EXISTS `system_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `system_admin`
--

INSERT INTO `system_admin` (`id`, `username`, `password`, `name`, `telephone`) VALUES
(1, 'giakhiem', 'giakhiem', 'Trần Đinh Gia Khiêm', '0905745129'),
(2, 'ducchung', 'ducchung', 'Nguyễn Đức Chung', '0378427964'),
(3, 'huuhiep', 'huuhiep', 'Nguyễn Hữu Hiệp', '0349839628'),
(4, 'hoanglong', 'hoanglong', 'Trương Công Hoàng Lo', '0762668222');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

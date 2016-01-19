-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 07, 2016 at 02:13 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `graph-dev-2`
--

--
-- Dumping data for table `tags`
--
DELETE FROM `posts_tags` WHERE 1;
DELETE FROM `tags` WHERE 1;
INSERT INTO `tags` (`id`, `uuid`, `name`, `slug`, `description`, `image`, `hidden`, `parent_id`, `meta_title`, `meta_description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `priority`) VALUES
(0, '63bf02c7-0e12-4d55-8e17-f0fbe2b52b3a', 'SAO VIỆT', 'sao-viet', NULL, NULL, 0, 2, NULL, NULL, '2015-12-08 20:13:16', 1, '2015-12-08 20:13:33', 1, 0),
(2, '2bd96ff9-0b63-4bc4-b59d-ffca50bf8620', 'TIN SAO', 'tin-sao', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-07 22:59:15', 1, '2015-12-08 20:14:01', 1, 1),
(3, '591359c1-903c-4161-ba21-568ace55d9cd', 'XEM', 'xem', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:14:25', 1, 2),
(4, 'a8e4abbe-8341-4e6b-9d2b-7ff1743c1530', 'NHẠC', 'nhac', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:14:50', 1, 3),
(5, '2e242778-123d-4913-a564-413d6054e46b', 'SỐNG', 'song', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:15:43', 1, 4),
(6, '4a14b65f-f261-4a54-8204-92df4704dd20', 'ĐẸP', 'dep', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:15:51', 1, 5),
(7, '7cd77a5c-7aac-433e-a38f-2b5100457326', 'YÊU', 'yeu', '', NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:17:02', 1, 6),
(8, 'fdc1fb33-b107-4559-8765-745c36a4df36', 'CƯỚI', 'cuoi', '', NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:17:36', 1, 7),
(9, '09cffbf8-1ecf-471f-a3ff-b49fd674c333', 'THỂ THAO', 'the-thao', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:17:53', 1, 8),
(10, '04b8211a-a61f-457b-be26-a60323141335', 'XÕA', 'xoa', '', NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-10 13:14:50', 1, 9),
(11, '5a08148c-4698-412e-acd9-0e12fdfa8ca2', 'HỌC', 'hoc', '', NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:17:44', 1, 10),
(14, '3aebb22b-2f39-4ad8-83e0-3ab571c806cb', 'SAO NGOẠI', 'sao-ngoai', NULL, NULL, 0, 2, NULL, NULL, '2015-12-08 20:13:47', 1, '2015-12-08 20:13:47', 1, 0),
(15, '09e1a81b-7461-4963-90af-af81fde6efdc', 'TV SHOW', 'tv-show', '', NULL, 0, 3, NULL, NULL, '2015-12-08 20:14:35', 1, '2015-12-08 20:14:37', 1, 0),
(16, 'c454bf7b-97a2-4dce-808f-4da15dadcbb5', 'PHIM', 'phim', NULL, NULL, 0, 3, NULL, NULL, '2015-12-08 20:14:38', 1, '2015-12-08 20:14:38', 1, 0),
(17, '3c3cc405-338e-42c4-a5e4-bd71244229a4', 'VIỆT NAM', 'viet-nam', NULL, NULL, 0, 4, NULL, NULL, '2015-12-08 20:15:02', 1, '2015-12-08 20:15:02', 1, 0),
(18, '94f56920-031f-4fbe-8e2a-4780f12d2d07', 'CHÂU Á', 'chau-a', NULL, NULL, 0, 4, NULL, NULL, '2015-12-08 20:15:11', 1, '2015-12-08 20:15:11', 1, 0),
(19, 'da7f11c8-8832-4215-9bca-557ae3dde7c4', 'ÂU MỸ', 'au-my', NULL, NULL, 0, 4, NULL, NULL, '2015-12-08 20:15:14', 1, '2015-12-08 20:15:14', 1, 0),
(21, '886e8f9d-b489-48c0-a201-56b3e07e39ad', 'THỜI TRANG', 'thoi-trang', NULL, NULL, 0, 6, NULL, NULL, '2015-12-08 20:16:06', 1, '2015-12-08 20:16:06', 1, 0),
(22, 'c2ae0283-0971-45d6-a0b3-d1bb092e1160', 'PHONG CÁCH', 'phong-cach', NULL, NULL, 0, 6, NULL, NULL, '2015-12-08 20:16:10', 1, '2015-12-08 20:16:10', 1, 0),
(23, 'e0964bf4-0c04-4594-a262-88056faae28e', 'LÀM ĐẸP', 'lam-dep', NULL, NULL, 0, 6, '', NULL, '2015-12-08 20:16:19', 1, '2015-12-08 20:16:19', 1, 0),
(24, 'e20e0a7d-d6da-40c7-a032-0f3783b8e30d', 'NGON', 'ngon', '', NULL, 0, 10, NULL, NULL, '2015-12-08 20:16:46', 1, '2015-12-08 20:16:50', 1, 0),
(25, '5ac2ea94-cbf6-49b2-b00e-b03167910bb8', '365 NGÀY YÊU', '365-ngay-yeu', NULL, NULL, 0, 7, NULL, NULL, '2015-12-08 20:17:14', 1, '2015-12-08 20:17:14', 1, 0),
(26, 'bd63f4eb-5602-461b-898d-3f1e9c429e0e', 'BÍ KIẾP YÊU', 'bi-kip-yeu', NULL, NULL, 0, 7, NULL, NULL, '2015-12-08 20:17:22', 1, '2015-12-08 20:17:22', 1, 0),
(27, '540c145e-68d8-4dda-9151-d8347d2c89d1', '12 CHÒM SAO', 'mat-ngu-12-chom-sao', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-11 13:15:48', 1, '2015-12-11 13:15:48', 1, 11);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
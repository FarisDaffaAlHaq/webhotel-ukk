-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2025 at 07:50 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webhotel-ukk`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `kamar_id` int(11) NOT NULL,
  `jumlah_penginap` int(11) NOT NULL,
  `rencanacheckin` date NOT NULL,
  `rencanacheckout` date NOT NULL,
  `totalharga` int(11) NOT NULL,
  `lama_menginap` int(11) NOT NULL,
  `dp_dibayar` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_kamar_cancels`
--

CREATE TABLE `detail_kamar_cancels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kamar_orders_id` int(11) DEFAULT NULL,
  `detail_kamar_orders_id` int(11) DEFAULT NULL,
  `kamars_id` int(11) DEFAULT NULL,
  `tanggal_checkin` date DEFAULT NULL,
  `tanggal_checkout` date DEFAULT NULL,
  `jumlah_penginap` int(11) DEFAULT NULL,
  `totalharga` int(11) DEFAULT NULL,
  `lama_menginap` int(11) DEFAULT NULL,
  `dp_dibayar` int(11) DEFAULT NULL,
  `bookings_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `detail_kamar_cancels`
--
DELIMITER $$
CREATE TRIGGER `kembalikan status` AFTER INSERT ON `detail_kamar_cancels` FOR EACH ROW BEGIN 
        UPDATE kamars INNER JOIN detail_kamar_cancels ON kamars.id = detail_kamar_cancels.kamars_id SET kamars.status = "tersedia" 
        WHERE kamars.id = detail_kamar_cancels.kamars_id; 
        END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_kamar_orders`
--

CREATE TABLE `detail_kamar_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kamar_orders_id` int(11) DEFAULT NULL,
  `kamars_id` int(11) NOT NULL,
  `tanggal_checkin` date NOT NULL,
  `tanggal_checkout` date NOT NULL,
  `jumlah_penginap` int(11) NOT NULL,
  `totalharga` int(11) NOT NULL,
  `lama_menginap` int(11) NOT NULL,
  `dp_dibayar` int(11) DEFAULT NULL,
  `bookings_id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_kamar_orders`
--

INSERT INTO `detail_kamar_orders` (`id`, `kamar_orders_id`, `kamars_id`, `tanggal_checkin`, `tanggal_checkout`, `jumlah_penginap`, `totalharga`, `lama_menginap`, `dp_dibayar`, `bookings_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-04-08', '2022-04-13', 1, 300000, 3, 0, 7, 3, '2025-04-04 00:32:44', '2022-04-04 00:32:44'),
(2, 2, 2, '2025-04-09', '2022-04-14', 1, 600000, 3, 0, 8, 4, '2025-04-04 01:16:38', '2022-04-04 01:16:38'),
(3, 2, 4, '2025-04-10', '2022-04-15', 1, 900000, 3, 0, 9, 4, '2025-04-04 01:16:38', '2022-04-04 01:16:38'),
(4, 3, 6, '2025-04-11', '2022-04-16', 1, 2000000, 4, 0, 10, 5, '2025-04-04 01:22:49', '2022-04-04 01:22:49'),
(5, 4, 10, '2025-04-16', '2025-04-17', 5, 750000, 1, 750000, 11, 8, '2025-04-15 21:55:47', '2025-04-15 21:55:47'),
(6, 5, 11, '2025-04-17', '2025-04-18', 3, 700000, 1, 0, 12, 8, '2025-04-16 23:53:38', '2025-04-16 23:53:38'),
(7, 6, 10, '2025-04-17', '2025-04-18', 5, 1500000, 1, 0, 13, 8, '2025-04-17 00:31:46', '2025-04-17 00:31:46'),
(8, 7, 11, '2025-04-18', '2025-04-19', 3, 700000, 1, 0, 14, 16, '2025-04-17 20:26:12', '2025-04-17 20:26:12'),
(9, 8, 12, '2025-04-18', '2025-04-19', 2, 350000, 1, 0, 18, 8, '2025-04-18 00:38:18', '2025-04-18 00:38:18'),
(10, 8, 12, '2025-04-18', '2025-04-19', 2, 350000, 1, 0, 19, 8, '2025-04-18 00:38:18', '2025-04-18 00:38:18'),
(11, 9, 11, '2025-04-18', '2025-04-19', 3, 700000, 1, 0, 20, 8, '2025-04-18 01:03:02', '2025-04-18 01:03:02'),
(12, 10, 10, '2025-04-18', '2025-04-19', 5, 1500000, 1, 0, 22, 8, '2025-04-18 18:41:49', '2025-04-18 18:41:49'),
(13, 10, 10, '2025-04-18', '2025-04-19', 5, 1500000, 1, 0, 23, 8, '2025-04-18 18:41:49', '2025-04-18 18:41:49'),
(14, 10, 12, '2025-04-19', '2025-04-20', 2, 350000, 1, 0, 24, 8, '2025-04-18 18:41:49', '2025-04-18 18:41:49'),
(15, 10, 12, '2025-04-19', '2025-04-20', 2, 350000, 1, 0, 25, 8, '2025-04-18 18:41:49', '2025-04-18 18:41:49'),
(16, 10, 12, '2025-04-19', '2025-04-20', 2, 350000, 1, 0, 26, 8, '2025-04-18 18:41:49', '2025-04-18 18:41:49'),
(17, 10, 12, '2025-04-19', '2025-04-20', 2, 350000, 1, 0, 27, 8, '2025-04-18 18:41:49', '2025-04-18 18:41:49'),
(18, 10, 12, '2025-04-19', '2025-04-20', 2, 350000, 1, 0, 28, 8, '2025-04-18 18:41:49', '2025-04-18 18:41:49'),
(19, 11, 10, '2025-04-19', '2025-04-20', 5, 1500000, 1, 0, 29, 8, '2025-04-18 19:12:34', '2025-04-18 19:12:34'),
(20, 12, 11, '2025-04-19', '2025-04-20', 3, 700000, 1, 0, 30, 8, '2025-04-18 20:22:43', '2025-04-18 20:22:43'),
(21, 12, 11, '2025-04-19', '2025-04-20', 3, 700000, 1, 0, 31, 8, '2025-04-18 20:22:43', '2025-04-18 20:22:43'),
(22, 12, 11, '2025-04-19', '2025-04-20', 3, 700000, 1, 0, 32, 8, '2025-04-18 20:22:43', '2025-04-18 20:22:43'),
(23, 12, 11, '2025-04-19', '2025-04-20', 3, 700000, 1, 0, 33, 8, '2025-04-18 20:22:43', '2025-04-18 20:22:43'),
(24, 12, 11, '2025-04-19', '2025-04-20', 3, 700000, 1, 0, 34, 8, '2025-04-18 20:22:43', '2025-04-18 20:22:43'),
(25, 12, 11, '2025-04-19', '2025-04-20', 3, 700000, 1, 0, 35, 8, '2025-04-18 20:22:43', '2025-04-18 20:22:43'),
(26, 12, 11, '2025-04-19', '2025-04-20', 3, 700000, 1, 0, 36, 8, '2025-04-18 20:22:43', '2025-04-18 20:22:43'),
(27, 12, 11, '2025-04-19', '2025-04-20', 3, 700000, 1, 0, 37, 8, '2025-04-18 20:22:43', '2025-04-18 20:22:43'),
(28, 12, 11, '2025-04-19', '2025-04-20', 3, 700000, 1, 0, 38, 8, '2025-04-18 20:22:43', '2025-04-18 20:22:43'),
(29, 12, 11, '2025-04-19', '2025-04-20', 3, 700000, 1, 0, 39, 8, '2025-04-18 20:22:43', '2025-04-18 20:22:43'),
(30, 12, 11, '2025-04-19', '2025-04-20', 3, 700000, 1, 0, 40, 8, '2025-04-18 20:22:43', '2025-04-18 20:22:43'),
(31, 12, 11, '2025-04-19', '2025-04-20', 3, 700000, 1, 0, 41, 8, '2025-04-18 20:22:43', '2025-04-18 20:22:43'),
(32, 12, 11, '2025-04-19', '2025-04-20', 3, 700000, 1, 0, 42, 8, '2025-04-18 20:22:43', '2025-04-18 20:22:43'),
(33, 12, 12, '2025-04-19', '2025-04-20', 2, 350000, 1, 0, 43, 8, '2025-04-18 20:22:43', '2025-04-18 20:22:43'),
(34, 13, 10, '2025-04-22', '2025-04-23', 5, 1500000, 1, 0, 44, 8, '2025-04-18 20:24:15', '2025-04-18 20:24:15'),
(35, 14, 11, '2025-04-25', '2025-04-26', 3, 700000, 1, 0, 45, 8, '2025-04-18 20:30:26', '2025-04-18 20:30:26'),
(36, 15, 12, '2025-04-28', '2025-04-29', 2, 350000, 1, 0, 46, 8, '2025-04-18 20:42:14', '2025-04-18 20:42:14'),
(37, 16, 10, '2025-04-19', '2025-04-20', 5, 1500000, 1, 0, 47, 8, '2025-04-18 21:06:50', '2025-04-18 21:06:50'),
(38, 17, 11, '2025-04-26', '2025-04-27', 3, 700000, 1, 0, 48, 8, '2025-04-18 22:05:49', '2025-04-18 22:05:49'),
(39, 18, 12, '2025-04-29', '2025-04-30', 2, 350000, 1, 0, 49, 8, '2025-04-18 22:12:58', '2025-04-18 22:12:58'),
(40, 19, 12, '2025-04-20', '2025-04-21', 2, 350000, 1, 0, 50, 8, '2025-04-19 20:31:52', '2025-04-19 20:31:52'),
(41, 20, 11, '2025-04-20', '2025-04-21', 3, 700000, 1, 0, 51, 8, '2025-04-19 20:53:42', '2025-04-19 20:53:42'),
(42, 21, 10, '2025-04-23', '2025-04-26', 5, 4500000, 3, 0, 52, 8, '2025-04-19 21:00:49', '2025-04-19 21:00:49'),
(43, 23, 12, '2025-04-25', '2025-04-28', 2, 1050000, 3, 0, 53, 8, '2025-04-19 21:02:56', '2025-04-19 21:02:56'),
(44, 24, 11, '2025-04-29', '2025-04-30', 3, 700000, 1, 0, 54, 8, '2025-04-19 21:06:57', '2025-04-19 21:06:57'),
(45, 25, 10, '2025-04-20', '2025-04-25', 5, 7500000, 5, 0, 55, 8, '2025-04-19 21:09:58', '2025-04-19 21:09:58'),
(46, 26, 12, '2025-04-30', '2025-05-01', 2, 350000, 1, 0, 56, 8, '2025-04-19 21:18:46', '2025-04-19 21:18:46');

--
-- Triggers `detail_kamar_orders`
--
DELIMITER $$
CREATE TRIGGER `batalcancel` AFTER DELETE ON `detail_kamar_orders` FOR EACH ROW BEGIN INSERT INTO detail_kamar_cancels (detail_kamar_orders_id,kamar_orders_id, kamars_id, tanggal_checkin, tanggal_checkout, jumlah_penginap, totalharga, lama_menginap, dp_dibayar, bookings_id, user_id, created_at, updated_at)VALUES (OLD.id,OLD.kamar_orders_id, OLD.kamars_id, OLD.tanggal_checkin,OLD.tanggal_checkout,OLD.jumlah_penginap,OLD.totalharga,OLD.lama_menginap,OLD.dp_dibayar,OLD.bookings_id,OLD.user_id,OLD.created_at,OLD.updated_at); 
        END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hapusbooking` AFTER INSERT ON `detail_kamar_orders` FOR EACH ROW BEGIN 
        UPDATE kamars
        INNER JOIN bookings ON kamars.id = bookings.kamar_id SET kamars.status = "tidak_tersedia"
        WHERE kamars.id = bookings.kamar_id;
        DELETE FROM bookings 
        WHERE bookings.user_id = user_id; 
        END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namafasilitas` varchar(255) NOT NULL,
  `keterangan` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fasilitas`
--

INSERT INTO `fasilitas` (`id`, `namafasilitas`, `keterangan`, `created_at`, `updated_at`) VALUES
(8, 'Air Hangat', 'untuk seduh minuman', '2025-04-16 09:02:16', '2025-04-16 09:02:16'),
(9, 'TV', 'untuk menonton', '2025-04-16 09:04:48', '2025-04-16 09:04:48'),
(10, 'Sandal Kamar', 'sendal untuk di kamar', '2025-04-16 09:31:10', '2025-04-16 09:31:10'),
(11, 'Air Dingin', 'bikin tenggorokan seger', '2025-04-16 09:39:25', '2025-04-16 09:39:25'),
(12, 'Air Conditioner', 'untuk mendinginkan ruangan', '2025-04-16 09:12:16', '2025-04-16 09:12:16');

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas_kamar`
--

CREATE TABLE `fasilitas_kamar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kamar_id` int(11) NOT NULL,
  `fasilitas_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fasilitas_kamar`
--

INSERT INTO `fasilitas_kamar` (`id`, `kamar_id`, `fasilitas_id`, `created_at`, `updated_at`) VALUES
(5, 12, 10, '2025-04-16 09:05:10', '2025-04-16 09:05:10'),
(6, 13, 8, '2025-04-16 09:09:36', '2025-04-16 09:09:36'),
(7, 13, 9, '2025-04-16 09:09:36', '2025-04-16 09:09:36'),
(8, 12, 8, '2025-04-16 09:09:06', '2025-04-16 09:09:06'),
(9, 12, 9, '2025-04-16 09:09:06', '2025-04-16 09:09:06'),
(16, 13, 11, '2025-04-16 09:12:35', '2025-04-16 09:12:35'),
(17, 13, 12, '2025-04-16 09:12:35', '2025-04-16 09:12:35'),
(19, 14, 8, '2025-04-16 09:25:17', '2025-04-16 09:25:17'),
(20, 14, 9, '2025-04-16 09:25:17', '2025-04-16 09:25:17'),
(21, 14, 11, '2025-04-16 09:25:17', '2025-04-16 09:25:17'),
(22, 14, 12, '2025-04-16 09:25:17', '2025-04-16 09:25:17'),
(50, 10, 8, '2025-04-15 21:51:15', '2025-04-15 21:51:15'),
(51, 10, 9, '2025-04-15 21:51:15', '2025-04-15 21:51:15'),
(52, 10, 10, '2025-04-15 21:51:15', '2025-04-15 21:51:15'),
(53, 10, 11, '2025-04-15 21:51:15', '2025-04-15 21:51:15'),
(54, 10, 12, '2025-04-15 21:51:15', '2025-04-15 21:51:15'),
(55, 11, 8, '2025-04-15 21:51:41', '2025-04-15 21:51:41'),
(56, 11, 9, '2025-04-15 21:51:41', '2025-04-15 21:51:41'),
(57, 11, 10, '2025-04-15 21:51:41', '2025-04-15 21:51:41'),
(58, 11, 11, '2025-04-15 21:51:41', '2025-04-15 21:51:41'),
(59, 12, 8, '2025-04-16 23:57:26', '2025-04-16 23:57:26'),
(60, 12, 10, '2025-04-16 23:57:26', '2025-04-16 23:57:26'),
(61, 12, 11, '2025-04-16 23:57:26', '2025-04-16 23:57:26');

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas_umums`
--

CREATE TABLE `fasilitas_umums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_fasilitas` varchar(255) NOT NULL,
  `deskripsi` longtext NOT NULL,
  `status` enum('tersedia','tidak_tersedia') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fasilitas_umums`
--

INSERT INTO `fasilitas_umums` (`id`, `nama_fasilitas`, `deskripsi`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Gym', 'untuk berolahraga agar badan sehat', 'tersedia', '2025-04-16 09:48:51', '2025-04-16 09:48:51'),
(2, 'Kolam Renang', 'untuk berenang bersama keluarga', 'tersedia', '2025-04-16 09:49:19', '2025-04-16 09:42:15'),
(3, 'Wifi Gratis', 'untuk membrowsing secara online', 'tersedia', '2025-04-16 09:49:42', '2025-04-16 18:30:02'),
(5, 'Room Service', 'Menyediakan makanan dan minuman ke kamar.', 'tersedia', '2025-04-16 18:30:39', '2025-04-16 23:13:04'),
(6, 'Restoran dan Bar', 'Menawarkan berbagai pilihan makanan dan minuman', 'tersedia', '2025-04-16 23:11:31', '2025-04-16 23:11:31'),
(7, 'Spa', 'Menawarkan berbagai perawatan kecantikan dan relaksasi.', 'tersedia', '2025-04-16 23:12:05', '2025-04-16 23:12:05');

-- --------------------------------------------------------

--
-- Table structure for table `kamars`
--

CREATE TABLE `kamars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nokamar` int(11) NOT NULL,
  `tipe_kamars_id` int(11) NOT NULL,
  `jumlahorangperkamar` int(11) NOT NULL,
  `status` enum('tersedia','tidak_tersedia') NOT NULL,
  `hargakamarpermalam` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kamars`
--

INSERT INTO `kamars` (`id`, `nokamar`, `tipe_kamars_id`, `jumlahorangperkamar`, `status`, `hargakamarpermalam`, `image`, `created_at`, `updated_at`) VALUES
(10, 13242, 29, 5, 'tersedia', 1500000, '1745027123.jpeg', '2025-04-15 21:51:15', '2025-04-19 21:16:38'),
(11, 6709, 28, 3, 'tersedia', 700000, '1745027135.jpeg', '2025-04-15 21:51:41', '2025-04-19 21:16:42'),
(12, 2584, 30, 2, 'tidak_tersedia', 350000, '1745027147.jpeg', '2025-04-16 23:57:26', '2025-04-19 21:16:45');

-- --------------------------------------------------------

--
-- Table structure for table `kamar_orders`
--

CREATE TABLE `kamar_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_kode` int(11) NOT NULL,
  `jumlahdibayar` int(11) DEFAULT NULL,
  `totalharga` int(11) DEFAULT NULL,
  `kembalian` int(11) DEFAULT NULL,
  `metodepembayaran` enum('cash','transfer') DEFAULT NULL,
  `statuspembayaran` enum('lunas','belumlunas') DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `resepsionis_id` int(11) DEFAULT NULL,
  `status` enum('confirmed','uncorfirmed','done') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kamar_orders`
--

INSERT INTO `kamar_orders` (`id`, `booking_kode`, `jumlahdibayar`, `totalharga`, `kembalian`, `metodepembayaran`, `statuspembayaran`, `user_id`, `resepsionis_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 19750, 500000, 300000, 200000, 'cash', 'lunas', 3, 2, 'done', '2025-04-16 09:10:44', '2025-04-16 09:13:47'),
(2, 12325, 2000000, 1500000, 500000, 'transfer', 'lunas', 4, 2, 'done', '2025-04-16 09:16:38', '2025-04-16 09:17:43'),
(3, 10220, 2500000, 2000000, 500000, 'cash', 'lunas', 5, 2, 'done', '2025-04-16 09:22:49', '2025-04-16 09:24:02'),
(4, 19608, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-15 21:55:47', '2025-04-15 21:55:47'),
(5, 8805, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-16 23:53:38', '2025-04-16 23:53:38'),
(6, 16924, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-17 00:31:46', '2025-04-17 00:31:46'),
(7, 7903, NULL, NULL, NULL, NULL, 'belumlunas', 16, NULL, 'uncorfirmed', '2025-04-17 20:26:12', '2025-04-17 20:26:12'),
(8, 15304, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-18 00:38:18', '2025-04-18 00:38:18'),
(9, 14684, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-18 01:03:02', '2025-04-18 01:03:02'),
(10, 9574, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-18 18:41:49', '2025-04-18 18:41:49'),
(11, 2063, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-18 19:12:34', '2025-04-18 19:12:34'),
(12, 14402, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-18 20:22:43', '2025-04-18 20:22:43'),
(13, 19698, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-18 20:24:15', '2025-04-18 20:24:15'),
(14, 3126, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-18 20:30:26', '2025-04-18 20:30:26'),
(15, 11001, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-18 20:42:14', '2025-04-18 20:42:14'),
(16, 14914, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-18 21:06:50', '2025-04-18 21:06:50'),
(17, 17140, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-18 22:05:49', '2025-04-18 22:05:49'),
(18, 2436, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-18 22:12:58', '2025-04-18 22:12:58'),
(19, 11710, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-19 20:31:52', '2025-04-19 20:31:52'),
(20, 15324, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-19 20:53:42', '2025-04-19 20:53:42'),
(21, 11509, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-19 21:00:49', '2025-04-19 21:00:49'),
(23, 2239, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-19 21:02:56', '2025-04-19 21:02:56'),
(24, 6302, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-19 21:06:57', '2025-04-19 21:06:57'),
(25, 16598, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-19 21:09:58', '2025-04-19 21:09:58'),
(26, 13390, NULL, NULL, NULL, NULL, 'belumlunas', 8, NULL, 'uncorfirmed', '2025-04-19 21:18:46', '2025-04-19 21:18:46');

-- --------------------------------------------------------

--
-- Table structure for table `log_activities`
--

CREATE TABLE `log_activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `msglogs` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `useragent` varchar(255) NOT NULL,
  `currurl` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_activities`
--

INSERT INTO `log_activities` (`id`, `msglogs`, `user_id`, `action`, `status`, `useragent`, `currurl`, `method`, `connection`, `date`, `created_at`, `updated_at`) VALUES
(1, 'halaman welcome', 3, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 05:41:43', '2022-04-03 22:41:43', '2022-04-03 22:41:43'),
(2, 'halaman welcome', 3, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 05:42:04', '2022-04-03 22:42:04', '2022-04-03 22:42:04'),
(3, 'halaman welcome', 3, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 05:42:28', '2022-04-03 22:42:28', '2022-04-03 22:42:28'),
(4, 'halaman welcome', 3, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 05:44:55', '2022-04-03 22:44:55', '2022-04-03 22:44:55'),
(5, 'halaman welcome', 3, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 07:08:42', '2022-04-04 00:08:43', '2022-04-04 00:08:43'),
(6, 'halaman welcome', NULL, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 07:20:58', '2022-04-04 00:20:58', '2022-04-04 00:20:58'),
(7, 'halaman welcome', 2, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 07:21:24', '2022-04-04 00:21:24', '2022-04-04 00:21:24'),
(8, 'halaman welcome', NULL, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 07:27:01', '2022-04-04 00:27:01', '2022-04-04 00:27:01'),
(9, 'halaman welcome', 3, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 07:31:55', '2022-04-04 00:31:55', '2022-04-04 00:31:55'),
(10, 'halaman welcome', 3, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 07:32:19', '2022-04-04 00:32:19', '2022-04-04 00:32:19'),
(11, 'halaman welcome', 3, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 07:32:47', '2022-04-04 00:32:47', '2022-04-04 00:32:47'),
(12, 'halaman welcome', NULL, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 07:32:55', '2022-04-04 00:32:55', '2022-04-04 00:32:55'),
(13, 'halaman welcome', NULL, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 07:35:29', '2022-04-04 00:35:29', '2022-04-04 00:35:29'),
(14, 'halaman welcome', NULL, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 07:37:32', '2022-04-04 00:37:32', '2022-04-04 00:37:32'),
(15, 'halaman welcome', 3, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 07:37:57', '2022-04-04 00:37:57', '2022-04-04 00:37:57'),
(16, 'halaman welcome', 3, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 07:38:18', '2022-04-04 00:38:18', '2022-04-04 00:38:18'),
(17, 'halaman welcome', NULL, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 07:40:39', '2022-04-04 00:40:39', '2022-04-04 00:40:39'),
(18, 'halaman welcome', 2, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 07:41:00', '2022-04-04 00:41:00', '2022-04-04 00:41:00'),
(19, 'halaman welcome', 2, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 07:58:27', '2022-04-04 00:58:27', '2022-04-04 00:58:27'),
(20, 'halaman welcome', NULL, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 08:14:20', '2022-04-04 01:14:20', '2022-04-04 01:14:20'),
(21, 'halaman welcome', NULL, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 08:15:31', '2022-04-04 01:15:31', '2022-04-04 01:15:31'),
(22, 'halaman welcome', 4, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 08:15:43', '2022-04-04 01:15:43', '2022-04-04 01:15:43'),
(23, 'halaman welcome', 4, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 08:15:51', '2022-04-04 01:15:51', '2022-04-04 01:15:51'),
(24, 'halaman welcome', 4, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 08:16:14', '2022-04-04 01:16:14', '2022-04-04 01:16:14'),
(25, 'halaman welcome', NULL, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 08:16:54', '2022-04-04 01:16:54', '2022-04-04 01:16:54'),
(26, 'halaman welcome', 2, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 08:17:19', '2022-04-04 01:17:19', '2022-04-04 01:17:19'),
(27, 'halaman welcome', NULL, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 08:20:41', '2022-04-04 01:20:41', '2022-04-04 01:20:41'),
(28, 'halaman welcome', NULL, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 08:21:12', '2022-04-04 01:21:12', '2022-04-04 01:21:12'),
(29, 'halaman welcome', 5, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 08:21:48', '2022-04-04 01:21:48', '2022-04-04 01:21:48'),
(30, 'halaman welcome', 5, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 08:22:25', '2022-04-04 01:22:25', '2022-04-04 01:22:25'),
(31, 'halaman welcome', NULL, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 08:23:02', '2022-04-04 01:23:02', '2022-04-04 01:23:02'),
(32, 'halaman welcome', 2, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 08:23:23', '2022-04-04 01:23:23', '2022-04-04 01:23:23'),
(33, 'halaman welcome', NULL, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 08:25:52', '2022-04-04 01:25:52', '2022-04-04 01:25:52'),
(34, 'halaman welcome', 1, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 08:26:35', '2022-04-04 01:26:35', '2022-04-04 01:26:35'),
(35, 'halaman welcome', NULL, '/', 'success', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.60 Safari/537.36', 'http://127.0.0.1:8000', 'GET', 'keep-alive', '04-April-2022 08:31:42', '2022-04-04 01:31:42', '2022-04-04 01:31:42');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2025_04_14_064646_create_fasilitas_kamars_table', 1),
(7, '2025_04_14_064700_create_fasilitas_umums_table', 1),
(8, '2025_04_14_064912_create_tipe_kamars_table', 1),
(11, '2025_04_14_064621_create_fasilitas_table', 1),
(12, '2025_04_14_064857_create_sarans_table', 1),
(13, '2025_04_14_064845_create_log_activities_table', 2),
(14, '2025_04_14_064744_create_kamars_table', 3),
(30, '2025_04_14_064812_create_kamar_orders_table', 5),
(31, '2025_04_14_064505_create_bookings_table', 6),
(34, '2025_04_14_064559_create_detail_kamar_orders_table', 7),
(37, '2025_04_14_064620_create_trigger_deletebookings', 8),
(38, '2025_04_14_064913_create_detail_kamar_cancels_table', 9),
(39, '2025_04_14_064919_create_trigger_batalcancel', 9),
(40, '2025_04_14_064925_create_trigger_kembalikanstatus', 9);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sarans`
--

CREATE TABLE `sarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `saran` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sarans`
--

INSERT INTO `sarans` (`id`, `name`, `email`, `saran`, `created_at`, `updated_at`) VALUES
(2, 'Uus', 'uus@gmail.com', 'hotelnya bagus', '2025-04-16 09:28:51', '2025-04-16 09:28:51'),
(3, 'Achmad Fadli', 'achmadfadli@gmail.com', 'keren hotelnya', '2025-04-16 09:29:46', '2025-04-16 09:29:46'),
(5, 'Dzaki', 'dzaki@gmail.com', 'testing', '2025-04-16 09:43:30', '2025-04-16 09:43:30'),
(6, 'daffa', 'daffa@gmail.com', 'pelayan harus lebih cepat', '2025-04-16 18:38:23', '2025-04-16 18:38:23');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_kamars`
--

CREATE TABLE `tipe_kamars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipe_kamar` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tipe_kamars`
--

INSERT INTO `tipe_kamars` (`id`, `tipe_kamar`, `created_at`, `updated_at`) VALUES
(21, 'triple room', '2025-04-16 09:18:40', '2025-04-16 09:18:45'),
(23, 'Double room', '2025-04-16 09:24:39', '2025-04-16 09:24:39'),
(24, 'Single room', '2025-04-16 09:36:25', '2025-04-16 09:36:35'),
(26, 'Multiple Room', '2025-04-16 09:44:43', '2025-04-16 09:44:43'),
(27, 'Family Room', '2025-04-16 09:46:58', '2025-04-16 09:46:58'),
(28, 'Superior', '2025-04-16 09:50:49', '2025-04-15 21:49:27'),
(29, 'Deluxe', '2025-04-16 09:55:05', '2025-04-15 21:49:15'),
(30, 'Middle', '2025-04-16 23:56:12', '2025-04-16 23:56:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','resepsionis','tamu') NOT NULL DEFAULT 'tamu',
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `role`, `password`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, 'admin', '$2y$10$UnEeFxH18EZ8Zw9jlL8lWuWRtzcoUsJx0JM3e7H1Qojc.fUM2g2uK', NULL, NULL, '2025-04-16 23:57:02', '2025-04-16 23:57:02'),
(2, 'Resepsionis', 'resepsionis@gmail.com', NULL, 'resepsionis', '$2y$10$UnEeFxH18EZ8Zw9jlL8lWuWRtzcoUsJx0JM3e7H1Qojc.fUM2g2uK', NULL, NULL, '2025-04-16 01:16:16', '2025-04-16 01:16:16'),
(3, 'fadli', 'fadli@gmail.com', NULL, 'tamu', '$2y$10$UnEeFxH18EZ8Zw9jlL8lWuWRtzcoUsJx0JM3e7H1Qojc.fUM2g2uK', NULL, NULL, '2025-04-16 01:17:26', '2025-04-16 01:17:26'),
(4, 'Diki Setiawan', 'diki@gmail.com', NULL, 'tamu', '$2y$10$UnEeFxH18EZ8Zw9jlL8lWuWRtzcoUsJx0JM3e7H1Qojc.fUM2g2uK', NULL, NULL, '2025-04-16 01:13:31', '2025-04-16 01:13:31'),
(5, 'Kemal', 'kemalrasyidin@gmail.com', NULL, 'tamu', '$2y$10$UnEeFxH18EZ8Zw9jlL8lWuWRtzcoUsJx0JM3e7H1Qojc.fUM2g2uK', NULL, NULL, '2025-04-16 23:09:04', '2025-04-16 23:09:04'),
(6, 'muhamad arya hidayat', 'arya@arya.com', NULL, 'tamu', '$2y$10$UnEeFxH18EZ8Zw9jlL8lWuWRtzcoUsJx0JM3e7H1Qojc.fUM2g2uK', NULL, NULL, '2025-04-16 23:58:14', '2025-04-16 23:58:14'),
(7, 'test', 'test@test.com', NULL, 'tamu', '$2y$10$UnEeFxH18EZ8Zw9jlL8lWuWRtzcoUsJx0JM3e7H1Qojc.fUM2g2uK', NULL, NULL, '2025-04-16 02:38:12', '2025-04-16 02:38:12'),
(8, 'daffa', 'daffa@gmail.com', NULL, 'tamu', '$2y$10$SullPPfzHqZddrvAD.Mg0ubZaYWIeF/DxV5qWodJmqy6qbg9qsA0q', NULL, NULL, '2025-04-15 21:40:38', '2025-04-15 21:40:38'),
(9, 'amri', 'amri@gmail.com', NULL, 'tamu', '$2y$10$WkZnS5sTUD05mLH6X4/Qt.yktLQ2TZpV60e4CBZMQTcMB2zfQt/vC', NULL, NULL, '2025-04-17 19:27:21', '2025-04-17 19:27:21'),
(10, 'raka', 'raka@gmail.com', NULL, 'tamu', '$2y$10$.BG0c8LJ50SPmgIsZci6N.xmNlrZxEBPdzLbI8Cr0mwmnhUoMlrrG', NULL, NULL, '2025-04-17 19:38:26', '2025-04-17 19:38:26'),
(11, 'nabil', 'nabil@gmail.com', NULL, 'tamu', '$2y$10$m1PdOd5Fo2bKA4lnUK6GxOHK4bbQ.Pxs5tha9TmgUFlbJkU5l6ucy', NULL, NULL, '2025-04-17 19:42:20', '2025-04-17 19:42:20'),
(12, 'nopal', 'nopal@gmail.com', NULL, 'tamu', '$2y$10$0Q8F.Rwb3CYnsZn0/WVlpeZqCP.yovGfc4dMlVo3.pkTWdPd5Pe2G', NULL, NULL, '2025-04-17 19:48:55', '2025-04-17 19:48:55'),
(13, 'makmal', 'makmal@gmail.com', NULL, 'tamu', '$2y$10$RLmF46FiIqqHPaRNSDppXeU2/frrTtdAwASwJtNryMzOw6ZFH0ZcG', NULL, NULL, '2025-04-17 19:53:43', '2025-04-17 19:53:43'),
(14, 'wibu', 'wibu@gmail.com', NULL, 'tamu', '$2y$10$bKniKwWG.w8N72pO/cHeUubW1CkvkXZrNImPkEu3rgxEerpMSVCBG', NULL, NULL, '2025-04-17 19:55:26', '2025-04-17 19:55:26'),
(15, 'diksa', 'diksa@gmail.com', NULL, 'tamu', '$2y$10$tKDpf6O9Csg9cywpZuHddeAnhyqAdM//gwLmJE5tYVc5zsPssnQHG', NULL, NULL, '2025-04-17 19:57:19', '2025-04-17 19:57:19'),
(16, 'simon', 'simon@gmail.com', NULL, 'tamu', '$2y$10$z8ksClCguLHQ.eL9MTFIMuTuuFAlOGrgsW5w8oWJVWsKmdncezqFm', NULL, NULL, '2025-04-17 20:05:39', '2025-04-17 20:05:39'),
(17, 'kafiemeofaeo', 'mfoemoeme@gmail.com', NULL, 'tamu', '$2y$10$XETsRn5bCeoZyeKmS/jYhOC8PvnDzobSHrd0BPEfnqtFtOCXaWPKG', NULL, NULL, '2025-04-17 21:12:41', '2025-04-17 21:12:41'),
(18, 'mkodovdsv', 'akmfiawfaw@gmail.com', NULL, 'tamu', '$2y$10$IVI5dJQfVufk7JZ41bFly.nFhcShCv2nKXLjONGZU4/DCQheFfM3K', NULL, NULL, '2025-04-17 21:13:56', '2025-04-17 21:13:56'),
(19, 'fkmaeimc', 'alfoemo@cme.com', NULL, 'tamu', '$2y$10$EDm0VdSkp9pOPp5J31MpQes95aY1W5.ed5WxNrhgDkjNdOL1NAE2.', NULL, NULL, '2025-04-17 21:15:50', '2025-04-17 21:15:50'),
(20, 'afkvkek', 'vmevde@fdac.com', NULL, 'tamu', '$2y$10$JUv.eln16NSocfMYdMDwmeS7j.5AVKJUM8lbI6z8jvtQXQJ29tpWq', NULL, NULL, '2025-04-17 21:16:43', '2025-04-17 21:16:43'),
(21, 'nejvkvem', 'akcmaei@gmail.com', NULL, 'tamu', '$2y$10$lJ2fo1CVmSMygq7WGJ3W5ehSTO9Fud/OiY3QMlrgdNLUu0aTbvHsG', NULL, NULL, '2025-04-17 21:18:03', '2025-04-17 21:18:03'),
(22, 'iajiaemi', 'aiciema@gmail.com', NULL, 'tamu', '$2y$10$rgyDs.IBn2w/33zEXJroz.wDdeW7lWByDe1u25htWHJwPejKz8/xC', NULL, NULL, '2025-04-17 21:23:28', '2025-04-17 21:23:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_kamar_cancels`
--
ALTER TABLE `detail_kamar_cancels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_kamar_orders`
--
ALTER TABLE `detail_kamar_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fasilitas_kamar`
--
ALTER TABLE `fasilitas_kamar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fasilitas_umums`
--
ALTER TABLE `fasilitas_umums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kamars`
--
ALTER TABLE `kamars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kamars_nokamar_unique` (`nokamar`);

--
-- Indexes for table `kamar_orders`
--
ALTER TABLE `kamar_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kamar_orders_booking_kode_unique` (`booking_kode`);

--
-- Indexes for table `log_activities`
--
ALTER TABLE `log_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sarans`
--
ALTER TABLE `sarans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipe_kamars`
--
ALTER TABLE `tipe_kamars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `detail_kamar_cancels`
--
ALTER TABLE `detail_kamar_cancels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_kamar_orders`
--
ALTER TABLE `detail_kamar_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fasilitas_kamar`
--
ALTER TABLE `fasilitas_kamar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `fasilitas_umums`
--
ALTER TABLE `fasilitas_umums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kamars`
--
ALTER TABLE `kamars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kamar_orders`
--
ALTER TABLE `kamar_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `log_activities`
--
ALTER TABLE `log_activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sarans`
--
ALTER TABLE `sarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tipe_kamars`
--
ALTER TABLE `tipe_kamars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

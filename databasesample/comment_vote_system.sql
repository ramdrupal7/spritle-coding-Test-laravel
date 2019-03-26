-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.23 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for comment_vote_system
DROP DATABASE IF EXISTS `comment_vote_system`;
CREATE DATABASE IF NOT EXISTS `comment_vote_system` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `comment_vote_system`;

-- Dumping structure for table comment_vote_system.comments
DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table comment_vote_system.comments: 2 rows
DELETE FROM `comments`;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`, `name`, `comment`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'Marvin Hayes', 'Share your view', 1, '2019-03-26 16:51:21', '2019-03-26 16:51:21'),
	(2, 'Marvin Hayes', 'Suma', 1, '2019-03-26 18:28:45', '2019-03-26 18:28:45');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- Dumping structure for table comment_vote_system.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table comment_vote_system.migrations: 6 rows
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(17, '2014_10_12_000000_create_users_table', 1),
	(18, '2014_10_12_100000_create_password_resets_table', 1),
	(19, '2018_07_03_101548_create_comments_table', 1),
	(20, '2018_07_03_101735_create_replies_table', 1),
	(21, '2018_07_04_073739_add_coloum_user_id_in_replies_table', 1),
	(22, '2019_03_26_163505_create_vote_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table comment_vote_system.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table comment_vote_system.password_resets: 0 rows
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table comment_vote_system.replies
DROP TABLE IF EXISTS `replies`;
CREATE TABLE IF NOT EXISTS `replies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table comment_vote_system.replies: 4 rows
DELETE FROM `replies`;
/*!40000 ALTER TABLE `replies` DISABLE KEYS */;
INSERT INTO `replies` (`id`, `comment_id`, `name`, `reply`, `created_at`, `updated_at`, `user_id`) VALUES
	(1, 2, 'Marvin Hayes', 'Ramkumar', '2019-03-26 18:28:59', '2019-03-26 18:28:59', 1);
/*!40000 ALTER TABLE `replies` ENABLE KEYS */;

-- Dumping structure for table comment_vote_system.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table comment_vote_system.users: 11 rows
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Marvin Hayes', 'hailie.zieme@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'GCdTjKtAn5', '2019-03-26 16:50:34', '2019-03-26 16:50:34'),
	(2, 'Crystel Douglas DDS', 'brionna07@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '57Vxwj24XF', '2019-03-26 16:50:34', '2019-03-26 16:50:34'),
	(3, 'Damaris Ryan I', 'kameron37@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'DPdtZ0JraK', '2019-03-26 16:50:34', '2019-03-26 16:50:34'),
	(4, 'Sam Hayes III', 'johnpaul.emard@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '3fWMFrrYXG', '2019-03-26 16:50:34', '2019-03-26 16:50:34'),
	(5, 'Prof. Carlie O\'Reilly', 'dickinson.alexandro@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '8ZMm9dsjSe', '2019-03-26 16:50:34', '2019-03-26 16:50:34'),
	(6, 'Kendrick Hermiston', 'lheidenreich@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '29DoDIQngH', '2019-03-26 16:50:34', '2019-03-26 16:50:34'),
	(7, 'Norris Harris', 'padberg.cortez@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'CNmg9nj5TJ', '2019-03-26 16:50:34', '2019-03-26 16:50:34'),
	(8, 'Dudley Paucek', 'sarai28@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'WoXI4SuaqD', '2019-03-26 16:50:34', '2019-03-26 16:50:34'),
	(9, 'Zakary Swift', 'abbigail.vandervort@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'HjyWNEZCjH', '2019-03-26 16:50:34', '2019-03-26 16:50:34'),
	(10, 'Dr. Columbus Konopelski', 'mturner@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '8zhTIXVAJH', '2019-03-26 16:50:34', '2019-03-26 16:50:34');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table comment_vote_system.vote
DROP TABLE IF EXISTS `vote`;
CREATE TABLE IF NOT EXISTS `vote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table comment_vote_system.vote: 0 rows
DELETE FROM `vote`;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` (`id`, `comment_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(15, 2, 1, '2019-03-26 19:16:54', '2019-03-26 19:16:54'),
	(14, 1, 2, '2019-03-26 19:14:14', '2019-03-26 19:14:14');
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

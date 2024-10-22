-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for steamsimdb
CREATE DATABASE IF NOT EXISTS `steamsimdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `steamsimdb`;

-- Dumping structure for table steamsimdb.forums
CREATE TABLE IF NOT EXISTS `forums` (
  `id` int NOT NULL AUTO_INCREMENT,
  `game_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `forums_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table steamsimdb.forums: ~5 rows (approximately)
DELETE FROM `forums`;
INSERT INTO `forums` (`id`, `game_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Cyberpunk Strategies', 'Discuss strategies for playing Cyberpunk 2077.', '2024-10-21 14:48:44', '2024-10-21 14:48:44'),
	(2, 2, 'Witcher Lore', 'A place to discuss the lore of The Witcher series.', '2024-10-21 14:48:44', '2024-10-21 14:48:44'),
	(3, 3, 'Farming Tips', 'Share tips and tricks for farming in Stardew Valley.', '2024-10-21 14:48:44', '2024-10-21 14:48:44'),
	(4, 1, 'Este me recuerda a Guayaquil', 'Harta bala', '2024-10-21 20:15:32', '2024-10-21 20:15:32'),
	(5, 2, 'Se me parece a Ingapirca', 'saludos', '2024-10-21 20:16:10', '2024-10-21 20:16:10');

-- Dumping structure for table steamsimdb.games
CREATE TABLE IF NOT EXISTS `games` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table steamsimdb.games: ~8 rows (approximately)
DELETE FROM `games`;
INSERT INTO `games` (`id`, `title`, `description`, `price`, `discount`, `created_at`, `updated_at`) VALUES
	(1, 'Cyberpunk 2077', 'An open-world RPG set in a dystopian future.', 59.99, 10.00, '2024-10-21 14:48:44', '2024-10-21 14:48:44'),
	(2, 'The Witcher 3: Wild Hunt', 'An action RPG with a captivating story.', 49.99, 5.00, '2024-10-21 14:48:44', '2024-10-21 14:48:44'),
	(3, 'Stardew Valley', 'A farming simulation game that allows you to grow your own farm.', 14.99, NULL, '2024-10-21 14:48:44', '2024-10-21 14:48:44'),
	(4, 'Hades', 'A rogue-like dungeon crawler that combines fast-paced combat with a captivating story.', 24.99, 5.00, '2024-10-21 15:18:28', '2024-10-21 15:18:28'),
	(5, 'Ghost of Tsushima', 'An action-adventure game set in feudal Japan.', 59.99, 15.00, '2024-10-21 15:18:28', '2024-10-21 15:18:28'),
	(6, 'Celeste', 'A platformer about climbing a mountain and overcoming personal challenges.', 19.99, NULL, '2024-10-21 15:18:28', '2024-10-21 15:18:28'),
	(7, 'DOOM Eternal', 'A first-person shooter with intense action and demonic enemies.', 59.99, 10.00, '2024-10-21 15:18:28', '2024-10-21 15:18:28'),
	(8, 'Among Us', 'A multiplayer game of teamwork and betrayal set in space.', 5.00, NULL, '2024-10-21 15:18:28', '2024-10-21 15:18:28');

-- Dumping structure for table steamsimdb.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table steamsimdb.migrations: ~0 rows (approximately)
DELETE FROM `migrations`;

-- Dumping structure for table steamsimdb.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `forum_id` int NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `forum_id` (`forum_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table steamsimdb.posts: ~3 rows (approximately)
DELETE FROM `posts`;
INSERT INTO `posts` (`id`, `user_id`, `forum_id`, `content`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'I recommend focusing on the main story for the best experience!', '2024-10-21 14:48:44', '2024-10-21 14:48:44'),
	(2, 2, 2, 'Did you notice the references to the books in the game?', '2024-10-21 14:48:44', '2024-10-21 14:48:44'),
	(3, 3, 3, 'Always plant crops in the spring for the best yield.', '2024-10-21 14:48:44', '2024-10-21 14:48:44');

-- Dumping structure for table steamsimdb.purchases
CREATE TABLE IF NOT EXISTS `purchases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `game_id` int NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table steamsimdb.purchases: ~8 rows (approximately)
DELETE FROM `purchases`;
INSERT INTO `purchases` (`id`, `user_id`, `game_id`, `price`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 53.99, '2024-10-21 14:48:44', '2024-10-21 14:48:44'),
	(2, 2, 2, 47.99, '2024-10-21 14:48:44', '2024-10-21 14:48:44'),
	(3, 3, 3, 14.99, '2024-10-21 14:48:44', '2024-10-21 14:48:44'),
	(6, 4, 1, 59.99, '2024-10-21 21:35:01', '2024-10-21 21:35:01'),
	(7, 4, 4, 24.99, '2024-10-21 21:35:04', '2024-10-21 21:35:04'),
	(8, 4, 8, 5.00, '2024-10-21 21:37:38', '2024-10-21 21:37:38'),
	(9, 5, 7, 59.99, '2024-10-21 21:41:06', '2024-10-21 21:41:06'),
	(10, 5, 8, 5.00, '2024-10-21 21:42:44', '2024-10-21 21:42:44');

-- Dumping structure for table steamsimdb.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `game_id` int NOT NULL,
  `content` text NOT NULL,
  `rating` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table steamsimdb.reviews: ~7 rows (approximately)
DELETE FROM `reviews`;
INSERT INTO `reviews` (`id`, `user_id`, `game_id`, `content`, `rating`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'An amazing experience with stunning visuals!', 5, '2024-10-21 14:48:44', '2024-10-21 14:48:44'),
	(2, 2, 2, 'A must-play for RPG fans, incredible depth.', 4, '2024-10-21 14:48:44', '2024-10-21 14:48:44'),
	(3, 3, 3, 'So relaxing and enjoyable!', 5, '2024-10-21 14:48:44', '2024-10-21 14:48:44'),
	(4, 4, 1, 'No me gusto. Mucho bug', 2, '2024-10-21 20:48:11', '2024-10-21 20:48:11'),
	(5, 4, 5, 'Instant fast travel and instant reload', 5, '2024-10-21 21:38:49', '2024-10-21 21:38:49'),
	(6, 5, 7, 'Se parece a Half Life', 4, '2024-10-21 21:41:29', '2024-10-21 21:41:29'),
	(7, 5, 8, 'Game of the Decade', 5, '2024-10-21 21:42:33', '2024-10-21 21:42:33');

-- Dumping structure for table steamsimdb.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table steamsimdb.users: ~5 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`) VALUES
	(1, 'Alice Johnson', 'alice@example.com', 'password123', NULL, NULL, '2024-10-21 14:48:44', '2024-10-21 14:48:44'),
	(2, 'Bob Smith', 'bob@example.com', 'password456', NULL, NULL, '2024-10-21 14:48:44', '2024-10-21 14:48:44'),
	(3, 'Charlie Brown', 'charlie@example.com', 'password789', NULL, NULL, '2024-10-21 14:48:44', '2024-10-21 14:48:44'),
	(4, 'AliasFito', 'fito@gmail.com', '$2y$12$D9UuIqE.SOEOqOHYTQ8n5O1bhkZyHI1Wep2a3K7ajd2oA7kEi3Sjq', NULL, NULL, '2024-10-21 20:06:54', '2024-10-21 20:06:54'),
	(5, 'EmilioAldean', 'emilioaldean@gmail.com', '$2y$12$.9zvka6s4gb1w0.32ew3cutO0fT5FGCJU66BxUGmeQbahWjM2rh.G', NULL, NULL, '2024-10-21 21:40:51', '2024-10-21 21:40:51');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

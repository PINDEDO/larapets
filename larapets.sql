-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-05-2026 a las 01:44:10
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `larapets`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adoptions`
--

CREATE TABLE `adoptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `pet_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `adoptions`
--

INSERT INTO `adoptions` (`id`, `user_id`, `pet_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2026-02-19 05:34:18', '2026-02-19 05:34:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('larapets-cache-admin@sena.demo|127.0.0.1', 'i:1;', 1778025246),
('larapets-cache-admin@sena.demo|127.0.0.1:timer', 'i:1778025246;', 1778025246);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
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
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_02_12_011931_create_pets_table', 1),
(5, '2026_02_12_011953_create_adoptions_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pets`
--

CREATE TABLE `pets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'no-image.png',
  `kind` varchar(255) NOT NULL,
  `weight` double NOT NULL,
  `age` int(11) NOT NULL,
  `bread` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `adopted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pets`
--

INSERT INTO `pets` (`id`, `name`, `image`, `kind`, `weight`, `age`, `bread`, `location`, `description`, `active`, `adopted`, `created_at`, `updated_at`) VALUES
(1, 'chando', 'no-image.png', 'dog', 14, 8, 'nea', 'Apartado', 'chando quedate quieto', 1, 0, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(2, 'Tiger', 'no-image.png', 'Felino', 70, 46, 'Patriota', 'Monteria', 'Firmes por la patria', 1, 1, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(3, 'Flowerman', 'no-image.png', 'software developer', 75, 21, 'valluno', 'Cartago', 'Manito', 1, 0, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(4, 'Carlitos', 'no-image.png', 'Senador', 68, 50, 'pseudo-Liberal', 'Marquetalia', 'Manito mi dios me lo bendiga', 1, 0, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(5, 'OfacZero', 'no-image.png', 'Abstracto', 80, 45, 'Instructor', 'Sena regional caldas', 'Solo worldskills', 1, 0, '2026-02-19 05:34:18', '2026-02-19 05:34:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('9HQQGppD3af4vbZJ6cCEF7mcJpYKGCCv18UAgDNt', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiODFwQmM1M3l3anJVelp1Qkl2R2U3VUhmZm53M3hvRjNNd0N3dkt0QyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO3M6NToicm91dGUiO3M6OToiZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1778025201);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document` bigint(20) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `photo` varchar(255) NOT NULL DEFAULT 'no-photo.png',
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `role` varchar(255) NOT NULL DEFAULT 'Customer',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `document`, `fullname`, `gender`, `birthdate`, `photo`, `phone`, `email`, `email_verified_at`, `password`, `active`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 75000001, 'John Wick', 'Male', '1964-09-02', 'no-photo.png', '3206814798', 'johnw@mail.com', NULL, '$2y$12$Yp0Er3oFSUvXfm5p0SD51OxY6s7A0hEWDBuBUDizjYgrrPzEzsSse', 1, 'admin', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(2, 123456789, 'Lara Croft', 'Female', '1968-02-14', 'no-photo.png', '3100000002', 'larac@mail.com', NULL, '$2y$12$WOabejgTcX4bM/k9uDDiJ.3wjast25T53v4lb5rTEE8VgsEi6MLt2', 1, 'Customer', NULL, NULL, NULL),
(3, 68716932, 'Daisha Effertz', 'Female', '1994-04-09', 'images/users/default.png', '3202005435', 'rosemary.torp@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Admin', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(4, 33509511, 'Kimberly Kunde', 'Female', '1976-02-03', 'images/users/default.png', '3468320556', 'zharvey@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(5, 78162101, 'Levi Rau', 'Male', '1980-11-05', 'images/users/default.png', '3542763297', 'diamond29@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(6, 77609527, 'Tremayne Greenfelder', 'Male', '1992-01-20', 'images/users/default.png', '3725027690', 'lela18@example.com', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(7, 76883782, 'Sammie Conroy', 'Male', '1980-09-04', 'images/users/default.png', '3600891359', 'leta.marvin@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 0, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(8, 68524489, 'Lilliana Romaguera', 'Female', '1995-05-08', 'images/users/default.png', '3716870115', 'chagenes@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 0, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(9, 41825398, 'Cecilia Borer', 'Female', '1986-02-22', 'images/users/default.png', '3576797436', 'bashirian.monty@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Admin', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(10, 90766708, 'Euna Adams', 'Female', '1976-05-26', 'images/users/default.png', '3245979933', 'funk.sylvan@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(11, 39852278, 'Stefanie Pfeffer', 'Female', '1984-10-15', 'images/users/default.png', '3668258848', 'sipes.lillie@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(12, 65983781, 'Thalia Rogahn', 'Female', '1985-06-02', 'images/users/default.png', '3640463965', 'leila.larson@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(13, 35614923, 'Jazmyne Hoppe', 'Female', '2006-08-18', 'images/users/default.png', '3967656839', 'arvilla72@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(14, 46465737, 'Elenor Becker', 'Female', '2005-12-25', 'images/users/default.png', '3448798355', 'aliya50@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(15, 61916827, 'Emmalee Friesen', 'Female', '1983-07-19', 'images/users/default.png', '3214961735', 'asa.moen@example.com', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(16, 12797406, 'Amira Hill', 'Female', '1987-03-06', 'images/users/default.png', '3518104775', 'bergstrom.kelley@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(17, 34587637, 'Carli Ratke', 'Female', '1999-05-24', 'images/users/default.png', '3838526947', 'grant.bernier@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 0, 'Admin', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(18, 50965211, 'Michele O\'Kon', 'Female', '1997-12-30', 'images/users/default.png', '3568713728', 'ila.zieme@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(19, 30168102, 'Raina Greenfelder', 'Female', '1983-09-02', 'images/users/default.png', '3884485893', 'clarson@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(20, 63520689, 'Gwendolyn Wehner', 'Female', '1998-06-26', 'images/users/default.png', '3241329167', 'jalon40@example.com', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Admin', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(21, 26923328, 'Rubye Ortiz', 'Female', '1990-09-06', 'images/users/default.png', '3397704818', 'max95@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(22, 10259130, 'Verla Carter', 'Female', '1992-09-01', 'images/users/default.png', '3159763745', 'americo.corwin@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 0, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(23, 82913579, 'Darron Ledner', 'Male', '1996-04-10', 'images/users/default.png', '3786304230', 'agnes97@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Admin', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(24, 59758501, 'Benedict Weber', 'Male', '1997-04-19', 'images/users/default.png', '3482053297', 'billie.rosenbaum@example.com', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 0, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(25, 52820337, 'Christophe Brakus', 'Male', '1987-05-03', 'images/users/default.png', '3768398755', 'renner.elfrieda@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Admin', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(26, 73035871, 'Lurline Grady', 'Female', '1982-10-14', 'images/users/default.png', '3824642825', 'jonatan88@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(27, 27764456, 'Yasmeen Wilderman', 'Female', '1996-05-14', 'images/users/default.png', '3298945144', 'vilma.deckow@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(28, 30819027, 'Ara Green', 'Female', '1996-06-08', 'images/users/default.png', '3799424351', 'thodkiewicz@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Admin', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(29, 86332161, 'Abigayle Ward', 'Female', '1980-08-25', 'images/users/default.png', '3084144337', 'sanford.bryana@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(30, 79788501, 'Xzavier Bednar', 'Male', '2006-12-01', 'images/users/default.png', '3949056650', 'herbert.kreiger@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(31, 21488258, 'Carmine Leffler', 'Male', '1978-02-07', 'images/users/default.png', '3299333800', 'hstanton@example.com', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 0, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(32, 24232454, 'Layne Harris', 'Male', '1986-08-17', 'images/users/default.png', '3857310548', 'aleen.hudson@example.com', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Admin', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(33, 69368932, 'Arvilla Bergnaum', 'Female', '1986-09-14', 'images/users/default.png', '3045180852', 'stamm.jordon@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Admin', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(34, 15547485, 'Evangeline Thompson', 'Female', '2004-06-08', 'images/users/default.png', '3072340566', 'fleta.marks@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Admin', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(35, 16938367, 'Marvin Cartwright', 'Male', '2004-03-23', 'images/users/default.png', '3362779660', 'barrett.grady@example.com', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 0, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(36, 19590782, 'Crystal VonRueden', 'Female', '1998-09-19', 'images/users/default.png', '3773292138', 'spinka.abbigail@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(37, 34290070, 'Domenic Larkin', 'Male', '2002-05-09', 'images/users/default.png', '3722298198', 'rempel.gudrun@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(38, 19621619, 'Anabel Rath', 'Female', '2003-01-30', 'images/users/default.png', '3340375940', 'skassulke@example.com', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 0, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(39, 73946547, 'Giuseppe Emmerich', 'Male', '2004-12-18', 'images/users/default.png', '3911800106', 'arne82@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Admin', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(40, 70285301, 'Riley Moen', 'Male', '1993-12-06', 'images/users/default.png', '3721052994', 'hudson.howell@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(41, 31979058, 'Patrick Larson', 'Male', '2000-07-04', 'images/users/default.png', '3315424951', 'lrippin@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(42, 13844165, 'Darian Donnelly', 'Male', '1979-04-21', 'images/users/default.png', '3359929931', 'lottie.cremin@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Admin', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(43, 60557886, 'Maya Hegmann', 'Female', '1997-12-23', 'images/users/default.png', '3484571428', 'qframi@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(44, 33874985, 'Gwen Wilkinson', 'Female', '1986-01-01', 'images/users/default.png', '3838056444', 'dewitt.hartmann@example.com', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 0, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(45, 90695726, 'Mateo Windler', 'Male', '1980-06-03', 'images/users/default.png', '3627438247', 'jabari.crona@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(46, 93116337, 'Constance Hills', 'Female', '1998-04-21', 'images/users/default.png', '3447221276', 'frederick16@example.com', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(47, 30485539, 'Hazle Kulas', 'Male', '1987-04-08', 'images/users/default.png', '3886609804', 'kevin.kutch@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(48, 51224955, 'Wayne Mraz', 'Male', '1978-11-05', 'images/users/default.png', '3170735062', 'frankie.turner@example.com', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(49, 50237968, 'Jennie Boyle', 'Female', '1981-01-03', 'images/users/default.png', '3361283199', 'zhahn@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Admin', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(50, 53290731, 'Rory Hirthe', 'Male', '1995-12-27', 'images/users/default.png', '3464411800', 'goyette.anne@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Admin', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(51, 69345733, 'Octavia Botsford', 'Female', '1989-10-03', 'images/users/default.png', '3924735191', 'moore.lily@example.net', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Customer', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18'),
(52, 46197149, 'Mireya Koelpin', 'Female', '1983-10-30', 'images/users/default.png', '3308737652', 'gideon58@example.org', NULL, '$2y$12$kMOQT9s8shIH1XE1igojguVi75GPEOB3OaFqB1hGpzR7jJ5N/Bo1S', 1, 'Admin', NULL, '2026-02-19 05:34:18', '2026-02-19 05:34:18');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adoptions`
--
ALTER TABLE `adoptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adoptions_user_id_foreign` (`user_id`),
  ADD KEY `adoptions_pet_id_foreign` (`pet_id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_document_unique` (`document`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adoptions`
--
ALTER TABLE `adoptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pets`
--
ALTER TABLE `pets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adoptions`
--
ALTER TABLE `adoptions`
  ADD CONSTRAINT `adoptions_pet_id_foreign` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`),
  ADD CONSTRAINT `adoptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

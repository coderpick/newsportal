-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 10, 2024 at 11:40 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pwds33_newsportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`) VALUES
(12, 'সর্বশেষ', 'সর্বশেষ'),
(13, 'রাজনীতি', 'রাজনীতি'),
(14, 'বাংলাদেশ', 'বাংলাদেশ'),
(15, 'অপরাধ', 'অপরাধ'),
(16, 'বিশ্ব', 'বিশ্ব'),
(17, 'বাণিজ্য', 'বাণিজ্য'),
(18, 'খেলা', 'খেলা'),
(19, 'বিনোদন', 'বিনোদন'),
(20, 'চাকরি', 'চাকরি'),
(21, 'জীবনযাপন', 'জীবনযাপন');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `is_featured` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `category_id`, `user_id`, `title`, `slug`, `description`, `image`, `is_published`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 12, 1, 'বাংলাদেশ বিমানের পর্ষদ পুনর্গঠন করে প্রজ্ঞাপন', 'বাংলাদেশ-বিমানের-পর্ষদ-পুনর্গঠন-করে-প্রজ্ঞাপন', '&lt;div id=&quot;419645c8-72a5-41aa-8b1f-63a095d1c6c5&quot; style=&quot;font-family: Shurjo, &amp;quot;Siyam Rupali&amp;quot;, Roboto, Arial, Helvetica, monospace; font-size: 18px;&quot;&gt;&lt;div class=&quot;storyCard eyOoS&quot; style=&quot;--borderColor: var(--primaryColor); color: var(--black); font-size: var(--fs-13); margin: var(--space2_4) auto 0; max-width: 622px;&quot;&gt;&lt;div class=&quot;   \r\n                  story-element&quot; style=&quot;margin-bottom: var(--space1_6);&quot;&gt;&lt;div class=&quot;story-element story-element-text&quot; style=&quot;margin: 0px auto; max-width: 622px; padding: 0px;&quot;&gt;&lt;p style=&quot;font-family: var(--font-2); margin-right: 0px; margin-bottom: var(--space1_6); margin-left: 0px; padding: 0px; font-size: var(--fs-18); line-height: 1.7;&quot;&gt;বিমান বাংলাদেশ এয়ারলাইনসের পরিচালনা পর্ষদ পুনর্গঠিত হয়েছে। ১৩ সদস্যের পরিচালনা পর্ষদের প্রধান করা হয়েছে সাবেক তত্ত্বাবধায়ক সরকারের উপদেষ্টা আবদুল মুয়ীদ চৌধুরীকে। পর্ষদের চেয়ারম্যানের পদ থেকে অব্যাহতি দেওয়া হয়েছে মোস্তফা কামাল মহিউদ্দিনকে।&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div id=&quot;8f937ebc-ad5b-45bc-8d2b-8e55e6189803&quot; style=&quot;font-family: Shurjo, &amp;quot;Siyam Rupali&amp;quot;, Roboto, Arial, Helvetica, monospace; font-size: 18px;&quot;&gt;&lt;div class=&quot;storyCard eyOoS&quot; style=&quot;--borderColor: var(--primaryColor); color: var(--black); font-size: var(--fs-13); margin: var(--space2_4) auto 0; max-width: 622px;&quot;&gt;&lt;div class=&quot;   \r\n                  story-element&quot; style=&quot;margin-bottom: 0px;&quot;&gt;&lt;div class=&quot;story-element story-element-text&quot; style=&quot;margin: 0px auto; max-width: 622px; padding: 0px;&quot;&gt;&lt;p style=&quot;font-family: var(--font-2); margin-right: 0px; margin-bottom: var(--space1_6); margin-left: 0px; padding: 0px; font-size: var(--fs-18); line-height: 1.7;&quot;&gt;গতকাল মঙ্গলবার বেসামরিক বিমান পরিবহন ও পর্যটন মন্ত্রণালয় এ–সংক্রান্ত প্রজ্ঞাপন জারি করেছে। আজ বুধবার এক সংবাদ বিজ্ঞপ্তিতে এ তথ্য জানিয়েছে বিমান বাংলাদেশ এয়ারলাইনস। বিমানের পুনর্গঠিত পর্ষদে রয়েছেন বেসামরিক বিমান পরিবহন ও পর্যটন মন্ত্রণালয়ের সচিব, অর্থ বিভাগের সচিব, জাতীয় রাজস্ব বোর্ডের চেয়ারম্যান, প্রধান উপদেষ্টার কার্যালয়ের সচিব, বেসামরিক বিমান চলাচল কর্তৃপক্ষের চেয়ারম্যান।&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', 'uploads/post/66e02f6b10b7c1725968235.webp', 1, 1, '2024-09-10 11:37:15', '2024-09-10 11:37:15');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `post_id` int NOT NULL,
  `tag_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`, `slug`) VALUES
(3, 'সরকার', 'সরকার'),
(4, 'বাংলাদেশ বিমান বাহিনী', 'বাংলাদেশ-বিমান-বাহিনী');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','editor','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `status`, `image`, `role`, `phone`) VALUES
(1, 'Mr. Admin', 'admin@mail.com', '$2y$10$N.dmFbekOmcQZBSNqD6edORG2bJRiz2bmhBUEgK2nRtaEK8Ayl2hq', 1, NULL, 'admin', NULL),
(2, 'Troy Hayden', 'user@mail.com', '$2y$10$oX4qdC1aB/WQ8CWDPTFOZO55jW5s1LJPPh0ntSymQ6nXcMdpwBPD6', 1, NULL, 'user', NULL),
(3, 'Mr. Editor', 'editor@mail.com', '$2y$10$KkOS3Jend7l2wOgKt1oPXuudTdE9qfzv.X8c0CMdgslgUsUuS0Bce', 1, NULL, 'editor', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_slug_unique` (`slug`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_post_index` (`user_id`,`post_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_author_id_index` (`user_id`),
  ADD KEY `post_category_id_index` (`category_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD KEY `post_tag_tag_id_index` (`post_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

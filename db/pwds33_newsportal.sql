-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 17, 2024 at 11:20 AM
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`) VALUES
(22, 'Opinion', 'opinion'),
(23, 'Sports', 'sports'),
(24, 'Business', 'business'),
(25, 'Entertainment', 'entertainment'),
(26, 'Life & Living', 'life-&-living'),
(27, 'Youth', 'youth'),
(28, 'Tech & Startup', 'tech-&-startup'),
(29, 'Multimedia', 'multimedia'),
(30, 'Environment', 'environment'),
(31, 'Brand Stories', 'brand-stories');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(3, 22, 1, 'No innocent should be harassed legally', 'no-innocent-should-be-harassed-legally', '&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;One of the most immediate and rather disturbing side-effects of the August 5 regime change has been the surge in legal cases targeting individuals associated with the Awami League government. While cases over the crimes committed during the preceding days and weeks were expected, the legitimacy of many that have since been filed was dubious as they lacked credible evidence, and were potentially used as a means of harassing the accused. Among others, even academics, journalists, and artists have been targeted through such frivolous lawsuits—a trend that continues to this day.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;Against this backdrop, it is heartening to see the police headquarters finally take steps to address these concerns. In&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;https://www.thedailystar.net/news/bangladesh/news/drop-names-cases-if-involvement-not-found-3702456&quot; style=&quot;box-sizing: inherit; background-color: rgb(255, 255, 255); line-height: inherit; color: rgb(23, 121, 186); text-decoration: none; cursor: pointer; transition-property: color, opacity, background-color, border-color, box-shadow; transition-duration: 0.3s; font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px; font-weight: 500;&quot;&gt;a directive issued to police stations&lt;/a&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&amp;nbsp;across the country, the authorities have recently instructed officers to remove the names of individuals from murder and other cases connected with the movement if no evidence of their involvement is found in initial investigations. Officers were also ordered not to arrest any government employee without proof. While such instructions were already in the CrPC and service rules, reiterating them in specific terms reflects wider concerns over the surge in arbitrary cases and also marks a policy departure from the previous administration&#039;s practice of harassing critics and political rivals through so-called &quot;ghost cases&quot;.&lt;/span&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/post/66e7008baa6321726414987.png', 0, 0, '2024-09-15 15:43:07', '2024-09-15 15:43:07'),
(4, 22, 1, 'From vision to action: Prof Yunus’s reform agenda for Bangladesh', 'from-vision-to-action:-prof-yunus’s-reform-agenda-for-bangladesh', '&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;Prof Muhammad Yunus&#039;s transition from Nobel laureate to reformist chief adviser continues to capture the nation&#039;s attention. In his August 25 speech, Yunus outlined an ambitious vision for a &quot;new Bangladesh&quot; centred on unity, transparency, and democratic renewal. While his message resonated with many, it also left citizens asking:&amp;nbsp;&quot;Can he turn words into action?&quot;&amp;nbsp;Fast forward to September 11, and Yunus seems determined to answer that question. His latest address laid out specific reforms, marking the beginning of a long journey toward real change.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;Diplomacy and governance today go far beyond traditional bureaucratic processes, and Prof Yunus stands at the forefront of this shift. Through Grameen Bank, he demonstrated how NGOs can drive powerful social and economic change where governments often struggle. This&amp;nbsp;&lt;a href=&quot;https://www.dropbox.com/scl/fi/s3b6kfanzc46e2zee9dzq/Engineering-Diplomacy.pdf?rlkey=ir915bc8naaqanfkkx55m1x21&amp;amp;dl=0&quot; style=&quot;box-sizing: inherit; line-height: inherit; color: rgb(23, 121, 186); text-decoration: none; cursor: pointer; transition-property: color, opacity, background-color, border-color, box-shadow; transition-duration: 0.3s;&quot;&gt;blend of&amp;nbsp;engineering diplomac&lt;/a&gt;y—using pragmatic, principled solutions paired with negotiation—is a skill Yunus and the IG can now bring to create a new Bangladesh.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;However, running a government, unlike an NGO, is a different challenge. It requires navigating political complexities, balancing competing interests, and making compromises that NGOs can often avoid. While his outsider perspective and grassroots experience offer fresh ideas, Yunus and the IG must be cautious not to fall into the political traps that can derail even the most well-intentioned leaders.&lt;/p&gt;', 'uploads/post/66e70311210db1726415633.jpeg', 0, 0, '2024-09-15 15:53:53', '2024-09-15 15:53:53'),
(5, 22, 3, 'Kejriwal’s bail, resignation and the road ahead', 'kejriwal’s-bail,-resignation-and-the-road-ahead', '&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;Barely 48 hours after Aam Aadmi Party (AAP) chief and Delhi Chief Minister Arvind Kejriwal walked out of high-security Tihar jail on September 14, following bail granted by the Supreme Court in a case of alleged graft, he made the dramatic announcement of stepping down from office in a couple of days. He made the announcement while addressing a meeting of AAP workers in New Delhi. Kejriwal, who was released from prison nearly six months after his arrest in the excise policy corruption case, said, &quot;I will only sit in the chief minister&#039;s chair after people give me a certificate of honesty. I want to undergo &#039;agnipariksha&#039; (trial by fire) after coming out of jail. I will become chief minister, (Manish) Sisodia deputy CM only when people say we are honest.&quot; He also stated that, since fresh elections for the 70-member Delhi assembly are due in February, he demanded that the elections in the national capital be held in November, along with that of Maharashtra.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;Kejriwal&#039;s reasoning for his resignation has raised at least two questions. Does he believe that only a fresh electoral victory can establish his honesty? What then happens to the court&#039;s role, which either convicts or absolves a person of charges? Can an electoral victory override a court&#039;s ruling on a person&#039;s culpability? There have been many instances of individuals holding constitutional posts resigning after court convictions. Kejriwal argues that, since the trial in his cases is time-consuming, he prefers to seek a fresh electoral mandate. If he leads his party to victory in the Delhi Legislative Assembly elections and becomes chief minister again, what happens if the trial court convicts him? Can electoral mandate be a substitute for judicial pronouncement?&lt;/span&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/post/66e70551a8cf71726416209.jpeg', 0, 0, '2024-09-15 16:03:29', '2024-09-15 16:03:29'),
(6, 23, 1, 'Rain washes out England-Australia T20I series finale', 'rain-washes-out-england-australia-t20i-series-finale', '&lt;p&gt;&lt;div class=&quot;mb-20 mr-20 hide-for-print dfp-tag-wrapper text-center  &quot; style=&quot;box-sizing: inherit; margin-top: 0px; margin-right: 20px !important; margin-bottom: 20px !important; margin-left: 0px; padding: 0px; text-align: center; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;div id=&quot;dfp-ad-en_photo_banner-wrapper&quot; class=&quot;dfp-tag-wrapper&quot; style=&quot;box-sizing: inherit; margin: 0px; padding: 0px;&quot;&gt;&lt;pubguru data-pg-ad=&quot;en_photo_banner&quot; class=&quot;pg-loaded&quot; id=&quot;pg-ad-2l6farv5&quot; data-google-query-id=&quot;CIOUuq2txYgDFdQigwMdFAIErQ&quot; style=&quot;box-sizing: inherit;&quot;&gt;&lt;/pubguru&gt;&lt;/div&gt;&lt;/div&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin: 0px 0px 1.55556em; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; font-weight: 500 !important; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;strong style=&quot;box-sizing: inherit; font-weight: 700; line-height: inherit;&quot;&gt;Persistent rain meant the third Twenty20 international between England and Australia at Old Trafford on Sunday was abandoned without a ball being bowled as the series ended all square at 1-1.&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin: 0px 0px 1.55556em; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; font-weight: 500 !important; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;strong style=&quot;box-sizing: inherit; font-weight: 700; line-height: inherit;&quot;&gt;&lt;span style=&quot;font-weight: 500;&quot;&gt;The match was due to get underway at 2:30 pm local time (1330 GMT).&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;However, with rain falling for several hours in Manchester on Sunday morning both the toss and match itself were put on hold, with deep puddles forming on the covers protecting the pitch and square.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;The official cut-off time for a five-overs per side match, the minimum length required to force a decisive result, was 5:46 pm (1646 GMT).&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin: 0px 0px 1.55556em; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; font-weight: 500 !important; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;strong style=&quot;box-sizing: inherit; font-weight: 700; line-height: inherit;&quot;&gt;&lt;br&gt;&lt;/strong&gt;&lt;/p&gt;', 'uploads/post/66e70a2aa660a1726417450.png', 0, 0, '2024-09-15 16:24:10', '2024-09-15 16:24:10'),
(7, 23, 1, 'Tarafder Ruhul Amin announces BFF presidency bid', 'tarafder-ruhul-amin-announces-bff-presidency-bid', '&lt;p&gt;&lt;span style=&quot;box-sizing: inherit; font-weight: 700; line-height: inherit; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;About 24 hours after Kazi Salahuddin&#039;s decision to not run for presidency in the upcoming Bangladesh Football Federation elections, Tarafder Ruhul Amin has catapulted himself as a candidate for the top post in October 26 elections.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;box-sizing: inherit; font-weight: 700; line-height: inherit; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 500;&quot;&gt;It was the first footballing interaction on a public platform for the industrialist-turned-sports-organiser, who had apparently wiped his hands off his footballing ambitions after not running for the same post in BFF&#039;s last elections in 2020.&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;Amin&#039;s name was formally proposed by Ali Imam Topon, a former president of Bangladesh Athletics Federation, during a press conference at a hotel in the capital on Sunday under the banner of &quot;declaration of president candidate in Bangladesh Football Federation elections with consensus.&quot;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;&quot;Tarafder Ruhul Amin is being announced as the presidential candidate on behalf of the districts and clubs. The Football Federation did not help running the leagues at district level. It was his assistance that helped holding the league at district level,&quot; Topon said in his speech.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;box-sizing: inherit; font-weight: 700; line-height: inherit; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/post/66e70f2d4c9131726418733.jpeg', 0, 0, '2024-09-15 16:45:33', '2024-09-15 16:45:33'),
(8, 23, 3, 'Indian team far superior than Pakistan: Jadeja warns Bangladesh ahead of Test series', 'indian-team-far-superior-than-pakistan:-jadeja-warns-bangladesh-ahead-of-test-series', '&lt;p&gt;&lt;span style=&quot;box-sizing: inherit; font-weight: 700; line-height: inherit; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;Former India batter Ajay Jadeja said that India would be a handful for Bangladesh in the upcoming two-match Test series starting later this week.&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;box-sizing: inherit; font-weight: 700; line-height: inherit; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&lt;span style=&quot;font-weight: 500;&quot;&gt;Bangladesh come into the series on the back of a maiden Test series win in Pakistan but Jadeja believes that India would be a a far more superior challenge for the Tigers.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;&quot;Any team which has come just after winning will always think they can win. But there is a difference between the Pakistan team at the moment with the India cricket team. The Indian team is a far superior team,&quot; Jadeja told PTI ahead of the first Test between the sides starting on September 19.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;&quot;But yes, from their [Bangladesh&#039;s] point of view, they will believe that since they have beaten Pakistan, why cannot they [beat India]. But we are a better side, but they will definitely be a handful. They play spin well, they bowl spin, so conditions suit.&quot;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;box-sizing: inherit; font-weight: 700; line-height: inherit; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/post/66e70ffd96b7f1726418941.jpeg', 0, 0, '2024-09-15 16:49:01', '2024-09-15 16:49:01'),
(9, 24, 1, 'Dhaka’s importers still facing long waits to get goods from Ctg port', 'dhaka’s-importers-still-facing-long-waits-to-get-goods-from-ctg-port', '&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;It has been nearly a month that an automobile dealer has been waiting for a container loaded with reconditioned parts to reach the inland container depot (ICD) at Kamalapur, Dhaka from the Chattogram port over railway.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;The parts, imported by M/s Partsco Automobiles of Munshiganj&#039;s Sirajdikhan from the United Arab Emirates, arrived at the port on August 17, only to add to a massive container backlog.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;The yard designated for the ICD-bound containers has been clogged due to a 27-day suspension of railway services since July 18 amidst the countrywide student movement and another five-day suspension in late August for floods.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;Around 70 percent of the goods arriving at the port are of importers based in Dhaka and surrounding areas.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;Of those, around 3 percent are taken away over railways while the rest over roads and river routes.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;The yard meant for the Kamalapur ICD-bound containers can run unobstructed at its standard capacity of 1,774 TEUs (twenty-foot equivalent units).&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;However, till the first week of August, 2,700 TEUs had been crammed inside.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/post/66e710f7497291726419191.jpeg', 0, 0, '2024-09-15 16:53:11', '2024-09-15 16:53:11'),
(10, 24, 1, 'brokers demand capital market taskforce', 'brokers-demand-capital-market-taskforce-', '&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;Stock brokerage firms have urged the government to form a taskforce for the capital market to support its growth and to carry out necessary reforms.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;The DSE Brokers Association of Bangladesh (DBA) made the demand in a letter sent to the finance adviser today.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px; line-height: inherit; padding: 0px; text-rendering: optimizelegibility; color: rgb(16, 24, 40);&quot;&gt;Despite the long-time presence of the Dhaka Stock Exchange (DSE) and Bangladesh Securities and Exchange Commission (BSEC), the stock market still lags from becoming a source of capital formation, according to stock brokers. &amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px; line-height: inherit; padding: 0px; text-rendering: optimizelegibility; color: rgb(16, 24, 40);&quot;&gt;So, establishing a taskforce like the banking sector may work well to develop the market and complete essential reforms, the DBA said in the letter.&amp;nbsp;&lt;/p&gt;', 'uploads/post/66e711e75048c1726419431.jpeg', 0, 0, '2024-09-15 16:57:11', '2024-09-15 16:57:11'),
(11, 24, 3, 'Most factories in Ashulia reopen as law and order improves, 20 remain closed', 'most-factories-in-ashulia-reopen-as-law-and-order-improves,-20-remain-closed', '&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;Most factories in the Ashulia area resumed operations today, while 20 factories remain shut in the Ashulia Industrial area.&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;Among the 20 closed factories, 18 have been shut indefinitely under &quot;no work no pay&quot; labour law and the rest declared &quot;general holiday&quot;, Md Sarwar Alam, superintendent of Ashulia Industrial Police-1, told The Daily Star today.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;Despite the closures, there have been no protests by workers in the area.&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;&quot;Factories have resumed operations from today and we expect the situation to remain stable,&quot; said Khandoker Rafiqul Islam, president of the Bangladesh Garment Manufacturers and Exporters Association, over the phone.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/post/66e712fe449531726419710.jpeg', 0, 0, '2024-09-15 17:01:50', '2024-09-15 17:01:50'),
(12, 25, 1, '‘Punorbashon Concert’: Local musicians unite to aid flood victims', '‘punorbashon-concert’:-local-musicians-unite-to-aid-flood-victims', '&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;Bangladeshi musicians have recently come together for the &quot;Punorbashon Concert&quot; to support flood victims.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;Kicking off at 3pm yesterday at Rabindra Sarobar in the capital, the event rocked on until 10pm.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;The concert showcased performances by local bands-- Shohortoli, Blue Jeans, Projonmo Baul, and Tarun Band. Additionally, vocalists Torsa and Atika also took to the stage to entrall audiences.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;The event, hosted by actors RJ Neerob and Saima Sultana, was successfully orchestrated by Tripple One Event. Donations collected via the concert will diligently be utilised to aid flood victims across the country.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/post/66e7a26da2e8f1726456429.jpeg', 0, 0, '2024-09-16 03:13:49', '2024-09-16 03:13:49'),
(13, 25, 1, 'Bangladesh Film Censor Board reconstructed: Who are the members?', 'bangladesh-film-censor-board-reconstructed:-who-are-the-members?', '&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;On the same day, director Ashfaque Nipun and actress Quazi Nawshaba Ahmed made headlines by being mentioned in two consecutive government gazettes. At first, they were announced as members of the Artistes&#039; Welfare Trust, and now they have also been included in the newly formed censor board.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;The government has revamped the Bangladesh Film Censor Board, bringing fresh faces and perspectives. In an announcement made today, the Ministry of Information and Broadcasting unveiled the names of the 15 members who will now shape the future of film censorship in the country. This move marks a significant step towards modernising the board and ensuring its relevance in today&#039;s dynamic film industry.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;The leadership of the newly restructured censor board is set with key figures at the helm. The Senior Secretary or Secretary of the Ministry of Information and Broadcasting will take on the role of Chairman. At the same time, the Vice Chairman of the Bangladesh Film Censor Board will step into the crucial position of Member Secretary.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;In the wake of political changes, reforms are sweeping across various sectors, including the film industry. As part of these efforts, the interim government has announced the restructuring of the Censor Board.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;Kazi Hayat, the president of the Bangladesh Film Directors&#039; Association will serve as a member of the censor board. The list of other members includes renowned filmmakers Zakir Hossain Razu, Ashfaque Nipun, Khijir Hayat Khan, Tasmiah Afrin Mou, Rafiqul Anwar Russell, and actress Quazi Nawshaba Ahmed. This diverse group of industry veterans brings a wealth of experience, promising a dynamic and well-rounded approach to the board&#039;s responsibilities.&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/post/66e7a3b6652211726456758.jpeg', 0, 0, '2024-09-16 03:19:18', '2024-09-16 03:19:18'),
(14, 25, 3, 'Kanak Chapa, Ashfaque Nipun, and Nawshaba among key figures in restructured Artistes’ Welfare Trust', 'kanak-chapa,-ashfaque-nipun,-and-nawshaba-among-key-figures-in-restructured-artistes’-welfare-trust', '&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;The interim government has announced a bold restructuring of the 15-member trustee board of the Bangladesh Artistes&#039; Welfare Trust, marking a significant move to strengthen support for the country&#039;s creative community.&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;In an official gazette released today (September 15) by the Ministry of Cultural Affairs, the new trustee board members will serve a three-year term, playing a crucial role in shaping policies to benefit the nation&#039;s artistes.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;The reshuffle comes in the wake of political shifts, signalling that changes in the cultural landscape are also on the agenda. Drawing on the authority granted under Section 6 of the Bangladesh Artistes&#039; Welfare Trust Act 2001, the government has revamped the leadership to bring fresh energy to the trust&#039;s operations.&lt;/span&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/post/66e7a5208a07e1726457120.jpeg', 0, 0, '2024-09-16 03:25:20', '2024-09-16 03:25:20'),
(15, 26, 1, 'Forehead lines and Facebook stories: The unsolicited skincare advice I never asked for', 'forehead-lines-and-facebook-stories:-the-unsolicited-skincare-advice-i-never-asked-for', '&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;As soon as the second stage of my life began, the brioche bun sheen of youth faded to a dull matte greyish tone. If that was not enough, a friend pointed out the other day that I spoke with my forehead and the lines were quite attractive. &quot;I get it Nawrin, I have prominent forehead lines!&quot;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;If that wasn&#039;t enough, a Facebook Story from a younger colleague pointed out that viewers of Beverly Hills 90210 needed to add retinol to their skincare routine.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;Enough said, I think I got all the hints.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;Let&#039;s get into the history a bit; 30 years ago, Retin A was discovered as an oil reducing acne solution — fast forward to 2024, it is used both to brighten the skin and improve skin tone and texture.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;By now, you must be inquisitive about the God-gifted ingredients: Vitamin A derivatives that help accelerate the rate at which new cells migrate onto the surface and stimulate the skin cells to produce more collagen.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;Many skin experts swear by calling Retinol the gold standard to delay ageing.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/post/66e7aab3023361726458547.jpeg', 0, 0, '2024-09-16 03:49:07', '2024-09-16 03:49:07'),
(16, 26, 1, 'Rain or shine, keep your glow: Monsoon skincare hacks', 'rain-or-shine,-keep-your-glow:-monsoon-skincare-hacks', '&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;Hot and humid, the Bangladeshi monsoon can create havoc on your skin. The merciless heatwave that we experience even in the rainy season makes the skin vulnerable to increased secretion from sebaceous glands. This makes the skin appear oily; dry skin becomes rough and patchy. To prevent such nightmares, try these simple, monsoon skincare tips that can help you navigate the season without compromising glowing skin.&lt;/span&gt;&lt;/p&gt;&lt;h2 style=&quot;box-sizing: inherit; margin-right: 0px; margin-left: 0px; padding: 0px; font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-weight: 600; color: rgb(16, 24, 40); text-rendering: optimizelegibility; font-size: 1.5rem; line-height: 1.33333; outline: none;&quot;&gt;&lt;span style=&quot;box-sizing: inherit; outline: none; font-size: 22px;&quot;&gt;Make a routine&lt;/span&gt;&lt;/h2&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;Make yourself a skincare routine during the monsoon. Go for minimal makeup to avoid clogged pores.&amp;nbsp;&lt;span style=&quot;font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);&quot;&gt;Start with cleansing, followed by toning and moisturising in the morning and at night.&lt;/span&gt;&lt;/p&gt;&lt;h2 style=&quot;box-sizing: inherit; margin-right: 0px; margin-left: 0px; padding: 0px; font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-weight: 600; color: rgb(16, 24, 40); text-rendering: optimizelegibility; font-size: 1.5rem; line-height: 1.33333; outline: none;&quot;&gt;&lt;span style=&quot;box-sizing: inherit; outline: none; font-size: 22px;&quot;&gt;Exfoliation is key&lt;/span&gt;&lt;/h2&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;As we sweat, the skin accumulates dirt that clogs skin pores. The benefits of exfoliation are many, especially if you are battling against breakouts that look awful.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;Exfoliation, the process of removing dead cells from the surface of your skin, can help remove clogged pores and improve the texture and tone of the skin. It can also stimulate the growth of new skin cells, which will give a smoother look.&lt;/p&gt;&lt;h2 style=&quot;box-sizing: inherit; margin-right: 0px; margin-left: 0px; padding: 0px; font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-weight: 600; color: rgb(16, 24, 40); text-rendering: optimizelegibility; font-size: 1.5rem; line-height: 1.33333; outline: none;&quot;&gt;&lt;span style=&quot;box-sizing: inherit; outline: none; font-size: 22px;&quot;&gt;Stay hydrated&lt;/span&gt;&lt;/h2&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;Needless to say, even in monsoon, you need to replenish the water lost in the heat. Hydration can help you expel toxins from the body and help retain the elasticity of the skin. Well-hydrated skin appears radiant and youthful and can help prevent dry skin and acne.&lt;/p&gt;&lt;h2 style=&quot;box-sizing: inherit; margin-right: 0px; margin-left: 0px; padding: 0px; font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-weight: 600; color: rgb(16, 24, 40); text-rendering: optimizelegibility; font-size: 1.5rem; line-height: 1.33333; outline: none;&quot;&gt;&lt;span style=&quot;box-sizing: inherit; outline: none; font-size: 22px;&quot;&gt;Eat healthy&lt;/span&gt;&lt;/h2&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;For maintaining skin health, eat foods rich in vitamin C and antioxidants, as these can prevent or delay cell damage. Antioxidants are found in fruits and vegetables and also dietary supplements. Eat in moderation foods that are rich in sugar and low in fibre. Also, avoid fast food and a high-carb diet.&lt;/p&gt;&lt;h2 style=&quot;box-sizing: inherit; margin-right: 0px; margin-left: 0px; padding: 0px; font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-weight: 600; color: rgb(16, 24, 40); text-rendering: optimizelegibility; font-size: 1.5rem; line-height: 1.33333; outline: none;&quot;&gt;&lt;span style=&quot;box-sizing: inherit; outline: none; font-size: 22px;&quot;&gt;Wear protective clothes&lt;/span&gt;&lt;/h2&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;This may seem obvious, but we cannot reiterate the importance of comfortable clothing during monsoon. This will not only shield your skin against the harsh rays of the sun but also allow the skin to&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;&quot;breathe&quot;.&lt;/p&gt;&lt;h2 style=&quot;box-sizing: inherit; margin-right: 0px; margin-left: 0px; padding: 0px; font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-weight: 600; color: rgb(16, 24, 40); text-rendering: optimizelegibility; font-size: 1.5rem; line-height: 1.33333; outline: none;&quot;&gt;&lt;span style=&quot;box-sizing: inherit; outline: none; font-size: 22px;&quot;&gt;Never forget the sunscreen when the sun shines&lt;/span&gt;&lt;/h2&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;An SPF 30 sunscreen can help block UV rays and prevent painful sunburns. It also slows down the signs of ageing in your skin and maintains an even skin tone.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/post/66e7ac4c804031726458956.jpeg', 0, 0, '2024-09-16 03:55:56', '2024-09-16 03:55:56'),
(17, 26, 3, 'M for magic; M for makeup!', 'm-for-magic;-m-for-makeup!', '&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;It is 2 PM on a Tuesday afternoon, and I am elbow deep in a pan of loose, golden glitter. My entire family is either watching satellite TV or playing board games with no worries in the world. &quot;Let them be,&quot; I tell myself, for I am busy experimenting with makeup.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;While my normal going-out routine would be just a dab of lipstick and a streak of kajal, at this moment I am sensing great pleasure in taking art (read: makeup) to a higher level. I am spackling myself with a Hollywood-style strip of eyelash, piling on maroon lipstick, and sweeping on sparkly eyeshadows. While everything outside seems mundane, disheartening, and a tad bit frightening, I take refuge in something that I love — glamouring myself.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;It&#039;s not just me; even celebrities have shared their experience on how makeup can be a mood booster. When nothing makes sense, dabbing red lipstick always helps, it seems. It soothes my wounded conscience and makes me feel completely in control of myself. &amp;nbsp;As crazy as it may sound, this is true!&lt;/p&gt;&lt;h2 style=&quot;box-sizing: inherit; margin-right: 0px; margin-left: 0px; padding: 0px; font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-weight: 600; color: rgb(16, 24, 40); text-rendering: optimizelegibility; font-size: 1.5rem; line-height: 1.33333; outline: none;&quot;&gt;&lt;span style=&quot;box-sizing: inherit; outline: none; font-size: 22px;&quot;&gt;The science behind it&lt;/span&gt;&lt;/h2&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;When you carefully put on makeup like a concealer, a bronzer, and a blush, you are caressing your face with your fingers. This releases oxytocin, which is a &quot;happy hormone.&quot;&amp;nbsp; The actual process of working with the hands can help reduce stress. Ask any makeup artist or painter—they will all agree.&lt;/p&gt;&lt;h2 style=&quot;box-sizing: inherit; margin-right: 0px; margin-left: 0px; padding: 0px; font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-weight: 600; color: rgb(16, 24, 40); text-rendering: optimizelegibility; font-size: 1.5rem; line-height: 1.33333;&quot;&gt;&lt;span style=&quot;box-sizing: inherit; font-size: 22px;&quot;&gt;Creativity&lt;/span&gt;&lt;/h2&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;While there might be a set of rules for writing, painting, and applying makeup, anyone knows that the best art form is achieved when creativity flows freely. When experimenting with makeup, I do not plan anything ahead of time. I look at the wardrobe I am about to wear and allow myself to &quot;wear&quot; the mood I am in that day. Then my creative mind goes solo — the main idea behind makeup is to always feel more confident, empowered, and free.&lt;/p&gt;&lt;h2 style=&quot;box-sizing: inherit; margin-right: 0px; margin-left: 0px; padding: 0px; font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-weight: 600; color: rgb(16, 24, 40); text-rendering: optimizelegibility; font-size: 1.5rem; line-height: 1.33333;&quot;&gt;&lt;span style=&quot;box-sizing: inherit; font-size: 22px;&quot;&gt;There are no mistakes&lt;/span&gt;&lt;/h2&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;On days when you feel like you have overdone your makeup or that kajal might have smeared more than you wanted it to, remind yourself that there are no set rulebooks and all the &quot;mistakes&quot; are only in your head.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;We have to learn to stop chasing perfection and instead enjoy the process of everything we do. Makeup has always been about fun. It has been about self-expression. Let&#039;s just keep it at that.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/post/66e7adaeb79731726459310.jpeg', 0, 0, '2024-09-16 04:01:50', '2024-09-16 04:01:50');
INSERT INTO `post` (`id`, `category_id`, `user_id`, `title`, `slug`, `description`, `image`, `is_published`, `is_featured`, `created_at`, `updated_at`) VALUES
(18, 27, 1, 'Can we break free from the brain drain cycle?', 'can-we-break-free-from-the-brain-drain-cycle?', '&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;Fahim Tahsan, a student at Oklahoma State University, has always dreamed of contributing to his homeland, imagining a future where his skills could help build a better Bangladesh. However, the reality he encountered was far from his expectations.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&quot;Despite having a degree with good results and relevant experiences, I was unable to get a well-paid job. Entry-level positions were only paying an average of Tk 25,000,&quot; Fahim recalls. &quot;If Bangladesh had offered sufficient opportunities and a better work-life balance, I might have considered staying back,&quot; Fahim reflects.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;Similarly, Jasper Shaon, Assistant Manager at China Northeast Electric Power Engineering &amp;amp; Services Co. Ltd. (NEPCS), decided to move abroad with his family in search of a better life. &quot;In Bangladesh, engineers have to work long hours with little work-life balance. It would have taken several years of experience to earn a stable salary. Having only one income source wasn&#039;t enough, and it would have been difficult to support our family, so we made the decision to shift.&quot;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;Thousands of students and skilled professionals across Bangladesh face similar dilemmas, forced to choose between staying in their homeland with little prospect for advancement or seeking alternatives abroad. The systemic challenges they encounter are indicative of deeper issues within Bangladesh&#039;s socio-economic condition.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;According to the latest UNESCO figures, 52,799 Bangladeshi students pursued higher education overseas in 2023. The departure of skilled professionals in fields like business, engineering, and information technology has created a void in the domestic labour market, leading to decreased productivity, reduced innovation, and slower economic growth. The loss of these individuals not only hampers the immediate economic prospects of the country but also stifles its long-term potential for development.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;The reasons for this ever-growing set of challenges are complex.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/post/66e7ae84e90be1726459524.jpeg', 0, 0, '2024-09-16 04:05:24', '2024-09-16 04:05:24'),
(19, 27, 1, 'Job hunting on LinkedIn', 'job-hunting-on-linkedin', '&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;Finding, applying to, and securing jobs via LinkedIn doesn&#039;t have to be difficult. In fact, compared to your usual job posting sites, LinkedIn has a lot more to offer in terms of opportunities, especially if you&#039;re looking for freelance work or remote jobs.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;That being said, job hunting on LinkedIn can feel tiring and occasionally pointless, particularly for those who are new to the platform or don&#039;t use it that often. However, knowing how to efficiently look for and apply to jobs can help you make the most of this platform for your professional goals.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;The most common way to look for jobs on LinkedIn is through its dedicated job searching feature. Simply mention the type of job or position you&#039;re looking for and your preferred working location, and LinkedIn will show you all the jobs that are available for your search query.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;Like many other job posting sites, LinkedIn lets you filter these search results to a great extent. One filter that is very important to utilise here is &quot;Date Posted&quot;.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;&quot;Date Posted&quot; refers to how long back the job was posted on the platform or when the position opened up. When searching for jobs, first look for the ones that were posted in the last 24 hours or one week. Since these jobs have only been around for a short while, there&#039;s a chance that they haven&#039;t received hundreds of applications yet.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;If you can&#039;t find anything that&#039;s to your liking, you can extend the search results to include all the jobs posted in the last month. While this option will show you more job openings, there&#039;s a good chance that a lot of these vacancies are already overwhelmed with applications. Plus, some of these jobs may have already shortlisted candidates for interview or even hire. Hence, even if these job posts show that they are recruiting till a certain deadline, they might not even notice your application.&lt;/p&gt;&lt;p style=&quot;box-sizing: inherit; margin-right: 0px; margin-bottom: 1.55556em; margin-left: 0px; padding: 0px; font-size: 18px; line-height: inherit; text-rendering: optimizelegibility; outline: none; color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif;&quot;&gt;Apart from the job search option on LinkedIn, joining different job posting groups on the platform is also helpful. The best thing about these groups is that you&#039;ll find dedicated groups for different professions.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(16, 24, 40); font-family: &amp;quot;Noto Serif JP&amp;quot;, serif; font-size: 18px;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/post/66e7af34b71421726459700.jpeg', 0, 0, '2024-09-16 04:08:20', '2024-09-16 04:08:20');

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
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(5, 16),
(5, 17),
(5, 18),
(5, 19),
(5, 20),
(5, 21),
(6, 22),
(6, 23),
(7, 24),
(7, 25),
(7, 26),
(8, 27),
(8, 28),
(9, 29),
(9, 30),
(9, 31),
(10, 32),
(10, 33),
(11, 34),
(11, 35),
(12, 36),
(12, 37),
(12, 38),
(12, 39),
(12, 40),
(12, 41),
(12, 42),
(13, 43),
(13, 44),
(14, 45),
(14, 46),
(14, 47),
(14, 48),
(14, 49),
(15, 50),
(15, 51),
(15, 52),
(15, 53),
(15, 54),
(15, 55),
(16, 52),
(16, 56),
(16, 57),
(16, 58),
(17, 58),
(17, 59),
(17, 60),
(17, 61),
(18, 62),
(18, 63),
(19, 62),
(19, 64),
(19, 65);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`, `slug`) VALUES
(5, 'Arbitrary cases in Bangladesh', 'arbitrary-cases-in-bangladesh'),
(6, 'ghost cases', 'ghost-cases'),
(7, 'politically motivated cases', 'politically-motivated-cases'),
(8, 'Bangladesh Police', 'bangladesh-police'),
(9, 'police accountability', 'police-accountability'),
(10, 'police reforms in Bangladesh', 'police-reforms-in-bangladesh'),
(11, 'Bangladesh mass uprising 2024', 'bangladesh-mass-uprising-2024'),
(12, 'reform agenda of the interim government of Bangladesh', 'reform-agenda-of-the-interim-government-of-bangladesh'),
(13, 'Yunus announces government sectors reforms', 'yunus-announces-government-sectors-reforms'),
(14, 'Yunus calls for unity', 'yunus-calls-for-unity'),
(15, 'appointment of ICT prosecutor', 'appointment-of-ict-prosecutor'),
(16, 'Arvind Kejriwal resignation', 'arvind-kejriwal-resignation'),
(17, 'Delhi Chief Minister news', 'delhi-chief-minister-news'),
(18, 'Aam Aadmi Party updates', 'aam-aadmi-party-updates'),
(19, 'Supreme Court bail Arvind Kejriwal', 'supreme-court-bail-arvind-kejriwal'),
(20, 'Kejriwal political future', 'kejriwal-political-future'),
(21, 'India political news', 'india-political-news'),
(22, 'England v Australia T20I series', 'england-v-australia-t20i-series'),
(23, 'cricket', 'cricket'),
(24, 'Tarafder Ruhul Amin', 'tarafder-ruhul-amin'),
(25, 'BFF', 'bff'),
(26, ' Bangladesh Football Federation', '-bangladesh-football-federation'),
(27, 'Ajay Jadeja', 'ajay-jadeja'),
(28, 'india vs bangladesh', 'india-vs-bangladesh'),
(29, 'US', 'us'),
(30, 'US Bangladesh', 'us-bangladesh'),
(31, 'Export', 'export'),
(32, 'BSEC', 'bsec'),
(33, 'Khan Brothers Woven PP', 'khan-brothers-woven-pp'),
(34, 'ashulia factory', 'ashulia-factory'),
(35, 'BGMEA', 'bgmea'),
(36, 'Punorbashon concert', 'punorbashon-concert'),
(37, 'Shohortoli', 'shohortoli'),
(38, 'Blue Jeans', 'blue-jeans'),
(39, 'Projonmo Baul', 'projonmo-baul'),
(40, 'Tarun Band', 'tarun-band'),
(41, 'Saima Sultana', 'saima-sultana'),
(42, 'RJ Neerob', 'rj-neerob'),
(43, 'bangladesh film censor board 2024', 'bangladesh-film-censor-board-2024'),
(44, 'new members of censor board', 'new-members-of-censor-board'),
(45, 'Bangladesh Artistes\' Welfare Trust reform', 'bangladesh-artistes\'-welfare-trust-reform'),
(46, 'Interim government of Bangladesh 2024', 'interim-government-of-bangladesh-2024'),
(47, 'Kanak Chapa', 'kanak-chapa'),
(48, 'Ashfaque Nipun', 'ashfaque-nipun'),
(49, 'Nawshaba', 'nawshaba'),
(50, 'summer fashion', 'summer-fashion'),
(51, 'summer fashion tips', 'summer-fashion-tips'),
(52, 'monsoon', 'monsoon'),
(53, 'comfortable clothing', 'comfortable-clothing'),
(54, 'Fashion & Styling', 'fashion-&-styling'),
(55, 'styling tips clothes', 'styling-tips-clothes'),
(56, 'skincare', 'skincare'),
(57, 'skincare routine', 'skincare-routine'),
(58, 'Fashion & Beauty', 'fashion-&-beauty'),
(59, 'makeup', 'makeup'),
(60, 'makeup tips and tricks', 'makeup-tips-and-tricks'),
(61, 'makeup techniques', 'makeup-techniques'),
(62, 'Campus', 'campus'),
(63, 'brain drain', 'brain-drain'),
(64, 'linkedin', 'linkedin'),
(65, 'Job', 'job');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','editor','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `status`, `image`, `role`, `phone`) VALUES
(1, 'Md. Hafizur Rahman', 'admin@mail.com', '$2y$10$N.dmFbekOmcQZBSNqD6edORG2bJRiz2bmhBUEgK2nRtaEK8Ayl2hq', 'active', 'uploads/user/66e9645d16fdb1726571613.png', 'admin', '01739981170'),
(2, 'Troy Hayden', 'user@mail.com', '$2y$10$oX4qdC1aB/WQ8CWDPTFOZO55jW5s1LJPPh0ntSymQ6nXcMdpwBPD6', 'active', NULL, 'user', NULL),
(3, 'Mr. Editor', 'editor@mail.com', '$2y$10$KkOS3Jend7l2wOgKt1oPXuudTdE9qfzv.X8c0CMdgslgUsUuS0Bce', 'active', NULL, 'editor', NULL),
(6, 'Md. Nadim', 'mohammadnadim6234@gmail.com', '$2y$10$tU8n3tJhVuH.oraARaMtmeFdqtS95S8UojdbIWpOEx6Kl56pAKtJe', 'active', NULL, 'editor', NULL);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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

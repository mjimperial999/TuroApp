-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2025 at 10:16 PM
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
-- Database: `turo_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievementconditiontype`
--

CREATE TABLE `achievementconditiontype` (
  `condition_type_id` int(11) NOT NULL,
  `condition_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `achievementconditiontype`
--

INSERT INTO `achievementconditiontype` (`condition_type_id`, `condition_name`) VALUES
(4, 'ACTIVITY_COMPLETION'),
(7, 'BADGES_EARNED'),
(5, 'FIRST_ASSESSMENT'),
(6, 'GRADE_ABOVE'),
(8, 'LEADERBOARD_RANK'),
(2, 'MODULE_COMPLETION'),
(1, 'POINTS'),
(3, 'QUIZ_SCORE');

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `achievement_id` varchar(255) NOT NULL,
  `achievement_name` varchar(255) NOT NULL,
  `achievement_description` text NOT NULL,
  `achievement_image` varchar(2048) DEFAULT NULL,
  `condition_type_id` int(11) NOT NULL,
  `condition_value` varchar(255) NOT NULL,
  `is_unlocked` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `activity_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `activity_type` enum('TUTORIAL','QUIZ','LECTURE') NOT NULL,
  `activity_name` varchar(255) NOT NULL,
  `activity_description` text DEFAULT NULL,
  `unlock_date` datetime NOT NULL,
  `deadline_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`activity_id`, `module_id`, `activity_type`, `activity_name`, `activity_description`, `unlock_date`, `deadline_date`) VALUES
('2b6bf879-4987-4c72-b171-0c511932dc58', '2p394p0', 'LECTURE', 'Introduction to Sets', 'Let\'s learn to define sets and understand the fundamentals of sets!', '2025-06-09 12:31:00', '2025-06-19 12:31:00'),
('2bb874bc-3b92-495c-9732-61ba16620927', '2p394p0', 'QUIZ', 'Types of Sets', 'Identify the type of the given set.', '2025-06-11 14:20:00', '2025-06-30 14:20:00'),
('3ae01643-7417-4447-87e4-deacc1ab716a', '2p394p0', 'QUIZ', 'Simple Addition', 'Select the correct answer for the question.', '2025-06-14 08:53:28', '2025-06-28 08:53:28'),
('56bfade8-cb9a-428f-8acb-48fe7208a5bb', '2p394p0', 'TUTORIAL', 'asdf', 'asdfasdf', '2025-06-12 14:56:00', '2025-06-20 14:57:00'),
('8073866c-607b-4c9d-acc0-9513e1738162', '2p394p0', 'QUIZ', 'Type of Sets', 'Identify the type of a set.', '2025-06-14 08:02:28', '2025-06-22 14:02:28'),
('99984e6a-092f-4e47-b5bb-b00a141190a4', '2p394p0', 'LECTURE', 'LOCKED', 'locked', '2025-06-09 14:52:55', '2025-06-12 14:52:55');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assessmentresult`
--

CREATE TABLE `assessmentresult` (
  `result_id` varchar(255) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `activity_id` varchar(255) NOT NULL,
  `score_percentage` double NOT NULL,
  `date_taken` datetime NOT NULL,
  `attempt_number` int(11) NOT NULL,
  `tier_level_id` int(11) DEFAULT NULL,
  `earned_points` int(11) NOT NULL,
  `is_kept` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessmentresult`
--

INSERT INTO `assessmentresult` (`result_id`, `student_id`, `module_id`, `activity_id`, `score_percentage`, `date_taken`, `attempt_number`, `tier_level_id`, `earned_points`, `is_kept`) VALUES
('685062f5f3baf', '202210383', '2p394p0', '2bb874bc-3b92-495c-9732-61ba16620927', 100, '2025-06-17 02:31:17', 1, 1, 3, 1),
('6850645324f32', '202210383', '2p394p0', '2bb874bc-3b92-495c-9732-61ba16620927', 100, '2025-06-17 02:37:07', 2, 1, 3, 0),
('6850695223f51', '202210383', '2p394p0', '2bb874bc-3b92-495c-9732-61ba16620927', 100, '2025-06-17 02:58:26', 3, 1, 3, 0),
('685069d9dca02', '202210383', '2p394p0', '2bb874bc-3b92-495c-9732-61ba16620927', 100, '2025-06-17 03:00:41', 4, 1, 3, 0),
('68506e6b01bf7', '202210383', '2p394p0', '3ae01643-7417-4447-87e4-deacc1ab716a', 80, '2025-06-17 03:20:11', 1, 1, 4, 0),
('68507088ac86a', '202210383', '2p394p0', '3ae01643-7417-4447-87e4-deacc1ab716a', 100, '2025-06-17 03:29:12', 2, 1, 5, 1),
('6850735130c54', '202210383', '2p394p0', '3ae01643-7417-4447-87e4-deacc1ab716a', 40, '2025-06-17 03:41:05', 3, 1, 2, 0),
('685074004e832', '202210383', '2p394p0', '3ae01643-7417-4447-87e4-deacc1ab716a', 60, '2025-06-17 03:44:00', 4, 1, 3, 0),
('685074104e6b4', '202210383', '2p394p0', '3ae01643-7417-4447-87e4-deacc1ab716a', 100, '2025-06-17 03:44:16', 5, 1, 5, 0),
('685075cb221db', '202210383', '2p394p0', '2bb874bc-3b92-495c-9732-61ba16620927', 100, '2025-06-17 03:51:39', 5, 1, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `assessmentresult_answers`
--

CREATE TABLE `assessmentresult_answers` (
  `result_id` varchar(255) NOT NULL,
  `question_id` varchar(255) NOT NULL,
  `option_id` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE `attachment` (
  `attachment_id` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_url` varchar(2048) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `mime_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `badges`
--

CREATE TABLE `badges` (
  `badge_id` varchar(255) NOT NULL,
  `badge_name` varchar(255) NOT NULL,
  `badge_description` text NOT NULL,
  `badge_image` varchar(2048) DEFAULT NULL,
  `points_required` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `badges`
--

INSERT INTO `badges` (`badge_id`, `badge_name`, `badge_description`, `badge_image`, `points_required`) VALUES
('1', 'Starting Run', 'Congrats Learner! You have earned 5 points!', 'https://thumbs.dreamstime.com/b/ui-badge-icon-modern-reward-button-design-award-medal-casino-bonus-futuristic-hud-grunge-royal-achievement-interface-sign-316977278.jpg', 5),
('2', 'Mathlete Apprentice', 'Earn 25 points', 'https://thumbs.dreamstime.com/b/ui-badge-icon-modern-reward-button-design-award-medal-casino-bonus-futuristic-hud-grunge-royal-achievement-interface-sign-316977278.jpg', 25),
('3', 'Budding Mathematician', 'Earn 50 points', 'https://thumbs.dreamstime.com/b/ui-badge-icon-modern-reward-button-design-award-medal-casino-bonus-futuristic-hud-grunge-royal-achievement-interface-sign-316977278.jpg', 50),
('4', 'Math Whiz', 'Earn 75 Points', 'https://thumbs.dreamstime.com/b/ui-badge-icon-modern-reward-button-design-award-medal-casino-bonus-futuristic-hud-grunge-royal-achievement-interface-sign-316977278.jpg', 75);

-- --------------------------------------------------------

--
-- Table structure for table `calendarevent`
--

CREATE TABLE `calendarevent` (
  `event_id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `date` datetime NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `is_urgent` tinyint(1) DEFAULT 0,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `calendarevent`
--

INSERT INTO `calendarevent` (`event_id`, `title`, `description`, `date`, `event_type_id`, `is_urgent`, `location`) VALUES
('2b6bf879-4987-4c72-b171-0c511932dc58', 'fasdf', 'asdf', '2025-06-07 15:46:43', 1, 0, 'sadf'),
('2bb874bc-3b92-495c-9732-61ba16620927', 'sadfa', 'asdfasdf', '2025-06-19 14:20:00', 2, 1, 'Good Shepard High School'),
('56bfade8-cb9a-428f-8acb-48fe7208a5bb', 'asdf', 'asdfasdf', '2025-06-12 14:56:00', 1, 0, 'Good Shepard High School');

-- --------------------------------------------------------

--
-- Table structure for table `contenttype`
--

CREATE TABLE `contenttype` (
  `content_type_id` int(11) NOT NULL,
  `content_type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contenttype`
--

INSERT INTO `contenttype` (`content_type_id`, `content_type_name`) VALUES
(2, 'PDF/DOCS'),
(1, 'TEXT'),
(3, 'VIDEO');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` varchar(255) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `teacher_id` varchar(255) DEFAULT NULL,
  `course_description` text DEFAULT NULL,
  `course_picture` varchar(255) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_code`, `course_name`, `teacher_id`, `course_description`, `course_picture`, `start_date`, `end_date`) VALUES
('13409504384', 'MATH101', 'Grade 7 Math', 'T2022123124', 'Let\'s Learn Math', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ6UNP6GoD9gDTZwWhn_GxRqU8rY9ATTIJtw&s', '2025-06-04', '2025-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `enrollment_id` varchar(255) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `enrollment_date` date NOT NULL,
  `isEnrolled` tinyint(1) NOT NULL DEFAULT 0,
  `finalGrade` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`enrollment_id`, `student_id`, `course_id`, `enrollment_date`, `isEnrolled`, `finalGrade`) VALUES
('wcasvsav', '202210383', '13409504384', '2025-06-05', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `eventtype`
--

CREATE TABLE `eventtype` (
  `event_type_id` int(11) NOT NULL,
  `event_type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eventtype`
--

INSERT INTO `eventtype` (`event_type_id`, `event_type_name`) VALUES
(5, 'CATCH_UP'),
(4, 'LONG_QUIZ'),
(1, 'MODULE'),
(3, 'PRACTICE_QUIZ'),
(6, 'SCREENING_EXAM'),
(2, 'SHORT_QUIZ');

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

CREATE TABLE `inbox` (
  `inbox_id` varchar(255) NOT NULL,
  `unread_count` int(11) NOT NULL DEFAULT 0,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inboxparticipant`
--

CREATE TABLE `inboxparticipant` (
  `inbox_id` varchar(255) NOT NULL,
  `participant_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lecture`
--

CREATE TABLE `lecture` (
  `activity_id` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `video_url` varchar(2048) DEFAULT NULL,
  `text_body` text DEFAULT NULL,
  `file_url` varchar(2048) DEFAULT NULL,
  `file_mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lecture`
--

INSERT INTO `lecture` (`activity_id`, `content_type_id`, `video_url`, `text_body`, `file_url`, `file_mime_type`, `file_name`) VALUES
('2b6bf879-4987-4c72-b171-0c511932dc58', 2, NULL, NULL, 'http://10.0.2.2/turo_app/api/v1/uploads/lec_6844312f934e9.pdf', 'application/pdf', 'dummy.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` varchar(255) NOT NULL,
  `inbox_id` varchar(255) NOT NULL,
  `sender_id` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messageattachment`
--

CREATE TABLE `messageattachment` (
  `message_id` varchar(255) NOT NULL,
  `attachment_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messageuserstate`
--

CREATE TABLE `messageuserstate` (
  `message_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `module_id` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`module_id`, `course_id`, `module_name`, `module_description`) VALUES
('2p394p0', '13409504384', 'Module 1 - Sets', 'Let\'s Learn Sets');

-- --------------------------------------------------------

--
-- Table structure for table `moduleprogress`
--

CREATE TABLE `moduleprogress` (
  `student_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `is_completed` tinyint(1) NOT NULL,
  `average_score` double NOT NULL,
  `tier_passed_id` int(11) DEFAULT NULL,
  `screening_exam_attempts` int(11) NOT NULL DEFAULT 0,
  `screening_exam_failed_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `option_id` varchar(255) NOT NULL,
  `question_id` varchar(255) NOT NULL,
  `option_text` varchar(500) NOT NULL,
  `is_correct` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`option_id`, `question_id`, `option_text`, `is_correct`) VALUES
('01459e34-955b-432e-926d-c3d616c95b7e', '40f470cf-3ae0-4d90-b07f-a0460585571f', '8', 1),
('10a81ead-e75f-4e8a-ad2b-4a9e8b754c0e', 'f811c4bb-6394-4875-b3ce-1c96ae533e11', 'Brandon Padigos', 1),
('26ca9787-bc3e-4474-babb-133649ec9005', '5fdb8545-4f6e-4a63-b97b-9fbc245f7ce0', '9', 0),
('2c14ff0c-3409-42fc-9845-8b3fb6537a57', '011749ab-7d17-4be7-a132-589bf3a2f542', 'Avril \"The Loverboy\" Abano', 1),
('2dbc7021-7325-4c01-a8ce-b7cd452fa75b', '11fe3ace-dc07-4ec3-9ffa-ca1880db1bd1', '110', 0),
('3ed20bb8-217b-4669-929c-caa1a75df550', '11fe3ace-dc07-4ec3-9ffa-ca1880db1bd1', '20', 1),
('4b1c764c-3e98-4a27-ba4d-e425c1f500dd', '1f863f70-8d26-4104-b2ea-6298898da355', '17', 0),
('53869557-108f-4e7b-9688-64c4bb5d535d', '8a7c443b-bf92-4ec7-818a-1c50ea86e1d3', '15', 0),
('637f6d79-8fad-4ad9-8259-23b88d2049e8', '1f863f70-8d26-4104-b2ea-6298898da355', '133', 0),
('6814b133-89ee-4ec2-af96-321124012c60', '11fe3ace-dc07-4ec3-9ffa-ca1880db1bd1', '100', 0),
('75708a46-7744-4856-b875-f56194a31d1e', '5fdb8545-4f6e-4a63-b97b-9fbc245f7ce0', '72', 0),
('7e360d6d-5b79-4d40-9cb3-d7387ba494d0', '11fe3ace-dc07-4ec3-9ffa-ca1880db1bd1', '1010', 0),
('81734e4e-78fc-430a-9bcc-14fdaea0864f', '754cfb37-1671-413e-a306-177ee5dfb105', 'Mary Jewel Imperial', 1),
('867f0d0b-46b0-44e7-8b98-3ec5be3d4f3f', '8a7c443b-bf92-4ec7-818a-1c50ea86e1d3', '12', 0),
('8c9c3898-47a8-4a3e-8171-d1be41522023', '1f863f70-8d26-4104-b2ea-6298898da355', '15', 0),
('9fc9e0a2-4d4f-47bf-baeb-7d6e52da198d', '754cfb37-1671-413e-a306-177ee5dfb105', 'Brandon Padigos', 0),
('a96b03cd-b0a9-4474-bc85-4a7fc10292d9', '011749ab-7d17-4be7-a132-589bf3a2f542', 'Brandon Padigos', 0),
('a9bcf117-824b-41d6-bd2b-3226bde487c3', 'f811c4bb-6394-4875-b3ce-1c96ae533e11', 'Avril Abano', 0),
('b3172526-270b-4a8c-a1f7-7a1382666ed9', '5fdb8545-4f6e-4a63-b97b-9fbc245f7ce0', '14', 1),
('b9323b5e-a2c4-4b17-9231-0e64186d2a42', '8a7c443b-bf92-4ec7-818a-1c50ea86e1d3', '18', 0),
('b9cb6951-a8c8-4656-9771-1a46521178a6', '11fe3ace-dc07-4ec3-9ffa-ca1880db1bd1', '011', 0),
('bd40a90e-26b4-411d-a605-dd69768b9e00', '40f470cf-3ae0-4d90-b07f-a0460585571f', '9', 0),
('bffa9e42-8c12-43e3-a656-1bdd9ae7dd8d', '8a7c443b-bf92-4ec7-818a-1c50ea86e1d3', '14', 1),
('cbfa9193-0939-4ffd-b299-ecb9c4f4d4b6', '5fdb8545-4f6e-4a63-b97b-9fbc245f7ce0', '5', 0),
('e0dad349-c9fa-4a88-8aa5-c3820dbe0c05', '40f470cf-3ae0-4d90-b07f-a0460585571f', '9', 0),
('f5241b06-675c-4af6-959e-daa14fabaf28', '40f470cf-3ae0-4d90-b07f-a0460585571f', '11', 0),
('f7b96a85-33f4-44b3-af1f-5f40373b1dd1', '1f863f70-8d26-4104-b2ea-6298898da355', '16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `user_id` varchar(255) NOT NULL,
  `code_hash` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `requested_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `question_id` varchar(255) NOT NULL,
  `question_text` text NOT NULL,
  `question_type_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `activity_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`question_id`, `question_text`, `question_type_id`, `score`, `activity_id`) VALUES
('011749ab-7d17-4be7-a132-589bf3a2f542', 'Who is the documentation leader of Venturepreneurs?', 1, 1, '2bb874bc-3b92-495c-9732-61ba16620927'),
('11fe3ace-dc07-4ec3-9ffa-ca1880db1bd1', '10 + 10 = ?', 1, 1, '3ae01643-7417-4447-87e4-deacc1ab716a'),
('1f863f70-8d26-4104-b2ea-6298898da355', '3 + 13 = ?', 1, 1, '3ae01643-7417-4447-87e4-deacc1ab716a'),
('40f470cf-3ae0-4d90-b07f-a0460585571f', '5 + 3 = ?', 1, 1, '3ae01643-7417-4447-87e4-deacc1ab716a'),
('5fdb8545-4f6e-4a63-b97b-9fbc245f7ce0', '7 * 2 = ?', 1, 1, '3ae01643-7417-4447-87e4-deacc1ab716a'),
('754cfb37-1671-413e-a306-177ee5dfb105', 'Who is the mobile app programmer for Venturepreneurs?', 1, 1, '2bb874bc-3b92-495c-9732-61ba16620927'),
('8a7c443b-bf92-4ec7-818a-1c50ea86e1d3', '11 + 3 = ?', 1, 1, '3ae01643-7417-4447-87e4-deacc1ab716a'),
('f811c4bb-6394-4875-b3ce-1c96ae533e11', 'Who is the Project Manager for Venturepreneurs?', 1, 1, '2bb874bc-3b92-495c-9732-61ba16620927');

-- --------------------------------------------------------

--
-- Table structure for table `questiontype`
--

CREATE TABLE `questiontype` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questiontype`
--

INSERT INTO `questiontype` (`type_id`, `type_name`) VALUES
(1, 'MULTIPLE_CHOICE'),
(2, 'SHORT_ANSWER');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `activity_id` varchar(255) NOT NULL,
  `number_of_attempts` int(11) NOT NULL,
  `quiz_type_id` int(11) NOT NULL,
  `time_limit` int(11) NOT NULL,
  `number_of_questions` int(11) NOT NULL,
  `overall_points` int(11) NOT NULL,
  `has_answers_shown` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`activity_id`, `number_of_attempts`, `quiz_type_id`, `time_limit`, `number_of_questions`, `overall_points`, `has_answers_shown`) VALUES
('2bb874bc-3b92-495c-9732-61ba16620927', 5, 1, 1800, 3, 3, 1),
('3ae01643-7417-4447-87e4-deacc1ab716a', 5, 3, 1000, 5, 5, 0),
('8073866c-607b-4c9d-acc0-9513e1738162', 99999, 2, 99999, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiztype`
--

CREATE TABLE `quiztype` (
  `quiz_type_id` int(11) NOT NULL,
  `quiz_type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiztype`
--

INSERT INTO `quiztype` (`quiz_type_id`, `quiz_type_name`) VALUES
(3, 'LONG'),
(2, 'PRACTICE'),
(4, 'SCREENING_EXAM'),
(1, 'SHORT');

-- --------------------------------------------------------

--
-- Table structure for table `screeningtier`
--

CREATE TABLE `screeningtier` (
  `tier_id` int(11) NOT NULL,
  `tier_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `screeningtier`
--

INSERT INTO `screeningtier` (`tier_id`, `tier_name`) VALUES
(1, 'TIER_1'),
(2, 'TIER_2'),
(3, 'TIER_3');

-- --------------------------------------------------------

--
-- Table structure for table `shopitem`
--

CREATE TABLE `shopitem` (
  `item_id` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_description` text NOT NULL,
  `item_picture` varchar(2048) NOT NULL,
  `points_required` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `user_id` varchar(255) NOT NULL,
  `isCatchUp` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`user_id`, `isCatchUp`) VALUES
('202210383', 1);

-- --------------------------------------------------------

--
-- Table structure for table `studentprogress`
--

CREATE TABLE `studentprogress` (
  `student_id` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `total_points` int(11) NOT NULL,
  `average_score` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studentprogress`
--

INSERT INTO `studentprogress` (`student_id`, `course_id`, `total_points`, `average_score`) VALUES
('202210383', '13409504384', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_achievements`
--

CREATE TABLE `student_achievements` (
  `student_id` varchar(255) NOT NULL,
  `achievement_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_badges`
--

CREATE TABLE `student_badges` (
  `student_id` varchar(255) NOT NULL,
  `badge_id` varchar(255) NOT NULL,
  `is_unlocked` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_badges`
--

INSERT INTO `student_badges` (`student_id`, `badge_id`, `is_unlocked`) VALUES
('202210383', '1', 1),
('202210383', '2', 0),
('202210383', '3', 0),
('202210383', '4', 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_shopitem`
--

CREATE TABLE `student_shopitem` (
  `student_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `purchase_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`user_id`) VALUES
('T2022123124');

-- --------------------------------------------------------

--
-- Table structure for table `tutorial`
--

CREATE TABLE `tutorial` (
  `activity_id` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `video_url` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tutorial`
--

INSERT INTO `tutorial` (`activity_id`, `content_type_id`, `video_url`) VALUES
('56bfade8-cb9a-428f-8acb-48fe7208a5bb', 3, 'https://www.youtube.com/watch?v=FbtRzerW3xw&t=71s');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `profile_pic` varchar(2048) DEFAULT NULL,
  `agreed_to_terms` tinyint(1) NOT NULL DEFAULT 0,
  `requires_password_change` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `email`, `password_hash`, `role_id`, `profile_pic`, `agreed_to_terms`, `requires_password_change`) VALUES
('202210383', 'Sample', 'Student', 'codegeassislife@gmail.com', '$2y$10$TrI2gTU3iNAcsR3bo4Q5RuoCRc7nDDuPiLDCHGSp4BQwUk9sOuX96', 1, 'https://static.wikia.nocookie.net/deathbattle/images/b/b4/Portrait.cloud.png/revision/latest?cb=20230923010647', 1, 0),
('T2022123124', 'Teacher', 'Lastname', 'teach@gmail.com', '$2y$10$d9Qa5nvir2OtzJVOj2tFxeryAl93eWK6Wulihq3BL8107emJqZJbW', 2, 'https://cdn.mos.cms.futurecdn.net/z2fxx8VpPisBLfyjaYd8d5.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE `userrole` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`role_id`, `role_name`) VALUES
(3, 'ADMIN'),
(1, 'STUDENT'),
(2, 'TEACHER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievementconditiontype`
--
ALTER TABLE `achievementconditiontype`
  ADD PRIMARY KEY (`condition_type_id`),
  ADD UNIQUE KEY `condition_name` (`condition_name`);

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`achievement_id`),
  ADD KEY `condition_type_id` (`condition_type_id`);

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `assessmentresult`
--
ALTER TABLE `assessmentresult`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `activity_id` (`activity_id`),
  ADD KEY `tier_level_id` (`tier_level_id`);

--
-- Indexes for table `assessmentresult_answers`
--
ALTER TABLE `assessmentresult_answers`
  ADD PRIMARY KEY (`result_id`,`question_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `option_id` (`option_id`);

--
-- Indexes for table `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`attachment_id`);

--
-- Indexes for table `badges`
--
ALTER TABLE `badges`
  ADD PRIMARY KEY (`badge_id`);

--
-- Indexes for table `calendarevent`
--
ALTER TABLE `calendarevent`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `event_type_id` (`event_type_id`);

--
-- Indexes for table `contenttype`
--
ALTER TABLE `contenttype`
  ADD PRIMARY KEY (`content_type_id`),
  ADD UNIQUE KEY `content_type_name` (`content_type_name`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `course_code` (`course_code`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `eventtype`
--
ALTER TABLE `eventtype`
  ADD PRIMARY KEY (`event_type_id`),
  ADD UNIQUE KEY `event_type_name` (`event_type_name`);

--
-- Indexes for table `inbox`
--
ALTER TABLE `inbox`
  ADD PRIMARY KEY (`inbox_id`);

--
-- Indexes for table `inboxparticipant`
--
ALTER TABLE `inboxparticipant`
  ADD PRIMARY KEY (`inbox_id`,`participant_id`),
  ADD KEY `participant_id` (`participant_id`);

--
-- Indexes for table `lecture`
--
ALTER TABLE `lecture`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `content_type_id` (`content_type_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `inbox_id` (`inbox_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `messageattachment`
--
ALTER TABLE `messageattachment`
  ADD PRIMARY KEY (`message_id`,`attachment_id`),
  ADD KEY `attachment_id` (`attachment_id`);

--
-- Indexes for table `messageuserstate`
--
ALTER TABLE `messageuserstate`
  ADD PRIMARY KEY (`message_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`module_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `moduleprogress`
--
ALTER TABLE `moduleprogress`
  ADD PRIMARY KEY (`student_id`,`module_id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `tier_passed_id` (`tier_passed_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `activity_id` (`activity_id`),
  ADD KEY `question_type_id` (`question_type_id`);

--
-- Indexes for table `questiontype`
--
ALTER TABLE `questiontype`
  ADD PRIMARY KEY (`type_id`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `quiz_type_id` (`quiz_type_id`);

--
-- Indexes for table `quiztype`
--
ALTER TABLE `quiztype`
  ADD PRIMARY KEY (`quiz_type_id`),
  ADD UNIQUE KEY `quiz_type_name` (`quiz_type_name`);

--
-- Indexes for table `screeningtier`
--
ALTER TABLE `screeningtier`
  ADD PRIMARY KEY (`tier_id`),
  ADD UNIQUE KEY `tier_name` (`tier_name`);

--
-- Indexes for table `shopitem`
--
ALTER TABLE `shopitem`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `studentprogress`
--
ALTER TABLE `studentprogress`
  ADD PRIMARY KEY (`student_id`,`course_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `student_achievements`
--
ALTER TABLE `student_achievements`
  ADD PRIMARY KEY (`student_id`,`achievement_id`),
  ADD KEY `achievement_id` (`achievement_id`);

--
-- Indexes for table `student_badges`
--
ALTER TABLE `student_badges`
  ADD PRIMARY KEY (`student_id`,`badge_id`),
  ADD KEY `badge_id` (`badge_id`);

--
-- Indexes for table `student_shopitem`
--
ALTER TABLE `student_shopitem`
  ADD PRIMARY KEY (`student_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tutorial`
--
ALTER TABLE `tutorial`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `content_type_id` (`content_type_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievementconditiontype`
--
ALTER TABLE `achievementconditiontype`
  MODIFY `condition_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contenttype`
--
ALTER TABLE `contenttype`
  MODIFY `content_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `eventtype`
--
ALTER TABLE `eventtype`
  MODIFY `event_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `questiontype`
--
ALTER TABLE `questiontype`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quiztype`
--
ALTER TABLE `quiztype`
  MODIFY `quiz_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `screeningtier`
--
ALTER TABLE `screeningtier`
  MODIFY `tier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userrole`
--
ALTER TABLE `userrole`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `achievements`
--
ALTER TABLE `achievements`
  ADD CONSTRAINT `achievements_ibfk_1` FOREIGN KEY (`condition_type_id`) REFERENCES `achievementconditiontype` (`condition_type_id`);

--
-- Constraints for table `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`) ON DELETE CASCADE;

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `assessmentresult`
--
ALTER TABLE `assessmentresult`
  ADD CONSTRAINT `assessmentresult_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assessmentresult_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`),
  ADD CONSTRAINT `assessmentresult_ibfk_3` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`),
  ADD CONSTRAINT `assessmentresult_ibfk_4` FOREIGN KEY (`tier_level_id`) REFERENCES `screeningtier` (`tier_id`);

--
-- Constraints for table `assessmentresult_answers`
--
ALTER TABLE `assessmentresult_answers`
  ADD CONSTRAINT `assessmentresult_answers_ibfk_1` FOREIGN KEY (`result_id`) REFERENCES `assessmentresult` (`result_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assessmentresult_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`),
  ADD CONSTRAINT `assessmentresult_answers_ibfk_3` FOREIGN KEY (`option_id`) REFERENCES `options` (`option_id`);

--
-- Constraints for table `calendarevent`
--
ALTER TABLE `calendarevent`
  ADD CONSTRAINT `calendarevent_ibfk_1` FOREIGN KEY (`event_type_id`) REFERENCES `eventtype` (`event_type_id`),
  ADD CONSTRAINT `calendarevent_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `activity` (`activity_id`) ON DELETE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE;

--
-- Constraints for table `inboxparticipant`
--
ALTER TABLE `inboxparticipant`
  ADD CONSTRAINT `inboxparticipant_ibfk_1` FOREIGN KEY (`inbox_id`) REFERENCES `inbox` (`inbox_id`),
  ADD CONSTRAINT `inboxparticipant_ibfk_2` FOREIGN KEY (`participant_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `lecture`
--
ALTER TABLE `lecture`
  ADD CONSTRAINT `lecture_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lecture_ibfk_2` FOREIGN KEY (`content_type_id`) REFERENCES `contenttype` (`content_type_id`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`inbox_id`) REFERENCES `inbox` (`inbox_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `messageattachment`
--
ALTER TABLE `messageattachment`
  ADD CONSTRAINT `messageattachment_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `message` (`message_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messageattachment_ibfk_2` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`attachment_id`) ON DELETE CASCADE;

--
-- Constraints for table `messageuserstate`
--
ALTER TABLE `messageuserstate`
  ADD CONSTRAINT `messageuserstate_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `message` (`message_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messageuserstate_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `module_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE;

--
-- Constraints for table `moduleprogress`
--
ALTER TABLE `moduleprogress`
  ADD CONSTRAINT `moduleprogress_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `moduleprogress_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`),
  ADD CONSTRAINT `moduleprogress_ibfk_3` FOREIGN KEY (`tier_passed_id`) REFERENCES `screeningtier` (`tier_id`);

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE CASCADE;

--
-- Constraints for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `question_ibfk_2` FOREIGN KEY (`question_type_id`) REFERENCES `questiontype` (`type_id`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_ibfk_2` FOREIGN KEY (`quiz_type_id`) REFERENCES `quiztype` (`quiz_type_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `studentprogress`
--
ALTER TABLE `studentprogress`
  ADD CONSTRAINT `studentprogress_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `studentprogress_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE;

--
-- Constraints for table `student_achievements`
--
ALTER TABLE `student_achievements`
  ADD CONSTRAINT `student_achievements_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_achievements_ibfk_2` FOREIGN KEY (`achievement_id`) REFERENCES `achievements` (`achievement_id`) ON DELETE CASCADE;

--
-- Constraints for table `student_badges`
--
ALTER TABLE `student_badges`
  ADD CONSTRAINT `student_badges_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_badges_ibfk_2` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`badge_id`) ON DELETE CASCADE;

--
-- Constraints for table `student_shopitem`
--
ALTER TABLE `student_shopitem`
  ADD CONSTRAINT `student_shopitem_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_shopitem_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `shopitem` (`item_id`);

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `tutorial`
--
ALTER TABLE `tutorial`
  ADD CONSTRAINT `tutorial_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tutorial_ibfk_2` FOREIGN KEY (`content_type_id`) REFERENCES `contenttype` (`content_type_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `userrole` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

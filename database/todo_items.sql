/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `todo_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `description` text,
  `status` enum('Doing','Done','Deleted') DEFAULT 'Doing',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `todo_items_chk_1` CHECK (json_valid(`image`))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `todo_items` (`id`, `title`, `image`, `description`, `status`, `created_at`, `updated_at`) VALUES
('This is task 1', NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 'Doing', '2023-09-02 14:43:52', '2023-09-02 14:43:52');
INSERT INTO `todo_items` (`id`, `title`, `image`, `description`, `status`, `created_at`, `updated_at`) VALUES
('This is task 2', NULL, 'when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged', 'Deleted', '2023-09-02 14:43:52', '2023-09-02 14:43:52');
INSERT INTO `todo_items` (`id`, `title`, `image`, `description`, `status`, `created_at`, `updated_at`) VALUES
('This is task 3 ', NULL, 'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Done', '2023-09-02 14:50:06', '2023-09-02 14:50:06');
INSERT INTO `todo_items` (`id`, `title`, `image`, `description`, `status`, `created_at`, `updated_at`) VALUES
('This is task 4', NULL, 't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using', 'Deleted', '2023-09-02 14:50:06', '2023-09-02 14:50:06'),
('This is task 5', NULL, 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for', 'Done', '2023-09-02 14:51:00', '2023-09-02 14:51:00'),
('This is task 6', NULL, ' Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Doing', '2023-09-02 14:51:00', '2023-09-02 14:51:00'),
('This is a new item 7', NULL, 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old', 'Done', '2023-09-04 15:20:13', '2023-09-04 15:20:13'),
('This is task 8', NULL, 'Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur', 'Deleted', '2023-09-04 15:34:50', '2023-09-04 15:34:50'),
('This is a new task 12', NULL, 'looked up one of the more obscure Latin words, consectetur', 'Doing', '2023-09-11 09:57:53', '2023-09-11 09:57:53'),
('This is a task 13', NULL, 'jack ryan tom clancy', 'Deleted', '2023-09-12 08:09:38', '2023-09-12 08:09:38');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
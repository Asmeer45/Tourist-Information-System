-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2024 at 12:27 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourist_information`
--

-- --------------------------------------------------------

--
-- Table structure for table `landmarks`
--

CREATE TABLE `landmarks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `multimedia_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `landmarks`
--

INSERT INTO `landmarks` (`id`, `name`, `description`, `latitude`, `longitude`, `multimedia_url`) VALUES
(3, 'Colombo', 'Colombo is the executive and judicial capital and largest city of Sri Lanka by population. According to the Brookings Institution, the Colombo metropolitan area has a population of 5.6 million, and 752,993 in the Municipality. It is the financial centre of the island and a tourist destination.', '6.9271° N', '79.8612° E.', 'https://en.wikipedia.org/wiki/Colombo'),
(4, 'Kandy ', 'Kandy is a large city in central Sri Lanka. It\'s set on a plateau surrounded by mountains, which are home to tea plantations and biodiverse rainforest. The city\'s heart is scenic Kandy Lake (Bogambara Lake), which is popular for strolling.', '7.2906° N', '80.6337° E.', 'https://en.wikipedia.org/wiki/Kandy'),
(5, 'Galle', 'Galle is a city on the southwest coast of Sri Lanka. It’s known for Galle Fort, the fortified old city founded by Portuguese colonists in the 16th century. Stone sea walls, expanded by the Dutch, encircle car-free streets with architecture reflecting Portuguese, Dutch and British rule.', '6.0328° N ', '80.2170° E', 'https://en.wikipedia.org/wiki/Galle'),
(6, 'Trincomalee', 'Trincomalee is a port city on the northeast coast of Sri Lanka. Set on a peninsula, Fort Frederick was built by the Portuguese in the 17th century. Within its grounds, the grand Koneswaram Temple stands on Swami Rock cliff, a popular vantage point for blue-whale watching.', '8.5714° N ', '81.2330° E', 'https://en.wikipedia.org/wiki/Trincomalee'),
(7, 'Anuradhapura', 'Anuradhapura is a major city located in the north central plain of Sri Lanka. It is the capital city of North Central Province and the capital of Anuradhapura District. The city lies 205 kilometers north of the current capital of Colombo in the North Central Province', '8.3110° N', '80.4037° E', 'https://en.wikipedia.org/wiki/Anuradhapura');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `phone`, `email`) VALUES
(1, 'user', '1234', '0723796453', 'mohamedasmeer325@gmail.com'),
(2, 'nijaaadh', '123', '0723796453', 'mohamedasmeer123@gmail.com'),
(3, 'Asmeer', '1245', '0723796453', 'mohamedasmeer123@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `landmarks`
--
ALTER TABLE `landmarks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `landmarks`
--
ALTER TABLE `landmarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

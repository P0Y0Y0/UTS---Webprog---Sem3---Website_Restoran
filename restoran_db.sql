-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2023 at 01:43 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restoran_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'admin_utama', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(3, 'admin_uts', 'd0abf03232e894ce83c59fdc6e34063ff8675f90'),
(4, 'admin_restoran', 'f828f025641d44980f2420aa503207db25b03ae7');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(14, 9, 13, 'Dorayaki', 3, 1, 'dorayaki.png'),
(15, 9, 16, 'Sushi Platter', 7, 2, 'sushi.png');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(1, 10, 'pe tiga', 'pelanggan3@gmail.com', '123686', 'enak'),
(2, 0, 'duaaaa', 'pelanggan2@gmail.com', '1234567', 'good');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `first_name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(1, 1, 'pelanggan', '01234567', 'pelanggan@gmail.com', 'credit card', '3, 2, avenue park, yse, abc, er, us - 123456', 'Pepperoni Pizza (5 x 1) - Ice Cream (2 x 2) - ', 9, '2023-10-21', 'completed'),
(2, 11, 'pe ', '2353452656', 'pelanggan7@gmail.com', 'paypal', '3, 2, avenue park, KABUPATEN TANGERANG, KABUPATEN TANGERANG, er, Indonesia - 123456', 'Steak (5 x 1) - Beef Burger (6 x 1) - ', 11, '2023-10-22', 'completed'),
(3, 11, 'pe ', '2353452656', 'pelanggan7@gmail.com', 'cash on delivery', '3, 2, avenue park, KABUPATEN TANGERANG, KABUPATEN TANGERANG, er, Indonesia - 123456', 'Ice Cream (2 x 1) - Lime (2 x 1) - ', 4, '2023-10-22', 'completed'),
(4, 8, 'pelanggan ', '000000', 'pelanggan@gmail.com', 'credit card', '3, 2, avenue park, fajfn, afreger, er, Indonesia - 111111', 'Steak (5 x 1) - ', 5, '2023-10-22', 'completed'),
(5, 8, 'pelanggan', '000000', 'pelanggan@gmail.com', 'credit card', '3, 2, avenue park, fajfn, afreger, er, Indonesia - 111111', 'Ice Cream (2 x 1) - Orange Juice (1 x 1) - ', 3, '2023-10-22', 'completed'),
(6, 12, 'bbb', '11221122', 'aaabbb@gmail.com', 'credit card', '5, 4, aa, bb, cc, dd, ee - 846503', 'Steak (5 x 2) - ', 10, '2023-10-22', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`, `description`) VALUES
(12, 'Taiyaki ', 'desserts', 3, 'taiyaki.png', 'This Japanese Dessert Starts With a Baked Taiyaki Fish - Shaped Pastry, Crispy on the Outside and Soft On The Inside. '),
(13, 'Dorayaki', 'desserts', 3, 'dorayaki.png', 'We Craft Two Fluffy, Golden Pancakes, Just the right balance of sweet and slightly savory.'),
(14, 'Daifuku', 'desserts', 2, 'daifuku.png', 'soft and chewy rice cake are filled with sweet and velvety fillings, making each bites a delightful experience.'),
(15, 'Purin', 'desserts', 2, 'purin.png', 'Purin appears as a golden, delicates dome of caramel custard, gently trembling with every movement.'),
(16, 'Sushi Platter', 'main dish', 7, 'sushi.png', 'Savor the freshness of melticulously selected fish, such as buttery salmon, delicate tuna, and sulcculent shrimp, and seasoned vinegared rice.'),
(17, 'Teriyaki Chicken', 'main dish', 5, 'chicken-teriyaki.png', 'tender, juicy chicken breast or thigh is marinated in a sweet and savory teriyaki sauce, than grilled to perfection.'),
(18, 'Curry Chicken', 'main dish', 5, 'curry.png', 'Our curry sauce is a harmonious blend of earthy spices, including turmeric, cumin, coriander, and touch of chili for a gentle kick. '),
(19, 'Ramen Noodles', 'main dish', 6, 'ramen.png', 'Our ramen starts with a rich and aromatic broth, simmered to perfection. The steaming broth is ladled over a heaving portion of springy wheat noodles.'),
(20, 'Yuzu Tea', 'drinks', 2, 'yuzu-tea.png', 'A sweet and tangy citrus tea made from the yuzu fruit, japanese citrus.'),
(21, 'Matcha', 'drinks', 2, 'matcha.png', 'Finely ground, vibrant green tea powder with a unique, slightly bitter taste often used in traditional tea ceremonies.'),
(22, 'Sobacha', 'drinks', 2, 'sobacha.png', 'A roasted buckwheat tea that has a nutty flavour and is often served as a caffein- free option.'),
(23, 'Aojiru', 'drinks', 3, 'aojiru.png', 'Greentea vegetable juice often consumed for its health benefits, made from ingredients like spinach, and green tea.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `date_of_birth` date NOT NULL DEFAULT '1970-01-01',
  `email` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `address` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `email`, `number`, `password`, `address`) VALUES
(8, 'pelanggan', 'satu', 'Male', '1970-01-01', 'pelanggan@gmail.com', '000000', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3, 2, avenue park, fajfn, afreger, er, Indonesia - 111111'),
(9, 'all', 'naa', 'Female', '2023-10-05', 'pelanggan2@gmail.com', '111234', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 'Ban, 12/54, 22, KABUPATEN TANGERANG, Banten, 32313, Indonesia - 111111'),
(10, 'pe', 'tiga', 'Female', '2023-10-13', 'pelanggan11@gmail.com', '1236864', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', ''),
(11, 'pe', 'dua', 'Male', '2023-10-06', 'pelanggan0@gmail.com', '2353452656', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '3, 2, avenue park, KABUPATEN TANGERANG, KABUPATEN TANGERANG, er, Indonesia - 123456'),
(12, 'bbb', 'aaa', 'Male', '2023-10-07', 'aaabbb@gmail.com', '11221122', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '5, 4, aa, bb, cc, dd, ee - 846503');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
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
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

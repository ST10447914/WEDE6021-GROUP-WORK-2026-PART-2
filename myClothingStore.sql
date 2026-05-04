-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2026 at 08:35 PM
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
-- Database: `clothingstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `order_id`, `address`, `city`, `postal_code`, `contact_number`) VALUES
(1, 1, '123 Main St', 'Pretoria', '0001', '0712345678'),
(2, 2, '45 Park Ave', 'Johannesburg', '2000', '0723456789'),
(3, 3, '78 Hill Rd', 'Durban', '4000', '0734567890'),
(4, 4, '22 Beach Rd', 'Cape Town', '8000', '0745678901'),
(5, 5, '10 City Rd', 'Bloemfontein', '9300', '0756789012');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `message_text` text DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `sender_id`, `receiver_id`, `message_text`, `timestamp`) VALUES
(1, 1, 2, 'Is this item still available?', '2026-05-04 20:29:23'),
(2, 2, 1, 'Yes it is available', '2026-05-04 20:29:23'),
(3, 3, 4, 'Can you lower the price?', '2026-05-04 20:29:23'),
(4, 4, 3, 'Sure, I can give discount', '2026-05-04 20:29:23'),
(5, 5, 2, 'When can you ship it?', '2026-05-04 20:29:23');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `order_status` enum('pending','shipped','delivered') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `total_price`, `order_status`) VALUES
(1, 1, 1, 250.00, 'pending'),
(2, 2, 2, 180.00, 'shipped'),
(3, 3, 3, 300.00, 'delivered'),
(4, 4, 4, 150.00, 'pending'),
(5, 5, 5, 220.00, 'shipped');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `condition_item` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `status` enum('available','sold') DEFAULT 'available',
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `category`, `size`, `brand`, `condition_item`, `price`, `seller_id`, `status`, `image`) VALUES
(1, 'Vintage Jacket', 'Stylish jacket', 'Jackets', 'M', 'Nike', 'Good', 250.00, 1, 'available', 'jacket.jpg'),
(2, 'Denim Jeans', 'Blue jeans', 'Bottoms', 'L', 'Levis', 'Good', 180.00, 1, 'available', 'jeans.jpg'),
(3, 'Hoodie', 'Warm hoodie', 'Tops', 'M', 'Adidas', 'New', 300.00, 2, 'available', 'hoodie.jpg'),
(4, 'Dress', 'Summer dress', 'Dresses', 'S', 'Zara', 'Good', 150.00, 2, 'available', 'dress.jpg'),
(5, 'Sneakers', 'Casual shoes', 'Shoes', '8', 'Nike', 'Good', 220.00, 3, 'available', 'shoes.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `seller_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `verification_status` enum('pending','approved') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`seller_id`, `user_id`, `contact_number`, `address`, `verification_status`) VALUES
(1, 1, '0712345678', 'Pretoria', 'approved'),
(2, 2, '0723456789', 'Johannesburg', 'approved'),
(3, 3, '0734567890', 'Durban', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('pending','verified') DEFAULT 'pending',
  `role` enum('buyer','admin') DEFAULT 'buyer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `username`, `password`, `status`, `role`) VALUES
(1, 'John Doe', 'john@mail.com', 'john123', '7c6a180b36896a0a8c02787eeafb0e4c', 'verified', 'buyer'),
(2, 'Jane Smith', 'jane@mail.com', 'jane123', '6cb75f652a9b52798eb6cf2201057c73', 'verified', 'buyer'),
(3, 'Mike Brown', 'mike@mail.com', 'mike123', '819b0643d6b89dc9b579fdfc9094f28e', 'verified', 'buyer'),
(4, 'Sara Khan', 'sara@mail.com', 'sara123', '34cc93ece0ba9e3f6f235d4af979b16c', 'pending', 'buyer'),
(5, 'Leo King', 'leo@mail.com', 'leo123', 'db0edd04aaac4506f7edab03ac855d56', 'verified', 'buyer'),
(6, 'Admin', 'admin@mail.com', 'admin', '0192023a7bbd73250516f069df18b500', 'verified', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`seller_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`);

--
-- Constraints for table `sellers`
--
ALTER TABLE `sellers`
  ADD CONSTRAINT `sellers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

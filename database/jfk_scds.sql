-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2015 at 11:25 AM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jfk_scds`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_first_name` text,
  `staff_last_name` text,
  `staff_position` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(45) DEFAULT NULL,
  `donation_id` int(11) NOT NULL,
  `purchase_details_id` int(11) NOT NULL,
  `purchase_details_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`donation_id`,`purchase_details_id`,`purchase_details_user_id`),
  KEY `fk_country_donation1_idx` (`donation_id`),
  KEY `fk_country_purchase_details1_idx` (`purchase_details_id`,`purchase_details_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE IF NOT EXISTS `donation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `card_num` varchar(45) NOT NULL,
  `expiry_date` date NOT NULL,
  `ccv` varchar(45) NOT NULL,
  `first_name` text NOT NULL,
  `middle_name` text,
  `last_name` text NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_donation_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`id`, `amount`, `card_num`, `expiry_date`, `ccv`, `first_name`, `middle_name`, `last_name`, `email`, `phone_number`, `user_id`) VALUES
(1, 100, '123590', '0000-00-00', 'sdfsdf324', 'qwerty', 'qwerty', 'qwerty', 'qwerty@yahoo.com', '123456789009', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE IF NOT EXISTS `phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_type` varchar(45) DEFAULT NULL,
  `donation_id` int(11) NOT NULL,
  `purchase_details_id` int(11) NOT NULL,
  `purchase_details_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`donation_id`,`purchase_details_id`,`purchase_details_user_id`),
  KEY `fk_phone_donation1_idx` (`donation_id`),
  KEY `fk_phone_purchase_details1_idx` (`purchase_details_id`,`purchase_details_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(45) DEFAULT NULL,
  `price` decimal(2,0) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `purchase_details_id` int(11) NOT NULL,
  `purchase_details_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`purchase_details_id`,`purchase_details_user_id`),
  KEY `fk_products_purchase_details1_idx` (`purchase_details_id`,`purchase_details_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE IF NOT EXISTS `purchase_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_num` varchar(45) NOT NULL,
  `expiry_date` date NOT NULL,
  `ccv` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_purchase_details_user1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subsciber`
--

CREATE TABLE IF NOT EXISTS `subsciber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `subscriber_email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `subsciber`
--

INSERT INTO `subsciber` (`id`, `first_name`, `last_name`, `subscriber_email`) VALUES
(1, 'Lois Anne', 'Logronio', 'lglogronio@student.apc.edu.ph'),
(2, 'Katherine Alexandre', 'Mayo', 'kdmayo@student.apc.edu.ph'),
(3, 'Renon Eroll', 'Dadulla', 'redadulla@apc.edu.ph'),
(4, 'Farrah', 'Gonzales', 'farrag@hotmail.com'),
(5, 'Maria Perla', 'Logronio', 'mariap@yahoo.com'),
(6, 'Erika', 'Hidalgo', 'ecchidalgo@student.apc.edu.ph'),
(7, 'Arianne Bianca', 'Papna', 'afpapna@student.apc.edu.ph'),
(8, 'Juli Ann', 'Santiago', 'jasantiago@gmail.com'),
(9, 'Jewel John Allen', 'Nadua', 'kodykwon@gmail.com'),
(10, 'Keemee', 'Gonzales', 'monkeygurl@gmail.com'),
(11, 'Krizia', 'Gonzales', 'Kriziag@rocketmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `contact_Number` varchar(45) DEFAULT NULL,
  `usercol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `first_name`, `last_name`, `birthdate`, `address`, `contact_Number`, `usercol`) VALUES
(1, 'lglogronio', '3mwI1SH_Gp9yRUiVKPGaOz_KUd9L9hMv', '$2y$13$fQfb2h1I53zBlmmI73hFCuTYKL2byDziz/WBEBAgVQm3J.FsaqTiO', NULL, 'lglogronio@student.apc.edu.ph', 10, 1425718432, 1425718432, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'root', 'Q27ThgkBRwtNVFP5NK_vkWm4pkt9YJSg', '$2y$13$Ubluv1cdvgQsBr9NkyaHF.ZsnWfC/4nI6waILaWut5TAQcxFZIJti', NULL, 'ecdadlla@gmail.com', 10, 1425891971, 1425891971, 'Renon', 'Dadulla', '2015-01-01', 'Blk 4 Lot 18 Ep Village', '09123345678', NULL),
(4, 'lloisanne', 'XH7ZUnk4zU6qspmrM3SFACXSEkSNgLL5', '$2y$13$CsFz1OVUsEJbnRMhnlc6DOH2Kx4kjLyKmf9QduRR8AwfIedZR0a2y', NULL, 'lloisanne@yahoo.com', 10, 1426119427, 1426119427, 'Lois Anne', 'Logronio', '0000-00-00', 'Sangley Point Cavite City', '09441234567', NULL),
(5, 'administrator', 'uEqnRjjRAGPqRiiejrW1avXwvqyo9Z1n', '$2y$13$h5a.D/hs.DTe6/YA9caMR.pPvKtxT/lVeFLyI0qpX78wZbJpm6wrq', NULL, 'administrator@admin.com', 10, 1426149296, 1426149296, 'admin', 'istrator', '0000-00-00', 'AFP Housing Taguig City', '09123456789', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE IF NOT EXISTS `volunteer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `volunteer_email` varchar(45) NOT NULL,
  `contact_number1` int(11) NOT NULL,
  `contact_number2` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `country`
--
ALTER TABLE `country`
  ADD CONSTRAINT `fk_country_donation1` FOREIGN KEY (`donation_id`) REFERENCES `donation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_country_purchase_details1` FOREIGN KEY (`purchase_details_id`, `purchase_details_user_id`) REFERENCES `purchase_details` (`id`, `user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `donation`
--
ALTER TABLE `donation`
  ADD CONSTRAINT `fk_donation_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `fk_phone_donation1` FOREIGN KEY (`donation_id`) REFERENCES `donation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_phone_purchase_details1` FOREIGN KEY (`purchase_details_id`, `purchase_details_user_id`) REFERENCES `purchase_details` (`id`, `user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_purchase_details1` FOREIGN KEY (`purchase_details_id`, `purchase_details_user_id`) REFERENCES `purchase_details` (`id`, `user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD CONSTRAINT `fk_purchase_details_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Nov 27, 2024 at 07:06 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vanga_db`
--
CREATE DATABASE IF NOT EXISTS `vanga_db` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `vanga_db`;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_type`
--

DROP TABLE IF EXISTS `accounts_type`;
CREATE TABLE `accounts_type` (
  `acc_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `acc_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `acc_description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creation_date` date NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `debit` enum('1','0') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `isActive` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charts_of_accounts`
--

DROP TABLE IF EXISTS `charts_of_accounts`;
CREATE TABLE `charts_of_accounts` (
  `charts_of_accounts_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `revenue_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `revenue_description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creation_date` date NOT NULL,
  `acc_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isActive` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charts_of_accounts_settings`
--

DROP TABLE IF EXISTS `charts_of_accounts_settings`;
CREATE TABLE `charts_of_accounts_settings` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `min_amount` int NOT NULL,
  `max_amount` int NOT NULL,
  `created_at` date NOT NULL,
  `charts_of_accounts` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conductors`
--

DROP TABLE IF EXISTS `conductors`;
CREATE TABLE `conductors` (
  `conductor_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `second_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isActive` int NOT NULL DEFAULT '1',
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int NOT NULL,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `idDocument` int NOT NULL,
  `email` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `phone` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `birthdate` date NOT NULL,
  `purchases` int NOT NULL,
  `lastPurchase` datetime NOT NULL,
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
CREATE TABLE `owner` (
  `owner_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `second_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `isActive` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int NOT NULL,
  `idCategory` int NOT NULL,
  `code` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `stock` int NOT NULL,
  `buyingPrice` float NOT NULL,
  `sellingPrice` float NOT NULL,
  `sales` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `id` int NOT NULL,
  `code` int NOT NULL,
  `idCustomer` int NOT NULL,
  `idSeller` int NOT NULL,
  `products` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `tax` int NOT NULL,
  `netPrice` float NOT NULL,
  `totalPrice` float NOT NULL,
  `paymentMethod` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `saledate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `company_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `postal_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type_of_currency` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `leaseDuration` int NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testing_users`
--

DROP TABLE IF EXISTS `testing_users`;
CREATE TABLE `testing_users` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `second_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `isActive` int NOT NULL DEFAULT '1',
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `users`
--
DROP TRIGGER IF EXISTS `before_user_insert`;
DELIMITER $$
CREATE TRIGGER `before_user_insert` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
         DECLARE user_ int;

         SELECT COUNT(*) INTO user_ 
         FROM users 
         WHERE email_address = NEW.email_address; 

        -- Check if the user with the same email already exists
        IF user_ > 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'User with this email already exists';
        END IF;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `vehicle_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `vehicle_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registration_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vehicle_company` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `isActive` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_company`
--

DROP TABLE IF EXISTS `vehicle_company`;
CREATE TABLE `vehicle_company` (
  `vehicle_company_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `isActive` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_drivers`
--

DROP TABLE IF EXISTS `vehicle_drivers`;
CREATE TABLE `vehicle_drivers` (
  `vehicle_driver_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `drivers_license_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `second_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isActive` int NOT NULL DEFAULT '1',
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_driver_conductors`
--

DROP TABLE IF EXISTS `vehicle_driver_conductors`;
CREATE TABLE `vehicle_driver_conductors` (
  `vehicle_driver_conductors` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `vehicle_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `driver_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `conductor_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `leaseStartDate` date NOT NULL,
  `leaseExpiryDate` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `vehicle_driver_conductors`
--
DROP TRIGGER IF EXISTS `CHECK_IF_DRIVER_IS_ASSIGNED`;
DELIMITER $$
CREATE TRIGGER `CHECK_IF_DRIVER_IS_ASSIGNED` BEFORE INSERT ON `vehicle_driver_conductors` FOR EACH ROW BEGIN
         DECLARE driver int;

        SELECT COUNT(*) INTO driver
			FROM vehicle_driver_conductors
			WHERE vehicle_id = NEW.vehicle_id
		 	AND leaseExpiryDate IS NULL;

        IF driver > 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Driver already assigned to a vehicle using the dates. Choose another date.';
        END IF;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_expenses`
--

DROP TABLE IF EXISTS `vehicle_expenses`;
CREATE TABLE `vehicle_expenses` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `vehicle_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expense_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entry_incurred` decimal(10,2) DEFAULT NULL,
  `entry_date` date NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_owners`
--

DROP TABLE IF EXISTS `vehicle_owners`;
CREATE TABLE `vehicle_owners` (
  `vehicle_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `owner_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_of_ownership` date NOT NULL,
  `end_date_of_ownership` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `isActive` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `vehicle_owners`
--
DROP TRIGGER IF EXISTS `prevent_entry`;
DELIMITER $$
CREATE TRIGGER `prevent_entry` BEFORE INSERT ON `vehicle_owners` FOR EACH ROW BEGIN
    DECLARE vehicle_owned int;

    SELECT COUNT(*) INTO vehicle_owned
    FROM vehicle_owners
    WHERE vehicle_id = NEW.vehicle_id AND end_date_of_ownership IS NULL;

    IF vehicle_owned > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Vehicle is already owned by another owner.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_revenue`
--

DROP TABLE IF EXISTS `vehicle_revenue`;
CREATE TABLE `vehicle_revenue` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `vehicle_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `revenue_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `revenue_generated` decimal(10,2) NOT NULL,
  `entry_date` date NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_type`
--
ALTER TABLE `accounts_type`
  ADD PRIMARY KEY (`acc_id`),
  ADD UNIQUE KEY `unq_acc_key` (`acc_name`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `unq_category_name` (`category_name`);

--
-- Indexes for table `charts_of_accounts`
--
ALTER TABLE `charts_of_accounts`
  ADD PRIMARY KEY (`charts_of_accounts_id`),
  ADD UNIQUE KEY `unq_name` (`revenue_name`),
  ADD UNIQUE KEY `unq_revenue_key` (`revenue_name`,`acc_type`),
  ADD KEY `account_id_fpk` (`acc_type`);

--
-- Indexes for table `charts_of_accounts_settings`
--
ALTER TABLE `charts_of_accounts_settings`
  ADD KEY `fpk_charts_of_accounts` (`charts_of_accounts`);

--
-- Indexes for table `conductors`
--
ALTER TABLE `conductors`
  ADD PRIMARY KEY (`conductor_id`),
  ADD UNIQUE KEY `unq_coductor` (`phone_number`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`owner_id`),
  ADD UNIQUE KEY `unq_owner_name` (`first_name`,`second_name`,`last_name`);

--
-- Indexes for table `testing_users`
--
ALTER TABLE `testing_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`,`email_address`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD UNIQUE KEY `unq_registration_number` (`registration_number`),
  ADD UNIQUE KEY `unq_registration_owner_category` (`registration_number`,`category`),
  ADD KEY `fpk_vehicle_company` (`vehicle_company`),
  ADD KEY `category_fpk_id` (`category`);

--
-- Indexes for table `vehicle_company`
--
ALTER TABLE `vehicle_company`
  ADD PRIMARY KEY (`vehicle_company_id`),
  ADD UNIQUE KEY `unq_category_name` (`company_name`);

--
-- Indexes for table `vehicle_drivers`
--
ALTER TABLE `vehicle_drivers`
  ADD PRIMARY KEY (`vehicle_driver_id`),
  ADD UNIQUE KEY `unq_coductor` (`drivers_license_no`,`phone_number`) USING BTREE,
  ADD UNIQUE KEY `drivers_license_no` (`drivers_license_no`);

--
-- Indexes for table `vehicle_driver_conductors`
--
ALTER TABLE `vehicle_driver_conductors`
  ADD PRIMARY KEY (`vehicle_driver_conductors`),
  ADD UNIQUE KEY `unq_vehicle_driver_conductors` (`vehicle_id`,`driver_id`,`conductor_id`,`leaseStartDate`),
  ADD UNIQUE KEY `vehicle_driver_conductors` (`vehicle_driver_conductors`),
  ADD UNIQUE KEY `unique_driver_per_leaseDate` (`driver_id`,`leaseStartDate`),
  ADD KEY `idx_driver_id` (`driver_id`),
  ADD KEY `idx_driver_conductor_for_vehicle` (`vehicle_driver_conductors`) USING BTREE,
  ADD KEY `idx_fpk_conductors_id_` (`conductor_id`) USING BTREE;

--
-- Indexes for table `vehicle_expenses`
--
ALTER TABLE `vehicle_expenses`
  ADD PRIMARY KEY (`vehicle_id`,`expense_id`,`entry_date`),
  ADD KEY `fpk_expenses_id_` (`expense_id`);

--
-- Indexes for table `vehicle_owners`
--
ALTER TABLE `vehicle_owners`
  ADD PRIMARY KEY (`vehicle_id`,`owner_id`),
  ADD UNIQUE KEY `unq_registration_owner_id` (`vehicle_id`,`owner_id`),
  ADD KEY `vehicle_id_fpk` (`vehicle_id`),
  ADD KEY `owner_id_fpk` (`owner_id`);

--
-- Indexes for table `vehicle_revenue`
--
ALTER TABLE `vehicle_revenue`
  ADD PRIMARY KEY (`vehicle_id`,`revenue_id`,`entry_date`,`revenue_generated`),
  ADD KEY `fpk_revenue_id` (`revenue_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `testing_users`
--
ALTER TABLE `testing_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `charts_of_accounts`
--
ALTER TABLE `charts_of_accounts`
  ADD CONSTRAINT `fpk_account_type` FOREIGN KEY (`acc_type`) REFERENCES `accounts_type` (`acc_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `charts_of_accounts_settings`
--
ALTER TABLE `charts_of_accounts_settings`
  ADD CONSTRAINT `fpk_charts_of_accounts` FOREIGN KEY (`charts_of_accounts`) REFERENCES `charts_of_accounts` (`charts_of_accounts_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `fpk_category_id` FOREIGN KEY (`category`) REFERENCES `category` (`category_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fpk_vehicle_company` FOREIGN KEY (`vehicle_company`) REFERENCES `vehicle_company` (`vehicle_company_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `vehicle_driver_conductors`
--
ALTER TABLE `vehicle_driver_conductors`
  ADD CONSTRAINT `fpk_conductors_id_` FOREIGN KEY (`conductor_id`) REFERENCES `conductors` (`conductor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fpk_driver_id_` FOREIGN KEY (`driver_id`) REFERENCES `vehicle_drivers` (`vehicle_driver_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fpk_vehicle_id_` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicle_expenses`
--
ALTER TABLE `vehicle_expenses`
  ADD CONSTRAINT `fpk_expenses_id_` FOREIGN KEY (`expense_id`) REFERENCES `charts_of_accounts` (`charts_of_accounts_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fpk_vehicle_id_for_expense_` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicle_owners`
--
ALTER TABLE `vehicle_owners`
  ADD CONSTRAINT `fpk_owner_id_` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fpk_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicle_revenue`
--
ALTER TABLE `vehicle_revenue`
  ADD CONSTRAINT `fpk_revenue_id` FOREIGN KEY (`revenue_id`) REFERENCES `charts_of_accounts` (`charts_of_accounts_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fpk_vehicles_id_` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

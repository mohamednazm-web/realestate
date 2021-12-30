-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2021 at 09:17 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realestatec`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `city_name` varchar(128) NOT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `city_name`, `country_id`) VALUES
(1, 'هەولێر', 0),
(2, 'سلێمانی', 0),
(3, 'دهۆك', 0),
(4, 'کەرکوک', 0);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_address` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `mobile` varchar(64) DEFAULT NULL,
  `mail` varchar(64) DEFAULT NULL,
  `client_details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `client_cs`
--

CREATE TABLE `client_cs` (
  `client_cs_id` varchar(128) NOT NULL,
  `client_cs_name` varchar(128) NOT NULL,
  `client_cs_phone` varchar(43) NOT NULL,
  `date_signed` date DEFAULT NULL,
  `modified_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_cs`
--

INSERT INTO `client_cs` (`client_cs_id`, `client_cs_name`, `client_cs_phone`, `date_signed`, `modified_at`) VALUES
('01dc848a', 'xdr', '07503203351', NULL, '2021-12-28'),
('11fa5d7c', 'helo', '07503203351', NULL, '2021-12-28'),
('1e66060d', 'کاروان', '07503203351', NULL, NULL),
('386ba36b', 'کاروان', '07503203351', NULL, NULL),
('3c9fb635', 'کاروان', '07503203351', NULL, NULL),
('3f6c7a98', 'mohamed', '07503203351', NULL, NULL),
('4ab1d016', 'کاروان', '07503203351', NULL, '2021-12-28'),
('60e94a77', 'کاروان', '07503203351', NULL, NULL),
('6692cfce', 'کاروان', '07503203351', NULL, '2021-12-28'),
('6eae684f', 'mohamed', '07503203351', NULL, NULL),
('718adbbb', 'کاروان', '07503203351', NULL, NULL),
('74f6223f', 'کاروان', '07503203351', NULL, '2021-12-28'),
('75d42c4f', 'mohamed', '07503203351', NULL, NULL),
('955cddee', 'کاروان', '07503203351', NULL, NULL),
('a200b31b', 'کاروان', '07503203351', NULL, NULL),
('b1f13fc2', 'کاروان', '07503203351', NULL, '2021-12-30'),
('c5bb6eab', 'mohamed', '07503203351', NULL, NULL),
('c67e7f04', 'mohamed', '07503203351', NULL, NULL),
('ce4df2d5', 'mohamed', '07503203351', NULL, NULL),
('d2cf4469', 'کاروان', '07503203351', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `estate_id` int(11) DEFAULT NULL,
  `contact_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `contact_details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `contract_type_id` int(11) NOT NULL,
  `contract_details` text NOT NULL,
  `payment_frequency_id` int(11) NOT NULL,
  `number_of_invoices` int(11) NOT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `fee_precentage` decimal(5,2) NOT NULL,
  `fee_amount` decimal(10,2) DEFAULT NULL,
  `date_signed` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contract_invoice`
--

CREATE TABLE `contract_invoice` (
  `id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `invoice_number` varchar(64) NOT NULL,
  `issued_by` text NOT NULL,
  `issued_to` text NOT NULL,
  `invoice_details` text NOT NULL,
  `invoice_amount` decimal(10,2) NOT NULL,
  `date_created` date NOT NULL,
  `billing_date` date NOT NULL,
  `date_paid` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contract_type`
--

CREATE TABLE `contract_type` (
  `id` int(11) NOT NULL,
  `contract_type_name` varchar(64) NOT NULL,
  `fee_precentage` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `country_name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `country_name`) VALUES
(1, 'عێراق');

-- --------------------------------------------------------

--
-- Table structure for table `direction`
--

CREATE TABLE `direction` (
  `id` int(11) NOT NULL,
  `direction_name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `direction`
--

INSERT INTO `direction` (`id`, `direction_name`) VALUES
(1, 'باکوور'),
(2, 'باشوور'),
(3, 'رؤژئاوا'),
(4, 'رۆژهەڵات'),
(5, 'باکوری رۆژئاوا');

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id` int(11) NOT NULL,
  `district_name` varchar(43) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`id`, `district_name`, `city_id`, `country_id`) VALUES
(1, 'دوکان', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `estate`
--

CREATE TABLE `estate` (
  `id` varchar(128) NOT NULL,
  `city_id` int(11) NOT NULL,
  `estate_type_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `moon_introduction` int(11) NOT NULL,
  `area` decimal(8,2) DEFAULT NULL,
  `date_signed` date NOT NULL,
  `modified_at` date DEFAULT NULL,
  `number_of_estate` decimal(8,2) NOT NULL,
  `number_of_earth` int(11) NOT NULL,
  `number_of_floor` int(11) NOT NULL,
  `number_of_balconies` int(11) DEFAULT NULL,
  `balconies_space` decimal(8,2) DEFAULT NULL,
  `number_of_bedrooms` int(11) DEFAULT NULL,
  `number_of_bathrooms` int(11) DEFAULT NULL,
  `number_of_room` int(11) DEFAULT NULL,
  `number_of_ws` int(11) NOT NULL,
  `estate_description` text NOT NULL,
  `property_type_id` int(11) NOT NULL,
  `kaza_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `direction_id` int(11) NOT NULL,
  `neighborhood_id` int(11) NOT NULL,
  `owner_of_property_id` varchar(128) NOT NULL,
  `ownership_type_id` int(11) NOT NULL,
  `client_cs_id` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `estate`
--

INSERT INTO `estate` (`id`, `city_id`, `estate_type_id`, `price`, `moon_introduction`, `area`, `date_signed`, `modified_at`, `number_of_estate`, `number_of_earth`, `number_of_floor`, `number_of_balconies`, `balconies_space`, `number_of_bedrooms`, `number_of_bathrooms`, `number_of_room`, `number_of_ws`, `estate_description`, `property_type_id`, `kaza_id`, `district_id`, `direction_id`, `neighborhood_id`, `owner_of_property_id`, `ownership_type_id`, `client_cs_id`) VALUES
('1086dcaf', 1, 1, 300, 22, '22.00', '0000-00-00', NULL, '66.00', 6677, 44, NULL, '30.00', 2, 55, 8, 2, 'kurdistan', 1, 1, 1, 1, 1, 'd6f0c5ae', 1, '60e94a77'),
('1128f7cd', 1, 1, 300, 22, '22.00', '0000-00-00', NULL, '66.00', 6677, 44, NULL, '30.00', 2, 55, 8, 2, 'new one', 1, 1, 1, 1, 1, 'a31c29c5', 1, '1e66060d'),
('137e98b2', 1, 1, 0, 0, '0.00', '0000-00-00', NULL, '0.00', 0, 0, NULL, '0.00', 0, 0, 0, 0, 'new one', 1, 1, 1, 1, 1, '912719e2', 1, 'ce4df2d5'),
('47c688c9', 0, 0, 0, 0, NULL, '0000-00-00', '2021-12-28', '0.00', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '', 0, NULL, NULL, 0, 0, 'a2ec8492', 0, '74f6223f'),
('484d6a55', 1, 1, 300, 22, '22.00', '0000-00-00', NULL, '66.00', 6677, 44, NULL, '30.00', 2, 55, 8, 2, 'new one', 1, 1, 1, 1, 1, 'f42eda2c', 1, '3c9fb635'),
('4bfcc938', 0, 0, 0, 0, NULL, '0000-00-00', '2021-12-28', '0.00', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '', 0, NULL, NULL, 0, 0, '30fce9c3', 0, '4ab1d016'),
('52597f98', 1, 1, 300, 22, '22.00', '0000-00-00', NULL, '66.00', 6677, 44, NULL, '30.00', 2, 55, 8, 2, 'new one', 1, 1, 1, 1, 1, '94aa4986', 1, 'a200b31b'),
('5a17267d', 1, 1, 300, 22, '22.00', '0000-00-00', '2021-12-28', '66.00', 6677, 44, NULL, '30.00', 2, 55, 8, 2, 'kurdistan', 1, 1, 1, 1, 1, '31ebfbb7', 1, '01dc848a'),
('6bf9804e', 1, 1, 300, 22, '22.00', '0000-00-00', NULL, '66.00', 6677, 44, NULL, '30.00', 2, 55, 8, 2, 'kurdistan', 1, 1, 1, 1, 1, '85ab9d87', 1, '386ba36b'),
('6da2e3c5', 1, 1, 300, 22, '22.00', '0000-00-00', NULL, '66.00', 6677, 44, NULL, '30.00', 2, 55, 22, 2, 'new one', 1, 2, 1, 1, 1, '4eab18b1', 1, 'd2cf4469'),
('6fa422c5', 1, 1, 55, 100, '44.00', '2017-11-05', NULL, '4554.00', 5544, 2, NULL, '44.00', 2, 2, 5, 2, 'the new estate', 1, 1, 1, 1, 1, '34474d01', 1, '3f6c7a98'),
('7edf09b3', 0, 0, 0, 0, NULL, '0000-00-00', '2021-12-28', '0.00', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '', 0, NULL, NULL, 0, 0, '95570cb1', 0, '6692cfce'),
('9db2ae43', 1, 1, 0, 0, '0.00', '0000-00-00', NULL, '0.00', 0, 0, NULL, '0.00', 0, 0, 0, 0, 'new one', 1, 1, 1, 1, 1, '8dfc7903', 1, '6eae684f'),
('a098f731', 1, 1, 300, 22, '22.00', '0000-00-00', NULL, '66.00', 6677, 44, NULL, '30.00', 2, 55, 8, 2, 'new one', 1, 1, 1, 1, 1, '627b1257', 1, '718adbbb'),
('a9f4be6b', 1, 2, 300, 22, '22.00', '0000-00-00', '2021-12-28', '66.00', 6677, 44, NULL, '30.00', 2, 55, 8, 2, 'kurdistan', 1, 1, 1, 1, 1, '2522133a', 1, '11fa5d7c'),
('caeba7f9', 1, 1, 55, 100, '44.00', '2017-11-05', NULL, '4554.00', 5544, 2, NULL, '44.00', 2, 2, 5, 2, 'the new estate', 1, 1, 1, 1, 1, '28cd00b8', 1, 'c5bb6eab'),
('d5493fd8', 1, 1, 300, 22, '22.00', '0000-00-00', NULL, '66.00', 6677, 44, NULL, '30.00', 2, 55, 8, 2, 'new one', 1, 1, 1, 1, 1, 'b39b7950', 1, '955cddee'),
('e8e8f72f', 1, 1, 55, 100, '44.00', '2017-11-05', NULL, '4554.00', 5544, 2, NULL, '44.00', 2, 2, 5, 2, 'the new estate', 1, 1, 1, 1, 1, 'f0d4b1cb', 1, '75d42c4f'),
('f027bce5', 1, 1, 55, 100, '44.00', '2017-11-05', NULL, '4554.00', 5544, 2, NULL, '44.00', 2, 2, 5, 2, 'the new estate', 1, 1, 1, 1, 1, '52580358', 1, 'c67e7f04'),
('f4b65d2f', 1, 1, 1, 1, '1.00', '0000-00-00', '2021-12-30', '222.00', 1, 1, NULL, '1.00', 1, 1, 1, 1, 'new one', 1, 1, 1, 1, 1, 'a51fcd0a', 1, 'b1f13fc2');

-- --------------------------------------------------------

--
-- Table structure for table `estate_type`
--

CREATE TABLE `estate_type` (
  `id` int(11) NOT NULL,
  `estate_type_name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `estate_type`
--

INSERT INTO `estate_type` (`id`, `estate_type_name`) VALUES
(1, 'کرێ'),
(2, 'فرۆشتن');

-- --------------------------------------------------------

--
-- Table structure for table `in_charge`
--

CREATE TABLE `in_charge` (
  `id` int(11) NOT NULL,
  `estate_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kaza`
--

CREATE TABLE `kaza` (
  `id` int(11) NOT NULL,
  `kaza_name` varchar(128) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kaza`
--

INSERT INTO `kaza` (`id`, `kaza_name`, `city_id`, `country_id`) VALUES
(1, 'سۆران', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `neighborhood`
--

CREATE TABLE `neighborhood` (
  `id` int(11) NOT NULL,
  `neighborhood_name` varchar(43) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `neighborhood`
--

INSERT INTO `neighborhood` (`id`, `neighborhood_name`, `city_id`) VALUES
(1, 'سوڵتان موزەفەر', 2),
(2, 'هەولێری نوێ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ownership_type`
--

CREATE TABLE `ownership_type` (
  `id` int(11) NOT NULL,
  `ownership_type_name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ownership_type`
--

INSERT INTO `ownership_type` (`id`, `ownership_type_name`) VALUES
(1, 'خاوەنداریەتی');

-- --------------------------------------------------------

--
-- Table structure for table `owner_of_property`
--

CREATE TABLE `owner_of_property` (
  `id` varchar(128) NOT NULL,
  `owner_of_property_name` varchar(43) DEFAULT NULL,
  `date_signed` date DEFAULT NULL,
  `modified_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owner_of_property`
--

INSERT INTO `owner_of_property` (`id`, `owner_of_property_name`, `date_signed`, `modified_at`) VALUES
('2522133a', '66', NULL, '2021-12-28'),
('28cd00b8', 'undefined', NULL, NULL),
('30fce9c3', '', NULL, '2021-12-28'),
('31ebfbb7', '66', NULL, '2021-12-28'),
('34474d01', 'undefined', NULL, NULL),
('4eab18b1', 'fa', NULL, NULL),
('52580358', 'undefined', NULL, NULL),
('627b1257', '66', NULL, NULL),
('85ab9d87', '66', NULL, NULL),
('8dfc7903', 'hama', NULL, NULL),
('912719e2', 'hama', NULL, NULL),
('94aa4986', '66', NULL, NULL),
('95570cb1', '', NULL, '2021-12-28'),
('a2ec8492', '', NULL, '2021-12-28'),
('a31c29c5', '66', NULL, NULL),
('a51fcd0a', 'hama', NULL, '2021-12-30'),
('b39b7950', '66', NULL, NULL),
('d6f0c5ae', '66', NULL, NULL),
('f0d4b1cb', 'undefined', NULL, NULL),
('f42eda2c', '66', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_frequency`
--

CREATE TABLE `payment_frequency` (
  `id` int(11) NOT NULL,
  `payment_frequency_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `property_type`
--

CREATE TABLE `property_type` (
  `id` int(11) NOT NULL,
  `property_type_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property_type`
--

INSERT INTO `property_type` (`id`, `property_type_name`) VALUES
(1, 'خانوو'),
(2, 'زەوی');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` varchar(128) NOT NULL,
  `request_cs_id` varchar(128) NOT NULL,
  `estate_type_id` int(11) NOT NULL,
  `neighborhood_id` int(11) NOT NULL,
  `date_signed` date DEFAULT NULL,
  `property_type_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `modified_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `request_cs_id`, `estate_type_id`, `neighborhood_id`, `date_signed`, `property_type_id`, `description`, `modified_at`) VALUES
('0df528ec3c0b3b83', '003e8387f448dd0a', 1, 1, '2021-12-30', 2, 'new', NULL),
('32d79466d269a1c5', '06de9b5fde5d27b6', 1, 1, '2021-12-29', 1, 'rwkn', NULL),
('570620fa344927d9', 'b1ca4917c065ec83', 1, 1, '2021-12-29', 1, 'rwkn', NULL),
('780494c1b3f5839c', '2c1ffa1edaf8d29d', 1, 1, '2021-12-30', 2, 'new', NULL),
('a07231063cbab9b6', '8e5be2947baec953', 1, 1, '2021-12-30', 1, 'new one', NULL),
('c34c83f086d5f844', '42d1450195975a3c', 1, 1, '2021-12-30', 1, 'new one', NULL),
('d4a52f20d7a2faf4', 'fe1fc16822fb898f', 1, 1, '2021-12-10', 1, 'best one', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `request_cs`
--

CREATE TABLE `request_cs` (
  `request_cs_id` varchar(128) NOT NULL,
  `request_cs_name` varchar(43) NOT NULL,
  `request_cs_phone` varchar(43) NOT NULL,
  `date_signed` varchar(43) DEFAULT NULL,
  `modified_at` varchar(34) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request_cs`
--

INSERT INTO `request_cs` (`request_cs_id`, `request_cs_name`, `request_cs_phone`, `date_signed`, `modified_at`) VALUES
('003e8387f448dd0a', 'karwan', '07503203351', '2021-12-30T21:45:27+03:00', NULL),
('06de9b5fde5d27b6', 'saman', '07503203351', '2021-12-29T23:36:35+03:00', NULL),
('2c1ffa1edaf8d29d', 'saman', '07503203351', '2021-12-30T21:44:23+03:00', NULL),
('42d1450195975a3c', 'hello', '07503203351', '2021-12-30T15:31:02+03:00', NULL),
('8e5be2947baec953', 'karwan', '07503203351', '2021-12-30T23:10:45+03:00', NULL),
('b1ca4917c065ec83', 'saman', '07503203351', '2021-12-29T23:35:35+03:00', NULL),
('fe1fc16822fb898f', 'tofiq', '07503203351', '2021-12-10T22:03:19+03:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `transaction_type_id` int(11) NOT NULL,
  `client_offered` int(11) NOT NULL,
  `client_requested` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_type`
--

CREATE TABLE `transaction_type` (
  `id` int(11) NOT NULL,
  `transaction_type_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `under_contract`
--

CREATE TABLE `under_contract` (
  `id` int(11) NOT NULL,
  `estate_id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_cs`
--
ALTER TABLE `client_cs`
  ADD PRIMARY KEY (`client_cs_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_client` (`client_id`),
  ADD KEY `contact_employee` (`employee_id`),
  ADD KEY `contact_estate` (`estate_id`);

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_client` (`client_id`),
  ADD KEY `contract_contract_type` (`contract_type_id`),
  ADD KEY `contract_employee` (`employee_id`),
  ADD KEY `contract_payment_frequency` (`payment_frequency_id`),
  ADD KEY `contract_transaction` (`transaction_id`);

--
-- Indexes for table `contract_invoice`
--
ALTER TABLE `contract_invoice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contract_invoice_ak_1` (`invoice_number`),
  ADD KEY `invoice_contract` (`contract_id`);

--
-- Indexes for table `contract_type`
--
ALTER TABLE `contract_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contract_type_ak_1` (`contract_type_name`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `direction`
--
ALTER TABLE `direction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estate`
--
ALTER TABLE `estate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estate_type`
--
ALTER TABLE `estate_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `in_charge`
--
ALTER TABLE `in_charge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `in_charge_employee` (`employee_id`),
  ADD KEY `in_charge_estate` (`estate_id`);

--
-- Indexes for table `kaza`
--
ALTER TABLE `kaza`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `neighborhood`
--
ALTER TABLE `neighborhood`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ownership_type`
--
ALTER TABLE `ownership_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owner_of_property`
--
ALTER TABLE `owner_of_property`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_frequency`
--
ALTER TABLE `payment_frequency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_frequency_ak_1` (`payment_frequency_name`);

--
-- Indexes for table `property_type`
--
ALTER TABLE `property_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_cs`
--
ALTER TABLE `request_cs`
  ADD PRIMARY KEY (`request_cs_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_client1` (`client_offered`),
  ADD KEY `transaction_client2` (`client_requested`),
  ADD KEY `transaction_transaction_type` (`transaction_type_id`);

--
-- Indexes for table `transaction_type`
--
ALTER TABLE `transaction_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_type_ak_1` (`transaction_type_name`);

--
-- Indexes for table `under_contract`
--
ALTER TABLE `under_contract`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `under_contract_ak_1` (`estate_id`,`contract_id`),
  ADD KEY `under_contract_contract` (`contract_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `direction`
--
ALTER TABLE `direction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `neighborhood`
--
ALTER TABLE `neighborhood`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ownership_type`
--
ALTER TABLE `ownership_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `property_type`
--
ALTER TABLE `property_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

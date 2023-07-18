-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2023 at 07:15 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-commerce_flutter`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_userid` int(11) NOT NULL,
  `address_appear` tinyint(4) NOT NULL DEFAULT 1,
  `address_city` varchar(255) NOT NULL,
  `address_name` varchar(255) NOT NULL,
  `address_street` varchar(255) NOT NULL,
  `address_lat` double NOT NULL,
  `address_long` double NOT NULL,
  `address_phonenumber` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `address_userid`, `address_appear`, `address_city`, `address_name`, `address_street`, `address_lat`, `address_long`, `address_phonenumber`) VALUES
(67, 0, 0, 'Mansoura', 'Toreel', 'Makkah', 38.9075, -77.0381, '01096562252');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_username` varchar(100) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_phone` varchar(15) NOT NULL,
  `admin_verifycode` int(5) NOT NULL,
  `admin_created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_username`, `admin_email`, `admin_password`, `admin_phone`, `admin_verifycode`, `admin_created_time`) VALUES
(1, 'bodo', 'bodywolf29@gmail.com', 'd7ce821305fb1a21709cbfaced64656dfb17024c', '01096562252', 78689, '2023-06-20 16:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_itemid` int(11) NOT NULL,
  `cart_itemcolor` varchar(255) NOT NULL,
  `cart_itemcount` int(11) NOT NULL DEFAULT 1,
  `cart_userid` int(11) NOT NULL,
  `cart_inorder` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_itemid`, `cart_itemcolor`, `cart_itemcount`, `cart_userid`, `cart_inorder`) VALUES
(541, 1, 'black', 3, 0, 1),
(543, 1, 'black', 3, 0, 1),
(544, 4, '', 1, 0, 1),
(545, 1, 'black', 3, 0, 1),
(546, 1, 'black', 3, 0, 1),
(547, 1, 'black', 3, 0, 1),
(548, 1, 'black', 3, 0, 1),
(550, 1, 'black', 1, 0, 1),
(551, 1, 'black', 1, 0, 1),
(552, 1, 'black', 1, 0, 0),
(553, 4, '', 1, 0, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cartview`
-- (See below for the actual view)
--
CREATE TABLE `cartview` (
`cart_id` int(11)
,`cart_itemid` int(11)
,`cart_itemcolor` varchar(255)
,`cart_itemcount` int(11)
,`cart_userid` int(11)
,`cart_inorder` tinyint(4)
,`item_id` int(11)
,`item_categorie` int(11)
,`item_image` varchar(255)
,`item_name_en` varchar(255)
,`item_name_ar` varchar(255)
,`item_desc_en` varchar(255)
,`item_desc_ar` varchar(255)
,`item_discount` smallint(6)
,`item_price` float
,`item_count` int(6)
,`item_colors` varchar(255)
,`item_active` tinyint(1)
,`item_created_date` timestamp
,`categorie_id` int(11)
,`categorie_image` varchar(255)
,`categorie_name_en` varchar(255)
,`categorie_name_ar` varchar(255)
,`categorie_created_date` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorie_id` int(11) NOT NULL,
  `categorie_image` varchar(255) NOT NULL,
  `categorie_name_en` varchar(255) NOT NULL,
  `categorie_name_ar` varchar(255) NOT NULL,
  `categorie_created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorie_id`, `categorie_image`, `categorie_name_en`, `categorie_name_ar`, `categorie_created_date`) VALUES
(1, 'phone_cat.svg', 'Mobiles', 'الهواتف', '2023-05-21 12:06:44'),
(3, 'camera_cat.svg', 'Cameras', 'الكاميرات', '2023-05-21 12:06:44');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon` varchar(20) NOT NULL,
  `coupon_discount` int(11) NOT NULL,
  `coupon_usage_count` int(11) NOT NULL,
  `coupon_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `coupon`, `coupon_discount`, `coupon_usage_count`, `coupon_expiry`) VALUES
(0, 'default', 0, 0, NULL),
(1, 'BODO0', 1200, 46, '2023-06-30 18:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `delivery_username` varchar(100) NOT NULL,
  `delivery_email` varchar(100) NOT NULL,
  `delivery_password` varchar(255) NOT NULL,
  `delivery_phone` varchar(12) NOT NULL,
  `delivery_verifycode` int(5) NOT NULL,
  `delivery_created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `delivery_username`, `delivery_email`, `delivery_password`, `delivery_phone`, `delivery_verifycode`, `delivery_created_time`) VALUES
(1, 'bodo', 'bodywolf29@gmail.com', 'd7ce821305fb1a21709cbfaced64656dfb17024c', '01096562252', 55555, '2023-06-18 10:26:24');

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `favorite_id` int(11) NOT NULL,
  `favorite_userid` int(11) NOT NULL,
  `favorite_itemid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `favouritesview`
-- (See below for the actual view)
--
CREATE TABLE `favouritesview` (
`item_id` int(11)
,`item_categorie` int(11)
,`item_image` varchar(255)
,`item_name_en` varchar(255)
,`item_name_ar` varchar(255)
,`item_desc_en` varchar(255)
,`item_desc_ar` varchar(255)
,`item_discount` smallint(6)
,`item_price` float
,`item_count` int(6)
,`item_colors` varchar(255)
,`item_active` tinyint(1)
,`item_created_date` timestamp
,`favorite_id` int(11)
,`favorite_userid` int(11)
,`favorite_itemid` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_categorie` int(11) NOT NULL,
  `item_image` varchar(255) NOT NULL,
  `item_name_en` varchar(255) NOT NULL,
  `item_name_ar` varchar(255) NOT NULL,
  `item_desc_en` varchar(255) NOT NULL,
  `item_desc_ar` varchar(255) NOT NULL,
  `item_discount` smallint(6) NOT NULL DEFAULT 0,
  `item_price` float NOT NULL,
  `item_count` int(6) NOT NULL,
  `item_colors` varchar(255) NOT NULL,
  `item_active` tinyint(1) NOT NULL DEFAULT 1,
  `item_created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_categorie`, `item_image`, `item_name_en`, `item_name_ar`, `item_desc_en`, `item_desc_ar`, `item_discount`, `item_price`, `item_count`, `item_colors`, `item_active`, `item_created_date`) VALUES
(1, 1, 'Xiaomi-Mi-10T.png', 'Xiaomi Mi 10T', 'شاومي مي 10 تي', 'Snapdragon 865', 'Snapdragon 865', 20, 10000, 5, 'black, silver', 1, '2023-05-24 23:14:27'),
(4, 1, 'samsung-galaxy-s20.png', 'Samsung S20', 'Samsung S20', 'Best Phone From Samsung', 'Best Phone From Samsung', 0, 19999, 10, 'silver', 1, '2023-05-22 16:07:05'),
(5, 1, 'poco-f3.png', 'Poco F3', 'بوكو اف 3', 'Snapdragon 870', 'سناب دراحون 870', 0, 7000, 50, 'blue,black', 1, '2023-06-16 23:19:25');

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemsview`
-- (See below for the actual view)
--
CREATE TABLE `itemsview` (
`item_id` int(11)
,`item_categorie` int(11)
,`item_image` varchar(255)
,`item_name_en` varchar(255)
,`item_name_ar` varchar(255)
,`item_desc_en` varchar(255)
,`item_desc_ar` varchar(255)
,`item_discount` smallint(6)
,`item_price` float
,`item_count` int(6)
,`item_colors` varchar(255)
,`item_active` tinyint(1)
,`item_created_date` timestamp
,`categorie_id` int(11)
,`categorie_image` varchar(255)
,`categorie_name_en` varchar(255)
,`categorie_name_ar` varchar(255)
,`categorie_created_date` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `notification_userid` int(11) NOT NULL,
  `notification_message` varchar(255) NOT NULL,
  `notification_title` varchar(255) NOT NULL,
  `notification_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `notification_userid`, `notification_message`, `notification_title`, `notification_date`) VALUES
(54, 0, 'siu', 'loool', '2023-06-13 17:04:01');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_rate` float NOT NULL DEFAULT 0,
  `order_cartid` int(11) NOT NULL DEFAULT 0,
  `order_appear` tinyint(4) NOT NULL DEFAULT 1,
  `order_status` varchar(20) DEFAULT 'pending',
  `order_userid` int(11) NOT NULL,
  `order_addressid` int(11) NOT NULL,
  `order_paymentmethod` varchar(20) NOT NULL,
  `item_price` int(11) NOT NULL DEFAULT 0,
  `order_coupon` varchar(20) NOT NULL DEFAULT 'default',
  `order_shipping` double NOT NULL,
  `order_createddate` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_deliveryid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_rate`, `order_cartid`, `order_appear`, `order_status`, `order_userid`, `order_addressid`, `order_paymentmethod`, `item_price`, `order_coupon`, `order_shipping`, `order_createddate`, `order_deliveryid`) VALUES
(280, 0, 550, 1, 'out for delivery', 0, 67, 'Cash', 10000, 'bodo0', 0, '2023-06-26 22:36:00', 0),
(283, 3, 547, 1, 'done', 0, 67, 'Cash', 7000, 'default', 0, '2023-06-26 18:52:18', 0),
(284, 0, 548, 1, 'canceled', 0, 67, 'Cash', 10000, 'default', 0, '2023-06-26 19:37:07', 0),
(286, 0, 551, 1, 'pending', 0, 67, 'Cash', 10000, 'bodo0', 0, '2023-06-26 22:55:12', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersview`
-- (See below for the actual view)
--
CREATE TABLE `ordersview` (
`order_id` int(11)
,`order_rate` float
,`order_cartid` int(11)
,`order_appear` tinyint(4)
,`order_status` varchar(20)
,`order_userid` int(11)
,`order_addressid` int(11)
,`order_paymentmethod` varchar(20)
,`item_price` int(11)
,`order_coupon` varchar(20)
,`order_shipping` double
,`order_createddate` timestamp
,`order_deliveryid` int(11)
,`coupon_id` int(11)
,`coupon` varchar(20)
,`coupon_discount` int(11)
,`coupon_usage_count` int(11)
,`coupon_expiry` datetime
,`address_id` int(11)
,`address_userid` int(11)
,`address_appear` tinyint(4)
,`address_city` varchar(255)
,`address_name` varchar(255)
,`address_street` varchar(255)
,`address_lat` double
,`address_long` double
,`address_phonenumber` varchar(15)
,`cart_id` int(11)
,`cart_itemid` int(11)
,`cart_itemcolor` varchar(255)
,`cart_itemcount` int(11)
,`cart_userid` int(11)
,`cart_inorder` tinyint(4)
,`item_id` int(11)
,`item_categorie` int(11)
,`item_image` varchar(255)
,`item_name_en` varchar(255)
,`item_name_ar` varchar(255)
,`item_desc_en` varchar(255)
,`item_desc_ar` varchar(255)
,`item_discount` smallint(6)
,`item_count` int(6)
,`item_colors` varchar(255)
,`item_active` tinyint(1)
,`item_created_date` timestamp
,`categorie_id` int(11)
,`categorie_image` varchar(255)
,`categorie_name_en` varchar(255)
,`categorie_name_ar` varchar(255)
,`categorie_created_date` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersviewdelivery`
-- (See below for the actual view)
--
CREATE TABLE `ordersviewdelivery` (
`order_id` int(11)
,`order_userid` int(11)
,`order_paymentmethod` varchar(20)
,`order_status` varchar(20)
,`order_deliveryid` int(11)
,`order_createddate` timestamp
,`order_itemscount` decimal(32,0)
,`order_price` double
,`address_id` int(11)
,`address_name` varchar(255)
,`address_city` varchar(255)
,`address_street` varchar(255)
,`address_lat` double
,`address_long` double
,`address_phonenumber` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `rates`
-- (See below for the actual view)
--
CREATE TABLE `rates` (
`item_id` int(11)
,`rate` double
);

-- --------------------------------------------------------

--
-- Table structure for table `texts`
--

CREATE TABLE `texts` (
  `text_id` int(11) NOT NULL,
  `text_en` varchar(255) NOT NULL,
  `text_ar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `texts`
--

INSERT INTO `texts` (`text_id`, `text_en`, `text_ar`) VALUES
(1, 'We Have Many Offers 90% Discount', 'لدينا العديد من العروض بخصومات تصل حتى 90%'),
(2, '2-3 Days Delivery Time', 'يستغرق التوصيل من 2-3 أيام');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_username` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  `user_verifycode` int(5) NOT NULL,
  `user_approve` tinyint(1) NOT NULL DEFAULT 0,
  `user_created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_username`, `user_email`, `user_password`, `user_phone`, `user_verifycode`, `user_approve`, `user_created_time`) VALUES
(0, 'bodo', 'bodywolf29@gmail.com', 'd7ce821305fb1a21709cbfaced64656dfb17024c', '01096562252', 63168, 1, '2023-05-19 11:30:27'),
(1, 'lol', 'bodyggg@gm.co', '01b307acba4f54f55aafc33bb06bbbf6ca803e9a', '01096563323', 25718, 1, '2023-05-30 02:49:46');

-- --------------------------------------------------------

--
-- Structure for view `cartview`
--
DROP TABLE IF EXISTS `cartview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cartview`  AS SELECT `cart`.`cart_id` AS `cart_id`, `cart`.`cart_itemid` AS `cart_itemid`, `cart`.`cart_itemcolor` AS `cart_itemcolor`, `cart`.`cart_itemcount` AS `cart_itemcount`, `cart`.`cart_userid` AS `cart_userid`, `cart`.`cart_inorder` AS `cart_inorder`, `itemsview`.`item_id` AS `item_id`, `itemsview`.`item_categorie` AS `item_categorie`, `itemsview`.`item_image` AS `item_image`, `itemsview`.`item_name_en` AS `item_name_en`, `itemsview`.`item_name_ar` AS `item_name_ar`, `itemsview`.`item_desc_en` AS `item_desc_en`, `itemsview`.`item_desc_ar` AS `item_desc_ar`, `itemsview`.`item_discount` AS `item_discount`, `itemsview`.`item_price` AS `item_price`, `itemsview`.`item_count` AS `item_count`, `itemsview`.`item_colors` AS `item_colors`, `itemsview`.`item_active` AS `item_active`, `itemsview`.`item_created_date` AS `item_created_date`, `itemsview`.`categorie_id` AS `categorie_id`, `itemsview`.`categorie_image` AS `categorie_image`, `itemsview`.`categorie_name_en` AS `categorie_name_en`, `itemsview`.`categorie_name_ar` AS `categorie_name_ar`, `itemsview`.`categorie_created_date` AS `categorie_created_date` FROM (`cart` join `itemsview` on(`itemsview`.`item_id` = `cart`.`cart_itemid`))  ;

-- --------------------------------------------------------

--
-- Structure for view `favouritesview`
--
DROP TABLE IF EXISTS `favouritesview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `favouritesview`  AS SELECT `items`.`item_id` AS `item_id`, `items`.`item_categorie` AS `item_categorie`, `items`.`item_image` AS `item_image`, `items`.`item_name_en` AS `item_name_en`, `items`.`item_name_ar` AS `item_name_ar`, `items`.`item_desc_en` AS `item_desc_en`, `items`.`item_desc_ar` AS `item_desc_ar`, `items`.`item_discount` AS `item_discount`, `items`.`item_price` AS `item_price`, `items`.`item_count` AS `item_count`, `items`.`item_colors` AS `item_colors`, `items`.`item_active` AS `item_active`, `items`.`item_created_date` AS `item_created_date`, `favourites`.`favorite_id` AS `favorite_id`, `favourites`.`favorite_userid` AS `favorite_userid`, `favourites`.`favorite_itemid` AS `favorite_itemid` FROM (`favourites` join `items` on(`favourites`.`favorite_itemid` = `items`.`item_id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `itemsview`
--
DROP TABLE IF EXISTS `itemsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemsview`  AS SELECT `items`.`item_id` AS `item_id`, `items`.`item_categorie` AS `item_categorie`, `items`.`item_image` AS `item_image`, `items`.`item_name_en` AS `item_name_en`, `items`.`item_name_ar` AS `item_name_ar`, `items`.`item_desc_en` AS `item_desc_en`, `items`.`item_desc_ar` AS `item_desc_ar`, `items`.`item_discount` AS `item_discount`, `items`.`item_price` AS `item_price`, `items`.`item_count` AS `item_count`, `items`.`item_colors` AS `item_colors`, `items`.`item_active` AS `item_active`, `items`.`item_created_date` AS `item_created_date`, `categories`.`categorie_id` AS `categorie_id`, `categories`.`categorie_image` AS `categorie_image`, `categories`.`categorie_name_en` AS `categorie_name_en`, `categories`.`categorie_name_ar` AS `categorie_name_ar`, `categories`.`categorie_created_date` AS `categorie_created_date` FROM (`items` join `categories` on(`items`.`item_categorie` = `categories`.`categorie_id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `ordersview`
--
DROP TABLE IF EXISTS `ordersview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersview`  AS SELECT `orders`.`order_id` AS `order_id`, `orders`.`order_rate` AS `order_rate`, `orders`.`order_cartid` AS `order_cartid`, `orders`.`order_appear` AS `order_appear`, `orders`.`order_status` AS `order_status`, `orders`.`order_userid` AS `order_userid`, `orders`.`order_addressid` AS `order_addressid`, `orders`.`order_paymentmethod` AS `order_paymentmethod`, `orders`.`item_price` AS `item_price`, `orders`.`order_coupon` AS `order_coupon`, `orders`.`order_shipping` AS `order_shipping`, `orders`.`order_createddate` AS `order_createddate`, `orders`.`order_deliveryid` AS `order_deliveryid`, `coupon`.`coupon_id` AS `coupon_id`, `coupon`.`coupon` AS `coupon`, `coupon`.`coupon_discount` AS `coupon_discount`, `coupon`.`coupon_usage_count` AS `coupon_usage_count`, `coupon`.`coupon_expiry` AS `coupon_expiry`, `address`.`address_id` AS `address_id`, `address`.`address_userid` AS `address_userid`, `address`.`address_appear` AS `address_appear`, `address`.`address_city` AS `address_city`, `address`.`address_name` AS `address_name`, `address`.`address_street` AS `address_street`, `address`.`address_lat` AS `address_lat`, `address`.`address_long` AS `address_long`, `address`.`address_phonenumber` AS `address_phonenumber`, `cartview`.`cart_id` AS `cart_id`, `cartview`.`cart_itemid` AS `cart_itemid`, `cartview`.`cart_itemcolor` AS `cart_itemcolor`, `cartview`.`cart_itemcount` AS `cart_itemcount`, `cartview`.`cart_userid` AS `cart_userid`, `cartview`.`cart_inorder` AS `cart_inorder`, `cartview`.`item_id` AS `item_id`, `cartview`.`item_categorie` AS `item_categorie`, `cartview`.`item_image` AS `item_image`, `cartview`.`item_name_en` AS `item_name_en`, `cartview`.`item_name_ar` AS `item_name_ar`, `cartview`.`item_desc_en` AS `item_desc_en`, `cartview`.`item_desc_ar` AS `item_desc_ar`, `cartview`.`item_discount` AS `item_discount`, `cartview`.`item_count` AS `item_count`, `cartview`.`item_colors` AS `item_colors`, `cartview`.`item_active` AS `item_active`, `cartview`.`item_created_date` AS `item_created_date`, `cartview`.`categorie_id` AS `categorie_id`, `cartview`.`categorie_image` AS `categorie_image`, `cartview`.`categorie_name_en` AS `categorie_name_en`, `cartview`.`categorie_name_ar` AS `categorie_name_ar`, `cartview`.`categorie_created_date` AS `categorie_created_date` FROM (((`orders` join `coupon` on(`orders`.`order_coupon` = `coupon`.`coupon`)) join `address` on(`orders`.`order_addressid` = `address`.`address_id`)) join `cartview` on(`orders`.`order_cartid` = `cartview`.`cart_id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `ordersviewdelivery`
--
DROP TABLE IF EXISTS `ordersviewdelivery`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersviewdelivery`  AS SELECT max(`ordersview`.`order_id`) AS `order_id`, `ordersview`.`order_userid` AS `order_userid`, `ordersview`.`order_paymentmethod` AS `order_paymentmethod`, `ordersview`.`order_status` AS `order_status`, `ordersview`.`order_deliveryid` AS `order_deliveryid`, `ordersview`.`order_createddate` AS `order_createddate`, sum(`ordersview`.`cart_itemcount`) AS `order_itemscount`, sum(`ordersview`.`item_price` - `ordersview`.`coupon_discount` - (`ordersview`.`item_price` - `ordersview`.`coupon_discount`) * (`ordersview`.`item_discount` / 100)) + max(`ordersview`.`order_shipping`) AS `order_price`, `ordersview`.`address_id` AS `address_id`, `ordersview`.`address_name` AS `address_name`, `ordersview`.`address_city` AS `address_city`, `ordersview`.`address_street` AS `address_street`, `ordersview`.`address_lat` AS `address_lat`, `ordersview`.`address_long` AS `address_long`, `ordersview`.`address_phonenumber` AS `address_phonenumber` FROM `ordersview` WHERE `ordersview`.`order_status` = 'prepared' OR `ordersview`.`order_status` = 'out for delivery' GROUP BY dayofmonth(`ordersview`.`order_createddate`)  ;

-- --------------------------------------------------------

--
-- Structure for view `rates`
--
DROP TABLE IF EXISTS `rates`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rates`  AS SELECT `cart`.`cart_itemid` AS `item_id`, sum(`orders`.`order_rate`) / count(`cart`.`cart_itemid`) AS `rate` FROM (`orders` join `cart` on(`cart`.`cart_id` = `orders`.`order_cartid`)) WHERE `orders`.`order_status` = 'done' AND `orders`.`order_rate` <> 0 GROUP BY `cart`.`cart_itemid``cart_itemid`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `user_id` (`address_userid`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_email` (`admin_email`),
  ADD UNIQUE KEY `admin_phone` (`admin_phone`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_itemid` (`cart_itemid`),
  ADD KEY `cart_userid` (`cart_userid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorie_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `coupon` (`coupon`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD UNIQUE KEY `delivery_email` (`delivery_email`),
  ADD UNIQUE KEY `delivery_phone` (`delivery_phone`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite_itemsid` (`favorite_itemid`),
  ADD KEY `favorite_userid` (`favorite_userid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_categorie` (`item_categorie`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `notification_userid` (`notification_userid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `order_userid` (`order_userid`),
  ADD KEY `order_addressid` (`order_addressid`),
  ADD KEY `order_coupon` (`order_coupon`);

--
-- Indexes for table `texts`
--
ALTER TABLE `texts`
  ADD PRIMARY KEY (`text_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_phone` (`user_phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=554;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;

--
-- AUTO_INCREMENT for table `texts`
--
ALTER TABLE `texts`
  MODIFY `text_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`address_userid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_itemid`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_userid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`favorite_itemid`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favourites_ibfk_2` FOREIGN KEY (`favorite_userid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`item_categorie`) REFERENCES `categories` (`categorie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`notification_userid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`order_userid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`order_addressid`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`order_coupon`) REFERENCES `coupon` (`coupon`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

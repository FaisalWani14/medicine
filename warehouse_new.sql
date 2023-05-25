-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2023 at 03:58 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warehouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_Id` int(11) NOT NULL,
  `Staff_Id` int(6) DEFAULT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Phone_Cus` varchar(15) DEFAULT NULL,
  `Email_Cus` varchar(50) DEFAULT NULL,
  `Address_Cus` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_Id`, `Staff_Id`, `First_Name`, `Last_Name`, `Phone_Cus`, `Email_Cus`, `Address_Cus`) VALUES
(1, 1, 'John', 'Doe', '555-1234', 'john.doe@example.com', '123 Main St'),
(2, 2, 'Jane', 'Smith', '555-5678', 'jane.smith@example.com', '456 Elm St'),
(3, 3, 'Michael', 'Johnson', '555-9876', 'michael.johnson@example.com', '789 Oak Ave'),
(4, 1, 'Emily', 'Davis', '555-4321', 'emily.davis@example.com', '321 Pine St'),
(5, 2, 'David', 'Wilson', '555-8765', 'david.wilson@example.com', '654 Cedar Ave'),
(6, 3, 'Sarah', 'Anderson', '555-2345', 'sarah.anderson@example.com', '987 Maple St'),
(7, 1, 'Ryan', 'Taylor', '555-6789', 'ryan.taylor@example.com', '654 Oak St'),
(8, 2, 'Jessica', 'Brown', '555-7654', 'jessica.brown@example.com', '321 Elm St'),
(9, 3, 'Daniel', 'Thomas', '555-5432', 'daniel.thomas@example.com', '987 Cedar Ave'),
(10, 1, 'Laura', 'Robinson', '555-8765', 'laura.robinson@example.com', '456 Pine St'),
(11, 2, 'Matthew', 'Harris', '555-3456', 'matthew.harris@example.com', '789 Maple St'),
(12, 3, 'Olivia', 'Lee', '555-7890', 'olivia.lee@example.com', '654 Oak St'),
(13, 1, 'William', 'Clark', '555-6543', 'william.clark@example.com', '321 Elm St'),
(14, 2, 'Sophia', 'Young', '555-4321', 'sophia.young@example.com', '987 Cedar Ave'),
(15, 3, 'Emma', 'Allen', '555-9876', 'emma.allen@example.com', '456 Pine St'),
(16, 1, 'Andrew', 'Lewis', '555-2345', 'andrew.lewis@example.com', '789 Maple St'),
(17, 2, 'Abigail', 'King', '555-6789', 'abigail.king@example.com', '654 Oak St'),
(18, 3, 'James', 'Hall', '555-7654', 'james.hall@example.com', '321 Elm St'),
(19, 1, 'Mia', 'Baker', '555-5432', 'mia.baker@example.com', '987 Cedar Ave'),
(20, 2, 'Benjamin', 'Wright', '555-8765', 'benjamin.wright@example.com', '456 Pine St');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Order_Id` int(11) NOT NULL,
  `Customer_Id` int(6) DEFAULT NULL,
  `Date_of_Order` date DEFAULT NULL,
  `Order_Detail` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Order_Id`, `Customer_Id`, `Date_of_Order`, `Order_Detail`) VALUES
(1, 1, '2023-04-24', 'Aspirin'),
(2, 2, '2023-05-02', 'Ibuprofen'),
(3, 3, '2023-05-03', 'Acetaminophen'),
(4, 4, '2023-05-04', 'Lisinopril'),
(5, 5, '2023-05-05', 'Metformin'),
(6, 6, '2023-05-06', 'Simvastatin'),
(7, 7, '2023-05-07', 'Loratadine'),
(8, 8, '2023-05-08', 'Amoxicillin'),
(9, 9, '2023-05-09', 'Omeprazole'),
(10, 10, '2023-05-10', 'Prednisone'),
(11, 1, '2023-05-11', 'Ciprofloxacin'),
(12, 2, '2023-05-12', 'Fluoxetine'),
(13, 3, '2023-05-13', 'Metoprolol'),
(14, 4, '2023-05-14', 'Escitalopram'),
(15, 5, '2023-05-15', 'Atorvastatin'),
(16, 6, '2023-05-16', 'Losartan'),
(17, 7, '2023-05-17', 'Alprazolam'),
(18, 8, '2023-05-18', 'Warfarin'),
(19, 9, '2023-05-19', 'Hydrochlorothiazide'),
(20, 10, '2023-05-20', 'Metoprolol');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `Order_Detail_Id` int(11) NOT NULL,
  `Product_Id` int(6) DEFAULT NULL,
  `Order_Id` int(6) DEFAULT NULL,
  `Bill_Number` int(20) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Unit_Price` decimal(10,2) DEFAULT NULL,
  `Discount` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`Order_Detail_Id`, `Product_Id`, `Order_Id`, `Bill_Number`, `Quantity`, `Unit_Price`, `Discount`, `Total`, `Date`) VALUES
(1, 1, 1, 1, 5, '10.99', '0.50', '49.95', '2023-05-01'),
(2, 2, 2, 2, 3, '5.99', '0.20', '17.97', '2023-05-02'),
(3, 3, 3, 3, 2, '7.50', '0.00', '15.00', '2023-05-03'),
(4, 4, 4, 4, 1, '2.99', '0.10', '2.69', '2023-05-04'),
(5, 5, 5, 5, 4, '3.49', '0.25', '11.72', '2023-05-05'),
(6, 1, 6, 6, 2, '10.99', '0.00', '21.98', '2023-05-06'),
(7, 2, 7, 7, 3, '5.99', '0.15', '15.28', '2023-05-07'),
(8, 3, 8, 8, 1, '7.50', '0.00', '7.50', '2023-05-08'),
(9, 4, 9, 9, 5, '2.99', '0.20', '14.95', '2023-05-09'),
(10, 5, 10, 10, 2, '3.49', '0.00', '6.98', '2023-05-10'),
(11, 1, 11, 11, 3, '10.99', '0.10', '29.67', '2023-05-11'),
(12, 2, 12, 12, 4, '5.99', '0.00', '23.96', '2023-05-12'),
(13, 3, 13, 13, 2, '7.50', '0.05', '14.25', '2023-05-13'),
(14, 4, 14, 14, 1, '2.99', '0.00', '2.99', '2023-05-14'),
(15, 5, 15, 15, 3, '3.49', '0.10', '9.94', '2023-05-15'),
(16, 1, 16, 16, 2, '10.99', '0.00', '21.98', '2023-05-16'),
(17, 2, 17, 17, 4, '5.99', '0.20', '22.76', '2023-05-17'),
(18, 3, 18, 18, 1, '7.50', '0.00', '7.50', '2023-05-18'),
(19, 4, 19, 19, 5, '2.99', '0.15', '14.95', '2023-05-19'),
(20, 5, 20, 20, 2, '3.49', '0.00', '6.98', '2023-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Bill_Number` int(11) NOT NULL,
  `Payment_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Bill_Number`, `Payment_type`) VALUES
(1, 'Credit Card'),
(2, 'Cash'),
(3, 'Debit Card'),
(4, 'Cash'),
(5, 'Credit Card'),
(6, 'Cash'),
(7, 'Debit Card'),
(8, 'Cash'),
(9, 'Credit Card'),
(10, 'Cash'),
(11, 'Debit Card'),
(12, 'Cash'),
(13, 'Credit Card'),
(14, 'Cash'),
(15, 'Debit Card'),
(16, 'Cash'),
(17, 'Credit Card'),
(18, 'Cash'),
(19, 'Debit Card'),
(20, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_Id` int(11) NOT NULL,
  `Supplier_Id` int(6) DEFAULT NULL,
  `Product_Name` varchar(300) DEFAULT NULL,
  `Product_Description` varchar(300) DEFAULT NULL,
  `Product_Unit` varchar(100) DEFAULT NULL,
  `Product_Price` decimal(65,2) DEFAULT NULL,
  `Product_Status` varchar(50) DEFAULT NULL,
  `Product_Category` varchar(255) DEFAULT 'other',
  `Product_Img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_Id`, `Supplier_Id`, `Product_Name`, `Product_Description`, `Product_Unit`, `Product_Price`, `Product_Status`, `Product_Category`, `Product_Img`) VALUES
(1, 1, 'Medicine A', 'Description of Medicine A', 'Bottle', '10.99', 'In Stock', 'medicine', 'https://www.imodium.com.au/sites/imodium_au/files/imodium-advanced-product-image.png'),
(2, 2, 'Medicine B', 'Description of Medicine B', 'Box', '5.99', 'In Stock', 'set', 'https://img.rasset.ie/00072ba0-500.jpg'),
(3, 3, 'Medicine C', 'Description of Medicine C', 'Pack', '7.50', 'Out of Stock', 'medicine', 'https://www.imodium.com.au/sites/imodium_au/files/imodium-advanced-product-image.png'),
(4, 4, 'Medicine D', 'Description of Medicine D', 'Bottle', '2.99', 'In Stock', 'medicine', 'https://www.imodium.com.au/sites/imodium_au/files/imodium-advanced-product-image.png'),
(5, 5, 'Medicine E', 'Description of Medicine E', 'Pack', '3.49', 'In Stock', 'medicine', 'https://www.imodium.com.au/sites/imodium_au/files/imodium-advanced-product-image.png'),
(6, 6, 'Medicine F', 'Description of Medicine F', 'Bottle', '10.99', 'In Stock', 'set', 'https://img.rasset.ie/00072ba0-500.jpg'),
(7, 7, 'Medicine G', 'Description of Medicine G', 'Box', '5.99', 'Out of Stock', 'medicine', 'https://www.imodium.com.au/sites/imodium_au/files/imodium-advanced-product-image.png'),
(8, 8, 'Medicine H', 'Description of Medicine H', 'Pack', '7.50', 'In Stock', 'other', 'https://medicine.tufts.edu/sites/g/files/lrezom436/files/styles/large/public/tufts_feeds/news/220914_ask_expert_acetaminophin_lg.jpg?itok=CY-5HEaY'),
(9, 9, 'Medicine I', 'Description of Medicine I', 'Bottle', '2.99', 'In Stock', 'other', 'https://medicine.tufts.edu/sites/g/files/lrezom436/files/styles/large/public/tufts_feeds/news/220914_ask_expert_acetaminophin_lg.jpg?itok=CY-5HEaY'),
(10, 10, 'Medicine J', 'Description of Medicine J', 'Pack', '3.49', 'In Stock', 'set', 'https://img.rasset.ie/00072ba0-500.jpg'),
(11, 1, 'Medicine K', 'Description of Medicine K', 'Bottle', '10.99', 'In Stock', 'other', 'https://medicine.tufts.edu/sites/g/files/lrezom436/files/styles/large/public/tufts_feeds/news/220914_ask_expert_acetaminophin_lg.jpg?itok=CY-5HEaY'),
(12, 2, 'Medicine L', 'Description of Medicine L', 'Box', '5.99', 'Out of Stock', 'other', 'https://medicine.tufts.edu/sites/g/files/lrezom436/files/styles/large/public/tufts_feeds/news/220914_ask_expert_acetaminophin_lg.jpg?itok=CY-5HEaY'),
(13, 3, 'Medicine M', 'Description of Medicine M', 'Pack', '7.50', 'In Stock', 'other', 'https://medicine.tufts.edu/sites/g/files/lrezom436/files/styles/large/public/tufts_feeds/news/220914_ask_expert_acetaminophin_lg.jpg?itok=CY-5HEaY'),
(14, 4, 'Medicine N', 'Description of Medicine N', 'Bottle', '2.99', 'In Stock', 'promotion', 'https://png.pngtree.com/element_our/20200610/ourlarge/pngtree-disinfection-cotton-swab-medicine-image_2246835.jpg'),
(15, 5, 'Medicine O', 'Description of Medicine O', 'Pack', '3.49', 'In Stock', 'set', 'https://img.rasset.ie/00072ba0-500.jpg'),
(16, 6, 'Medicine P', 'Description of Medicine P', 'Bottle', '10.99', 'In Stock', 'promotion', 'https://png.pngtree.com/element_our/20200610/ourlarge/pngtree-disinfection-cotton-swab-medicine-image_2246835.jpg'),
(17, 7, 'Medicine Q', 'Description of Medicine Q', 'Box', '5.99', 'Out of Stock', 'promotion', 'https://png.pngtree.com/element_our/20200610/ourlarge/pngtree-disinfection-cotton-swab-medicine-image_2246835.jpg'),
(18, 8, 'Medicine R', 'Description of Medicine R', 'Pack', '7.50', 'In Stock', 'promotion', 'https://png.pngtree.com/element_our/20200610/ourlarge/pngtree-disinfection-cotton-swab-medicine-image_2246835.jpg'),
(19, 9, 'Medicine S', 'Description of Medicine S', 'Bottle', '2.99', 'In Stock', 'medicine', 'https://www.imodium.com.au/sites/imodium_au/files/imodium-advanced-product-image.png'),
(20, 10, 'Medicine T', 'Description of Medicine T', 'Pack', '3.49', 'In Stock', 'set', 'https://img.rasset.ie/00072ba0-500.jpg'),
(21, 1, 'test', 'test', '1', '1950.00', 'In Stock', 'promotion', 'https://png.pngtree.com/element_our/20200610/ourlarge/pngtree-disinfection-cotton-swab-medicine-image_2246835.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_Id` int(11) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Email_Staff` varchar(100) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Phone_Number` int(11) DEFAULT NULL,
  `Staff_Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_Id`, `First_Name`, `Last_Name`, `Email_Staff`, `Username`, `Password`, `Phone_Number`, `Staff_Address`) VALUES
(0, '', 'SAS', 'SSDD', '', 'sssss', NULL, NULL),
(1, ' Bob ', ' Smith ', 'Bob111@gmail.com', 'Bobsmith', '123456', NULL, NULL),
(2, 'Lucy', 'Groot', 'Lucy222@gmail.com', 'LucyGroot', '024684', NULL, NULL),
(3, 'Pat', 'Turner', 'Pat245@hotmail.com', 'PatTurner', '584782', NULL, NULL),
(4, 'admin', NULL, NULL, 'admin', 'admin', NULL, NULL),
(5, 'JUAY', 'JAUY', 'j@j', 'JUAY', 'JUAY', 1234567890, 'phuket'),
(6, NULL, NULL, NULL, 'ca', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_Id` int(11) NOT NULL,
  `Email_Sup` varchar(50) DEFAULT NULL,
  `Name_Sup` varchar(50) DEFAULT NULL,
  `Address_Sup` varchar(100) DEFAULT NULL,
  `Phone_Sup` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Supplier_Id`, `Email_Sup`, `Name_Sup`, `Address_Sup`, `Phone_Sup`) VALUES
(1, 'supplier1@example.com', 'ABC Pharmaceuticals', '123 Pharmacy Street, City, Country', '123-456-7890'),
(2, 'supplier2@example.com', 'XYZ Pharmaceuticals', '456 Pharmacy Avenue, City, Country', '987-654-3210'),
(3, 'supplier3@example.com', 'Pharma Solutions', '789 Pharmacy Road, City, Country', '456-123-7890'),
(4, 'supplier4@example.com', 'MediLife Pharmaceuticals', '321 Pharmacy Lane, City, Country', '789-456-1230'),
(5, 'supplier5@example.com', 'Global Health Pharma', '789 Pharmacy Lane, City, Country', '654-321-7890'),
(6, 'supplier6@example.com', 'PharmaCare', '987 Pharmacy Road, City, Country', '321-789-4560'),
(7, 'supplier7@example.com', 'MediPharm', '456 Pharmacy Street, City, Country', '789-123-4560'),
(8, 'supplier8@example.com', 'Prime Pharmaceuticals', '123 Pharmacy Avenue, City, Country', '456-789-1230'),
(9, 'supplier9@example.com', 'HealthLink Pharma', '987 Pharmacy Lane, City, Country', '321-456-7890'),
(10, 'supplier10@example.com', 'VitaLife Pharmaceuticals', '654 Pharmacy Road, City, Country', '789-321-4560'),
(11, 'supplier11@example.com', 'MediCure', '321 Pharmacy Street, City, Country', '456-789-3210'),
(12, 'supplier12@example.com', 'PharmaGen', '789 Pharmacy Avenue, City, Country', '123-456-7890'),
(13, 'supplier13@example.com', 'MediWorld', '456 Pharmacy Road, City, Country', '987-654-3210'),
(14, 'supplier14@example.com', 'Global Pharma Solutions', '123 Pharmacy Lane, City, Country', '456-123-7890'),
(15, 'supplier15@example.com', 'PharmaLink', '789 Pharmacy Street, City, Country', '789-456-1230'),
(16, 'supplier16@example.com', 'LifeCare Pharmaceuticals', '654 Pharmacy Avenue, City, Country', '654-321-7890'),
(17, 'supplier17@example.com', 'PharmaCo', '987 Pharmacy Road, City, Country', '321-789-4560'),
(18, 'supplier18@example.com', 'MediPro', '456 Pharmacy Street, City, Country', '789-123-4560'),
(19, 'supplier19@example.com', 'HealthCare Pharmaceuticals', '123 Pharmacy Avenue, City, Country', '456-789-1230'),
(20, 'supplier20@example.com', 'MediPlus', '987 Pharmacy Lane, City, Country', '321-456-7890');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_Id`),
  ADD KEY `customer_ibfk_1` (`Staff_Id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_Id`),
  ADD KEY `orders_ibfk_1` (`Customer_Id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`Order_Detail_Id`),
  ADD KEY `order_details_ibfk_1` (`Product_Id`),
  ADD KEY `order_details_ibfk_2` (`Order_Id`),
  ADD KEY `order_details_ibfk_3` (`Bill_Number`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Bill_Number`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_Id`),
  ADD KEY `product_ibfk_1` (`Supplier_Id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_Id`) USING BTREE;

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Order_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `Order_Detail_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Bill_Number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `Staff_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `Supplier_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Staff_Id`) REFERENCES `staff` (`Staff_Id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `customer` (`Customer_Id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`Product_Id`) REFERENCES `product` (`Product_Id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`Order_Id`) REFERENCES `orders` (`Order_Id`),
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`Bill_Number`) REFERENCES `payment` (`Bill_Number`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Supplier_Id`) REFERENCES `supplier` (`Supplier_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

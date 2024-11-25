-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2024 at 03:08 PM
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
-- Database: `pharmacy_v1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admitted_patients`
--

CREATE TABLE `admitted_patients` (
  `id` int(10) NOT NULL,
  `ward_name` varchar(255) NOT NULL,
  `diagonisis` varchar(255) NOT NULL,
  `patient_no` varchar(255) NOT NULL,
  `patient_id` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `patient_number` varchar(200) NOT NULL,
  `patient_name` varchar(200) NOT NULL,
  `patient_condation` varchar(200) NOT NULL,
  `DOA` date NOT NULL DEFAULT current_timestamp(),
  `DOD` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admitted_patients`
--

INSERT INTO `admitted_patients` (`id`, `ward_name`, `diagonisis`, `patient_no`, `patient_id`, `status`, `patient_number`, `patient_name`, `patient_condation`, `DOA`, `DOD`) VALUES
(25, 'Ward D', '', 'Invoice No-  0230333', '52', '1', '1', 'Sample Patient 2', '', '2021-06-27', ''),
(26, 'Ward B', '', 'Invoice No-  33933232', '53', '1', '1', 'jane doe', '', '2021-06-27', '');

-- --------------------------------------------------------

--
-- Table structure for table `damaged`
--

CREATE TABLE `damaged` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `qty` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `damaged`
--

INSERT INTO `damaged` (`id`, `name`, `price`, `amount`, `qty`) VALUES
(2, 'Piliton', '50', '100', '2'),
(3, 'Cetrizin', '25', '125', '5');

-- --------------------------------------------------------

--
-- Table structure for table `expired_medince`
--

CREATE TABLE `expired_medince` (
  `id` int(10) NOT NULL,
  `medicine_name` varchar(255) NOT NULL,
  `date_expired` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `qty` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expired_medince`
--

INSERT INTO `expired_medince` (`id`, `medicine_name`, `date_expired`, `amount`, `qty`) VALUES
(1, 'cetcine ', '2021-12-01', '50', '5'),
(2, 'ciprofloxacin ', '2022-12-31', '300', '8'),
(3, 'amoxclav 375 ', '2022-12-01', '0', '1'),
(4, 'ORS ', '2022-12-01', '20', '6'),
(5, 'xpen ', '2022-11-01', '500', '5'),
(6, 'Paracetamol ', '2021-06-30', '0', '1'),
(7, 'Tridex || Expiry Date 2023-10-27 ', '2021-06-30', '60', '1'),
(8, 'Tridex || Expiry Date 2023-10-27 ', '2021-06-18', '300', '5'),
(9, 'Cetrizin ', '2023-10-19', '400', '10'),
(10, 'Panadol ', '2021-06-01', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `opening_date` varchar(255) NOT NULL,
  `closing_balance` varchar(255) NOT NULL,
  `opening_balance` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `name`, `address`, `phone_no`, `email`, `opening_date`, `closing_balance`, `opening_balance`) VALUES
(7, 'IT SKILLS ACADEMY', '880 Kenya', '07 00 000 00 ', 'johnDoe@gmail', '2024-01-01', '2025-01-01', '10000000');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `medicines` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `medicine_name` VARCHAR(255) NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- 4. Create Inventory Table
CREATE TABLE `inventory` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `medicine_id` INT(10) NOT NULL,  -- Foreign key to `medicines`
  `capacity` VARCHAR(255) NOT NULL,
  `qty_item` VARCHAR(255) NOT NULL,
  `price` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`medicine_id`) REFERENCES `medicines`(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
-- --------------------------------------------------------

--
-- Table structure for table `invoice_pay`
--

CREATE TABLE `invoice_pay` (
  `id` int(10) DEFAULT NULL,
  `price` varchar(200) NOT NULL,
  `total` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `purchase_no` varchar(200) NOT NULL,
  `qty` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice_pay`
--

INSERT INTO `invoice_pay` (`id`, `price`, `total`, `date`, `purchase_no`, `qty`) VALUES
(NULL, '500', '5000', '2024-01-20', 'Pn2342232', '10');


CREATE TABLE `conditions` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `condition_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- 2. Create Patients Table
CREATE TABLE `patients` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `patient_no` VARCHAR(255) NOT NULL,
  `patient_name` VARCHAR(255) NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `dob` DATE NOT NULL,
  `status` VARCHAR(12) NOT NULL DEFAULT '0',  -- Default status
  `condition_id` INT(10) NOT NULL,  -- Foreign key to `conditions`
  `admission_status` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`condition_id`) REFERENCES `conditions`(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy_stock`
--

CREATE TABLE `pharmacy_stock` (
  `id` int(10) NOT NULL,
  `medicine_name` varchar(255) NOT NULL,
  `pharmacy_Qty` varchar(255) NOT NULL DEFAULT '0',
  `expiry_date` date NOT NULL DEFAULT current_timestamp(),
  `amount` varchar(255) NOT NULL,
  `stock_out` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL DEFAULT '0',
  `capacity` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sale_date` varchar(200) NOT NULL,
  `dosage_sold` varchar(255) NOT NULL,
  `dosage` varchar(255) NOT NULL,
  `price_dosage` varchar(255) NOT NULL DEFAULT '0',
  `app` varchar(255) NOT NULL,
  `half_dosage_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pharmacy_stock`
--

INSERT INTO `pharmacy_stock` (`id`, `medicine_name`, `pharmacy_Qty`, `expiry_date`, `amount`, `stock_out`, `price`, `capacity`, `type`, `sale_date`, `dosage_sold`, `dosage`, `price_dosage`, `app`, `half_dosage_price`) VALUES
(1, 'Brufen', '0', '2023-06-15', '', '', '30', '10', 'tablet', '', '', '', '', '', 0),
(2, 'Piliton', '21', '2023-06-15', '', '', '30', '50mg', 'tablet', '', '', '', '', '', 0),
(3, 'Cetrizin', '2', '0000-00-00', '', '', '25', '50mg', 'tablet', '', '', '', '', '', 0),
(4, 'Jadell', '1', '2024-03-14', '', '', '500', '60mg', 'tablet', '', '', '', '', '', 0),
(5, 'Piliton', '54', '2023-10-18', '', '', '', '60ml', 'Tablet', '', 'Yes', '10', '100', '100', 50),
(6, 'Paracetamal', '0', '2027-02-27', '', '', '100', '50mg', 'Tablet', '', '', '', '', '', 0),
(7, 'ABZ', '0', '2023-06-20', '', '', '20', '60mg', 'Tablet', '', '', '', '', '', 0),
(9, 'Panadol', '0', '2021-06-01', '', '', '15', '60mg', 'Tablet', '', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy_stock_items`
--

CREATE TABLE `pharmacy_stock_items` (
  `id` int(10) NOT NULL,
  `item_name` varchar(200) NOT NULL,
  `capacity` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `expiry_date` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pharmacy_stock_items`
--

INSERT INTO `pharmacy_stock_items` (`id`, `item_name`, `capacity`, `price`, `expiry_date`) VALUES
(3, 'needles', '34', '500', '2021-05-25 13:21:17.445208'),
(4, 'Catheter', '', '', '2021-05-26 17:14:07.607543'),
(5, 'test', '', '', '2021-05-29 18:03:42.684105'),
(6, '', '', '', '2021-05-29 18:06:06.156792'),
(7, 'podi', '', '', '2021-05-29 18:28:48.730678');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `purchase_id` int(10) NOT NULL,
  `medicine_name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `supplier` varchar(244) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT '0',
  `purchase_no` varchar(255) NOT NULL,
  `total` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_order`
--

INSERT INTO `purchase_order` (`purchase_id`, `medicine_name`, `price`, `qty`, `supplier`, `status`, `purchase_no`, `total`) VALUES
(3, 'Panadol', '15', '2', 'supplier', '0', 'Purchase No-  53020', ''),
(4, 'Jadell', '500', '10', 'jane solutions', '1', 'Pn2342232', '5000'),
(5, 'Panadol', '15', '500', 'jane solutions', '0', 'Pn20327', '7500');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

-- 5. Create Sales Table
CREATE TABLE `sales` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `medicine_id` INT(10) NOT NULL,  -- Foreign key to `inventory`
  `qty` INT(10) NOT NULL,
  `price` DECIMAL(10, 2) NOT NULL,
  `sale_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`medicine_id`) REFERENCES `inventory`(`id`)
);

--
-- Table structure for table `sales_order`
--
CREATE TABLE `sales_order` (
  `transaction_id` INT(10) NOT NULL AUTO_INCREMENT,
  `patient_id` INT(10) NOT NULL,  -- Foreign key to `patients`
  `order_date` DATETIME NOT NULL,
  `status` VARCHAR(50) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`transaction_id`),
  FOREIGN KEY (`patient_id`) REFERENCES `patients`(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(12) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`, `price`) VALUES
(1, 'Wood Checkup', '200'),
(2, 'Counseling', '100'),
(3, 'Jadel Insertion', '1000'),
(4, 'sample servise name', '500');

-- --------------------------------------------------------

--
-- Table structure for table `service_order`
--

CREATE TABLE `service_order` (
  `service_id` int(10) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `patient_no` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `status` varchar(200) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_order`
--

INSERT INTO `service_order` (`service_id`, `service_name`, `description`, `patient_no`, `price`, `status`) VALUES
(36, 'Counseling', 'counseling', 'Invoice No-  3823030', '100', '0'),
(37, 'sample servise name', 'sample description', 'Invoice No-  3823030', '1000', '0'),
(38, 'Wood Checkup', 'fdgg', 'Invoice No-  0230333', '100', '0'),
(39, 'Jadel Insertion', 'insertion', 'Invoice No-  33933232', '1000', '0');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `id` int(10) NOT NULL,
  `medicine_name` varchar(255) NOT NULL,
  `date_received` date NOT NULL,
  `Qty` varchar(255) NOT NULL DEFAULT '0',
  `expiry_date` date NOT NULL DEFAULT current_timestamp(),
  `amount` varchar(255) NOT NULL,
  `stock_out` varchar(255) NOT NULL DEFAULT '0',
  `price` varchar(255) NOT NULL DEFAULT '0',
  `capacity` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dosage_sold` varchar(255) NOT NULL,
  `dosage` varchar(255) NOT NULL,
  `price_dosage` varchar(255) NOT NULL DEFAULT '0',
  `app` varchar(255) NOT NULL,
  `half_dosage_price` int(11) NOT NULL,
  `confirm` varchar(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `medicine_name`, `date_received`, `Qty`, `expiry_date`, `amount`, `stock_out`, `price`, `capacity`, `type`, `dosage_sold`, `dosage`, `price_dosage`, `app`, `half_dosage_price`, `confirm`) VALUES
(4, 'Jadell', '0000-00-00', '57', '2024-03-14', '', '0', '550', '60mg', 'tablet', '', '', '', '', 0, '0'),
(5, 'Piliton', '0000-00-00', '100', '2023-10-18', '', '0', '', '60ml', 'Tablet', 'Yes', '10', '100', '100', 50, '0'),
(6, 'Paracetamal', '0000-00-00', '15', '2027-02-27', '', '0', '10', '50mg', 'Tablet', '', '', '0', '', 0, '0'),
(7, 'ABZ', '0000-00-00', '14', '2023-06-20', '', '0', '10', '60mg', 'Tablet', '', '', '', '', 0, '0'),
(9, 'Panadol', '0000-00-00', '500', '2021-06-01', '', '0', '20', '60mg', 'Tablet', '', '', '', '', 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `store_items`
--

CREATE TABLE `store_items` (
  `id` int(200) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `capacity` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `expiry_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `store_items`
--

INSERT INTO `store_items` (`id`, `item_name`, `capacity`, `price`, `expiry_date`) VALUES
(3, 'needles', '20', '150', '2026-10-31'),
(4, 'Catheter', '23', '200', '2023-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) NOT NULL,
  `supplier_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplier_name`) VALUES
(1, 'jane solutions');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(3, 'Nurse', 'Nurse'),
(4, 'Pharmacist', 'Pharmacist'),
(5, 'Registrar', 'Registrar'),
(6, 'lab', 'lab'),
(12, 'John', '$2y$10$cx1jRJqjdXPjvuZvbyEcyO125zYri1iRa1waZAoQxKSicp4tMw1tO'),
(13, 'james', '$2y$10$Bb7KlN.eLjecx2BFR6iADu391bC3DI6yzsWPlXjmhavSYdMfL6nti'),
(14, 'ADMIN', '$2y$10$3CMbJlViMPvVwdF20iOGn.Xl13ijKFgpJnJXYB0mtEK5osM.evBZ2');

-- --------------------------------------------------------

--
-- Table structure for table `wards`
--

CREATE TABLE `wards` (
  `id` int(10) NOT NULL,
  `ward_name` varchar(255) NOT NULL,
  `capacity` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wards`
--

INSERT INTO `wards` (`id`, `ward_name`, `capacity`) VALUES
(2, 'Ward A', 50),
(3, 'Ward B', 60),
(4, 'Ward C', 50),
(5, 'Ward D', 40);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admitted_patients`
--
ALTER TABLE `admitted_patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `damaged`
--

--
-- Indexes for table `expired_medince`
--
ALTER TABLE `expired_medince`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);


--
-- Indexes for table `pharmacy_stock`
--
ALTER TABLE `pharmacy_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacy_stock_items`
--
ALTER TABLE `pharmacy_stock_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`purchase_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_order`
--
ALTER TABLE `service_order`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_items`
--
ALTER TABLE `store_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wards`
--
ALTER TABLE `wards`
  ADD PRIMARY KEY (`id`);


--
-- AUTO_INCREMENT for table `admitted_patients`
--
ALTER TABLE `admitted_patients`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `expired_medince`
--
ALTER TABLE `expired_medince`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pharmacy_stock`
--
ALTER TABLE `pharmacy_stock`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pharmacy_stock_items`
--
ALTER TABLE `pharmacy_stock_items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `purchase_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `service_order`
--
ALTER TABLE `service_order`
  MODIFY `service_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `store_items`
--
ALTER TABLE `store_items`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `wards`
--
ALTER TABLE `wards`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;


-- 7. Trigger to Update Inventory After Sale
DELIMITER $$

CREATE TRIGGER update_inventory_after_sale
AFTER INSERT ON `sales`
FOR EACH ROW
BEGIN
  UPDATE `inventory`
  SET `qty_item` = `qty_item` - NEW.qty
  WHERE `medicine_id` = NEW.medicine_id;
END$$

DELIMITER ;

-- 8. Trigger to Prevent Deletion of Admitted Patients
DELIMITER $$

CREATE TRIGGER prevent_patient_deletion
BEFORE DELETE ON `patients`
FOR EACH ROW
BEGIN
  IF OLD.status = 'Admitted' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete an admitted patient';
  END IF;
END$$

DELIMITER ;

-- 9. Stored Procedure to Update Sales Order Status Based on Total Sale Amount
DELIMITER $$

CREATE PROCEDURE update_sales_status()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE v_total_amount DECIMAL(10,2);
  DECLARE v_transaction_id INT;

  -- Declare cursor for processing sales orders
  DECLARE sale_cursor CURSOR FOR
    SELECT `transaction_id`, SUM(`price` * `qty`) AS total
    FROM `sales`
    GROUP BY `transaction_id`;

  -- Declare NOT FOUND handler
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN sale_cursor;

  read_loop: LOOP
    FETCH sale_cursor INTO v_transaction_id, v_total_amount;

    IF done THEN
      LEAVE read_loop;
    END IF;

    -- Update the sales order status based on the total amount
    IF v_total_amount > 1000 THEN
      UPDATE `sales_order`
      SET `status` = 'Completed'
      WHERE `transaction_id` = v_transaction_id;
    ELSE
      UPDATE `sales_order`
      SET `status` = 'Pending'
      WHERE `transaction_id` = v_transaction_id;
    END IF;
  END LOOP;

  CLOSE sale_cursor;
END$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

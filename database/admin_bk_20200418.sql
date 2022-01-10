-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.10-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for admin
CREATE DATABASE IF NOT EXISTS `admin` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;
USE `admin`;

-- Dumping structure for table admin.admin_system
CREATE TABLE IF NOT EXISTS `admin_system` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(50) DEFAULT NULL,
  `first_page_url` varchar(50) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT 'used in html checkbox',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.admin_system: ~5 rows (approximately)
/*!40000 ALTER TABLE `admin_system` DISABLE KEYS */;
INSERT INTO `admin_system` (`sid`, `sname`, `first_page_url`, `icon`, `name`) VALUES
	(1, 'Vehicle', 'vehicle/vehicle.php', 'fas fa-taxi fa-10x', 'vehicle'),
	(2, 'Stationary', 'stationary/report_stock_summary.php', 'fas fa-pen-alt fa-10x', 'stationary'),
	(3, 'Fire Extinguisher', 'fire_extinguisher/listing.php', 'fas fa-fire-extinguisher fa-10x', 'fire_extinguisher'),
	(4, 'Add User', 'manage_user/add_new_user.php', 'fas fa-user-plus fa-10x', 'add_user'),
	(5, 'Bill', 'bill/add_new_bill.php', 'fas fa-file-invoice fa-10x', 'billing'),
	(6, 'Office Management', 'office_management/request_list.php', 'fas fa-briefcase fa-10x', 'office_management');
/*!40000 ALTER TABLE `admin_system` ENABLE KEYS */;

-- Dumping structure for table admin.bill_account_setup
CREATE TABLE IF NOT EXISTS `bill_account_setup` (
  `acc_id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_type` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `account_no` varchar(50) DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `tariff` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `serial_no` varchar(50) DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  `property_type` int(11) DEFAULT NULL COMMENT '1-shoplot, 2 -house',
  `hp_no` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `celcom_limit` double DEFAULT NULL,
  `package` varchar(50) DEFAULT NULL,
  `latest_package` varchar(50) DEFAULT NULL,
  `limit_rm` double DEFAULT NULL,
  `data` varchar(50) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `owner_ref` text DEFAULT NULL,
  `unit_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`acc_id`),
  KEY `Index 2` (`company_id`,`location_id`,`bill_type`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.bill_account_setup: ~15 rows (approximately)
/*!40000 ALTER TABLE `bill_account_setup` DISABLE KEYS */;
INSERT INTO `bill_account_setup` (`acc_id`, `bill_type`, `company_id`, `location_id`, `account_no`, `deposit`, `tariff`, `owner`, `serial_no`, `user`, `property_type`, `hp_no`, `position`, `reference`, `celcom_limit`, `package`, `latest_package`, `limit_rm`, `data`, `remark`, `owner_ref`, `unit_no`) VALUES
	(1, 1, 1, 5, '07881469/10373462', 38500, 'CM1(PERDAGANGAN VOLTAN RENDAH)', '', '', '', NULL, '', '', '', 0, '', '', 0, '', '', '', ''),
	(2, 2, 1, 5, '010254921900017', 3000, '', 'ENG PENG COLD STORAGE SDN BHD', '', '', NULL, '', '', '', 0, '', '', 0, '', '', '', ''),
	(3, 3, 1, 5, 'S45329-538-0106', 0, '', '', '', '', NULL, '', '', '088-491245', 0, '', '', 0, '', '', '', ''),
	(4, 4, 6, 0, '90744360', 0, '', '', '', 'ALICE YONG KHYUN YING', NULL, '', 'PURCHASING EXECUTIVE', '', 500, 'FIRST GOLD 80', 'FIRST GOLD B', 90, '10GB + 10 GB', 'COMPH H/P J4', '', ''),
	(5, 5, 6, 1, '', 0, '', '', '477847', '', NULL, '', '', '', 0, '', '', 0, '', '', '', ''),
	(6, 5, 4, 1, '', 0, '', '', '477855', '', NULL, '', '', '', 0, '', '', 0, '', '', '', ''),
	(7, 5, 3, 1, '', 0, '', '', '426968', '', NULL, '', '', '', 0, '', '', 0, '', '', '', ''),
	(8, 5, 3, 2, '', 0, '', '', '528508', '', NULL, '', '', '', 0, '', '', 0, '', '', '', ''),
	(9, 6, 1, 5, '', 0, '', '', '', '', NULL, '', '', '', 0, '', '', 0, '', '', 'C21-0', ''),
	(10, 6, 1, 5, '', 0, '', '', '', '', NULL, '', '', '', 0, '', '', 0, '', '', 'C21-1', ''),
	(11, 6, 19, 1, '', 0, '', '', '', '', NULL, '', '', '', 0, '', '', 0, '', '', '', 'C3-04-01'),
	(12, 6, 1, 2, '', 0, '', '', '', '', 2, '', '', '', 0, '', '', 0, '', '', '', 'C3-04-01'),
	(13, 4, 7, 0, '968646673', 0, '', '', '', 'MOHD FIRDAUS BIN RAHIM', 0, '', 'PRODUCTION EXECUTIVE', '', 500, 'FIRST GOLD 80', 'FIRST GOLD B', 100, '10GB + 10 GB', 'VIVO', '', ''),
	(14, 4, 6, 0, '73628205', 0, '', '', '', 'CHAI KIN FATT', 0, '', 'FARM MANAGER', '', 500, 'FIRST GOLD 80', 'FIRST GOLD B', 100, '10GB + 10 GB', '', '', ''),
	(15, 4, 6, 0, '90380608', 0, '', '', '', 'CHANG VUI LOI', 0, '', 'FARM MANAGER', '', 500, 'FIRST GOLD 80', 'FIRST GOLD B', 100, '10GB + 10 GB', '', '', '');
/*!40000 ALTER TABLE `bill_account_setup` ENABLE KEYS */;

-- Dumping structure for table admin.bill_billing
CREATE TABLE IF NOT EXISTS `bill_billing` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_type` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `account_no` varchar(50) DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `period_from` date DEFAULT NULL,
  `period_to` date DEFAULT NULL,
  `cheque_no` varchar(50) DEFAULT NULL,
  `paid_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `index` (`bill_type`,`company_id`,`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.bill_billing: ~9 rows (approximately)
/*!40000 ALTER TABLE `bill_billing` DISABLE KEYS */;
INSERT INTO `bill_billing` (`bill_id`, `bill_type`, `company_id`, `location_id`, `account_no`, `deposit`, `period_from`, `period_to`, `cheque_no`, `paid_date`, `due_date`) VALUES
	(1, 1, 1, 5, '07881469/10373462', 38500, '0000-00-00', '0000-00-00', 'HLBB700029', '0000-00-00', '0000-00-00'),
	(2, 1, 1, 5, '07881469/10373462', 38500, '0000-00-00', '0000-00-00', 'HLBB700029', '0000-00-00', '0000-00-00'),
	(3, 2, 1, 5, '01025492190017', 3000, '0000-00-00', '0000-00-00', 'HLBB100013', '0000-00-00', '0000-00-00'),
	(4, 3, 1, 5, 'S45329-538-0106', 0, '0000-00-00', '0000-00-00', 'HLBB700014', '0000-00-00', '0000-00-00'),
	(8, 3, 1, 5, 'S45329-538-0106', 0, '0000-00-00', '0000-00-00', 'HLBB703483', '0000-00-00', '0000-00-00'),
	(9, 3, 1, 5, 'S45329-538-01006', 0, '0000-00-00', '0000-00-00', 'HLBB703483', '0000-00-00', '0000-00-00'),
	(10, 3, 0, 0, '', 0, '0000-00-00', '0000-00-00', '', '0000-00-00', '0000-00-00'),
	(11, 1, 0, 0, '', 0, '0000-00-00', '0000-00-00', '', '0000-00-00', '0000-00-00'),
	(12, 2, 0, 0, '', 0, '0000-00-00', '0000-00-00', 'HLBB700029', '0000-00-00', '0000-00-00');
/*!40000 ALTER TABLE `bill_billing` ENABLE KEYS */;

-- Dumping structure for table admin.bill_billtype
CREATE TABLE IF NOT EXISTS `bill_billtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.bill_billtype: ~6 rows (approximately)
/*!40000 ALTER TABLE `bill_billtype` DISABLE KEYS */;
INSERT INTO `bill_billtype` (`id`, `name`) VALUES
	(1, 'SESB'),
	(2, 'JABATAN AIR'),
	(3, 'TELEKOM'),
	(4, 'CELCOM'),
	(5, 'PHOTOCOPY MACHINE'),
	(6, 'MANAGEMENT FEE');
/*!40000 ALTER TABLE `bill_billtype` ENABLE KEYS */;

-- Dumping structure for table admin.bill_celcom
CREATE TABLE IF NOT EXISTS `bill_celcom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_id` int(11) DEFAULT NULL,
  `bill_amount` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `acc_id` (`acc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.bill_celcom: ~24 rows (approximately)
/*!40000 ALTER TABLE `bill_celcom` DISABLE KEYS */;
INSERT INTO `bill_celcom` (`id`, `acc_id`, `bill_amount`, `date`) VALUES
	(1, 4, 76.95, '2020-01-10'),
	(2, 4, 77.15, '2020-02-10'),
	(3, 4, 77.15, '2020-03-10'),
	(4, 4, 76.3, '2020-04-01'),
	(5, 4, 77.4, '2020-05-01'),
	(6, 4, 76.3, '2020-06-01'),
	(7, 4, 76.75, '2020-07-01'),
	(8, 4, 76.3, '2020-08-01'),
	(9, 4, 76.3, '2020-09-01'),
	(10, 4, 76.3, '2020-10-01'),
	(11, 4, 76.55, '2020-11-01'),
	(12, 4, 78.45, '2020-12-01'),
	(13, 13, 75.45, '2020-01-01'),
	(14, 13, 75.7, '2020-02-01'),
	(15, 13, 76.3, '2020-03-01'),
	(16, 13, 153.7, '2020-04-01'),
	(17, 13, 81.2, '2020-05-01'),
	(18, 13, 75.45, '2020-06-01'),
	(19, 13, 75.25, '2020-07-01'),
	(20, 13, 75.25, '2020-08-01'),
	(21, 13, 80.9, '2020-09-01'),
	(22, 13, 78.65, '2020-10-01'),
	(23, 13, 86.3, '2020-11-01'),
	(24, 13, 88, '2020-12-01');
/*!40000 ALTER TABLE `bill_celcom` ENABLE KEYS */;

-- Dumping structure for table admin.bill_insurance_premium
CREATE TABLE IF NOT EXISTS `bill_insurance_premium` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `payment` double DEFAULT NULL,
  `payment_mode` varchar(20) DEFAULT NULL,
  `or_no` double DEFAULT NULL,
  `date_paid` date DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.bill_insurance_premium: ~0 rows (approximately)
/*!40000 ALTER TABLE `bill_insurance_premium` DISABLE KEYS */;
INSERT INTO `bill_insurance_premium` (`id`, `invoice_no`, `description`, `payment`, `payment_mode`, `or_no`, `date_paid`, `date_from`, `date_to`) VALUES
	(1, '123456789', 'testest fdhfj fgjghkgh,', 250, 'cash', 321654897, '2020-03-18', '2020-03-18', '2020-03-18');
/*!40000 ALTER TABLE `bill_insurance_premium` ENABLE KEYS */;

-- Dumping structure for table admin.bill_jabatan_air
CREATE TABLE IF NOT EXISTS `bill_jabatan_air` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_id` int(11) DEFAULT NULL,
  `meter_reading_from` double DEFAULT NULL,
  `meter_reading_to` double DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `cheque_no` varchar(50) DEFAULT NULL,
  `paid_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `rate_70` double DEFAULT NULL,
  `rate_71` double DEFAULT NULL,
  `usage_70` double DEFAULT NULL,
  `usage_71` double DEFAULT NULL,
  `credit_adjustment` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `adjustment` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index 2` (`acc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.bill_jabatan_air: ~5 rows (approximately)
/*!40000 ALTER TABLE `bill_jabatan_air` DISABLE KEYS */;
INSERT INTO `bill_jabatan_air` (`id`, `acc_id`, `meter_reading_from`, `meter_reading_to`, `date_start`, `date_end`, `cheque_no`, `paid_date`, `due_date`, `rate_70`, `rate_71`, `usage_70`, `usage_71`, `credit_adjustment`, `amount`, `adjustment`) VALUES
	(1, 2, 1755668, 1774585, '2018-12-03', '2019-01-11', 'HLBB100013', '2019-01-22', '1970-01-01', 140.8, 37658, 88, 18829, 0, 37798.8, 0),
	(2, 2, 1774585, 1788333, '2019-01-11', '2019-02-11', 'HLBB699878', '2019-02-20', '1970-01-01', 112, 27356, 70, 13678, 0, 27468, 0),
	(3, 2, 1788333, 1801694, '2019-02-11', '2019-03-12', 'HLBB401158', '2019-03-25', '1970-01-01', 105.6, 26590, 66, 13295, 0, 26695.6, 0),
	(4, 2, 1801694, 1811757, '2019-03-12', '2019-04-03', 'HLBB701195', '2019-04-12', '1970-01-01', 80, 20026, 50, 10013, 0, 20106, 0),
	(5, 2, 1811757, 1825658, '2019-04-03', '2019-05-01', 'HLBB699970', '2019-05-15', '1970-01-01', 100.8, 27676, 63, 13838, 0, 27776.8, 0);
/*!40000 ALTER TABLE `bill_jabatan_air` ENABLE KEYS */;

-- Dumping structure for table admin.bill_late_interest_charge
CREATE TABLE IF NOT EXISTS `bill_late_interest_charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_date` date DEFAULT NULL,
  `inv_no` varchar(50) DEFAULT NULL,
  `payment_due_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `payment_mode` varchar(10) DEFAULT NULL,
  `or_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.bill_late_interest_charge: ~3 rows (approximately)
/*!40000 ALTER TABLE `bill_late_interest_charge` DISABLE KEYS */;
INSERT INTO `bill_late_interest_charge` (`id`, `bill_date`, `inv_no`, `payment_due_date`, `description`, `amount`, `payment_mode`, `or_no`) VALUES
	(1, '2020-03-17', '123456789', '0000-00-00', 'test dafjpopa afjkfafjpoajg', 500, 'cash', '321654987'),
	(2, '2020-03-17', '123456789', '2020-03-17', 'test dafjpopa afjkfafjpoajg', 500, 'cash', '321654987'),
	(3, '2020-03-18', '321564789', '2020-03-18', 'loiknjuyghfgxdsewg fghfh gh gfstrsyiku', 120, 'cash', '321547846');
/*!40000 ALTER TABLE `bill_late_interest_charge` ENABLE KEYS */;

-- Dumping structure for table admin.bill_management_fee
CREATE TABLE IF NOT EXISTS `bill_management_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_id` int(11) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `payment_amount` double DEFAULT NULL,
  `payment_mode` varchar(10) DEFAULT NULL,
  `insurance_premium` double DEFAULT NULL,
  `interest_charge` double DEFAULT NULL,
  `official_receipt_no` varchar(50) DEFAULT NULL,
  `bill_inv_no` varchar(50) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `acc_id` (`acc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.bill_management_fee: ~4 rows (approximately)
/*!40000 ALTER TABLE `bill_management_fee` DISABLE KEYS */;
INSERT INTO `bill_management_fee` (`id`, `acc_id`, `description`, `payment_amount`, `payment_mode`, `insurance_premium`, `interest_charge`, `official_receipt_no`, `bill_inv_no`, `payment_date`, `received_date`) VALUES
	(1, 9, 'Maintenance Fee Grd Floor', 265, 'ibg', 0, 0, 'SOOOOO145', 'SC-0/2019/01/00021', '2019-01-17', '2019-01-07'),
	(2, 9, 'MAINTENANCE FEE GRD FLOOR', 265, 'ibg', 0, 0, 'SCC/HR0059', 'SC-0/2019/02/00021', '2019-02-19', '2019-02-07'),
	(3, 10, 'MAINTENANCE FEE GRD FLOOR', 175, 'ibg', 0, 0, 'SOOOOO145', 'SC-1/2019/01/00021', '2019-01-17', '2020-03-13'),
	(4, 12, 'SERVICE CHARGE', 255, 'ibg', 0, 0, 'BS-BLOR00003980', 'BS-BLS00002218', '2019-01-19', '2019-01-10');
/*!40000 ALTER TABLE `bill_management_fee` ENABLE KEYS */;

-- Dumping structure for table admin.bill_photocopy_machine
CREATE TABLE IF NOT EXISTS `bill_photocopy_machine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `full_color` bigint(20) DEFAULT NULL,
  `black_white` bigint(20) DEFAULT NULL,
  `color_a3` bigint(20) DEFAULT NULL,
  `copy` bigint(20) DEFAULT NULL,
  `print` bigint(20) DEFAULT NULL,
  `fax` bigint(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `acc_id` (`acc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.bill_photocopy_machine: ~13 rows (approximately)
/*!40000 ALTER TABLE `bill_photocopy_machine` DISABLE KEYS */;
INSERT INTO `bill_photocopy_machine` (`id`, `acc_id`, `date`, `full_color`, `black_white`, `color_a3`, `copy`, `print`, `fax`, `total`) VALUES
	(1, 5, '2019-01-23', 354, 331595, 3, 0, 0, 0, 331949),
	(2, 5, '2019-02-23', 354, 357139, 3, 0, 0, 0, 357493),
	(3, 5, '2019-03-23', 354, 382566, 3, 0, 0, 0, 382920),
	(4, 5, '2019-04-23', 378, 407701, 3, 0, 0, 0, 408079),
	(5, 5, '2019-05-23', 378, 433439, 3, 0, 0, 0, 433817),
	(6, 5, '2019-06-23', 381, 453573, 3, 0, 0, 0, 453954),
	(7, 5, '2019-07-23', 392, 480051, 6, 0, 0, 0, 480443),
	(8, 5, '2019-08-23', 399, 502068, 6, 0, 0, 0, 502467),
	(9, 5, '2019-09-23', 400, 522496, 6, 0, 0, 0, 522896),
	(10, 5, '2019-10-23', 422, 545899, 11, 0, 0, 0, 546321),
	(11, 5, '2019-11-23', 477, 566272, 11, 0, 0, 0, 566749),
	(12, 5, '2019-12-23', 481, 587497, 11, 0, 0, 0, 587978),
	(13, 8, '2019-01-23', 0, 0, 0, 261951, 198890, 24493, 485334);
/*!40000 ALTER TABLE `bill_photocopy_machine` ENABLE KEYS */;

-- Dumping structure for table admin.bill_quit_rent_billing
CREATE TABLE IF NOT EXISTS `bill_quit_rent_billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inv_no` varchar(50) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `payment` double DEFAULT NULL,
  `date_paid` date DEFAULT NULL,
  `payment_mode` varchar(50) DEFAULT NULL,
  `or_no` varchar(50) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `date_received` date DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.bill_quit_rent_billing: ~2 rows (approximately)
/*!40000 ALTER TABLE `bill_quit_rent_billing` DISABLE KEYS */;
INSERT INTO `bill_quit_rent_billing` (`id`, `inv_no`, `invoice_date`, `payment`, `date_paid`, `payment_mode`, `or_no`, `due_date`, `date_received`, `remarks`) VALUES
	(1, '123456789', '2020-03-17', 123, '2020-03-17', 'ibg', '321547896', '2020-03-18', '2020-03-17', 'test saja'),
	(2, '', '1970-01-01', 0, '1970-01-01', '', '', '1970-01-01', '1970-01-01', '');
/*!40000 ALTER TABLE `bill_quit_rent_billing` ENABLE KEYS */;

-- Dumping structure for table admin.bill_sesb
CREATE TABLE IF NOT EXISTS `bill_sesb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_id` int(11) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `paid_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `cheque_no` varchar(50) DEFAULT NULL,
  `meter_reading_from` double DEFAULT NULL,
  `meter_reading_to` double DEFAULT NULL,
  `total_usage` double DEFAULT NULL,
  `current_usage` double DEFAULT NULL,
  `kwtbb` double DEFAULT NULL,
  `penalty` double DEFAULT NULL,
  `power_factor` double DEFAULT NULL,
  `additional_deposit` double DEFAULT NULL,
  `other_charges` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `adjustment` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index 2` (`acc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.bill_sesb: ~6 rows (approximately)
/*!40000 ALTER TABLE `bill_sesb` DISABLE KEYS */;
INSERT INTO `bill_sesb` (`id`, `acc_id`, `date_start`, `date_end`, `paid_date`, `due_date`, `cheque_no`, `meter_reading_from`, `meter_reading_to`, `total_usage`, `current_usage`, `kwtbb`, `penalty`, `power_factor`, `additional_deposit`, `other_charges`, `amount`, `adjustment`) VALUES
	(1, 1, '2018-12-02', '2019-01-02', '2019-02-02', '2019-02-08', 'HLBB700029', 410095, 414945, 4850, 19155.44, 306.49, 0, 0, 0, 0, 19461.95, 0.02),
	(2, 1, '2019-01-02', '2019-02-01', '2019-03-11', '2019-03-10', 'HLBB699895', 414945, 420615, 5670, 22394.5, 358.31, 0, 0, 0, 0, 22752.8, -0.01),
	(3, 1, '2019-02-01', '2019-03-01', '2019-03-27', '2019-04-07', 'HLBB7401159', 420615, 423169, 2554, 10086.3, 161.38, 0, 0, 0, 0, 10247.7, 0.02),
	(4, 1, '2019-03-01', '2019-04-01', '2019-05-02', '2019-05-09', 'HLBB699946', 423169, 428477, 5308, 20964.54, 335.43, 0, 0, 0, 0, 22094.35, 0),
	(5, 1, '2019-04-01', '2019-05-01', '2019-05-25', '2019-06-05', 'HLBB699991', 428477, 432778, 4301, 16986.95, 271.79, 0, 0, 0, 0, 17258.75, 0.01),
	(6, 1, '2019-05-01', '2019-06-01', '2019-07-03', '2019-07-14', 'HLBB701131', 432778, 440763, 7985, 31538.69, 504.62, 0, 0, 0, -794.38, 31248.95, 0.02);
/*!40000 ALTER TABLE `bill_sesb` ENABLE KEYS */;

-- Dumping structure for table admin.bill_telefon_list
CREATE TABLE IF NOT EXISTS `bill_telefon_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bt_id` int(11) DEFAULT NULL,
  `tel_no` varchar(50) DEFAULT NULL,
  `usage_amt` double DEFAULT NULL,
  `phone_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index 2` (`bt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.bill_telefon_list: ~6 rows (approximately)
/*!40000 ALTER TABLE `bill_telefon_list` DISABLE KEYS */;
INSERT INTO `bill_telefon_list` (`id`, `bt_id`, `tel_no`, `usage_amt`, `phone_type`) VALUES
	(1, 1, '088-491245', 2.13, 'FAX'),
	(2, 1, '088-494033', 0.68, 'TELEPHONE'),
	(3, 1, '088-498935', 10.31, 'FAX'),
	(4, 2, '088-491245', 3.12, 'FAX'),
	(5, 2, '088-494033', 1.02, 'TELEPHONE'),
	(6, 2, '088-498935', 5.2, 'FAX');
/*!40000 ALTER TABLE `bill_telefon_list` ENABLE KEYS */;

-- Dumping structure for table admin.bill_telekom
CREATE TABLE IF NOT EXISTS `bill_telekom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_id` int(11) DEFAULT NULL,
  `bill_no` varchar(50) DEFAULT NULL,
  `cheque_no` varchar(50) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `paid_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `monthly_bill` double DEFAULT NULL,
  `rebate` double DEFAULT NULL,
  `credit_adjustment` double DEFAULT NULL,
  `gst_sst` double DEFAULT NULL,
  `adjustment` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index 2` (`acc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.bill_telekom: ~2 rows (approximately)
/*!40000 ALTER TABLE `bill_telekom` DISABLE KEYS */;
INSERT INTO `bill_telekom` (`id`, `acc_id`, `bill_no`, `cheque_no`, `date_start`, `date_end`, `paid_date`, `due_date`, `monthly_bill`, `rebate`, `credit_adjustment`, `gst_sst`, `adjustment`, `amount`) VALUES
	(1, 3, '007482394710', 'HLBB700029', '2020-01-01', '2020-02-01', '2020-02-01', '2020-02-10', 411.5, -30, 0, 25.4772, 0, 420.0972),
	(2, 3, 'test', 'HLBB700030', '2020-03-01', '2020-04-01', '2020-04-08', '2020-04-10', 411.5, 0, 0, 25.2504, 0.01, 446.1004);
/*!40000 ALTER TABLE `bill_telekom` ENABLE KEYS */;

-- Dumping structure for table admin.bill_water
CREATE TABLE IF NOT EXISTS `bill_water` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `previous_mr` double DEFAULT NULL,
  `current_mr` double DEFAULT NULL,
  `total_consume` double DEFAULT NULL,
  `charged_amount` double DEFAULT NULL,
  `surcharge` double DEFAULT NULL,
  `adjustment` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `paid_date` date DEFAULT NULL,
  `payment_mode` varchar(10) DEFAULT NULL,
  `or_no` varchar(50) DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.bill_water: ~4 rows (approximately)
/*!40000 ALTER TABLE `bill_water` DISABLE KEYS */;
INSERT INTO `bill_water` (`id`, `date_from`, `date_to`, `invoice_no`, `invoice_date`, `due_date`, `description`, `previous_mr`, `current_mr`, `total_consume`, `charged_amount`, `surcharge`, `adjustment`, `total`, `paid_date`, `payment_mode`, `or_no`, `received_date`) VALUES
	(1, '2018-10-24', '2018-11-24', '7', '2018-12-11', '2019-01-10', 'WATER BILL', 1.25, 1.46, 0.21, 0.21, 2, -0.01, 2.21, '0000-00-00', 'IBG', '', '0000-00-00'),
	(2, '2018-10-24', '2018-11-24', '7', '2018-12-11', '2019-01-10', 'WATER BILL', 1.25, 1.46, 0.21, 0.21, 2, -0.01, 2.21, '0000-00-00', 'IBG', '', '0000-00-00'),
	(3, '2018-10-24', '2018-11-24', 'BS-BLWC00006539', '2018-12-11', '2019-01-10', 'WATER BILL', 1.25, 1.46, 0.21, 0.21, 2, -0.01, 2.21, '0000-00-00', 'IBG', '', '0000-00-00'),
	(4, '2018-10-24', '2018-11-24', 'BS-BLWC00006539', '2018-12-11', '2019-01-10', 'WATER BILL', 1.25, 1.46, 0.21, 0.21, 2, -0.01, 2.21, '0000-00-00', 'IBG', 'BS-BLWC00006539', '0000-00-00');
/*!40000 ALTER TABLE `bill_water` ENABLE KEYS */;

-- Dumping structure for table admin.company
CREATE TABLE IF NOT EXISTS `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(25) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `registration_no` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- Dumping data for table admin.company: ~20 rows (approximately)
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` (`id`, `code`, `name`, `registration_no`, `status`) VALUES
	(1, 'EPCS', 'ENG PENG COLD STORAGE SDN BHD', '671699-H', 1),
	(2, 'KFSB', 'KOBOS FARM SDN BHD', '90890-U', 1),
	(3, 'EPPF', 'ENG PENG POULTRY FARM SDN BHD', '272243-H', 1),
	(4, 'SMESB', 'SALAM MARKETING ENTERPRISE SDN BHD', '733136-X', 1),
	(5, 'AI', 'LADANG TERNAKAN AYAM INDUK KOTA KINABALU SDN BHD', NULL, 0),
	(6, 'JDSB', 'JADIMA SDN BHD', '189788-U', 1),
	(7, 'JNSB', 'JUA NIKMAT SDN BHD', '851777-P', 1),
	(8, 'PDUSB', 'PERUSAHAAN DAYA USAHA SDN BHD', '835668-U', 1),
	(9, 'BN', 'BUMI NIAN SDN BHD', NULL, 0),
	(10, 'EPSB', 'EDEN PERFECT SDN BHD', NULL, 0),
	(11, 'TP', 'TIASA PASIFIK SDN BHD', NULL, 0),
	(12, 'EPSB', 'EP FEEDMILL SDN BHD', NULL, 1),
	(13, 'IISB', 'IMPIAN INTERAKTIF SDN BHD', '879886-M', 1),
	(14, 'RB', 'RAJIN BUDAYA', NULL, 0),
	(15, 'SST', 'SST BREEDING FARMS SDN BHD', NULL, 0),
	(16, 'LASB', 'LAGENDA AMANJAYA SDN BHD', '967788-H', 1),
	(17, 'SGSB', 'SALAM GLOBAL TRADING SDN BHD', NULL, 0),
	(18, 'EPG', 'Eng Peng Group', NULL, 0),
	(19, 'OTHERS', 'OTHERS', NULL, 0),
	(20, 'WWP', 'WONG WAH PENG', '', 1),
	(21, 'Jenneffer2', 'Jenneffer', 'Jenneffer', 1),
	(22, 'PDU', 'PERUSAHAAN DAYA USAHA', NULL, 1);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;

-- Dumping structure for table admin.credential
CREATE TABLE IF NOT EXISTS `credential` (
  `cr_id` int(11) NOT NULL AUTO_INCREMENT,
  `cr_name` varchar(50) NOT NULL,
  `cr_username` varchar(50) NOT NULL,
  `cr_email` varchar(50) NOT NULL DEFAULT '',
  `cr_password` varchar(50) NOT NULL,
  `cr_addUser` int(11) NOT NULL,
  `cr_vehicle` int(11) NOT NULL COMMENT 'MODULE. ''1'' FOR ABLE AND ''0'' FOR NOT ABLE',
  `cr_safety` int(11) NOT NULL COMMENT 'MODULE. ''1'' FOR ABLE AND ''0'' FOR NOT ABLE',
  `cr_telekomANDinternet` int(11) NOT NULL COMMENT 'MODULE. ''1'' FOR ABLE AND ''0'' FOR NOT ABLE',
  `cr_security` int(11) NOT NULL COMMENT 'MODULE. ''1'' FOR ABLE AND ''0'' FOR NOT ABLE',
  `cr_farmMaintenance` int(11) NOT NULL COMMENT 'MODULE. ''1'' FOR ABLE AND ''0'' FOR NOT ABLE',
  `cr_assetManagement` int(11) NOT NULL COMMENT 'MODULE. ''1'' FOR ABLE AND ''0'' FOR NOT ABLE',
  `cr_access_module` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`cr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Dumping data for table admin.credential: ~4 rows (approximately)
/*!40000 ALTER TABLE `credential` DISABLE KEYS */;
INSERT INTO `credential` (`cr_id`, `cr_name`, `cr_username`, `cr_email`, `cr_password`, `cr_addUser`, `cr_vehicle`, `cr_safety`, `cr_telekomANDinternet`, `cr_security`, `cr_farmMaintenance`, `cr_assetManagement`, `cr_access_module`) VALUES
	(2, 'admin', 'admin', 'j.jennefferj@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 1, 1, 1, 1, 1, '1,2,3,4,5,6'),
	(8, 'Melisah', 'melisa', 'melisa@engpeng.com', '7856b9b6c1f68bd2cdac0b7439621fd4', 0, 1, 0, 0, 0, 0, 0, NULL),
	(10, 'Jenneffer Jiminit', 'jenneffer', 'j.jennefferj@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 0, 0, 0, 0, 0, 0, '1,2,3'),
	(11, 'Rohana', 'rohana', 'rohana@engpeng.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 0, 0, 0, 0, 0, 0, '1,2,3,4,5');
/*!40000 ALTER TABLE `credential` ENABLE KEYS */;

-- Dumping structure for table admin.epcs_copy
CREATE TABLE IF NOT EXISTS `epcs_copy` (
  `epcs_id` int(11) NOT NULL AUTO_INCREMENT,
  `Column1` varchar(25) DEFAULT NULL,
  `Column2` varchar(12) DEFAULT NULL,
  `Column3` varchar(12),
  `Column4` varchar(45) DEFAULT NULL,
  `Column5` varchar(45) DEFAULT NULL,
  `Column6` varchar(25) DEFAULT NULL,
  `Column7` varchar(25) DEFAULT NULL,
  `Column8` varchar(5) DEFAULT NULL,
  `Column9` varchar(5) DEFAULT NULL,
  `Column10` varchar(5) DEFAULT NULL,
  `Column11` varchar(255) DEFAULT NULL,
  `Column12` int(11) NOT NULL,
  `Column13` varchar(25) DEFAULT NULL,
  `Column14` varchar(5) DEFAULT NULL,
  `Column15` varchar(5) DEFAULT NULL,
  `Column16` varchar(5) DEFAULT NULL,
  `Column17` varchar(5) DEFAULT NULL,
  `Column18` varchar(5) DEFAULT NULL,
  `Column19` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`epcs_id`),
  KEY `Column12_index` (`Column12`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table admin.epcs_copy: 57 rows
/*!40000 ALTER TABLE `epcs_copy` DISABLE KEYS */;
INSERT INTO `epcs_copy` (`epcs_id`, `Column1`, `Column2`, `Column3`, `Column4`, `Column5`, `Column6`, `Column7`, `Column8`, `Column9`, `Column10`, `Column11`, `Column12`, `Column13`, `Column14`, `Column15`, `Column16`, `Column17`, `Column18`, `Column19`) VALUES
	(1, 'SD 69 D [TOTAL LOSS]', 'TOTAL LOSS', 'VEHICLE', 'ISUZU', 'TFR54HD0', '4JA1-355321', 'JAATFR54H67101470', '-', '-', '-', 'TOTAL LOSS', 2006, '-', '-', '-', '-', '-', '-', '-'),
	(2, 'SA1221L', 'ACTIVE', '3', 'MITSUBISHI CANTER', 'MITSUBISHI', '4D31-851694', 'FE434E-A45419', '-', '-', '-', 'LOGISTICS STANDBY DRIVER', 1991, '-', '-', '-', '-', '-', '-', 'bas sekolah baru - any payment related such as road tax and insurance asked bos - kena beli on 16.08.2017 - EPCS RENTAL-BELUM TUKAR NAMA (WONG WEE SHIN)'),
	(3, 'SU1279B', 'ACTIVE', 'MOTOR', 'HONDA', 'MOTORBIKE ~ C100', 'HA13E-4032970', 'PMKHA13209B032932', '-', '-', '-', 'TIMBOK TELUR AB-TONY LAMAR (UNDER MR.LING)', 2009, '-', '-', '-', '-', '-', '-', '-'),
	(4, 'SA285R', 'ACTIVE', 'VAN', 'NISSAN', 'VPC22EFU VANETTE', 'A15-C004666', 'VPC22-859494', '-', '-', '-', 'CATCHING TEAM USED (RICHMOND)', 1995, '-', '-', '-', '-', '-', '-', 'ROAD TAX INSURANCE - WWP BAYAR'),
	(5, 'SA1313J', 'ACTIVE', 'LORRY', 'TOYOTA', 'DYNA HIACE-PICK UP', '2L-2897152', 'LH80-0019675', '2400', '1620', '780', 'REJOS DARIUS', 1988, '-', '-', '-', '-', '-', '-', '-'),
	(6, 'SD1632L', 'ACTIVE', 'MOTOR', 'DNC ASIATIC HOLDING SDN BHD', 'DEMAK EX 90', 'PMDD147FMFE507142', 'PMDDLMPF0FE507289', '-', '-', '-', 'LERYSYAM JAINUS', 2014, '-', '-', '-', '-', '-', '-', '-'),
	(7, 'SA1682K', 'ACTIVE', 'VEHICLE', 'DAIHATSU', 'DELTA V57A', '536410', 'V57A-99122', '2500', '1260', '1260', 'FARM TAMPARULI (CHAI KIN FATT)', 1990, '-', '-', '-', '-', '-', '-', 'OFF ROAD'),
	(8, 'SA 935 T', 'ACTIVE', '2', 'ISUZU', 'NHR55E LIGHT TRUCK', '4JB1-244178', 'JAANHR55EP7108628', '2500', '1750', '750', 'HJ. KURONG', 1996, '-', '-', '-', '-', '-', '-', '-'),
	(9, 'SAA 935 A', 'ACTIVE', 'VEHICLE', 'TOYOTA', 'LN166 HILUX DOUBLE CAB 4X4', '3L-4992399', 'LN166-0048879', '-', '-', '-', 'WILLIAM CHONG', 2000, '-', '-', '-', '-', '-', '-', 'Jadima jual sama EPCS on 01.12.2008 with price RM 5,000'),
	(10, 'SAA 935 F', 'ACTIVE', 'VEHICLE', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB (M)', '2KD-9150794', 'KDN165-0024437', '-', '-', '-', 'HENRY GABRIEL', 2003, '-', '-', '-', '-', '-', '-', '-'),
	(11, 'SAA 935 J', 'ACTIVE', 'VEHICLE', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB 2.5L', '2KD-9378113', 'PN133JV2508000175', '-', '-', '-', 'AH CHI - CONTRACT FARMER (KB)', 2005, '-', '-', '-', '-', '-', '-', 'ANTON HERA GUNA SEBELUM BALIK INDON'),
	(12, 'SAB 935 B', 'ACTIVE', 'MOTOR', 'HONDA', 'MOTORBIKE ~ C100', 'HA13E-4077378', 'PMKHA13209B077542', '-', '-', '-', 'MOHD RIDWAN (OFFICE BOY)', 2009, '-', '-', '-', '-', '-', '-', '-'),
	(13, 'SAA 223 T', 'ACTIVE', 'VEHICLE', 'TOYOTA', 'LAND CRUISER KR-HDJ101K', '1HD0240691', 'HDJ101-0025449', '-', '-', '-', 'PATRICK SHU', 2003, '-', '-', '-', '-', '-', '-', '-'),
	(14, 'SAA2240A', '-', 'LORRY', 'DAIHATSU', 'V58R-HS DELTA', '639270', 'V58B53386', '4500', '1830', '2670', 'STAND-BY AT KILANG', 2000, '-', '-', '-', '-', '-', '-', '-'),
	(15, 'SAA2288Y', 'ACTIVE', 'LORRY', 'ISUZU', 'ISUZU / NPR71L (RB/BL-MOD)', '4HG1693517', 'NPR71L-7422466', '5000', '3310', '1690', 'WILLIAM (SANDAKAN) - LASB SEWA', 2009, '-', '-', '-', '-', '-', '-', 'KENA HANTAR PERGI SANDAKAN ON 01.04.2019 - LASB SEWA'),
	(16, 'QMH2303', 'ACTIVE', 'VEHICLE', 'FORD', 'RANGER UVIM FM1 D/CABIN 4X4', 'WLAT499311', 'PR8CACBAL4LZ02110', '-', '-', '-', 'NICHOLAS WA', 2004, '-', '-', '-', '-', '-', '-', '-'),
	(17, 'SA2638U', 'ACTIVE', 'LORRY', 'ISUZU', 'NPR596-06H', '4BDI-570176', 'JAANPR59PM7110485', '5000', '3250', '1750', 'ULU KIMANIS FARM', 1996, '-', '-', '-', '-', '-', '-', '-'),
	(18, 'SWA2816 (NEW)', 'ACTIVE', 'VEHICLE', 'NISSAN', 'X-TRAIL 2.0L CVT MID', 'MR20502116C', 'PN8JAAT32TCA49288', '-', '-', '-', 'MADAM WONG HUE FEN', 2019, 'HONG LEONG BANK', '-', '-', '-', '-', '-', '-'),
	(19, 'SAA2848K', 'ACTIVE', 'VEHICLE', 'MAZDA', 'B2500 DOUBLE CAB 4X4', 'WL100245', 'PMZUNYOW2MM101736', '-', '-', '-', 'WORKSHOP - ARTHUR', 2005, '-', '-', '-', '-', '-', '-', 'WORKSHOP GUNA UNTUK ANGKAT PART LORI/HITACHI'),
	(20, 'JJB3117', '-', '5', 'MAZDA', 'FORKLIFT~ 5FD20', '1Z-0017733', '5FD25-22764', '-', '-', '-', 'F02 - Feedmill', 2002, '-', '-', '-', '-', '-', '-', 'TIDAK TAU APA KEJADIAN KAD TIADA '),
	(21, 'QMD3303', 'ACTIVE', 'VEHICLE', 'NISSAN', 'SARENA 2.0L EDAARFBC24EX7', 'QR20-571330A', 'PN8EAAC24TCA06125', '-', '-', '-', 'STANDBY', 2005, '-', '-', '-', '-', '-', '-', '-'),
	(22, 'SA3398M', 'ACTIVE', 'VEHICLE', 'TOYOTA', 'HILUX SURF', '1KZ-0161794', 'LN130-0095797', '-', '-', '-', 'LO CHEE LIONG', 1992, '-', '-', '-', '-', NULL, '-', '-'),
	(23, 'SAA356V', 'ACTIVE', 'VEHICLE', 'PROTON', 'SAGA B-LINE 1.3', 'S4PEPD6437', 'PL1BT3SNR8B027593', '-', '-', '-', 'UNCLE CHONG - GUDANG ABUK', 2008, '-', '-', '-', '-', '-', '-', '-'),
	(24, 'SAA3741P', 'ACTIVE', 'VAN', 'KIA', 'PREGIO FPGDH55', 'J2455005', 'PNAKF5S036N003190', '-', '-', '-', 'CATCHING TEAM USED (RICHMOND)', 2006, '-', '-', '-', '-', '-', '-', 'CHANGE OF OWNERSHIP FROM 88 RETAILER TO EPCS ON (________________________)'),
	(25, 'JKL3809 (NEW)', 'ACTIVE', 'VEHICLE', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB 2.5MT', '2KD9902310', 'PN133JV2508010632', '-', '-', '-', 'RAYMOND LOH', 2007, '-', '-', '-', '-', '-', '-', '-'),
	(26, 'SA3935U', 'ACTIVE', 'VEHICLE', 'TOYOTA', 'L/CRUISER HDJ81V', '1HD-0134771', 'HDJ81-0073105', '-', '-', '-', 'WONG KOK PING', 1997, '-', '-', '-', '-', '-', '-', 'IISB SEWA (JUL,2018)'),
	(27, 'SAC4108B', 'ACTIVE', 'FORKLIFT', 'TOYOTA', 'FORK LIFT -7FBR18', 'RC28276', '7FBR18-53376', '-', '-', '-', 'KILANG POTONG [MADAM WONG]', 2016, 'Orix Credit Myr S/B', '-', '-', '-', '-', '-', 'KAD MASIH SAMA BANK TANYA FINANCE UNDER BANK MANA'),
	(28, 'QAQ4346', '-', '5', 'TOYOTA', 'FORKLIFT ~ 7FBR15', 'RA05384', '906', '-', '-', '-', 'C03 - Cold Room', 2007, '-', '-', '-', '-', '-', '-', 'TIDAK TAU APA KEJADIAN KAD TIADA '),
	(29, 'SAB4325X', 'ACTIVE', 'MOTOR', 'DNC ASIATIC HOLDING SDN BHD', 'DEMAK EX 90', 'PMDD147FMFE713215', 'PMDDLMPF8FE713251', '-', '-', '-', 'FARM SALUT  C & CA (widayat)', 2014, '-', '-', NULL, NULL, NULL, NULL, '-'),
	(30, 'SS4465C', 'ACTIVE', 'VAN', 'TOYOTA', 'LITE ACE WINDOW VAN', '5K-9048892', 'KM36-9020352', '-', '-', '-', 'CATCHING TEAM USED (RICHMOND)', 1991, '-', '-', '-', '-', '-', '-', '-'),
	(31, 'SA4510T', 'ACTIVE', 'LORRY', 'ISUZU', 'NPR596-03A', '4BD1-554740', 'JAANPR59PM7109181', '-', '-', '-', 'BANTAYAN FARM - HENDRY GABRIEL', 1996, NULL, NULL, NULL, NULL, NULL, NULL, '-'),
	(32, 'SAA4832X', 'ACTIVE', 'VAN', 'KIA PREGIO', 'KIA', 'J2-362207', 'KNHTR731247139650', '-', '-', '-', 'HAZLAN BIN SAIB (BUDAK SEKOLAH)', 2003, '-', '-', '-', '-', '-', '-', '-'),
	(33, 'SAA 456 U', '-', 'FORKLIFT', 'TOYOTA', 'FORKLIFT ~ 7FBR18', '/41113', '7FBR18-13613', '-', '-', '-', 'C02 - Cold Room', 2008, '-', '-', '-', '-', '-', '-', 'TIDAK TAU APA KEJADIAN KAD TIADA '),
	(34, 'SA5010M', 'ACTIVE', 'VAN', 'TOYOTA', 'LH113R-RRMRS HIACE WINDOW VAN', '3L-2776717', 'LH113-8002764', '-', '-', '-', 'DAIM (ANGKAT BUDAK SEKOLAH)', 1991, '-', '-', '-', '-', '-', '-', '-'),
	(35, 'SAB524R (NEW)', '-', 'FORKLIFT', 'TOYOTA', '62-8FD25', '1DZ0244059', '608FD25-39354', '-', '-', '-', 'STORE', 2012, 'AMBANK [M] BERHAD', '-', '-', '-', '-', '-', '-'),
	(36, 'SA5369M', 'ACTIVE', 'LORRY', 'TOYOTA', 'LY50 HIACE PICK UP', '2L-1977857', 'LY50-0020390', '2850', '1590', '1260', 'Timbok Impian - Humphery (exchange with ST1311B)', 1989, '-', '-', '-', '-', '-', '-', 'PINDAH DI FARM ULU TEMPAT PETER WONG SBB ULU PERLU GUNA LORI YG LEBIH BESAR UNTUK ANGKAT BARANG'),
	(37, 'BLH5494', 'ACTIVE', 'FORKLIFT', 'TOYOTA', '62-8FD25', '1DZ0223591', '608FD25-35279', '-', '-', '-', 'KILANG POTONG [MADAM WONG]', 2011, '-', '-', '-', '-', '-', '-', '-'),
	(38, 'SA5755Y', 'ACTIVE', 'VEHICLE', 'FORD COURIER 4X4', 'FORD UT2G FM1 COURIER CREW CAB', 'WL173584', 'SZCWYC24456', '-', '-', '-', 'HIEW KIM SING', 2000, '-', '-', '-', '-', '-', '-', 'Change of ownership under EPCS'),
	(39, 'SAB5935J', 'ACTIVE', 'VEHICLE', 'ISUZU', 'TFR54HD1', '4JA1-186621', 'JAATFR54HB7111066', '-', '-', '-', 'JIMMY KOH CHEE VUI', 2012, '-', '-', '-', '-', '-', '-', '-'),
	(40, 'SAA6173T', 'ACTIVE', 'LORRY', 'ISUZU', 'NPR66 (RB/AA/P-MOD)', '4HF1-171419', 'NPR66P-7400126', '5000', '2780', '2220', 'SALUT AB - SAFARINA (SUPERVISOR) - ZAINAL', 2008, '-', '-', '-', '-', '-', '-', '-'),
	(41, 'SA6383A', 'ACTIVE', 'VEHICLE', 'TOYOTA', 'CROWN', '2L-3229609', 'LS110-000219', '-', '-', '-', 'ADMIN STANDBY', 1979, '-', '-', '-', '-', '-', '-', '-'),
	(42, 'SAA 6675 F', '-', 'FORKLIFT', 'TOYOTA', 'FORKLIFT ~ 6FBRE16', 'B6911021', '6FBRE16-32245', '-', '-', '-', 'C01 - Cold Room', 2003, '-', '-', '-', '-', '-', '-', 'TIDAK TAU APA KEJADIAN KAD TIADA '),
	(43, 'SAB7033M', 'ACTIVE', 'FORKLIFT', 'TOYOTA', 'FORKLIFT - 7FBR18', 'RC02804', '7FBR18-50352', '-', '-', NULL, 'STOR', 2012, '-', '-', '-', '-', '-', '-', '-'),
	(44, 'SS7166V (NEW)', 'ACTIVE', 'HITACHI', 'HITACHI', 'ZX33U-5A', 'N7215', 'HCMADB90H00032497', '-', '-', '-', 'FARM PENIANG', 2014, 'Orix Credit Myr S/B', '-', '-', '-', '-', '-', 'KAD SAMA BANK MAHU TANYA FINANCE UNDER BANK MANA'),
	(45, 'SA7697E', '-', '5', 'KOMATSU', 'FORKLIFT- FD30-8', 'C240-617797', '141739', '-', '-', '-', 'L01 - Loading Bay', 1984, '-', '-', '-', '-', '-', '-', 'TIDAK TAU APA KEJADIAN KAD TIADA '),
	(46, 'ST7999D', 'ACTIVE', 'LORRY', 'TOYOTA', 'LY100R-TBMBS3 DYNA HI-ACE P-UP', '2L-9296849', 'LY100-0001703', '2400', '1530', '870', 'FARM TAMPARULI (CHAI KIN FATT)', 1995, '-', '-', '-', '-', '-', '-', 'JADIMA PINJAM TP PARKING DI WORKSHOP (TIDAK PERLU RENEW INSURANCE/ROAD TAX/PUSPAKOM - OFF ROAD- VERBALLY BY ARTHUR)'),
	(47, 'SA8201T', 'ACTIVE', 'PICK UP', 'ISUZU', 'TFR54H', '4JA1-280062', 'JAATFR54HT7110199', '-', '-', '-', 'ANTON VACCINE', 1996, '-', '-', '-', '-', '-', '-', '-'),
	(48, 'ST8225D', 'ACTIVE', 'LORRY', 'TOYOTA', 'L/Truck', '3L-3133862', 'LY100-0001811', '2400', '1670', '730', 'AIDIL', 1995, '-', '-', '-', '-', '-', '-', '-'),
	(49, 'SA8393H', 'ACTIVE', 'LORRY', 'TOYOTA', 'L/Truck', '2L-3654993', 'LH80-0015855', '2400', '1530', '870', 'HENDRY GABRIEL', 1988, '-', '-', '-', '-', '-', '-', '-'),
	(50, 'SS8700N', 'ACTIVE', 'VEHICLE', '(N)TOYOTA', 'HDJ101 LAND CRUISER', '1HD-0195627', 'HDJ101-0019087', '-', '-', '-', 'WONG HUE SUAN', 1998, '-', '-', '-', '-', '-', '-', '-'),
	(51, 'SAA8935H', 'ACTIVE', 'LORRY', 'DAIHATSU', 'DELTA V58R-HS', 'DL652647', 'V58B63411', '4500', '2580', '1920', 'HANGUS TERBAKAR', 2004, '-', '-', '-', '-', '-', '-', 'LORRY TERBAKAR LAMA SUDA [KAD TIDAK TAU P MANA, KALI SUDA CLAIM TOTAL LOSS KAD SAMA BANK '),
	(52, 'SAB8935J', 'ACTIVE', 'VEHICLE', 'ISUZU ', 'TFR54HD1', '4JA1-182601', 'JAATFR54HB7111018', '-', '-', '-', 'CHAN PIK LAN (MAMA)', 2012, 'PUBLIC BANK', '-', '-', '-', '-', '-', '-'),
	(53, 'ST8920C', 'ACTIVE', 'VAN', 'TOYOTA', 'TOYOTA HIACE W/VAN', '2L-2230970', 'LH113-8002483', '-', '-', '-', 'TUDIKI BIN LABA (ANGKAT BUDAK SEKOLAH)', 1991, '-', '-', '-', '-', '-', '-', '-'),
	(54, 'SAA9935T', 'ACTIVE', 'VEHICLE', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB 2.5 AT', 'IJZ-6071842', 'PN133JV2508510015', '-', '-', '-', 'JAPAR KURONG', 2008, '-', '-', '-', '-', '-', '-', '-'),
	(55, 'SAB9935P', 'ACTIVE', 'VEHICLE', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB 2.5 MT', '2KDU317510', 'PN133JV2508277532', '-', '-', '-', 'ANDY CHONG', 2013, 'RHB Bank Berhad', '-', '-', '-', '-', '-', '-'),
	(56, 'SD9935L', 'ACTIVE', 'VEHICLE', 'ISUZU', 'UCS86GGR-TLUH', '4JK1NG3207', 'MPAUCS86GFT001681', '-', '-', '-', 'LING HENG CHIONG', 2015, 'PUBLIC BANK BERHAD', '-', '-', '-', '-', '-', 'KAD MASIH SAMA BANK-UNDER PUBLIC BANK, KALAU MAHU AMBIL KAD BUAT SURAT KUASA AMBIL KAD TUJUAN RENEW ROADTAX'),
	(57, 'SB8885C', 'ACTIVE', 'VEHICLE', 'AUDI', 'AUDI Q7 4.2 (A)', 'CCF008225', 'WAUZZZ4L0DD004079', '-', '-', '-', 'WONG KOK PING', 2012, '-', '-', '-', '-', '-', '-', '-');
/*!40000 ALTER TABLE `epcs_copy` ENABLE KEYS */;

-- Dumping structure for table admin.fireextinguisher_listing
CREATE TABLE IF NOT EXISTS `fireextinguisher_listing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(50) DEFAULT NULL,
  `serial_no` varchar(50) DEFAULT NULL,
  `location` int(11) DEFAULT 0,
  `company_id` int(11) DEFAULT 0,
  `person_incharge` int(11) DEFAULT 0,
  `expiry_date` date DEFAULT '0000-00-00',
  `date_added` date DEFAULT '0000-00-00',
  `added_by` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `status` int(11) DEFAULT 1 COMMENT ' 0-deleted',
  `fe_status` int(11) DEFAULT 2 COMMENT '1-pending, 2-Active, 3-reject, 4-hold',
  PRIMARY KEY (`id`),
  KEY `Index 2` (`company_id`,`person_incharge`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.fireextinguisher_listing: ~4 rows (approximately)
/*!40000 ALTER TABLE `fireextinguisher_listing` DISABLE KEYS */;
INSERT INTO `fireextinguisher_listing` (`id`, `model`, `serial_no`, `location`, `company_id`, `person_incharge`, `expiry_date`, `date_added`, `added_by`, `approved_by`, `remark`, `status`, `fe_status`) VALUES
	(1, 'ABC', 'SN123456789', 5, 1, 2, '2020-03-24', '2020-02-24', 2, 0, 'testing', 1, 1),
	(2, 'ABC', 'UFO12014Y923249', 5, 1, 2, '2020-12-11', '2020-02-25', 2, 0, '', 1, 2),
	(3, 'ABC', 'UFO12014Y9232662', 5, 1, 2, '2020-12-11', '2020-02-25', 2, 0, '', 1, 2),
	(4, 'ABC', 'UFO123564894', 1, 3, 4, '2020-03-18', '2020-02-25', 2, 0, 'test', 1, 4);
/*!40000 ALTER TABLE `fireextinguisher_listing` ENABLE KEYS */;

-- Dumping structure for table admin.fireextinguisher_location
CREATE TABLE IF NOT EXISTS `fireextinguisher_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_code` varchar(50) DEFAULT NULL,
  `location_name` varchar(50) NOT NULL DEFAULT '0',
  `date_added` date DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.fireextinguisher_location: ~5 rows (approximately)
/*!40000 ALTER TABLE `fireextinguisher_location` DISABLE KEYS */;
INSERT INTO `fireextinguisher_location` (`location_id`, `location_code`, `location_name`, `date_added`, `added_by`) VALUES
	(1, 'TUA', 'TUARAN', '2020-02-24', 2),
	(2, 'TEL', 'TELIPOK', '2020-02-24', 2),
	(3, 'HAT', 'HATCHERY', '2020-02-24', 2),
	(4, 'BBB', 'BELURAN', '2020-02-24', 2),
	(5, 'SAL', 'SALUT', '2020-02-24', 2);
/*!40000 ALTER TABLE `fireextinguisher_location` ENABLE KEYS */;

-- Dumping structure for table admin.fireextinguisher_person_incharge
CREATE TABLE IF NOT EXISTS `fireextinguisher_person_incharge` (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_name` varchar(50) DEFAULT NULL,
  `pic_contactNo` varchar(50) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.fireextinguisher_person_incharge: ~4 rows (approximately)
/*!40000 ALTER TABLE `fireextinguisher_person_incharge` DISABLE KEYS */;
INSERT INTO `fireextinguisher_person_incharge` (`pic_id`, `pic_name`, `pic_contactNo`, `date_added`, `added_by`) VALUES
	(1, 'Aaron', '0123456789', '2020-02-24', 2),
	(2, 'Safarina', '0198608756', '2020-02-24', 2),
	(3, 'Nicholas Wa', '0128008068', '2020-02-24', 2),
	(4, 'Chong San Ling', '0198600359', '2020-02-24', 2);
/*!40000 ALTER TABLE `fireextinguisher_person_incharge` ENABLE KEYS */;

-- Dumping structure for table admin.fireextinguisher_requisition_form
CREATE TABLE IF NOT EXISTS `fireextinguisher_requisition_form` (
  `rq_id` int(11) NOT NULL AUTO_INCREMENT,
  `rq_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table admin.fireextinguisher_requisition_form: ~0 rows (approximately)
/*!40000 ALTER TABLE `fireextinguisher_requisition_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `fireextinguisher_requisition_form` ENABLE KEYS */;

-- Dumping structure for table admin.fireextinguisher_supplier
CREATE TABLE IF NOT EXISTS `fireextinguisher_supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(50) DEFAULT NULL,
  `supplier_contact_person` varchar(50) DEFAULT NULL,
  `supplier_contact_no` varchar(50) DEFAULT NULL,
  `supplier_address` varchar(50) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table admin.fireextinguisher_supplier: ~0 rows (approximately)
/*!40000 ALTER TABLE `fireextinguisher_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `fireextinguisher_supplier` ENABLE KEYS */;

-- Dumping structure for table admin.main_menu
CREATE TABLE IF NOT EXISTS `main_menu` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL DEFAULT 0 COMMENT 'to identify title belong to which system',
  `title` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.main_menu: ~12 rows (approximately)
/*!40000 ALTER TABLE `main_menu` DISABLE KEYS */;
INSERT INTO `main_menu` (`mid`, `sid`, `title`, `url`, `position`, `icon`) VALUES
	(1, 1, 'Setup', NULL, 1, 'fa fa-cogs'),
	(2, 1, 'Listing', NULL, 2, 'fas fa-list-ul'),
	(3, 1, 'Reports', NULL, 3, 'fas fa-file-alt'),
	(4, 3, 'Setup', NULL, 1, 'fa fa-cogs'),
	(5, 3, 'Listing', NULL, 2, 'fas fa-list-ul'),
	(6, 2, 'Listing', NULL, 1, 'fas fa-list-ul'),
	(7, 2, 'Report', NULL, 2, 'fas fa-file-alt'),
	(8, 5, 'Setup', NULL, 1, 'fa fa-cogs'),
	(9, 5, 'Listing', NULL, 2, 'fas fa-list-ul'),
	(10, 5, 'Report', NULL, 3, 'fas fa-file-alt'),
	(11, 4, 'Setup', NULL, 1, 'fa fa-cogs'),
	(12, 4, 'Listing', NULL, 2, 'fas fa-list-ul'),
	(13, 6, 'Stock', NULL, 1, 'fas fa-cubes'),
	(14, 6, 'Petty Cash', NULL, 2, 'fas fa-cash-register');
/*!40000 ALTER TABLE `main_menu` ENABLE KEYS */;

-- Dumping structure for table admin.om_pcash_deposit
CREATE TABLE IF NOT EXISTS `om_pcash_deposit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pv_no` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.om_pcash_deposit: 2 rows
/*!40000 ALTER TABLE `om_pcash_deposit` DISABLE KEYS */;
INSERT INTO `om_pcash_deposit` (`id`, `pv_no`, `date`, `amount`, `remark`, `user_id`, `date_added`, `date_updated`) VALUES
	(1, 'PD1609/067', '2020-04-01', 150, 'testing deposit', 2, '2020-04-01 14:00:24', '2020-04-01 14:00:24'),
	(2, 'PD1675343', '2020-04-01', 5000, 'Initial balance', 2, '2020-04-01 14:00:44', '2020-04-01 14:00:44');
/*!40000 ALTER TABLE `om_pcash_deposit` ENABLE KEYS */;

-- Dumping structure for table admin.om_pcash_request
CREATE TABLE IF NOT EXISTS `om_pcash_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_date` date DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost_per_unit` double NOT NULL,
  `total_cost` double NOT NULL,
  `workflow_status` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `cr_id` (`user_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table admin.om_pcash_request: ~2 rows (approximately)
/*!40000 ALTER TABLE `om_pcash_request` DISABLE KEYS */;
INSERT INTO `om_pcash_request` (`id`, `request_date`, `title`, `details`, `quantity`, `cost_per_unit`, `total_cost`, `workflow_status`, `user_id`, `company_id`, `created_at`, `updated_at`) VALUES
	(1, '2020-03-30', 'Testing', 'testest', 1, 2.5, 2.5, 'Confirm', 2, 1, '2020-03-30 15:41:57', '2020-03-31 11:30:10'),
	(2, '2020-03-31', 'Chair', 'new chair for new staff at account department', 2, 50, 100, 'Confirm', 2, 3, '2020-03-31 08:26:53', '2020-04-01 14:01:30'),
	(3, '2020-03-31', 'Tissue', 'Tissue tandas untuk semua staff untuk bulan April', 20, 11, 220, 'Confirm', 2, 1, '2020-03-31 08:33:18', '2020-04-01 14:01:33');
/*!40000 ALTER TABLE `om_pcash_request` ENABLE KEYS */;

-- Dumping structure for table admin.om_requisition
CREATE TABLE IF NOT EXISTS `om_requisition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `recipient` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0 COMMENT '0-pending, 1-confirm, 3- rejected',
  `serial_no` varchar(50) DEFAULT NULL,
  `pv_no` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.om_requisition: 23 rows
/*!40000 ALTER TABLE `om_requisition` DISABLE KEYS */;
INSERT INTO `om_requisition` (`id`, `company_id`, `recipient`, `user_id`, `status`, `serial_no`, `pv_no`, `date`, `payment_date`) VALUES
	(1, 2, 'Denis Liew', 2, 0, 'SN123456789', NULL, '2020-04-02', '2020-04-06'),
	(2, 10, 'Denis Liew', 2, 0, 'UFO123564894', NULL, '2020-04-03', '2020-04-10'),
	(3, 5, 'Denis Liew', 2, 0, 'SN123456790', NULL, '2020-04-03', '2020-04-09'),
	(4, 2, 'Denis Liew', 2, 0, 'SN123456789', NULL, '2020-04-03', '2020-04-09'),
	(5, 4, 'Denis Liew', 2, 0, 'aq1232435466', NULL, '2020-04-03', '2020-04-15'),
	(6, 3, 'Denis Liew', 2, 0, 'SN123456789', NULL, '2020-04-03', '2020-04-03'),
	(7, 1, 'Denis Liew', 2, 0, 'UFO123564894', NULL, '2020-04-03', '2020-04-03'),
	(8, 2, 'Denis Liew', 2, 0, 'SN123456789', NULL, '2020-04-03', '2020-04-03'),
	(9, 1, 'Denis Liew', 2, 0, 'SN123456789', NULL, '2020-04-03', '2020-04-03'),
	(10, 4, 'Denis Liew', 2, 0, 'SN123456789', NULL, '2020-04-03', '2020-04-03'),
	(11, 2, 'Denis Liew', 2, 0, 'SN123456789', NULL, '2020-04-03', '2020-04-03'),
	(12, 3, 'Denis Liew', 2, 0, 'SN123456789', NULL, '2020-04-03', '2020-04-03'),
	(13, 1, 'Denis Liew', 2, 0, 'SN123456789', NULL, '2020-04-03', '2020-04-04'),
	(14, 1, 'Denis Liew', 2, 0, 'SN123456789', NULL, '2020-04-03', '2020-04-04'),
	(15, 2, 'Denis Liew', 2, 0, 'SN123456789', NULL, '2020-04-03', '2020-04-03'),
	(16, 1, 'Denis Liew', 2, 0, 'SN123456789', NULL, '2020-04-03', '2020-04-03'),
	(17, 1, 'Denis Liew', 2, 0, 'SN123456789', NULL, '2020-04-03', '2020-04-03'),
	(18, 1, 'Denis Liew', 2, 0, 'SN123456789', NULL, '2020-04-03', '2020-04-03'),
	(19, 1, 'Denis Liew', 2, 0, 'SN123456789', NULL, '2020-04-03', '2020-04-03'),
	(20, 1, 'Denis Liew', 2, 0, 'SN123456789', NULL, '2020-04-03', '2020-04-03'),
	(21, 2, 'Jenneffer Jiminit', 2, 0, 'SN123456789', NULL, '2020-04-04', '2020-04-04'),
	(22, 2, 'Jenneffer Jiminit', 2, 0, 'SN123456789', NULL, '2020-04-04', '2020-04-04'),
	(23, 2, 'Jenneffer Jiminit', 2, 0, 'SN123456789', NULL, '2020-04-04', '2020-04-04');
/*!40000 ALTER TABLE `om_requisition` ENABLE KEYS */;

-- Dumping structure for table admin.om_requisition_item
CREATE TABLE IF NOT EXISTS `om_requisition_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rq_id` int(11) DEFAULT NULL,
  `particular` text DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rq_id` (`rq_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.om_requisition_item: 25 rows
/*!40000 ALTER TABLE `om_requisition_item` DISABLE KEYS */;
INSERT INTO `om_requisition_item` (`id`, `rq_id`, `particular`, `total`, `remark`) VALUES
	(1, 1, 'test1', 10, 'test saja'),
	(2, 1, 'test2', 10, 'test saja sy bilang tu'),
	(3, 1, 'test3', 10, 'test saja'),
	(4, 2, 'test1', 10, 'COMPH H/P J4'),
	(5, 3, 'test', 10, 'test saja'),
	(6, 4, 'test', 10, 'COMPH H/P J4'),
	(7, 5, 'test1', 10, 'COMPH H/P J4'),
	(8, 6, 'test1', 10, 'COMPH H/P J4'),
	(9, 7, 'test1', 10, 'test saja'),
	(10, 8, 'test', 10, 'COMPH H/P J4'),
	(11, 9, 'test1', 10, 'COMPH H/P J4'),
	(12, 10, 'test1', 10, 'COMPH H/P J4'),
	(13, 11, 'test', 10, 'COMPH H/P J4'),
	(14, 12, 'test', 10, 'COMPH H/P J4'),
	(15, 13, 'test', 10, 'COMPH H/P J4'),
	(16, 14, 'test', 10, 'COMPH H/P J4'),
	(17, 15, 'test', 10, 'COMPH H/P J4'),
	(18, 16, 'test', 10, 'COMPH H/P J4'),
	(19, 17, 'test', 10, 'COMPH H/P J4'),
	(20, 18, 'test', 10, 'COMPH H/P J4'),
	(21, 19, 'test', 10, 'COMPH H/P J4'),
	(22, 20, 'test', 10, 'COMPH H/P J4'),
	(23, 20, 'test1', 10, 'VIVO'),
	(24, 22, 'Chair for marketing department', 120, 'urgently needed'),
	(25, 23, 'Chair for marketing department', 120, 'urgently needed');
/*!40000 ALTER TABLE `om_requisition_item` ENABLE KEYS */;

-- Dumping structure for table admin.stationary_department
CREATE TABLE IF NOT EXISTS `stationary_department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_code` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.stationary_department: ~19 rows (approximately)
/*!40000 ALTER TABLE `stationary_department` DISABLE KEYS */;
INSERT INTO `stationary_department` (`department_id`, `department_code`, `status`) VALUES
	(1, 'ADMIN', 1),
	(2, 'IT HARDWARE	', 1),
	(3, 'ACCOUNTS', 1),
	(4, 'BILLING', 1),
	(5, 'CREDIT CONTROL', 1),
	(6, 'JUA NIKMAT', 1),
	(7, 'LOGISTIC', 1),
	(8, 'FEEDMIL', 1),
	(9, 'INVENTORY', 1),
	(10, 'FARM', 1),
	(11, 'PROCESSING PLANT', 1),
	(12, 'HR', 1),
	(13, 'MARKETING', 1),
	(14, 'BROILER', 1),
	(15, 'COLLECTIONS', 1),
	(16, 'LOGISTIC', 1),
	(17, 'LOADING', 1),
	(18, 'PURCHASING', 1),
	(19, 'HATCHERY', 1);
/*!40000 ALTER TABLE `stationary_department` ENABLE KEYS */;

-- Dumping structure for table admin.stationary_item
CREATE TABLE IF NOT EXISTS `stationary_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) DEFAULT NULL,
  `unit` varchar(25) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table admin.stationary_item: ~83 rows (approximately)
/*!40000 ALTER TABLE `stationary_item` DISABLE KEYS */;
INSERT INTO `stationary_item` (`id`, `item_name`, `unit`, `status`) VALUES
	(1, 'L-FOLDER A4 TRANSPARENTS', NULL, 1),
	(2, 'U-FOLDER A4 TRANSPARENTS', NULL, 1),
	(3, 'L-FOLDER COLOURFUL', NULL, 1),
	(4, 'ENVELOPE BROWN-HALF', NULL, 1),
	(5, 'ENVELOPE WHITE-WINDOW', NULL, 1),
	(6, 'ENVELOPE A3', NULL, 1),
	(7, 'ENVELOPE A4', NULL, 1),
	(8, 'ENVELOPE A5', NULL, 1),
	(9, 'INDEX DIVIDER-NUMBER', NULL, 0),
	(10, 'COLOURFUL PAPER-GREEN', NULL, 1),
	(11, 'COLOURFUL PAPER-PINK', NULL, 1),
	(12, 'WHITE STIKER', NULL, 1),
	(13, 'ASTAR PENGUIN PAPER CLIP(SMALL)', NULL, 1),
	(14, 'JUMBO GEM/ASTAR CLIPS(BIG)', NULL, 1),
	(15, 'DOUBLE CLIP-19MM', NULL, 1),
	(16, 'DOUBLE CLIP-25MM', NULL, 1),
	(17, 'DOUBLE CLIP-32MM', NULL, 1),
	(18, 'DOUBLE CLIP-41MM', NULL, 1),
	(19, 'DOUBLE CLIP-51MM', NULL, 1),
	(20, 'PERMANENT MARKER-BLUE', NULL, 1),
	(21, 'PERMANENT MARKER-BLACK', NULL, 1),
	(22, 'PERMANENT MARKER-RED', NULL, 1),
	(23, 'MULTIPURPOSE MARKER-BLUE', NULL, 1),
	(24, 'MULTIPURPOSE MARKER-BLACK', NULL, 1),
	(25, 'MULTIPURPOSE MARKER-RED', NULL, 1),
	(26, 'WHITEBOARD MARKER-BLUE', NULL, 1),
	(27, 'WHITEBOARD MARKER-BLACK', NULL, 1),
	(28, 'WHITEBOARD MARKER-RED', NULL, 1),
	(29, 'STAMPAD INK-BLUE', NULL, 1),
	(30, 'STAMPAD INK-BLACK', NULL, 1),
	(31, 'STAMPAD INK-RED', NULL, 1),
	(32, 'STAMPAD-BLUE', NULL, 1),
	(33, 'STAMPAD-BLACK', NULL, 1),
	(34, 'STAMPAD-RED', NULL, 1),
	(35, 'PAPER PUNCH', NULL, 1),
	(36, 'HP LASERJET 126A (CE310A) BLACK', NULL, 1),
	(37, 'HP LASERJET 126A (CE312A) YELLOW', NULL, 1),
	(38, 'HP LASERJET 126A (CE311A) CYAN', NULL, 1),
	(39, 'HP LASERJET 126A (CE313A) MAGENTA', NULL, 1),
	(40, 'HP OFFICEJET 901 TRI-COLOUR', NULL, 1),
	(41, 'HP OFFICEJET 901 BLACK', NULL, 1),
	(42, 'EPSON ERC-38B', NULL, 1),
	(43, 'PRINTONIX P7000 ULTRA CAPACITY PRINTER RIBBON', NULL, 1),
	(44, 'AMANO CE-315250 TWO COLOUR', NULL, 1),
	(45, 'EPSON RIBBON CARTRIDGE-S015506/#7753', NULL, 1),
	(46, 'EPSON RIBBON CARTRIDGE-S015586/S015336', NULL, 1),
	(47, 'EPSON RIBBON CARTRIDGE-S015531/S015086', NULL, 1),
	(48, 'DELL 113X', NULL, 1),
	(49, 'BROTHER TN-2150', NULL, 1),
	(50, 'PRINTONIX P8000/P7000 CARTRIDGE RIBBON', NULL, 1),
	(51, 'EXERCISE BOOK 76PAGES', NULL, 1),
	(52, 'EXERCISE BOOK 116PAGES', NULL, 1),
	(53, 'PURCHASE ORDER', NULL, 1),
	(54, 'BUKU BILL-SMALL', NULL, 1),
	(55, 'BUKU BILL-BIG', NULL, 1),
	(56, 'RECEIPT VOUCHER', NULL, 1),
	(57, 'MARKING INK- BLUE', NULL, 1),
	(58, 'MARKING INK-BLACK', NULL, 1),
	(59, 'EPSON T0873 MAGENTA', NULL, 1),
	(60, 'EPSON T0879 ORANGE', NULL, 1),
	(61, 'EPSON T0872 CYAN', NULL, 1),
	(62, 'EPSON T0878 MATTE BLACK', NULL, 1),
	(63, 'EPSON T0877 RED', NULL, 1),
	(64, 'EPSON T0874 YELLOW', NULL, 1),
	(65, 'SEIKO PRECISION #FB-60051', NULL, 0),
	(66, 'HP LASERJET 53A (Q7553A) BLACK', NULL, 1),
	(67, 'HP LASERJET 36A (C436A) BLACK', NULL, 1),
	(68, 'HP LASERJET 125A (CB542A) YELLOW', NULL, 1),
	(69, 'HP LASERJET 125A (CB540A) BLACK', NULL, 1),
	(70, 'HP LASERJET 125A (CB543A) MAGENTA', NULL, 1),
	(71, 'HP LASERJET 125A (CB541A) CYAN', NULL, 1),
	(72, 'SAMSUNG ML 2010 D3', NULL, 1),
	(128, 'EXERCISE BOOK 80PAGES', NULL, 1),
	(129, 'EXERCISE BOOK 120PAGES', NULL, 1),
	(130, 'COLOURFUL PAPER-BLUE', NULL, 1),
	(131, 'LASERJET TONER CATRIDGE (CC 388A)', NULL, 1),
	(132, 'HP LASERJET 125A BLACK', NULL, 1),
	(133, 'HP LASERJET 125A MAGENTA', NULL, 1),
	(134, 'HP LASERJET 125A CYAN', NULL, 1),
	(135, 'HP LASERJET 53 BLACK', NULL, 1),
	(136, 'SEIKO PRECISION (FB60051)', NULL, 1),
	(137, 'SEIKO PRECISION (FB 60051)', NULL, 0),
	(138, 'LASERJET TONER CATRIDGE (CC388A)', NULL, 1);
/*!40000 ALTER TABLE `stationary_item` ENABLE KEYS */;

-- Dumping structure for table admin.stationary_item_ori
CREATE TABLE IF NOT EXISTS `stationary_item_ori` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_name` varchar(40) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- Dumping data for table admin.stationary_item_ori: ~58 rows (approximately)
/*!40000 ALTER TABLE `stationary_item_ori` DISABLE KEYS */;
INSERT INTO `stationary_item_ori` (`id`, `item_name`, `unit`, `status`) VALUES
	(1, 'L-FOLDER A4 TRANSPARENTS', 'pieces', 1),
	(2, 'U-FOLDER A4 TRANSPARENTS', 'pieces', 1),
	(3, 'L-FOLDER COLOURFUL', 'pieces', 1),
	(4, 'EXERCISE BOOK 80PAGES', NULL, 1),
	(5, 'EXERCISE BOOK 120PAGES', NULL, 1),
	(6, 'ENVELOPE BROWN-HALF', NULL, 1),
	(7, 'ENVELOPE WHITE-WINDOW', NULL, 1),
	(8, 'ENVELOPE A3', NULL, 1),
	(9, 'ENVELOPE A4', NULL, 1),
	(10, 'ENVELOPE A5', NULL, 1),
	(11, 'INDEX DIVIDER-NUMBER', NULL, 1),
	(12, 'COLOURFULL PAPER-PINK', NULL, 1),
	(13, 'COLOURFUL PAPER-GREEN', NULL, 1),
	(14, 'COLOURFUL PAPER-BLUE', NULL, 1),
	(15, 'WHITE STIKER', NULL, 1),
	(16, 'ASTAR PENGUIN PAPER CLIP(SMALL)', NULL, 1),
	(17, 'JUMBO GEM/ASTAR CLIPS(BIG)', NULL, 1),
	(18, 'DOUBLE CLIP-19MM', NULL, 1),
	(19, 'DOUBLE CLIP-25MM', NULL, 1),
	(20, 'DOUBLE CLIP-32MM', NULL, 1),
	(21, 'DOUBLE CLIP-41MM', NULL, 1),
	(22, 'DOUBLE CLIP-51MM', NULL, 1),
	(23, 'PERMANENT MARKER-BLUE', NULL, 1),
	(24, 'PERMANENT MARKER-BLACK', NULL, 1),
	(25, 'PERMANENT MARKER-RED', NULL, 1),
	(26, 'MULTIPURPOSE MARKER-BLUE', NULL, 1),
	(27, 'MULTIPURPOSE MARKER-BLACK', NULL, 1),
	(28, 'MULTIPURPOSE MARKER-RED', NULL, 1),
	(29, 'WHITEBOARD MARKER-BLUE', NULL, 1),
	(30, 'WHITEBOARD MARKER-BLACK', NULL, 1),
	(31, 'WHITEBOARD MARKER-RED', NULL, 1),
	(32, 'STAMPAD INK-BLUE', NULL, 1),
	(33, 'STAMPAD INK-BLACK', NULL, 1),
	(34, 'STAMPAD INK-RED', NULL, 1),
	(35, 'STAMPAD-BLUE', NULL, 1),
	(36, 'STAMPAD-BLACK', NULL, 1),
	(37, 'STAMPAD-RED', NULL, 1),
	(38, 'PAPER PUNCH', NULL, 1),
	(39, 'HP LASERJET 126A (CE310A) BLACK', NULL, 1),
	(40, 'HP LASERJET 126A (CE312A) YELLOW', NULL, 1),
	(41, 'HP LASERJET 126A (CE311A) CYAN', NULL, 1),
	(42, 'HP LASERJET 126A (CE313A) MAGENTA', NULL, 1),
	(43, 'HP OFFICEJET 901 TRI-COLOUR', NULL, 1),
	(44, 'HP OFFICEJET 901 BLACK', NULL, 1),
	(45, 'EPSON ERC-38B', NULL, 1),
	(46, 'PRINTONIX P7000 ULTRA CAPACITY PRINTER R', NULL, 1),
	(47, 'AMANO CE-315250 TWO COLOUR', NULL, 1),
	(48, 'EPSON RIBBON CARTRIDGE-S015506/#7753', NULL, 1),
	(49, 'EPSON RIBBON CARTRIDGE-S015586/S015336', NULL, 1),
	(50, 'EPSON RIBBON CARTRIDGE-S015531/S015086', NULL, 1),
	(51, 'DELL 113X', NULL, 1),
	(52, 'BROTHER TN-2150', NULL, 1),
	(53, 'PRINTONIX P8000/P7000 CARTRIDGE RIBBON', NULL, 1),
	(54, 'HP LASERJET 125A BLACK', NULL, 1),
	(55, 'HP LASERJET 125A MAGENTA', NULL, 1),
	(56, 'HP LASERJET 125A CYAN', NULL, 1),
	(57, 'HP LASERJET 125A YELLOW', NULL, 1),
	(58, 'test', NULL, 1);
/*!40000 ALTER TABLE `stationary_item_ori` ENABLE KEYS */;

-- Dumping structure for table admin.stationary_stock
CREATE TABLE IF NOT EXISTS `stationary_stock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `stock_in` int(11) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table admin.stationary_stock: ~4 rows (approximately)
/*!40000 ALTER TABLE `stationary_stock` DISABLE KEYS */;
INSERT INTO `stationary_stock` (`id`, `item_id`, `stock_in`, `date_added`, `status`) VALUES
	(1, 2, 49, '2020-02-27', 1),
	(2, 2, 7, '2020-02-27', 0),
	(3, 4, 15, '2020-02-27', 1),
	(4, 14, 15, '2020-02-27', 1);
/*!40000 ALTER TABLE `stationary_stock` ENABLE KEYS */;

-- Dumping structure for table admin.stationary_stock_balance
CREATE TABLE IF NOT EXISTS `stationary_stock_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `stock_balance` int(11) DEFAULT NULL,
  `last_updated` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.stationary_stock_balance: ~3 rows (approximately)
/*!40000 ALTER TABLE `stationary_stock_balance` DISABLE KEYS */;
INSERT INTO `stationary_stock_balance` (`id`, `item_id`, `stock_balance`, `last_updated`, `updated_by`) VALUES
	(1, 2, 44, '2020-03-12', 2),
	(2, 4, 14, '2020-02-29', 2),
	(3, 14, 14, '2020-02-29', 2);
/*!40000 ALTER TABLE `stationary_stock_balance` ENABLE KEYS */;

-- Dumping structure for table admin.stationary_stock_take
CREATE TABLE IF NOT EXISTS `stationary_stock_take` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `date_taken` date DEFAULT NULL,
  `department_code` varchar(50) DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=944 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Dumping data for table admin.stationary_stock_take: ~680 rows (approximately)
/*!40000 ALTER TABLE `stationary_stock_take` DISABLE KEYS */;
INSERT INTO `stationary_stock_take` (`id`, `department_id`, `item_id`, `quantity`, `date_added`, `date_taken`, `department_code`, `item_name`) VALUES
	(1, 1, 3, 1, NULL, '2019-02-28', 'ADMIN', 'L-FOLDER COLOURFUL'),
	(2, 1, 5, 1, NULL, '2019-02-28', 'ADMIN', 'ENVELOPE WHITE-WINDOW'),
	(3, 1, 17, 1, NULL, '2019-02-28', 'ADMIN', 'DOUBLE CLIP-32MM'),
	(4, 1, 18, 1, NULL, '2019-02-28', 'ADMIN', 'DOUBLE CLIP-41MM'),
	(5, 1, 20, 1, NULL, '2019-02-28', 'ADMIN', 'PERMANENT MARKER-BLUE'),
	(8, 1, 1, 5, NULL, '2019-01-31', 'ADMIN', 'L-FOLDER A4 TRANSPARENTS'),
	(9, 1, 2, 7, NULL, '2019-01-31', 'ADMIN', 'U-FOLDER A4 TRANSPARENTS'),
	(10, 1, 51, 3, NULL, '2019-01-31', 'ADMIN', 'EXERCISE BOOK 76PAGES'),
	(11, 1, 52, 2, NULL, '2019-01-31', 'ADMIN', 'EXERCISE BOOK 116PAGES'),
	(12, 1, 11, 32, NULL, '2019-01-31', 'ADMIN', 'COLOURFUL PAPER-PINK'),
	(13, 1, 15, 1, NULL, '2019-01-31', 'ADMIN', 'DOUBLE CLIP-19MM'),
	(14, 1, 18, 1, NULL, '2019-01-31', 'ADMIN', 'DOUBLE CLIP-41MM'),
	(15, 1, 27, 2, NULL, '2019-01-31', 'ADMIN', 'WHITEBOARD MARKER-BLACK'),
	(23, 1, 2, 3, NULL, '2019-03-31', 'ADMIN', 'U-FOLDER A4 TRANSPARENTS'),
	(24, 1, 51, 3, NULL, '2019-03-31', 'ADMIN', 'EXERCISE BOOK 76PAGES'),
	(25, 1, 52, 1, NULL, '2019-03-31', 'ADMIN', 'EXERCISE BOOK 116PAGES'),
	(26, 1, 9, 1, NULL, '2019-03-31', 'ADMIN', 'INDEX DIVIDER-NUMBER'),
	(27, 1, 11, 40, NULL, '2019-03-31', 'ADMIN', 'COLOURFUL PAPER-PINK'),
	(30, 1, 1, 5, NULL, '2019-04-30', 'ADMIN', 'L-FOLDER A4 TRANSPARENTS'),
	(31, 1, 128, 1, NULL, '2019-04-30', 'ADMIN', 'EXERCISE BOOK 80PAGES'),
	(32, 1, 6, 3, NULL, '2019-04-30', 'ADMIN', 'ENVELOPE A3'),
	(33, 1, 7, 7, NULL, '2019-04-30', 'ADMIN', 'ENVELOPE A4'),
	(34, 1, 11, 20, NULL, '2019-04-30', 'ADMIN', 'COLOURFUL PAPER-PINK'),
	(35, 1, 26, 1, NULL, '2019-04-30', 'ADMIN', 'WHITEBOARD MARKER-BLUE'),
	(36, 1, 27, 1, NULL, '2019-04-30', 'ADMIN', 'WHITEBOARD MARKER-BLACK'),
	(37, 1, 28, 1, NULL, '2019-04-30', 'ADMIN', 'WHITEBOARD MARKER-RED'),
	(45, 1, 1, 6, NULL, '2019-05-31', 'ADMIN', 'L-FOLDER A4 TRANSPARENTS'),
	(46, 1, 2, 4, NULL, '2019-05-31', 'ADMIN', 'U-FOLDER A4 TRANSPARENTS'),
	(47, 1, 129, 1, NULL, '2019-05-31', 'ADMIN', 'EXERCISE BOOK 120PAGES'),
	(48, 1, 7, 4, NULL, '2019-05-31', 'ADMIN', 'ENVELOPE A4'),
	(49, 1, 11, 2, NULL, '2019-05-31', 'ADMIN', 'COLOURFUL PAPER-PINK'),
	(50, 1, 19, 2, NULL, '2019-05-31', 'ADMIN', 'DOUBLE CLIP-51MM'),
	(51, 1, 30, 1, NULL, '2019-05-31', 'ADMIN', 'STAMPAD INK-BLACK'),
	(52, 1, 32, 1, NULL, '2019-05-31', 'ADMIN', 'STAMPAD-BLUE'),
	(60, 1, 1, 7, NULL, '2019-06-30', 'ADMIN', 'L-FOLDER A4 TRANSPARENTS'),
	(61, 1, 2, 5, NULL, '2019-06-30', 'ADMIN', 'U-FOLDER A4 TRANSPARENTS'),
	(62, 1, 128, 1, NULL, '2019-06-30', 'ADMIN', 'EXERCISE BOOK 80PAGES'),
	(63, 1, 7, 5, NULL, '2019-06-30', 'ADMIN', 'ENVELOPE A4'),
	(67, 1, 2, 2, NULL, '2019-07-31', 'ADMIN', 'U-FOLDER A4 TRANSPARENTS'),
	(68, 1, 129, 1, NULL, '2019-07-31', 'ADMIN', 'EXERCISE BOOK 120PAGES'),
	(69, 1, 7, 10, NULL, '2019-07-31', 'ADMIN', 'ENVELOPE A4'),
	(70, 1, 16, 2, NULL, '2019-07-31', 'ADMIN', 'DOUBLE CLIP-25MM'),
	(71, 1, 27, 1, NULL, '2019-07-31', 'ADMIN', 'WHITEBOARD MARKER-BLACK'),
	(74, 1, 1, 1, NULL, '2019-08-31', 'ADMIN', 'L-FOLDER A4 TRANSPARENTS'),
	(75, 1, 2, 16, NULL, '2019-08-31', 'ADMIN', 'U-FOLDER A4 TRANSPARENTS'),
	(76, 1, 3, 16, NULL, '2019-08-31', 'ADMIN', 'L-FOLDER COLOURFUL'),
	(77, 1, 128, 1, NULL, '2019-08-31', 'ADMIN', 'EXERCISE BOOK 80PAGES'),
	(78, 1, 129, 4, NULL, '2019-08-31', 'ADMIN', 'EXERCISE BOOK 120PAGES'),
	(79, 1, 4, 5, NULL, '2019-08-31', 'ADMIN', 'ENVELOPE BROWN-HALF'),
	(80, 1, 5, 5, NULL, '2019-08-31', 'ADMIN', 'ENVELOPE WHITE-WINDOW'),
	(81, 1, 7, 15, NULL, '2019-08-31', 'ADMIN', 'ENVELOPE A4'),
	(82, 1, 8, 5, NULL, '2019-08-31', 'ADMIN', 'ENVELOPE A5'),
	(89, 1, 1, 4, NULL, '2019-09-30', 'ADMIN', 'L-FOLDER A4 TRANSPARENTS'),
	(90, 1, 2, 1, NULL, '2019-09-30', 'ADMIN', 'U-FOLDER A4 TRANSPARENTS'),
	(91, 1, 128, 2, NULL, '2019-09-30', 'ADMIN', 'EXERCISE BOOK 80PAGES'),
	(92, 1, 7, 1, NULL, '2019-09-30', 'ADMIN', 'ENVELOPE A4'),
	(93, 1, 130, 5, NULL, '2019-09-30', 'ADMIN', 'COLOURFUL PAPER-BLUE'),
	(94, 1, 18, 2, NULL, '2019-09-30', 'ADMIN', 'DOUBLE CLIP-41MM'),
	(95, 1, 19, 2, NULL, '2019-09-30', 'ADMIN', 'DOUBLE CLIP-51MM'),
	(96, 1, 27, 1, NULL, '2019-09-30', 'ADMIN', 'WHITEBOARD MARKER-BLACK'),
	(104, 1, 1, 12, NULL, '2019-10-31', 'ADMIN', 'L-FOLDER A4 TRANSPARENTS'),
	(105, 1, 2, 7, NULL, '2019-10-31', 'ADMIN', 'U-FOLDER A4 TRANSPARENTS'),
	(106, 1, 128, 1, NULL, '2019-10-31', 'ADMIN', 'EXERCISE BOOK 80PAGES'),
	(107, 1, 7, 6, NULL, '2019-10-31', 'ADMIN', 'ENVELOPE A4'),
	(108, 1, 28, 1, NULL, '2019-10-31', 'ADMIN', 'WHITEBOARD MARKER-RED'),
	(111, 1, 2, 1, NULL, '2019-11-30', 'ADMIN', 'U-FOLDER A4 TRANSPARENTS'),
	(112, 1, 3, 2, NULL, '2019-11-30', 'ADMIN', 'L-FOLDER COLOURFUL'),
	(113, 1, 129, 1, NULL, '2019-11-30', 'ADMIN', 'EXERCISE BOOK 120PAGES'),
	(114, 1, 5, 10, NULL, '2019-11-30', 'ADMIN', 'ENVELOPE WHITE-WINDOW'),
	(118, 1, 1, 5, NULL, '2019-12-31', 'ADMIN', 'L-FOLDER A4 TRANSPARENTS'),
	(119, 1, 7, 2, NULL, '2019-12-31', 'ADMIN', 'ENVELOPE A4'),
	(121, 2, 19, 1, NULL, '2019-01-31', 'IT HARDWARE', 'DOUBLE CLIP-51MM'),
	(122, 2, 21, 1, NULL, '2019-02-28', 'IT HARDWARE', 'PERMANENT MARKER-BLACK'),
	(123, 2, 1, 1, NULL, '2019-04-30', 'IT HARDWARE', 'L-FOLDER A4 TRANSPARENTS'),
	(124, 2, 4, 1, NULL, '2019-04-30', 'IT HARDWARE', 'ENVELOPE BROWN-HALF'),
	(126, 2, 4, 1, NULL, '2019-05-31', 'IT HARDWARE', 'ENVELOPE BROWN-HALF'),
	(127, 2, 13, 2, NULL, '2019-06-30', 'IT HARDWARE', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(128, 2, 19, 3, NULL, '2019-06-30', 'IT HARDWARE', 'DOUBLE CLIP-51MM'),
	(130, 2, 2, 11, NULL, '2019-07-31', 'IT HARDWARE', 'U-FOLDER A4 TRANSPARENTS'),
	(131, 2, 7, 1, NULL, '2019-07-31', 'IT HARDWARE', 'ENVELOPE A4'),
	(132, 2, 18, 1, NULL, '2019-07-31', 'IT HARDWARE', 'DOUBLE CLIP-41MM'),
	(133, 2, 13, 1, NULL, '2019-08-31', 'IT HARDWARE', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(134, 2, 47, 1, NULL, '2019-09-30', 'IT HARDWARE', 'EPSON RIBBON CARTRIDGE-S015531/S015086'),
	(135, 2, 26, 2, NULL, '2019-11-30', 'IT HARDWARE', 'WHITEBOARD MARKER-BLUE'),
	(136, 2, 27, 3, NULL, '2019-11-30', 'IT HARDWARE', 'WHITEBOARD MARKER-BLACK'),
	(137, 2, 28, 3, NULL, '2019-11-30', 'IT HARDWARE', 'WHITEBOARD MARKER-RED'),
	(138, 2, 7, 5, NULL, '2019-12-31', 'IT HARDWARE', 'ENVELOPE A4'),
	(139, 3, 1, 10, NULL, '2019-01-31', 'ACCOUNTS', 'L-FOLDER A4 TRANSPARENTS'),
	(140, 3, 3, 5, NULL, '2019-01-31', 'ACCOUNTS', 'L-FOLDER COLOURFUL'),
	(141, 3, 52, 1, NULL, '2019-01-31', 'ACCOUNTS', 'EXERCISE BOOK 116PAGES'),
	(142, 3, 7, 7, NULL, '2019-01-31', 'ACCOUNTS', 'ENVELOPE A4'),
	(143, 3, 46, 1, NULL, '2019-01-31', 'ACCOUNTS', 'EPSON RIBBON CARTRIDGE-S015586/S015336'),
	(146, 3, 1, 20, NULL, '2019-02-28', 'ACCOUNTS', 'L-FOLDER A4 TRANSPARENTS'),
	(147, 3, 10, 5, NULL, '2019-02-28', 'ACCOUNTS', 'COLOURFUL PAPER-GREEN'),
	(148, 3, 13, 3, NULL, '2019-02-28', 'ACCOUNTS', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(149, 3, 14, 1, NULL, '2019-02-28', 'ACCOUNTS', 'JUMBO GEM/ASTAR CLIPS(BIG)'),
	(150, 3, 15, 2, NULL, '2019-02-28', 'ACCOUNTS', 'DOUBLE CLIP-19MM'),
	(151, 3, 18, 1, NULL, '2019-02-28', 'ACCOUNTS', 'DOUBLE CLIP-41MM'),
	(153, 3, 7, 1, NULL, '2019-03-31', 'ACCOUNTS', 'ENVELOPE A4'),
	(154, 3, 11, 40, NULL, '2019-03-31', 'ACCOUNTS', 'COLOURFUL PAPER-PINK'),
	(155, 3, 32, 1, NULL, '2019-03-31', 'ACCOUNTS', 'STAMPAD-BLUE'),
	(156, 3, 7, 5, NULL, '2019-04-30', 'ACCOUNTS', 'ENVELOPE A4'),
	(157, 3, 15, 12, NULL, '2019-04-30', 'ACCOUNTS', 'DOUBLE CLIP-19MM'),
	(159, 3, 1, 10, NULL, '2019-05-31', 'ACCOUNTS', 'L-FOLDER A4 TRANSPARENTS'),
	(160, 3, 2, 1, NULL, '2019-05-31', 'ACCOUNTS', 'U-FOLDER A4 TRANSPARENTS'),
	(161, 3, 129, 2, NULL, '2019-05-31', 'ACCOUNTS', 'EXERCISE BOOK 120PAGES'),
	(162, 3, 7, 32, NULL, '2019-05-31', 'ACCOUNTS', 'ENVELOPE A4'),
	(163, 3, 15, 2, NULL, '2019-05-31', 'ACCOUNTS', 'DOUBLE CLIP-19MM'),
	(164, 3, 16, 2, NULL, '2019-05-31', 'ACCOUNTS', 'DOUBLE CLIP-25MM'),
	(166, 3, 1, 15, NULL, '2019-06-30', 'ACCOUNTS', 'L-FOLDER A4 TRANSPARENTS'),
	(167, 3, 3, 15, NULL, '2019-06-30', 'ACCOUNTS', 'L-FOLDER COLOURFUL'),
	(168, 3, 7, 2, NULL, '2019-06-30', 'ACCOUNTS', 'ENVELOPE A4'),
	(169, 3, 20, 2, NULL, '2019-06-30', 'ACCOUNTS', 'PERMANENT MARKER-BLUE'),
	(170, 3, 29, 1, NULL, '2019-06-30', 'ACCOUNTS', 'STAMPAD INK-BLUE'),
	(173, 3, 1, 2, NULL, '2019-07-31', 'ACCOUNTS', 'L-FOLDER A4 TRANSPARENTS'),
	(174, 3, 2, 2, NULL, '2019-07-31', 'ACCOUNTS', 'U-FOLDER A4 TRANSPARENTS'),
	(175, 3, 129, 3, NULL, '2019-07-31', 'ACCOUNTS', 'EXERCISE BOOK 120PAGES'),
	(176, 3, 7, 10, NULL, '2019-07-31', 'ACCOUNTS', 'ENVELOPE A4'),
	(177, 3, 15, 2, NULL, '2019-07-31', 'ACCOUNTS', 'DOUBLE CLIP-19MM'),
	(178, 3, 17, 1, NULL, '2019-07-31', 'ACCOUNTS', 'DOUBLE CLIP-32MM'),
	(179, 3, 20, 1, NULL, '2019-07-31', 'ACCOUNTS', 'PERMANENT MARKER-BLUE'),
	(180, 3, 7, 5, NULL, '2019-08-31', 'ACCOUNTS', 'ENVELOPE A4'),
	(181, 3, 11, 20, NULL, '2019-08-31', 'ACCOUNTS', 'COLOURFUL PAPER-PINK'),
	(182, 3, 13, 1, NULL, '2019-08-31', 'ACCOUNTS', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(183, 3, 15, 1, NULL, '2019-08-31', 'ACCOUNTS', 'DOUBLE CLIP-19MM'),
	(184, 3, 19, 10, NULL, '2019-08-31', 'ACCOUNTS', 'DOUBLE CLIP-51MM'),
	(185, 3, 20, 1, NULL, '2019-08-31', 'ACCOUNTS', 'PERMANENT MARKER-BLUE'),
	(186, 3, 43, 1, NULL, '2019-08-31', 'ACCOUNTS', 'PRINTONIX P7000 ULTRA CAPACITY PRINTER RIBBON'),
	(187, 3, 47, 1, NULL, '2019-08-31', 'ACCOUNTS', 'EPSON RIBBON CARTRIDGE-S015531/S015086'),
	(188, 3, 50, 1, NULL, '2019-08-31', 'ACCOUNTS', 'PRINTONIX P8000/P7000 CARTRIDGE RIBBON'),
	(195, 3, 1, 16, NULL, '2019-09-30', 'ACCOUNTS', 'L-FOLDER A4 TRANSPARENTS'),
	(196, 3, 3, 3, NULL, '2019-09-30', 'ACCOUNTS', 'L-FOLDER COLOURFUL'),
	(197, 3, 7, 16, NULL, '2019-09-30', 'ACCOUNTS', 'ENVELOPE A4'),
	(198, 3, 15, 5, NULL, '2019-09-30', 'ACCOUNTS', 'DOUBLE CLIP-19MM'),
	(199, 3, 17, 1, NULL, '2019-09-30', 'ACCOUNTS', 'DOUBLE CLIP-32MM'),
	(200, 3, 19, 5, NULL, '2019-09-30', 'ACCOUNTS', 'DOUBLE CLIP-51MM'),
	(201, 3, 29, 1, NULL, '2019-09-30', 'ACCOUNTS', 'STAMPAD INK-BLUE'),
	(202, 3, 1, 2, NULL, '2019-10-31', 'ACCOUNTS', 'L-FOLDER A4 TRANSPARENTS'),
	(203, 3, 129, 1, NULL, '2019-10-31', 'ACCOUNTS', 'EXERCISE BOOK 120PAGES'),
	(204, 3, 4, 1, NULL, '2019-10-31', 'ACCOUNTS', 'ENVELOPE BROWN-HALF'),
	(205, 3, 7, 1, NULL, '2019-10-31', 'ACCOUNTS', 'ENVELOPE A4'),
	(206, 3, 13, 1, NULL, '2019-10-31', 'ACCOUNTS', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(207, 3, 15, 1, NULL, '2019-10-31', 'ACCOUNTS', 'DOUBLE CLIP-19MM'),
	(208, 3, 17, 1, NULL, '2019-10-31', 'ACCOUNTS', 'DOUBLE CLIP-32MM'),
	(209, 3, 19, 12, NULL, '2019-10-31', 'ACCOUNTS', 'DOUBLE CLIP-51MM'),
	(210, 3, 29, 1, NULL, '2019-10-31', 'ACCOUNTS', 'STAMPAD INK-BLUE'),
	(217, 3, 1, 33, NULL, '2019-11-30', 'ACCOUNTS', 'L-FOLDER A4 TRANSPARENTS'),
	(218, 3, 129, 1, NULL, '2019-11-30', 'ACCOUNTS', 'EXERCISE BOOK 120PAGES'),
	(219, 3, 7, 23, NULL, '2019-11-30', 'ACCOUNTS', 'ENVELOPE A4'),
	(220, 3, 13, 2, NULL, '2019-11-30', 'ACCOUNTS', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(221, 3, 16, 1, NULL, '2019-11-30', 'ACCOUNTS', 'DOUBLE CLIP-25MM'),
	(222, 3, 17, 1, NULL, '2019-11-30', 'ACCOUNTS', 'DOUBLE CLIP-32MM'),
	(224, 3, 1, 2, NULL, '2019-12-31', 'ACCOUNTS', 'L-FOLDER A4 TRANSPARENTS'),
	(225, 3, 129, 2, NULL, '2019-12-31', 'ACCOUNTS', 'EXERCISE BOOK 120PAGES'),
	(226, 3, 6, 1, NULL, '2019-12-31', 'ACCOUNTS', 'ENVELOPE A3'),
	(227, 3, 7, 13, NULL, '2019-12-31', 'ACCOUNTS', 'ENVELOPE A4'),
	(228, 3, 13, 1, NULL, '2019-12-31', 'ACCOUNTS', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(231, 4, 5, 5, NULL, '2019-01-31', 'BILLING', 'ENVELOPE WHITE-WINDOW'),
	(232, 4, 14, 1, NULL, '2019-01-31', 'BILLING', 'JUMBO GEM/ASTAR CLIPS(BIG)'),
	(233, 4, 43, 4, NULL, '2019-01-31', 'BILLING', 'PRINTONIX P7000 ULTRA CAPACITY PRINTER RIBBON'),
	(234, 4, 50, 3, NULL, '2019-01-31', 'BILLING', 'PRINTONIX P8000/P7000 CARTRIDGE RIBBON'),
	(238, 4, 4, 10, NULL, '2019-02-28', 'BILLING', 'ENVELOPE BROWN-HALF'),
	(239, 4, 7, 2, NULL, '2019-02-28', 'BILLING', 'ENVELOPE A4'),
	(240, 4, 42, 1, NULL, '2019-02-28', 'BILLING', 'EPSON ERC-38B'),
	(241, 4, 43, 1, NULL, '2019-02-28', 'BILLING', 'PRINTONIX P7000 ULTRA CAPACITY PRINTER RIBBON'),
	(242, 4, 50, 1, NULL, '2019-02-28', 'BILLING', 'PRINTONIX P8000/P7000 CARTRIDGE RIBBON'),
	(245, 4, 51, 1, NULL, '2019-03-31', 'BILLING', 'EXERCISE BOOK 76PAGES'),
	(246, 4, 52, 5, NULL, '2019-03-31', 'BILLING', 'EXERCISE BOOK 116PAGES'),
	(247, 4, 43, 2, NULL, '2019-03-31', 'BILLING', 'PRINTONIX P7000 ULTRA CAPACITY PRINTER RIBBON'),
	(248, 4, 50, 2, NULL, '2019-03-31', 'BILLING', 'PRINTONIX P8000/P7000 CARTRIDGE RIBBON'),
	(252, 4, 20, 1, NULL, '2019-04-30', 'BILLING', 'PERMANENT MARKER-BLUE'),
	(253, 4, 29, 1, NULL, '2019-04-30', 'BILLING', 'STAMPAD INK-BLUE'),
	(254, 4, 50, 3, NULL, '2019-04-30', 'BILLING', 'PRINTONIX P8000/P7000 CARTRIDGE RIBBON'),
	(255, 4, 129, 1, NULL, '2019-05-31', 'BILLING', 'EXERCISE BOOK 120PAGES'),
	(256, 4, 13, 2, NULL, '2019-05-31', 'BILLING', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(257, 4, 43, 2, NULL, '2019-05-31', 'BILLING', 'PRINTONIX P7000 ULTRA CAPACITY PRINTER RIBBON'),
	(258, 4, 50, 2, NULL, '2019-05-31', 'BILLING', 'PRINTONIX P8000/P7000 CARTRIDGE RIBBON'),
	(262, 4, 29, 1, NULL, '2019-06-30', 'BILLING', 'STAMPAD INK-BLUE'),
	(263, 4, 1, 7, NULL, '2019-07-31', 'BILLING', 'L-FOLDER A4 TRANSPARENTS'),
	(264, 4, 22, 1, NULL, '2019-07-31', 'BILLING', 'PERMANENT MARKER-RED'),
	(265, 4, 43, 3, NULL, '2019-07-31', 'BILLING', 'PRINTONIX P7000 ULTRA CAPACITY PRINTER RIBBON'),
	(266, 4, 4, 1, NULL, '2019-08-31', 'BILLING', 'ENVELOPE BROWN-HALF'),
	(267, 4, 43, 2, NULL, '2019-08-31', 'BILLING', 'PRINTONIX P7000 ULTRA CAPACITY PRINTER RIBBON'),
	(268, 4, 47, 1, NULL, '2019-08-31', 'BILLING', 'EPSON RIBBON CARTRIDGE-S015531/S015086'),
	(269, 4, 50, 3, NULL, '2019-08-31', 'BILLING', 'PRINTONIX P8000/P7000 CARTRIDGE RIBBON'),
	(273, 4, 29, 2, NULL, '2019-09-30', 'BILLING', 'STAMPAD INK-BLUE'),
	(274, 4, 30, 1, NULL, '2019-09-30', 'BILLING', 'STAMPAD INK-BLACK'),
	(275, 4, 50, 4, NULL, '2019-09-30', 'BILLING', 'PRINTONIX P8000/P7000 CARTRIDGE RIBBON'),
	(276, 4, 30, 1, NULL, '2019-10-31', 'BILLING', 'STAMPAD INK-BLACK'),
	(277, 4, 43, 2, NULL, '2019-10-31', 'BILLING', 'PRINTONIX P7000 ULTRA CAPACITY PRINTER RIBBON'),
	(279, 4, 43, 2, NULL, '2019-11-30', 'BILLING', 'PRINTONIX P7000 ULTRA CAPACITY PRINTER RIBBON'),
	(280, 4, 47, 1, NULL, '2019-11-30', 'BILLING', 'EPSON RIBBON CARTRIDGE-S015531/S015086'),
	(281, 4, 50, 4, NULL, '2019-11-30', 'BILLING', 'PRINTONIX P8000/P7000 CARTRIDGE RIBBON'),
	(282, 4, 7, 1, NULL, '2019-12-31', 'BILLING', 'ENVELOPE A4'),
	(283, 4, 43, 1, NULL, '2019-12-31', 'BILLING', 'PRINTONIX P7000 ULTRA CAPACITY PRINTER RIBBON'),
	(284, 4, 49, 1, NULL, '2019-12-31', 'BILLING', 'BROTHER TN-2150'),
	(285, 5, 1, 4, NULL, '2019-01-31', 'CREDIT CONTROL', 'L-FOLDER A4 TRANSPARENTS'),
	(286, 5, 1, 24, NULL, '2019-02-28', 'CREDIT CONTROL', 'L-FOLDER A4 TRANSPARENTS'),
	(287, 5, 7, 21, NULL, '2019-02-28', 'CREDIT CONTROL', 'ENVELOPE A4'),
	(289, 5, 1, 5, NULL, '2019-03-31', 'CREDIT CONTROL', 'L-FOLDER A4 TRANSPARENTS'),
	(290, 5, 5, 20, NULL, '2019-03-31', 'CREDIT CONTROL', 'ENVELOPE WHITE-WINDOW'),
	(291, 5, 7, 1, NULL, '2019-03-31', 'CREDIT CONTROL', 'ENVELOPE A4'),
	(292, 5, 14, 2, NULL, '2019-03-31', 'CREDIT CONTROL', 'JUMBO GEM/ASTAR CLIPS(BIG)'),
	(293, 5, 32, 1, NULL, '2019-03-31', 'CREDIT CONTROL', 'STAMPAD-BLUE'),
	(296, 5, 129, 1, NULL, '2019-04-30', 'CREDIT CONTROL', 'EXERCISE BOOK 120PAGES'),
	(297, 5, 5, 20, NULL, '2019-04-30', 'CREDIT CONTROL', 'ENVELOPE WHITE-WINDOW'),
	(298, 5, 7, 20, NULL, '2019-04-30', 'CREDIT CONTROL', 'ENVELOPE A4'),
	(299, 5, 15, 4, NULL, '2019-05-31', 'CREDIT CONTROL', 'DOUBLE CLIP-19MM'),
	(300, 5, 3, 18, NULL, '2019-06-30', 'CREDIT CONTROL', 'L-FOLDER COLOURFUL'),
	(301, 5, 15, 2, NULL, '2019-06-30', 'CREDIT CONTROL', 'DOUBLE CLIP-19MM'),
	(303, 5, 30, 1, NULL, '2019-07-31', 'CREDIT CONTROL', 'STAMPAD INK-BLACK'),
	(304, 5, 2, 20, NULL, '2019-08-31', 'CREDIT CONTROL', 'U-FOLDER A4 TRANSPARENTS'),
	(305, 5, 7, 10, NULL, '2019-09-30', 'CREDIT CONTROL', 'ENVELOPE A4'),
	(306, 5, 7, 10, NULL, '2019-10-31', 'CREDIT CONTROL', 'ENVELOPE A4'),
	(307, 5, 1, 20, NULL, '2019-11-30', 'CREDIT CONTROL', 'L-FOLDER A4 TRANSPARENTS'),
	(308, 5, 2, 20, NULL, '2019-11-30', 'CREDIT CONTROL', 'U-FOLDER A4 TRANSPARENTS'),
	(309, 5, 9, 2, NULL, '2019-11-30', 'CREDIT CONTROL', 'INDEX DIVIDER-NUMBER'),
	(310, 5, 5, 50, NULL, '2019-12-31', 'CREDIT CONTROL', 'ENVELOPE WHITE-WINDOW'),
	(311, 5, 7, 20, NULL, '2019-12-31', 'CREDIT CONTROL', 'ENVELOPE A4'),
	(312, 5, 13, 2, NULL, '2019-12-31', 'CREDIT CONTROL', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(313, 5, 15, 4, NULL, '2019-12-31', 'CREDIT CONTROL', 'DOUBLE CLIP-19MM'),
	(317, 6, 1, 15, NULL, '2019-02-01', 'JUA NIKMAT', 'L-FOLDER A4 TRANSPARENTS'),
	(318, 6, 51, 10, NULL, '2019-02-01', 'JUA NIKMAT', 'EXERCISE BOOK 76PAGES'),
	(319, 6, 13, 1, NULL, '2019-02-01', 'JUA NIKMAT', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(320, 6, 29, 2, NULL, '2019-02-01', 'JUA NIKMAT', 'STAMPAD INK-BLUE'),
	(324, 6, 20, 5, NULL, '2019-03-01', 'JUA NIKMAT', 'PERMANENT MARKER-BLUE'),
	(325, 6, 21, 5, NULL, '2019-03-01', 'JUA NIKMAT', 'PERMANENT MARKER-BLACK'),
	(326, 6, 29, 1, NULL, '2019-03-01', 'JUA NIKMAT', 'STAMPAD INK-BLUE'),
	(327, 6, 32, 1, NULL, '2019-03-01', 'JUA NIKMAT', 'STAMPAD-BLUE'),
	(331, 6, 20, 12, NULL, '2019-10-01', 'JUA NIKMAT', 'PERMANENT MARKER-BLUE'),
	(332, 6, 21, 12, NULL, '2019-10-01', 'JUA NIKMAT', 'PERMANENT MARKER-BLACK'),
	(334, 20, 52, 2, NULL, '2019-02-01', 'STORE', 'EXERCISE BOOK 116PAGES'),
	(335, 20, 20, 12, NULL, '2019-02-01', 'STORE', 'PERMANENT MARKER-BLUE'),
	(337, 20, 4, 1, NULL, '2019-03-01', 'STORE', 'ENVELOPE BROWN-HALF'),
	(338, 20, 20, 1, NULL, '2019-03-01', 'STORE', 'PERMANENT MARKER-BLUE'),
	(339, 20, 21, 1, NULL, '2019-03-01', 'STORE', 'PERMANENT MARKER-BLACK'),
	(340, 8, 52, 2, NULL, '2019-01-01', 'FEEDMIL', 'EXERCISE BOOK 116PAGES'),
	(341, 8, 20, 2, NULL, '2019-01-01', 'FEEDMIL', 'PERMANENT MARKER-BLUE'),
	(342, 8, 21, 1, NULL, '2019-01-01', 'FEEDMIL', 'PERMANENT MARKER-BLACK'),
	(343, 8, 32, 1, NULL, '2019-01-01', 'FEEDMIL', 'STAMPAD-BLUE'),
	(347, 8, 13, 2, NULL, '2019-02-01', 'FEEDMIL', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(348, 8, 17, 1, NULL, '2019-02-01', 'FEEDMIL', 'DOUBLE CLIP-32MM'),
	(349, 8, 20, 1, NULL, '2019-02-01', 'FEEDMIL', 'PERMANENT MARKER-BLUE'),
	(350, 8, 21, 1, NULL, '2019-02-01', 'FEEDMIL', 'PERMANENT MARKER-BLACK'),
	(354, 8, 14, 1, NULL, '2019-03-01', 'FEEDMIL', 'JUMBO GEM/ASTAR CLIPS(BIG)'),
	(355, 8, 17, 1, NULL, '2019-03-01', 'FEEDMIL', 'DOUBLE CLIP-32MM'),
	(357, 8, 7, 15, NULL, '2019-04-01', 'FEEDMIL', 'ENVELOPE A4'),
	(358, 8, 20, 21, NULL, '2019-05-01', 'FEEDMIL', 'PERMANENT MARKER-BLUE'),
	(359, 8, 21, 1, NULL, '2019-05-01', 'FEEDMIL', 'PERMANENT MARKER-BLACK'),
	(360, 8, 22, 3, NULL, '2019-05-01', 'FEEDMIL', 'PERMANENT MARKER-RED'),
	(361, 8, 26, 2, NULL, '2019-05-01', 'FEEDMIL', 'WHITEBOARD MARKER-BLUE'),
	(362, 8, 27, 1, NULL, '2019-05-01', 'FEEDMIL', 'WHITEBOARD MARKER-BLACK'),
	(365, 8, 9, 3, NULL, '2019-06-01', 'FEEDMIL', 'INDEX DIVIDER-NUMBER'),
	(366, 8, 12, 2, NULL, '2019-07-01', 'FEEDMIL', 'WHITE STIKER'),
	(367, 8, 20, 22, NULL, '2019-08-01', 'FEEDMIL', 'PERMANENT MARKER-BLUE'),
	(368, 8, 21, 24, NULL, '2019-08-01', 'FEEDMIL', 'PERMANENT MARKER-BLACK'),
	(369, 8, 22, 5, NULL, '2019-08-01', 'FEEDMIL', 'PERMANENT MARKER-RED'),
	(370, 8, 27, 1, NULL, '2019-08-01', 'FEEDMIL', 'WHITEBOARD MARKER-BLACK'),
	(371, 8, 29, 1, NULL, '2019-08-01', 'FEEDMIL', 'STAMPAD INK-BLUE'),
	(374, 8, 14, 1, NULL, '2019-09-01', 'FEEDMIL', 'JUMBO GEM/ASTAR CLIPS(BIG)'),
	(375, 8, 15, 1, NULL, '2019-09-01', 'FEEDMIL', 'DOUBLE CLIP-19MM'),
	(376, 8, 16, 1, NULL, '2019-09-01', 'FEEDMIL', 'DOUBLE CLIP-25MM'),
	(377, 8, 17, 2, NULL, '2019-09-01', 'FEEDMIL', 'DOUBLE CLIP-32MM'),
	(378, 8, 20, 12, NULL, '2019-09-01', 'FEEDMIL', 'PERMANENT MARKER-BLUE'),
	(379, 8, 32, 1, NULL, '2019-09-01', 'FEEDMIL', 'STAMPAD-BLUE'),
	(380, 8, 131, 1, NULL, '2019-09-01', 'FEEDMIL', 'LASERJET TONER CATRIDGE (CC 388A)'),
	(381, 8, 20, 16, NULL, '2019-10-01', 'FEEDMIL', 'PERMANENT MARKER-BLUE'),
	(382, 8, 21, 1, NULL, '2019-10-01', 'FEEDMIL', 'PERMANENT MARKER-BLACK'),
	(383, 8, 22, 1, NULL, '2019-10-01', 'FEEDMIL', 'PERMANENT MARKER-RED'),
	(384, 8, 20, 8, NULL, '2019-12-01', 'FEEDMIL', 'PERMANENT MARKER-BLUE'),
	(385, 8, 21, 1, NULL, '2019-12-01', 'FEEDMIL', 'PERMANENT MARKER-BLACK'),
	(386, 8, 22, 5, NULL, '2019-12-01', 'FEEDMIL', 'PERMANENT MARKER-RED'),
	(387, 8, 28, 2, NULL, '2019-12-01', 'FEEDMIL', 'WHITEBOARD MARKER-RED'),
	(391, 9, 52, 1, NULL, '2019-01-01', 'INVENTORY', 'EXERCISE BOOK 116PAGES'),
	(392, 9, 128, 2, NULL, '2019-05-01', 'INVENTORY', 'EXERCISE BOOK 80PAGES'),
	(393, 9, 129, 1, NULL, '2019-06-01', 'INVENTORY', 'EXERCISE BOOK 120PAGES'),
	(394, 9, 44, 1, NULL, '2019-11-01', 'INVENTORY', 'AMANO CE-315250 TWO COLOUR'),
	(395, 10, 52, 7, NULL, '2019-01-01', 'FARM', 'EXERCISE BOOK 116PAGES'),
	(396, 10, 20, 5, NULL, '2019-01-01', 'FARM', 'PERMANENT MARKER-BLUE'),
	(397, 10, 21, 7, NULL, '2019-01-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(398, 10, 22, 3, NULL, '2019-01-01', 'FARM', 'PERMANENT MARKER-RED'),
	(399, 10, 26, 1, NULL, '2019-01-01', 'FARM', 'WHITEBOARD MARKER-BLUE'),
	(400, 10, 27, 3, NULL, '2019-01-01', 'FARM', 'WHITEBOARD MARKER-BLACK'),
	(401, 10, 28, 3, NULL, '2019-01-01', 'FARM', 'WHITEBOARD MARKER-RED'),
	(402, 10, 32, 1, NULL, '2019-01-01', 'FARM', 'STAMPAD-BLUE'),
	(403, 10, 41, 2, NULL, '2019-01-01', 'FARM', 'HP OFFICEJET 901 BLACK'),
	(404, 10, 70, 1, NULL, '2019-01-01', 'FARM', 'HP LASERJET 125A (CB543A) MAGENTA'),
	(410, 10, 128, 3, NULL, '2019-04-01', 'FARM', 'EXERCISE BOOK 80PAGES'),
	(411, 10, 129, 8, NULL, '2019-04-01', 'FARM', 'EXERCISE BOOK 120PAGES'),
	(412, 10, 20, 5, NULL, '2019-04-01', 'FARM', 'PERMANENT MARKER-BLUE'),
	(413, 10, 21, 7, NULL, '2019-04-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(414, 10, 22, 3, NULL, '2019-04-01', 'FARM', 'PERMANENT MARKER-RED'),
	(415, 10, 29, 1, NULL, '2019-04-01', 'FARM', 'STAMPAD INK-BLUE'),
	(416, 10, 32, 1, NULL, '2019-04-01', 'FARM', 'STAMPAD-BLUE'),
	(417, 10, 3, 3, NULL, '2019-05-01', 'FARM', 'L-FOLDER COLOURFUL'),
	(418, 10, 128, 5, NULL, '2019-05-01', 'FARM', 'EXERCISE BOOK 80PAGES'),
	(419, 10, 21, 1, NULL, '2019-05-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(420, 10, 29, 1, NULL, '2019-05-01', 'FARM', 'STAMPAD INK-BLUE'),
	(424, 10, 1, 1, NULL, '2019-06-01', 'FARM', 'L-FOLDER A4 TRANSPARENTS'),
	(425, 10, 2, 10, NULL, '2019-06-01', 'FARM', 'U-FOLDER A4 TRANSPARENTS'),
	(426, 10, 128, 3, NULL, '2019-06-01', 'FARM', 'EXERCISE BOOK 80PAGES'),
	(427, 10, 16, 12, NULL, '2019-06-01', 'FARM', 'DOUBLE CLIP-25MM'),
	(428, 10, 20, 12, NULL, '2019-06-01', 'FARM', 'PERMANENT MARKER-BLUE'),
	(429, 10, 21, 12, NULL, '2019-06-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(430, 10, 132, 1, NULL, '2019-06-01', 'FARM', 'HP LASERJET 125A BLACK'),
	(431, 10, 133, 1, NULL, '2019-06-01', 'FARM', 'HP LASERJET 125A MAGENTA'),
	(432, 10, 134, 1, NULL, '2019-06-01', 'FARM', 'HP LASERJET 125A CYAN'),
	(433, 10, 41, 2, NULL, '2019-06-01', 'FARM', 'HP OFFICEJET 901 BLACK'),
	(439, 10, 2, 20, NULL, '2019-07-01', 'FARM', 'U-FOLDER A4 TRANSPARENTS'),
	(440, 10, 3, 5, NULL, '2019-07-01', 'FARM', 'L-FOLDER COLOURFUL'),
	(441, 10, 128, 2, NULL, '2019-07-01', 'FARM', 'EXERCISE BOOK 80PAGES'),
	(442, 10, 7, 1, NULL, '2019-07-01', 'FARM', 'ENVELOPE A4'),
	(443, 10, 18, 1, NULL, '2019-07-01', 'FARM', 'DOUBLE CLIP-41MM'),
	(444, 10, 21, 1, NULL, '2019-07-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(446, 10, 2, 2, NULL, '2019-08-01', 'FARM', 'U-FOLDER A4 TRANSPARENTS'),
	(447, 10, 128, 1, NULL, '2019-08-01', 'FARM', 'EXERCISE BOOK 80PAGES'),
	(448, 10, 20, 6, NULL, '2019-08-01', 'FARM', 'PERMANENT MARKER-BLUE'),
	(449, 10, 26, 1, NULL, '2019-08-01', 'FARM', 'WHITEBOARD MARKER-BLUE'),
	(450, 10, 27, 1, NULL, '2019-08-01', 'FARM', 'WHITEBOARD MARKER-BLACK'),
	(451, 10, 28, 1, NULL, '2019-08-01', 'FARM', 'WHITEBOARD MARKER-RED'),
	(452, 10, 29, 2, NULL, '2019-08-01', 'FARM', 'STAMPAD INK-BLUE'),
	(453, 10, 1, 1, NULL, '2019-09-01', 'FARM', 'L-FOLDER A4 TRANSPARENTS'),
	(454, 10, 129, 3, NULL, '2019-09-01', 'FARM', 'EXERCISE BOOK 120PAGES'),
	(455, 10, 130, 5, NULL, '2019-09-01', 'FARM', 'COLOURFUL PAPER-BLUE'),
	(456, 10, 18, 1, NULL, '2019-09-01', 'FARM', 'DOUBLE CLIP-41MM'),
	(460, 10, 1, 10, NULL, '2019-10-01', 'FARM', 'L-FOLDER A4 TRANSPARENTS'),
	(461, 10, 2, 6, NULL, '2019-10-01', 'FARM', 'U-FOLDER A4 TRANSPARENTS'),
	(462, 10, 3, 7, NULL, '2019-10-01', 'FARM', 'L-FOLDER COLOURFUL'),
	(463, 10, 128, 6, NULL, '2019-10-01', 'FARM', 'EXERCISE BOOK 80PAGES'),
	(464, 10, 129, 6, NULL, '2019-10-01', 'FARM', 'EXERCISE BOOK 120PAGES'),
	(465, 10, 4, 6, NULL, '2019-10-01', 'FARM', 'ENVELOPE BROWN-HALF'),
	(466, 10, 5, 6, NULL, '2019-10-01', 'FARM', 'ENVELOPE WHITE-WINDOW'),
	(467, 10, 7, 6, NULL, '2019-10-01', 'FARM', 'ENVELOPE A4'),
	(468, 10, 9, 1, NULL, '2019-10-01', 'FARM', 'INDEX DIVIDER-NUMBER'),
	(469, 10, 15, 5, NULL, '2019-10-01', 'FARM', 'DOUBLE CLIP-19MM'),
	(470, 10, 21, 2, NULL, '2019-10-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(475, 10, 2, 10, NULL, '2019-11-01', 'FARM', 'U-FOLDER A4 TRANSPARENTS'),
	(476, 10, 19, 1, NULL, '2019-11-01', 'FARM', 'DOUBLE CLIP-51MM'),
	(477, 10, 20, 1, NULL, '2019-11-01', 'FARM', 'PERMANENT MARKER-BLUE'),
	(478, 10, 22, 1, NULL, '2019-11-01', 'FARM', 'PERMANENT MARKER-RED'),
	(479, 10, 26, 1, NULL, '2019-11-01', 'FARM', 'WHITEBOARD MARKER-BLUE'),
	(480, 10, 28, 1, NULL, '2019-11-01', 'FARM', 'WHITEBOARD MARKER-RED'),
	(482, 10, 1, 20, NULL, '2019-12-01', 'FARM', 'L-FOLDER A4 TRANSPARENTS'),
	(483, 10, 129, 1, NULL, '2019-12-01', 'FARM', 'EXERCISE BOOK 120PAGES'),
	(484, 10, 14, 1, NULL, '2019-12-01', 'FARM', 'JUMBO GEM/ASTAR CLIPS(BIG)'),
	(485, 10, 21, 12, NULL, '2019-12-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(486, 10, 28, 5, NULL, '2019-12-01', 'FARM', 'WHITEBOARD MARKER-RED'),
	(489, 10, 1, 1, NULL, '2019-01-01', 'FARM', 'L-FOLDER A4 TRANSPARENTS'),
	(490, 10, 11, 13, NULL, '2019-01-01', 'FARM', 'COLOURFUL PAPER-PINK'),
	(491, 10, 20, 16, NULL, '2019-01-01', 'FARM', 'PERMANENT MARKER-BLUE'),
	(492, 10, 21, 11, NULL, '2019-01-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(493, 10, 22, 8, NULL, '2019-01-01', 'FARM', 'PERMANENT MARKER-RED'),
	(494, 10, 27, 3, NULL, '2019-01-01', 'FARM', 'WHITEBOARD MARKER-BLACK'),
	(495, 10, 44, 1, NULL, '2019-01-01', 'FARM', 'AMANO CE-315250 TWO COLOUR'),
	(496, 10, 1, 1, NULL, '2019-02-01', 'FARM', 'L-FOLDER A4 TRANSPARENTS'),
	(497, 10, 3, 5, NULL, '2019-02-01', 'FARM', 'L-FOLDER COLOURFUL'),
	(498, 10, 52, 7, NULL, '2019-02-01', 'FARM', 'EXERCISE BOOK 116PAGES'),
	(499, 10, 17, 1, NULL, '2019-02-01', 'FARM', 'DOUBLE CLIP-32MM'),
	(500, 10, 20, 14, NULL, '2019-02-01', 'FARM', 'PERMANENT MARKER-BLUE'),
	(501, 10, 21, 4, NULL, '2019-02-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(502, 10, 22, 6, NULL, '2019-02-01', 'FARM', 'PERMANENT MARKER-RED'),
	(503, 10, 26, 1, NULL, '2019-02-01', 'FARM', 'WHITEBOARD MARKER-BLUE'),
	(511, 10, 52, 1, NULL, '2019-03-01', 'FARM', 'EXERCISE BOOK 116PAGES'),
	(512, 10, 11, 12, NULL, '2019-03-01', 'FARM', 'COLOURFUL PAPER-PINK'),
	(513, 10, 17, 1, NULL, '2019-03-01', 'FARM', 'DOUBLE CLIP-32MM'),
	(514, 10, 20, 1, NULL, '2019-03-01', 'FARM', 'PERMANENT MARKER-BLUE'),
	(515, 10, 21, 4, NULL, '2019-03-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(518, 10, 1, 3, NULL, '2019-04-01', 'FARM', 'L-FOLDER A4 TRANSPARENTS'),
	(519, 10, 7, 1, NULL, '2019-04-01', 'FARM', 'ENVELOPE A4'),
	(520, 10, 10, 20, NULL, '2019-04-01', 'FARM', 'COLOURFUL PAPER-GREEN'),
	(521, 10, 26, 1, NULL, '2019-04-01', 'FARM', 'WHITEBOARD MARKER-BLUE'),
	(522, 10, 27, 1, NULL, '2019-04-01', 'FARM', 'WHITEBOARD MARKER-BLACK'),
	(523, 10, 28, 1, NULL, '2019-04-01', 'FARM', 'WHITEBOARD MARKER-RED'),
	(525, 10, 1, 1, NULL, '2019-05-01', 'FARM', 'L-FOLDER A4 TRANSPARENTS'),
	(526, 10, 128, 1, NULL, '2019-05-01', 'FARM', 'EXERCISE BOOK 80PAGES'),
	(527, 10, 129, 10, NULL, '2019-05-01', 'FARM', 'EXERCISE BOOK 120PAGES'),
	(528, 10, 19, 12, NULL, '2019-05-01', 'FARM', 'DOUBLE CLIP-51MM'),
	(529, 10, 21, 9, NULL, '2019-05-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(530, 10, 22, 4, NULL, '2019-05-01', 'FARM', 'PERMANENT MARKER-RED'),
	(531, 10, 44, 1, NULL, '2019-05-01', 'FARM', 'AMANO CE-315250 TWO COLOUR'),
	(532, 10, 1, 1, NULL, '2019-06-01', 'FARM', 'L-FOLDER A4 TRANSPARENTS'),
	(533, 10, 128, 1, NULL, '2019-06-01', 'FARM', 'EXERCISE BOOK 80PAGES'),
	(534, 10, 129, 2, NULL, '2019-06-01', 'FARM', 'EXERCISE BOOK 120PAGES'),
	(535, 10, 11, 60, NULL, '2019-06-01', 'FARM', 'COLOURFUL PAPER-PINK'),
	(536, 10, 17, 1, NULL, '2019-06-01', 'FARM', 'DOUBLE CLIP-32MM'),
	(537, 10, 20, 4, NULL, '2019-06-01', 'FARM', 'PERMANENT MARKER-BLUE'),
	(538, 10, 21, 6, NULL, '2019-06-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(539, 10, 22, 5, NULL, '2019-06-01', 'FARM', 'PERMANENT MARKER-RED'),
	(540, 10, 23, 3, NULL, '2019-06-01', 'FARM', 'MULTIPURPOSE MARKER-BLUE'),
	(547, 10, 3, 6, NULL, '2019-07-01', 'FARM', 'L-FOLDER COLOURFUL'),
	(548, 10, 129, 4, NULL, '2019-07-01', 'FARM', 'EXERCISE BOOK 120PAGES'),
	(549, 10, 13, 1, NULL, '2019-07-01', 'FARM', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(550, 10, 20, 6, NULL, '2019-07-01', 'FARM', 'PERMANENT MARKER-BLUE'),
	(551, 10, 21, 6, NULL, '2019-07-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(552, 10, 22, 4, NULL, '2019-07-01', 'FARM', 'PERMANENT MARKER-RED'),
	(554, 10, 3, 5, NULL, '2019-08-01', 'FARM', 'L-FOLDER COLOURFUL'),
	(555, 10, 128, 3, NULL, '2019-08-01', 'FARM', 'EXERCISE BOOK 80PAGES'),
	(556, 10, 129, 1, NULL, '2019-08-01', 'FARM', 'EXERCISE BOOK 120PAGES'),
	(557, 10, 20, 5, NULL, '2019-08-01', 'FARM', 'PERMANENT MARKER-BLUE'),
	(558, 10, 21, 4, NULL, '2019-08-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(559, 10, 22, 4, NULL, '2019-08-01', 'FARM', 'PERMANENT MARKER-RED'),
	(560, 10, 44, 1, NULL, '2019-08-01', 'FARM', 'AMANO CE-315250 TWO COLOUR'),
	(561, 10, 1, 10, NULL, '2019-09-01', 'FARM', 'L-FOLDER A4 TRANSPARENTS'),
	(562, 10, 128, 2, NULL, '2019-09-01', 'FARM', 'EXERCISE BOOK 80PAGES'),
	(563, 10, 129, 4, NULL, '2019-09-01', 'FARM', 'EXERCISE BOOK 120PAGES'),
	(564, 10, 7, 1, NULL, '2019-09-01', 'FARM', 'ENVELOPE A4'),
	(565, 10, 17, 1, NULL, '2019-09-01', 'FARM', 'DOUBLE CLIP-32MM'),
	(566, 10, 20, 6, NULL, '2019-09-01', 'FARM', 'PERMANENT MARKER-BLUE'),
	(567, 10, 21, 9, NULL, '2019-09-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(568, 10, 22, 5, NULL, '2019-09-01', 'FARM', 'PERMANENT MARKER-RED'),
	(576, 10, 2, 2, NULL, '2019-10-01', 'FARM', 'U-FOLDER A4 TRANSPARENTS'),
	(577, 10, 128, 2, NULL, '2019-10-01', 'FARM', 'EXERCISE BOOK 80PAGES'),
	(578, 10, 129, 3, NULL, '2019-10-01', 'FARM', 'EXERCISE BOOK 120PAGES'),
	(579, 10, 20, 11, NULL, '2019-10-01', 'FARM', 'PERMANENT MARKER-BLUE'),
	(580, 10, 21, 6, NULL, '2019-10-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(581, 10, 22, 5, NULL, '2019-10-01', 'FARM', 'PERMANENT MARKER-RED'),
	(582, 10, 35, 1, NULL, '2019-10-01', 'FARM', 'PAPER PUNCH'),
	(583, 10, 135, 1, NULL, '2019-10-01', 'FARM', 'HP LASERJET 53 BLACK'),
	(591, 10, 1, 2, NULL, '2019-11-01', 'FARM', 'L-FOLDER A4 TRANSPARENTS'),
	(592, 10, 2, 3, NULL, '2019-11-01', 'FARM', 'U-FOLDER A4 TRANSPARENTS'),
	(593, 10, 128, 1, NULL, '2019-11-01', 'FARM', 'EXERCISE BOOK 80PAGES'),
	(594, 10, 129, 6, NULL, '2019-11-01', 'FARM', 'EXERCISE BOOK 120PAGES'),
	(595, 10, 7, 2, NULL, '2019-11-01', 'FARM', 'ENVELOPE A4'),
	(596, 10, 20, 10, NULL, '2019-11-01', 'FARM', 'PERMANENT MARKER-BLUE'),
	(597, 10, 21, 4, NULL, '2019-11-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(598, 10, 22, 4, NULL, '2019-11-01', 'FARM', 'PERMANENT MARKER-RED'),
	(599, 10, 44, 1, NULL, '2019-11-01', 'FARM', 'AMANO CE-315250 TWO COLOUR'),
	(606, 10, 128, 3, NULL, '2019-12-01', 'FARM', 'EXERCISE BOOK 80PAGES'),
	(607, 10, 129, 7, NULL, '2019-12-01', 'FARM', 'EXERCISE BOOK 120PAGES'),
	(608, 10, 6, 1, NULL, '2019-12-01', 'FARM', 'ENVELOPE A3'),
	(609, 10, 7, 3, NULL, '2019-12-01', 'FARM', 'ENVELOPE A4'),
	(610, 10, 20, 10, NULL, '2019-12-01', 'FARM', 'PERMANENT MARKER-BLUE'),
	(611, 10, 21, 9, NULL, '2019-12-01', 'FARM', 'PERMANENT MARKER-BLACK'),
	(612, 10, 22, 7, NULL, '2019-12-01', 'FARM', 'PERMANENT MARKER-RED'),
	(613, 10, 35, 1, NULL, '2019-12-01', 'FARM', 'PAPER PUNCH'),
	(621, 12, 3, 13, NULL, '2019-01-01', 'HR', 'L-FOLDER COLOURFUL'),
	(622, 12, 3, 5, NULL, '2019-02-01', 'HR', 'L-FOLDER COLOURFUL'),
	(623, 12, 12, 20, NULL, '2019-02-01', 'HR', 'WHITE STIKER'),
	(624, 12, 13, 1, NULL, '2019-02-01', 'HR', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(625, 12, 14, 1, NULL, '2019-02-01', 'HR', 'JUMBO GEM/ASTAR CLIPS(BIG)'),
	(626, 12, 18, 1, NULL, '2019-02-01', 'HR', 'DOUBLE CLIP-41MM'),
	(629, 12, 1, 5, NULL, '2019-03-01', 'HR', 'L-FOLDER A4 TRANSPARENTS'),
	(630, 12, 3, 6, NULL, '2019-03-01', 'HR', 'L-FOLDER COLOURFUL'),
	(632, 12, 128, 1, NULL, '2019-05-01', 'HR', 'EXERCISE BOOK 80PAGES'),
	(633, 12, 7, 3, NULL, '2019-05-01', 'HR', 'ENVELOPE A4'),
	(635, 12, 13, 1, NULL, '2019-06-01', 'HR', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(636, 12, 1, 5, NULL, '2019-07-01', 'HR', 'L-FOLDER A4 TRANSPARENTS'),
	(637, 12, 7, 3, NULL, '2019-07-01', 'HR', 'ENVELOPE A4'),
	(638, 12, 16, 2, NULL, '2019-07-01', 'HR', 'DOUBLE CLIP-25MM'),
	(639, 12, 17, 2, NULL, '2019-07-01', 'HR', 'DOUBLE CLIP-32MM'),
	(643, 12, 2, 5, NULL, '2019-08-01', 'HR', 'U-FOLDER A4 TRANSPARENTS'),
	(644, 12, 1, 11, NULL, '2019-09-01', 'HR', 'L-FOLDER A4 TRANSPARENTS'),
	(645, 12, 7, 8, NULL, '2019-09-01', 'HR', 'ENVELOPE A4'),
	(646, 12, 13, 4, NULL, '2019-09-01', 'HR', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(647, 12, 14, 3, NULL, '2019-09-01', 'HR', 'JUMBO GEM/ASTAR CLIPS(BIG)'),
	(648, 12, 15, 2, NULL, '2019-09-01', 'HR', 'DOUBLE CLIP-19MM'),
	(649, 12, 16, 2, NULL, '2019-09-01', 'HR', 'DOUBLE CLIP-25MM'),
	(650, 12, 17, 2, NULL, '2019-09-01', 'HR', 'DOUBLE CLIP-32MM'),
	(651, 12, 18, 7, NULL, '2019-12-01', 'HR', 'DOUBLE CLIP-41MM'),
	(652, 13, 1, 1, NULL, '2019-01-01', 'MARKETING', 'L-FOLDER A4 TRANSPARENTS'),
	(653, 13, 2, 2, NULL, '2019-01-01', 'MARKETING', 'U-FOLDER A4 TRANSPARENTS'),
	(654, 13, 52, 1, NULL, '2019-01-01', 'MARKETING', 'EXERCISE BOOK 116PAGES'),
	(655, 13, 20, 1, NULL, '2019-01-01', 'MARKETING', 'PERMANENT MARKER-BLUE'),
	(656, 13, 46, 1, NULL, '2019-01-01', 'MARKETING', 'EPSON RIBBON CARTRIDGE-S015586/S015336'),
	(659, 13, 2, 2, NULL, '2019-02-01', 'MARKETING', 'U-FOLDER A4 TRANSPARENTS'),
	(660, 13, 3, 2, NULL, '2019-02-01', 'MARKETING', 'L-FOLDER COLOURFUL'),
	(661, 13, 7, 3, NULL, '2019-02-01', 'MARKETING', 'ENVELOPE A4'),
	(662, 13, 14, 1, NULL, '2019-02-01', 'MARKETING', 'JUMBO GEM/ASTAR CLIPS(BIG)'),
	(663, 13, 15, 1, NULL, '2019-02-01', 'MARKETING', 'DOUBLE CLIP-19MM'),
	(664, 13, 18, 1, NULL, '2019-02-01', 'MARKETING', 'DOUBLE CLIP-41MM'),
	(665, 13, 19, 3, NULL, '2019-02-01', 'MARKETING', 'DOUBLE CLIP-51MM'),
	(666, 13, 21, 1, NULL, '2019-02-01', 'MARKETING', 'PERMANENT MARKER-BLACK'),
	(667, 13, 22, 1, NULL, '2019-02-01', 'MARKETING', 'PERMANENT MARKER-RED'),
	(674, 13, 3, 1, NULL, '2019-03-01', 'MARKETING', 'L-FOLDER COLOURFUL'),
	(675, 13, 7, 1, NULL, '2019-03-01', 'MARKETING', 'ENVELOPE A4'),
	(676, 13, 37, 1, NULL, '2019-03-01', 'MARKETING', 'HP LASERJET 126A (CE312A) YELLOW'),
	(677, 13, 38, 1, NULL, '2019-03-01', 'MARKETING', 'HP LASERJET 126A (CE311A) CYAN'),
	(678, 13, 39, 1, NULL, '2019-03-01', 'MARKETING', 'HP LASERJET 126A (CE313A) MAGENTA'),
	(679, 13, 50, 3, NULL, '2019-03-01', 'MARKETING', 'PRINTONIX P8000/P7000 CARTRIDGE RIBBON'),
	(681, 13, 7, 1, NULL, '2019-04-01', 'MARKETING', 'ENVELOPE A4'),
	(682, 13, 33, 1, NULL, '2019-04-01', 'MARKETING', 'STAMPAD-BLACK'),
	(683, 13, 46, 4, NULL, '2019-04-01', 'MARKETING', 'EPSON RIBBON CARTRIDGE-S015586/S015336'),
	(684, 13, 47, 2, NULL, '2019-04-01', 'MARKETING', 'EPSON RIBBON CARTRIDGE-S015531/S015086'),
	(688, 13, 1, 2, NULL, '2019-05-01', 'MARKETING', 'L-FOLDER A4 TRANSPARENTS'),
	(689, 13, 129, 1, NULL, '2019-05-01', 'MARKETING', 'EXERCISE BOOK 120PAGES'),
	(690, 13, 7, 2, NULL, '2019-05-01', 'MARKETING', 'ENVELOPE A4'),
	(691, 13, 26, 1, NULL, '2019-05-01', 'MARKETING', 'WHITEBOARD MARKER-BLUE'),
	(692, 13, 27, 1, NULL, '2019-05-01', 'MARKETING', 'WHITEBOARD MARKER-BLACK'),
	(693, 13, 47, 2, NULL, '2019-05-01', 'MARKETING', 'EPSON RIBBON CARTRIDGE-S015531/S015086'),
	(695, 13, 3, 4, NULL, '2019-06-01', 'MARKETING', 'L-FOLDER COLOURFUL'),
	(696, 13, 7, 7, NULL, '2019-06-01', 'MARKETING', 'ENVELOPE A4'),
	(697, 13, 46, 2, NULL, '2019-06-01', 'MARKETING', 'EPSON RIBBON CARTRIDGE-S015586/S015336'),
	(698, 13, 1, 7, NULL, '2019-07-01', 'MARKETING', 'L-FOLDER A4 TRANSPARENTS'),
	(699, 13, 3, 5, NULL, '2019-07-01', 'MARKETING', 'L-FOLDER COLOURFUL'),
	(700, 13, 7, 1, NULL, '2019-07-01', 'MARKETING', 'ENVELOPE A4'),
	(701, 13, 21, 1, NULL, '2019-07-01', 'MARKETING', 'PERMANENT MARKER-BLACK'),
	(702, 13, 43, 3, NULL, '2019-07-01', 'MARKETING', 'PRINTONIX P7000 ULTRA CAPACITY PRINTER RIBBON'),
	(703, 13, 47, 1, NULL, '2019-07-01', 'MARKETING', 'EPSON RIBBON CARTRIDGE-S015531/S015086'),
	(705, 13, 1, 5, NULL, '2019-08-01', 'MARKETING', 'L-FOLDER A4 TRANSPARENTS'),
	(706, 13, 7, 1, NULL, '2019-08-01', 'MARKETING', 'ENVELOPE A4'),
	(707, 13, 20, 2, NULL, '2019-08-01', 'MARKETING', 'PERMANENT MARKER-BLUE'),
	(708, 13, 21, 4, NULL, '2019-08-01', 'MARKETING', 'PERMANENT MARKER-BLACK'),
	(709, 13, 43, 2, NULL, '2019-08-01', 'MARKETING', 'PRINTONIX P7000 ULTRA CAPACITY PRINTER RIBBON'),
	(712, 13, 1, 2, NULL, '2019-09-01', 'MARKETING', 'L-FOLDER A4 TRANSPARENTS'),
	(713, 13, 4, 1, NULL, '2019-09-01', 'MARKETING', 'ENVELOPE BROWN-HALF'),
	(714, 13, 7, 5, NULL, '2019-09-01', 'MARKETING', 'ENVELOPE A4'),
	(715, 13, 36, 1, NULL, '2019-09-01', 'MARKETING', 'HP LASERJET 126A (CE310A) BLACK'),
	(716, 13, 37, 1, NULL, '2019-09-01', 'MARKETING', 'HP LASERJET 126A (CE312A) YELLOW'),
	(717, 13, 38, 1, NULL, '2019-09-01', 'MARKETING', 'HP LASERJET 126A (CE311A) CYAN'),
	(718, 13, 39, 1, NULL, '2019-09-01', 'MARKETING', 'HP LASERJET 126A (CE313A) MAGENTA'),
	(719, 13, 47, 1, NULL, '2019-09-01', 'MARKETING', 'EPSON RIBBON CARTRIDGE-S015531/S015086'),
	(720, 13, 50, 2, NULL, '2019-09-01', 'MARKETING', 'PRINTONIX P8000/P7000 CARTRIDGE RIBBON'),
	(721, 13, 136, 2, NULL, '2019-09-01', 'MARKETING', 'SEIKO PRECISION (FB60051)'),
	(727, 13, 1, 11, NULL, '2019-10-01', 'MARKETING', 'L-FOLDER A4 TRANSPARENTS'),
	(728, 13, 2, 1, NULL, '2019-10-01', 'MARKETING', 'U-FOLDER A4 TRANSPARENTS'),
	(729, 13, 7, 5, NULL, '2019-10-01', 'MARKETING', 'ENVELOPE A4'),
	(730, 13, 21, 1, NULL, '2019-10-01', 'MARKETING', 'PERMANENT MARKER-BLACK'),
	(731, 13, 43, 3, NULL, '2019-10-01', 'MARKETING', 'PRINTONIX P7000 ULTRA CAPACITY PRINTER RIBBON'),
	(732, 13, 136, 1, NULL, '2019-10-01', 'MARKETING', 'SEIKO PRECISION (FB60051)'),
	(734, 13, 1, 2, NULL, '2019-11-01', 'MARKETING', 'L-FOLDER A4 TRANSPARENTS'),
	(735, 13, 3, 2, NULL, '2019-11-01', 'MARKETING', 'L-FOLDER COLOURFUL'),
	(736, 13, 128, 1, NULL, '2019-11-01', 'MARKETING', 'EXERCISE BOOK 80PAGES'),
	(737, 13, 129, 2, NULL, '2019-11-01', 'MARKETING', 'EXERCISE BOOK 120PAGES'),
	(738, 13, 4, 2, NULL, '2019-11-01', 'MARKETING', 'ENVELOPE BROWN-HALF'),
	(739, 13, 7, 6, NULL, '2019-11-01', 'MARKETING', 'ENVELOPE A4'),
	(740, 13, 10, 4, NULL, '2019-11-01', 'MARKETING', 'COLOURFUL PAPER-GREEN'),
	(741, 13, 130, 4, NULL, '2019-11-01', 'MARKETING', 'COLOURFUL PAPER-BLUE'),
	(742, 13, 14, 1, NULL, '2019-11-01', 'MARKETING', 'JUMBO GEM/ASTAR CLIPS(BIG)'),
	(743, 13, 16, 1, NULL, '2019-11-01', 'MARKETING', 'DOUBLE CLIP-25MM'),
	(744, 13, 35, 1, NULL, '2019-11-01', 'MARKETING', 'PAPER PUNCH'),
	(745, 13, 46, 2, NULL, '2019-11-01', 'MARKETING', 'EPSON RIBBON CARTRIDGE-S015586/S015336'),
	(749, 13, 129, 2, NULL, '2019-12-01', 'MARKETING', 'EXERCISE BOOK 120PAGES'),
	(750, 13, 7, 6, NULL, '2019-12-01', 'MARKETING', 'ENVELOPE A4'),
	(751, 13, 15, 1, NULL, '2019-12-01', 'MARKETING', 'DOUBLE CLIP-19MM'),
	(752, 13, 50, 2, NULL, '2019-12-01', 'MARKETING', 'PRINTONIX P8000/P7000 CARTRIDGE RIBBON'),
	(756, 14, 3, 6, NULL, '2019-01-01', 'BROILER', 'L-FOLDER COLOURFUL'),
	(757, 14, 13, 1, NULL, '2019-01-01', 'BROILER', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(758, 14, 15, 1, NULL, '2019-01-01', 'BROILER', 'DOUBLE CLIP-19MM'),
	(759, 14, 16, 7, NULL, '2019-01-01', 'BROILER', 'DOUBLE CLIP-25MM'),
	(760, 14, 17, 1, NULL, '2019-01-01', 'BROILER', 'DOUBLE CLIP-32MM'),
	(761, 14, 18, 10, NULL, '2019-01-01', 'BROILER', 'DOUBLE CLIP-41MM'),
	(762, 14, 47, 3, NULL, '2019-01-01', 'BROILER', 'EPSON RIBBON CARTRIDGE-S015531/S015086'),
	(763, 14, 14, 1, NULL, '2019-04-01', 'BROILER', 'JUMBO GEM/ASTAR CLIPS(BIG)'),
	(764, 14, 16, 12, NULL, '2019-04-01', 'BROILER', 'DOUBLE CLIP-25MM'),
	(766, 14, 130, 40, NULL, '2019-05-01', 'BROILER', 'COLOURFUL PAPER-BLUE'),
	(767, 14, 11, 20, NULL, '2019-05-01', 'BROILER', 'COLOURFUL PAPER-PINK'),
	(768, 14, 15, 1, NULL, '2019-05-01', 'BROILER', 'DOUBLE CLIP-19MM'),
	(769, 14, 16, 1, NULL, '2019-05-01', 'BROILER', 'DOUBLE CLIP-25MM'),
	(770, 14, 17, 1, NULL, '2019-05-01', 'BROILER', 'DOUBLE CLIP-32MM'),
	(771, 14, 18, 1, NULL, '2019-05-01', 'BROILER', 'DOUBLE CLIP-41MM'),
	(772, 14, 19, 3, NULL, '2019-05-01', 'BROILER', 'DOUBLE CLIP-51MM'),
	(773, 14, 1, 1, NULL, '2019-06-01', 'BROILER', 'L-FOLDER A4 TRANSPARENTS'),
	(774, 14, 3, 1, NULL, '2019-06-01', 'BROILER', 'L-FOLDER COLOURFUL'),
	(776, 14, 48, 1, NULL, '2019-07-01', 'BROILER', 'DELL 113X'),
	(777, 14, 1, 1, NULL, '2019-09-01', 'BROILER', 'L-FOLDER A4 TRANSPARENTS'),
	(778, 14, 1, 1, NULL, '2019-10-01', 'BROILER', 'L-FOLDER A4 TRANSPARENTS'),
	(779, 15, 52, 1, NULL, '2019-01-01', 'COLLECTIONS', 'EXERCISE BOOK 116PAGES'),
	(780, 15, 5, 21, NULL, '2019-01-01', 'COLLECTIONS', 'ENVELOPE WHITE-WINDOW'),
	(781, 15, 14, 1, NULL, '2019-01-01', 'COLLECTIONS', 'JUMBO GEM/ASTAR CLIPS(BIG)'),
	(782, 15, 45, 2, NULL, '2019-01-01', 'COLLECTIONS', 'EPSON RIBBON CARTRIDGE-S015506/#7753'),
	(783, 15, 47, 2, NULL, '2019-01-01', 'COLLECTIONS', 'EPSON RIBBON CARTRIDGE-S015531/S015086'),
	(786, 15, 45, 2, NULL, '2019-02-01', 'COLLECTIONS', 'EPSON RIBBON CARTRIDGE-S015506/#7753'),
	(787, 15, 47, 2, NULL, '2019-02-01', 'COLLECTIONS', 'EPSON RIBBON CARTRIDGE-S015531/S015086'),
	(789, 15, 45, 3, NULL, '2019-04-01', 'COLLECTIONS', 'EPSON RIBBON CARTRIDGE-S015506/#7753'),
	(790, 15, 5, 40, NULL, '2019-05-01', 'COLLECTIONS', 'ENVELOPE WHITE-WINDOW'),
	(791, 15, 47, 3, NULL, '2019-05-01', 'COLLECTIONS', 'EPSON RIBBON CARTRIDGE-S015531/S015086'),
	(793, 15, 5, 30, NULL, '2019-06-01', 'COLLECTIONS', 'ENVELOPE WHITE-WINDOW'),
	(794, 15, 4, 4, NULL, '2019-07-01', 'COLLECTIONS', 'ENVELOPE BROWN-HALF'),
	(795, 15, 5, 20, NULL, '2019-07-01', 'COLLECTIONS', 'ENVELOPE WHITE-WINDOW'),
	(796, 15, 47, 3, NULL, '2019-07-01', 'COLLECTIONS', 'EPSON RIBBON CARTRIDGE-S015531/S015086'),
	(797, 15, 5, 40, NULL, '2019-08-01', 'COLLECTIONS', 'ENVELOPE WHITE-WINDOW'),
	(798, 15, 7, 20, NULL, '2019-09-01', 'COLLECTIONS', 'ENVELOPE A4'),
	(799, 15, 26, 1, NULL, '2019-09-01', 'COLLECTIONS', 'WHITEBOARD MARKER-BLUE'),
	(800, 15, 29, 1, NULL, '2019-09-01', 'COLLECTIONS', 'STAMPAD INK-BLUE'),
	(801, 15, 30, 1, NULL, '2019-09-01', 'COLLECTIONS', 'STAMPAD INK-BLACK'),
	(802, 15, 45, 4, NULL, '2019-09-01', 'COLLECTIONS', 'EPSON RIBBON CARTRIDGE-S015506/#7753'),
	(805, 15, 1, 5, NULL, '2019-10-01', 'COLLECTIONS', 'L-FOLDER A4 TRANSPARENTS'),
	(806, 15, 5, 30, NULL, '2019-10-01', 'COLLECTIONS', 'ENVELOPE WHITE-WINDOW'),
	(807, 15, 13, 3, NULL, '2019-10-01', 'COLLECTIONS', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(808, 15, 22, 2, NULL, '2019-10-01', 'COLLECTIONS', 'PERMANENT MARKER-RED'),
	(812, 15, 1, 3, NULL, '2019-11-01', 'COLLECTIONS', 'L-FOLDER A4 TRANSPARENTS'),
	(813, 15, 128, 1, NULL, '2019-11-01', 'COLLECTIONS', 'EXERCISE BOOK 80PAGES'),
	(814, 15, 28, 1, NULL, '2019-11-01', 'COLLECTIONS', 'WHITEBOARD MARKER-RED'),
	(815, 15, 47, 1, NULL, '2019-11-01', 'COLLECTIONS', 'EPSON RIBBON CARTRIDGE-S015531/S015086'),
	(819, 15, 28, 1, NULL, '2019-12-01', 'COLLECTIONS', 'WHITEBOARD MARKER-RED'),
	(820, 15, 47, 1, NULL, '2019-12-01', 'COLLECTIONS', 'EPSON RIBBON CARTRIDGE-S015531/S015086'),
	(822, 7, 52, 2, NULL, '2019-01-01', 'LOGISTIC', 'EXERCISE BOOK 116PAGES'),
	(823, 7, 2, 1, NULL, '2019-02-01', 'LOGISTIC', 'U-FOLDER A4 TRANSPARENTS'),
	(824, 7, 52, 2, NULL, '2019-02-01', 'LOGISTIC', 'EXERCISE BOOK 116PAGES'),
	(826, 7, 3, 6, NULL, '2019-03-01', 'LOGISTIC', 'L-FOLDER COLOURFUL'),
	(827, 7, 52, 1, NULL, '2019-03-01', 'LOGISTIC', 'EXERCISE BOOK 116PAGES'),
	(828, 7, 13, 2, NULL, '2019-03-01', 'LOGISTIC', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(829, 7, 1, 5, NULL, '2019-04-01', 'LOGISTIC', 'L-FOLDER A4 TRANSPARENTS'),
	(830, 7, 128, 1, NULL, '2019-04-01', 'LOGISTIC', 'EXERCISE BOOK 80PAGES'),
	(831, 7, 129, 1, NULL, '2019-04-01', 'LOGISTIC', 'EXERCISE BOOK 120PAGES'),
	(832, 7, 1, 1, NULL, '2019-05-01', 'LOGISTIC', 'L-FOLDER A4 TRANSPARENTS'),
	(833, 7, 3, 3, NULL, '2019-05-01', 'LOGISTIC', 'L-FOLDER COLOURFUL'),
	(834, 7, 128, 1, NULL, '2019-05-01', 'LOGISTIC', 'EXERCISE BOOK 80PAGES'),
	(835, 7, 20, 1, NULL, '2019-05-01', 'LOGISTIC', 'PERMANENT MARKER-BLUE'),
	(836, 7, 21, 4, NULL, '2019-05-01', 'LOGISTIC', 'PERMANENT MARKER-BLACK'),
	(837, 7, 47, 4, NULL, '2019-05-01', 'LOGISTIC', 'EPSON RIBBON CARTRIDGE-S015531/S015086'),
	(839, 7, 129, 2, NULL, '2019-06-01', 'LOGISTIC', 'EXERCISE BOOK 120PAGES'),
	(840, 7, 48, 1, NULL, '2019-06-01', 'LOGISTIC', 'DELL 113X'),
	(842, 7, 3, 6, NULL, '2019-07-01', 'LOGISTIC', 'L-FOLDER COLOURFUL'),
	(843, 7, 7, 2, NULL, '2019-07-01', 'LOGISTIC', 'ENVELOPE A4'),
	(845, 7, 129, 1, NULL, '2019-08-01', 'LOGISTIC', 'EXERCISE BOOK 120PAGES'),
	(846, 7, 47, 2, NULL, '2019-08-01', 'LOGISTIC', 'EPSON RIBBON CARTRIDGE-S015531/S015086'),
	(848, 7, 1, 6, NULL, '2019-10-01', 'LOGISTIC', 'L-FOLDER A4 TRANSPARENTS'),
	(849, 7, 2, 2, NULL, '2019-10-01', 'LOGISTIC', 'U-FOLDER A4 TRANSPARENTS'),
	(850, 7, 129, 1, NULL, '2019-10-01', 'LOGISTIC', 'EXERCISE BOOK 120PAGES'),
	(851, 7, 20, 1, NULL, '2019-10-01', 'LOGISTIC', 'PERMANENT MARKER-BLUE'),
	(852, 7, 21, 2, NULL, '2019-10-01', 'LOGISTIC', 'PERMANENT MARKER-BLACK'),
	(853, 7, 42, 2, NULL, '2019-10-01', 'LOGISTIC', 'EPSON ERC-38B'),
	(855, 7, 129, 1, NULL, '2019-11-01', 'LOGISTIC', 'EXERCISE BOOK 120PAGES'),
	(856, 7, 6, 2, NULL, '2019-11-01', 'LOGISTIC', 'ENVELOPE A3'),
	(858, 7, 129, 2, NULL, '2019-12-01', 'LOGISTIC', 'EXERCISE BOOK 120PAGES'),
	(859, 7, 32, 1, NULL, '2019-12-01', 'LOGISTIC', 'STAMPAD-BLUE'),
	(861, 17, 20, 4, NULL, '2019-01-01', 'LOADING', 'PERMANENT MARKER-BLUE'),
	(862, 17, 26, 1, NULL, '2019-01-01', 'LOADING', 'WHITEBOARD MARKER-BLUE'),
	(864, 17, 1, 21, NULL, '2019-02-01', 'LOADING', 'L-FOLDER A4 TRANSPARENTS'),
	(865, 17, 3, 10, NULL, '2019-02-01', 'LOADING', 'L-FOLDER COLOURFUL'),
	(866, 17, 20, 3, NULL, '2019-02-01', 'LOADING', 'PERMANENT MARKER-BLUE'),
	(867, 17, 17, 2, NULL, '2019-03-01', 'LOADING', 'DOUBLE CLIP-32MM'),
	(868, 17, 20, 2, NULL, '2019-03-01', 'LOADING', 'PERMANENT MARKER-BLUE'),
	(869, 17, 21, 1, NULL, '2019-03-01', 'LOADING', 'PERMANENT MARKER-BLACK'),
	(870, 17, 22, 1, NULL, '2019-03-01', 'LOADING', 'PERMANENT MARKER-RED'),
	(874, 17, 20, 3, NULL, '2019-04-01', 'LOADING', 'PERMANENT MARKER-BLUE'),
	(875, 17, 21, 4, NULL, '2019-04-01', 'LOADING', 'PERMANENT MARKER-BLACK'),
	(877, 17, 20, 1, NULL, '2019-05-01', 'LOADING', 'PERMANENT MARKER-BLUE'),
	(878, 17, 20, 1, NULL, '2019-06-01', 'LOADING', 'PERMANENT MARKER-BLUE'),
	(879, 17, 21, 2, NULL, '2019-06-01', 'LOADING', 'PERMANENT MARKER-BLACK'),
	(881, 17, 20, 1, NULL, '2019-07-01', 'LOADING', 'PERMANENT MARKER-BLUE'),
	(882, 17, 130, 40, NULL, '2019-08-01', 'LOADING', 'COLOURFUL PAPER-BLUE'),
	(883, 17, 20, 1, NULL, '2019-08-01', 'LOADING', 'PERMANENT MARKER-BLUE'),
	(885, 17, 20, 2, NULL, '2019-09-01', 'LOADING', 'PERMANENT MARKER-BLUE'),
	(886, 17, 21, 2, NULL, '2019-09-01', 'LOADING', 'PERMANENT MARKER-BLACK'),
	(888, 17, 129, 1, NULL, '2019-10-01', 'LOADING', 'EXERCISE BOOK 120PAGES'),
	(889, 17, 20, 2, NULL, '2019-10-01', 'LOADING', 'PERMANENT MARKER-BLUE'),
	(890, 17, 21, 2, NULL, '2019-10-01', 'LOADING', 'PERMANENT MARKER-BLACK'),
	(891, 17, 1, 2, NULL, '2019-11-01', 'LOADING', 'L-FOLDER A4 TRANSPARENTS'),
	(892, 17, 10, 5, NULL, '2019-11-01', 'LOADING', 'COLOURFUL PAPER-GREEN'),
	(893, 17, 130, 5, NULL, '2019-11-01', 'LOADING', 'COLOURFUL PAPER-BLUE'),
	(894, 17, 11, 5, NULL, '2019-11-01', 'LOADING', 'COLOURFUL PAPER-PINK'),
	(898, 17, 1, 5, NULL, '2019-12-01', 'LOADING', 'L-FOLDER A4 TRANSPARENTS'),
	(899, 21, 1, 5, NULL, '2019-02-01', 'PRODUCTION', 'L-FOLDER A4 TRANSPARENTS'),
	(900, 21, 7, 2, NULL, '2019-02-01', 'PRODUCTION', 'ENVELOPE A4'),
	(902, 21, 52, 1, NULL, '2019-03-01', 'PRODUCTION', 'EXERCISE BOOK 116PAGES'),
	(903, 18, 29, 1, NULL, '2019-04-01', 'PURCHASING', 'STAMPAD INK-BLUE'),
	(904, 18, 10, 5, NULL, '2019-05-01', 'PURCHASING', 'COLOURFUL PAPER-GREEN'),
	(905, 18, 13, 1, NULL, '2019-05-01', 'PURCHASING', 'ASTAR PENGUIN PAPER CLIP(SMALL)'),
	(906, 18, 14, 1, NULL, '2019-05-01', 'PURCHASING', 'JUMBO GEM/ASTAR CLIPS(BIG)'),
	(907, 18, 3, 3, NULL, '2019-06-01', 'PURCHASING', 'L-FOLDER COLOURFUL'),
	(908, 18, 20, 7, NULL, '2019-06-01', 'PURCHASING', 'PERMANENT MARKER-BLUE'),
	(910, 18, 21, 1, NULL, '2019-07-01', 'PURCHASING', 'PERMANENT MARKER-BLACK'),
	(911, 18, 21, 1, NULL, '2019-08-01', 'PURCHASING', 'PERMANENT MARKER-BLACK'),
	(912, 18, 7, 1, NULL, '2019-09-01', 'PURCHASING', 'ENVELOPE A4'),
	(913, 18, 1, 1, NULL, '2019-10-01', 'PURCHASING', 'L-FOLDER A4 TRANSPARENTS'),
	(914, 18, 15, 1, NULL, '2019-10-01', 'PURCHASING', 'DOUBLE CLIP-19MM'),
	(915, 18, 17, 1, NULL, '2019-10-01', 'PURCHASING', 'DOUBLE CLIP-32MM'),
	(916, 18, 29, 1, NULL, '2019-10-01', 'PURCHASING', 'STAMPAD INK-BLUE'),
	(920, 18, 1, 3, NULL, '2019-11-01', 'PURCHASING', 'L-FOLDER A4 TRANSPARENTS'),
	(921, 18, 3, 13, NULL, '2019-11-01', 'PURCHASING', 'L-FOLDER COLOURFUL'),
	(922, 18, 22, 1, NULL, '2019-11-01', 'PURCHASING', 'PERMANENT MARKER-RED'),
	(923, 18, 1, 2, NULL, '2019-12-01', 'PURCHASING', 'L-FOLDER A4 TRANSPARENTS'),
	(924, 19, 41, 2, NULL, '2019-04-01', 'HATCHERY', 'HP OFFICEJET 901 BLACK'),
	(925, 19, 129, 1, NULL, '2019-05-01', 'HATCHERY', 'EXERCISE BOOK 120PAGES'),
	(926, 19, 20, 1, NULL, '2019-05-01', 'HATCHERY', 'PERMANENT MARKER-BLUE'),
	(927, 19, 21, 1, NULL, '2019-05-01', 'HATCHERY', 'PERMANENT MARKER-BLACK'),
	(928, 19, 22, 1, NULL, '2019-05-01', 'HATCHERY', 'PERMANENT MARKER-RED'),
	(929, 19, 29, 1, NULL, '2019-05-01', 'HATCHERY', 'STAMPAD INK-BLUE'),
	(932, 19, 20, 3, NULL, '2019-06-01', 'HATCHERY', 'PERMANENT MARKER-BLUE'),
	(933, 19, 21, 1, NULL, '2019-06-01', 'HATCHERY', 'PERMANENT MARKER-BLACK'),
	(935, 19, 23, 2, NULL, '2019-07-01', 'HATCHERY', 'MULTIPURPOSE MARKER-BLUE'),
	(936, 19, 3, 7, NULL, '2019-08-01', 'HATCHERY', 'L-FOLDER COLOURFUL'),
	(937, 19, 20, 5, NULL, '2019-09-01', 'HATCHERY', 'PERMANENT MARKER-BLUE'),
	(938, 19, 21, 5, NULL, '2019-09-01', 'HATCHERY', 'PERMANENT MARKER-BLACK'),
	(940, 19, 132, 1, NULL, '2019-10-01', 'HATCHERY', 'HP LASERJET 125A BLACK'),
	(941, 19, 133, 1, NULL, '2019-10-01', 'HATCHERY', 'HP LASERJET 125A MAGENTA'),
	(942, 19, 134, 1, NULL, '2019-10-01', 'HATCHERY', 'HP LASERJET 125A CYAN'),
	(943, 19, 138, 1, NULL, '2019-10-01', 'HATCHERY', 'LASERJET TONER CATRIDGE (CC388A)');
/*!40000 ALTER TABLE `stationary_stock_take` ENABLE KEYS */;

-- Dumping structure for table admin.stationary_stock_take_ori
CREATE TABLE IF NOT EXISTS `stationary_stock_take_ori` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `date_taken` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table admin.stationary_stock_take_ori: ~8 rows (approximately)
/*!40000 ALTER TABLE `stationary_stock_take_ori` DISABLE KEYS */;
INSERT INTO `stationary_stock_take_ori` (`id`, `department_id`, `item_id`, `quantity`, `date_added`, `date_taken`) VALUES
	(1, 3, 2, 5, '2020-02-27', '2020-02-27'),
	(2, 4, 2, 2, '2020-02-27', '2020-02-27'),
	(3, 2, 14, 1, '2020-01-29', '2020-01-29'),
	(4, 2, 2, 2, '2020-02-29', '2020-02-29'),
	(5, 16, 2, 1, '2020-02-29', '2020-02-29'),
	(6, 4, 4, 1, '2020-02-29', '2020-02-29'),
	(7, 2, 2, 1, '2020-01-29', '2020-01-29'),
	(8, 2, 2, 2, '2020-03-12', '2020-03-12');
/*!40000 ALTER TABLE `stationary_stock_take_ori` ENABLE KEYS */;

-- Dumping structure for table admin.sub_menu
CREATE TABLE IF NOT EXISTS `sub_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0 COMMENT 'to identify which submenu belong to a mnu',
  `menu_title` varchar(50) NOT NULL DEFAULT '0',
  `menu_url` varchar(50) NOT NULL DEFAULT '0',
  `system_id` int(11) NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1-active, 0-inactive',
  `menu_icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `system_id` (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.sub_menu: ~43 rows (approximately)
/*!40000 ALTER TABLE `sub_menu` DISABLE KEYS */;
INSERT INTO `sub_menu` (`id`, `mid`, `menu_title`, `menu_url`, `system_id`, `position`, `status`, `menu_icon`) VALUES
	(0, 4, 'Add Location', 'location_add_new.php', 3, 2, 1, 'fas fa-map-marker-alt'),
	(1, 1, 'Add Vehicle', 'vehicle_add_new.php', 1, 1, 1, 'fa fa-id-badge'),
	(2, 1, 'Add New Entry', 'all_add_new.php', 1, 2, 1, 'fas fa-plus-circle'),
	(3, 1, 'Add Summons', 'summon_add_new.php', 1, 3, 1, 'fa fa-exclamation-triangle'),
	(4, 2, 'Vehicle Master List', 'vehicle2.php', 1, 1, 1, 'fa fa-truck'),
	(5, 2, 'Puspakom', 'puspakom.php', 1, 2, 1, 'fa fa-book'),
	(6, 2, 'Roadtax', 'roadtax.php', 1, 3, 1, 'fa fa-road'),
	(7, 2, 'Summons', 'summons.php', 1, 4, 1, 'fa fa-print'),
	(8, 3, 'Vehicle Summons', 'summons_vehicle_report.php', 1, 1, 1, 'fas fa-file-alt'),
	(9, 3, 'Road Tax Summary', 'roadtax_summary_report.php', 1, 2, 1, 'fas fa-book'),
	(10, 3, 'Renewing Schedule', 'renewing_vehicle_schedule_report.php', 1, 3, 1, 'fa fa-list-alt'),
	(11, 3, 'General Table', 'general_table_report.php', 1, 4, 1, 'fa fa-table'),
	(12, 4, 'Add Person Incharge', 'pic_add_new.php', 3, 1, 1, 'fas fa-user-secret'),
	(14, 4, 'Add Fire Extinguisher', 'listing_add_new.php', 3, 3, 1, 'fas fa-plus-circle'),
	(15, 5, 'Master Listing', 'listing.php', 3, 1, 1, 'fas fa-list-ul'),
	(16, 6, 'Department', 'department.php', 2, 1, 1, 'fas fa-user-secret'),
	(17, 6, 'Item', 'item.php', 2, 2, 1, 'fa fa-table'),
	(19, 6, 'Stock', 'stock.php', 2, 3, 1, 'fa fa-list-alt'),
	(20, 6, 'Stock Out', 'stock_out.php', 2, 4, 1, 'fas fa-list-ul'),
	(21, 1, 'Add Company', 'company_add_new.php', 1, 1, 1, 'fa fa-id-badge'),
	(22, 2, 'Company List', 'company.php', 1, 1, 1, 'fas fa-file-alt'),
	(23, 7, 'By Deparment', 'report_department_usage.php', 2, 1, 1, 'fa fa-book'),
	(24, 7, 'Stock Summary', 'report_stock_summary.php', 2, 1, 1, 'fa fa-print'),
	(25, 1, 'Add Vehicle Total Loss', 'vehicle_total_loss_add_new.php', 1, 1, 1, 'fa fa-list-alt'),
	(26, 2, 'Vehicle Total Lost', 'vehicle_total_loss.php', 1, 1, 1, 'fas fa-file-alt'),
	(27, 8, 'Add New Bill', 'add_new_bill.php', 5, 1, 1, 'fas fa-plus-circle'),
	(28, 8, 'Add New Account', 'account_setup.php', 5, 2, 1, 'fa fa-book'),
	(29, 10, 'SESB', 'report_sesb.php', 5, 1, 1, 'fas fa-list-ul'),
	(30, 10, 'Jabatan Air', 'report_jabatan_air.php', 5, 2, 1, 'fas fa-tint'),
	(31, 10, 'Telekom', 'report_telekom.php', 5, 3, 1, 'fas fa-file-alt'),
	(32, 10, 'Celcom Mobile', 'report_celcom.php', 5, 4, 1, 'fa fa-table'),
	(33, 10, 'Photocopy Machine', 'report_photocopy.php', 5, 5, 1, 'fas fa-copy'),
	(34, 10, 'Management Fee', 'report_management_fee.php', 5, 6, 1, 'fas fa-building'),
	(35, 10, 'Housing Water Bill', 'report_water_bill.php', 5, 7, 1, 'fas fa-water'),
	(36, 8, 'Add New Water Bill (Housing)', 'add_new_water_bill.php', 5, 3, 1, 'fas fa-tint'),
	(37, 8, 'Add New Premium Insurance', 'add_premium_insurance.php', 5, 4, 1, 'fas fa-file-invoice-dollar'),
	(38, 8, 'Add New Quit Rent', 'add_quit_rent_billing.php', 5, 5, 1, 'fas fa-file-invoice'),
	(39, 8, 'Add New Late Interest Charges', 'add_late_interest_charge.php', 5, 6, 1, 'fas fa-folder-plus'),
	(40, 11, 'Add User', 'add_new_user.php', 4, 1, 1, 'fas fa-plus-circle'),
	(41, 12, 'User List', 'user_list.php', 4, 2, 1, 'fas fa-list-ul'),
	(42, 13, 'Stock List', 'stock_list.php', 6, 1, 1, 'fa fa-list-alt'),
	(43, 14, 'Request', 'request_list.php', 6, 2, 1, 'fas fa-book'),
	(44, 14, 'Deposit', 'deposit.php', 6, 3, 1, 'fas fa-cart-plus'),
	(45, 3, 'Expenses Graph', 'test_chart.php', 1, 5, 1, 'fa fa-list-alt');
/*!40000 ALTER TABLE `sub_menu` ENABLE KEYS */;

-- Dumping structure for table admin.test
CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.test: ~0 rows (approximately)
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` (`id`, `name`, `department`, `phone`) VALUES
	(1, 'Jenneffer Jiminit', 'IT(Hardware)', '(503) 016-4897');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

-- Dumping structure for table admin.vehicle_category
CREATE TABLE IF NOT EXISTS `vehicle_category` (
  `vc_id` int(11) NOT NULL AUTO_INCREMENT,
  `vc_type` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`vc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Dumping data for table admin.vehicle_category: ~7 rows (approximately)
/*!40000 ALTER TABLE `vehicle_category` DISABLE KEYS */;
INSERT INTO `vehicle_category` (`vc_id`, `vc_type`) VALUES
	(1, 'Motor'),
	(2, 'Lorry'),
	(3, 'Vehicle'),
	(4, 'Hitachi'),
	(5, 'Forklift'),
	(6, 'Van'),
	(7, 'Tractor'),
	(8, 'Pick up');
/*!40000 ALTER TABLE `vehicle_category` ENABLE KEYS */;

-- Dumping structure for table admin.vehicle_driver
CREATE TABLE IF NOT EXISTS `vehicle_driver` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(255) DEFAULT NULL,
  `d_status` int(11) DEFAULT NULL COMMENT '1-active 0-inactive',
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table admin.vehicle_driver: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_driver` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_driver` ENABLE KEYS */;

-- Dumping structure for table admin.vehicle_insurance
CREATE TABLE IF NOT EXISTS `vehicle_insurance` (
  `vi_id` int(11) NOT NULL AUTO_INCREMENT,
  `vv_id` int(11) DEFAULT NULL,
  `vi_vrt_id` int(11) DEFAULT NULL,
  `vi_insurance_fromDate` date DEFAULT NULL,
  `vi_insurance_dueDate` date DEFAULT NULL,
  `vi_next_dueDate` date DEFAULT NULL,
  `vi_insuranceStatus` int(11) DEFAULT NULL,
  `vi_premium_amount` double DEFAULT NULL,
  `vi_ncd` double DEFAULT NULL,
  `vi_sum_insured` double DEFAULT NULL,
  `vi_excess_paid` double DEFAULT NULL,
  `vi_lastUpdated` date DEFAULT NULL,
  `vi_updatedBy` int(11) DEFAULT NULL,
  `vi_status` int(11) DEFAULT 1 COMMENT '1-active , 0- inactive',
  `vi_amount` double DEFAULT NULL,
  PRIMARY KEY (`vi_id`),
  KEY `vv_id` (`vv_id`),
  KEY `vrt_id` (`vi_vrt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.vehicle_insurance: ~4 rows (approximately)
/*!40000 ALTER TABLE `vehicle_insurance` DISABLE KEYS */;
INSERT INTO `vehicle_insurance` (`vi_id`, `vv_id`, `vi_vrt_id`, `vi_insurance_fromDate`, `vi_insurance_dueDate`, `vi_next_dueDate`, `vi_insuranceStatus`, `vi_premium_amount`, `vi_ncd`, `vi_sum_insured`, `vi_excess_paid`, `vi_lastUpdated`, `vi_updatedBy`, `vi_status`, `vi_amount`) VALUES
	(1, 25, 2, '2020-02-03', '2021-02-03', NULL, 1, 1227.3, 55, 105000, 0, '2020-04-15', 2, 1, 0),
	(2, 39, 3, '2019-02-04', '2020-02-03', NULL, 1, 791.55, 55, 60000, 0, '2020-04-15', 2, 1, 0),
	(3, 80, 4, '2019-02-16', '2020-02-15', NULL, 1, 588.2, 55, 3900, 0, '2020-04-15', 2, 1, 0),
	(4, 6, 6, '2020-02-24', '2021-02-23', NULL, 1, 1268.56, 25, 40000, 800, '2020-04-15', 2, 1, 0);
/*!40000 ALTER TABLE `vehicle_insurance` ENABLE KEYS */;

-- Dumping structure for table admin.vehicle_permit
CREATE TABLE IF NOT EXISTS `vehicle_permit` (
  `vpr_id` int(11) NOT NULL AUTO_INCREMENT,
  `vv_id` int(11) NOT NULL,
  `vpr_type` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `vpr_no` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `vpr_license_ref_No` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `vpr_due_date` date DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `renewal_status` int(11) DEFAULT 0 COMMENT '0 - haven''t renew, 1-renewed',
  PRIMARY KEY (`vpr_id`),
  KEY `vehicle_id` (`vv_id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table admin.vehicle_permit: 65 rows
/*!40000 ALTER TABLE `vehicle_permit` DISABLE KEYS */;
INSERT INTO `vehicle_permit` (`vpr_id`, `vv_id`, `vpr_type`, `vpr_no`, `vpr_license_ref_No`, `vpr_due_date`, `status`, `renewal_status`) VALUES
	(1, 75, 'C', '81767', 'A50014893-X/13', '2019-01-12', 1, 0),
	(2, 78, 'C', '73976', '', '2020-05-08', 1, 1),
	(3, 79, 'C', '114499', 'A50015110-1/13', '2022-03-11', 1, 0),
	(4, 85, 'C', '82791', 'A50015165-7/13', '2022-03-19', 1, 0),
	(5, 91, 'C', '118226', 'A50011289-0/11', '2021-05-15', 1, 0),
	(6, 99, 'C', '119315', 'A50016215-4/14', '2022-12-08', 1, 0),
	(7, 100, 'C', '96053', 'A50011418-4/11', '2021-06-20', 1, 0),
	(8, 108, 'C', '89157', 'LC/SA/10551', '2020-12-29', 1, 0),
	(9, 111, 'C', '88709', 'A50009896-8/09', '2020-04-08', 1, 0),
	(10, 112, 'C', '96054', 'A50011289-0/11', '2021-05-15', 1, 0),
	(11, 119, 'A', '98902', 'AB0001559-9/04', '2020-04-03', 1, 0),
	(12, 120, 'A', '115483', 'LA/SA/4147', '2022-06-07', 1, 0),
	(13, 121, 'A', '88428', 'LA/SA/4774', '2020-04-07', 1, 0),
	(14, 122, 'A', '68346', 'LA/SA/5315', '2022-06-10', 1, 0),
	(15, 123, 'A', '82916', 'AB0001052-4/03', '2019-10-11', 1, 0),
	(16, 124, 'A', '80611', 'LA/SA/4251', '2022-02-13', 1, 0),
	(17, 125, 'A', '99045', 'AB0004255-5/06', '2021-12-30', 1, 0),
	(18, 126, 'A', '40343', 'LA/SA/5316', '2022-06-10', 1, 0),
	(19, 128, 'A', '98982', 'AB0004117-6/06', '2021-12-12', 1, 0),
	(20, 176, 'A', '117404', 'A50014970-3/13', '2022-05-06', 1, 0),
	(21, 180, 'A', '112535', 'A50014747-6/12', '2021-12-05', 1, 0),
	(22, 184, 'A', '96326', 'A50011640-6/11', '2021-08-21', 1, 0),
	(23, 185, 'A', '109609', 'A50014186-1/12', '2021-07-29', 1, 0),
	(24, 186, 'A', '85246', 'A50009399-4/08', '2019-12-23', 1, 0),
	(25, 187, 'A', '104886', 'A50012663-8/12', '2022-07-02', 1, 0),
	(26, 190, 'A', '115100', 'A50014969-9/13', '2022-05-06', 1, 0),
	(27, 191, 'A', '120204', 'A50009777-4/08', '2023-03-17', 1, 0),
	(28, 192, 'A', '73982', 'A50013069-5/12', '2020-10-11', 1, 0),
	(29, 194, 'A', '104887', 'A50012563-0/12', '2022-06-05', 1, 0),
	(30, 195, 'A', '86091', 'A50009687-3/08', '2020-03-28', 1, 0),
	(31, 200, 'A', '96323', 'A50011417-9/11', '2021-06-20', 1, 0),
	(32, 201, 'A', '101960', 'A50012329-4/11', '2022-03-18', 1, 0),
	(33, 202, 'A', '72800', 'A50012795-7/12', '2022-07-29', 1, 0),
	(34, 203, 'A', '120203', 'A50009771-X/08', '2023-03-16', 1, 0),
	(35, 206, 'A', '85310', 'A50015723-5/14', '2019-08-05', 1, 0),
	(36, 210, 'A', '120212', 'A50009858-7/08', '2023-03-31', 1, 0),
	(37, 212, 'A', '119922', 'LPKP/SBH/2020/L/LA/00040', '2023-01-14', 1, 0),
	(38, 214, 'A', '119921', 'LPKP/SGH/2020/L/LA/00039', '2023-01-14', 1, 0),
	(39, 215, 'A', '119923', 'LPKP/SBH/2020/L/LS/00041', '2023-01-14', 1, 0),
	(40, 218, 'A', '100807', 'LPKP/SBH/2016/L/LA/00363', '2021-11-20', 1, 0),
	(41, 220, 'A', '96329', 'A50011507-2/11', '2021-07-17', 1, 0),
	(42, 222, 'A', '119498', 'A50009401-4/08', '2022-12-23', 1, 0),
	(43, 223, 'A', '72888', 'A50012796-2/12', '2022-07-29', 1, 0),
	(44, 229, 'C', '97038', 'LC/SA/6688', '2021-08-18', 1, 0),
	(45, 231, 'A', '96325', 'A50011506-7/11', '2021-07-17', 1, 0),
	(46, 232, 'A', '72963', 'A50012813-4/12', '2022-08-02', 1, 0),
	(47, 233, 'A', '98733', 'LPKP/SBH/2016/L/LA/00066', '2021-05-26', 1, 0),
	(48, 237, 'A', '112534', 'A50014257-3/13', '2021-08-20', 1, 0),
	(49, 243, 'A', '88427', 'A50009901-5/08', '2020-04-11', 1, 0),
	(50, 244, 'A', '86095', 'A50009858-7/08', '2020-03-31', 1, 0),
	(51, 247, 'A', '96322', 'A50011531-0/11', '2021-07-20', 1, 0),
	(52, 251, 'A', '118681', 'A50012813-4/12', '2022-08-02', 1, 0),
	(53, 253, 'A', '118306', 'A50015723-5/14', '2022-08-05', 1, 0),
	(54, 254, 'A', '72896', 'A50012821-7/12', '2022-08-05', 1, 0),
	(55, 256, 'A', '102698', 'LPKP.SBH.600-1/A000017318', '2022-06-20', 1, 0),
	(56, 258, 'A', '119497', 'A50009399-4/08', '2022-12-23', 1, 0),
	(57, 259, 'A', '120202', 'A50009827-6/08', '2023-03-28', 1, 0),
	(58, 260, 'A', '96324', 'A50011287-X/11', '2021-05-15', 1, 0),
	(59, 261, 'A', '114581', 'A50015248-3/14', '2022-03-31', 1, 0),
	(60, 262, 'A', '104888', 'A50012638-4/12', '2022-06-26', 1, 0),
	(61, 263, 'A', '120211', 'A50009687-3/08', '2023-03-28', 1, 0),
	(62, 266, 'A', '72895', 'A50012820-1/12', '2022-08-05', 1, 0),
	(63, 267, 'A', '109602', 'A50014656-7/13', '2021-11-26', 1, 0),
	(64, 271, 'A', '109602', 'A50014656-7/13', '2021-11-26', 1, 0),
	(65, 272, 'A', '96324', 'A50011287-X/11', '2021-05-15', 1, 0),
	(66, 1, 'C', '00000', '00000', '2020-04-18', 1, 1),
	(67, 1, 'C', '00006', '00006', '2021-04-18', 1, 0);
/*!40000 ALTER TABLE `vehicle_permit` ENABLE KEYS */;

-- Dumping structure for table admin.vehicle_permit_ori
CREATE TABLE IF NOT EXISTS `vehicle_permit_ori` (
  `vpr_id` int(11) NOT NULL AUTO_INCREMENT,
  `vv_id` int(11) NOT NULL DEFAULT 0,
  `vpr_type` varchar(50) NOT NULL DEFAULT '0',
  `vpr_no` varchar(50) NOT NULL DEFAULT '0',
  `vpr_license_ref_no` varchar(50) NOT NULL DEFAULT '0',
  `vpr_due_date` date NOT NULL DEFAULT '0000-00-00',
  `status` int(11) DEFAULT 1,
  PRIMARY KEY (`vpr_id`),
  KEY `vv_id` (`vv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.vehicle_permit_ori: ~128 rows (approximately)
/*!40000 ALTER TABLE `vehicle_permit_ori` DISABLE KEYS */;
INSERT INTO `vehicle_permit_ori` (`vpr_id`, `vv_id`, `vpr_type`, `vpr_no`, `vpr_license_ref_no`, `vpr_due_date`, `status`) VALUES
	(1, 16, '', '', '', '0000-00-00', 1),
	(2, 17, 'C', '81787', 'A50014893-X/13', '2019-01-12', 1),
	(3, 18, '-', '', '-', '2020-02-28', 1),
	(4, 19, 'A', '88429', 'AB0001559-9/04', '2020-04-03', 1),
	(5, 20, '', '', '', '0000-00-00', 1),
	(6, 21, 'A', '115483', 'LA/SA/4147', '2020-06-07', 1),
	(7, 22, 'A', '88428', 'LA/SA/4774', '2020-04-07', 1),
	(8, 23, '', '', '', '0000-00-00', 1),
	(9, 24, '', '', '', '0000-00-00', 1),
	(10, 25, '-', '', '-', '0000-00-00', 1),
	(11, 26, 'A', '114843', 'LA/SA/4251', '2022-02-13', 1),
	(12, 27, '-', '', '-', '0000-00-00', 1),
	(13, 28, '-', '', '-', '0000-00-00', 1),
	(14, 29, '', '', '', '0000-00-00', 1),
	(15, 30, '-', '', '-', '0000-00-00', 1),
	(16, 31, 'A', '40343', 'LA/SA/5316', '2022-06-10', 1),
	(17, 32, '-', '', '-', '0000-00-00', 1),
	(18, 33, '-', '', '-', '0000-00-00', 1),
	(19, 34, 'A', '98982', 'AB0004117-6/06', '2021-12-12', 1),
	(20, 35, '-', '', '-', '2020-02-28', 1),
	(21, 36, '-', '', '-', '0000-00-00', 1),
	(22, 37, '-', '', '-', '0000-00-00', 1),
	(23, 38, '-', '', '-', '0000-00-00', 1),
	(24, 39, '-', '', '-', '0000-00-00', 1),
	(25, 40, '-', '', '-', '0000-00-00', 1),
	(26, 41, '-', '', '-', '0000-00-00', 1),
	(27, 42, '-', '', '-', '0000-00-00', 1),
	(28, 43, '-', '', '-', '0000-00-00', 1),
	(29, 44, '-', '', '-', '0000-00-00', 1),
	(30, 45, '-', '', '-', '0000-00-00', 1),
	(31, 46, '-', '', '-', '0000-00-00', 1),
	(32, 47, '-', '', '-', '0000-00-00', 1),
	(33, 48, '-', '', '-', '0000-00-00', 1),
	(34, 49, '-', '', '-', '2020-02-28', 1),
	(35, 50, '-', '', '-', '0000-00-00', 1),
	(36, 51, '-', '', '-', '0000-00-00', 1),
	(37, 52, '-', '', '-', '0000-00-00', 1),
	(38, 53, '-', '', '-', '0000-00-00', 1),
	(39, 54, '-', '', '-', '0000-00-00', 1),
	(40, 55, '-', '', '-', '0000-00-00', 1),
	(41, 56, '-', '', '-', '0000-00-00', 1),
	(42, 57, '-', '', '-', '0000-00-00', 1),
	(43, 58, '-', '', '-', '0000-00-00', 1),
	(44, 59, '', '', '', '0000-00-00', 1),
	(45, 60, '-', '', '-', '0000-00-00', 1),
	(46, 61, '-', '', '-', '0000-00-00', 1),
	(47, 62, '-', '', '-', '0000-00-00', 1),
	(48, 63, '-', '', '-', '0000-00-00', 1),
	(49, 64, '-', '', '-', '0000-00-00', 1),
	(50, 65, '-', '', '-', '0000-00-00', 1),
	(51, 66, '-', '', '-', '0000-00-00', 1),
	(52, 67, '-', '', '-', '0000-00-00', 1),
	(53, 68, '-', '', '-', '0000-00-00', 1),
	(54, 69, '-', '', '-', '0000-00-00', 1),
	(55, 70, '-', '', '-', '0000-00-00', 1),
	(56, 71, '-', '', '-', '0000-00-00', 1),
	(57, 72, '-', '', '-', '2020-02-28', 1),
	(58, 73, '-', '', '-', '0000-00-00', 1),
	(59, 74, '-', '', '-', '2020-02-28', 1),
	(60, 75, '-', '', '-', '0000-00-00', 1),
	(61, 76, '-', '', '-', '0000-00-00', 1),
	(62, 77, '-', '', '-', '0000-00-00', 1),
	(63, 78, '-', '', '-', '0000-00-00', 1),
	(64, 79, '', '', '', '0000-00-00', 1),
	(65, 80, '-', '', '-', '0000-00-00', 1),
	(66, 81, '-', '', '-', '0000-00-00', 1),
	(67, 82, '-', '', '-', '0000-00-00', 1),
	(68, 83, '-', '', '-', '0000-00-00', 1),
	(69, 84, '-', '', '-', '0000-00-00', 1),
	(70, 85, '-', '', '-', '0000-00-00', 1),
	(71, 86, '-', '', '-', '0000-00-00', 1),
	(72, 87, '-', '', '-', '0000-00-00', 1),
	(73, 88, '-', '', '-', '0000-00-00', 1),
	(74, 89, '-', '', '-', '0000-00-00', 1),
	(75, 90, '-', '', '-', '0000-00-00', 1),
	(76, 91, '', '', '', '0000-00-00', 1),
	(77, 92, '-', '', '-', '0000-00-00', 1),
	(78, 93, '-', '', '-', '0000-00-00', 1),
	(79, 94, '-', '', '-', '0000-00-00', 1),
	(80, 95, '-', '', '-', '0000-00-00', 1),
	(81, 96, '-', '', '-', '0000-00-00', 1),
	(82, 97, '-', '', '-', '0000-00-00', 1),
	(83, 98, '-', '', '-', '0000-00-00', 1),
	(84, 99, '-', '', '-', '0000-00-00', 1),
	(85, 100, '-', '', '-', '0000-00-00', 1),
	(86, 101, '-', '', '-', '0000-00-00', 1),
	(87, 102, '-', '', '-', '0000-00-00', 1),
	(88, 103, '-', '', '-', '0000-00-00', 1),
	(89, 104, '-', '', '-', '0000-00-00', 1),
	(90, 105, '-', '', '-', '0000-00-00', 1),
	(91, 106, 'A', '', 'A50014747-6/12', '2021-12-05', 1),
	(92, 107, '-', '', '-', '0000-00-00', 1),
	(93, 108, '-', '', '-', '0000-00-00', 1),
	(94, 109, '-', '', '-', '0000-00-00', 1),
	(95, 0, '', '', '', '0000-00-00', 1),
	(96, 110, 'A', '104886', 'A50012663-8/12', '2022-07-02', 1),
	(97, 111, 'A', '109609', 'A50014186-1/12', '2021-07-29', 1),
	(98, 112, '', '', '', '0000-00-00', 1),
	(99, 113, '', '', '', '0000-00-00', 1),
	(100, 114, '', '', '', '0000-00-00', 1),
	(101, 115, '', '', '', '0000-00-00', 1),
	(102, 116, '', '', '', '0000-00-00', 1),
	(103, 117, '', '', '', '0000-00-00', 1),
	(104, 118, '', '', '', '0000-00-00', 1),
	(105, 119, '', '', '', '0000-00-00', 1),
	(106, 120, '', '', '', '0000-00-00', 1),
	(107, 121, 'A', '115100', 'A50014969-9/13', '2022-05-06', 1),
	(108, 122, 'A', '86090', 'A50009777-4/08', '2020-03-17', 1),
	(109, 123, 'A', '73982', 'A50013069-5/12', '2020-10-11', 1),
	(110, 124, '', '', '', '0000-00-00', 1),
	(111, 125, 'A', '104887', 'A50012563-0/12', '2020-06-05', 1),
	(112, 126, '', '', '', '0000-00-00', 1),
	(113, 127, 'A', '96323', 'A50011417-9/11', '2021-06-20', 1),
	(114, 128, 'A', '86096', 'A50009771-X/08', '2020-03-16', 1),
	(115, 129, 'A', '101960', 'A50012329-4/11', '2020-03-18', 1),
	(116, 130, 'A', '72800', 'A50012795-7/12', '2020-07-29', 1),
	(117, 131, '', '', '', '0000-00-00', 1),
	(118, 132, '', '', '', '0000-00-00', 1),
	(119, 133, '', '', '', '0000-00-00', 1),
	(120, 134, '', '', '', '0000-00-00', 1),
	(121, 135, '', '', '', '0000-00-00', 1),
	(122, 136, '', '', '', '0000-00-00', 1),
	(123, 137, '', '', '', '0000-00-00', 1),
	(124, 138, 'A', '100807', 'LPKP/SBH/2016/L/LA/00363', '2021-11-20', 1),
	(125, 139, '', '', '', '0000-00-00', 1),
	(126, 140, 'A', '119498', 'A50009401-4/08', '2022-12-23', 1),
	(127, 141, 'A', '96329', 'A50011507-2/11', '2021-07-17', 1),
	(128, 142, 'A', '72888', 'A50012796-2/12', '2022-07-29', 1);
/*!40000 ALTER TABLE `vehicle_permit_ori` ENABLE KEYS */;

-- Dumping structure for table admin.vehicle_puspakom
CREATE TABLE IF NOT EXISTS `vehicle_puspakom` (
  `vp_id` int(11) NOT NULL AUTO_INCREMENT,
  `vv_id` int(11) DEFAULT NULL,
  `vp_vrt_id` int(11) DEFAULT NULL,
  `vp_fitnessDate` date DEFAULT NULL,
  `vp_roadtaxDueDate` date DEFAULT NULL,
  `vp_next_dueDate` date DEFAULT NULL,
  `vp_runner` varchar(100) DEFAULT '',
  `vp_lastUpdated` datetime NOT NULL,
  `vp_updatedBy` int(11) NOT NULL,
  `status` int(11) DEFAULT 1 COMMENT '1-active, 0-inactive',
  PRIMARY KEY (`vp_id`),
  KEY `vv_id` (`vv_id`),
  KEY `vp_vrt_id` (`vp_vrt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table admin.vehicle_puspakom: ~4 rows (approximately)
/*!40000 ALTER TABLE `vehicle_puspakom` DISABLE KEYS */;
INSERT INTO `vehicle_puspakom` (`vp_id`, `vv_id`, `vp_vrt_id`, `vp_fitnessDate`, `vp_roadtaxDueDate`, `vp_next_dueDate`, `vp_runner`, `vp_lastUpdated`, `vp_updatedBy`, `status`) VALUES
	(1, 25, 2, '1970-01-01', '2022-01-28', NULL, '', '2020-04-15 14:51:28', 2, 1),
	(2, 39, 3, '1970-01-01', '2021-02-03', NULL, '', '2020-04-15 14:53:07', 2, 1),
	(3, 80, 4, '1970-01-01', '2021-02-14', NULL, '', '2020-04-15 14:59:04', 2, 1),
	(4, 6, 6, '2020-03-12', '2020-08-23', NULL, '', '2020-04-15 15:02:17', 2, 1);
/*!40000 ALTER TABLE `vehicle_puspakom` ENABLE KEYS */;

-- Dumping structure for table admin.vehicle_roadtax
CREATE TABLE IF NOT EXISTS `vehicle_roadtax` (
  `vrt_id` int(11) NOT NULL AUTO_INCREMENT,
  `vv_id` int(11) NOT NULL,
  `vrt_lpkpPermit_dueDate` date DEFAULT NULL,
  `vrt_roadTax_fromDate` date NOT NULL,
  `vrt_roadTax_dueDate` date NOT NULL,
  `vrt_next_dueDate` date DEFAULT NULL,
  `vrt_roadtaxPeriodYear` double NOT NULL,
  `vrt_roadtaxPeriodMonth` double NOT NULL,
  `vrt_roadtaxPeriodDay` double NOT NULL,
  `vrt_amount` double NOT NULL,
  `vrt_lastUpdated` datetime NOT NULL,
  `vrt_updatedBy` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1-active, 0-inactive',
  PRIMARY KEY (`vrt_id`),
  KEY `vv_id` (`vv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table admin.vehicle_roadtax: ~6 rows (approximately)
/*!40000 ALTER TABLE `vehicle_roadtax` DISABLE KEYS */;
INSERT INTO `vehicle_roadtax` (`vrt_id`, `vv_id`, `vrt_lpkpPermit_dueDate`, `vrt_roadTax_fromDate`, `vrt_roadTax_dueDate`, `vrt_next_dueDate`, `vrt_roadtaxPeriodYear`, `vrt_roadtaxPeriodMonth`, `vrt_roadtaxPeriodDay`, `vrt_amount`, `vrt_lastUpdated`, `vrt_updatedBy`, `status`) VALUES
	(1, 25, NULL, '2021-01-29', '2022-01-28', NULL, 0, 12, 4, 1379.2, '2020-04-15 14:49:54', 2, 0),
	(2, 25, NULL, '2021-01-29', '2022-01-28', NULL, 0, 12, 4, 1379.2, '2020-04-15 14:51:27', 2, 1),
	(3, 39, NULL, '2020-02-04', '2021-02-03', NULL, 1, 0, 0, 1379.2, '2020-04-15 14:53:07', 2, 1),
	(4, 80, NULL, '2020-02-15', '2021-02-14', NULL, 1, 0, 0, 1379.2, '2020-04-15 14:59:04', 2, 1),
	(5, 6, NULL, '2020-02-24', '2020-08-23', NULL, 0, 6, 1, 662, '2020-04-15 15:01:19', 2, 0),
	(6, 6, NULL, '2020-02-24', '2020-08-23', NULL, 0, 6, 1, 662, '2020-04-15 15:02:16', 2, 1);
/*!40000 ALTER TABLE `vehicle_roadtax` ENABLE KEYS */;

-- Dumping structure for table admin.vehicle_runner
CREATE TABLE IF NOT EXISTS `vehicle_runner` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table admin.vehicle_runner: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_runner` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_runner` ENABLE KEYS */;

-- Dumping structure for table admin.vehicle_summons
CREATE TABLE IF NOT EXISTS `vehicle_summons` (
  `vs_id` int(11) NOT NULL AUTO_INCREMENT,
  `vv_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `vs_summon_no` varchar(50) DEFAULT NULL,
  `vs_pv_no` varchar(50) DEFAULT NULL,
  `vs_reimbursement_amt` double DEFAULT NULL,
  `vs_balance` double DEFAULT NULL,
  `vs_remarks` varchar(255) DEFAULT NULL,
  `vs_summon_type` int(11) DEFAULT NULL COMMENT '1- pdrm, 2- jpj, 3-others',
  `vs_summon_type_desc` varchar(255) DEFAULT NULL COMMENT 'summon description if type is others',
  `vs_driver_name` varchar(100) DEFAULT NULL,
  `vs_summon_date` date DEFAULT NULL,
  `vs_description` varchar(255) DEFAULT NULL COMMENT 'offence details',
  `vs_date_added` date DEFAULT NULL,
  `status` int(1) DEFAULT 1 COMMENT '1-active, 0-inactive',
  PRIMARY KEY (`vs_id`),
  KEY `vv_id` (`vv_id`),
  KEY `driver_id` (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table admin.vehicle_summons: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_summons` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_summons` ENABLE KEYS */;

-- Dumping structure for table admin.vehicle_summon_payment
CREATE TABLE IF NOT EXISTS `vehicle_summon_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `summon_id` int(11) DEFAULT 0,
  `payment_amount` double DEFAULT NULL,
  `bankin_amount` double DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `bankin_date` date DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `summon_id` (`summon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table admin.vehicle_summon_payment: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_summon_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_summon_payment` ENABLE KEYS */;

-- Dumping structure for table admin.vehicle_summon_type
CREATE TABLE IF NOT EXISTS `vehicle_summon_type` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `st_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.vehicle_summon_type: ~3 rows (approximately)
/*!40000 ALTER TABLE `vehicle_summon_type` DISABLE KEYS */;
INSERT INTO `vehicle_summon_type` (`st_id`, `st_name`) VALUES
	(1, 'JPJ'),
	(2, 'PDRM'),
	(3, 'OTHER');
/*!40000 ALTER TABLE `vehicle_summon_type` ENABLE KEYS */;

-- Dumping structure for table admin.vehicle_total_loss
CREATE TABLE IF NOT EXISTS `vehicle_total_loss` (
  `vt_id` int(11) NOT NULL AUTO_INCREMENT,
  `vt_insurance` varchar(50) DEFAULT NULL,
  `vt_offer_letter_date` date DEFAULT NULL,
  `vt_payment_advice_date` date DEFAULT NULL,
  `vt_vv_id` int(11) DEFAULT NULL,
  `vt_amount` double DEFAULT NULL,
  `vt_beneficiary_bank` varchar(50) DEFAULT NULL,
  `vt_trans_ref_no` varchar(50) DEFAULT NULL,
  `vt_driver` varchar(50) DEFAULT NULL,
  `vt_remark` text DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `status` int(11) DEFAULT 1 COMMENT '1-active, 0-deleted',
  PRIMARY KEY (`vt_id`),
  KEY `vv_id` (`vt_vv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- Dumping data for table admin.vehicle_total_loss: ~27 rows (approximately)
/*!40000 ALTER TABLE `vehicle_total_loss` DISABLE KEYS */;
INSERT INTO `vehicle_total_loss` (`vt_id`, `vt_insurance`, `vt_offer_letter_date`, `vt_payment_advice_date`, `vt_vv_id`, `vt_amount`, `vt_beneficiary_bank`, `vt_trans_ref_no`, `vt_driver`, `vt_remark`, `date_added`, `status`) VALUES
	(1, 'tst', '2020-03-02', '2020-03-02', 18, 50000, 'test', 'test', 'test', 'teat', '2020-03-02', 0),
	(2, 'tst', '2020-03-02', '2020-03-02', 18, 50000, 'test', 'test', 'test', 'teat', '2020-03-02', 0),
	(3, '', '1970-01-01', '1970-01-01', 18, 0, '', '', '', '', '2020-03-02', 0),
	(4, '', '1970-01-01', '1970-01-01', 0, 0, '', '', '', '', '2020-03-02', 1),
	(5, 'qwerty', '2020-03-02', '2020-03-02', 27, 1200, 'bsn', '123456kj', 'SULTAN', 'tet', '2020-03-02', 0),
	(6, 'ALLIANZ GENERAL INSURANCE', '2019-10-24', '2019-10-18', 112, 27.3, 'HONG LEONG BANK BERHAD', '518334640100092', 'WALTER EDIP', 'TOTAL LOSS', '2020-03-04', 0),
	(7, 'ALLIANZ GENERAL INSURANCE', '1970-01-01', '1970-01-01', 112, 6, '', '', '', '', '2020-03-04', 0),
	(8, 'ALLIANZ GENERAL INSURANCE', '2019-10-24', '2019-12-18', 112, 27.3, 'HONG LEONG', '518334640100092', 'WALTER EDIP', 'TOTAL LOSS', '2020-03-04', 0),
	(9, 'ALLIANZ GENERAL INSURANCE', '1970-01-01', '1970-01-01', 113, 36, '', '', '', '', '2020-03-04', 0),
	(10, 'ALLIANZ GENERAL INSURANCE', '1970-01-01', '1970-01-01', 113, 36000, '', '', '', '', '2020-03-04', 0),
	(11, 'ALLIANZ GENERAL INSURANCE', '1970-01-01', '1970-01-01', 112, 27300, '', '', '', '', '2020-03-04', 0),
	(12, 'ALLIANZ GENERAL INSURANCE', '2019-10-24', '2019-12-18', 112, 273000, 'HONG LEONG', '518334640100092', 'WALTER EDIP', 'TOTAL LOSS\r\n', '2020-03-04', 0),
	(13, 'ALLIANZ GENERAL INSURANCE', '2019-10-24', '2019-12-18', 112, 27300, 'HONG LEONG', '518334640100092', 'WALTER EDIP', 'TOTAL LOSS', '2020-03-04', 1),
	(14, 'ALLIANZ GENERAL INSURANCE', '1970-01-01', '1970-01-01', 113, 3600, '', '', '', '', '2020-03-04', 0),
	(15, '', '1970-01-01', '1970-01-01', 0, 36000, '', '', '', '', '2020-03-04', 1),
	(16, 'ALLIANZ GENERAL INSURANCE', '2019-04-09', '2019-06-26', 113, 36000, 'HONG LEONG', '516741150100197', 'LO CHEE LEONG', 'TOTAL LOSS', '2020-03-04', 1),
	(17, 'ALLIANZ GENERAL INSURANCE', '2018-07-26', '2018-09-24', 114, 165000, 'HONG LEONG', '514172200100283', 'MANSUR LATJAMA', 'TOTAL LOSS', '2020-03-04', 1),
	(18, 'ALLIANZ GENERAL INSURANCE', '1970-01-01', '1970-01-01', 115, 224400, '', '', '', '', '2020-03-04', 0),
	(19, 'ALLIANZ', '2018-04-05', '2018-11-29', 115, 224400, 'HONG LEONG', '514810850100353', 'JOSEPH A/L DUYA', 'TOTAL LOSS', '2020-03-04', 0),
	(20, 'ALLIANZ GENERAL INSURANCE', '1970-01-01', '1970-01-01', 115, 224400, '', '', '', '', '2020-03-04', 0),
	(21, 'ALLIANZ GENERAL INSURANCE', '1970-01-01', '1970-01-01', 115, 224400000, '', '', '', '', '2020-03-04', 0),
	(22, '', '1970-01-01', '1970-01-01', 115, 22440, '', '', '', '', '2020-03-04', 0),
	(23, 'ALLIANZ GENERAL INSURANCE', '2018-04-05', '2018-11-29', 115, 22440, 'HONG LEONG', '514810850100353', 'JOSEPH A/L DUYA', 'TOTAL LOSS', '2020-03-04', 1),
	(24, 'ALLIANZ GENERAL INSURANCE', '1970-01-01', '1970-01-01', 116, 3400, '', '', '', '', '2020-03-04', 0),
	(25, 'ALLIANZ GENERAL INSURANCE', '2018-11-04', '2018-11-29', 116, 34000, 'HONG LEONG', '514810850100349', 'JEFFRY P.RATU ARAN', 'TOTAL LOSS', '2020-03-04', 1),
	(26, 'ALLIANZ GENERAL INSURANCE', '1970-01-01', '1970-01-01', 117, 31100, '', '', '', '', '2020-03-04', 0),
	(27, 'ALLIANZ GENERAL INSURANCE', '1970-01-01', '2018-11-15', 117, 31100, 'HONG LEONG', '514676020100516', 'ALIMUDDIN BIN LAPAWELA', 'TOTAL LOSS', '2020-03-04', 1);
/*!40000 ALTER TABLE `vehicle_total_loss` ENABLE KEYS */;

-- Dumping structure for table admin.vehicle_vehicle
CREATE TABLE IF NOT EXISTS `vehicle_vehicle` (
  `vv_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `vv_category` int(11) DEFAULT NULL,
  `vv_vehicleNo` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `vv_status` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `vv_brand` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `vv_model` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `vv_engine_no` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `vv_chasis_no` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `vv_bdm` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `vv_btm` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `vv_capacity` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `vv_driver` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `vv_yearMade` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `vv_finance` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `vv_disposed` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `vv_remark` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `vv_yearPurchased` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  PRIMARY KEY (`vv_id`),
  KEY `vv_company_id` (`company_id`),
  KEY `vv_category` (`vv_category`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table admin.vehicle_vehicle: ~272 rows (approximately)
/*!40000 ALTER TABLE `vehicle_vehicle` DISABLE KEYS */;
INSERT INTO `vehicle_vehicle` (`vv_id`, `company_id`, `vv_category`, `vv_vehicleNo`, `vv_status`, `vv_brand`, `vv_model`, `vv_engine_no`, `vv_chasis_no`, `vv_bdm`, `vv_btm`, `vv_capacity`, `vv_driver`, `vv_yearMade`, `vv_finance`, `vv_disposed`, `vv_remark`, `vv_yearPurchased`, `date_added`, `status`) VALUES
	(1, 1, 3, 'SD 69 D [TOTAL LOSS]', 'TOTAL LOSS', 'ISUZU', 'TFR54HD0', '4JA1-355321', 'JAATFR54H67101470', '-', '-', '-', 'TOTAL LOSS', '2006', '-', '-', '-', NULL, NULL, 1),
	(2, 1, 3, 'SA1221L', 'ACTIVE', 'MITSUBISHI CANTER', 'MITSUBISHI', '4D31-851694', 'FE434E-A45419', '-', '-', '-', 'LOGISTICS STANDBY DRIVER', '1991', '-', '-', 'bas sekolah baru - any payment related such as road tax and insurance asked bos - kena beli on 16.08.2017 - EPCS RENTAL-BELUM TUKAR NAMA (WONG WEE SHIN)', NULL, NULL, 1),
	(3, 1, 1, 'SU1279B', 'ACTIVE', 'HONDA', 'MOTORBIKE ~ C100', 'HA13E-4032970', 'PMKHA13209B032932', '-', '-', '-', 'TIMBOK TELUR AB-TONY LAMAR (UNDER MR.LING)', '2009', '-', '-', '-', NULL, NULL, 1),
	(4, 1, 6, 'SA285R', 'ACTIVE', 'NISSAN', 'VPC22EFU VANETTE', 'A15-C004666', 'VPC22-859494', '-', '-', '-', 'CATCHING TEAM USED (RICHMOND)', '1995', '-', '-', 'ROAD TAX INSURANCE - WWP BAYAR', NULL, NULL, 1),
	(5, 1, 2, 'SA1313J', 'ACTIVE', 'TOYOTA', 'DYNA HIACE-PICK UP', '2L-2897152', 'LH80-0019675', '2400', '1620', '780', 'REJOS DARIUS', '1988', '-', '-', '-', NULL, NULL, 1),
	(6, 1, 1, 'SD1632L', 'ACTIVE', 'DNC ASIATIC HOLDING SDN BHD', 'DEMAK EX 90', 'PMDD147FMFE507142', 'PMDDLMPF0FE507289', '-', '-', '-', 'LERYSYAM JAINUS', '2014', '-', '-', '-', NULL, NULL, 1),
	(7, 1, 3, 'SA1682K', 'ACTIVE', 'DAIHATSU', 'DELTA V57A', '536410', 'V57A-99122', '2500', '1260', '1260', 'FARM TAMPARULI (CHAI KIN FATT)', '1990', '-', '-', 'OFF ROAD', NULL, NULL, 1),
	(8, 1, 2, 'SA 935 T', 'ACTIVE', 'ISUZU', 'NHR55E LIGHT TRUCK', '4JB1-244178', 'JAANHR55EP7108628', '2500', '1750', '750', 'HJ. KURONG', '1996', '-', '-', '-', NULL, NULL, 1),
	(9, 1, 3, 'SAA 935 A', 'ACTIVE', 'TOYOTA', 'LN166 HILUX DOUBLE CAB 4X4', '3L-4992399', 'LN166-0048879', '-', '-', '-', 'WILLIAM CHONG', '2000', '-', '-', 'Jadima jual sama EPCS on 01.12.2008 with price RM 5,000', NULL, NULL, 1),
	(10, 1, 3, 'SAA 935 F', 'ACTIVE', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB (M)', '2KD-9150794', 'KDN165-0024437', '-', '-', '-', 'HENRY GABRIEL', '2003', '-', '-', '-', NULL, NULL, 1),
	(11, 1, 3, 'SAA 935 J', 'ACTIVE', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB 2.5L', '2KD-9378113', 'PN133JV2508000175', '-', '-', '-', 'AH CHI - CONTRACT FARMER (KB)', '2005', '-', '-', 'ANTON HERA GUNA SEBELUM BALIK INDON', NULL, NULL, 1),
	(12, 1, 1, 'SAB 935 B', 'ACTIVE', 'HONDA', 'MOTORBIKE ~ C100', 'HA13E-4077378', 'PMKHA13209B077542', '-', '-', '-', 'MOHD RIDWAN (OFFICE BOY)', '2009', '-', '-', '-', NULL, NULL, 1),
	(13, 1, 3, 'SAA 223 T', 'ACTIVE', 'TOYOTA', 'LAND CRUISER KR-HDJ101K', '1HD0240691', 'HDJ101-0025449', '-', '-', '-', 'PATRICK SHU', '2003', '-', '-', '-', NULL, NULL, 1),
	(14, 1, 2, 'SAA2240A', '-', 'DAIHATSU', 'V58R-HS DELTA', '639270', 'V58B53386', '4500', '1830', '2670', 'STAND-BY AT KILANG', '2000', '-', '-', '-', NULL, NULL, 1),
	(15, 1, 2, 'SAA2288Y', 'ACTIVE', 'ISUZU', 'ISUZU / NPR71L (RB/BL-MOD)', '4HG1693517', 'NPR71L-7422466', '5000', '3310', '1690', 'WILLIAM (SANDAKAN) - LASB SEWA', '2009', '-', '-', 'KENA HANTAR PERGI SANDAKAN ON 01.04.2019 - LASB SEWA', NULL, NULL, 1),
	(16, 1, 3, 'QMH2303', 'ACTIVE', 'FORD', 'RANGER UVIM FM1 D/CABIN 4X4', 'WLAT499311', 'PR8CACBAL4LZ02110', '-', '-', '-', 'NICHOLAS WA', '2004', '-', '-', '-', NULL, NULL, 1),
	(17, 1, 2, 'SA2638U', 'ACTIVE', 'ISUZU', 'NPR596-06H', '4BDI-570176', 'JAANPR59PM7110485', '5000', '3250', '1750', 'ULU KIMANIS FARM', '1996', '-', '-', '-', NULL, NULL, 1),
	(18, 1, 3, 'SWA2816 (NEW)', 'ACTIVE', 'NISSAN', 'X-TRAIL 2.0L CVT MID', 'MR20502116C', 'PN8JAAT32TCA49288', '-', '-', '-', 'MADAM WONG HUE FEN', '2019', 'HONG LEONG BANK', '-', '-', NULL, NULL, 1),
	(19, 1, 3, 'SAA2848K', 'ACTIVE', 'MAZDA', 'B2500 DOUBLE CAB 4X4', 'WL100245', 'PMZUNYOW2MM101736', '-', '-', '-', 'WORKSHOP - ARTHUR', '2005', '-', '-', 'WORKSHOP GUNA UNTUK ANGKAT PART LORI/HITACHI', NULL, NULL, 1),
	(20, 1, 5, 'JJB3117', '-', 'MAZDA', 'FORKLIFT~ 5FD20', '1Z-0017733', '5FD25-22764', '-', '-', '-', 'F02 - Feedmill', '2002', '-', '-', 'TIDAK TAU APA KEJADIAN KAD TIADA ', NULL, NULL, 1),
	(21, 1, 3, 'QMD3303', 'ACTIVE', 'NISSAN', 'SARENA 2.0L EDAARFBC24EX7', 'QR20-571330A', 'PN8EAAC24TCA06125', '-', '-', '-', 'STANDBY', '2005', '-', '-', '-', NULL, NULL, 1),
	(22, 1, 3, 'SA3398M', 'ACTIVE', 'TOYOTA', 'HILUX SURF', '1KZ-0161794', 'LN130-0095797', '-', '-', '-', 'LO CHEE LIONG', '1992', '-', '-', '-', NULL, NULL, 1),
	(23, 1, 3, 'SAA356V', 'ACTIVE', 'PROTON', 'SAGA B-LINE 1.3', 'S4PEPD6437', 'PL1BT3SNR8B027593', '-', '-', '-', 'UNCLE CHONG - GUDANG ABUK', '2008', '-', '-', '-', NULL, NULL, 1),
	(24, 1, 6, 'SAA3741P', 'ACTIVE', 'KIA', 'PREGIO FPGDH55', 'J2455005', 'PNAKF5S036N003190', '-', '-', '-', 'CATCHING TEAM USED (RICHMOND)', '2006', '-', '-', 'CHANGE OF OWNERSHIP FROM 88 RETAILER TO EPCS ON (________________________)', NULL, NULL, 1),
	(25, 1, 3, 'JKL3809 (NEW)', 'ACTIVE', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB 2.5MT', '2KD9902310', 'PN133JV2508010632', '-', '-', '-', 'RAYMOND LOH', '2007', '-', '-', '-', NULL, NULL, 1),
	(26, 1, 3, 'SA3935U', 'ACTIVE', 'TOYOTA', 'L/CRUISER HDJ81V', '1HD-0134771', 'HDJ81-0073105', '-', '-', '-', 'WONG KOK PING', '1997', '-', '-', 'IISB SEWA (JUL,2018)', NULL, NULL, 1),
	(27, 1, 5, 'SAC4108B', 'ACTIVE', 'TOYOTA', 'FORK LIFT -7FBR18', 'RC28276', '7FBR18-53376', '-', '-', '-', 'KILANG POTONG [MADAM WONG]', '2016', 'Orix Credit Myr S/B', '-', 'KAD MASIH SAMA BANK TANYA FINANCE UNDER BANK MANA', NULL, NULL, 1),
	(28, 1, 5, 'QAQ4346', '-', 'TOYOTA', 'FORKLIFT ~ 7FBR15', 'RA05384', '906', '-', '-', '-', 'C03 - Cold Room', '2007', '-', '-', 'TIDAK TAU APA KEJADIAN KAD TIADA ', NULL, NULL, 1),
	(29, 1, 1, 'SAB4325X', 'ACTIVE', 'DNC ASIATIC HOLDING SDN BHD', 'DEMAK EX 90', 'PMDD147FMFE713215', 'PMDDLMPF8FE713251', '-', '-', '-', 'FARM SALUT  C & CA (widayat)', '2014', '-', '-', '-', NULL, NULL, 1),
	(30, 1, 6, 'SS4465C', 'ACTIVE', 'TOYOTA', 'LITE ACE WINDOW VAN', '5K-9048892', 'KM36-9020352', '-', '-', '-', 'CATCHING TEAM USED (RICHMOND)', '1991', '-', '-', '-', NULL, NULL, 1),
	(31, 1, 2, 'SA4510T', 'ACTIVE', 'ISUZU', 'NPR596-03A', '4BD1-554740', 'JAANPR59PM7109181', '-', '-', '-', 'BANTAYAN FARM - HENDRY GABRIEL', '1996', NULL, NULL, '-', NULL, NULL, 1),
	(32, 1, 6, 'SAA4832X', 'ACTIVE', 'KIA PREGIO', 'KIA', 'J2-362207', 'KNHTR731247139650', '-', '-', '-', 'HAZLAN BIN SAIB (BUDAK SEKOLAH)', '2003', '-', '-', '-', NULL, NULL, 1),
	(33, 1, 5, 'SAA 456 U', '-', 'TOYOTA', 'FORKLIFT ~ 7FBR18', '/41113', '7FBR18-13613', '-', '-', '-', 'C02 - Cold Room', '2008', '-', '-', 'TIDAK TAU APA KEJADIAN KAD TIADA ', NULL, NULL, 1),
	(34, 1, 6, 'SA5010M', 'ACTIVE', 'TOYOTA', 'LH113R-RRMRS HIACE WINDOW VAN', '3L-2776717', 'LH113-8002764', '-', '-', '-', 'DAIM (ANGKAT BUDAK SEKOLAH)', '1991', '-', '-', '-', NULL, NULL, 1),
	(35, 1, 5, 'SAB524R (NEW)', '-', 'TOYOTA', '62-8FD25', '1DZ0244059', '608FD25-39354', '-', '-', '-', 'STORE', '2012', 'AMBANK [M] BERHAD', '-', '-', NULL, NULL, 1),
	(36, 1, 2, 'SA5369M', 'ACTIVE', 'TOYOTA', 'LY50 HIACE PICK UP', '2L-1977857', 'LY50-0020390', '2850', '1590', '1260', 'Timbok Impian - Humphery (exchange with ST1311B)', '1989', '-', '-', 'PINDAH DI FARM ULU TEMPAT PETER WONG SBB ULU PERLU GUNA LORI YG LEBIH BESAR UNTUK ANGKAT BARANG', NULL, NULL, 1),
	(37, 1, 5, 'BLH5494', 'ACTIVE', 'TOYOTA', '62-8FD25', '1DZ0223591', '608FD25-35279', '-', '-', '-', 'KILANG POTONG [MADAM WONG]', '2011', '-', '-', '-', NULL, NULL, 1),
	(38, 1, 3, 'SA5755Y', 'ACTIVE', 'FORD COURIER 4X4', 'FORD UT2G FM1 COURIER CREW CAB', 'WL173584', 'SZCWYC24456', '-', '-', '-', 'HIEW KIM SING', '2000', '-', '-', 'Change of ownership under EPCS', NULL, NULL, 1),
	(39, 1, 3, 'SAB5935J', 'ACTIVE', 'ISUZU', 'TFR54HD1', '4JA1-186621', 'JAATFR54HB7111066', '-', '-', '-', 'JIMMY KOH CHEE VUI', '2012', '-', '-', '-', NULL, NULL, 1),
	(40, 1, 2, 'SAA6173T', 'ACTIVE', 'ISUZU', 'NPR66 (RB/AA/P-MOD)', '4HF1-171419', 'NPR66P-7400126', '5000', '2780', '2220', 'SALUT AB - SAFARINA (SUPERVISOR) - ZAINAL', '2008', '-', '-', '-', NULL, NULL, 1),
	(41, 1, 3, 'SA6383A', 'ACTIVE', 'TOYOTA', 'CROWN', '2L-3229609', 'LS110-000219', '-', '-', '-', 'ADMIN STANDBY', '1979', '-', '-', '-', NULL, NULL, 1),
	(42, 1, 5, 'SAA 6675 F', '-', 'TOYOTA', 'FORKLIFT ~ 6FBRE16', 'B6911021', '6FBRE16-32245', '-', '-', '-', 'C01 - Cold Room', '2003', '-', '-', 'TIDAK TAU APA KEJADIAN KAD TIADA ', NULL, NULL, 1),
	(43, 1, 5, 'SAB7033M', 'ACTIVE', 'TOYOTA', 'FORKLIFT - 7FBR18', 'RC02804', '7FBR18-50352', '-', '-', NULL, 'STOR', '2012', '-', '-', '-', NULL, NULL, 1),
	(44, 1, 4, 'SS7166V (NEW)', 'ACTIVE', 'HITACHI', 'ZX33U-5A', 'N7215', 'HCMADB90H00032497', '-', '-', '-', 'FARM PENIANG', '2014', 'Orix Credit Myr S/B', '-', 'KAD SAMA BANK MAHU TANYA FINANCE UNDER BANK MANA', NULL, NULL, 1),
	(45, 1, 5, 'SA7697E', '-', 'KOMATSU', 'FORKLIFT- FD30-8', 'C240-617797', '141739', '-', '-', '-', 'L01 - Loading Bay', '1984', '-', '-', 'TIDAK TAU APA KEJADIAN KAD TIADA ', NULL, NULL, 1),
	(46, 1, 2, 'ST7999D', 'ACTIVE', 'TOYOTA', 'LY100R-TBMBS3 DYNA HI-ACE P-UP', '2L-9296849', 'LY100-0001703', '2400', '1530', '870', 'FARM TAMPARULI (CHAI KIN FATT)', '1995', '-', '-', 'JADIMA PINJAM TP PARKING DI WORKSHOP (TIDAK PERLU RENEW INSURANCE/ROAD TAX/PUSPAKOM - OFF ROAD- VERBALLY BY ARTHUR)', NULL, NULL, 1),
	(47, 1, 8, 'SA8201T', 'ACTIVE', 'ISUZU', 'TFR54H', '4JA1-280062', 'JAATFR54HT7110199', '-', '-', '-', 'ANTON VACCINE', '1996', '-', '-', '-', NULL, NULL, 1),
	(48, 1, 2, 'ST8225D', 'ACTIVE', 'TOYOTA', 'L/Truck', '3L-3133862', 'LY100-0001811', '2400', '1670', '730', 'AIDIL', '1995', '-', '-', '-', NULL, NULL, 1),
	(49, 1, 2, 'SA8393H', 'ACTIVE', 'TOYOTA', 'L/Truck', '2L-3654993', 'LH80-0015855', '2400', '1530', '870', 'HENDRY GABRIEL', '1988', '-', '-', '-', NULL, NULL, 1),
	(50, 1, 3, 'SS8700N', 'ACTIVE', '(N)TOYOTA', 'HDJ101 LAND CRUISER', '1HD-0195627', 'HDJ101-0019087', '-', '-', '-', 'WONG HUE SUAN', '1998', '-', '-', '-', NULL, NULL, 1),
	(51, 1, 2, 'SAA8935H', 'ACTIVE', 'DAIHATSU', 'DELTA V58R-HS', 'DL652647', 'V58B63411', '4500', '2580', '1920', 'HANGUS TERBAKAR', '2004', '-', '-', 'LORRY TERBAKAR LAMA SUDA [KAD TIDAK TAU P MANA, KALI SUDA CLAIM TOTAL LOSS KAD SAMA BANK ', NULL, NULL, 1),
	(52, 1, 3, 'SAB8935J', 'ACTIVE', 'ISUZU ', 'TFR54HD1', '4JA1-182601', 'JAATFR54HB7111018', '-', '-', '-', 'CHAN PIK LAN (MAMA)', '2012', 'PUBLIC BANK', '-', '-', NULL, NULL, 1),
	(53, 1, 6, 'ST8920C', 'ACTIVE', 'TOYOTA', 'TOYOTA HIACE W/VAN', '2L-2230970', 'LH113-8002483', '-', '-', '-', 'TUDIKI BIN LABA (ANGKAT BUDAK SEKOLAH)', '1991', '-', '-', '-', NULL, NULL, 1),
	(54, 1, 3, 'SAA9935T', 'ACTIVE', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB 2.5 AT', 'IJZ-6071842', 'PN133JV2508510015', '-', '-', '-', 'JAPAR KURONG', '2008', '-', '-', '-', NULL, NULL, 1),
	(55, 1, 3, 'SAB9935P', 'ACTIVE', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB 2.5 MT', '2KDU317510', 'PN133JV2508277532', '-', '-', '-', 'ANDY CHONG', '2013', 'RHB Bank Berhad', '-', '-', NULL, NULL, 1),
	(56, 1, 3, 'SD9935L', 'ACTIVE', 'ISUZU', 'UCS86GGR-TLUH', '4JK1NG3207', 'MPAUCS86GFT001681', '-', '-', '-', 'LING HENG CHIONG', '2015', 'PUBLIC BANK BERHAD', '-', 'KAD MASIH SAMA BANK-UNDER PUBLIC BANK, KALAU MAHU AMBIL KAD BUAT SURAT KUASA AMBIL KAD TUJUAN RENEW ROADTAX', NULL, NULL, 1),
	(57, 1, 3, 'SB8885C', 'ACTIVE', 'AUDI', 'AUDI Q7 4.2 (A)', 'CCF008225', 'WAUZZZ4L0DD004079', '-', '-', '-', 'WONG KOK PING', '2012', '-', '-', '-', NULL, NULL, 1),
	(58, 3, 5, 'JJH 2953', '-', 'TOYOTA', 'Fork Lift ~ 5FD25', '1Z-0017127', '5FD25-22343', '-', '-', '-', 'F01 - FEEDMILL', '2002', '-', '-', 'TIDAK TAU APA KEJADIAN KAD TIADA ', NULL, NULL, 1),
	(59, 3, 5, 'SAC348B (NEW)', 'ACTIVE', 'TOYOTA', 'FORK LIFT - 62-8FD30', '1DZ0316997', '608FDJ35-64038', '-', '-', '-', 'FEEDMILL', '2016', 'ORIX CREDIT MALAYSIA SB', '-', 'KAD MASIH SAMA BANK TANYA FINANCE UNDER BANK MANA', NULL, NULL, 1),
	(60, 3, 5, 'SAC349B (NEW)', 'ACTIVE', 'TOYOTA', 'FORK LIFT 62-8FD30', '1DZ0314510', '608FDJ35-63348', '-', '-', '-', 'FEEDMILL', '2016', 'ORIX CREDIT MALAYSIA SB', '-', 'KAD MASIH SAMA BANK TANYA FINANCE UNDER BANK MANA', NULL, NULL, 1),
	(61, 3, 5, 'SAC351B (NEW)', 'ACTIVE', 'TOYOTA', 'FORK LIFT 62-8FD30', '1DZ0317695', '608FDJ35-64089', '-', '-', '-', 'FEEDMILL', '2016', 'ORIX CREDIT MALAYSIA SB', '-', 'KAD MASIH SAMA BANK TANYA FINANCE UNDER BANK MANA', NULL, NULL, 1),
	(62, 3, 2, 'WDK 528(OFF ROAD)', 'ACTIVE', 'TOYOTA', ' DYNA HI-ACE LH80R-MDB3', '2L-3031226', 'LH80-0062645', '2400', '1580', '820', 'MR. PHANG ?? - LING FOO SIN', '1994', '-', 'EPPF', 'OFF ROAD TIDAK PERLU RENEW INSURANCE & ROAD TAX', NULL, NULL, 1),
	(63, 3, 4, 'SAA5282F', '-', 'HITACHI', 'Excavator ~ EX120-1', '4BD1-973729', '12H-25001', '-', '-', '-', 'SALUT RESTAURANT', '1999', '-', '-', 'TIDAK TAU APA KEJADIAN KAD TIADA ', NULL, NULL, 1),
	(64, 3, 3, 'SB 618 A', 'ACTIVE', 'TOYOTA', 'HXJ80R-GCPNS', '1HZ-0210036', 'HZJ80-0032474', '-', '-', '-', 'DR. SAFIUL ALAM BHUIYAN', '1997', '-', '-', 'start 12.10.2018 repair and maintenance under Impian Interaktif', NULL, NULL, 1),
	(65, 3, 3, 'ST6322J ', 'ACTIVE', 'HYUNDAI', 'ACCENT 1.5L (A)', 'G4EB3706786', 'MHC03G706755', '-', '-', '-', 'STANDBY CAR (ADMIN)', '2005', '-', '-', '-', NULL, NULL, 1),
	(66, 3, 3, 'SAA6668G', 'ACTIVE', 'TOYOTA', 'KG-HDJ101K LAND CRUISER', '1HD-0260409', 'HDJ101-0026518', '-', '-', '-', 'WONG WAH PENG', '2004', '-', '-', '-', NULL, NULL, 1),
	(67, 3, 7, 'SAC9227F (NEW)', 'ACTIVE', 'BOBCAT', 'BOBCAT/S450', 'V2203-7HG4835', 'B1E617824', '-', '-', '-', 'FEEDMILL STANDBY DRIVER', '2018', 'ORIX CREDIT MALAYSIA SB', '-', 'Digunakan di dalam kilang feedmill.', NULL, NULL, 1),
	(68, 3, 3, 'SAB9706A (NEW) ', 'ACTIVE', 'ISUZU', 'TFS85HD1 D-MAX 3.0', '4JJ1-GV4211', 'JAATFS85H77106338', '-', '-', '-', 'ALEX LO - BOSS BROTHER IN-LAW', '2010', 'MBB', '-', 'Request cheque & insurance payment under EPPF then Alex Lo will pay back using his own money (bank in the money) - 013-877 1625', NULL, NULL, 1),
	(69, 3, 3, 'SA9855N', 'ACTIVE', 'TOYOTA', 'L.CRUISER HDJ81', '1HD-0001894', 'HDJ81-0000489', '-', '-', '-', 'STANDBY-ARTHUR (WORKSHOP)', '1991', '-', '-', 'CHEN KIM FATT (BEKAS KERETA UNCLE AH FATT)', NULL, NULL, 1),
	(70, 3, 3, 'SAA9935E', 'ACTIVE', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB (M)', '2L1982576', 'KDN165-0022803', '-', '-', '-', 'WONG YAU SIN', '2003', '-', '-', 'EPCS SEWA - Wong Yau Sin guna temporarily', NULL, NULL, 1),
	(71, 3, 3, 'SM9935 (NEW)', 'ACTIVE', 'TOYOTA', 'TOYOTA FORTUNER 2.4 AT 4X2', '2GD0491387', 'PN1GB3GS302400124', '-', '-', '-', 'ANTHONY ASTRAL (FEEDMILL MANAGER)', '2018', 'HONG LEONG BANK BHD', '-', '-', NULL, NULL, 1),
	(72, 3, 3, 'SYE3880 (NEW)', 'ACTIVE', 'PROTON', 'X70 1.8 TGDI PREMIUM 2WD', '4G18TDBK4CB0506451', 'L6T7742Z6KUO49486', '-', '-', '-', 'STANDBY DRIVER BY WWP', '2019', '-', '-', NULL, NULL, NULL, 1),
	(73, 3, NULL, 'SYF2048 (NEW)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
	(74, 3, NULL, 'SMB6849 (NEW)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL, 'pay cash by company - no loan with bank', NULL, NULL, 1),
	(75, 13, 2, 'SAA2935R', 'ACTIVE', 'ISUZU', 'NPR70 (RB/HS L1)', '4HG1 - 392649', 'NPR70L-7401321', '7000', '3950', 'SAB935U', 'SULTAN', '2007', '-', '-', 'PERMIT HAS BEEN CHANGE TO BSR PERMIT BECAUSE THE LORRY BDM IS 7000 (LPKP-ANY LORRY BDM BELOW 7500 COMPULSORY TO CHANGE THE PERMIT LPKP TO BSR)', NULL, NULL, 1),
	(76, 13, 2, 'SAA3202M', 'ACTIVE', 'ISUZU', 'NPR66L RB/BL-/PMOD', '4HF1194952', 'NPR66L-7405257', '5000', '3160', '1840', 'TIMBOK IMPIAN - HUMPHERY CHONG (AH FUI) - YOSEP', '2005', '-', '-', '-', NULL, NULL, 1),
	(77, 13, 2, 'SAA4719B', '-', 'MITSUBISHI', 'TRUCK FB511B8RDG1', '4D32-513616', 'FB511B-A41535', '4500', '2010', '2490', 'FARM TAMBULAUNG INDUK', '2001', 'PBB', '-', 'KOBOS FARM JUAL BAGI IISB - CUMA JUAL BEGITU SAJA TIADA PUSPAKOM&JPJ (LORI LAMA)', NULL, NULL, 1),
	(78, 13, 2, 'SAB5935L ', '', 'HINO  (CHICK)', 'XZU423R-HKMRD3 (UBS)', 'N04CTT20988', 'JHFYT20H607001128', '8300', '4290', '4010', 'SUHAIMI BIN BASAR', '2010', '-', '-', '-', NULL, NULL, 1),
	(79, 13, 2, 'PCQ5250  ', 'ACTIVE', 'NISSAN (CHICK)', 'CMF 88H', 'FE6-007987B', 'CMF88H-03688', '10000', '5100', '4900', 'STANDBY LORRY', '1993', '-', '-', '-', NULL, NULL, 1),
	(80, 13, 3, 'WMW5939 (NEW)', 'ACTIVE', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB 2.5L', '2KD-9455650', 'PN133JV2509001357', '-', '-', '-', 'ADMIN STANDBY DRIVER', '2005', '-', '-', '-', NULL, NULL, 1),
	(81, 13, 2, 'SA 607 L', '-', 'TOYOTA', 'DYNA HIACE LH80R-MDB3', '2L-2450803', 'LH80-0040429', '2400', '1860', '540', 'FARM IMPIAN', '1990', '-', '-', 'KOBOS FARM JUAL BAGI IISB - CUMA JUAL BEGITU SAJA TIADA PUSPAKOM&JPJ (LORI LAMA)', NULL, NULL, 1),
	(82, 13, 3, 'SAB6935J (NEW)', 'ACTIVE', ' ISUZU', 'TFR54HD1', '4JA1-202358', 'JAATFR54HB7111157', '-', '-', '-', 'LIAN IBAN (Org Ping2)', '2012', 'PUBLIC BANK', '-', '-', NULL, NULL, 1),
	(83, 13, 2, 'PEJ7265', 'ACTIVE', 'NISSAN', 'YU41H4', 'FD46-010101', 'YU41H4-050131', '5000', '2950', '2050', 'AH HO', '1999', '-', '-', '-', NULL, NULL, 1),
	(84, 13, 3, 'SAB7935V (NEW)', 'ACTIVE', 'ISUZU', 'ISUZU - ISUZU TFR86JDR-RLPH', '4JK1-1B3461', 'MPATFR86JEG001199', '-', '-', '-', 'MR SONG (CONTRACT FARM - SANDAKAN)', '2014', 'PUBLIC BANK BERHAD', '-', 'RENT BY EPCS - 15.12.2019', NULL, NULL, 1),
	(85, 13, 2, 'PDG8381 ', 'ACTIVE', 'NISSAN (CHICK)', 'CMF 88H', 'FE6-012767A', 'CMF88H-06364', '10000', '5390', '4610', 'DELANI', '1995', '-', '-', '-', NULL, NULL, 1),
	(86, 13, 1, 'SAB8959G (NEW)', NULL, 'HONDA', 'Motorbike ~ C100B (97 s.p)', 'HA13E-6156974', 'PMKHA1320BB156728', '-', '-', '-', 'FARM TIMBOK TELUR AB (ANTON)', '2011', '-', '-', 'FROM HATCHERY TO TIMBOK FARM', NULL, NULL, 1),
	(87, 13, 3, 'SA935A', 'ACTIVE', 'TOYOTA', 'Station Wagon Land Cruiser BJ60', '2H-1211020', 'BJ60-013505', '2700', '2140', '560', 'JUR-AMIN', '1984', '-', '-', '-', NULL, NULL, 1),
	(88, 13, 1, 'SU935B', 'ACTIVE', 'HONDA', 'Motorbike ~ C100', 'HA13E-4019528', 'PMKHA13209B019849', '-', '-', '-', 'WAN AZMI (OFFICE BOY)', '2009', '-', '-', '-', NULL, NULL, 1),
	(89, 13, 3, 'SAA936A', 'ACTIVE', 'FORD', 'RANGER DOUBLE CAB 4X4 2.5TD', 'WL422062', 'SZCWYL26198', '-', '-', '-', 'JUSLIN', '2000', '-', '-', '-', NULL, NULL, 1),
	(90, 13, 3, 'SAA9935F', 'ACTIVE', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB (M)', '3L-5421675', 'LN166-0121311', '-', '-', '-', 'HUMPERY CHONG', '2004', '-', '-', '-', NULL, NULL, 1),
	(91, 6, 2, 'SAA1481R', 'ACTIVE', 'NISSAN', 'MK211 (RB/JE 107)', 'FE6-201601E', 'MK211H-20273', '12000', '4560', '7440', 'LOGISTICS STANDBY DRIVER', '2007', '-', '-', 'REUSED PERMIT TOTAL LOSS (SAA9935K)', NULL, NULL, 1),
	(92, 6, 2, 'ST1523D', '-', 'TOYOTA', 'DYNA HIACE PICK UP', '2L-9070821', 'LH80-0057169', '2400', '1640', '760', 'WORKSHOP', '1993', '-', '-', '-', NULL, NULL, 1),
	(93, 6, 8, 'ST1967C', 'ACTIVE', 'TOYOTA', 'HILUX 4X4 PICK UP', '2L2082546', 'LN65-9102077', NULL, NULL, NULL, 'MALBERT MOIDI', '1988', '-', '-', 'JADIMA SEWA - 31.05.2014 (KOBOS JUAL BAGI JSB)', NULL, NULL, 1),
	(94, 6, 3, 'SAA1935A', 'ACTIVE', 'TOYOTA', 'LN166 HILUX DOUBLE CAB 4X4', '1KZ0218089', 'LN166-0047942', '-', '-', '-', 'WONG YAU SIN', '2000', '-', '-', '-', NULL, NULL, 1),
	(95, 6, 3, 'SAA1935H', 'ACTIVE', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB (M)', '3L-5536851', 'LN166-0136181', '-', '-', '-', 'CHANG VUI LOI (ANGAH)', '2004', '-', '-', '-', NULL, NULL, 1),
	(96, 6, 3, 'WRR226 (NEW)', 'ACTIVE', 'TOYOTA', 'TOYOTA HILUX SINGLE CAB 2.5 MT', '2KD6157349', 'PN131JV2508002824', '-', '-', '-', 'CHAI KIN FATT', '2008', '-', '-', '-', NULL, NULL, 1),
	(97, 6, 3, 'SAA2935H', 'ACTIVE', 'TOYOTA', 'HILUX DOUBLE CAB', '3L-5549542', 'LN166-0138263', '-', '-', '-', 'CHRISTOPHER', '2004', '-', '-', 'EPCS SEWA - 01.12.2015', NULL, NULL, 1),
	(98, 6, 6, 'SA3448R', 'ACTIVE', 'NISSAN', 'Vanette Van', 'A15297744A', 'VPC22-861505', '-', '-', '-', 'MIKAEL ARING - LOGISTICS STANDBY DRIVER', '1995', NULL, '-', '-', NULL, NULL, 1),
	(99, 6, 2, 'SAB3935W', 'ACTIVE', 'NISSAN', 'MK211 (RB/LA 056)', 'FE6-110492E', 'MK211K-12084', '12000', '5710', '6290', 'JINOLLY', '2014', 'Orix Credit Myr S/B', '-', '-', NULL, NULL, 1),
	(100, 6, 2, 'SA4597V', 'ACTIVE', 'NISSAN', 'CMF89H CARGO TRUCK', 'FE6-014941C', 'CMF89H-00042', '10000', '5340', '4660', 'LOGISTICS STANDBY DRIVER', '1997', '-', '-', '-', NULL, NULL, 1),
	(101, 6, 3, 'JKB4781 (NEW)', 'ACTIVE', 'TOYOTA', 'TOYOTA HILUX DOUBL CAB 2.5 AT', '2KD9687232', 'PN133JV2508503219', '-', '-', '-', 'PETER YU', '2006', '-', '-', '-', NULL, NULL, 1),
	(102, 6, 3, 'SAA5935P', 'ACTIVE', 'TOYOTA', 'HILUX DOUBLE CAB 2.5 AT', '2KD9884672', 'PN133JV2508505523', '-', '-', '-', 'STANDBY (ROBERT WWP SON IN-LAW USED)', '2007', '-', '-', '2010 kobos jual bagi jadima (RM1,735.15)', NULL, NULL, 1),
	(103, 6, 3, 'SK5507', 'ACTIVE', 'TOYOTA', 'HILUX DOUBLE CABIN 4X4 PICK UP', '3L-4865098', 'LN166-0036368', '-', '-', '-', 'TANG YEO JEO', '2000', '-', '-', '-', NULL, NULL, 1),
	(104, 6, 3, 'WC6392D (NEW)', 'ACTIVE', 'TOYOTA', 'VELLFIRE (A)', '2GR0595325', 'GGH25-8004590', '-', '-', '-', 'WONG WAH PENG', '2008', '-', '-', '-', NULL, NULL, 1),
	(105, 6, 1, 'SAA6453F', '-', 'BULLOCKS (M) S/B', 'MOTOBIKE  - NITRO NU 125', 'NT1P52FMI*30172860', 'NT3XCJVD63AS07303', '-', '-', '-', 'TAMPARULI FARM', '2003', '-', '-', '-', NULL, NULL, 1),
	(106, 6, 1, 'SAA6751N', '-', 'MOFAZ MOTOSIKAL S/B', 'MOTORBIKE ~ STAR SS110', 'SU110HX5M06070110', 'SUFX506074F0134AT', '-', '-', '-', 'TAMPARULI FARM', '2006', '-', '-', '-', NULL, NULL, 1),
	(107, 6, 3, 'SK7223 (TOTAL LOSS)', 'ACTIVE', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB 2.5 MT', '2KD6146121', 'PN133JV2508016215', '-', '-', '-', 'LO CHEE LIONG', '2008', '-', '-', '-', NULL, NULL, 1),
	(108, 6, 2, 'SB8366 (TOTAL LOSS)', 'ACTIVE', 'NISSAN', 'CM87KA C/W BASIN', 'FE6-017518B', 'CM87KA-07274', '9950', '4510', '5440', 'WALTER EDIP', '1993', '-', '-', '-', NULL, NULL, 1),
	(109, 6, 3, 'SAA7391M (NEW)', 'ACTIVE', 'TOYOTA', 'TOYOTA FORTUNER 2.5G (D) M/T', '2KD9697489', 'PN111JV5000001539', '-', '-', '-', 'STANDBY ADMIN - TEMPORARY', '2006', '-', '-', '-', NULL, NULL, 1),
	(110, 6, 3, 'SAC8649B', 'ACTIVE', 'PROTON SAGA', 'PROTON SAGA FL 1.3 (AUTOMATIK)', 'S4PEVA5530', 'PL1T3STRGB541777', '-', '-', '-', 'CHIEN KIN FATT\'S FAMILY', '2016', 'PUBLIC BANK', '-', 'CHIEN KIM FATT (KERETA MASIH DGN KELUARGA MENDIANG-PENDING ARTHUR SAMA ADA INI KERETA COMPANY AKAN AMBIL BALIK ATAU X)', NULL, NULL, 1),
	(111, 6, 2, 'SAB8935A', 'ACTIVE', 'NISSAN', 'PK251 (RB/FP RG2)', 'FE6-402621D', 'PK251TZ-20185', '16000', '6030', '9970', 'JOHN USIN', '2009', 'Orix Credit Myr S/B', NULL, '-', NULL, NULL, 1),
	(112, 6, 2, 'SAA9935K (TOTAL LOSS)', 'ACTIVE', 'NISSAN', 'NU41H5', 'FD46-025184', 'NU41H5-051256', '7500', '3580', '3920', 'JEFFRY', '2004', '-', '-', '-', NULL, NULL, 1),
	(113, 6, 1, 'OFF ROAD[FARM]', '-', 'DNC ASIATIC HOLDING SDN BHD', 'DEMAK EX 90 [NEW]', 'PMDD147FMFE507292', 'PMDDLMPFE507333', '-', '-', '-', 'CHAI KIN FATT', '2014', '-', '-', 'KAD TIADA PASAL NIE MOTOR PAKAI HANYA D LADANG JADIMA TAMPARULI, RUJUK BOS CHAI KIN FATT', NULL, NULL, 1),
	(114, 6, 3, 'SAB8296P', 'ACTIVE', 'TOYOTA', 'TOYOTA HILUX D/CAB 3.0G ( A )', '1KDU262358', 'MR0FZ29G001684524', NULL, NULL, NULL, 'CHAI KIN FATT', '2013', '-', '-', '-', NULL, NULL, 1),
	(115, 7, 3, 'SAA 2231 T (TOTAL LOSS)', 'ACTIVE', 'MAZDA', 'MAZDA DE2500 WLC 4X4 AT', 'WLAT848852', 'PMZUNY0W4MM100039', '-', '-', '-', 'FIRDAUS', '2007', '-', '-', 'ORIGINAL REGISTRATION CARD HAS BEEN RETURNED TO ALLIANZ BANK', NULL, NULL, 1),
	(116, 7, 3, 'SAA9703N (SOLD TO MUSLIH)', 'ACTIVE', 'ISUZU', 'D-MAX 2.5', '4JA1 - 409838', 'JAATFR54H67101951', '-', '-', '-', 'SOLD TO MUSLI BIN BASAH', '2006', '-', '-', '-', NULL, NULL, 1),
	(117, 7, 3, 'SAB1738M', 'ACTIVE', 'ISUZU', 'TFR54HD1', '4JA1-268898', 'JAATFR54HB7111920', '-', '-', '-', 'FIRDAUS', '2012', '-', '-', '-', NULL, NULL, 1),
	(118, 22, 2, 'SA 938 L', 'ACTIVE', 'ISUZU', 'C/Truck', '4BD1-134782', '7100293', '7000', '3540', '3460', 'HAZLAN', '1991', '-', '-', 'used BSR permit', NULL, NULL, 1),
	(119, 22, 2, 'SA2558X', 'ACTIVE', 'ISUZU', 'FSR11H', '6BG1-791018', 'JALFSR11HP3601496', '11000', '5440', '5560', 'WORKSHOP', '1998', '-', '-', 'IISB STOP RENT ON NOVEMBER,2019', NULL, NULL, 1),
	(120, 22, 2, 'SA2709V', 'ACTIVE', 'NISSAN', 'CPB15NE', 'MD92-001418', 'CPB15NE-01015', '16000', '6480', '9520', 'RASHID BIN SAID', '1997', '-', '-', '-', NULL, NULL, 1),
	(121, 22, 2, 'SA3230N', 'ACTIVE', 'NISSAN', 'DUMP TRUCK', 'RD8-025169', 'CW51H-11543', '21000', '10500', '10500', 'STAND-BY ', '1988', '-', '-', '-', NULL, NULL, 1),
	(122, 22, 2, 'SA3591N (TOTAL LOSS)', 'ACTIVE', 'NISSAN ', 'CM87H TRUCK', 'FE6-120029B', 'CM87H-00752', '9950', '4690', '5260', 'PADIN', '1991', '-', '-', '-', NULL, NULL, 1),
	(123, 22, 2, 'SA 3937 M (TOTAL LOSS)', 'ACTIVE', 'NISSAN ', 'CPB15N', 'NE6-010893T', 'CPB15N-01757', '16000', '7800', '8200', 'HAMRAN BIDIN', '1991', '-', '-', '-', NULL, NULL, 1),
	(124, 22, 2, 'SA5935V', 'ACTIVE', 'NISSAN', 'CPB15NE', 'FE6-209072C', 'CPB15NE-01127', '16000', '6480', '9520', 'BASRI BIN NUR', '1997', '-', '-', '-', NULL, NULL, 1),
	(125, 22, 2, 'ST6800C (SOLD TO ISKANDAR', 'ACTIVE', 'ISUZU', 'LIGHT TRUCK', '222932', '7103020', '7000', '2765', '4235', 'JUAL SAMA MANSYUR[DRIVER]-ISKANDAR', '1990', '-', '-', 'PERMIT LORRY LPKP BELUM TUKAR NAMA LAGI', NULL, NULL, 1),
	(126, 22, 2, 'SB8202', 'ACTIVE', 'NISSAN ', 'CM87K-TRUCK', 'FE6-301837D', 'CM87K-05758', '9950', '4410', '5540', 'ALIMUDIN MADA', '1993', '-', '-', '-', NULL, NULL, 1),
	(127, 22, 2, 'SAA8935K', 'ACTIVE', 'DAIHATSU', 'DELTA V116-HA', '14B1783632', 'JDA00V11600A06585', '5000', '2980', '2020', 'TUDIKI', '2005', '-', '-', '-', NULL, NULL, 1),
	(128, 22, 2, 'ST9199C', 'ACTIVE', 'NISSAN', 'CMF88H', 'FE6-009680A', 'CMF88H-01977', '10000', '5210', '4790', 'IBNO', '1991', '-', '-', '-', NULL, NULL, 1),
	(129, 4, 3, 'EU 111', 'ACTIVE', '(N) VOLKSWAGEN', 'Passat 2.0 (A)', 'CCZ141796', 'WVWZZZ3CZBE751256', '-', '-', '-', 'MDM JENNIFER LO', '2011', 'MBB (inanam)', '-', '-', NULL, NULL, 1),
	(130, 4, 3, 'SD2696A', 'ACTIVE', 'DACHENG POULTRY FARM (S) S/B', 'TOYOTA BJ60', '3B1031335', 'BJ60022342', '2500', '1450', '1050', 'LERYSAM', '1989', 'MBF Finance Berhad', 'SMESB', 'LASB SEWA', NULL, NULL, 1),
	(131, 4, 3, 'SAB 386 F', 'ACTIVE', '(N) TOYOTA', 'KG-HDJ101K', '1HD-0152925', 'HDJ101-0004189', '-', '-', '-', 'KONG LIH SHAN', '1998', '-', '-', '-', NULL, NULL, 1),
	(132, 4, 3, 'SAB4357H', 'ACTIVE', 'NISSAN', 'Datsun 120V Station Wagon', 'A12-254648D', 'VB310-A10998', '-', '-', '-', 'MS WONG [STAND BY MARKETING]', '1979', '-', '-', 'TIDAK PERLU LAGI RENEW INSURANCE AND ROAD TAX', NULL, NULL, 1),
	(133, 4, 3, 'LD5030', 'ACTIVE', 'HONDA', 'CR-V 2.0L I-VTEC (A)', 'R20A16804716', 'PMHRE2850AD704656', NULL, NULL, NULL, 'FLORA CHONG', '2010', '-', '-', '-', NULL, NULL, 1),
	(134, 4, 3, 'SAA5736F', 'ACTIVE', 'PERODUA ', 'KENARI EZ (AUTO)', 'A284919', 'PM2L902S002059771', '-', '-', '-', 'FAIZAL GUNA (TEMPORARY)', '2004', '-', '-', '-', NULL, NULL, 1),
	(135, 4, 8, 'SA6084V', 'ACTIVE', 'ISUZU', 'TFR54H PICK UP', '4JB1-408047', 'JAATFR54HT7121985', '-', '-', '-', 'STANDBY ADMIN', '1997', '-', '-', 'EPCS SEWA - OKTOBER, 2016 (DRIVER YANG SAMA SEBELUM DAN SELEPAS KENA KC SEWA)', NULL, NULL, 1),
	(136, 4, 3, 'SD6376B', 'ACTIVE', '(N) TOYOTA', 'LN166R HILUX D/CABIN', '1KZ-0251905', 'LN166-0034513', '-', '-', '-', 'STANBY ', '1999', '-', '-', '-', NULL, NULL, 1),
	(137, 4, 3, 'SK7673', 'ACTIVE', 'PERODUA', 'KANCIL 660 EX (MANUAL)', 'M242374', 'PM2L200S002244724', '-', '-', '-', 'STANDBY ADMIN', '2002', '-', '-', '-', NULL, NULL, 1),
	(138, 4, 3, 'SU7782A', 'ACTIVE', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB 2.5L', '2KD9690435', 'PN133JV2508501841', '-', '-', '-', 'LIN FOO PHIN', '2006', 'PBB', '-', '-', NULL, NULL, 1),
	(139, 4, 3, 'SAA8704C (TOTAL LOSS)', 'ACTIVE', 'MAZDA', 'B2500 CREW CAB 4X4 2.5TD M5', 'WLAT309831', 'UNYOW1MM002065', '-', '-', '-', 'ANTON RAHMAN', '2002', '-', '-', 'TOTAL LOSS KAD SUDA BG SAMA BANK ALLIANZ', NULL, NULL, 1),
	(140, 4, 3, 'ST8885R', 'ACTIVE', '(N) VOLKSWAGEN', 'Touareg 3.6 (A)', 'CGR010902', 'WVGZZZ7PZCD006845', '-', '-', '-', 'MDM JENNIFER LO', '2011', 'MBB (inanam)', '-', '-', NULL, NULL, 1),
	(141, 4, 3, 'ST8885W', 'ACTIVE', 'TOYOTA', 'TOYOTA COROLLA ALTIS 2.0V [A]', '3ZRX116924', 'MR053REE304505308', '-', '-', '-', 'WONG WAH PENG', '2011', '-', '-', '-', NULL, NULL, 1),
	(142, 4, 3, 'SAC8935A', 'ACTIVE', 'ISUZU', 'UCS86GGR-TLUH', '4JK1NM1425', 'MPAUCS86GFT001871', '-', '-', '-', 'ALBERT LAU', '2015', 'PUBLIC BANK BERHAD', '-', 'KAD MASIH SAMA BANK TANYA FINANCE UNDER BANK MANA, KALAU MAHU AMBIL KAD BUAT SURAT KUASA AMBIL KAD TUJUAN RENEW ROADTAX', NULL, NULL, 1),
	(143, 16, 1, 'SD1630L(NEW)', 'ACTIVE', 'DEMAK EX 90', 'DEMAK EX 90', 'PMDD147FMFE507293', 'PMDDLMPF2FE507164', '-', '-', '-', 'STANDBY MOTOR - ADMIN', '2014', '-', '-', '-', NULL, NULL, 1),
	(144, 16, 3, 'SAB9705W', 'ACTIVE', 'TOYOTA', 'TOYOTA ESTIMA /W/VAN', '2AZH642949', 'ACR50-7099799', '-', '-', '-', 'VOO SIOK LING @ MISS VOO', '2011', 'MALAYAN BANKING BERHAD', '-', '-', NULL, NULL, 1),
	(145, 16, 3, 'SAB8935V', 'ACTIVE', 'ISUZU', 'ISUZU - ISUZU TFR86JDR-RLPH', '4JK1-1B3472', 'MPATFR86JEG001200', '-', '-', '-', 'WILLIAM SANDAKAN (LASB SEWA)', '2014', 'PUBLIC BANK BERHAD', '-', 'EPPF SEWA START BULAN 02.05.2015 (TIDAK SEWA LAGI START 01.08.2018)', NULL, NULL, 1),
	(146, 16, 3, 'SAB9935V', 'ACTIVE', 'ISUZU', 'ISUZU - ISUZU TFR86JDR-RLPH', '4JK1-1B7121', 'MPATFR86JEG001256', '-', '-', '-', 'DR ARDHY WIDOYOTOMO', '2014', 'PUBLIC BANK BERHAD', '-', '-', NULL, NULL, 1),
	(147, 16, 3, 'SYE3885 (NEW)', 'ACTIVE', 'PROTON', 'X70 1.8 TGDI PREMIUM 2WD', '4G18TDBK5CB0504151', 'L6T7742Z0KU061567', '-', '-', '-', 'STANDBY DRIVER BY WWP', '2019', '-', '-', 'pay cash by company - no loan with bank', NULL, NULL, 1),
	(148, 16, 3, 'SYE3887 (NEW)', 'ACTIVE', 'PROTON', 'X70 1.8 TGDI PREMIUM 2WD', '4G18TDBK4CB0506341', 'L6T7742ZXKUO49488', '-', '-', '-', 'STANDBY DRIVER BY WWP', '2019', '-', '-', 'pay cash by company - no loan with bank', NULL, NULL, 1),
	(149, 20, 4, 'SA1834P', '-', 'HITACHI', 'UH12LC-7', 'EP100T-13178', '157-0761', '-', '-', '-', '-', '1987', '-', '-', 'TIDAK TAU APA KEJADIAN KAD TIADA ', NULL, NULL, 1),
	(150, 20, 4, 'SA7443K', '-', 'HITACHI', 'UH07-7', '6BD1-538411', '164-20841', '-', '-', '-', '-', '1984', '-', '-', 'TIDAK TAU APA KEJADIAN KAD TIADA ', NULL, NULL, 1),
	(151, 20, 1, 'SA7518X', '-', 'HONDA', 'Motorbike ~ C70', 'C70E-M1292147', 'C70-2046588', '-', '-', '-', '-', '1999', '-', '-', 'TIDAK TAU APA KEJADIAN KAD TIADA ', NULL, NULL, 1),
	(152, 20, 1, 'SA7519X', '-', 'HONDA', 'Motorbike ~ C70', 'C70E-M1291905', 'C70-2046498', '-', '-', '-', '-', '1999', '-', '-', 'TIDAK TAU APA KEJADIAN KAD TIADA ', NULL, NULL, 1),
	(153, 19, 3, '223', 'ACTIVE', 'WONG TZE WEE (WWP)', 'AUDI RS7', '-', '-', '-', '-', '-', 'WONG TZE WEE', '2014', '-', '-', 'KERETA PERSENDIRIAN - KLU APA2 BERKAITAN PASAL PAYMENT (INSURANCE & RT) MINTA DGN WWP', NULL, NULL, 1),
	(154, 19, 1, 'SS223W', 'ACTIVE', 'WONG TZE WEE (WWP)', 'DEMAK EX 90', 'PMDD147FMFF302993', 'PMDDLMPF8FF302975', '-', '-', '-', 'WONG TZE WEE', '2015', '-', '-', 'Motor anak bos (WWP) - PAYMENT FOR RT & INSURANCE MINTA WWP', NULL, NULL, 1),
	(155, 19, 3, 'SAB2223U', 'ACTIVE', 'WONG KOK PING', 'HONDA JAZZ HYBRID', 'LDA33905023', 'PMHGP184000005003', '-', '-', '-', 'WONG KOK PING', '2014', '-', '-', 'INSURANCE ROAD TAX RENEWAL MINTA WONG KOK PING @ WWP', NULL, NULL, 1),
	(156, 19, 3, 'SAC2391A', 'ACTIVE', '88 RETAILER SDN BHD', 'ISUZU', '4JKN1NK0804', 'MPAUCS86GFT001770', '-', '-', '-', '88 STANDBY DRIVER', '2015', '-', '-', '88 URUS INSURANCE + ROAD TAX KERETA SENDIRI (DOUBLE CHECK MS LAMINA 88) - ADMIN EP NO HAVE THE ORIGINAL CAR CARD', NULL, NULL, 1),
	(157, 19, 3, 'SA2986T (NEW)', 'ACTIVE', 'PROLIFIC QUALITY SDN BHD', 'TOYOTA', '5K-8003180', 'KM36-9036945', '-', '-', '-', 'PROLIFIC QUALITY SDN BHD STANDBY DRIVER', '1996', '-', '-', 'On 06.09.2017 WWP tell Freddy this car has been handle fully by Prolific it self. Original card has been pass to them', NULL, NULL, 1),
	(158, 19, 1, 'SA6130R', '-', 'SEGAR SELERA SDN BHD', 'HONDA - Motorbike ~ C70', 'C70E-M1243604', 'C70-2008977', '-', '-', '-', 'Where ??', '1995', '-', '-', 'TIDAK TAU APA KEJADIAN KAD TIADA ', NULL, NULL, 1),
	(159, 19, 3, 'QMH7738', 'ACTIVE', 'KONG LIH SHAN', 'HONDA CITY 1.5L(A)', 'L15A2-20000624', 'PMHGD86604D100621', '-', '-', '-', 'KONG LIH SHAN', '2004', '-', '-', 'KERETA PERSENDIRIAN - KLU APA2 BERKAITAN PASAL PAYMENT (INSURANCE & RT) MINTA DGN MR KONG LIH SHAN', NULL, NULL, 1),
	(160, 19, 1, 'LD7799', 'ACTIVE', 'CHUAH SENG HEE', 'HONDA', 'JF22E-0016436', 'PMKJF22909B016367', '-', '-', '-', 'FOO SIU VAN', '2010', '-', '-', 'Owner asal CHUAH SENG HEE (semenanjung) partner bos tp WWP sdh beli ini motor skrg FOO SIU VAN yg pakai - road tax pass bg Arthur Logistics - WWP BAYAR INSURANCE ROAD TAX BY CASH', NULL, NULL, 1),
	(161, 19, 1, 'W885W', 'ACTIVE', 'HONDA[LO SOO FEN]', 'NBC110KD', 'JA28E-6009105', 'PMKJA2820EB008678', '-', '-', '-', 'AHMAD HAJIS', '2013', '-', '-', '-', NULL, NULL, 1),
	(162, 19, 1, 'W8885W', 'ACTIVE', 'DEMAK[WONG TZE WEE]', 'DEMAK EX 90', 'PMDD147FMFE202375', 'PMDDLMPF4FE202541', '-', '-', '-', 'MAINTENANCE HATCHERY (ARIFIN)', '2014', '-', '-', 'HATCHERY FARM WIREMAN GUNA TP ROAD TAX BOLEH PASS BAGI WONG KOK PING SAJA', NULL, NULL, 1),
	(163, 19, 3, 'SA9634R', 'ACTIVE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MISS WONG - MARKETING', NULL, NULL, '-', 'Miss wong marketing yang guna any repair and maintainence is under SME', NULL, NULL, 1),
	(164, 19, 3, 'SAA3669P', 'ACTIVE', 'WONG HUE SUAN', 'NISSAN VANETTE WINDOW VAN', 'A15C086379', 'PN8VPC22JTCA58687', '-', '-', '-', 'STANDBY DRIVER LOGISTICS', '2006', '-', '-', '-', NULL, NULL, 1),
	(165, 19, 3, 'SAA7221W', 'ACTIVE', 'WONG KOK PING', 'TOYOTA/COUPE', '3S--9096949', 'SW20-0003897', '-', '-', '-', 'WONG KOK PING', '1992', '-', '-', 'ROAD TAX INSURANCE PAYMENT MINTA WONG KOK PING', NULL, NULL, 1),
	(166, 19, 3, 'SAA7228B', 'ACTIVE', 'WONG KAH LENG', 'HONDA CRV RD1', 'B20B-1077002', 'RD1-1065372', '-', '-', '-', 'SAFFERY CHENG', '1996', '-', '-', 'ROAD TAX INSURANCE UNDER EPCS OIL UNDER (SS4465C)', NULL, NULL, 1),
	(167, 19, 3, 'RM8885', 'ACTIVE', 'VICTORIA KONG SU PHIN', 'AUDI A3', 'CEP007288', 'WUAZZZ8P2C1901424', '-', '-', '-', 'WONG KOK PING', '2012', '-', '-', 'ROAD TAX INSURANCE GET FROM WONG KOK PING', NULL, NULL, 1),
	(168, 19, 1, 'SU8885E', 'ACTIVE', 'VICTORIA KONG SU PHIN', 'DEMAK 90', 'PMDD147FMFF506476', 'PMDDLMPF0FF506573', '-', '-', '-', 'VICTORIA KONG SU PHIN', '2015', '-', '-', 'ROAD TAX INSURANCE GET FROM WONG KOK PING', NULL, NULL, 1),
	(169, 19, 3, 'SA3925X', 'ACTIVE', 'WONG WEE SHIN', 'PROTON WIRA 1.3 GL AEROBACK', '4G13P-GB9082', 'PL1C96LNRXB311340', '-', '-', '-', 'STANDBY ADMIN', '1999', '-', '-', 'ROAD TAX AND INSURANCE RENEWAL GET FROM WWP - OIL UNDER (SA6383A) MAINTENANCE (CASH) GET FROM WWP', NULL, NULL, 1),
	(170, 19, 3, 'SA 935 L', 'ACTIVE', 'TOYOTA', 'LAND CRUISER GX S. WAGON', '1HD-0057403', 'HZJ80-0007484', '2500', '2220', '280', 'ARTHUR WONG', '1991', '-', '-', 'SDH BUAT CHANGE OF  OWNERSHIP - KERETA UNDER ARTHUR WONG', NULL, NULL, 1),
	(171, 19, 3, 'SAC6823B', 'ACTIVE', 'JIMMY KOH CHEE VUI', 'TOYOTA ALTIS 1.8G', '2ZRX564862', 'MR053REH205288497', '-', '-', '-', 'JIMMY KOH CHEE VUI', '2016', '-', '-', 'WWP BAYAR ROAD TAX AND INSURANCE', NULL, NULL, 1),
	(172, 19, 3, 'SAA 973 U (SOLD)', 'ACTIVE', 'KIA', 'SPORTAGE', 'G4GC7H662888', 'PNAKK3L037G000149', '-', '-', '-', 'KWONG POH MENG', '2007', '-', '-', 'KWONG POH MENG BELI NE KERETA', NULL, NULL, 1),
	(173, 19, 2, 'SA1723P', 'ACTIVE', 'ISUZU', 'NPR596-03A', '486422', 'JAANPR59PM-7105664', '7000', '3300', '3700', 'ZENO (MEGA ERABAYU SDN BHD) - KENINGAU', '1994', '-', '-', 'BKI JUAL BAGI PDUSB - PDUSB JUAL BAGI MEGA ERABAYU (WWP INSTRUCT TIDAK PERLU BUKA CHEQUE MINTA BYR DR MEGA ERABAYU)\n- RUNNER CLAIM BILL UNDER MEGA ERABAYU SB UTK PUSPAKOM & ROAD TAX) - CHANGE OF OWNERSHIP 01.08.2019', NULL, NULL, 1),
	(174, 19, 3, 'SA1258P', 'ACTIVE', 'MITSUBISHI ', 'CANTER FE444E', '4D31-B50170', 'FE444E-A70130', '-', '-', '-', 'LOGISTICS STANDBY DRIVER', '1994', '-', '-', 'RENT BY LASB STARTING ON 01.10.2019 (REPAIR & MAINTENANCE UNDER LASB)', NULL, NULL, 1),
	(175, 19, 6, 'SMB1862', 'ACTIVE', 'MERCEDES BENZ', 'MB140 D2.9', 'GG291110131053', 'KPDGG12272P139659', '-', '-', '-', 'LOGISTICS STANDBY DRIVER', '2001', '-', '-', 'INSURANCE ROAD TAX RENEWAL MINTA WWP', NULL, NULL, 1),
	(176, 8, 2, 'SA 57 Y', 'ACTIVE', 'NISSAN', 'CK66BT PRIME MOVER (Bulk Feed)', 'RE10-027309', 'CK66BT-14183', '32000', '7370', '-', 'LOGISTICS STANDBY DRIVER', '1994', '-', '-', 'KAD SAMA WILLIAM LEE', NULL, NULL, 1),
	(177, 8, 2, 'SAA1223B (TOTAL LOSS)', 'ACTIVE', 'HICOM', 'HICOM PERKASA 150DX', '785302', 'PML60CL2R1P003368', '5000', '3520', '1480', 'JOSEPH A/L DUYA', '2001', '-', '-', '-', NULL, NULL, 1),
	(178, 8, 1, 'SU1280B', 'ACTIVE', 'YAMAHA', 'Motorbike ~ YAMAHA EGO S', 'E3A8EE046805', 'PMYKE108090046805', '-', '-', '-', 'ROY (LOGISTIC)', '2009', '-', '-', '-', NULL, NULL, 1),
	(179, 8, 2, 'ST1311B', 'ACTIVE', 'DAIHATSU', 'L/Truck', 'B-0306506', 'V12-16485', '4450', '2240', '2210', 'HERO (ULU KIMANIS - PETER WONG) exchange with SA5369M (Humphery)', '1982', '-', 'PDUSB', '(LAGENDA SEWA START ON SEPTEMBER,2018 - UNDER PETER WONG)', NULL, NULL, 1),
	(180, 8, 2, 'SA1450L', 'ACTIVE', 'ISUZU', 'NPR596', '4BE1-289362', '7103398', '7000', '2765', '4235', 'WORKSHOP', '1990', '-', 'PDUSB', '-', NULL, NULL, 1),
	(181, 8, 2, 'SAA 1676 L (CONDEMN)', '-', 'TUAH', 'KM188 HFC1048KL', 'CY4102BZLQ05077542', 'PMMTH381040500161', '5000', '2605', '2395', 'MASALAH ENJIN (SUDAH KONDEM)', '2005', '-', '-', '-', NULL, NULL, 1),
	(182, 8, 2, 'WVT1605 (NEW)', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NKR55UEE', '4JB1110313', 'JAANNKR55EA7108899', '4500', '2600', '1900', 'LOGISTICS STANDBY DRIVER', '2011', '-', '-', 'LORI BAHARU - PURCHASE ON SEPTEMBER, 2019 FROM WEST MALAYSIA', NULL, NULL, 1),
	(183, 8, 2, 'QAV1766 ', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NKR66 (RB/NEK N01)', '4HF1601362', 'NKR66E-7532984', '5000', '2910', '2090', 'SOON SHUEN VUI', '2010', '-', '-', 'IISB SEWA PDUSB START ON NOVEMBER,2019', NULL, NULL, 1),
	(184, 8, 2, 'SAA1826A', '-', '-', 'KING\'S STK 26CU.M-26 ', '-', 'STK-2298-2000', '25500', '7550', '17950', 'STAND-BY TRAILER', '2000', '-', '-', '-', NULL, NULL, 1),
	(185, 8, 2, 'SAA1935U', 'ACTIVE', 'TOYOTA (REFRIGERATED)', 'XZU 412 (RB/FP BD 1)', 'S05CA13801', 'KZU412-0001336', '7000', '3310', '3690', 'RAHIM KURUNG', '2007', NULL, '-', '-', NULL, NULL, 1),
	(186, 8, 2, 'SAB1935A (TOTAL LOSS)', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'FRR33 (RB/BC 030)', '6HH1-261246', 'FRR33K4-3001570', '13000', '5090', '7910', 'STAND-BY ', '2009', 'Orix Credit Malaysia', '-', '-', NULL, NULL, 1),
	(187, 8, 2, 'SAB1935K (NEW)', 'ACTIVE', 'HINO', 'XZU423R-HKMRD3', 'N04CTT26288', 'JHFYT20H807002085', '8300', '3660', '4640', 'RAMLI', '2012', 'Orix Credit Malaysia', '-', '-', NULL, NULL, 1),
	(188, 8, 2, 'SAA2335A', 'ACTIVE', 'DAIHATSU', 'Delta V58R L/Rigid', '638544', 'V58B53376', '4500', '2240', '2260', 'STANDBY DRIVER - LOGISTICS', '2000', '-', '-', '-', NULL, NULL, 1),
	(189, 8, 2, 'JGK2378', 'ACTIVE', 'DAIHATSU', 'Delta V116-HA', '1686099', 'JDA00V11600097426', '5000', '2770', '2230', 'STANDBY DRIVER - LOGISTICS', '2002', '-', '-', 'KAD ORIGINAL ADA SAMA ADMIN KENA PASS BY FREDDY ON 01.11.2017', NULL, NULL, 1),
	(190, 8, 2, 'SAA2674T', 'ACTIVE', 'SERI ZENITH ENG. SDN. BHD.', 'SZESTR-40', '-', 'E7STR20251', '32000', '3920', '28080', 'STAND-BY TRAILER', '2007', '-', '-', 'KAD SAMA WILLIAM LEE', NULL, NULL, 1),
	(191, 8, 2, 'SAA2935U', 'ACTIVE', 'NISSAN (BULK FEED)', 'CD53 (RB/AA VM)', 'RG8-102482', 'CD53BVF-00002', '21000', '12120', '8880', 'JAINAL BIN BIDIN', '2008', '-', '-', '-', NULL, NULL, 1),
	(192, 8, 2, 'SAB2935L', 'ACTIVE', 'HINO (REFRIGERATED)', 'XZU423T-HKMRD3', 'N04CTT26286', 'JHFYT20H107002087', '8300', '4160', '4140', 'MEDI', '2011', 'Orix Credit malaysia sdn ', '-', '-', NULL, NULL, 1),
	(193, 8, 2, 'SAA3150A', 'ACTIVE', 'HICOM', 'PERKASA MTB150DX', '736298', 'PML60CL2R1P002451', '5000', '2660', '2340', 'RAHIM', '2000', '-', '-', 'KAD ORIGINAL SAMA ADMIN SUDAH KENA PASS OLEH ARTHUR ON 30.10.2017', NULL, NULL, 1),
	(194, 8, 2, 'SA3286W', 'ACTIVE', 'NISSAN', 'CPB15NE', 'FE6-202962C', 'CPB15NE-01172', '16000', '7380', '8620', 'JIROM BIN RIMPUN', '1997', '-', '-', '-', NULL, NULL, 1),
	(195, 8, 2, 'SA3411N [TOTAL LOSS]', 'ACTIVE', 'ISUZU', 'NPR596', '4HF1-605003', 'JAANPR59PM-7104920', '7000', '3270', '3730', 'TOTAL LOSS', '1993', '-', '-', 'TOTAL LOSS KAD SUDA BG SAMA BANK ALLIANZ', NULL, NULL, 1),
	(196, 8, 2, 'ST3453E', 'ACTIVE', 'ISUZU', 'NHR 55 E Lori Rigid Luton /Kotak', '4JB1-339260', 'JAANHR55E-P7113983', '4100', '2160', '1940', 'IMPIAN SEWA - HATCHERY', '1997', '-', '-', 'SGT SEWA (01.01.2016)', NULL, NULL, 1),
	(197, 8, 2, 'SS3489D', '-', 'HO SU SIONG CONTRACTOR', 'MAZDA - L/Truck', 'K2-414287/592269', 'SDX022-MM-000595', '2450', '1120', '1330', 'YOSUF', '1994', '-', 'PDUSB', 'KAD TIDAK TAU P MANA', NULL, NULL, 1),
	(198, 8, 2, 'SA3595U', 'ACTIVE', 'ISUZU', 'L/Truck', '4BD1-566454', 'JAANPR59PM7110130', '5000', '2400', '2600', 'BURATIN BIN PARROJO', '1996', '-', '-', '-', NULL, NULL, 1),
	(199, 8, 2, 'SAB3685W (NEW REBUID)', 'ACTIVE', 'HINO (REFRIGERATED)', 'WU720R-HKMQL3', 'W04DTN31366', 'JHHYJL1H101911211', '5000', '3430', '1570', 'JEFRIN GANIS', '2014', 'ORIX CREDIT MALAYSIA', '-', '-', NULL, NULL, 1),
	(200, 8, 2, 'SA 389 H', 'ACTIVE', 'ISUZU', 'TRUCK', '4BD1-100720', '4622836', '7000', '2970', '4030', 'STANDY-BY (LOGISTIC)', '1986', '-', '-', '-', NULL, NULL, 1),
	(201, 8, 2, 'SAB3935J (BOX CHICK-NEW)', 'ACTIVE', 'HINO', 'XZU423R-HKMRD3', 'N04CTT24999', 'JHFYT20H307001846', '8300', '3880', '4420', 'SUHAIMI', '2011', 'Orix Credit Malaysia ', '-', '-', NULL, NULL, 1),
	(202, 8, 2, 'SAB3935K (DUM/TIP-NEW) ', 'ACTIVE', 'NISSAN', 'CWM272 (RB/AA)', 'MD92-505433B', 'CWM272HT-00001', '21000', '9550', '11450', 'MASRAN BIN LANABA', '2012', 'Orix Credit Malaysia', '-', '-', NULL, NULL, 1),
	(203, 8, 2, 'SAA3935U', 'ACTIVE', 'NISSAN', 'CD45 (RB/AA VM1)', 'PF6-404338B', 'CD45CV-21336', '21000', '10050', '10950', 'MUHIDIN BIN HARIS', '2008', '-', '-', '-', NULL, NULL, 1),
	(204, 8, 2, 'SAA3951D [TOTAL LOSS]', 'ACTIVE', 'DAIHATSU', 'V58R-HS DELTA CHASSIS CAB', 'DL645056', 'V58B57261', '4500', '2210', '2290', 'TOTAL LOSS', '2002', '-', '-', 'TOTAL LOSS KAD SUDA BG SAMA BANK ALLIANZ', NULL, NULL, 1),
	(205, 8, 2, 'SAA3980J', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NKR66C (RB/AA)', '4HF1-138945', 'NKR66L-7100696', '5000', '3410', '1590', 'VITALIS', '2005', '-', '-', 'IMPIAN SEWA - 21.11.2013', NULL, NULL, 1),
	(206, 8, 2, 'SAB3935V [TOTAL LOSS]', 'ACTIVE', 'NISSAN [NEW REBUID]', 'MK211 (RB/LA 056)', 'FE6-100270E', 'MK211HN-00054', '12000', '5190', '6810', 'MUSLI OYOH', '2014', 'ambank(m)berhad', NULL, 'TOTAL LOSS KAD SUDA BG SAMA BANK ALLIANZ', NULL, NULL, 1),
	(207, 8, 2, 'SAB4135K', 'ACTIVE', 'HINO', 'WU300R-HBMLS3 [UBS]', 'W04DJ48914', 'JHFAF04H206005920', '4800', '2950', '1850', 'REAY DEONT', '2011', '-', '-', '-', NULL, NULL, 1),
	(208, 8, 2, 'SA 450 M', 'ACTIVE', 'DAIHATSU', 'L/Truck', 'DL-459660', 'V57A-78381', '2500', '1650', '850', '-', '1991', '-', '-', 'KAD SAMA WILLIAM LEE (TIADA DLM FAIL ADMIN)', NULL, NULL, 1),
	(209, 8, 2, 'SU4596A (NEW)', 'ACTIVE', 'ISUZU', 'NPR1L CHASSIS CAB', '4HG1469233', 'NPR71L-7413527', '5000', '3420', '1580', 'LOGISTICS STANDBY DRIVER', '2004', '-', '-', 'NEW LORRY FROM BKI TO PDUSB - CHANGE OF OWNERSHIP ON (01.08.2019)', NULL, NULL, 1),
	(210, 8, 2, 'SYA5014 (NEW)', 'ACTIVE', 'NISSAN (BULK FEED)', 'NISSAN CD48 (RB/BC 338)', 'GE13-021195B', 'CD48W-03121', '21000', '12770', '13074', 'LO SU PHIN', '2018', 'Orix Credit Malaysia ', '-', 'REUSED PERMIT TOTAL LOSS LORRY SAB7935A', NULL, NULL, 1),
	(211, 8, 2, 'SA5073M', 'ACTIVE', 'ISUZU', 'NPR596-03A TRUCK', '4BD1-121102', '7101767', '7000', '3150', '3850', 'LOGISTICS STANDBY DRIVER', '1992', '-', '-', 'CHANGE OF OWNERSHIP FROM BKI TO PDUSB', NULL, NULL, 1),
	(212, 8, 2, 'SYE5160', 'ACTIVE', 'ISUZU', 'NQR75UKN', '4HK1-698124', 'PLZN1R75KJP100276', '8500', '4050', '4450', 'DENIS BIN SIGOH', '2020', 'ORIX CREDIT MALAYSIA', '-', 'NEW LORRY PURCHASE FROM UNIVERSAL MOTOR,2020', NULL, NULL, 1),
	(213, 8, 2, 'SS5166D', 'ACTIVE', 'ISUZU', 'NHR55E Pick Up', '986137', 'JAANHR55EP-7102974', '4100', '2100', '2000', 'FOO SIU VAN', '1995', '-', '-', '-', NULL, NULL, 1),
	(214, 8, 2, 'SYE5212', 'ACTIVE', 'ISUZU', 'NQR75UKN', '4HK1-699562', 'PLZN1R75KJP100305', '8500', '4180', '4320', 'JUMADIL BIN MOHD', '2020', 'ORIX CREDIT MALAYSIA', '-', 'NEW LORRY PURCHASE FROM UNIVERSAL MOTOR,2020', NULL, NULL, 1),
	(215, 8, 2, 'SYE5213', 'ACTIVE', 'ISUZU', 'NQR75UKN', '4HK1-698120', 'PLZN1R75KJP100275', '8500', '4050', '4450', 'BASRI BIN NOOR', '2020', 'ORIX CREDIT MALAYSIA', NULL, 'NEW LORRY PURCHASE FROM UNIVERSAL MOTOR,2020', NULL, NULL, 1),
	(216, 8, 3, 'SS5234B (SOLD TO DONNY)', 'ACTIVE', 'TOYOTA', 'Mark II', '2L-1106143', 'LJ70-0001596', '-', '-', '-', 'JUAL SAMA DONY DRIVER', '1986', '-', '-', '-', NULL, NULL, 1),
	(217, 8, 2, 'SAA5279F', 'ACTIVE', 'DAIHATSU', 'DELTA V116-HA CHASSIS CAB', '14B1731184', 'JDA00V11600A01280', '5000', '2860', '2140', 'RAHIM KURUNG', '2003', '-', '-', '-', NULL, NULL, 1),
	(218, 8, 2, 'SAC5408C (NEW)', 'ACTIVE', 'NISSAN', 'MK211 (RB/BC 053)', 'FE6-117684', 'MK211K-13034', '12000', '5170', '6830', 'IBNU PORING', '2016', 'ORIX', '-', '-', NULL, NULL, 1),
	(219, 8, 2, 'SA5863M', '-', 'DAIHATSU', 'Delta V57A', '568572', 'V57A-80939', '2500', '1890', '610', 'FARM TOPOKON', '1992', '-', '-', 'IMPIAN SEWA - 01.06..2013', NULL, NULL, 1),
	(220, 8, 2, 'SAB5935F', 'ACTIVE', 'HINO (REFRIGERATED)', 'XZU423R-HKMRD3', 'N04CTT24181', 'JHFYT20H507001699', '8300', '3990', '4310', 'ZUNIDY', '2011', 'Orix Credit Malaysia ', '-', '-', NULL, NULL, 1),
	(221, 8, 2, 'SAA5935R (TOTAL LOSS)', 'ACTIVE', 'TOYOTA (Refrigerated)', 'BU105 (rb/fp rg1)', '3B1609387', 'BU105-0101776', '5000', '2460', '2540', 'JEFRIN GANIS', '2007', '-', '-', 'TOTAL LOSS KAD SUDA BG SAMA BANK ALLIANZ', NULL, NULL, 1),
	(222, 8, 2, 'SAB5935A (NEW)', 'ACTIVE', ' NISSAN (BULK FEED)', 'CD53 (RB/EMS V)', 'RG8-200390', 'CD53CW-20065', '21000', '11770', '9230', 'MOHD NAWI', '2009', 'Orix Credit Malaysia ', '-', '-', NULL, NULL, 1),
	(223, 8, 2, 'SAB5935K (NEW)', 'ACTIVE', ' NISSAN (BULK FEED)', 'CD45 (RB/AA VM1)', 'PF6-307444C', 'CD45CV-11692', '21000', '11540', '9460', 'MADRA BIN ARIS', '2012', 'Orix Credit Malaysia', '-', '-', NULL, NULL, 1),
	(224, 8, 2, 'SAA6265U', 'ACTIVE', 'DAIHATSU', 'DELTA V116-HA', '14B1835042', 'JDA00V11600A12571', '5000', '3130', '1870', 'THOMAS', '2008', '-', '-', 'EPCS SEWA - 01.06.2014', NULL, NULL, 1),
	(225, 8, 2, 'SAA6312G', 'ACTIVE', 'ISUZU', 'NKR66L (RB/BK-MOD)', '4BE1-106619', 'NKR66L-7415265', '5000', '2820', '2180', 'JOSEPH A/L DUYA', '2004', '-', '-', '-', NULL, NULL, 1),
	(226, 8, 2, 'SS6365H', '-', 'KAK KAM KEONG', 'ISUZU - L/TRUCK', '4HF1201130', 'NPR66L-7406603', '5000', '3150', '1850', 'KONDEM[ADA DII W.S]', '2003', 'EON Finance Berhad', 'PDUSB', '-', NULL, NULL, 1),
	(227, 8, 2, 'SAA6658A', 'ACTIVE', 'DAIHATSU', 'V58R-HS DELTA', '639927', 'V58B53745', '4500', '2230', '2270', 'SABARUDDIN B. MIDAH ', '2001', '-', '-', 'IMPIAN SEWA GANTI 450M - START 13.10.2017 (SEWA)', NULL, NULL, 1),
	(228, 8, 3, 'SA6693L', 'ACTIVE', 'TOYOTA', 'Station Wagon', '1HZ-0036795', 'HZJ81-0000783', '2650', '2310', '340', 'JAYSON (CATCHING TEAM)', '1991', '-', '-', '-', NULL, NULL, 1),
	(229, 8, 2, 'SA6908L', 'ACTIVE', 'ISUZU', 'NPR596-03A TRUCK', '4BD1133858', '7101078', '7000', '2765', '4235', 'ROBERT', '1991', '-', '-', '-', NULL, NULL, 1),
	(230, 8, 2, 'SAC6935A (NEW)', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NPR71UHH', '4HG1400669', 'PLZNPR71HDP102344', '5000', '3430', '1570', 'JAINUDIN', '2015', 'ORIX', '-', 'KAD MASIH SAMA BANK TANYA FINANCE UNDER BANK MANA, KALAU MAHU AMBIL KAD BUAT SURAT KUASA AMBIL KAD TUJUAN RENEW ROADTAX (BEKAS LORI HAMZAN GUNA)', NULL, NULL, 1),
	(231, 8, 2, 'SAB6935F', 'ACTIVE', 'HINO (REFRIGERATED)', 'XZU423R-HKMRD3', 'N04CTT24168', 'JHFYT20H307001698', '8300', '3970', '4330', 'UMRAN PAYONG', '2011', 'Orix Credit Malaysia ', '-', '-', NULL, NULL, 1),
	(232, 8, 2, 'SAB6935K (TOTAL LOSS)', 'ACTIVE', 'NISSAN (BULK FEED)', 'CD45 (RB/AA VM1)', 'PF6-307412B', 'CD45CV-11667', '21000', '11580', '9420', 'MANSUR LATJAMA', '2012', 'orix credit malaysia', '-', 'TOTAL LOSS KAD SUDA BG SAMA BANK ALLIANZ', NULL, NULL, 1),
	(233, 8, 2, 'SAC6935B (NEW)', 'ACTIVE', 'NISSAN (REFRIGERATED)', 'CD48 (RB/BC 334)', 'GE13-015805B', 'CD48ZW-01516', '21000', '11030', '9970', 'SAFFERY CHENG', '2016', 'ORIX', '-', 'KAD MASIH SAMA BANK TANYA FINANCE UNDER BANK MANA, KALAU MAHU AMBIL KAD BUAT SURAT KUASA AMBIL KAD TUJUAN RENEW ROADTAX', NULL, NULL, 1),
	(234, 8, 2, 'SAA6935R', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NKR66E (RM/EMS)', '4HF1-446163', 'NKR66E-7490986', '5000', '2720', '2280', 'ABDUL HAFIZ', '2007', '-', '-', 'SME SEWA - 01.12.2011', NULL, NULL, 1),
	(235, 8, 2, 'SAA7106E (TOTAL LOSS)', 'ACTIVE', 'INOKOM', 'AU26 LORIMAS', 'D4BB3749995', 'PL3LSDRD002106', '3600', '2240', '1360', 'STAND-BY', '2003', '-', '-', 'TOTAL LOSS KAD SUDA BG SAMA BANK ALLIANZ', NULL, NULL, 1),
	(236, 8, 2, 'SA7225L', 'ACTIVE', 'ISUZU', 'NPR596 TRUCK', '293801', '7101014', '5000', '3560', '1440', 'RAHIM KURONG', '1991', '-', '-', 'LAGENDA SEWA 01.09.2014', NULL, NULL, 1),
	(237, 8, 2, 'ST7488P ', 'ACTIVE', 'MITSUBISHI FUSO (CHICK)', 'FE85PG6SRDG1', '4D34-M87789', 'FE85PG-Y07553', '7500', '3960', '3540', 'SAFFERY CHENG @ ABAI CHENG', '2011', '-', '-', '-', NULL, NULL, 1),
	(238, 8, 2, 'SAA 7559 B (TOTAL LOSS)', 'ACTIVE', 'DAIHATSU', 'L/Truck - (B)', 'DL51-532738', 'V58B54695', '5000', '2310', '2690', 'FITRI', '2001', '-', '-', 'TOTAL LOSS KAD SUDA BG SAMA BANK ALLIANZ', NULL, NULL, 1),
	(239, 8, 2, 'SU7673A', '-', 'DONG FENG', 'PAHLAWAN LM 228 EQ1032T-M', '4100QBZL*N4683110A*', 'PLMEQ1032MY000561', '4600', '2570', '2030', '-', '2006', '-', '-', '-', NULL, NULL, 1),
	(240, 8, 2, 'SAA7673M', '-', 'DONG FENG', 'PAHLAWAN LM 228 EQ1032T-M', '4100QBZL*N4686417A*', 'PLMEQ1032MY000661', '4600', '2670', '1930', 'HUMPHERY CHONG', '2006', '-', '-', 'IMPIAN SEWA - 07.06.2013', NULL, NULL, 1),
	(241, 8, 2, 'SA7673U', 'ACTIVE', 'ISUZU (KARGO AM)', 'NPR596-06H ', '4BD1-588304', 'JAANPR59PM7111657', '5000', '3240', '1760', 'JOSEPH A/L DUYA', '1997', '-', '-', '-', NULL, NULL, 1),
	(242, 8, 2, 'SA7673V', 'ACTIVE', 'DAIHATSU', 'DELTA V58R-HS', '625330', 'V58B50929', '4500', '1860', '2640', 'ADBUL RAJIT', '1997', '-', '-', 'EPCS SEWA - 01.12.2009', NULL, NULL, 1),
	(243, 8, 2, 'SAA7935R', 'ACTIVE', 'NISSAN', 'CD53 (RB/AA VM)', 'RG8-111573', 'CD53BV-10117', '21000', '9100', '11900', 'LO SU PHIN', '2007', '-', '-', '-', NULL, NULL, 1),
	(244, 8, 2, 'SAB7935A (TOTAL LOSS)', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NPS 72 (RB/ FP BD1) 4X4', '4HJ1058084', 'NPS72L-7401124', '7000', '3910', '3090', 'JULAKMAD BIN BUTAN', '2009', 'Orix Credit Malaysia ', '-', 'TOTAL LOSS KAD SUDA BG SAMA BANK ALLIANZ', NULL, NULL, 1),
	(245, 8, 2, 'SAC7935A (NEW)', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NPR71UHH', '4HG1400673', 'PLZNPR71HDP102345', '5000', '3430', '1570', 'AL-HADI', '2015', 'ORIX', '-', 'KAD MASIH SAMA BANK TANYA FINANCE UNDER BANK MANA, KALAU MAHU AMBIL KAD BUAT SURAT KUASA AMBIL KAD TUJUAN RENEW ROADTAX', NULL, NULL, 1),
	(246, 8, 2, 'SAC7935D (NEW)', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NPR71UHH', '4HG1509607', 'PLZNPR71HDP102954', '5000', '3430', '1570', 'SOON SU VUI @ AH SOON', '2016', 'ORIX', '-', 'PAKAI PERMIT B.S.R (CUMA LEKAT DI PINTU LORI SAJA-PERMIT BESAR)', NULL, NULL, 1),
	(247, 8, 2, 'SAB7935F', 'ACTIVE', 'HINO (REFRIGERATED)', 'XZU423R-HKMRD3', 'N04CTT24623', 'JHFYT20H907001804', '8300', '3940', '4360', 'HARRY BOY', '2011', 'Orix Credit Malaysia ', '-', '-', NULL, NULL, 1),
	(248, 8, 2, 'SYB7935 (NEW)', 'ACTIVE', 'ISUZU (REFRIGERATED)', ' NPR81UKH', '4HL1697676', 'PLZNPR81KJP100587', '7500', '3500', '4000', 'JULHAMRI', '2018', 'Orix Credit Malaysia ', '-', '-', NULL, NULL, 1),
	(249, 8, 2, 'WVV8107 (NEW)', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NKR55UEE', '4JB1110855', 'JAANKR55EA7108906', '4500', '2710', '1790', 'AZRI', '2011', '-', '-', 'LORI BAHARU - PURCHASE ON SEPTEMBER,2019 FROM WEST MALAYSIA', NULL, NULL, 1),
	(250, 8, 2, 'WVV8251 (NEW)', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NKR55UEE', '4JB1110853', 'JAANKR55EA7108905', '4500', '2660', '1840', 'LOGISTICS STANDBY DRIVER', '2011', '-', '-', 'LORI BAHARU - PURCHASE ON SEPTEMBER, 2019 FROM WEST MALAYSIA', NULL, NULL, 1),
	(251, 8, 2, 'SYD8872 (NEW)', 'ACTIVE', 'ISUZU', 'FSR90SU-NC-B (UBS)', '4HK1-770478', 'PLZFSR90NJP000093', '11000', '5650', '4550', 'SAFFERY CHENG', '2019', 'ORIX CREDIT MALAYSIA', '-', 'REUSED PERMIT TOTAL LOSS LORRY SAB6935K', NULL, NULL, 1),
	(252, 8, 2, 'SYB8935 (NEW)', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NPR81UKH', '4HL1697663', 'PLZNPR81KJP100585', '7500', '3500', '4000', 'ROSLI', '2018', 'Orix Credit Malaysia ', '-', '-', NULL, NULL, 1),
	(253, 8, 2, 'ST8851K', 'ACTIVE', 'NISSAN', 'CD450 (RB/JE 064)', 'PF6-156008T', 'CD450UN-15139', '21000', '8870', '12130', 'HAMRAN', '2007', '-', '-', 'REUSED PERMIT TOTAL LOSS LORRY SAB3935V', NULL, NULL, 1),
	(254, 8, 2, 'SAB8935K (NEW)', 'ACTIVE', 'NISSAN (OPEN PLATFORM)', 'PKD214(RB/AA)', 'FE6-100964H', 'JNBPKD2145AH00003', '16000', '6600', '9400', 'MUSLI OYUN', '2012', 'ambank(m)berhad', '-', 'KAD SAMA WILLIAM LEE', NULL, NULL, 1),
	(255, 8, 2, 'SAC8935D (NEW)', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NPR71UHH', '4HG1509573', 'PLZNPR71HDP102955', '5000', '3450', '1550', 'JAIBON', '2016', 'ORIX', '-', 'PAKAI PERMIT B.S.R (CUMA LEKAT DI PINTU LORI SAJA-PERMIT BESAR)', NULL, NULL, 1),
	(256, 8, 2, 'ST8935Y', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NQR75UKN', '4HK1-558088', 'PLZN1R75KEP101185', '8500', '4120', '4380', 'SABRI', '2017', 'ORIX', '-', 'KAD MASIH SAMA BANK TANYA FINANCE UNDER BANK MANA, KALAU MAHU AMBIL KAD BUAT SURAT KUASA AMBIL KAD TUJUAN RENEW ROADTAX', NULL, NULL, 1),
	(257, 8, 2, 'SAA9015A', 'ACTIVE', 'HICOM', 'L/Truck - (B)', '4HF1-139807', 'PM2L60CL2R1P003373', '5000', '2860', '2140', 'TAMBULAUNG IMPIAN  SEWA', '2001', '-', '-', 'KAD SAMA WILLIAM LEE', NULL, NULL, 1),
	(258, 8, 2, 'SM9075 (NEW)', 'ACTIVE', 'SINOTRUCK (BULK FEED)', 'ZZ3257N4147W', 'WD61547170707031837', 'PLTWL32DW7M000021', '21000', '14020', '6980', 'MANSUR LATJAMA', '2017', 'Orix Credit Malaysia ', '-', 'REUSED PERMIT SAB1935A-TOTAL LOSS LORRY', NULL, NULL, 1),
	(259, 8, 2, 'SB 935 B', 'ACTIVE', 'NISSAN (REFRIGERATED)', 'PK260 (RB/EMS H)', 'MD92-100984', 'PK260HZ-20010', '16000', '5650', '10350', 'AWANG HARUDIN', '2010', 'Orix Credit Malaysia ', '-', '-', NULL, NULL, 1),
	(260, 8, 2, 'ST8225D', 'ACTIVE', 'TOYOTA (REFRIGERATED)', 'XZU 330 (RB/FP BD1)', 'J05CD16653', 'XZU330-0001233', '7000', '3140', '3860', 'LOGISTICS STANDBY DRIVER', '2008', '-', '-', '-', NULL, NULL, 1),
	(261, 8, 2, 'SAB 935 U (NEW)', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NPR71UPLT', '4HG1136242', 'JAANPR71PC7102310', '8500', '3620', '4880', 'JUNAIDY', '2013', 'ambank(m)berhad', '-', ' ', NULL, NULL, 1),
	(262, 8, 2, 'SAB 935 K', 'ACTIVE', 'HINO (REFRIGERATED)', 'XZU423R-HKMRD3', 'N04CTT26284', 'JHFYT20HX07002086', '8300', '3990', '4310', 'JOSEPH A/L DUYA', '2012', 'Orix Credit Malaysia', NULL, '-', NULL, NULL, 1),
	(263, 8, 2, 'SAA9621L (NEW)', 'ACTIVE', 'NISSAN', 'LKA211N', '6925 S.P', 'PNDLKA2115T000909', '11000', '4860', '6140', 'PAUL ABANG', '2006', '-', '-', '-', NULL, NULL, 1),
	(264, 8, 2, 'SYB9935 (NEW)', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NPR81UKH', '4JHL1697667', 'PLZNPR81KJP100586', '7500', '3460', '4040', 'MEDI', '2018', 'Orix Credit Malaysia ', '-', '-', NULL, NULL, 1),
	(265, 8, 3, 'SAA9935U', 'ACTIVE', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB 2.5 AT', '2KD6140513', 'PN133JV2508511665', '-', '-', '-', 'PETER WONG WAH LOON', '2008', '-', '-', '-', NULL, NULL, 1),
	(266, 8, 2, 'SAB9935K', 'ACTIVE', 'NISSAN (REFRIGERATED)', 'CD45 (RB/AA VM1)', 'PF6-401269B', 'CD45CV-20307', '21000', '10920', '10080', 'STAND-BY DRIVER-LOGISTICS', '2012', 'ambank(m)berhad', '-', '-', NULL, NULL, 1),
	(267, 8, 2, 'PCQ5250', 'ACTIVE', 'NISSAN', 'CD2ZA (RB/AA)', 'MD92-505012C', 'CD2ZA-00002', '21000', '10350', '10650', 'JULAKMAD BIN BUTAN', '2013', 'Orix Credit Malaysia', '-', '-', NULL, NULL, 1),
	(268, 8, 2, 'SS9935V (NEW)', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NPR71UHH', '4HG1210696', 'JAANPR71HD7101657', '5000', '3530', '1470', 'JOHAN', '2014', 'ORIX CREDIT MALAYSIA', '-', '-', NULL, NULL, 1),
	(269, 8, 2, 'SAB9935W (NEW)', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NPR71UHH', '4HG1186122', 'JAANPR71HD7101509', '5000', '3240', '1760', 'JULHAMIN', '2014', 'ORIX CREDIT MALAYSIA', '-', '-', NULL, NULL, 1),
	(270, 8, 2, 'SAC9935D (NEW)', 'ACTIVE', 'ISUZU (REFRIGERATED)', 'NPR71UHH', '4HG1519081', 'PLZNPR71HDP103067', '5000', '3420', '1580', 'JAMRI', '2016', 'ORIX', '-', 'PAKAI PERMIT B.S.R (CUMA LEKAT DI PINTU LORI SAJA-PERMIT BESAR)', NULL, NULL, 1),
	(271, 8, 2, 'SAB9935R', 'ACTIVE', 'NISSAN (BULK FEED)', 'CD2ZA(RB/AA)', 'RD8-111610', 'CD2ZA-00002', '21000', '11420', '9580', 'LOGISTICS STANDBY DRIVER', '2013', '-', '-', '-', NULL, NULL, 1),
	(272, 8, 2, 'SAA935U', 'ACTIVE', 'TOYOTA (REFRIGERATED)', 'XZU 330 (RB/FP BD1)', 'J05CD16653', 'XZU330-0001233', '7000', '3140', '3860', 'LOGISTICS STANDBY DRIVER', '2008', '-', '-', '-', NULL, NULL, 1);
/*!40000 ALTER TABLE `vehicle_vehicle` ENABLE KEYS */;

-- Dumping structure for table admin.vehicle_vehicle_ori
CREATE TABLE IF NOT EXISTS `vehicle_vehicle_ori` (
  `vv_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `vv_category` int(11) NOT NULL DEFAULT 0,
  `vv_vehicleNo` varchar(25) NOT NULL,
  `vv_brand` varchar(25) NOT NULL,
  `vv_model` varchar(50) NOT NULL,
  `vv_engine_no` varchar(50) NOT NULL,
  `vv_chasis_no` varchar(50) NOT NULL,
  `vv_driver` varchar(50) NOT NULL,
  `vv_bdm` double NOT NULL DEFAULT 0,
  `vv_btm` double NOT NULL DEFAULT 0,
  `vv_yearPurchased` varchar(25) NOT NULL,
  `vv_yearMade` varchar(25) NOT NULL,
  `vv_finance` varchar(50) NOT NULL,
  `vv_disposed` varchar(50) NOT NULL,
  `vv_capacity` double NOT NULL DEFAULT 0,
  `vv_remark` text NOT NULL,
  `vv_status` varchar(50) NOT NULL DEFAULT '' COMMENT 'active, inactive, not sure, total loss',
  `date_added` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 1 COMMENT '1-active , 0- deleted',
  PRIMARY KEY (`vv_id`),
  KEY `company_id` (`company_id`),
  KEY `vehicle_category` (`vv_category`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table admin.vehicle_vehicle_ori: ~131 rows (approximately)
/*!40000 ALTER TABLE `vehicle_vehicle_ori` DISABLE KEYS */;
INSERT INTO `vehicle_vehicle_ori` (`vv_id`, `company_id`, `vv_category`, `vv_vehicleNo`, `vv_brand`, `vv_model`, `vv_engine_no`, `vv_chasis_no`, `vv_driver`, `vv_bdm`, `vv_btm`, `vv_yearPurchased`, `vv_yearMade`, `vv_finance`, `vv_disposed`, `vv_capacity`, `vv_remark`, `vv_status`, `date_added`, `status`) VALUES
	(1, 9, 1, 'SAA2935R', 'ISUZU', 'NPR70(RB/HS L1)', '4HG1-392649', 'NPR70L-7401321', 'SULTAN', 7000, 3950, '', '2007', 'PBB', '-', 1840, 'MY OWN REMARK', '', '2020-02-25 15:11:54', 0),
	(2, 8, 2, 'SA1121N', 'ISUZU', 'NPR58L CHASSIS CAB', '4BE1-973634', 'JAANPR58LM-7104482', '-', 6000, 2720, '', '1992', '-', '-', 3280, 'Not sure if this lorry currently is active of not', '', '2020-02-28 10:24:28', 1),
	(3, 8, 2, 'SA2558X', 'ISUZU', 'FSR11H', '6BG1-707075', 'JALFSR11HP3601496', 'WORKSHOP PDU', 11000, 5440, '', '1998', '-', '-', 5560, '', '', '2020-02-28 10:26:45', 1),
	(4, 8, 2, 'SA2623J', 'ISUZU', 'NPR596 TRUCK', '944340', '7101126', '', 7000, 3560, '', '1988', '-', '-', 3440, 'Not sure if this lorry currently is active or not', '', '2020-02-28 10:36:45', 1),
	(5, 8, 2, 'SA2709V', 'NISSAN', 'CPB15NE', 'MD92-001418', 'CPB15NE-01015', 'RASHID BIN SAID', 16000, 6510, '', '1997', '-', '-', 9490, '', '', '2020-02-28 10:43:04', 1),
	(6, 8, 2, 'SA3230N', 'NISSAN', 'DUMP TRUCK', 'RD3-025169', 'CW51H-11543', 'LOGISTICS STANDBY LORRY', 21000, 10500, '', '1988', '-', '-', 10500, '', '', '2020-02-28 10:56:34', 1),
	(7, 8, 2, 'SA3529N', 'NISSAN', 'CPB15N-C/W RAILING CANVAS', 'NE6-009022T', 'CPB15N-01346', '', 16000, 9040, '', '1991', '-', '-', 6960, 'Not sure if lorry currently active or not', '', '2020-02-28 11:06:06', 1),
	(8, 8, 2, 'SA4043R', 'NISSAN', 'FEED BULK TANK', 'RE8-000367', 'CW53H-00334', '', 20000, 10140, '', '1991', '-', '-', 9860, 'Not sure if lorry currently is active or not', '', '2020-02-28 11:08:30', 1),
	(9, 0, 3, 'SA4383P', 'ISUZU', 'PICK UP CREW CAB', '947498', 'JAATFS55HR7102710', '-', 0, 0, '', '1995', '-', '-', 0, 'Not sure if this vehicle currently is active or not', '', '2020-02-28 11:16:38', 1),
	(10, 8, 2, 'SA5935V', 'NISSAN', 'CPB15NE-01127', 'FE6-209072C', 'CPB15NE-01127', 'BASRI BIN NUR', 16000, 6480, '', '1997', '-', '-', 9520, '', '', '2020-02-28 11:26:05', 1),
	(11, 8, 2, 'SD7289', 'ISUZU', 'ISUZU', '4BD1-133182', '4603198', '-', 7000, 3110, '', '1986', '-', '-', 3890, 'Not sure if this lorry currently is active or not', '', '2020-02-28 11:29:40', 1),
	(12, 8, 2, 'ST7360C', 'NISSAN', 'CPB15N', 'NE6-006853T', 'CPB15N-00837', '-', 16000, 7170, '', '1990', '-', '-', 8830, 'Not sure if this lorry currently active of not', '', '2020-02-28 11:31:48', 1),
	(13, 0, 0, 'SA778B', '', '', '', '', '', 0, 0, '', '', '', '', 0, '', '', '2020-02-28 11:32:06', 1),
	(14, 8, 2, 'SA778B', 'MAZDA', 'LIGHT TRUCK', 'TF-122785', 'EXC-82582', '-', 5000, 3110, '', '1978', '-', '-', 1890, 'Not sure if this lorry currently is active or not', '', '2020-02-28 11:40:07', 1),
	(15, 8, 2, 'SB8202', 'NISSAN', 'CM87K-TRUCK', 'FE6-301837D', 'CM87K-05758', 'ALIMUDIN MADA', 9950, 4410, '', '1993', '-', '', 5540, '', '', '2020-02-28 11:45:25', 1),
	(16, 8, 2, 'SAA8935K', 'DAIHATSU', 'DELTA V116-HA', '14B1783632', 'JDA00V11600A06585', 'TUDIKI', 5000, 2980, '', '2005', '-', '-', 2020, '', '', '2020-02-28 11:49:52', 1),
	(17, 8, 2, 'ST9055C', 'ISUZU', 'NPR596-03A', '309530', '7101448', '-', 7000, 3790, '', '1991', '-', '-', 3210, 'Not sure if this lorry currently is active or not', '', '2020-02-28 11:52:21', 1),
	(18, 8, 2, 'ST9199C', 'NISSAN', 'CMF88H', 'FE6-009680A', 'CMF88H-01977', 'IBNO', 10000, 5210, '', '1991', '-', '-', 4790, '', '', '2020-02-28 12:04:19', 1),
	(19, 8, 2, 'ST9228C', 'NISSAN', 'CPB15N-01382', 'NE6-009504 T', 'CPB15N', '-', 16000, 9490, '', '1991', '-', '-', 6510, '', '', '2020-02-28 13:21:04', 1),
	(20, 8, 2, 'SA938L', 'ISUZU', 'NPR596-03A TRUCK', '4BD1-134782', '7100293', 'HAZLAN', 7000, 3540, '', '1991', '-', '-', 3460, '', '', '2020-02-28 13:28:25', 1),
	(21, 1, 1, 'SU1279B', 'HONDA', 'C100', 'HA13E-4032970', 'PMKHA13209B032932', 'TONY LAMAR (MR.LING)', 0, 0, '', '2009', '-', '-', 0, '', '', '2020-02-28 13:36:39', 1),
	(22, 1, 2, 'SA1313J', 'TOYOTA', 'DYNA HIACE PICK UP', '2L-2897152', 'LH80-0019675', 'REJOS DARIUS', 2400, 1660, '', '1988', '-', '-', 740, '', '', '2020-02-28 14:00:40', 1),
	(23, 1, 1, 'SD1632L', 'DNC ASIATIC HOLDING SDN B', 'DEMAK EX 90', 'PMDD147FMFE507142', 'PMDDLMPF0FE507289', 'LERYSAM JAINUS', 0, 0, '', '2014', '-', '-', 0, '', '', '2020-02-28 14:11:01', 1),
	(24, 1, 3, 'SA1682K', 'DAIHATSU', 'DELTA V57A', '536410', 'V57A-99122', 'FARM TAMPARULI (CHAI KIN FATT)', 2500, 12600, '', '1990', '-', '', 1240, 'OFF ROAD', '', '2020-02-28 14:14:34', 1),
	(25, 1, 3, 'SAA223T', 'TOYOTA', 'LAND CRUISER KR-HDJ101K', '1HD0240691', 'HDJ101-0025449', 'PATRICK SHU', 0, 0, '', '2003', '-', '-', 0, '', '', '2020-02-28 14:16:51', 1),
	(26, 1, 2, 'SAA2240A', 'DAIHATSU', 'V58R-HS DELTA', '639270', 'V58B53386', 'STANDBY AT KILANG', 4500, 1830, '', '2000', '-', '-', 2670, '', '', '2020-02-28 14:21:24', 1),
	(27, 1, 2, 'SAA2288Y', 'ISUZU', 'NPR71L (RB/BK-MOD)', '4HG1693517', 'NPR71L-7422466', 'WILLIAM (SANDAKAN)', 5000, 3310, '', '2009', '-', '-', 1690, 'Puspakom & road tax William (contract farm) claim dengan company', '', '2020-02-28 14:56:00', 1),
	(28, 1, 3, 'QMH2303', 'FORD', 'RANGER UVIM FM1 D/CABIN 4X4', 'WLAT499311', 'PR8CACBAL4LZ02110', 'NICHOLAS WA', 0, 0, '', '2004', '-', '-', 0, '', '', '2020-02-28 15:00:34', 1),
	(29, 1, 2, 'SA2638U', 'ISUZU', 'NPR596-06H', '4BD1-570176', 'JAANPR59PM7110485', '-', 5000, 3250, '', '1996', '-', '-', 1750, 'Not sure if this lorry currently is active or not', '', '2020-02-28 15:04:10', 1),
	(30, 1, 3, 'SAA2848K', 'MAZDA', 'B2500 DOUBLE CAB 4X4', 'WL100245', 'PMZUNYOW2MM101736', 'WORKSHOP (ARTHUR)', 0, 0, '', '2005', '-', '-', 0, '', '', '2020-02-28 15:10:32', 1),
	(31, 1, 3, 'SA285R', 'NISSAN', 'VPC22EFU', 'A15-C004666', 'VPC22-859494', 'RICHMOND (CATCHING TEAM)', 0, 0, '', '1995', '-', '-', 0, '', '', '2020-02-28 15:13:57', 1),
	(32, 1, 3, 'SWA2816', 'NISSAN', 'X-TRAIL 2.0L CVT MID', 'MR20502116C', 'PN8JAAT32TCA49298', 'WONG HUE FEN', 0, 0, '', '2019', 'HONG LEONG BANK', '-', 0, '', '', '2020-02-28 15:23:33', 1),
	(33, 1, 3, 'QMD3303', 'NISSAN', 'SERENA 2.0L EDAARFBC24EX7', 'QR20-571330A', 'PN8EAAC24TCA06125', 'WONG HUE FEN', 0, 0, '', '2005', '-', '-', 0, '', '', '2020-02-28 15:26:23', 1),
	(34, 1, 3, 'SA3398M', 'TOYOTA', 'HILUX SURF', '1KZ-0161794', 'LN130-0095797', 'STANDBY ADMIN', 0, 0, '', '1992', '-', '-', 0, '', '', '2020-02-28 15:29:44', 1),
	(35, 1, 3, 'SAA356V', 'PROTON', 'SAGA 1.3 MANUAL', 'S4PEPD6437', 'PL1BT3SNR8B027593', 'UNCLE CHONG', 0, 0, '', '2008', '-', '-', 0, '', '', '2020-02-28 15:32:26', 1),
	(36, 1, 3, 'SAA3741P', 'KIA', 'PREGIO FPGDH55', 'J2455005', 'PNAKF5S036N003190', 'RICHMOND (CATCHING TEAM)', 0, 0, '', '2006', '-', '-', 0, '', '', '2020-02-28 15:36:56', 1),
	(37, 3, 3, 'SYE3880', 'PROTON', 'X70 1.8 TGDI PREMIUM 2WD', '4G18TDBK4CB0506451', 'L6T7742Z6KU049486', 'WONG WAH PENG', 0, 0, '', '2019', '', '-', 0, '', '', '2020-02-28 15:44:01', 1),
	(38, 1, 3, 'JKL3809', 'TOYOTA', 'HILUX DOUBLE CAB 2.5 MT', '2KD9902310', 'PN133JV2508010632', 'STANDBY ADMIN', 0, 0, '', '2007', '-', '-', 0, '', '', '2020-02-28 15:48:30', 1),
	(39, 1, 3, 'SA3935U', 'TOYOTA', 'L/CRUISER HDJ81V', '1HD-0134771', 'HDJ81-0073105', 'WONG KOK PING', 0, 0, '', '1997', '-', '-', 0, 'Repair cost under IISB', '', '2020-02-28 15:51:07', 1),
	(40, 1, 0, 'SAC4108B', 'TOYOTA', '7FBR18', 'RC28276', '7FBR18-53376', 'KILANG POTONG', 0, 0, '', '2016', 'ORIX CREDIT (M) SDN BHD', '-', 0, '', '', '2020-02-28 15:53:39', 1),
	(41, 1, 1, 'SAB4325X', 'DNC ASIATIC HOLDING SDN B', 'DEMAK EX 90', 'PMDD147FMFE713215', 'PMDDLMPF8FE713251', 'WIDAYAT (FARM SALUT  C & CA)', 0, 0, '', '2014', '-', '-', 0, '', '', '2020-02-28 15:57:37', 1),
	(42, 1, 3, 'SS4465C', 'TOYOTA', 'LITE ACE WINDOW VAN', '5K-9048892', 'KM36-9020352', 'JIMMY (FARM)', 0, 0, '', '1991', '-', '-', 0, '', '', '2020-02-28 16:01:46', 1),
	(43, 1, 2, 'SA4510T', '', '', '', '', '', 0, 0, '', '', '', '', 0, '', '', '2020-02-28 16:02:37', 1),
	(44, 1, 3, 'SAA4832X', 'KIA', 'PREGIO', 'J2-3G2207', 'KNHTR731247139650', 'HAZLAN', 0, 0, '', '2003', '-', '-', 0, 'Angkat budak sekolah', '', '2020-02-28 16:05:57', 1),
	(45, 1, 0, 'BLH5494', 'TOYOTA', '62-8FD25', '1DZ0223590', '608FD25-35279', 'KILANG POTONG', 0, 0, '', '2011', '-', '-', 0, '', '', '2020-02-28 16:11:44', 1),
	(46, 1, 3, 'SA5010M', 'TOYOTA', 'LH113R-RRMS HIACE WINDOW VAN', '3L-2776717', 'LH113-8002764', 'DAIM GANIS', 0, 0, '', '1991', '-', '-', 0, '', '', '2020-02-28 16:13:32', 1),
	(47, 1, 2, 'SA5369M', 'TOYOTA', 'LY50 HIACE PICK UP', '2L-1977857', 'LY50-0020390', 'HUMPHERY @ AH FUI', 2850, 1590, '', '1989', '-', '1260', 0, 'Lori ada di IISB Timbok Farm exchange with ST1311B (Peter Wong-Ulu Kimanis)', '', '2020-02-28 16:18:57', 1),
	(48, 1, 3, 'SA5755Y', 'FORD', 'UT2G FM1 COURIER CREW CAB', 'WL173584', 'SZCWYC24456', 'HIEW KIM SING', 0, 0, '', '2000', '-', '-', 0, '', '', '2020-02-28 16:22:32', 1),
	(49, 1, 3, 'SAB5935J', 'ISUZU', 'TFR54HD1', '4JA1-186621', 'JAATFR54HB7111066', 'JIMMY KOH', 0, 0, '', '2012', '-', '-', 0, 'Repair cost under IISB', '', '2020-02-28 16:24:37', 1),
	(50, 1, 2, 'SAA6173T', 'ISUZU', 'NPR66 (RB/AA/P-MOD)', '4HF1-171419', 'NPR66P-7400126', 'SAFARINA (SALUT AB)', 5000, 2780, '', '2008', '-', '-', 2220, '', '', '2020-02-28 16:27:59', 1),
	(51, 1, 3, 'SA6383A', 'TOYOTA', 'CROWN', '2L-3229609', 'LS110-000219', 'STANDBY ADMIN', 0, 0, '', '1979', '-', '-', 0, '', '', '2020-02-28 16:29:45', 1),
	(52, 1, 0, 'SS7166V', 'HITACHI', 'ZX33U-5A', 'N7215', 'HCMADB90H00032497', 'FARM PENIANG', 0, 0, '', '2014', 'ORIX CREDIT (M) SDN BHD', '-', 0, '', '', '2020-02-28 16:40:21', 1),
	(53, 1, 2, 'ST7999D', 'TOYOTA', 'LY100R-0001703', '2L-9296849', 'LY100-0001703', 'CHAI KIN FATT', 2400, 1530, '', '1995', '-', '-', 870, 'Parking di workshop', '', '2020-02-28 16:54:38', 1),
	(54, 1, 0, 'SAB7033M', 'TOYOTA', '7FBR18-50352', 'RC02804', '7FBR18-50352', 'STOR EP', 0, 0, '', '2012', '-', '', 0, '', '', '2020-02-28 16:57:20', 1),
	(55, 1, 3, 'SA8201T', 'ISUZU', 'TFR54H', '4JA1-280062', 'JAATFR54HT7110199', 'ANTON ABDUL RAHMAN', 0, 0, '', '1996', '-', '-', 0, '', '', '2020-02-28 17:02:22', 1),
	(56, 1, 2, 'ST8225D', 'TOYOTA', 'L/TRUCK', '3L-3133862', 'LY100-0001811', 'AIDIL', 2400, 1670, '', '1995', '-', '-', 730, '', '', '2020-02-28 17:05:53', 1),
	(57, 1, 2, 'SA8393H', 'TOYOTA', 'LIGHT TRUCK', '2L-3654993', 'LH80-0015855', 'HENDRY GABRIEL', 2400, 1530, '', '', '-', '-', 870, '', '', '2020-02-28 17:10:45', 1),
	(58, 1, 3, 'SS8700N', 'TOYOTA', 'HDJ101 LAND CRUISER', '1HD-0195627', 'HDJ101-0019087', 'WONG HUE SUAN', 0, 0, '', '1998', '', '-', 0, '', '', '2020-02-28 17:13:38', 1),
	(59, 1, 3, 'SB8885C', 'AUDI', 'Q7', 'CCF008225', 'WAUZZZ4L0DD004079', 'WONG KOK PING', 0, 0, '', '2012', '-', '-', 0, '', '', '2020-02-28 17:18:28', 1),
	(60, 1, 2, 'SAA8935H', 'DAIHATSU', 'DELTA V58R-HS', 'DL652647', 'V58B63411', '-', 4500, 2580, '', '2004', '-', '-', 1920, '', '', '2020-02-28 17:20:40', 1),
	(61, 1, 3, 'SAB8935J', 'ISUZU', 'TFR54HD1', '4JA1-182601', 'JAATFR54HB7111018', '-', 0, 0, '', '2012', '-', '-', 0, '', '', '2020-02-28 17:24:32', 1),
	(62, 1, 3, 'ST8920C', 'TOYOTA', 'HIACE W/VAN', '2L-2230970', 'LH113-8002483', 'TUDIKI', 0, 0, '', '1991', '', '-', 0, 'Angkat budak sekolah', '', '2020-02-29 11:28:07', 1),
	(63, 1, 2, 'SA935T', '', '', '', '', '', 0, 0, '', '', '', '', 0, '', '', '2020-02-29 11:29:54', 0),
	(64, 1, 2, 'SA935T', 'ISUZU', 'NHR55E', '4JB1-244178', 'JAANHR55EP7108628', 'HJ. KURONG', 2500, 1750, '', '1996', '-', '-', 750, '', '', '2020-02-29 11:34:34', 1),
	(65, 1, 3, 'SAA935A', 'TOYOTA', 'LN166 HILUX DOUBLE CAB 4X4', '3L-4992399', 'LN166-0048879', 'WILLIAM CHONG', 0, 0, '', '2000', '-', '-', 0, '', '', '2020-02-29 11:36:42', 1),
	(66, 1, 3, 'SAA935F', 'TOYOTA', 'HILUX DOUBLE CAB (M)', '2KD-9150794', '2KDN165-0024437', 'HENDRY GABRIEL', 0, 0, '', '2003', '-', '-', 0, '', '', '2020-02-29 11:39:01', 1),
	(67, 1, 3, 'SAA935J', 'TOYOTA', 'HILUX DOUBLE CAB 2.5L', '2KD-9378113', 'PN133JV2508000175', 'CHEE YUN CHOI @ AH CHI', 0, 0, '', '2005', '', '-', 0, 'Contract farm at Kota Belud', '', '2020-02-29 11:41:24', 1),
	(68, 1, 1, 'SAB935B', 'HONDA', 'C100', 'HA13E-4077378', 'PMKHA13209B077542', 'RIDWAN', 0, 0, '', '2009', '', '-', 0, 'Office boy', '', '2020-02-29 11:44:26', 1),
	(69, 1, 3, 'SD9935L', 'ISUZU', 'UCS86GFT001681', '4JK1NG3207', 'MPAUCS86GFT001681', 'LING HENG CHIONG', 0, 0, '', '2015', 'PUBLIC BANK BERHAD', '-', 0, '', '', '2020-02-29 11:46:58', 1),
	(70, 1, 3, 'SAA9935T', 'TOYOTA', 'HILUX DOUBLE CAB 2.5 AT', '1JZ-6071842', 'PN133JV2508510015', 'JAPAR KURONG', 0, 0, '', '2008', '-', '-', 0, 'Repair cost under IISB', '', '2020-02-29 11:51:41', 1),
	(71, 1, 3, 'SAB9935P', 'TOYOTA', 'HILUX DOUBLE CAB 2.5', '2KDU31751', 'PN133JV2508277532', 'ANDY CHONG', 0, 0, '', '2013', '', '-', 0, '', '', '2020-02-29 11:53:31', 1),
	(72, 3, 0, 'SAC351B', 'TOYOTA', '62-8FD30', '1DZ0317595', '608FDJ35-64089', 'FEEDMILL', 0, 0, '', '2015', 'ORIX CREDIT (M) SDN BHD', '-', 0, '', '', '2020-02-29 11:56:20', 1),
	(73, 3, 0, 'SAC349B', 'TOYOTA', '62-8FD30', '1DZ0314510', '608FDJ35-63348', 'FEEDMILL', 0, 0, '', '2015', 'ORIX CREDIT (M) SDN BHD', '-', 0, '', '', '2020-02-29 11:58:33', 1),
	(74, 3, 0, 'SAC348B', 'TOYOTA', '62-8FD30', '1DZ0316897', '608FDJ35-64038', 'FEEDMILL', 0, 0, '', '2015', 'ORIX CREDIT (M) SDN BHD', '-', 0, '', '', '2020-02-29 12:00:50', 1),
	(75, 0, 0, 'WDK528', '', '', '', '', '', 0, 0, '', '', '', '', 0, 'Lorry is currently active but not sure which farm used this lorry ', '', '2020-02-29 12:02:47', 1),
	(76, 3, 3, 'SB618A', 'TOYOTA', 'HZJ80R-GCPNS', '1HZ-0210036', 'HZJ80-0032474', 'DR. SAFIUL', 0, 0, '', '1997', '-', '-', 0, 'Repair cost under IISB', '', '2020-02-29 12:05:37', 1),
	(77, 3, 3, 'ST6322J', 'HYUNDAI', 'ACCENT 1.5L', 'G4EB3706786', 'MHC03G706755', 'STANDBY ADMIN', 0, 0, '', '2005', '-', '-', 0, '', '', '2020-02-29 12:07:48', 1),
	(78, 3, 3, 'SAA6668G', 'TOYOTA', 'KG-HDJ101K LAND CRUISER', '1HD-0260409', 'HDJ101-0026518', 'WONG WAH PENG', 0, 0, '', '2004', '-', '-', 0, '', '', '2020-02-29 12:10:32', 1),
	(79, 3, 3, 'SAB9706A', 'ISUZU', 'TFS85HD1', '4JJ1-GV4211', 'JAATFS85H77106338', 'ALEX LO', 0, 0, '', '2010', '', '-', 0, 'Mr. Wong brother in-law', '', '2020-02-29 12:13:33', 1),
	(80, 3, 3, 'SA9855N', 'TOYOTA', 'L/CRUISER HDJ81', '1HD-001894', 'HDJ81-0000489', 'WORKSHOP (ARTHUR)', 0, 0, '', '1991', '', '-', 0, '', '', '2020-02-29 12:16:18', 1),
	(81, 3, 3, 'SAA9935E', 'TOYOTA', 'HILUX DOUBLE CAB (M)', '2L1982576', 'KDN165-0022803', 'WORKSHOP PDU', 0, 0, '', '2003', '', '-', 0, 'Breakdown', '', '2020-02-29 12:18:17', 1),
	(82, 3, 3, 'SM9935', 'TOYOTA', 'FORTUNER 2.4 AT 4X2', '2GD0491387', 'PN1GB3GS302400124', 'ANTHONY ASTRAL', 0, 0, '', '2018', '', '-', 0, 'Feedmill manager', '', '2020-02-29 12:20:34', 1),
	(83, 3, 3, 'SA6288X', 'TOYOTA', 'LAND CRUISER PICK UP', '1HZ-0302846', 'HZJ75-0054077', '', 0, 0, '', '1999', '', '-', 0, 'Not sure if this lorry currently is active or not', '', '2020-02-29 12:27:43', 1),
	(84, 3, 3, 'SA6315U', '1997', 'INVADER CREW CAB', '4JB1T-288062', 'JAATFS55HT7101054', '', 0, 0, '', '1997', '-', '-', 0, 'Not sure if this lorry currently is active or not', '', '2020-02-29 12:30:05', 1),
	(85, 3, 2, 'SA3879L', 'DAIHATSU', 'DELTA V57A', 'DL51-532738', 'V57A-75240', '', 2500, 1770, '', '1991', '', '-', 730, 'Not sure if this lorry currently is active or not', '', '2020-02-29 12:32:24', 1),
	(86, 3, 3, 'SS4299C', '1991', 'NISSAN', 'TD27-456305', 'VJGE24-A00799', '', 2500, 1640, '', '1990', '-', '-', 860, 'Not sure if this lorry currently is active or not', '', '2020-02-29 12:34:39', 1),
	(87, 3, 3, 'SA6315U', 'ISUZU', 'INVADER CREW CAB', '4JB1T-288062', 'JAATFS55HT7101054', '', 0, 0, '', '1997', '-', '-', 0, 'Not sure if this lorry currently is active or not', '', '2020-02-29 12:36:16', 1),
	(88, 3, 2, 'SS1606E', 'FORD', 'PICK-UP', '644218', 'SZMWTY-83654', '', 2450, 1120, '', '1996', '-', '-', 1330, 'Not sure if this lorry currently is active or not', '', '2020-02-29 12:38:24', 1),
	(89, 8, 1, 'SU1280B', 'YAMAHA', 'EGO S', 'E3A8EE046805', 'PMYKE108090046805', 'ROY (LOGISTICS)', 0, 0, '', '2009', '-', '-', 0, '', '', '2020-03-03 10:41:30', 1),
	(90, 8, 2, 'SA1450L', 'ISUZU', 'NPR596', '4BE1-289362', '7103398', 'WORKSHOP PDU', 7000, 3530, '', '1990', '-', '-', 3470, '', '', '2020-03-03 10:48:31', 1),
	(91, 8, 2, 'WVT1605', 'ISUZU', 'NKR55UEE', '4JB1110313', 'JAANNKR55EA7108899', 'LOGISTICS STANDBY LORRY', 4500, 2600, '', '2011', '-', '-', 1900, '', '', '2020-03-03 10:52:48', 1),
	(92, 8, 2, 'SAA1676L', 'TUAH', 'KM188 HFC1048KL', 'CY4102BZL005077542', 'PMMTH381040500161', '', 5000, 2560, '', '2005', '', '', 2440, 'Not sure if this lorry currently is active or not', '', '2020-03-03 11:07:39', 1),
	(93, 8, 2, 'QAV1766', 'ISUZU', 'NKR66 (RB/NEK N01)', '4HF1601362', 'NKR66E-7532984', 'SOON SHUEN VUI', 5000, 2910, '', '2010', '-', '-', 2090, '', '', '2020-03-03 11:21:55', 1),
	(94, 8, 2, 'SAB1935K', 'HINO', 'XZU423R-HKMRD3', 'N04CTT26288', 'JHFYT20H807002085', 'RAMLI', 8300, 3660, '', '2011', '-', '-', 0, '', '', '2020-03-03 11:50:16', 1),
	(95, 8, 2, 'SAA1935U', 'TOYOTA', 'XZU 412 (RB/FP BD1)', 'S05CA13801', 'XZU412-0001336', 'RAHIM KURONG', 7000, 3420, '', '2007', '-', '-', 3580, '', '', '2020-03-03 16:14:08', 1),
	(96, 6, 2, 'SB8366', 'NISSAN', 'CM87KA C/W BASIN', 'FE6-017518B', 'CM87KA-07274', 'WALTER EDIP', 9950, 4510, '', '1993', '-', '-', 5440, '', '', '2020-03-04 14:46:14', 1),
	(97, 19, 3, 'SK7223', 'TOYOTA', 'TOYOTA HILUX DOUBLE CAB ', '2KD6146121', 'PN133JV2508016215', 'LO CHEE LEONG', 0, 0, '', '2008', '', '-', 0, '', '', '2020-03-04 15:17:32', 1),
	(98, 8, 2, 'SAB6935K', 'NISSAN', 'CD45C (RB/AA VM1)', 'PF6-307412B', 'CD45CV-11667', 'MANSUR LADJAMA', 21000, 11580, '', '2012', '-', '-', 9420, '', '', '2020-03-04 15:56:18', 1),
	(99, 8, 2, 'SAA1223B', 'HICOM', 'HICOM PERKASA 150DX', '4HF17858302', 'PML60CL2R1P003368', 'JOSEPH A/L DUYA', 5000, 3510, '', '2001', '-', '-', 1490, '', '', '2020-03-04 16:04:06', 1),
	(100, 6, 2, 'SAA9935K', 'NISSAN ', 'NU41H5', 'FD46-025184', 'NU41H5-051256', 'JEFFRY P.RATU ARAN', 7500, 3470, '', '2004', '-', '-', 4030, '', '', '2020-03-04 16:19:57', 1),
	(101, 8, 2, 'SA3937M', 'NISSAN ', 'CPB15N', 'NE6-010893T', 'CPB15N-01757', 'ALIMUDDIN BIN LAPAWELA', 16000, 7800, '', '1991', '-', '-', 8200, '', '', '2020-03-04 16:32:15', 1),
	(102, 8, 2, 'SAA2335A', 'DAIHATSU', 'DELTA V58R', '638544', 'V58B53376', 'Standby driver (Logistics)', 4500, 2200, '', '2000', '-', '-', 2300, '', '', '2020-03-05 13:30:25', 1),
	(103, 8, 2, 'JGK2378', 'DAIH', 'DELTA V116-HA', '', '', '', 0, 0, '', '2002', '', '', 0, '', '', '2020-03-05 13:33:24', 0),
	(104, 8, 2, 'JGK2378', 'DAIHATSU', 'DELTA V116-HA', '1686099', 'JDA00V11600097426', 'Standby driver (Logistics)', 5000, 2770, '', '2002', '-', '-', 2230, '', '', '2020-03-05 13:37:32', 1),
	(105, 8, 2, 'SAA2674T', 'SERI ZENITH ENG.SDN.BHD', 'SZESTR-40', '-', 'E7STR20251', 'Standby Trailer', 32000, 3920, '', '2007', '-', '-', 28080, '', '', '2020-03-05 13:43:36', 1),
	(106, 8, 2, 'SAA2935U', 'NISSAN', 'CD53 (RB/AA VM)', 'RG8-102482', 'CD53BVF-00002', 'JAINAL BIN BIDIN', 21000, 12120, '', '2008', '-', '-', 8880, '', '', '2020-03-05 13:48:29', 1),
	(107, 8, 2, 'SAB2935L', 'HINO', 'XZU423R-HKMRD3', '', 'JHFYT20H107002087', 'MEDI', 8300, 4160, '', '2011', 'ORIX CREDIT MALAYSIA SDN BHD', '-', 4140, '', '', '2020-03-05 14:01:35', 1),
	(108, 8, 2, 'SAA3150A', 'HICOM', 'PERKASA MTB150DX', '736298', 'PML60CL2R1P002451', 'RAHIM', 5000, 3510, '', '2000', '-', '-', 1490, '', '', '2020-03-05 14:21:36', 1),
	(109, 8, 2, 'SA3286W', 'NISSAN', 'CPB15NE', 'FE6-202962C', 'CPB15NE-01172', 'JIROM BIN RIMPUN', 16000, 7460, '', '1997', '-', '-', 8540, '', '', '2020-03-05 14:25:55', 1),
	(110, 8, 2, 'ST3453E', 'ISUZU', 'NHR 55 E', '4JB1-339260', 'JAANHR55E', 'IMPIAN SEWA-HATCHERY', 4100, 2160, '', '1997', '-', '-', 1940, '', '', '2020-03-05 14:33:31', 1),
	(111, 8, 2, 'SA389H', 'ISUZU', 'TRUCK', '4BD1-100720', '4622836', 'STANDBY LOGISTIC', 7000, 3250, '', '1986', '-', '-', 3750, '', '', '2020-03-05 14:53:44', 1),
	(112, 8, 2, 'SAA3935U', 'NISSAN', 'CD45 (RB/AA VM1)', 'PF6-404338B', 'CD45CV-21336', 'MUHIDIN BIN HARIS', 21000, 10050, '', '2008', '', '-', 10559, '', '', '2020-03-05 14:57:41', 1),
	(113, 8, 2, 'SAB3935J', 'HINO', 'XZU423R-HKMRD3 (UBS)', 'N04CTT24999', 'JHFYT20H307001846', 'SUHAIMI', 8300, 3880, '', '2011', 'ORIX CREDIT MALAYSIA SDN BHD', '-', 4420, '', '', '2020-03-05 15:03:52', 1),
	(114, 8, 2, 'SAB3935K', 'NISSAN', 'CWM272 (RB/AA)', 'MD92-505433B', 'CWM272HT-00001', 'MASRAN BIN LANABA', 21000, 9550, '', '2012', 'ORIX CREDIT MALAYSIA SDN BHD', '', 11450, '', '', '2020-03-05 15:08:04', 1),
	(115, 8, 2, 'SAA3980J', 'ISUZU', 'NKR66L (RB/AA)', '4HF1-138945', 'NKR66L-7100696', 'VITALIS', 5000, 3610, '', '2005', '-', '-', 1390, '', '', '2020-03-05 15:13:39', 1),
	(116, 8, 2, 'SAB3685W', 'HINO', 'WU720R-HKMQL3', 'W04DTN31366', 'JHHYJL1H101911211', 'JEFRIN GANIS', 5000, 3430, '', '2014', 'ORIX CREDIT MALAYSIA SDN BHD', '-', 1570, '', '', '2020-03-05 15:17:34', 1),
	(117, 8, 2, 'SAB4135K', 'HINO', 'WU300R-HBLMS3', 'W04DJ48914', 'JHFAF04H206005920', 'REAY DEONT', 4800, 2870, '', '2011', '-', '-', 1930, '', '', '2020-03-05 15:22:09', 1),
	(118, 8, 2, 'SU4596A', 'ISUZU', 'NPR71L CHASSIS CAB', '4HG1469233', 'NPR71L-7413527', 'STANDBY DRIVER (LOGISTICS)', 5000, 3420, '', '2004', '-', '-', 1580, '', '', '2020-03-05 15:26:25', 1),
	(119, 8, 2, 'SA5073M', 'ISUZU', 'NPR596-03A TRUCK', '4BD1-121102', '7101767', 'STANDBY DRIVER (LOGISTICS)', 7000, 3150, '', '1991', '', '', 3850, '', '', '2020-03-05 15:29:29', 1),
	(120, 8, 2, 'SS5166D', 'ISUZU', 'NHR55E PICK UP', '986137', 'JAANHR55EP', 'FOO SIU VAN', 4100, 2100, '', '1995', '-', '-', 2000, '', '', '2020-03-05 16:51:56', 1),
	(121, 8, 2, 'SAA5279F', 'DAIHATSU', 'DELTA V116-HA CHASSIS CAB', '14B1731184', 'JDA00V11600A01280', 'RAHIM KURONG', 5000, 2820, '', '2003', '-', '-', 2180, '', '', '2020-03-05 16:55:11', 1),
	(122, 8, 2, 'SAC5408C', 'NISSAN', 'MK211 (RB/BC 053)', 'FE6-117684E', 'MK211K-13034', 'IBNU PORING', 12000, 5170, '', '2016', '-', '-', 6830, '', '', '2020-03-05 17:01:40', 1),
	(123, 8, 3, 'SA5863M', 'DAIHATSU', 'DELTA V57A', '568572', 'V57A-80939', 'FARM TOPOKON', 2500, 1890, '', '1992', '-', '-', 610, '', '', '2020-03-05 17:05:07', 1),
	(124, 8, 2, 'SAB5935A', 'NISSAN', 'CD53 (RB/EMS V)', 'RG8-200390', 'CD53CW-20065', 'MOHD NAWI', 21000, 11770, '', '2009', 'ORIX CREDIT MALAYSIA SDN BHD', '-', 9230, '', '', '2020-03-05 17:08:43', 1),
	(125, 8, 2, 'SAB5935F', 'HINO', 'XZU423R-HKMRD3', 'NO4CTT24181', 'JHFYT20H507001699', 'ZUNIDY', 8300, 3990, '', '2011', 'ORIX CREDIT MALAYSIA SDN BHD', '-', 4310, '', '', '2020-03-05 17:14:07', 1),
	(126, 8, 2, 'SAB5935K', 'NISSAN', 'CD45 (RB/AA VM1)', 'PF6-307444C', 'CD45CV-11692', 'MADRA BIN ARIS', 21000, 11540, '', '2012', 'ORIX CREDIT MALAYSIA SDN BHD', '-', 9460, '', '', '2020-03-05 17:18:17', 1),
	(128, 1, 3, 'SA1221L', 'MITSUBISHI CANTER', 'MITSUBISHI', '4D31-851694', 'FE434E-A45419', '', 0, 0, '', '1991', '', '', 0, 'bas sekolah baru - any payment related such as road tax and insurance asked bos - kena beli on 16.08.2017 - EPCS RENTAL-BELUM TUKAR NAMA (WONG WEE SHIN)', 'ACTIVE', '2020-04-13 10:47:42', 1),
	(129, 1, 2, 'SA 935 T', 'ISUZU', 'NHR55E LIGHT TRUCK', '4JB1-244178', 'JAANHR55EP7108628', '', 0, 0, '', '1996', '', '', 0, '-', 'ACTIVE', '2020-04-13 10:47:42', 1),
	(130, 1, 5, 'JJB3117', 'MAZDA', 'FORKLIFT~ 5FD20', '1Z-0017733', '5FD25-22764', '', 0, 0, '', '2002', '', '', 0, 'TIDAK TAU APA KEJADIAN KAD TIADA ', 'ACTIVE', '2020-04-13 10:47:42', 1),
	(131, 1, 5, 'QAQ4346', 'TOYOTA', 'FORKLIFT ~ 7FBR15', 'RA05384', '906', '', 0, 0, '', '2007', '', '', 0, 'TIDAK TAU APA KEJADIAN KAD TIADA ', 'ACTIVE', '2020-04-13 10:47:42', 1),
	(132, 1, 5, 'SA7697E', 'KOMATSU', 'FORKLIFT- FD30-8', 'C240-617797', '141739', '', 0, 0, '', '1984', '', '', 0, 'TIDAK TAU APA KEJADIAN KAD TIADA ', 'ACTIVE', '2020-04-13 10:47:42', 1);
/*!40000 ALTER TABLE `vehicle_vehicle_ori` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
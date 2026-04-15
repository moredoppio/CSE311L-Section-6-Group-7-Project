-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2026 at 09:32 PM
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
-- Database: `denguetrackingsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `division` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address_id`, `street_address`, `city`, `district`, `division`, `postal_code`, `latitude`, `longitude`) VALUES
(1, 'House 10, Road 4, Dhanmondi', 'Dhaka', 'Dhaka', 'Dhaka', '1205', 23.74610000, 90.37420000);

-- --------------------------------------------------------

--
-- Table structure for table `bloodinventory`
--

CREATE TABLE `bloodinventory` (
  `blood_bag_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `donor_id` int(11) NOT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `blood_type` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') DEFAULT NULL,
  `component_type` enum('Whole Blood','Red Blood Cells','Platelet','Fresh Frozen Plasma','Cryoprecipitate') DEFAULT NULL,
  `status_of_bag` enum('Available','Reserved','Used','Expired') DEFAULT NULL,
  `storage_temperature` decimal(4,1) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `amount` decimal(6,2) DEFAULT NULL,
  `is_irradiated` tinyint(1) DEFAULT 0,
  `is_leuko_reduced` tinyint(1) DEFAULT 0,
  `processing_date` date DEFAULT NULL,
  `transfusion_date` date DEFAULT NULL,
  `compatibility` decimal(10,5) DEFAULT NULL,
  `donation_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bloodinventory`
--

INSERT INTO `bloodinventory` (`blood_bag_id`, `hospital_id`, `donor_id`, `encounter_id`, `blood_type`, `component_type`, `status_of_bag`, `storage_temperature`, `expiry_date`, `amount`, `is_irradiated`, `is_leuko_reduced`, `processing_date`, `transfusion_date`, `compatibility`, `donation_date`) VALUES
(1, 1, 2, 1, 'O+', 'Platelet', 'Used', NULL, '2023-10-10', NULL, 0, 0, NULL, NULL, NULL, '2023-10-01');

-- --------------------------------------------------------

--
-- Table structure for table `dailymonitoring`
--

CREATE TABLE `dailymonitoring` (
  `monitor_date` date NOT NULL,
  `encounter_id` int(11) NOT NULL,
  `nurse_id` int(11) NOT NULL,
  `temperature` decimal(4,2) NOT NULL,
  `blood_pressure` varchar(20) NOT NULL,
  `platelet_count` int(11) NOT NULL,
  `hematocrit_level` decimal(5,2) NOT NULL,
  `urine_output` decimal(6,2) NOT NULL,
  `respiratory_rate` int(11) NOT NULL,
  `oxygen_saturation` decimal(5,2) NOT NULL,
  `pain_level` int(11) NOT NULL,
  `doctor_notes` text DEFAULT NULL,
  `nurse_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dailymonitoring`
--

INSERT INTO `dailymonitoring` (`monitor_date`, `encounter_id`, `nurse_id`, `temperature`, `blood_pressure`, `platelet_count`, `hematocrit_level`, `urine_output`, `respiratory_rate`, `oxygen_saturation`, `pain_level`, `doctor_notes`, `nurse_notes`) VALUES
('2023-10-02', 1, 2, 99.99, '110/70', 85000, 42.00, 1500.00, 18, 98.50, 5, 'Patient stable, continue hydration.', 'Vitals recorded at 10 AM. Patient complains of mild headache.');

-- --------------------------------------------------------

--
-- Table structure for table `denguedetails`
--

CREATE TABLE `denguedetails` (
  `dengue_id` int(11) NOT NULL,
  `encounter_id` int(11) NOT NULL,
  `severity_level` enum('Mild','Moderate','Severe','Critical') DEFAULT NULL,
  `dengue_type` enum('Classic','Hemorrhagic','Shock Syndrome') NOT NULL,
  `warning_signs` text DEFAULT NULL,
  `infection_source` enum('Local','Travel','Indeterminate') DEFAULT NULL,
  `travel_history` text DEFAULT NULL,
  `icu_admission` tinyint(1) DEFAULT 0,
  `hospitalization_required` tinyint(1) DEFAULT 1,
  `diagnosis_date` date DEFAULT NULL,
  `outcome` enum('Recovered','Deceased','Under Treatment','Referred') NOT NULL,
  `follow_up_date` date DEFAULT NULL,
  `doctors_note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `denguedetails`
--

INSERT INTO `denguedetails` (`dengue_id`, `encounter_id`, `severity_level`, `dengue_type`, `warning_signs`, `infection_source`, `travel_history`, `icu_admission`, `hospitalization_required`, `diagnosis_date`, `outcome`, `follow_up_date`, `doctors_note`) VALUES
(1, 1, 'Moderate', 'Classic', NULL, 'Local', NULL, 0, 1, '2023-10-01', 'Under Treatment', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `donor_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donors`
--

INSERT INTO `donors` (`donor_id`, `address_id`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contacts`
--

CREATE TABLE `emergency_contacts` (
  `contact_id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `contact_name` varchar(100) NOT NULL,
  `contact_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emergency_contacts`
--

INSERT INTO `emergency_contacts` (`contact_id`, `people_id`, `contact_name`, `contact_number`) VALUES
(1, 1, 'Salma Begum', '01511223344');

-- --------------------------------------------------------

--
-- Table structure for table `encounter`
--

CREATE TABLE `encounter` (
  `encounter_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `encounter`
--

INSERT INTO `encounter` (`encounter_id`, `patient_id`, `hospital_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `hospital_id` int(11) NOT NULL,
  `hospital_name` varchar(100) NOT NULL,
  `hospital_type` enum('Public','Private','Clinic') NOT NULL,
  `total_beds` int(11) DEFAULT NULL,
  `icu_beds` int(11) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `division` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`hospital_id`, `hospital_name`, `hospital_type`, `total_beds`, `icu_beds`, `street_address`, `city`, `district`, `division`, `postal_code`, `latitude`, `longitude`) VALUES
(1, 'Dhaka Medical College', 'Public', 2500, 100, 'Bakshibazar', 'Dhaka', 'Dhaka', 'Dhaka', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hospital_contacts`
--

CREATE TABLE `hospital_contacts` (
  `hospital_contact_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `hospital_contact_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospital_contacts`
--

INSERT INTO `hospital_contacts` (`hospital_contact_id`, `hospital_id`, `hospital_contact_number`) VALUES
(1, 1, '01711223344');

-- --------------------------------------------------------

--
-- Table structure for table `labtests`
--

CREATE TABLE `labtests` (
  `test_id` int(11) NOT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `technician_id` int(11) DEFAULT NULL,
  `test_date` datetime DEFAULT NULL,
  `test_type` enum('NS1 Antigen','IgM Antibody','IgG Antibody','PCR','Complete Blood Count','Platelet Count') DEFAULT NULL,
  `test_result` varchar(50) DEFAULT NULL,
  `result_value` decimal(10,2) DEFAULT NULL,
  `normal_range` varchar(50) DEFAULT NULL,
  `lab_name` varchar(100) DEFAULT NULL,
  `technicians_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `labtests`
--

INSERT INTO `labtests` (`test_id`, `encounter_id`, `technician_id`, `test_date`, `test_type`, `test_result`, `result_value`, `normal_range`, `lab_name`, `technicians_notes`) VALUES
(1, 1, 1, '2023-10-01 10:00:00', 'NS1 Antigen', 'Positive', 1.50, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `people_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `national_id` varchar(20) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `date_of_birth` date NOT NULL,
  `age` int(11) GENERATED ALWAYS AS (timestampdiff(YEAR,`date_of_birth`,curdate())) VIRTUAL,
  `blood_type` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`people_id`, `first_name`, `last_name`, `national_id`, `gender`, `date_of_birth`, `blood_type`, `email`) VALUES
(1, 'Rahim', 'Uddin', '1990123456789', 'Male', '1990-05-15', 'A+', 'rahim@email.com'),
(2, 'Karim', 'Ahmed', '1985987654321', 'Male', '1985-11-20', 'O+', 'karim@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `people_phones`
--

CREATE TABLE `people_phones` (
  `phone_id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `people_phones`
--

INSERT INTO `people_phones` (`phone_id`, `people_id`, `phone_number`) VALUES
(1, 1, '01811122233'),
(2, 2, '01911122233');

-- --------------------------------------------------------

--
-- Table structure for table `residesat`
--

CREATE TABLE `residesat` (
  `resides_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `is_primary` tinyint(1) DEFAULT 0,
  `address_type` enum('Permanent','Current','Work') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `residesat`
--

INSERT INTO `residesat` (`resides_id`, `patient_id`, `address_id`, `is_primary`, `address_type`) VALUES
(1, 1, 1, 1, 'Permanent');

-- --------------------------------------------------------

--
-- Table structure for table `treatments`
--

CREATE TABLE `treatments` (
  `treatment_id` int(11) NOT NULL,
  `encounter_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `initial_diagnosis` text DEFAULT NULL,
  `prescribed_medications` text DEFAULT NULL,
  `iv_fluid_required` tinyint(1) DEFAULT 0,
  `transfusion_required` tinyint(1) DEFAULT 0,
  `treatment_type` enum('Inpatient','Outpatient','ICU') DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `discharge_date` date DEFAULT NULL,
  `treatment_duration` varchar(50) DEFAULT NULL,
  `treatment_cost` decimal(10,2) DEFAULT NULL,
  `treatment_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatments`
--

INSERT INTO `treatments` (`treatment_id`, `encounter_id`, `doctor_id`, `initial_diagnosis`, `prescribed_medications`, `iv_fluid_required`, `transfusion_required`, `treatment_type`, `admission_date`, `discharge_date`, `treatment_duration`, `treatment_cost`, `treatment_notes`) VALUES
(1, 1, 1, NULL, NULL, 0, 0, 'Inpatient', '2023-10-01', NULL, NULL, 5500.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Doctor','Nurse','Technician','Admin') DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `hospital_id`, `username`, `password`, `role`, `first_name`, `last_name`, `email`) VALUES
(1, 1, 'dr_rahim', 'pass123', 'Doctor', 'Rahim', 'Hasan', 'drrahim@hospital.com'),
(2, 1, 'nr_kamal', 'pass450', 'Nurse', 'Kamal', 'Rubeen', 'nrrubeen@kamalrubeen');

-- --------------------------------------------------------

--
-- Table structure for table `user_phones`
--

CREATE TABLE `user_phones` (
  `user_phone_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_phones`
--

INSERT INTO `user_phones` (`user_phone_id`, `user_id`, `user_phone_number`) VALUES
(1, 1, '01611223344');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `bloodinventory`
--
ALTER TABLE `bloodinventory`
  ADD PRIMARY KEY (`blood_bag_id`),
  ADD KEY `hospital_id` (`hospital_id`),
  ADD KEY `donor_id` (`donor_id`),
  ADD KEY `encounter_id` (`encounter_id`);

--
-- Indexes for table `dailymonitoring`
--
ALTER TABLE `dailymonitoring`
  ADD PRIMARY KEY (`monitor_date`,`encounter_id`),
  ADD KEY `nurse_id` (`nurse_id`),
  ADD KEY `encounter_id` (`encounter_id`);

--
-- Indexes for table `denguedetails`
--
ALTER TABLE `denguedetails`
  ADD PRIMARY KEY (`dengue_id`),
  ADD KEY `encounter_id` (`encounter_id`);

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`donor_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `people_id` (`people_id`);

--
-- Indexes for table `encounter`
--
ALTER TABLE `encounter`
  ADD PRIMARY KEY (`encounter_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `hospital_id` (`hospital_id`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`hospital_id`);

--
-- Indexes for table `hospital_contacts`
--
ALTER TABLE `hospital_contacts`
  ADD PRIMARY KEY (`hospital_contact_id`),
  ADD KEY `hospital_id` (`hospital_id`);

--
-- Indexes for table `labtests`
--
ALTER TABLE `labtests`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `encounter_id` (`encounter_id`),
  ADD KEY `technician_id` (`technician_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`people_id`),
  ADD UNIQUE KEY `national_id` (`national_id`);

--
-- Indexes for table `people_phones`
--
ALTER TABLE `people_phones`
  ADD PRIMARY KEY (`phone_id`),
  ADD KEY `people_id` (`people_id`);

--
-- Indexes for table `residesat`
--
ALTER TABLE `residesat`
  ADD PRIMARY KEY (`resides_id`,`patient_id`,`address_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `treatments`
--
ALTER TABLE `treatments`
  ADD PRIMARY KEY (`treatment_id`),
  ADD KEY `encounter_id` (`encounter_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `hospital_id` (`hospital_id`);

--
-- Indexes for table `user_phones`
--
ALTER TABLE `user_phones`
  ADD PRIMARY KEY (`user_phone_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bloodinventory`
--
ALTER TABLE `bloodinventory`
  MODIFY `blood_bag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `denguedetails`
--
ALTER TABLE `denguedetails`
  MODIFY `dengue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `encounter`
--
ALTER TABLE `encounter`
  MODIFY `encounter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `hospital_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hospital_contacts`
--
ALTER TABLE `hospital_contacts`
  MODIFY `hospital_contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `labtests`
--
ALTER TABLE `labtests`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `people_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `people_phones`
--
ALTER TABLE `people_phones`
  MODIFY `phone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `residesat`
--
ALTER TABLE `residesat`
  MODIFY `resides_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `treatments`
--
ALTER TABLE `treatments`
  MODIFY `treatment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_phones`
--
ALTER TABLE `user_phones`
  MODIFY `user_phone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bloodinventory`
--
ALTER TABLE `bloodinventory`
  ADD CONSTRAINT `bloodinventory_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`hospital_id`),
  ADD CONSTRAINT `bloodinventory_ibfk_2` FOREIGN KEY (`donor_id`) REFERENCES `donors` (`donor_id`),
  ADD CONSTRAINT `bloodinventory_ibfk_3` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`);

--
-- Constraints for table `dailymonitoring`
--
ALTER TABLE `dailymonitoring`
  ADD CONSTRAINT `dailymonitoring_ibfk_1` FOREIGN KEY (`nurse_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `dailymonitoring_ibfk_2` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`);

--
-- Constraints for table `denguedetails`
--
ALTER TABLE `denguedetails`
  ADD CONSTRAINT `denguedetails_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`);

--
-- Constraints for table `donors`
--
ALTER TABLE `donors`
  ADD CONSTRAINT `donors_ibfk_1` FOREIGN KEY (`donor_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `donors_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`);

--
-- Constraints for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  ADD CONSTRAINT `emergency_contacts_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE;

--
-- Constraints for table `encounter`
--
ALTER TABLE `encounter`
  ADD CONSTRAINT `encounter_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `encounter_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`hospital_id`);

--
-- Constraints for table `hospital_contacts`
--
ALTER TABLE `hospital_contacts`
  ADD CONSTRAINT `hospital_contacts_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`hospital_id`) ON DELETE CASCADE;

--
-- Constraints for table `labtests`
--
ALTER TABLE `labtests`
  ADD CONSTRAINT `labtests_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  ADD CONSTRAINT `labtests_ibfk_2` FOREIGN KEY (`technician_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE;

--
-- Constraints for table `people_phones`
--
ALTER TABLE `people_phones`
  ADD CONSTRAINT `people_phones_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `people` (`people_id`) ON DELETE CASCADE;

--
-- Constraints for table `residesat`
--
ALTER TABLE `residesat`
  ADD CONSTRAINT `residesat_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `residesat_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`);

--
-- Constraints for table `treatments`
--
ALTER TABLE `treatments`
  ADD CONSTRAINT `treatments_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  ADD CONSTRAINT `treatments_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`hospital_id`);

--
-- Constraints for table `user_phones`
--
ALTER TABLE `user_phones`
  ADD CONSTRAINT `user_phones_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

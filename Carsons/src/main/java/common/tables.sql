use sql5776488;

USE sql5776488;

-- Clear all tables if they exist
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Vehicle;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS User;

-- Create User table
CREATE TABLE IF NOT EXISTS User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    license_no VARCHAR(20) UNIQUE,
    license_expiry_date DATE,
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    contact_no VARCHAR(20)
);

-- Create Location table
CREATE TABLE IF NOT EXISTS Location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    district VARCHAR(50),
    location_contact_no VARCHAR(20),
    street_no VARCHAR(10),
    street VARCHAR(100),
    city VARCHAR(50)
);

-- Create Vehicle table
CREATE TABLE IF NOT EXISTS Vehicle (
    vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(50),
    model VARCHAR(50),
    brand VARCHAR(50),
    gear VARCHAR(20),
    color VARCHAR(30),
    seat_no INT,
    fuel_option VARCHAR(30),
    plate_no VARCHAR(20) UNIQUE,
    daily_rate DECIMAL(10,2)
);

-- Create Reservation table with return_location
CREATE TABLE IF NOT EXISTS Reservation (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    vehicle_id INT,
    location_id INT,
    pickup_date DATE,
    return_date DATE,
    amount DECIMAL(10,2),
    no_of_dates INT,
    pickup_location VARCHAR(100),
    return_location VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

-- Insert Users
INSERT INTO User (first_name, last_name, license_no, license_expiry_date, email, password, contact_no) VALUES
('Nimal', 'Perera', 'B1234567', '2026-12-31', 'nimalp@gmail.com', 'pw1234', '0771234567'),
('Kamal', 'Fernando', 'C7654321', '2025-11-30', 'kamalf@yahoo.com', 'pw2345', '0712345678'),
('Sunil', 'De Silva', 'D2345678', '2027-01-01', 'sunild@hotmail.com', 'pw3456', '0758765432'),
('Amali', 'Gunasekara', 'E3456789', '2024-05-15', 'amali.g@ymail.com', 'pw4567', '0729988776'),
('Chathura', 'Wijesinghe', 'F4567890', '2025-09-20', 'chathura@gmail.com', 'pw5678', '0761122334'),
('Iresha', 'Wickramasinghe', 'G5678901', '2026-03-10', 'iresha@yahoo.com', 'pw6789', '0783344556'),
('Ruwan', 'Jayasinghe', 'H6789012', '2027-07-25', 'ruwanj@gmail.com', 'pw7890', '0775566778'),
('Dilani', 'Rathnayake', 'J7890123', '2025-08-18', 'dilani@hotmail.com', 'pw8901', '0746677889'),
('Sanjeewa', 'Abeysekara', 'K8901234', '2024-10-12', 'sanjeewa@gmail.com', 'pw9012', '0701122445'),
('Harsha', 'Karunaratne', 'L9012345', '2026-06-05', 'harsha.k@hotmail.com', 'pw0123', '0739988776');

-- Insert Locations
INSERT INTO Location (district, location_contact_no, street_no, street, city) VALUES
('Colombo', '0112123456', '101', 'Galle Road', 'Colombo 03'),
('Kandy', '0812233445', '22B', 'Peradeniya Road', 'Kandy'),
('Galle', '0913344556', '34', 'Matara Road', 'Galle'),
('Jaffna', '0211122334', '12A', 'Stanley Road', 'Jaffna'),
('Kurunegala', '0374455667', '9', 'Negombo Road', 'Kurunegala'),
('Anuradhapura', '0256677889', '5', 'Stage 1', 'Anuradhapura'),
('Nuwara Eliya', '0528899001', '7B', 'Queen Elizabeth Drive', 'Nuwara Eliya'),
('Matara', '0417788990', '16', 'Beach Road', 'Matara'),
('Ratnapura', '0456677889', '21', 'Gem Street', 'Ratnapura'),
('Batticaloa', '0659988776', '3', 'Main Street', 'Batticaloa');

-- Insert Vehicles
INSERT INTO Vehicle (category, model, brand, gear, color, seat_no, fuel_option, plate_no, daily_rate) VALUES
('Car', 'Axio', 'Toyota', 'Automatic', 'White', 5, 'Petrol', 'CAG-1234', 8000.00),
('SUV', 'Vezel', 'Honda', 'Automatic', 'Black', 5, 'Hybrid', 'WP-AB 4567', 9500.00),
('Van', 'KDH', 'Toyota', 'Manual', 'Silver', 14, 'Diesel', 'NC-1234', 12000.00),
('Car', 'Premio', 'Toyota', 'Automatic', 'Blue', 5, 'Petrol', 'WP-KD 7890', 8500.00),
('Three-Wheeler', 'Bajaj RE', 'Bajaj', 'Manual', 'Red', 3, 'Petrol', 'SP-1234', 3000.00),
('SUV', 'XTrail', 'Nissan', 'Automatic', 'Gray', 7, 'Diesel', 'CP-GH 5678', 9800.00),
('Car', 'Swift', 'Suzuki', 'Manual', 'Yellow', 4, 'Petrol', 'EP-2345', 7000.00),
('Car', 'Aqua', 'Toyota', 'Automatic', 'Green', 5, 'Hybrid', 'WP-LK 3456', 7600.00),
('Van', 'Hiace', 'Toyota', 'Manual', 'White', 12, 'Diesel', 'WP-PQ 4321', 11000.00),
('Car', 'Alto', 'Suzuki', 'Manual', 'Maroon', 4, 'Petrol', 'WP-AL 9876', 5000.00);

-- Insert Reservations (now includes return_location)
INSERT INTO Reservation (user_id, vehicle_id, location_id, pickup_date, return_date, amount, no_of_dates, pickup_location, return_location) VALUES
(1, 1, 1, '2025-06-10', '2025-06-13', 24000.00, 3, 'Galle Road, Colombo 03', 'Galle Road, Colombo 03'),
(2, 2, 2, '2025-07-01', '2025-07-05', 47500.00, 5, 'Peradeniya Road, Kandy', 'Peradeniya Road, Kandy'),
(3, 3, 3, '2025-07-10', '2025-07-11', 24000.00, 2, 'Matara Road, Galle', 'Matara Road, Galle'),
(4, 4, 4, '2025-08-01', '2025-08-03', 25500.00, 3, 'Stanley Road, Jaffna', 'Stanley Road, Jaffna'),
(5, 5, 5, '2025-09-15', '2025-09-16', 6000.00, 2, 'Negombo Road, Kurunegala', 'Negombo Road, Kurunegala'),
(6, 6, 6, '2025-10-05', '2025-10-08', 29400.00, 3, 'Stage 1, Anuradhapura', 'Stage 1, Anuradhapura'),
(7, 7, 7, '2025-11-01', '2025-11-03', 21000.00, 3, 'Queen Elizabeth Drive, Nuwara Eliya', 'Queen Elizabeth Drive, Nuwara Eliya'),
(8, 8, 8, '2025-12-10', '2025-12-13', 22800.00, 3, 'Beach Road, Matara', 'Beach Road, Matara'),
(9, 9, 9, '2025-12-15', '2025-12-18', 33000.00, 3, 'Gem Street, Ratnapura', 'Gem Street, Ratnapura'),
(10, 10, 10, '2025-12-20', '2025-12-22', 10000.00, 2, 'Main Street, Batticaloa', 'Main Street, Batticaloa');

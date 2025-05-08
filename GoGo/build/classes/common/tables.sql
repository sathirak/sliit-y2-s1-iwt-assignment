-- Use database
USE sql5776488;

-- Drop tables if they exist (optional for resetting)
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Vehicle;
DROP TABLE IF EXISTS Location;

-- Create User table
CREATE TABLE User (
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
CREATE TABLE Location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    district VARCHAR(50),
    location_contact_no VARCHAR(20),
    street_no VARCHAR(10),
    street VARCHAR(100),
    city VARCHAR(50)
);

-- Create Vehicle table
CREATE TABLE Vehicle (
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

-- Create Reservation table
CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    vehicle_id INT,
    location_id INT,
    pickup_date DATE,
    return_date DATE,
    amount DECIMAL(10,2),
    no_of_dates INT,
    pickup_location VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

-- Seed User data
INSERT INTO User (first_name, last_name, license_no, license_expiry_date, email, password, contact_no)
VALUES 
('Kamal', 'Perera', 'B1234567', '2027-05-12', 'kamal.perera@example.lk', 'password123', '0771234567'),
('Nimali', 'Fernando', 'C7654321', '2026-11-20', 'nimali.fernando@example.lk', 'securepass', '0712345678'),
('Suresh', 'De Silva', 'D1112223', '2025-09-30', 'suresh.desilva@example.lk', 'suresh@2024', '0759876543');

-- Seed Location data
INSERT INTO Location (district, location_contact_no, street_no, street, city)
VALUES 
('Colombo', '0112345678', '25', 'Galle Road', 'Colombo'),
('Kandy', '0812233445', '12A', 'Peradeniya Road', 'Kandy'),
('Galle', '0915678999', '8B', 'Matara Road', 'Galle');

-- Seed Vehicle data
INSERT INTO Vehicle (category, model, brand, gear, color, seat_no, fuel_option, plate_no, daily_rate)
VALUES 
('Car', 'Axio', 'Toyota', 'Automatic', 'White', 5, 'Petrol', 'CAG-1234', 8500.00),
('SUV', 'Vezel', 'Honda', 'Automatic', 'Black', 5, 'Hybrid', 'CAD-9876', 12000.00),
('Van', 'HiAce', 'Toyota', 'Manual', 'Silver', 12, 'Diesel', 'CAB-4567', 15000.00);

-- Seed Reservation data
INSERT INTO Reservation (user_id, vehicle_id, location_id, pickup_date, return_date, amount, no_of_dates, pickup_location)
VALUES 
(1, 1, 1, '2025-06-01', '2025-06-05', 42500.00, 5, 'Colombo - Galle Road'),
(2, 2, 2, '2025-06-10', '2025-06-12', 24000.00, 2, 'Kandy - Peradeniya'),
(3, 3, 3, '2025-07-01', '2025-07-07', 105000.00, 7, 'Galle - Matara Road');

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
('Car', 'X5', 'BMW', 'Automatic', 'Midnight Black', 5, 'Petrol', 'ABC-1234', 15000.0),
('Car', 'Model S', 'Tesla', 'Automatic', 'Pearl White', 5, 'Electric', 'TES-4567', 18000.0),
('Car', 'Civic', 'Honda', 'Manual', 'Blue', 5, 'Petrol', 'STP 7890', 9500.0),
('Van', 'KDH', 'Toyota', 'Manual', 'Silver', 15, 'Diesel', 'TOY-2345', 12000.0),
('Car', 'C-Class', 'Benz', 'Automatic', 'Metallic Silver', 5, 'Petrol', 'BE 6789', 16000.0),
('Car', '800', 'Alto', 'Manual', 'Red', 4, 'Petrol', 'KT-4611', 5500.0),
('Car', 'Alion', 'Toyota', 'Automatic', 'Grey', 5, 'Petrol', 'AKI-1082', 8500.0),
('Bike', 'Pep+', 'Scooty', 'Automatic', 'Pink', 2, 'Petrol', 'SCT-3903', 3000.0),
('Car', 'Prius', 'Toyota', 'Automatic', 'Royal Gold', 5, 'Hybrid', 'PRI-4652', 13000.0),
('SUV', 'TX', 'Prado', 'Automatic', 'Deep Blue', 7, 'Diesel', 'PRD-7791', 17000.0),
('SUV', 'Outlander', 'Mitsubishi', 'Automatic', 'Titanium Grey', 7, 'Petrol', 'MIT-8466', 15500.0),
('Three Wheeler', 'RE', 'Bajaj', 'Manual', 'Yellow', 3, 'Petrol', 'BAJ-1254', 2500.0),
('SUV', 'X-Trail', 'Nissan', 'Automatic', 'Pearl Black', 7, 'Hybrid', 'NIS-1004', 14500.0),
('Cart', 'Thirikkale', 'Local', 'Manual', 'Brown', 3, 'Petrol', 'TY-4623', 2000.0);

-- Create Reservation table
INSERT INTO Reservation (user_id, vehicle_id, location_id, pickup_date, return_date, amount, no_of_dates, pickup_location, return_location) VALUES
(1, 1, 1, '2025-05-20', '2025-05-23', 45000.00, 3, 'Colombo', 'Colombo'),
(2, 2, 2, '2025-06-01', '2025-06-03', 36000.00, 2, 'Kandy', 'Kandy'),
(3, 3, 3, '2025-05-18', '2025-05-20', 19000.00, 2, 'Galle', 'Galle'),
(4, 4, 4, '2025-05-25', '2025-05-28', 36000.00, 3, 'Jaffna', 'Jaffna'),
(5, 6, 5, '2025-06-05', '2025-06-07', 11000.00, 2, 'Kurunegala', 'Kurunegala'),
(6, 7, 6, '2025-05-22', '2025-05-26', 34000.00, 4, 'Anuradhapura', 'Anuradhapura'),
(7, 8, 7, '2025-06-10', '2025-06-12', 6000.00, 2, 'Nuwara Eliya', 'Nuwara Eliya'),
(8, 9, 8, '2025-05-28', '2025-06-01', 52000.00, 4, 'Matara', 'Matara'),
(9, 11, 9, '2025-06-02', '2025-06-04', 31000.00, 2, 'Ratnapura', 'Ratnapura'),
(10, 12, 10, '2025-06-08', '2025-06-11', 7500.00, 3, 'Batticaloa', 'Batticaloa');

SELECT * FROM sql12779118.User;
SELECT * FROM sql12779118.Location;
SELECT * FROM sql12779118.Vehicle;
SELECT * FROM sql12779118.Reservation;
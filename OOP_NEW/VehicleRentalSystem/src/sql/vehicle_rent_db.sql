USE sql12774435;


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

SHOW TABLES;
select * from User;
select * from Location;
select * from Vehicle;
select * from Reservation;

-- Insert sample users
INSERT INTO User (first_name, last_name, license_no, license_expiry_date, email, password, contact_no)
VALUES 
('John', 'Doe', 'DL12345', '2026-10-01', 'john.doe@example.com', 'johnpass', '1234567890'),
('Jane', 'Smith', 'DL54321', '2025-05-15', 'jane.smith@example.com', 'janepass', '9876543210');

-- Insert sample locations
INSERT INTO Location (district, location_contact_no, street_no, street, city)
VALUES 
('Central', '111-222-333', '12A', 'Main Street', 'Metropolis'),
('West', '444-555-666', '45B', 'West Avenue', 'Gotham');

-- Insert sample vehicles
INSERT INTO Vehicle (category, model, brand, gear, color, seat_no, fuel_option, plate_no, daily_rate)
VALUES 
('SUV', 'Tucson', 'Hyundai', 'Automatic', 'Black', 5, 'Diesel', 'ABC1234', 75.50),
('Sedan', 'Civic', 'Honda', 'Manual', 'Red', 4, 'Petrol', 'XYZ9876', 60.00);

-- Insert sample reservations
INSERT INTO Reservation (user_id, vehicle_id, location_id, pickup_date, return_date, amount, no_of_dates, pickup_location, return_location)
VALUES 
(1, 1, 2, '2025-04-25', '2025-04-28', 226.50, 3, 'Main Street', 'West Avenue'),
(2, 2, 1, '2025-04-22', '2025-04-24', 120.00, 2, 'West Avenue', 'Main Street');



ALTER table Reservation
DROP column return_location;


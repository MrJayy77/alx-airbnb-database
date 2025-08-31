-- =========================
-- SCHEMA: Airbnb Clone DB
-- =========================

-- Drop tables if they already exist (safety for re-runs)
DROP TABLE IF EXISTS Payments, Bookings, Properties, Users;

-- =========================
-- 1. Users Table
-- =========================
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    Phone VARCHAR(20),
    DateOfBirth DATE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_users_email ON Users(Email);


-- =========================
-- 2. Properties Table
-- =========================
CREATE TABLE Properties (
    PropertyID INT AUTO_INCREMENT PRIMARY KEY,
    HostID INT NOT NULL,
    Title VARCHAR(200) NOT NULL,
    Description TEXT,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    PricePerNight DECIMAL(10,2) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (HostID) REFERENCES Users(UserID) ON DELETE CASCADE
);

CREATE INDEX idx_properties_city ON Properties(City);
CREATE INDEX idx_properties_country ON Properties(Country);


-- =========================
-- 3. Bookings Table
-- =========================
CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    PropertyID INT NOT NULL,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    Status ENUM('pending','confirmed','cancelled') DEFAULT 'pending',
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID) ON DELETE CASCADE
);

CREATE INDEX idx_bookings_user ON Bookings(UserID);
CREATE INDEX idx_bookings_property ON Bookings(PropertyID);


-- =========================
-- 4. Payments Table
-- =========================
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Method ENUM('credit_card','debit_card','paypal','bank_transfer') NOT NULL,
    Status ENUM('pending','completed','failed','refunded') DEFAULT 'pending',
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID) ON DELETE CASCADE
);

CREATE INDEX idx_payments_booking ON Payments(BookingID);

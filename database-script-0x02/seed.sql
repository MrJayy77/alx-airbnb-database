-- ================================
-- Seeding Users
-- ================================
INSERT INTO users (first_name, last_name, email, password_hash, phone_number)
VALUES
('Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '1234567890'),
('Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '0987654321'),
('Charlie', 'Brown', 'charlie@example.com', 'hashed_pw3', '1122334455');

-- ================================
-- Seeding Properties
-- ================================
INSERT INTO properties (owner_id, title, description, address, city, country, price_per_night, capacity)
VALUES
(1, 'Cozy Apartment in Accra', 'A nice 2-bedroom apartment in central Accra.', '123 Osu Road', 'Accra', 'Ghana', 50.00, 3),
(2, 'Beach House in Cape Coast', 'Beautiful house near the beach.', '45 Beach Road', 'Cape Coast', 'Ghana', 120.00, 6),
(3, 'Luxury Villa in Kumasi', 'Spacious villa with pool.', '9 Garden Street', 'Kumasi', 'Ghana', 200.00, 8);

-- ================================
-- Seeding Bookings
-- ================================
INSERT INTO bookings (user_id, property_id, check_in_date, check_out_date, status)
VALUES
(1, 2, '2025-09-10', '2025-09-15', 'confirmed'),
(2, 1, '2025-09-05', '2025-09-07', 'completed'),
(3, 3, '2025-09-20', '2025-09-25', 'pending');

-- ================================
-- Seeding Payments
-- ================================
INSERT INTO payments (booking_id, amount, payment_date, payment_method, status)
VALUES
(1, 600.00, '2025-09-01', 'credit_card', 'successful'),
(2, 100.00, '2025-08-30', 'paypal', 'successful'),
(3, 1000.00, '2025-09-10', 'bank_transfer', 'pending');

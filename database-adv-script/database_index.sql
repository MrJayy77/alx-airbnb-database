-- Create indexes on high-usage columns

-- User table
CREATE INDEX idx_user_email ON User (email);
CREATE INDEX idx_user_username ON User (username);

-- Booking table
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_booking_booking_date ON Booking (booking_date);

-- Property table
CREATE INDEX idx_property_location ON Property (location);
CREATE INDEX idx_property_city ON Property (city);

-- Measure query performance using EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT u.username, COUNT(b.id) AS total_bookings
FROM User u
JOIN Booking b ON u.id = b.user_id
WHERE b.booking_date >= '2024-01-01'
GROUP BY u.username
ORDER BY total_bookings DESC;

EXPLAIN ANALYZE
SELECT p.city, COUNT(b.id) AS total_bookings
FROM Property p
LEFT JOIN Booking b ON p.id = b.property_id
GROUP BY p.city
ORDER BY total_bookings DESC;

-- Indexes for User table (used in WHERE/JOIN)
CREATE INDEX idx_user_email ON User (email);
CREATE INDEX idx_user_username ON User (username);

-- Indexes for Booking table (used in JOIN/WHERE/ORDER BY)
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_booking_booking_date ON Booking (booking_date);

-- Indexes for Property table (used in JOIN/WHERE)
CREATE INDEX idx_property_location ON Property (location);
CREATE INDEX idx_property_city ON Property (city);

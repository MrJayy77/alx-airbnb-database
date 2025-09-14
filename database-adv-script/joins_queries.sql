-- 1️⃣ INNER JOIN: Get all bookings and the users who made them
SELECT 
    bookings.booking_id,
    bookings.property_id,
    bookings.booking_date,
    users.user_id,
    users.name AS user_name,
    users.email
FROM bookings
INNER JOIN users
    ON bookings.user_id = users.user_id;

-- 2️⃣ LEFT JOIN: Get all properties and their reviews (include properties with no reviews)
SELECT 
    properties.property_id,
    properties.name AS property_name,
    reviews.review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews
    ON properties.property_id = reviews.property_id;

-- 3️⃣ FULL OUTER JOIN: Get all users and all bookings
-- (Note: MySQL does NOT support FULL OUTER JOIN directly — use UNION of LEFT + RIGHT)
SELECT 
    users.user_id,
    users.name AS user_name,
    bookings.booking_id,
    bookings.booking_date
FROM users
LEFT JOIN bookings
    ON users.user_id = bookings.user_id

UNION

SELECT 
    users.user_id,
    users.name AS user_name,
    bookings.booking_id,
    bookings.booking_date
FROM users
RIGHT JOIN bookings
    ON users.user_id = bookings.user_id;

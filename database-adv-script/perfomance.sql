-- Step 1: Original complex query
SELECT 
    b.id AS booking_id,
    b.booking_date,
    b.check_in,
    b.check_out,
    u.id AS user_id,
    u.username,
    u.email,
    p.id AS property_id,
    p.name AS property_name,
    p.city,
    pay.id AS payment_id,
    pay.amount,
    pay.payment_date,
    pay.status
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id
ORDER BY b.booking_date DESC;

-- Step 2: Analyze performance
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.booking_date,
    b.check_in,
    b.check_out,
    u.id AS user_id,
    u.username,
    u.email,
    p.id AS property_id,
    p.name AS property_name,
    p.city,
    pay.id AS payment_id,
    pay.amount,
    pay.payment_date,
    pay.status
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id
ORDER BY b.booking_date DESC;

-- Step 3: Refactored query with filtering (uses AND)
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.booking_date,
    u.username,
    p.name AS property_name,
    pay.amount
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id
WHERE b.booking_date >= '2024-01-01'
  AND p.city = 'Accra'
ORDER BY b.booking_date DESC;

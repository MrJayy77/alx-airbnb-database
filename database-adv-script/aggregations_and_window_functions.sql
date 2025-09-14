-- aggregations_and_window_functions.sql

-- 1) Aggregation: total number of bookings made by each user
SELECT
  u.user_id,
  u.name AS user_name,
  COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b
  ON u.user_id = b.user_id
GROUP BY u.user_id, u.name
ORDER BY total_bookings DESC;


-- 2) Window functions: rank properties by total bookings using ROW_NUMBER() and RANK()
SELECT
  t.property_id,
  t.property_name,
  t.total_bookings,
  ROW_NUMBER() OVER (ORDER BY t.total_bookings DESC) AS row_number,
  RANK()      OVER (ORDER BY t.total_bookings DESC) AS booking_rank
FROM (
  SELECT
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings
  FROM properties p
  LEFT JOIN bookings b
    ON p.property_id = b.property_id
  GROUP BY p.property_id, p.name
) AS t
ORDER BY row_number;

# Index Performance Report

## Identified High-Usage Columns
- **User table**: `email`, `username` (frequently used in WHERE clauses for login/search)
- **Booking table**: `user_id`, `property_id` (used in JOINs), `booking_date` (used in ORDER BY and WHERE)
- **Property table**: `location`, `city` (used in search filters)

## Index Creation
We created the following indexes (see `database_index.sql`):

- `idx_user_email`, `idx_user_username`
- `idx_booking_user_id`, `idx_booking_property_id`, `idx_booking_booking_date`
- `idx_property_location`, `idx_property_city`

## Performance Measurement
We tested this query before and after creating indexes:

```sql
EXPLAIN ANALYZE
SELECT u.username, COUNT(b.id) AS total_bookings
FROM User u
JOIN Booking b ON u.id = b.user_id
WHERE b.booking_date >= '2024-01-01'
GROUP BY u.username
ORDER BY total_bookings DESC;

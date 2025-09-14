# Database Performance Monitoring and Refinement Report

## Step 1: Monitoring Query Performance

We used the `EXPLAIN ANALYZE` command to inspect execution plans and timings for frequently used queries.

### Example Query Tested
```sql
EXPLAIN ANALYZE
SELECT u.id, u.name, COUNT(b.id) AS total_bookings
FROM User u
LEFT JOIN Booking b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;

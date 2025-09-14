# Optimization Report

## Initial Query
- Retrieved all details from Booking, User, Property, and Payment using multiple joins.
- Used `ORDER BY booking_date DESC` which scanned the entire table.

## Performance Analysis
- `EXPLAIN ANALYZE` showed a full table scan on `Booking` and `Property`.
- High execution time due to:
  - Selecting all columns
  - No filtering (`WHERE`)
  - Sorting a large result set

## Optimizations Applied
1. **Created Indexes**
   - On `Booking.user_id`, `Booking.property_id`, `Booking.booking_date`
   - On `User.id` and `Property.id`
   - On `Payment.booking_id`

2. **Refactored Query**
   - Selected only needed columns (`username`, `property_name`, `amount`)
   - Added a `WHERE booking_date >= '2024-01-01'` to limit rows
   - Kept `ORDER BY` on an indexed column (`booking_date`)

## Results
- Execution time reduced significantly.
- Query planner now uses indexes for joins and sorting.
- Less memory usage and fewer rows processed.

## Conclusion
Using indexes and selecting only required columns greatly improved performance, especially on large datasets.

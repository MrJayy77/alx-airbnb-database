# Partitioning Performance Report

## Objective
We implemented **range partitioning** on the `Booking` table based on the `start_date` column to improve query performance on large datasets.

## Before Partitioning
- A full table scan was performed for date range queries.
- Queries on specific date ranges (e.g., year 2023) took noticeably longer.
- `EXPLAIN ANALYZE` showed many rows being read from the entire table.

## After Partitioning
- Only the relevant partitions (based on year) are scanned for queries.
- `EXPLAIN ANALYZE` showed fewer rows read and faster execution time.
- Query performance for `WHERE start_date BETWEEN ...` improved significantly.

## Conclusion
Partitioning reduced query execution time and resource usage by limiting scans to only the relevant partitions.  
This is particularly beneficial when dealing with large datasets containing several years of booking data.

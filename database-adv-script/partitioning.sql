-- Step 1: Drop the old Booking table backup (if it exists)
DROP TABLE IF EXISTS Booking_Partitioned;

-- Step 2: Recreate Booking table with PARTITION BY RANGE on start_date
CREATE TABLE Booking_Partitioned (
    id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (property_id) REFERENCES Property(id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Step 3: Example insert data (optional test)
INSERT INTO Booking_Partitioned (id, user_id, property_id, start_date, end_date, status)
VALUES
(1, 10, 100, '2022-05-10', '2022-05-15', 'confirmed'),
(2, 11, 101, '2023-07-12', '2023-07-20', 'pending'),
(3, 12, 102, '2024-01-05', '2024-01-08', 'confirmed');

-- Step 4: Test query performance on a date range
EXPLAIN ANALYZE
SELECT *
FROM Booking_Partitioned
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

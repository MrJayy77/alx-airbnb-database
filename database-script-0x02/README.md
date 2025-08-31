# Database Seeding Script

## Overview
This script (`seed.sql`) populates the database with sample data for testing and development purposes.  
Entities covered:
- Users
- Properties
- Bookings
- Payments

## Usage
1. Ensure you have already created the schema (`schema.sql`).
2. Run the following command in your SQL client:
   ```bash
   psql -U <username> -d <database> -f seed.sql

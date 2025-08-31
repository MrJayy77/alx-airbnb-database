# Airbnb Clone Database Schema

## 📌 Overview
This project defines the **database schema** for an Airbnb-like system.  
It includes tables for **Users, Properties, Bookings, and Payments** with proper relationships, constraints, and indexes.

## 🗄️ Entities & Relationships
- **Users**: Stores user details (guests & hosts).
- **Properties**: Listings created by hosts.
- **Bookings**: Reservation details made by users for properties.
- **Payments**: Transactions linked to bookings.

### Relationships:
- One **User** can list many **Properties**.
- One **User** can make many **Bookings**.
- One **Property** can have many **Bookings**.
- One **Booking** has one **Payment**.

## 🛠️ How to Run
1. Clone this repository:
   ```bash
   git clone https://github.com/<your-username>/alx-airbnb-database.git
   cd alx-airbnb-database/database-script-0x01

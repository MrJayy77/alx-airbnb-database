Entities & Attributes
1. User

user_id (PK)

name

email

phone

password

role (guest, host, admin)

2. Property

property_id (PK)

title

description

address

city

price_per_night

owner_id (FK → User.user_id)

3. Booking

booking_id (PK)

user_id (FK → User.user_id)

property_id (FK → Property.property_id)

start_date

end_date

status (pending, confirmed, cancelled)

total_price

4. Payment

payment_id (PK)

booking_id (FK → Booking.booking_id)

payment_date

amount

payment_method (card, mobile money, PayPal, etc.)

status (completed, failed, refunded)

Relationships

User → Booking: One user can make many bookings (1 : M).

User → Property: One user (host) can own many properties (1 : M).

Property → Booking: One property can have many bookings (1 : M).

Booking → Payment: One booking can have one or more payments (1 : M).
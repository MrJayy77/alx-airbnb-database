1. First Normal Form (1NF)

 Rule: Ensure all attributes are atomic (no repeating groups, no multi-valued attributes).

 Applied Changes:

Split User’s FullName into FirstName and LastName.

Ensure Property stores single values (e.g., City, Country instead of Location text blob).

Bookings store one property and one user per record (no multiple values in a single field).

2. Second Normal Form (2NF)

 Rule: Must be in 1NF and all non-key attributes fully depend on the whole primary key (remove partial dependencies).

 Applied Changes:

In Booking, attributes like CheckInDate and CheckOutDate depend on the full primary key BookingID, not part of it.

In Payment, Amount and PaymentDate depend entirely on PaymentID.

No attribute depends only on part of a composite key → therefore, 2NF satisfied.

3. Third Normal Form (3NF)

 Rule: Must be in 2NF and no transitive dependencies (non-key attributes should depend only on the key).

Applied Changes:

If Property had HostName stored directly, remove it (because HostName is dependent on UserID, not PropertyID). Instead, keep HostID (foreign key) → we can always join with User to fetch host details.

In Booking, do not store TotalAmount if it can be derived from Payment.

In User, do not store calculated values like Age; instead, store DateOfBirth.

Final Normalized Schema (3NF)

User(UserID PK, FirstName, LastName, Email, PasswordHash, Phone, DateOfBirth)

Property(PropertyID PK, HostID FK→User, Title, Description, Address, City, Country, PricePerNight)

Booking(BookingID PK, UserID FK→User, PropertyID FK→Property, CheckInDate, CheckOutDate, Status)

Payment(PaymentID PK, BookingID FK→Booking, Amount, PaymentDate, Method, Status)

All relations are in 3NF:

No repeating groups (1NF)

All non-key attributes depend on the full key (2NF)

No transitive dependencies (3NF)
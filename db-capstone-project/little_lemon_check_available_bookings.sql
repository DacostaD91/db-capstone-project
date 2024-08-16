/*
Task 1
Little Lemon wants to populate the Bookings table of their database with some records of data. 
Your first task is to replicate the list of records in the following table by adding them 
to the Little Lemon booking table. 

You can use simple INSERT statements to complete this task.
*/
INSERT INTO `LittleLemonDB`.`Bookings` (BookingID, BookingDate, TableNumber, CustomerID)
VALUES 
(1, '2022-10-10', 5, 1),
(2, '2022-11-12', 3, 3),
(3, '2022-10-11', 2, 2),
(4, '2022-10-13', 2, 1);

/*
Task 2
For your second task, Little Lemon need you to create a stored procedure called CheckBooking 
to check whether a table in the restaurant is already booked. Creating this procedure 
helps to minimize the effort involved in repeatedly coding the same SQL statements.

The procedure should have two input parameters in the form of booking date and table number.
You can also create a variable in the procedure to check the status of each table.
*/
DELIMITER //
CREATE PROCEDURE CheckBooking(IN bookingDate DATE, IN tableNumber INT)
BEGIN
	SET @isBooked = (SELECT COUNT(*) 
	FROM bookings 
	WHERE BookingDate = bookingDate
    AND TableNumber = tableNumber);
   
   SELECT IF(@isBooked > 0, CONCAT('Table ', tableNumber, ' is already booked'), 
                            CONCAT('Table ', tableNumber, ' is Free')) AS 'Booking Info';

END //
DELIMITER ;

SET @bookingDate = '2024-08-01';
SET @tableNumber = 5;
CALL CheckBooking(@bookingDate, @tableNumber)

/*
Task 3
For your third and final task, Little Lemon need to verify a booking, and decline any 
reservations for tables that are already booked under another name. 

Since integrity is not optional, Little Lemon need to ensure that every booking attempt 
includes these verification and decline steps. However, implementing these steps requires
a stored procedure and a transaction. 

To implement these steps, you need to create a new procedure called AddValidBooking.This 
procedure must use a transaction statement to perform a rollback if a customer reserves 
a table that’s already booked under another name.  

Use the following guidelines to complete this task:

	The procedure should include two input parameters in the form of booking date and table number.

	It also requires at least one variable and should begin with a START TRANSACTION statement.

	Your INSERT statement must add a new booking record using the input parameter's values.

	Use an IF ELSE statement to check if a table is already booked on the given date. 

	If the table is already booked, then rollback the transaction. If the table is available, 
	then commit the transaction. 
*/

DELIMITER //

CREATE PROCEDURE AddValidBooking(
    IN bookingDate DATE,
    IN tableNumber INT,
    IN customerID INT,
    IN numberOfGuests INT,
    IN bookingTime TIME
)
BEGIN
    DECLARE isBooked INT;

    -- Start the transaction
    START TRANSACTION;

    -- Check if the table is already booked on the given date
    SET isBooked = (SELECT COUNT(*) 
                    FROM bookings 
                    WHERE BookingDate = bookingDate 
                    AND TableNumber = tableNumber);

    -- Conditional logic based on the booking status
    IF isBooked > 0 THEN
        -- Rollback the transaction if the table is already booked
        ROLLBACK;
        SELECT CONCAT('Booking failed: Table ', tableNumber, ' is already booked on ', bookingDate) AS 'Booking Status';
    ELSE
        -- Insert the new booking
        INSERT INTO bookings (BookingDate, TableNumber, CustomerID, NumberOfGuests, BookingTime)
        VALUES (bookingDate, tableNumber, customerID, numberOfGuests, bookingTime);

        -- Commit transaction
        COMMIT;
        SELECT CONCAT('Booking successful: Table ', tableNumber, ' is booked for ', bookingDate) AS 'Booking Status';
    END IF;

END //

DELIMITER ;

CALL AddValidBooking('2024-08-20', 5, 1, 4, '19:00:00');
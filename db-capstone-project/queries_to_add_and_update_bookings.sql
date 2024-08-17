/*
Task 1
In this first task you need to create a new procedure called AddBooking to add a new table 
booking record.

The procedure should include four input parameters in the form of the following bookings 
parameters:

	booking id, 

	customer id, 

	booking date,

	and table number.

*/
DELIMITER //

CREATE PROCEDURE AddBooking(
	IN bookingDate DATE,
    IN tableNumber INT,
    IN customerID INT,
    IN numberOfGuests INT,
    IN bookingTime TIME
)
BEGIN
    -- Insert the new booking record into the bookings table
    INSERT INTO bookings (BookingDate, TableNumber, CustomerID, NumberOfGuests, BookingDate)
    VALUES (bookingDate, tableNumber, customerID, numberOfGuests, bookingDate);

    -- Output a confirmation message
    SELECT CONCAT('Booking for customer ', CustomerID, ' has been added successfully.') AS 'Booking Status';
END //

DELIMITER ;

/*
Task 2
For your second task, Little Lemon need you to create a new procedure called UpdateBooking 
that they can use to update existing bookings in the booking table.

The procedure should have two input parameters in the form of booking id and booking date. 
You must also include an UPDATE statement inside the procedure. 
*/

DELIMITER //

CREATE PROCEDURE RescheduleBooking(
    IN bookingID INT, 
    IN customerID INT, 
    IN newBookingDate DATE, 
    IN newBookingTime TIME
)
BEGIN
    -- Update the booking date and time for the specified booking ID and customer ID
    UPDATE bookings
    SET BookingDate = newBookingDate, 
        BookingTime = newBookingTime
    WHERE BookingID = bookingID 
      AND CustomerID = customerID;
    
    -- Output a message indicating the update status
    SELECT CONCAT('Booking ID ', bookingID, ' for Customer ID ', customerID, 
                  ' has been updated to ', newBookingDate, ' at ', newBookingTime) AS ScheduleStatus;
END //

DELIMITER ;

CALL UpdateBooking(3, 1, '2023-12-25', '18:30:00');


/*
Task 3
For the third and final task, Little Lemon need you to create a new procedure called 
CancelBooking that they can use to cancel or remove a booking.

The procedure should have one input parameter in the form of booking id. You must also 
write a DELETE statement inside the procedure. 

*/
DELIMITER //

CREATE PROCEDURE UpdateBookingStatus(
    IN bookingID INT, 
    IN customerID INT, 
    IN newStatus INT
)
BEGIN
    -- Update the booking date and time for the specified booking ID and customer ID
    UPDATE bookings
    SET BookingStatus = newStatus
    WHERE BookingID = bookingID 
      AND CustomerID = customerID;
    
    -- Output a message indicating the update status
    SELECT CONCAT('Booking ID ', bookingID, ' for Customer ID ', customerID, 
                  ' has been cancelled ') AS UpdateStatus;
END //

DELIMITER ;

CALL UpdateBookingStatus(3, 1, 3);









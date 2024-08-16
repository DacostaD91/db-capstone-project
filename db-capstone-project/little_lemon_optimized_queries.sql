# Task 1: Creating a Stored Procedure to Display the Maximum Ordered Quantity
DELIMITER //
CREATE PROCEDURE GetMaxOrderQuantity()
BEGIN
	SELECT MAX(Quantity) AS MaxQuantity
    FROM Orders;
END //

DELIMITER ;

# Task 2: Creating a Prepared Statement Called GetOrderDetail
 DELIMITER //
 CREATE PROCEDURE GetOrderDetail(IN CustID INT)
 BEGIN 
	PREPARE	 stmt FROM 'SELECT OrderID, Quantity, TotalCost 
						FROM `LittleLemonDB`.`Orders` 
						WHERE CustomerID = ?';
    SET @CustID = CustID;
    EXECUTE stmt USING @CustID;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

SET @id = 1;
CALL GetOrderDetail(@id);

# Task 3: Creating a Stored Procedure Called CancelOrder

DELIMITER //

CREATE PROCEDURE CancelOrder(IN OrderID INT)
BEGIN
    DELETE FROM `LittleLemonDB`.`Orders` WHERE OrderID = OrderID;
    SELECT CONCAT('Order ', OrderID, ' is Cancelled') AS Result;
END //

DELIMITER ;

-- Calling the procedure:
CALL CancelOrder(5);



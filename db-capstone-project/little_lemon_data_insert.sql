USE `LittleLemonDB`;

INSERT INTO `LittleLemonDB`.`Customer` (`CustomerName`, `PhoneNumber`, `Email`) VALUES 
('John Doe', '123-456-7890', 'john.doe@example.com'),
('Jane Smith', '234-567-8901', 'jane.smith@example.com'),
('Michael Johnson', '345-678-9012', 'michael.johnson@example.com'),
('Emily Davis', '456-789-0123', 'emily.davis@example.com'),
('David Brown', '567-890-1234', 'david.brown@example.com');

INSERT INTO `LittleLemonDB`.`Roles` (`Description`) VALUES 
('Waiter'),
('Chef'),
('Manager'),
('Host'),
('Bartender');

INSERT INTO `LittleLemonDB`.`Staff` (`FullName`, `RoleID`, `Salary`, `HireDate`) VALUES 
('Alice Walker', 1, 3000.00, '2022-01-15'),
('Bob Harris', 2, 3500.00, '2021-03-20'),
('Charlie Clark', 3, 4000.00, '2020-05-25'),
('Diana Wilson', 4, 2800.00, '2023-06-10'),
('Evan Lewis', 5, 3200.00, '2021-08-30');

INSERT INTO `LittleLemonDB`.`Bookings` (`BookingDate`, `TableNumber`, `CustomerID`, `NumberOfGuests`, `BookingTime`) VALUES 
('2024-08-01', 5, 1, 2, '19:00:00'),
('2024-08-02', 3, 2, 4, '18:30:00'),
('2024-08-03', 7, 3, 3, '20:00:00'),
('2024-08-04', 1, 4, 1, '19:30:00'),
('2024-08-05', 6, 5, 5, '18:00:00');

INSERT INTO `LittleLemonDB`.`Category` (`Description`) VALUES 
('Appetizer'),
('Main Course'),
('Dessert'),
('Drink');

INSERT INTO `LittleLemonDB`.`Menu` (`MenuItemName`, `CategoryID`, `Price`, `Description`, `Available`) VALUES 
('Caesar Salad', 1, 8.50, 'Crisp romaine lettuce, croutons, and Parmesan cheese', 1),
('Grilled Chicken', 2, 15.00, 'Served with roasted vegetables and mashed potatoes', 1),
('Chocolate Cake', 3, 6.50, 'Rich chocolate cake with a molten center', 1),
('Lemonade', 4, 3.00, 'Freshly squeezed lemonade', 1),
('Beef Steak', 2, 20.00, 'Grilled to perfection, served with fries', 1);

INSERT INTO `LittleLemonDB`.`Order` (`OrderDate`, `Quantity`, `TotalCost`, `CustomerID`, `BookingID`, `StaffID`) VALUES 
('2024-08-01', 2, 20.00, 1, 1, 1),
('2024-08-01', 3, 48.50, 2, 2, 2),
('2024-08-02', 1, 15.00, 3, 3, 3),
('2024-08-02', 4, 80.00, 4, 4, 1),
('2024-08-02', 2, 24.00, 5, 5, 2),
('2024-08-03', 3, 43.50, 1, NULL, 4),
('2024-08-03', 2, 38.00, 2, NULL, 1),
('2024-08-04', 5, 105.00, 3, NULL, 3),
('2024-08-04', 1, 8.50, 4, NULL, 4),
('2024-08-05', 4, 73.00, 5, NULL, 2),
('2024-08-06', 2, 26.50, 1, NULL, 3),
('2024-08-06', 3, 48.50, 2, NULL, 5),
('2024-08-07', 1, 15.00, 3, NULL, 1),
('2024-08-07', 4, 80.00, 4, NULL, 2),
('2024-08-08', 2, 24.00, 5, NULL, 4);

INSERT INTO `LittleLemonDB`.`OrderDetail` (`OrderID`, `MenuItemID`, `Quantity`, `PricePerItem`, `TotalItemCost`, `SpecialInstructions`) VALUES 
(1, 1, 2, 8.50, 17.00, NULL),
(1, 4, 2, 3.00, 6.00, NULL),
(2, 2, 3, 15.00, 45.00, NULL),
(2, 3, 3, 6.50, 19.50, NULL),
(3, 2, 1, 15.00, 15.00, 'No garlic'),
(4, 2, 4, 20.00, 80.00, 'Medium rare'),
(5, 1, 2, 8.50, 17.00, NULL),
(5, 4, 2, 3.00, 6.00, NULL),
(6, 1, 3, 8.50, 25.50, 'Extra croutons'),
(6, 4, 3, 3.00, 9.00, 'No ice'),
(7, 5, 2, 20.00, 40.00, 'Well done'),
(8, 2, 5, 15.00, 75.00, 'Extra sauce'),
(9, 1, 1, 8.50, 8.50, 'Dressing on the side'),
(10, 2, 4, 15.00, 60.00, 'No salt'),
(10, 3, 4, 6.50, 26.00, NULL),
(11, 2, 2, 15.00, 30.00, 'No pepper'),
(11, 4, 2, 3.00, 6.00, 'Extra lemon'),
(12, 2, 3, 15.00, 45.00, 'Medium rare'),
(12, 3, 3, 6.50, 19.50, NULL),
(13, 2, 1, 15.00, 15.00, 'No onions'),
(14, 2, 4, 20.00, 80.00, 'Extra seasoning'),
(15, 1, 2, 8.50, 17.00, 'Add bacon'),
(15, 4, 2, 3.00, 6.00, 'Less sugar');

INSERT INTO `LittleLemonDB`.`OrderStatus` (`Description`) VALUES 
('Pending'),
('Preparing'),
('Delivered'),
('Cancelled');

INSERT INTO `LittleLemonDB`.`OrderDeliveryStatus` (`Orders_OrderID`, `DeliveryDate`, `DeliveryTime`, `StatusID`) VALUES 
(1, '2024-08-01', '19:45:00', 3),
(2, '2024-08-01', '20:00:00', 3),
(3, '2024-08-02', '21:00:00', 3),
(4, '2024-08-02', '21:30:00', 2),
(5, '2024-08-02', '20:00:00', 3),
(6, '2024-08-03', '21:00:00', 3),
(7, '2024-08-03', '22:00:00', 1),
(8, '2024-08-04', '19:30:00', 3),
(9, '2024-08-04', '20:00:00', 3),
(10, '2024-08-05', '18:45:00', 3),
(11, '2024-08-06', '19:30:00', 3),
(12, '2024-08-06', '20:00:00', 3),
(13, '2024-08-07', '19:00:00', 3),
(14, '2024-08-07', '19:45:00', 3),
(15, '2024-08-08', '18:30:00', 3);

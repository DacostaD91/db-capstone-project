-- Delete from OrderDeliveryStatus first to avoid foreign key constraint issues
DELETE FROM `LittleLemonDB`.`OrderDeliveryStatus`;

-- Delete from OrderDetail to avoid foreign key constraint issues
DELETE FROM `LittleLemonDB`.`OrderDetail`;

-- Delete from Orders table
DELETE FROM `LittleLemonDB`.`Order`;

-- Delete from Bookings table
DELETE FROM `LittleLemonDB`.`Bookings`;

-- Delete from Staff table
DELETE FROM `LittleLemonDB`.`Staff`;

-- Delete from Customer table
DELETE FROM `LittleLemonDB`.`Customer`;

-- Delete from Menu table
DELETE FROM `LittleLemonDB`.`Menu`;

-- Delete from Category table
DELETE FROM `LittleLemonDB`.`Category`;

-- Delete from Status table
DELETE FROM `LittleLemonDB`.`OrderStatus`;

-- Delete from Roles table
DELETE FROM `LittleLemonDB`.`Roles`;


-- Reset the ID columns
ALTER TABLE `LittleLemonDB`.`OrderDeliveryStatus` AUTO_INCREMENT = 1;
ALTER TABLE `LittleLemonDB`.`OrderDetail` AUTO_INCREMENT = 1;
ALTER TABLE `LittleLemonDB`.`Order` AUTO_INCREMENT = 1;
ALTER TABLE `LittleLemonDB`.`Bookings` AUTO_INCREMENT = 1;
ALTER TABLE `LittleLemonDB`.`Staff` AUTO_INCREMENT = 1;
ALTER TABLE `LittleLemonDB`.`Customer` AUTO_INCREMENT = 1;
ALTER TABLE `LittleLemonDB`.`Menu` AUTO_INCREMENT = 1;
ALTER TABLE `LittleLemonDB`.`Category` AUTO_INCREMENT = 1;
ALTER TABLE `LittleLemonDB`.`OrderStatus` AUTO_INCREMENT = 1;
ALTER TABLE `LittleLemonDB`.`Roles` AUTO_INCREMENT = 1;

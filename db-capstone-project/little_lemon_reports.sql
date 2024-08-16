CREATE VIEW OrdersView AS
	SELECT OrderID, Quantity, TotalCost
	FROM `LittleLemonDB`.`Orders`
	WHERE Quantity > 2;

CREATE VIEW CustomerOrders AS
	SELECT c.CustomerID, c.CustomerName, o.OrderID, o.TotalCost, m.MenuItemName,m.Description
	FROM Customer c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
	INNER JOIN OrderDetail od ON o.OrderID = od.OrderID
	INNER JOIN Menu m on od.MenuItemID = m.MenuItemID
	WHERE o.TotalCost > 50
	ORDER BY o.TotalCost ASC;

CREATE VIEW MenuItemsWithOrders AS
	SELECT m.MenuItemName
	FROM Menu m
	WHERE m.MenuItemID = ANY (SELECT od.MenuItemID 
							 FROM OrderDetail od
							 WHERE od.Quantity > 2);
 

select * from ordersview;
select * from customerorders;
select * from menuitemswithorders;
-- Shows the total amount of units sold for each product.

SELECT Name, UnitsSold FROM
(
	SELECT ProductID, SUM(Quantity) AS UnitsSold
	FROM Orders JOIN OrderItems ON Orders.OrderNumber = OrderItems.OrderNumber
	GROUP BY ProductID
) AS TotalSold JOIN Products ON TotalSold.ProductID = Products.ProductID
ORDER BY UnitsSold DESC;


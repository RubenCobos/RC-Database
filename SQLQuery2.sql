--Shows the only customer to have more than one order.

SELECT FirstName, LastName, Address, Phone, Email FROM Customers
WHERE CustomerID IN
(
	SELECT CustomerID FROM Orders GROUP BY CustomerID HAVING Count(*) > 1
);


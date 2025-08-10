--Summary information for all orders.

SELECT COUNT(*) AS #Orders, MIN(SaleAmount) AS SmallestSale, MAX(SaleAmount) AS LargestSale, SUM(SaleAmount) AS TotalSales FROM Orders;


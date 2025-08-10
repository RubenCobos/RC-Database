-- Shows the components that make up each PC.

SELECT Name, Description, Type, Brand, Model, Specifications
FROM Products JOIN ProductComponents ON Products.ProductID = ProductComponents.ProductID JOIN Components ON ProductComponents.ComponentID = Components.ComponentID;


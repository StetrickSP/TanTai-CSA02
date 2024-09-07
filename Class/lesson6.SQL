----------------------- Creation --------------------------------------
create TABLE Customers(
    CustomerID int PRIMARY KEY,
    CustomerName VARCHAR(100),
    ContactName VARCHAR(100),
    Country VARCHAR(100)
);
create TABLE OrderDetails(
    OrderDetailID int PRIMARY KEY,
    OrderID int,
    ProductID int,
    Quantity int
);
create TABLE Orders(
    OrderID int PRIMARY KEY,
    OrderDate VARCHAR(100),
    CustomerID int,
    TotalAmount int,
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);
create TABLE Products(
    ProductID int PRIMARY KEY,
    ProductName VARCHAR(100),
    UnitPrice int, 
    InStock int
);
---------------------- INSERTION --------------------------------------
INSERT INTO Customers
VALUES
(1, "JOHN DOE","JOHN DOE","USA"),
(2, "Jane Smith","Jane Smith","UK"),
(3, "Micheal Brown","Micheal Brown","Canada");
INSERT INTO OrderDetails
VALUES
(1,1,1,1),
(2,1,2,1),
(3,2,2,1),
(4,3,3,1);
INSERT INTO Orders
VALUES
(1, "2024-08-01",1,1500),
(2, "2024-08-05",2,500),
(3, "2024-08-10",3,300);
INSERT INTO Products
VALUES
(1, "Laptop",1000,50),
(2, "Smartphone",500,100),
(3, "Tablet",300,200);
---------------------- SELECTION --------------------------------------
Select SUM(Quantity) from OrderDetails;
Select MAX(TotalAmount) from Orders;
Select MIN(TotalAmount) from Orders;
Select COUNT(CustomerID) from Customers;
Select AVG(TotalAmount) from Orders;

Select Customers.CustomerID, Orders.OrderID
From Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

Select c.CustomerName, o.OrderID
From Customers AS c, Orders as o
Where c.CustomerID = o.CustomerID
---------------------------------------------------------------------
SELECT 
    Orders.OrderID,
    Customers.CustomerName,
    Products.ProductName,
    OrderDetails.Quantity
FROM Orders
INNER JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
INNER JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN 
    Products ON OrderDetails.ProductID = Products.ProductID;
---------------------------------------------------------------------
SELECT Customers.CustomerName, Products.ProductName
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
LEFT JOIN Products ON Products.ProductID = OrderDetails.ProductID
----------------------------------------------------------------------
INSERT INTO Orders (OrderID, OrderDate, CustomerID,TotalAmount)VALUES
SELECT Orders.OrderID, Customers.CustomerName, Orders.TotalAmount
FROM Orders
RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID


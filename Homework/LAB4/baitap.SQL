CREATE TABLE Customers(
  CustomerID int PRIMARY KEY,
  CustomerName varchar(100),
  Address varchar(100),
  City varchar(100),
  Country varchar(100)
);
-----------------------------------------------------
CREATE TABLE Orders (
    OrderID int NOT NULL,
    CustomerID int,
    OrderDate VARCHAR(100),
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-----------------------------------------------------
CREATE TABLE Products (
  ProductID int NOT NULL,
  Productname varchar(100) NOT NULL,
  Category varchar(100) NOT NULL,
  Unit varchar(100) NOT NULL,
  Price float NOT NULL,
  PRIMARY KEY (ProductID)
);
-----------------------------------------------------
CREATE TABLE OrderDetails (
  OrderDetailID int NOT NULL,
  OrderID int NOT NULL,
  ProductID int NOT NULL,
  Quantity int NOT NULL,
  PRIMARY KEY (OrderDetailID)
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-----------------------------------------------------
INSERT INTO Customers(CustomerID,CustomerName,Address,City,Country)
VALUES
(1, "Alfreds Futterkiste", "Obere Str. 57", "Berlin", "Germany"),          
(2, "Ana Trujillo Emparedados","Avda. de la Constitución 2222","México D.F.","Mexico"),
(3 ,"Antonio Moreno Taquería","Mataderos 2312","México D.F.","Mexico"),
(4, "Around the Horn", "120 Hanover Sq.", "London", "UK"),
(5 ,"Berglunds snabbköp", "Berguvsvägen 8", "Luleå", "Sweden");
-----------------------------------------------------
INSERT INTO Products(ProductID,ProductName,Category,Unit,Price)
VALUES
(1 ,"Chais", "Beverages", "10 boxes x 20 bags", 18),
(2 ,"Chang", "Beverages", "24 - 12 oz bottles", 19),
(3 ,"Aniseed Syrup", "Condiments", "12 - 550 ml bottles", 10),
(4 , "Chef Anton's Cajun Seasoning" ,"Condiments","48 - 6 oz jars", 22),
(5 , "Chef Anton's Gumbo Mix","Condiments", "36 boxes", 21.35);
-----------------------------------------------------
INSERT INTO Orders(OrderID,CustomerID,OrderDate)
VALUES
(10248, 2, "7/4/1996"),
(10249, 3, "7/5/1996"),
(10250, 3, "7/8/1996"),
(10251, 5, "7/8/1996"),
(10252, 1, "7/9/1996");
-----------------------------------------------------
INSERT INTO OrderDetails(OrderDetailID,OrderID,ProductID,Quantity)
VALUES
(1, 10248, 1, 12),
(2, 10248, 3, 10),
(3, 10248, 2, 5),
(4, 10249, 4, 9),
(5, 10249, 1, 40);
------------------------------------------------------
Select * from Customers
Where Country = "Mexico";
------------------------------------------------------
Select Distinct Country
From Customers;
------------------------------------------------------
Select * from Customers
Where Country in ("Mexico", "Canada", "Hoa Kỳ");
------------------------------------------------------
Select ProductName as Name, Unit from Products;
------------------------------------------------------
Select * from Products
Order by Price asc;
------------------------------------------------------
Select * from Products
Where Category = "Beverages"
Order by Price desc
limit 5;
------------------------------------------------------
Select * from Products
Where Price between 10 and 25 and Unit like "%boxes%";
------------------------------------------------------
Select * from Orders
WHERE OrderDate BETWEEN '01/08/1996' AND '31/08/1996';
------------------------------------------------------
Select ProductID, Quantity from OrderDetails
Where Quantity > 10;
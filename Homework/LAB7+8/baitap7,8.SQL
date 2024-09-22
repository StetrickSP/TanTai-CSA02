----------------- LAB7 --------------------
------------------1-----------------
select min(OrderDate) from Orders;
------------------2-----------------
select count(Quantity) from OrderDetails;
------------------3-----------------
select OrderID, sum(Quantity) from OrderDetails
group by OrderID;
------------------4-----------------
select avg(Quantity) from OrderDetails;
------------------5-----------------
select OrderID, count(distinct ProductID) from OrderDetails
group by OrderID;
------------------6-----------------
SELECT Category, AVG(Price) AS AvgPrices FROM Products
GROUP BY Category
HAVING AvgPrices between 20 and 30;
------------------7-----------------
select Country, count(CustomerName) as countCus from Customers
group by Country
having countCus > 10;
------------------8-----------------
select CustomerID, count(OrderID) as Orders from Orders
group by CustomerID
Order by Orders desc;
------------------9-----------------
select ProductID, count(distinct OrderID) as do from OrderDetails
group by ProductID
having do >10;
------------------10-----------------
select sum(Quantity) from OrderDetails
where ProductID = 1;


----------------- LAB8 --------------------
-----------------1------------------
select o.OrderID, c.CustomerID, c.CustomerName, c.Country from orders o
join Customers c on o.CustomerID = c.CustomerID
order by o.OrderID asc;

-----------------2------------------
select c.Country, count(o.OrderID) as Ordered from Orders o
join Customers c on o.CustomerID = c.CustomerID
group by c.Country
order by Ordered desc;

-----------------3------------------
select p.ProductID, p.ProductName, od.Quantity, p.Price from OrderDetails od
join Products p on od.ProductID = p.ProductID
where OrderID = 10248;

-----------------4------------------
select o.OrderID, sum(p.price * od.Quantity) as TotalAmount from OrderDetails od
join Products p on od.ProductID = p.ProductID
join Orders o on o.OrderID = od.OrderID
where o.OrderID = 10248;
-----------------5------------------
select o.OrderID, sum(p.price * od.Quantity) from OrderDetails od
join Products p on od.ProductID = p.ProductID
join Orders o on o.OrderID = od.OrderID
where o.OrderDate = "1996-08-01"
group by o.OrderID;

-----------------6------------------
select o.OrderID, c.CustomerID, o.OrderDate from Orders o
join Customers c on o.CustomerID = c.CustomerID
where c.Country = 'Argentina' and o.OrderDate < '1996-07-08';

-----------------7------------------
select productid, productname, price
from products
where price > (select avg(price) from products)
order by price asc;

-----------------8------------------
select distinct o.OrderID, o.CustomerID, o.OrderDate from Orders o
join OrderDetails od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
where p.Category = 'Dairy Products'
order by o.OrderID asc;

-----------------9------------------
select c.CustomerID, c.CustomerName from Customers c
join Orders o on c.CustomerID = o.CustomerID
join OrderDetails od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
where p.Category = 'Dairy Products'
order by c.CustomerID asc;
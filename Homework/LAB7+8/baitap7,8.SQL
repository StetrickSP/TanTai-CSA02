----------------- LAB7 --------------------
select min(OrderDate) from Orders;
-----------------------------------
select count(Quantity) from OrderDetails;
-----------------------------------
select OrderID, sum(Quantity) from OrderDetails
group by OrderID;
-----------------------------------
select avg(Quantity) from OrderDetails;
-----------------------------------
select OrderID, count(distinct ProductID) from OrderDetails
group by OrderID;
-----------------------------------
SELECT Category, AVG(Price) AS AvgPrice FROM Products
GROUP BY Category
HAVING AvgPrice between 20 and 30;
-----------------------------------
select Country, count(CustomerName) as countcus from Customers
group by Country
having countcus > 10;
-----------------------------------
select CustomerID, count(OrderID) as coor from Orders
group by CustomerID
Order by coor desc;
-----------------------------------
select ProductID, count(distinct OrderID) as do from OrderDetails
group by ProductID
having do >10;
-----------------------------------
select sum(Quantity) from OrderDetails
where ProductID = 1;


----------------- LAB8 --------------------
select o.OrderID, c.CustomerID, c.CustomerName, c.Country from orders o
join Customers c on o.CustomerID = c.CustomerID
order by o.OrderID asc;

-----------------------------------
select c.Country, count(o.OrderID) as Ordered from Orders o
join Customers c on o.CustomerID = c.CustomerID
group by c.Country
order by Ordered desc;

-----------------------------------
select p.ProductID, p.ProductName, od.Quantity, p.Price from OrderDetails od
join Products p on od.ProductID = p.ProductID
where OrderID = 10248;

-----------------------------------
select o.OrderID, sum(p.price * od.Quantity) as TotalAmount from OrderDetails od
join Products p on od.ProductID = p.ProductID
join Orders o on o.OrderID = od.OrderID
where o.OrderID = 10248;
-----------------------------------
select o.OrderID, sum(p.price * od.Quantity) from OrderDetails od
join Products p on od.ProductID = p.ProductID
join Orders o on o.OrderID = od.OrderID
where o.OrderDate = "1996-08-01"
group by o.OrderID;

-----------------------------------
select o.OrderID, c.CustomerID, o.OrderDate from Orders o
join Customers c on o.CustomerID = c.CustomerID
where c.Country = 'Argentina' and o.OrderDate < '1996-07-08';

-----------------------------------
select productid, productname, price
from products
where price > (select avg(price) from products)
order by price asc;

-----------------------------------
select distinct o.OrderID, o.CustomerID, o.OrderDate from Orders o
join OrderDetails od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
where p.Category = 'Dairy Products'
order by o.OrderID asc;

-----------------------------------
select c.CustomerID, c.CustomerName from Customers c
join Orders o on c.CustomerID = o.CustomerID
join OrderDetails od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
where p.Category = 'Dairy Products'
order by c.CustomerID asc;
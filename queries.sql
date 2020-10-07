SELECT Orders.OrderId, Customers.CustomerName, Orders.OrderDate
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
ORDER by Orders.customerId;

-- join orders to employees & show me first name & last name of the employee who sold 

SELECT Orders.OrderID, Orders.orderDate, Employees.FirstName, Employees.LastName
FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID;

-- list all orders including employee and customer data for each order

SELECT * 
FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID 
JOIN Shippers on Orders.ShipperID = Shippers.ShipperID

-- shorten the words
select o.OrderID, o.OrderDate, e.EmployeeID, c.CustomerName, e.FirstName, e.LastName, o.EmployeeID
from Orders as o
join Employees as e on o.EmployeeID = e.EmployeeID
join Customers as c on o.CustomerID = c.CustomerID
order by o.EmployeeID

-- list all customers and any order data for them
-- left table is the one following the from 
select * 
from customers as c 
left join orders as o ON c.customerID = o.customerID
order by c.customerID

-- list all customers and any order data for each customer 
select c.CustomerId as Id
	   , c.CustomerName as Customer
       , c.Country
       , o.OrderID
       , o.OrderDate
from customers as c 
left join orders as o ON c.customerID = o.customerID
order by c.customerID

-- list of all customers that have orders, only customer ID and customer name and country, no repeats
select distinct c.CustomerId as Id
	   , c.CustomerName as Customer
       , c.Country
from customers as c 
left join orders as o ON c.customerID = o.customerID
where o.OrderID is not null
order by c.customerID;

-- list all customers & the number of orders they have
select c.CustomerId as Id
	   , c.CustomerName as Customer
       , c.Country
       , count(o.orderId) as [Orders]
from customers as c 
left join orders as o ON c.customerID = o.customerID
group by c.CustomerId, c.CustomerName, c.Country
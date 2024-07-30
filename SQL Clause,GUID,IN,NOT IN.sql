USE My
Go
---------Create a GUID -----
Create table Customer_Info
(
Customer_ID uniqueidentifier default newid(),
Customer_Name Nvarchar (30)
)
GO
------Insert value in Customer_info table-------
Insert into Customer_Info 
values
(Newid(),'MD.Aziz'),
(Newid(),'MD.Alim'),
(Newid(),'MD.Emad')
GO
----Retrive data---
Select * from Customer_Info
GO
-------Create a Order Table----
Create table Orders
(
Order_ID int primary key,
Item_Name nvarchar (30),
Quantity int,
Unitprice money,
Discount money
)
GO
--------Insert Value------
Insert into Orders
values
(1,'Rice',2,500,.5),
(2,'Rice',2,500,.5),
(3,'Rice',4,800,.5),
(4,'Fish',4,500,.5),
(5,'Fish',2,800,.5),
(6,'Fish',5,500,.5),
(7,'Rice',4,800,.5),
(8,'Chicken',4,800,.5)
GO
-----Retrive data---
Select * from Orders
--------Using where cluse---
Select * from Orders
Where Order_ID=2;
GO
-------Group By ------
Select Item_Name, Sum(Unitprice) AS Total
From Orders
Group by Item_Name
GO
/*HAVING ------
-----The SQL HAVING clause is combined with GROUP BY clause to restrict the groups of returned rows whose condition is TRUE.
--It is used to filter records that one or more columns have grouped. 
--The HAVING clause is used instead of the WHERE clause with aggregate functions.*/
Select Item_Name, Sum(Unitprice) AS Total
From Orders
Group by Item_Name
Having Sum(Unitprice)>900 ;
GO
/*ROLLUP-----
---SQL ROLLUP is an extension of the GROUP BY clause in SQL, 
--providing a way to generate subtotals and grand totals for multiple dimensions within a dataset.*/
Select Item_Name, Sum(Unitprice) AS Total
From Orders
Group by rollup (Item_Name)
GO
/*-----CUBE-------
This is the set of information typically needed for all cross-tabular reports,
so CUBE can calculate a cross-tabular report with a single SELECT statement.*/
Select Item_Name, Sum(Unitprice) AS Total
From Orders
Group by Cube (Item_Name,Order_ID)
GO
/*-----CTE---A Common Table Expression (CTE) is the result set of a query
which exists temporarily and for use only within the context of a larger query.----*/
With OrderCte
As
(
Select Item_name
from Orders
where Item_Name='Fish'
)
Select * from OrderCte;
Go
/*---Using IN operator-
The IN condition lets you set a list of values that must match values in your tables
-----*/
Select * from orders
Where Item_Name in ('Chicken');
GO
------/*---Using  NOT IN operator-
--The NOT IN condition lets you set a list of values that must  not match values in your tables
-----*/
Select * from orders
Where Item_Name  not in ('Chicken');
GO
-------Write a this  script and see the servername------
Select @@SERVERNAME 'Server'
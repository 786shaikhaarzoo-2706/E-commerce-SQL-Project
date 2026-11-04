-- E-COMMERCE APPLICATION 
Create Database Project;
use Project;
-- CUSTOMERS TABLE
Create table Customers (Customer_Id int primary key auto_increment,Customer_name varchar(20),
Email varchar(100),City varchar(100));
-- INSERTION IN CUSTOMERS TABLE
Insert into Customers(Customer_name,Email,City) values
 ("Pooja","pooja@gmail.com","Mumbai"),
("Arjun","arjun@gmail.com","Delhi"), 
("Rakesh","rakesh@gmail.com","Banglore"),
("Sejal","sejal@gmail.com","Pune");
Select * from Customers;
-- PRODUCTS TABLE 
Create table Products (Product_Id int primary key,Product_name varchar(50),Price decimal not null,
Category varchar(100));
-- INSERTION IN PRODUCTS TABLE
Insert into Products values 
(101,"Laptop",45000.00, "Electronics"),
(102,"Books",10000.00, "Stationery"),
(103,"Mobile",35000.00, "Electronics"),
(104,"Speaker",55000.00, "Electronics"),
(105,"Pen Box",2000.00, "Stationery");
Select * from Products;
-- ORDERS TABLE
Create table Orderss(Order_Id int primary key,Customer_Id int,Product_Id int not null, 
Quantity int check (quantity > 0),Order_date date,Foreign key (Customer_Id) references Customers(Customer_Id));
-- INSERTION IN ORDERS TABLE
Insert into Orderss values 
(1001,1,101,2,"2026-06-21"),
(1002,3,102,1,"2026-05-18"),
(1003,1,103,2,"2026-06-14"),
(1004,2,104,1,"2026-08-02"),
(1005,4,102,4,"2026-10-07");
Select * from Orderss;
-- Q1 Display customer name and Email?
Select Customer_name,Email from Customers;
-- Q2 Display Product name and Price?
Select Product_name,Price from Products;
-- Q3 Display Product whose Price is greater than 15000?
Select * from Products where Price > 15000;
-- Q4 Find Customer from Mumbai?
Select * from Customers where City="Mumbai";
-- Q5 Find Electronics Products Costing more than 35000?
Select * from Products where Category="Electronics" AND Price > 35000;
-- Q6 Find Order Place between May and July 2026?
Select * From Orderss where Order_date between "2026-05-01" and "2026-07-31";
-- Q7 Find customers from Mumbai,Delhi,Pune?
Select * from Customers where City in("Mumbai","Pune","Delhi");
-- Q8 Add a new column Phone number in Customer table
Alter table Customers add Phone_No bigint;
Select * from Customers;
-- Q9 Update the phone number column in Customer table?
Update  Customers set Phone_No=8652359474 where Customer_Id=1;
Update  Customers set Phone_No=9875412638,City="Banglore" where Customer_Id=2;
Update  Customers set Phone_No=7542398164 where Customer_Id=3;
Update  Customers set Phone_No=8952314769 where Customer_Id=4;
-- Q10 Display Products from Highest to Lowest Price?
Select * from Products order by Price desc;
-- Q11 Display Customers alphabetically by Name?
Select * from Customers Order by Customer_name Asc;
-- Q12 Display all Different product Categories?
Select Distinct(Category) from Products;
-- Q13 Find the total Number of Customers?
Select count(*) from Customers;
-- Q14 Find the total Number of Orders?
Select count(*) from Orderss;
-- Q15 Find total value of all Products?
Select sum(Price) As Total_value from Products;
-- Q16 Find the Average product Price?
Select avg(Price) from Products;
-- Q17 Find Customers whoes name start with P?
Select * from Customers where Customer_name like "P%";
-- Q18 Find Products containing the letter "o"?
Select * from Products where Product_Name like "%o%" ;
-- Q19 Display the first 3 products?
Select * from Products limit 3;
-- Q20 Find the most expensive Products?
Select * from Products order by Price desc limit 1;
-- Q21 Find the second most expensive product?
Select * from Products order by Price desc limit 1 offset 1;
-- Q22 Find the Highest Product Price?
Select max(price) from Products;
-- Q23 Find the Total quantity of Orders?
Select Sum(Quantity) from Orderss;
-- Q24 Find Products that are not Electronic?
Select * from Products where Category != "Electronics";
-- Q25 Count Customer In each City
Select City,count(Customer_Name) As Total_Customer from Customers group by City;
Select * from Customers;
-- Q26 Count Products In each Category
Select Category,count(Product_Name) As Total_Product from Products group by Category;
-- Q27 Find the average price of products in each category?
Select Category,Avg(Price) from Products group by Category;
-- Q28 Find the maximum price in each category?
Select Category,Max(Price) from Products group by Category;
-- Q29 Find the minimum price in each category.
Select Category,Min(Price) from Products group by Category;
-- Q30 Find the total quantity ordered for each product?
Select Product_Id,Sum(Quantity) from Orderss group by Product_Id;
-- Q31 Find categories having more than 1 product?
Select Category,count(Product_name) As Products from Products group by category having count(Product_name)>1;
-- Q32 Find products whose total ordered quantity is more than 2.
Select Product_id,sum(quantity) As Total_Quantity from Orderss group by Product_id having sum(quantity)>2;
-- Q33 Find customers who placed more than 1 order.
Select Customer_Id,count(*) from Orderss group by Customer_Id having count(*)>1;
-- Q34 Find categories where the average product price is greater than ₹20,000.
Select Category,avg(Price) As Product_Price from Products group by Category having avg(Price)>=20000;
-- Q35 Display customer names with their orders.
Select * from Customers Inner join Orderss on Customers.Customer_Id=Orderss.Customer_Id
Inner join Products on Products.Product_Id=Orderss.Product_Id;
-- Q36 Calculate the total amount for each order.
Select C.Customer_name,O.Order_Id,P.Product_name,P.Price,O.Quantity,(P.Price * O.Quantity) As Total_Amount from Customers C 
Inner join  Orderss O on C.Customer_Id=O.Customer_Id
Inner join Products P on P.Product_Id=O.Product_Id;
-- Q37 Find all orders placed by Pooja?
Select * from Customers Inner join Orderss On Customers.Customer_Id=Orderss.Customer_Id
Inner join Products On  Products.Product_Id=Orderss.Product_Id where Customers.Customer_name="Pooja";
-- Q38 Inserting One customer?
Insert into Customers values(5,"Aarzoo","aarzoo@gmail.com","Mumbai",8457931269);
-- Q39 Find customers who have never placed an order?
Select * from Customers Left join Orderss on Customers.Customer_Id=Orderss.Customer_ID
where Orderss.Order_Id is null;
-- Q40 Display all orders with customer information?
Select * from Customers Right join Orderss on Customers.Customer_Id=Orderss.Customer_ID;
-- Q41 Display orders placed in June 2026?
Select * from Customers  Inner join Orderss on Customers.Customer_Id=Orderss.Customer_ID
Inner join Products on Products.Product_Id=Orderss.Product_ID
where Orderss.Order_date between "2026-06-01" and "2026-06-30";
-- Q42 Display the order year and month for every order.
Select O.Order_Id,C.Customer_name,P.Product_name,O.Order_date,Year(Order_date),Month(Order_date) from Customers C 
Inner join Orderss O on C.Customer_Id=O.Customer_Id
Inner join Products P on P.Product_Id=O.Product_Id;
-- Q43 Find products costing more than the average product price?
Select * from Products where Price > (Select avg(Price) from Products);
-- Q44 Find the most expensive product using a subquery?
Select * from Products where Price=(Select max(Price) from Products);
-- Q45 Find customers who have placed orders using a subquery?
Select * from Customers where Customer_Id in (Select Customer_ID from Orderss);
-- Q46 Find customers who have NOT placed orders using a subquery?
Select * from Customers where Customer_Id not in (Select Customer_Id from Orderss);
-- Q47 Find products that have been ordered using a subquery?
Select * from Products where Product_Id in (Select Product_Id from Orderss);
-- Q48  Rank products by price.
Select *,rank() Over (Order by Price) As Ranking from Products;
-- Q49 Rank products within each category by price?
Select *,rank() over ( Partition by Category order by Price DESC) AS Rank_In_Category from Products;
-- Q50 Assign a serial number to orders based on order date?
Select *,row_number() over (order by Order_date) AS Order_Sequence from Orderss;
-- Q51 Display Products along with their price ranking in each Category?
Select *,dense_rank() Over(Partition by Category Order by Price Desc) As DenRank
from Products;
-- Q52 Find the Previous Order date for each Customer using Lag Function?
Select O.Order_Id,C.Customer_name,O.order_date,Lag(Order_date) Over (Partition by C.Customer_Id Order by O.Order_date) As lagging
from Orderss O Inner join Customers C on  O.Customer_Id=C.Customer_Id;
-- Q53 For each City find the next Customer who joined after the current Customer?
Select *, Lead(Customer_name) over ( Partition by City order by Customer_Id) As Next_Customer
from Customers;
-- Q54 For each Customer Display all their Orders along with the date of their First Order?
Select  O.Order_Id,C.Customer_name,O.order_date,
first_value(O.order_date) over ( Partition by C.Customer_Id order by O.order_date ) As First_Order_Date
from Orderss O Inner join Customers C on O.Customer_Id = C.Customer_Id
order by C.Customer_Id, O.order_date;
-- Q55 For each Customer Display all their Orders along with the date of their Last Orders?
Select *,last_value(O.order_date) over ( Partition by C.Customer_Id order by O.order_date 
Rows Between unbounded preceding and unbounded following ) As Last_Order
from Orderss O Inner join Customers C on O.Customer_Id = C.Customer_Id
order by  C.Customer_Id, O.order_date;

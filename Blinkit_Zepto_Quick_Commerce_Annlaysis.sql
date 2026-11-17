 Blinkit / Zepto - Quick Commerce Analysis
---------------------------------------------------------------------------
Create 4 tables 
Customers
Orders
Products
Delivery_Partners
--------------------------------------------------------------------------

 create database project;
 use project;

-- Customer Table

 create table Customer(Customer_Id int primary key,Cust_name varchar(30),City varchar(20),Signup_Date date);

-- Insertion
 insert into Customer values(1,"Pooja","Mumbai",'2024-03-10');
 insert into Customer values(2,"Rahul","Delhi",'2024-02-23');
 insert into Customer values(3,"Aachal","Banglore",'2023-04-15');
 insert into Customer values(4,"Sumit","Pune",'2023-05-22');
 insert into Customer values(5,"Aarzoo","Mumbai",'2023-08-13');
 insert into Customer values(6,"Karan","Banglore",'2022-06-27');
 insert into Customer values(7,"Sima","Delhi",'2022-09-28');
 insert into Customer values(8,"Reena","Pune",'2023-04-02');
 insert into Customer values(9,"Rohit","Banglore",'2024-07-20');
 insert into Customer values(10,"Khushi","Mumbai",'2022-03-19');

 select * from Customer;

-- Product Table

create table Product(Product_Id int primary key,Product_name varchar(30),Category varchar(50),Price int);

-- Insertion
insert into Product values(101,"Milk","Dairy",60);
insert into Product values(102,"Chips","Snacks",40);
insert into Product values(103,"Brown Bread","Grocery",50);
insert into Product values(104,"Eggs","Grocery",90);
insert into Product values(105,"Wheat","Grocery",200);
insert into Product values(106,"Chocolate","Snacks",100);
insert into Product values(107,"Curd","Dairy",70);
insert into Product values(108,"Rice","Grocery",120);
insert into Product values(109,"Biscuits","Snacks",90);
insert into Product values(110,"Paneer","Dairy",150);

select * from Product;


-- Delivery Partner Table

Create table Delivery_Partner(Partner_Id int primary key,Partner_Name varchar(30),Rating DECIMAL(3,2));

-- Insertion
insert into Delivery_Partner values (201,"Vishal",4.8);
insert into Delivery_Partner values (202,"Rahul",4.5);
insert into Delivery_Partner values (203,"Suresh",4.9);
insert into Delivery_Partner values (204,"Imran",4.1);
insert into Delivery_Partner values (205,"Aman",4.7);

Select * from Delivery_Partner;


-- Orders Table 

Create Table Orders(Order_Id int primary key,Customer_Id int,Product_Id int,Partner_ID int,Order_date Date,Delivery_Time_Min int,Delivery_Fee int,
Foreign key (Customer_Id) references Customer(Customer_Id),
Foreign key (Product_Id) references Product(Product_Id),
Foreign key (Partner_Id) references Delivery_Partner(Partner_Id));

-- Insertion
insert into Orders values(1001,1,101,201,"2024-03-23",30,250);
insert into Orders values(1002,2,103,205,"2024-04-18",45,50);
insert into Orders values(1003,3,104,205,"2022-08-28",50,0);
insert into Orders values(1004,5,102,202,"2023-08-26",45,25);
insert into Orders values(1005,7,107,203,"2022-03-30",35,60);
insert into Orders values(1006,9,110,204,"2023-08-29",55,0);
insert into Orders values(1007,8,105,201,"2024-09-12",53,26);
insert into Orders values(1008,10,106,202,"2022-05-29",30,0);
insert into Orders values(1009,4,109,205,"2024-06-30",20,42);
insert into Orders values(1010,6,108,203,"2022-02-28",30,0);
insert into Orders values(1011,1,104,204,"2024-08-14",25,30);
insert into Orders values(1012,5,105,203,"2022-04-15",30,32);
insert into Orders values(1013,7,106,204,"2024-11-03",20,26);
insert into Orders values(1014,9,108,202,"2024-07-11",31,0);
insert into Orders values(1015,3,110,201,"2022-06-22",15,15);

select * from Orders;

-- Querys
-- Basic

-- Q1: Display all customers.
select * from Customer;
-- Q2: Display all products.
select * from Product;
-- Q3: Display all delivery partners.
select * from Delivery_partner;
-- Q4: Display all orders.
select * from Orders;
-- Q5: Display distinct Cities from Customer table.
select distinct(City) from Customer;
-- Q6: Display distinct Categories from Product table.
select distinct(Category) from Product;
-- Q7: Display all customers from Mumbai.
select * from Customer where City="Mumbai";
-- Q8: Display all products where Category = 'Dairy'.
Select * from Product where Category="Dairy";
-- Q9: Display all products where Price > 100.
select * from Product where Price >100;
-- Q10: Display all orders where Delivery_Fee = 0.
Select * from Orders where Delivery_Fee=0;
-- Q11: Display all orders where Delivery_Time_Min > 30.
Select * from orders where Delivery_Time_Min>30;
-- Q12: Display all partners with Rating > 4.5.
Select * from Delivery_partner where rating>4.5;
-- Q13: Display all customers whose name starts with 'R'.
Select * from Customer where Cust_name like "R%";
-- Q14: Display all products where Price is BETWEEN 50 AND 120.
Select * from product where Price>=50 and Price<=120;
-- Q15: Display all customers where City IN ('Mumbai', 'Delhi').
Select * from Customer where City in ("Mumbai","Delhi");
-- Q16: Display all orders placed in year 2024.
Select * from Orders where Order_date>="2024-01-01" and Order_date<="2024-12-31";
-- Q17: Display top 5 most expensive products.
Select * from Product   Order by Price Desc limit 5 ;
-- Q18: Display all customers sorted by Signup_Date in descending order.
Select * from Customer ORDER BY Signup_date Desc;
-- Q19: Display all orders sorted by Delivery_Time_Min in descending order.
Select * from Orders Order by Delivery_time_Min desc;
-- Q20: Display customers who signed up after '2023-01-01'.
Select * from Customer Where Signup_date>"2023-01-01";

-- Aggregate + GROUP BY 

-- Q21: Find total number of orders.
Select count(*) as Total_Order from Orders ;
-- Q22: Find total revenue (SUM of Delivery_Fee).
Select sum(Delivery_Fee) as total_Revenue from Orders;
-- Q23: Find average delivery time, minimum delivery time, maximum delivery time.
Select avg(Delivery_Time_Min) as Avg_Deliver_time,min(Delivery_Time_Min) as Min_Time,max(Delivery_Time_Min) as Max_Time from Orders;
-- Q24: Find total orders per City.
Select City,count(*) as Total_Order from Customer Inner join Orders on Customer.Customer_Id=Orders.Customer_Id group by City;
-- Q25: Find average delivery time per City. Which city is slowest?
Select City,Avg(Delivery_Time_Min) as delivery_time from Customer Inner join Orders on
 Customer.Customer_Id=Orders.Customer_Id group by City order by delivery_time desc limit 1;
-- Q26: Find total revenue per City.
Select City,sum(Delivery_Fee) as Total_revenue from Customer inner join Orders on Customer.Customer_Id=Orders.Customer_Id group by City;
-- Q27: Find category-wise total products and average Price.
Select Category,count(*) as total_Product,avg(Price) as avg_Price from Product group by Category;
-- Q28: Find total orders per Category.
Select Category,Count(*) as Total_Order from Product Inner join Orders on Product.Product_Id=Orders.Product_Id group by Category;
-- Q29: Find total orders per Partner.
Select Partner_Name,count(*) as Total_Order from Delivery_Partner Inner join Orders on delivery_partner.Partner_Id=Orders.Partner_Id group by Partner_Name;
-- Q30: Find average Rating of all delivery partners.
Select avg(Rating) as Rating from delivery_partner;
--  Q31: Find customers who placed more than 1 order.
Select Cust_name,count(*) as total_Order from Customer Inner join Orders on Customer.Customer_Id=Orders.Customer_Id group by
 Cust_name having count(*)>1;
--  Q32: Find cities where average delivery time is more than 30 minutes.
Select City,avg(Delivery_time_Min) as Avg_time from Customer inner join Orders on Customer.Customer_Id=Orders.Customer_Id 
 group by City having avg(Delivery_Time_Min)>30;
--  Q33: Find categories where average Price is greater than 80.
Select Category,avg(Price) from Product group by Category having avg(Price)>80;
--  Q34: Find month-wise total orders. Which month had highest orders?
Select MONTH(Order_date) as Monthly_Order,Count(*) as Total_Order from Orders group by Month(Order_date) Order by total_Order desc; 
--  Q35: Find year-wise total revenue.
Select Year(Order_date) as Yearly_Order,Sum(Delivery_Fee) as Revenue from Orders group by Year(Order_date);


--JOINs 

-- Q36: Display Customer Name, City, Product Name, Delivery_Fee for all orders.
Select Cust_Name,City,Product_Name,Delivery_Fee from Customer Inner join Orders on Customer.Customer_Id=Orders.Customer_Id
Inner join Product on Product.Product_Id=Orders.Product_Id;
-- Q37: Display Customer Name, Partner Name, Delivery_Time_Min for all orders.
select Cust_Name,Partner_Name,Delivery_Time_Min from Customer inner join Orders on Customer.Customer_Id=Orders.Customer_Id
inner join Delivery_Partner on Delivery_Partner.Partner_Id=Orders.Partner_Id;
-- Q38: Display Product Name, Category, Price, Customer Name for all orders.
Select Product_Name,Category,Price,Cust_Name from Product inner join Orders on Product.Product_Id=Orders.product_Id
inner join Customer on Customer.Customer_Id=Orders.Customer_Id;
--  Q39: Display all customers and their orders, including customers who never ordered. (LEFT JOIN)
 select Cust_name,Order_Id from Customer Left Outer join Orders on Customer.Customer_Id=Orders.Customer_Id;
--   Q40: Display all partners and their orders, including partners who delivered 0 orders. (LEFT JOIN)
Select Partner_Name,Order_Id from Delivery_Partner Left outer join Orders on Delivery_Partner.Partner_Id=Orders.Partner_Id;
--  Q41: Display Customer Name and Product Name for orders where Delivery_Time_Min > 40.
Select Cust_name,Product_Name from Customer Inner join Orders on  Customer.Customer_Id=Orders.Customer_Id
inner join  Product on Product.Product_Id=Orders.Product_Id where Delivery_Time_Min>40;
--  Q42: Display Partner Name and average delivery time for each partner.
Select Partner_Name,avg(Delivery_Time_Min) as avg_time from Delivery_Partner inner join Orders on Delivery_Partner.Partner_Id=Orders.Partner_Id
group by Partner_Name;
--  Q43: Display City-wise total orders with Customer and Orders JOIN.
Select City,count(Order_Id) as Total_Order from Customer inner join Orders on Customer.Customer_Id=Orders.Customer_Id group by City;
--  Q44: Find customer name who paid highest Delivery_Fee.
Select Cust_name,Delivery_Fee  as Max_Deliver_Fee from Customer inner join Orders on Customer.Customer_Id=Orders.Customer_Id order by Delivery_Fee desc limit 1 ;
--  Q45: Find product name which was ordered maximum times.
Select product_name,count(order_id) as max_time_order from Product inner join Orders on Product.Product_Id=Orders.Product_Id group by Product_name
order by  max_time_order desc limit 1;


-- Subquery + CASE + UNION

-- Q46: Display products whose Price is greater than average Price of all products.
 Select Product_name,Price from Product where Price >(select avg(Price) from Product);
-- Q47: Display customers who never placed an order.
Select Cust_name from Customer where Customer_Id NOT IN (Select Customer_Id from Orders);
-- Q48: Display orders where Delivery_Fee is greater than average Delivery_Fee.
Select * from Orders where Delivery_Fee > (Select avg(Delivery_Fee) from Orders);
-- Q49: Display partners whose Rating is greater than average Rating.
Select Partner_Name,Rating from Delivery_Partner where Rating > (Select avg(Rating) from Delivery_Partner);
-- Q50: Create column Delivery_Status - If Delivery_Time_Min > 30 then 'Late' else 'On Time'.
Select Order_Id,Delivery_Time_Min, 
CASE
    when Delivery_Time_Min >30 then "Late"
    else "On Time"
end as Delivery_Status from Orders;
-- Q51: Create column Price_Category - If Price > 100 then 'Expensive', if Price > 60 then 'Medium', else 'Cheap'.
Select Product_name,Price,
Case
     when Price>100 then "Expensive" 
	 when Price > 60 then "Medium"
     else "Cheap"
end as Price_Category from Product;
-- Q52: Create column Customer_Type - If City = 'Mumbai' then 'Metro' else 'Non-Metro'.
Select Cust_name,City,
Case
    when City="Mumbai" then "Metro"
    else "Non-Metro"
end as Customer_Type from Customer; 
-- Q53: Display names of all Customers and Partners in one list. (UNION)
Select Cust_name from Customer
Union
Select Partner_name from Delivery_Partner;
-- Q54: Display Order_Id where Delivery_Time_Min is the highest. (Subquery with MAX)
 Select Order_Id from Orders where Delivery_Time_Min=(Select max(Delivery_Time_Min) from Orders);
-- Q55: Display second highest priced product. (Subquery / LIMIT + OFFSET)
Select * from Product where Price=(Select max(Price) from Product where Price < (Select max(Price) from Product));


-- Windows Fuctions
-- Q56: Rank all products by Price within each Category. (RANK + PARTITION BY)
Select *,rank() over(partition by Category order by Price desc) as Price_Rank from Product;
-- Q57: Rank all delivery partners by Rating. (DENSE_RANK)
Select *,dense_rank() over(Order by Rating desc) as Ranking from Delivery_Partner;
-- Q58: Find ROW_NUMBER for all orders sorted by Order_date.
Select *,row_number() over (order by Order_date) as Sort_order from Orders;
-- Q59: Find running total of Delivery_Fee ordered by Order_date. (SUM OVER)
Select *,sum(Delivery_Fee) over (Order by Order_date) as run_tootal from Orders;
-- Q60: For each customer, find their previous order date. (LAG)
Select *,lag(order_date) over ( partition by Customer_Id order by Order_date) as previous_order from Orders;
-- Q61: For each customer, find their next order date. (LEAD)
Select *,Lead(Order_date) over (Partition by Customer_Id order by order_date) as Next_Order_date from Orders;
-- Q62: Find difference between current order and previous order delivery time for each customer. (LAG)
Select *,Lag(Delivery_Time_Min) over (Partition by Customer_Id Order by Order_date) as Previous_time,
Delivery_Time_Min - lag(Delivery_Time_Min) over
 (Partition by Customer_Id Order by Order_date) as time_difference from Orders;
-- Q63: Create a VIEW named Late_Orders for orders where Delivery_Time_Min > 30.
Create view Late_Orders as
Select * from Orders where Delivery_Time_Min > 30;
Select * from Late_Orders;
-- Q64: Create a VIEW named City_Performance for City-wise total orders, revenue and avg delivery time.
Create view City_Performance as 
Select City,count(Order_id) as total_orders,sum(Delivery_fee) as total_revenue,avg(Delivery_time_min) as avg_time from Customer 
inner join Orders on Customer.Customer_Id=Orders.Customer_Id group by City;
Select * from City_Performance;
-- Q65: Rank products by Price within each Category using DENSE_RANK.
Select *,dense_rank() over (partition by Category Order by Price) as Price_rank from Product;






























































## Create data set
Create table transactions (
  order_id int,
  menu_id int,
  menu_price int,
  staff_id int,
  customer_name text,
  payment text
);
  
insert into transactions values 
  (1001, 2, 60, 1, 'James', 'Cash'),
  (1001, 4, 10, 1, 'James', 'Cash'),
  (1002, 1, 55, 2, 'Jeff', 'Transfer'),
  (1002, 2, 60, 2, 'Jeff', 'Transfer'),
  (1002, 5, 10, 2, 'Jeff', 'Transfer'),
  (1003, 4, 10, 2, 'Jim', 'Cash'),
  (1003, 5, 10, 2, 'Jim', 'Cash'),
  (1004, 1, 55, 1, 'Jack', 'Transfer'),
  (1004, 5, 10, 1, 'Jack', 'Transfer'),
  (1005, 2, 60, 1, 'Jessica', 'Cash');


Create table menus(
  menu_id int unique,
  menu_name text,
  menu_price int
);

insert into menus values 
  (01, 'Noodle', 55),
  (02, 'Basil pork', 60),
  (03, 'Fried egg', 10),
  (04, 'Omelet', 10),
  (05, 'water', 10);


Create table staffs(
  staff_id int unique,
  staff_name text,
  salary int,
  position text,
  phone text
);


insert into staffs values 
  (1, 'Nicky', 25000, 'Senior Staff', '0812345678'),
  (2, 'Carline', 18000, 'Staff', '0812645498');


-----------------------------------------------------------------

## To find the total sales of each order_id which payment by transfer
  
WITH transfer_payment AS
  (select * from transactions
  Where payment = 'Transfer')

select order_id, sum(menu_price) as total_price, payment
from transfer_payment
  Group by order_id;

-----------------------------------------------------------------

## To review info of each order_id (total sales, cust_name and payment)
  
select order_id, sum(menu_price) as total_price, customer_name, payment
from transactions
group by order_id;

-----------------------------------------------------------------

## To review the total sales today of each menu
  
select m.menu_id, m.menu_name , sum(m.menu_price) as today_sales
from transactions t
join menus m on t.menu_id = m.menu_id
group by m.menu_name
order by m.menu_id;

-----------------------------------------------------------------

## Show the total transaction of staff name "Nicky"
select transactions.order_id, menus.menu_name, menus.menu_price, staffs.staff_name, staffs.position
from transactions, menus, staffs
where transactions.menu_id = menus.menu_id
and transactions.staff_id = staffs.staff_id
and staffs.staff_name = 'Nicky';

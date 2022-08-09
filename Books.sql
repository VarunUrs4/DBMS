create database book_dealer;
use book_dealer;
drop database book_dealer;

create table author(
author_id int primary key,
author_name varchar(20),
author_city varchar(20),
author_country varchar(20));

drop table author;

create table publisher(
publisher_id int primary key,
publisher_name varchar(20),
publisher_city varchar(20),
publisher_country varchar(20));

create table category(
category_id int primary key,
description varchar(100));

drop table category;
drop table catalog;
drop table order_details;

create table catalog(
book_id int primary key,
title varchar(100),
author_id int,
publisher_id int,
category_id int,
year int,
price int,
foreign key (author_id) references author (author_id) on delete set null ,
foreign key (publisher_id) references publisher(publisher_id) on delete set null,
foreign key (category_id) references category (category_id) on delete set null);

create table order_details(
order_no int,
book_id int,
quantity int,
primary key (order_no),
foreign key (book_id) references catalog (book_id)); 

insert into author values(1001,'author1','author_city1','author_country1');
insert into author values(1002,'author2','author_city2','author_country2');
insert into author values(1003,'author3','author_city3','author_country3');
insert into author values(1004,'author4','author_city4','author_country4');
insert into author values(1005,'author5','author_city5','author_country5');

select * from author;

insert into publisher values(2001,'publisher1','publisher_city1','publisher_country1');
insert into publisher values(2002,'publisher2','publisher_city2','publisher_country2');
insert into publisher values(2003,'publisher3','publisher_city3','publisher_country3');
insert into publisher values(2004,'publisher4','publisher_city4','publisher_country4');
insert into publisher values(2005,'publisher5','publisher_city5','publisher_country5');

select * from publisher;

insert into category values('3001','fiction');
insert into category values('3002','non-fiction');
insert into category values('3003','thriller');
insert into category values('3004','action');
insert into category values('3005','fiction');

insert into catalog values(4001,'HP and Goblet Of Fire',1001,2001,3001,2002,600);
insert into catalog values(4002,'HP and Order Of Phoenix',1001,2002,3001,2005,650);
insert into catalog values(4003,'Two States',1002,2004,3001,2009,65);
insert into catalog values(4004,'3 Mistakes of my life',1002,2004,3001,2007,55);
insert into catalog values(4005,'Da Vinci Code',1004,2003,3001,2004,450);
insert into catalog values(4006,'Angels and Demons',1004,2003,3001,2003,350);
insert into catalog values(4007,'Artificial Intelligence',1003,2002,3002,1970,500);

insert into order_details values(5001,4001,5);
insert into order_details values(5002,4002,7);
insert into order_details values(5003,4003,15);
insert into order_details values(5004,4004,11);
insert into order_details values(5005,4005,9);
insert into order_details values(5006,4006,8);
insert into order_details values(5007,4007,2);
insert into order_details values(5008,4004,3);

SELECT * FROM author WHERE author_id IN(SELECT author_id FROM catalog WHERE year>2000 AND
price>(SELECT AVG(price) FROM catalog) GROUP BY author_id HAVING COUNT(*)>1);
 
SELECT author_name FROM author a,catalog c 
WHERE a.author_id=c.author_id AND book_id IN
(SELECT book_id FROM order_details WHERE quantity  = 
(SELECT MAX(quantity) FROM order_details));

UPDATE catalog SET price=1.10*price
WHERE publisher_id IN
(SELECT publisher_id FROM publisher WHERE
publisher_name='publisher1');

select * from catalog;

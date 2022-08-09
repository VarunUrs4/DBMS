create database supplier2;
use supplier2;
create table SUPPLIERS1
(
sid int primary key,
sname varchar(20),
city varchar(20));

show tables;
create table PARTS1
(
pid int primary key,
pname varchar(20),
color varchar(10));

create table CATALOG1
(
sid int,
pid int,
cost float,
primary key(sid,pid),
foreign key(pid) references PARTS1(pid) on delete cascade
);

insert into SUPPLIERS1 values('1001','abc','xyz');
insert into SUPPLIERS1 values('1002','abc1','xyz1');
insert into SUPPLIERS1 values('1003','abc2','xyz2');
insert into SUPPLIERS1 values('1004','abc3','xyz3');
insert into SUPPLIERS1 values('1005','abc4','xyz4');

select * from suppliers1;

insert into parts1 values('2001','name1','red');
insert into parts1 values('2002','name2','blue');
insert into parts1 values('2003','name3','black');
insert into parts1 values('2004','name4','green');
insert into parts1 values('2005','name5','yellow');

select * from parts1;

insert into catalog1 values('1001','2001','15');
insert into catalog1 values('1002','2002','25');
insert into catalog1 values('1003','2003','35');
insert into catalog1 values('1004','2004','45');
insert into catalog1 values('1005','2005','55');

select * from catalog1;

select distinct P.pname from parts1 P,Catalog1 C where P.pid=C.pid;

select s.sname from suppliers1 s where s.sid IN (select c.sid from catalog1 c where c.pid IN (select p.pid from parts1 p where  p.color='red'));

select DISTINCT c.sid from catalog1 c where c.cost>(select avg(c1.cost) from catalog1 c1 where c1.pid=c.pid);

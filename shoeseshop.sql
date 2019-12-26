CREATE DATABASE IF NOT EXISTS shoeseshop DEFAULT CHARACTER SET utf8; 

create table product(
pcode int unsigned primary key auto_increment,
pcategory varchar(45) not null,
psubcat varchar(45) not null,
pcolor varchar(25) not null,
psize varchar (25) not null,
pdescr varchar(45) not null,
pprice decimal(7,2) unsigned default 0
);
drop table product;


create table inventory(
icode int unsigned primary key auto_increment,
iquant int unsigned default 0,
pcode int unsigned null,
constraint fk_inventory foreign key (pcode)
references product (pcode) 
);
drop table inventory;


create table user(
ucode int unsigned primary key auto_increment,
urole varchar(25) not null,
ulogin varchar(45) not null,
upassword varchar(45) not null,
ufname varchar(45) not null,
ulname varchar(45) not null,
uemail varchar(45) not null,
uphone varchar(45) not null,
uaddress varchar(75) not null,
uzipcode int (5) not null,
ucity varchar(45) not null,
ucountry varchar(45) not null
);

create table orders (
ocode int unsigned primary key auto_increment,
oquant int unsigned default 0,
ototal decimal(7,2) unsigned default 0, 
ucode int unsigned null,
pcode int unsigned null,
constraint fk_orders1 foreign key (ucode)
references user (ucode),
constraint fk_orders2 foreign key (pcode)
references product (pcode) 
);





-- TESTS & SXOLIA
/*
SELECT @@global.time_zone, @@session.time_zone;


SELECT @@system_time_zone;
*/
























CREATE DATABASE IF NOT EXISTS shoeseshop DEFAULT CHARACTER SET utf8; 

create table product(
pcode int unsigned primary key auto_increment,
pcategory varchar(45) not null,
psubcat varchar(45) not null,
pcolor varchar(25) not null,
psize varchar (25) not null,
pdescr varchar(45) not null,
pquant int unsigned not null,
pprice decimal(7,2) unsigned default 0,
pcreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
pupdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

insert into product values
(1,"adidas","superstar","white","44","leather",40,99, now(), now());
select * from product;

update product set pprice =101 where pcode =1; 

 create table user(
  uid int auto_increment primary key,
  username varchar(30) not null,
  password varchar(68) not null,
  fname varchar(20),
  lname varchar(20),
  email varchar(20),
  unique(username),
  ucreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  uupdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  );
 insert into user (username,password,fname,lname,email)
  values('admin','$2a$10$PHROMJqyTB3GrbJllGfMG.SLu9apzPFIYTS.DNepEzCwoLxgk4X26','Stelios','Kouimanis','stelios@mail.com');
select * from user;

  create table role(
  rid  int auto_increment primary key,
  rname varchar(30),
  unique(rname)
  );
insert into role(rname) values('ROLE_ADMIN');
select * from role;

  
  create table user_role(
  uid int,
  rid int ,
  primary key(uid,rid),
  constraint userrolefk1 foreign key(uid) references user (uid),
  constraint userrolefk2 foreign key(rid) references role (rid)
  );
    insert into user_role values(1,3);
select * from user_role;
select * from user;
 delete from user where uid=5;
 
 
 
## INVENTORY TABLE ## 
 create table inventory(
icode int unsigned primary key auto_increment,
iquant int unsigned default 0,
pcode int unsigned null,
constraint fk_inventory foreign key (pcode)
references product (pcode) 
);



## ORDERS TABLE ##
create table orders (
ocode int unsigned primary key auto_increment,
oquant int unsigned default 0,
ototal decimal(7,2) unsigned default 0, 
ucode int unsigned null,
pcode int unsigned null,
ocreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
oupdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
constraint fk_orders1 foreign key (ucode)
references user (ucode),
constraint fk_orders2 foreign key (pcode)
references product (pcode) 
);



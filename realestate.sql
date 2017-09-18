-- Emily Van Laarhoven, MR Ngo
-- HW2 realestate.sql

use evanlaar_db;

-- drop tables if they exist, dropping children before parents
-- due to referential integrity constraints

drop table if exists house_attr;
drop table if exists cust_pref;
drop table if exists char_list;
drop table if exists customers;
drop table if exists house;

-- house table lists house attributes except characteristics

create table house(
       hid integer auto_increment primary key,
       owner varchar(50),
       price decimal(9,2),
       city varchar(50),
       st varchar(2)
       )
       ENGINE = InnoDB;

-- char list is characteristics that can either be attributes of 
-- a house or things that a customer is seeking to find

create table char_list(
       char_id integer auto_increment primary key,
       attribute varchar(100),
       description varchar(50)
       )
       ENGINE = InnoDB;

-- house_attr links char_list and house

create table house_attr(
       hid integer,
       INDEX(hid),
       foreign key (hid) references house(hid) on delete cascade,
       char_id integer,
       INDEX(char_id),
       foreign key (char_id) references char_list(char_id) on delete cascade
       )
       ENGINE = InnoDB;

-- customers is simple list of customer info (except preferences)

create table customers(
       cid integer auto_increment primary key,
       nm varchar(50),
       price_min decimal(9,2),
       price_max decimal(9,2)
       )
       ENGINE = InnoDB;

-- cust_pref links char_list and customers

create table cust_pref(
       cid integer,
       INDEX(cid),
       foreign key (cid) references customers(cid) on delete cascade,
       char_id integer,
       INDEX(char_id),
       foreign key (char_id) references char_list(char_id) on delete cascade
       )
       ENGINE = InnoDB;


     
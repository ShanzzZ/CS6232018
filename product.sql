Create table Product(
prod_id char(10),
pname varchar(30),
price decimal);
Alter table Product add constraint pk_product primary key (prod_id);
Alter table Product add constraint ck_product_price check (price > 0);

INSERT INTO Product (prod_id, pname, price)VALUES
('p1','tape',2.5),
('p2','tv',250),
('p3', 'vcr',80);

Create table Depot(
dep_id char(10),
addr varchar(30),
volume integer);
Alter table Depot add constraint pk_depot primary key (dep_id);
Alter table Depot add constraint ck_depot_volume check (volume >= 0);

INSERT INTO Depot (dep_id, addr, volume)VALUES
('d1','New York',9000),
('d2','Syracuse',6000),
('d3', 'New York',2000);

Create table Stock(
prod_id char(10),
dep_id char(10),
quantity integer);
Alter table Stock add constraint pk_stock primary key(prod_id,dep_id);
Alter table Stock add constraint fk_product foreign key (prod_id) REFERENCES Product (pro_id) ON UPDATE CASCADE;
Alter table Stock add constraint fk_depot foreign key (dep_id) REFERENCES Depot (dep_id);

INSERT INTO Stock (prod_id, dep_id, quantity)VALUES
('p1','d1',1000),
('p1','d2',-100),
('p1','d4',1200),
('p3','d1',3000),
('p3','d4',2000),
('p2','d4',1500),
('p2','d1',-400),
('p2','d2',2000);



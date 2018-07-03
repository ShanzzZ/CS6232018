#1. What are the #prods whose name begins with a ’p’ and are less than $300.00?*
SELECT prod_id FROM Product WHERE price<300 AND pname LIKE 'p%';


#2 Names of the products stocked in ”d2”.*
#(a) without in/not in 
SELECT pname FROM Product P,Stock S WHERE P.prod_id = S.prod_id AND dep_id='d2';
#(b) with in/not in
SELECT pname FROM Product P WHERE P.prod_id IN(SELECT S.prod_id FROM Stock S WHERE dep_id='d2');



#3. #prod and names of the products that are out of stock.*
#(a) without in/not in 
SELECT P.prod_id,pname FROM Product P,Stock S WHERE P.prod_id = S.prod_id AND quantity <=0;
#(b) with in/not in
SELECT P.prod_id,pname FROM Product P WHERE P.prod_id IN (SELECT S.prod_id FROM Stock S WHERE quantity <=0);


#4. Addresses of the depots where the product ”p1” is stocked.*
#(a) without exists/not exists and without in/not in 
SELECT addr FROM Depot D ,Stock S WHERE D.dep_id = S.dep_id AND prod_id='p1';
#(b) with in/not in
SELECT addr FROM Depot D WHERE D.dep_id IN(SELECT S.dep_id FROM Stock S WHERE prod_id='p1');
#(c) with exists/not exists
SELECT addr FROM Depot D WHERE EXISTS(SELECT S.dep_id FROM Stock S WHERE D.dep_id = S.dep_id AND prod_id='p1');


#5. #prods whose price is between $250.00 and $400.00.*
#(a) using intersect. 
SELECT prod_id FROM Product WHERE price >=250 
INTERSECT 
SELECT prod_id FROM Product WHERE price <=400;
#(b) without intersect.
SELECT prod_id FROM Product WHERE price>=250 AND price<=400;


#6. How many products are out of stock?*
SELECT COUNT(*) FROM Stock WHERE quantity<=0;


#7. Average of the prices of the products stocked in the ”d2” depot.*
SELECT AVG(price) AS AveragePrice FROM Product P,Stock S WHERE P.prod_id = S.prod_id AND dep_id = 'd2';


#8. #deps of the depot(s) with the largest capacity (volume).*
SELECT dep_id FROM Depot WHERE volume = (SELECT max(volume) FROM Depot);


#9. Sum of the stocked quantity of each product.*
SELECT prod_id,SUM(quantity) FROM Stock GROUP BY prod_id;


#10. Products names stocked in at least 3 depots.*
#(a) using count 
SELECT pname FROM Product P,Stock S WHERE P.prod_id IN (SELECT COUNT(dep_id)>=3 FROM Stock);
#(b) without using count


#11. #prod stocked in all depots.*
#(a) using count 

#(b) using exists/not exist


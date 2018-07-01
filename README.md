# CS6232018
Database Management System Project

In order to avoid the ACID properties' violation, we use the following code which can find the data which has same conditions from both tables and delete them.

DELETE Depot, Stock FROM Depot LEFT JOIN Stock ON Depot.dep_id = Stock.dep_id WHERE Depot.dep_id = "d1";

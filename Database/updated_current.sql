CREATE TABLE Users (
	userID int AUTO_INCREMENT,
	name varchar(30),
	email varchar(40),
	phoneNo varchar(12),
	username varchar(20),
	password varchar(20),
	role varchar(10),
	PRIMARY KEY (userID)
);

CREATE TABLE Product (
	productID int AUTO_INCREMENT,
	productName varchar(20),
	weight numeric(10,2), 
	PRIMARY KEY (productID)
);

CREATE TABLE Inventory (
	inventoryID int AUTO_INCREMENT,
	productID int,
	currentdate DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    datetoday DATE,
	PRIMARY KEY (inventoryID),
	FOREIGN KEY (productID) REFERENCES Product(productID)
);

CREATE TABLE Commission (
	commissionID int AUTO_INCREMENT,
	userID int,
	currentdate DATE ,
	amountPaid numeric(10,2),
	PRIMARY KEY (commissionID),
	FOREIGN KEY (userID) REFERENCES Users(userID)
);

CREATE TABLE GenerateReport (
	reportID int AUTO_INCREMENT,
	datetoday DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	startdate DATE,
    enddate DATE,
	totalbags varchar(20),
    totalsales numeric(10,2),
	userID int,
	PRIMARY KEY (reportID),
	FOREIGN KEY (userID) REFERENCES Users(userID)
);


CREATE TABLE InventoryCount (
	inventoryID int AUTO_INCREMENT,
    productID int,
    noOfBags int,
    datetoday DATE,
    PRIMARY KEY (inventoryID),
    FOREIGN KEY (productID) REFERENCES Product(productID)
);

/* INSERTING DATA INTO PRODUCT TABLE */

INSERT INTO Users (userID, name, email, phoneNo, username, password, role)
VALUES (100653, 'Cheryl', 'chocolateycocoa@gmail.com', '012-5881219', 'cher01', 'Cract123+', 'admin');

INSERT INTO Users (userID, name, email, phoneNo, username, password, role)
VALUES (111585, 'Rowena', 'rowenatwc@gmail.com', '016-8856112', 'roting', 'Cract123+', 'employee');

INSERT INTO Product (productID, productName, weight)
VALUES (102506, 'BasedCoat', 25.5);

INSERT INTO Product (productID, productName, weight)
VALUES (102508, 'SkimCoat', 55);

INSERT INTO Product (productID, productName, weight)
VALUES (112603, 'Gypsum', 15);

INSERT INTO Product (productID, productName, weight)
VALUES (112808, 'Thinbed', 50);

INSERT INTO Product (productID, productName, weight)
VALUES (123002, 'Tilefix', 50);

INSERT INTO Product (productID, productName, weight)
VALUES (120102, 'Plastering', 50);

INSERT INTO Product (productID, productName, weight)
VALUES (130305, 'Screeding', 50);

INSERT INTO Product (productID, productName, weight)
VALUES (133008, 'Tileadhesive', 45);

INSERT INTO Product (productID, productName, weight)
VALUES (150309, 'Brickjoint', 35);

/* INSERTING DATA INTO INVENTORY TABLE */

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (1, '2022-04-10 08:24:35', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (1, '2022-04-10 08:30:35', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (2, '2022-04-10 08:32:00', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (4, '2022-04-10 08:37:50', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (4, '2022-04-10 08:38:02', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (4, '2022-04-10 08:38:36', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (5, '2022-04-10 08:39:12', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (5, '2022-04-10 08:39:55', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (6, '2022-04-10 08:40:25', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (7, '2022-04-10 08:41:32', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (7, '2022-04-10 08:45:53', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (7, '2022-04-10 08:48:06', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (7, '2022-04-10 08:48:59', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (8, '2022-04-10 08:50:32', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (8, '2022-04-10 08:51:00', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (8, '2022-04-10 08:51:40', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (9, '2022-04-10 08:52:25', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (9, '2022-04-10 08:52:58', '2022-04-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (1, '2022-05-01 10:05:45', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (1, '2022-05-01 10:06:30', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (1, '2022-05-01 10:08:15', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (1, '2022-05-01 10:09:55', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (2, '2022-05-01 10:10:20', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (2, '2022-05-01 10:10:59', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (4, '2022-05-01 10:13:49', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (5, '2022-05-01 10:15:22', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (5, '2022-05-01 10:16:39', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (6, '2022-05-01 10:20:01', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (6, '2022-05-01 10:20:49', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (6, '2022-05-01 10:22:35', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (7, '2022-05-01 10:24:39', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (7, '2022-05-01 10:25:06', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (8, '2022-05-01 10:26:46', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (9, '2022-05-01 10:27:24', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (9, '2022-05-01 10:28:48', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (9, '2022-05-01 10:29:01', '2022-05-01');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (1, '2022-05-03 13:15:45', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (1, '2022-05-03 13:18:01', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (1, '2022-05-03 13:19:26', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (2, '2022-05-03 13:20:10', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (2, '2022-05-03 13:22:26', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (2, '2022-05-03 13:24:39', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (2, '2022-05-03 13:25:43', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (4, '2022-05-03 13:28:40', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (4, '2022-05-03 13:29:57', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (4, '2022-05-03 13:30:09', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (5, '2022-05-03 13:31:28', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (5, '2022-05-03 13:33:19', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (6, '2022-05-03 13:34:42', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (6, '2022-05-03 13:36:34', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (6, '2022-05-03 13:37:52', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (7, '2022-05-03 13:39:20', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (8, '2022-05-03 13:42:17', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (8, '2022-05-03 13:45:35', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (8, '2022-05-03 13:46:47', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (9, '2022-05-03 13:50:01', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (9, '2022-05-03 13:52:29', '2022-05-03');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (1, '2022-05-10 08:22:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (1, '2022-05-10 08:23:35', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (1, '2022-05-10 08:24:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (1, '2022-05-10 08:22:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (2, '2022-05-10 08:22:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (2, '2022-05-10 08:22:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (2, '2022-05-10 08:22:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (4, '2022-05-10 08:22:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (5, '2022-05-10 08:22:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (5, '2022-05-10 08:22:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (5, '2022-05-10 08:22:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (6, '2022-05-10 08:22:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (6, '2022-05-10 08:22:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (7, '2022-05-10 08:22:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (7, '2022-05-10 08:22:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (7, '2022-05-10 08:22:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (8, '2022-05-10 08:22:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (9, '2022-05-10 08:22:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (9, '2022-05-10 08:22:29', '2022-05-10');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (1, '2022-05-11 13:52:29', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (1, '2022-05-11 13:53:56', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (2, '2022-05-11 13:55:13', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (2, '2022-05-11 13:56:06', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (2, '2022-05-11 13:57:01', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (2, '2022-05-11 13:58:29', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (4, '2022-05-11 13:59:47', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (4, '2022-05-11 14:00:45', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (4, '2022-05-11 14:02:45', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (4, '2022-05-11 14:04:13', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (5, '2022-05-11 14:05:55', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (6, '2022-05-11 14:06:34', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (6, '2022-05-11 14:07:29', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (6, '2022-05-11 14:09:01', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (6, '2022-05-11 14:10:52', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (7, '2022-05-11 14:13:23', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (7, '2022-05-11 14:14:59', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (8, '2022-05-11 14:15:30', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (8, '2022-05-11 14:16:12', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (8, '2022-05-11 14:17:47', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (8, '2022-05-11 14:18:20', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (9, '2022-05-11 14:19:49', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (9, '2022-05-11 14:20:45', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (9, '2022-05-11 14:21:35', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (9, '2022-05-11 14:21:35', '2022-05-11');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (2, '2022-05-12 10:15:01', '2022-05-12');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (2, '2022-05-12 10:18:23', '2022-05-12');

INSERT INTO Inventory (productID, currentdate, datetoday)
VALUES (2, '2022-05-12 10:20:45', '2022-05-12');

INSERT INTO Inventory (productID, datetoday)
VALUES (6, '2022-05-13');

INSERT INTO Inventory (productID, datetoday)
VALUES (6, '2022-05-13');

INSERT INTO Inventory (productID, datetoday)
VALUES (6, '2022-05-13');

INSERT INTO Inventory (productID, datetoday)
VALUES (6, '2022-05-13');

INSERT INTO Inventory (productID, datetoday)
VALUES (6, '2022-05-13');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (1, 300, '2022-05-01');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (2, 500, '2022-05-01');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (4, 400, '2022-05-01');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (5, 650, '2022-05-01');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (6, 290, '2022-05-01');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (7, 450, '2022-05-01');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (8, 675, '2022-05-01');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (9, 550, '2022-05-01');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (1, 560, '2022-05-03');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (2, 340, '2022-05-03');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (4, 990, '2022-05-03');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (5, 300, '2022-05-03');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (6, 280, '2022-05-03');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (7, 660, '2022-05-03');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (8, 875, '2022-05-03');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (9, 120, '2022-05-03');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (1, 250, '2022-05-06');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (2, 0, '2022-05-06');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (4, 800, '2022-05-06');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (5, 500, '2022-05-06');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (6, 450, '2022-05-06');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (7, 330, '2022-05-06');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (8, 250, '2022-05-06');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (9, 360, '2022-05-06');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (1, 100, '2022-04-06');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (2, 480, '2022-04-06');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (4, 500, '2022-04-06');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (5, 250, '2022-04-06');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (6, 300, '2022-04-06');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (7, 450, '2022-04-06');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (8, 200, '2022-04-06');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (9, 600, '2022-04-06');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (1, 455, CURDATE());

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (2, 500, CURDATE());

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (4, 225, CURDATE());

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (5, 389, CURDATE());

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (6, 400, CURDATE());

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (7, 650, CURDATE());

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (8, 990, CURDATE());

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (9, 340, CURDATE());

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (1, 200, '2022-05-19');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (2, 300, '2022-05-19');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (4, 400, '2022-05-19');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (5, 560, '2022-05-19');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (6, 78, '2022-05-19');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (7, 340, '2022-05-19');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (8, 450, '2022-05-19');

INSERT INTO InventoryCount (productID, noOfBags, datetoday)
VALUES (9, 560, '2022-05-19');


/* INSERTING VALUES INTO COMMISSION TABLE */

INSERT INTO Commission (userID, currentdate, amountPaid)
VALUES (1, CURDATE(), 189.96);

INSERT INTO Commission (userID, currentdate, amountPaid)
VALUES (2, '2022-04-10', 0.90);

INSERT INTO Commission (userID, currentdate, amountPaid)
VALUES (1, '2022-05-01', 0.90);

INSERT INTO Commission (userID, currentdate, amountPaid)
VALUES (2, '2022-05-03', 1.05);

/* THIS IS TO ALTER THE TABLES */

ALTER TABLE Inventory
DROP COLUMN datetoday;

ALTER TABLE Inventory
ADD COLUMN datetoday DATE;

UPDATE Inventory
SET datetoday = '2022-05-01'
WHERE DATE(currentdate) = '2022-05-01';


/* THIS IS TO DELETE THE TABLES */

DELETE FROM Inventory WHERE inventoryID between 19 and 36;
DELETE FROM Inventory WHERE datetoday IS NULL;
DELETE FROM InventoryCount WHERE datetoday = '2022-05-19';
DELETE FROM Inventory WHERE inventoryID = 234;
DELETE FROM Product WHERE productID = 3;
DELETE FROM Commission WHERE commissionID = 15;
TRUNCATE TABLE Inventory;
TRUNCATE TABLE Commission;
DELETE FROM InventoryCount WHERE datetoday = '2022-05-16';
TRUNCATE TABLE InventoryCount;

/*THIS IS TO VIEW THE TABLES CREATED*/

SELECT * FROM Users;
SELECT * FROM Product;
SELECT * FROM Inventory;
SELECT * FROM Commission;
SELECT * FROM GenerateReport;
SELECT * FROM InventoryCount;

/* THIS IS TO DROP TABLES */

DROP TABLE Product;
DROP TABLE Users;
DROP TABLE Inventory;
DROP TABLE Commission;
DROP TABLE GenerateReport;

/*THIS IS TO VIEW SPECIFIC ROWS ON A DATE FROM INVENTORY TABLE */

SELECT p.productName, COUNT(i.productID) AS Count
FROM Inventory i
INNER JOIN Product p ON i.productID = p.productID
WHERE datetoday = '2022-05-09'
GROUP BY p.productName;

SELECT p.productName, COUNT(i.productID) AS Count, i.datetoday
FROM Inventory i
INNER JOIN Product p ON i.productID = p.productID
GROUP BY p.productName, i.datetoday;


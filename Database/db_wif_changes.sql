/* THIS IS TO CREATE TABLES */

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

CREATE TABLE Commission (
	commissionID int AUTO_INCREMENT,
	userID int,
	currentdate DATE,
	amountPaid numeric(10,2),
	PRIMARY KEY (commissionID),
	FOREIGN KEY (userID) REFERENCES Users(userID)
);

CREATE TABLE GenerateReport (
	reportID int AUTO_INCREMENT,
	currentdate DATE,
	currenttime varchar(10),
	userID int,
	PRIMARY KEY (reportID),
	FOREIGN KEY (userID) REFERENCES Users(userID)
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
	noOfBags numeric(6),
	batchNo numeric(6),
	PRIMARY KEY (inventoryID),
	FOREIGN KEY (productID) REFERENCES Product(productID)
);

/* INSERTING DATA INTO TABLE */

INSERT INTO Users (name, email, phoneNo, username, password, role)
VALUES ('Cheryl', 'chocolateycocoa@gmail.com', '012-5881219', 'cher01', 'Cract123+', 'admin');

INSERT INTO Users (name, email, phoneNo, username, password, role)
VALUES ('Rowena', 'rowenatwc@gmail.com', '016-8856112', 'roting', 'Cract123+', 'employee');

INSERT INTO Product (productName, weight)
VALUES ('BasedCoat', 25.5);

INSERT INTO Product (productName, weight)
VALUES ('SkimCoat', 55);

INSERT INTO Product (productName, weight)
VALUES ('Gypsum', 15);

INSERT INTO Product (productName, weight)
VALUES ('Thinbed', 50);

INSERT INTO Product (productName, weight)
VALUES ('Tilefix', 50);

INSERT INTO Product (productName, weight)
VALUES ('Plastering', 50);

INSERT INTO Product (productName, weight)
VALUES ('Screeding', 50);

INSERT INTO Product (productName, weight)
VALUES ('Tileadhesive', 45);

INSERT INTO Product (productName, weight)
VALUES ('Brickjoint', 35);

INSERT INTO Inventory (productID, noOfBags, batchNo)
VALUES (1, 100, 250322);

INSERT INTO Inventory (productID, noOfBags, batchNo)
VALUES (7, 100, 250322);

INSERT INTO Inventory (productID, noOfBags, batchNo)
VALUES (3, 200, 010121);

INSERT INTO Inventory (productID, noOfBags, batchNo)
VALUES (4, 150, 250621);

/* THIS IS TO VIEW THE TABLES CREATED */

SELECT * FROM Users;
SELECT * FROM Product;
SELECT * FROM Inventory;

/* THIS IS TO DROP TABLES */

DROP TABLE Product;
DROP TABLE Users;
DROP TABLE Inventory;
DROP TABLE Commission;
DROP TABLE GenerateReport;
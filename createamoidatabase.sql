CREATE TABLE Users (
  userID numeric(6),
  name varchar(30),
	email varchar(40),
	phoneNo varchar(12),
	username varchar(20),
	password varchar(20),
	role varchar(10),
	PRIMARY KEY (userID)
);

CREATE TABLE Commission (
  commissionID numeric(6),
  userID numeric(6),
	currentdate DATE,
	amountPaid numeric(10,2),
	PRIMARY KEY (commissionID),
	FOREIGN KEY (userID) REFERENCES Users(userID)
);

CREATE TABLE GenerateReport (
  reportID numeric(6),
	currentdate DATE,
	currenttime varchar(10),
	userID numeric(6),
	PRIMARY KEY (reportID),
	FOREIGN KEY (userID) REFERENCES Users(userID)
);

CREATE TABLE Product (
	productID numeric(6),
	productName varchar(20),
	weight float(10),
	PRIMARY KEY (productID)
);

CREATE TABLE Inventory (
  inventoryID numeric(6),
	productID numeric(6),
	noOfBags numeric(6),
	batchNo numeric(6),
	PRIMARY KEY (inventoryID),
	FOREIGN KEY (productID) REFERENCES Product(productID)
);
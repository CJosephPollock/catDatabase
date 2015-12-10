CREATE TABLE VENDOR_ADDRESS 
(
VendorAddressID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
StreetAddress varchar(500),
CityName varchar(50),
StateName varchar(50),
ZipCode int
);

CREATE TABLE CUST_ADDRESS 
(
CustAddressID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
StreetAddress varchar(500),
CityName varchar(50),
StateName varchar(50),
ZipCode int
);

CREATE TABLE BREED (
BreedID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
BreedName varchar(50) NOT NULL
);

CREATE TABLE CUSTOMER (
CustomerID int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
FirstName varchar(30) NOT NULL,
LastName varchar(30) NOT NULL,
CustAddressID int FOREIGN KEY REFERENCES CUST_ADDRESS (CustAddressID)
);


CREATE TABLE VENDOR 
(
VendorID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
VendorName varchar(50) NOT NULL,
VendorDescription varchar(500),
VendorAddressID int FOREIGN KEY REFERENCES VENDOR_ADDRESS  (VendorAddressID)
);

CREATE TABLE VENDOR_ORDER (
VendorOrderID  int IDENTITY(1,1) PRIMARY KEY NOT NULL,
VendorID int FOREIGN KEY REFERENCES VENDOR (VendorID),
OrderDate Date NOT NULL
);

CREATE TABLE CAT (
CatID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
CatName varchar(50) NOT NULL,
VendorID int FOREIGN KEY REFERENCES VENDOR (VendorID),
BreedID int FOREIGN KEY REFERENCES BREED (BreedID),
DateOfBirth date,
Price int 
);

CREATE TABLE SALES_ORDER
(
SalesOrderID INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
SalesOrderDate date,
CustomerID int FOREIGN KEY REFERENCES CUSTOMER (CustomerID) NOT NULL
);

CREATE TABLE CAT_LINE_ITEM
(
CatLineItemID INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
CatID int FOREIGN KEY REFERENCES CAT (CatID),
SalesOrderID int FOREIGN KEY REFERENCES SALES_ORDER(SalesOrderID)
);

CREATE TABLE PRODUCT_TYPE(
ProductTypeID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
ProductTypeName varchar(50)
);

CREATE TABLE PRODUCT (
ProductID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
ProductTypeID int FOREIGN KEY REFERENCES PRODUCT_TYPE (ProductTypeID),
ProductName varchar(30) NOT NULL,
Price MONEY NOT NULL
);

CREATE TABLE VENDOR_ORDER_ITEM (
VendorOrderItemID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
VendorOrderID int FOREIGN KEY REFERENCES VENDOR_ORDER(VendorOrderID),
ProductID int FOREIGN KEY REFERENCES PRODUCT (ProductID),
Quantity int NOT NULL
);

CREATE TABLE PRODUCT_LINE_ITEM(
ProductLineItemID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
ProductID int FOREIGN KEY REFERENCES PRODUCT (ProductID),
SalesOrderID int FOREIGN KEY REFERENCES SALES_ORDER(SalesOrderID),
Quantity int NOT NULL
);
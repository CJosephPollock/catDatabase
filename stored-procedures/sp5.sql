-- TianAi Zhao

--STORED PROCEDURE 5
--This procedure will populate customer and customer address tables

CREATE PROCEDURE GetCustName
@Count INT
AS
DECLARE @ID INT
DECLARE @Fname varchar (30)
DECLARE @Lname varchar(30)
DECLARE @Street varchar(500)
DECLARE @State varchar(50)
DECLARE @City varchar(50)
DECLARE @zip int
DECLARE @addressID INT
 
 
WHILE @Count > 0
 
BEGIN
SET @ID = (SELECT Min(CustomerID) FROM [dbo].[TEST])
SET @Fname = (SELECT CustomerFname FROM TEST WHERE CustomerID = @ID)
SET @Lname = (SELECT CustomerLname FROM [dbo].[TEST]  WHERE CustomerID = @ID)
SET @Street = (SELECT CustomerAddress FROM [dbo].[TEST]  WHERE CustomerID = @ID)
SET @State = (SELECT CustomerState FROM [dbo].[TEST]  WHERE CustomerID = @ID)
SET @City = (SELECT CustomerCity FROM [dbo].[TEST]  WHERE CustomerID = @ID)
SET @zip = (SELECT CustomerZIP FROM [dbo].[TEST]  WHERE CustomerID = @ID)
 
 
INSERT INTO CUST_ADDRESS([StreetAddress], [CityName],[StateName],[ZipCode])
 
Values (@Street, @State, @City, @zip)
 
SET @addressID = (SELECT scope_identity())
 
INSERT INTO CUSTOMER(FirstName, LastName, [CustAddressID])
values(@Fname, @Lname, @addressID)
 
DELETE FROM TEST WHERE CustomerID = @ID
 
SET @Count= @count-1
 
END
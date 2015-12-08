--STORED PROCEDURE 6
CREATE PROCEDURE MakeVendorOrder
@VendorName varchar(50)

AS
DECLARE @date date = getDate()
DECLARE @ID INT = (SELECT [VendorID] FROM [dbo].[VENDOR] WHERE [VendorName] LIKE '%' + @VendorName + '%')

INSERT INTO [dbo].[VENDOR_ORDER]([VendorID],[OrderDate])
 
Values (@ID, @date)
 
Execute MakeVendorOrder '3M'
Execute MakeVendorOrder 'Maxell'
Execute MakeVendorOrder 'Ora Health'
Execute MakeVendorOrder 'Pencil Grip'
Execute MakeVendorOrder '3M'

CREATE PROCEDURE MakeVendorOrderLineItem
@ProdName varchar(50),
@OrderID int,
@Quantity int

AS
declare @productID int = (select productID from [dbo].[PRODUCT] where [ProductName] = @ProdName)

INSERT INTO [dbo].[VENDOR_ORDER_ITEM]([VendorOrderID],[ProductID],[Quantity])

VALUES(@OrderID, @productID, @Quantity)

EXECUTE MakeVendorOrderLineItem 'Play Balls', 1, 10
EXECUTE MakeVendorOrderLineItem 'The Stronghold Titanium Leash', 3, 10
EXECUTE MakeVendorOrderLineItem 'The Greg Hay Master Collar', 4, 5
EXECUTE MakeVendorOrderLineItem 'Yummy Bites Cat Food', 3, 20


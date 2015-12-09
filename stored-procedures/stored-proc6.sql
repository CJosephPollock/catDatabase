-- TianAi Zhao

--STORED PROCEDURE 6

--Insert into verdor order table and verdor order item table to keep track of things the store order from different vendors

CREATE PROCEDURE insertOrderInfo
@VenderName varchar(50),
@Prodname varchar(50),
@Quantity INT,
@Date DATE

AS
DECLARE @ID INT = (SELECT [VendorID] FROM [dbo].[VENDOR] WHERE [VendorName] LIKE '%' + @VenderName + '%')
declare @ProductID int = (select [ProductID] from [dbo].[PRODUCT] where [ProductName]= @Prodname)
DECLARE @VenderOrderID INT = (SELECT [VendorOrderID] FROM [dbo].[VENDOR_ORDER] WHERE [VendorID] = @ID and [OrderDate] = @Date)

IF @venderOrderID IS NULL
BEGIN

INSERT INTO [dbo].[VENDOR_ORDER]([VendorID],[OrderDate]) 
VALUES (@ID, @date)

SET @VenderOrderID = (SELECT scope_identity())
END

INSERT INTO [dbo].[VENDOR_ORDER_ITEM]([VendorOrderID],[ProductID],[Quantity])
VALUES(@VenderOrderID, @ProductID, @Quantity)


EXECUTE insertOrderInfo '3M', 'Play Balls', 10, '20140103'



--STORED PROCEDURE 4

--This procedure makes a customer order and then you can start ordering line items on this order. In practice you would call the MakeCustomerOrder prodecure and then you would make each line item with MakeCustomerOrderItem using the references SalesrOrderID you just created.

GO
CREATE PROCEDURE MakeCustomerOrder
    @CustFname varchar(30),
    @CustLname varchar(30)
AS
DECLARE @Date DATE =  GETDATE()
DECLARE @CustID INT = 
    (
        SELECT CustomerID FROM CUSTOMER C WHERE C.FirstName LIKE '%' + @CustFname + '%' AND C.LastName LIKE '%' + @CustLname + '%'
    )

INSERT INTO dbo.SALES_ORDER
    (
        SalesOrderDate,
        CustomerID
    )
VALUES
    (
        @Date,
        @CustID
    )
GO

EXECUTE dbo.MakeCustomerOrder 'Star', 'Saffo'



GO
CREATE PROCEDURE MakeCustomerOrderItem
    @OrderID INT,
    @ProductName varchar(30),
    @Quantity INT

AS
DECLARE @ProductID INT = (SELECT ProductID FROM PRODUCT P WHERE P.ProductName LIKE '%' + @ProductName + '%')
INSERT INTO PRODUCT_LINE_ITEM
    (
        ProductID,
        SalesOrderID,
        Quantity        
    )
VALUES
    (
        @ProductID,
        @OrderID,
        @Quantity
    )

EXECUTE MakeCustomerOrderItem 1, 'Play Balls', 6

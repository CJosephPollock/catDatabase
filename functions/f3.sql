-- Jordan Hand

-- BUSINESS RULE

--  Forbids sale of a product if we are out of stock
-- for that product

-- FUNCTION

CREATE FUNCTION fn_lowInventory (@ProductID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Ret INT = 0

    DECLARE @ProductName varchar(30) = (SELECT ProductName FROM PRODUCT P WHERE P.ProductID = @ProductID)

    DECLARE @Incoming INT = (
        SELECT SUM(VOI.Quantity) FROM VENDOR_ORDER_ITEM VOI
        JOIN PRODUCT P
            ON P.ProductID = VOI.ProductID
        WHERE P.ProductName LIKE '%' + @ProductName + '%'
    )

    DECLARE @Outgoing INT = (
        SELECT SUM(PLI.Quantity) FROM PRODUCT_LINE_ITEM PLI
        JOIN PRODUCT P
            ON P.ProductID = PLI.ProductID
        WHERE P.ProductName LIKE '%' + @ProductName + '%'
    )

    IF (@Incoming - @Outgoing) <= 0
        SET @Ret = 1

    RETURN @Ret
END

-- CHECK CONSTRAINT

ALTER TABLE PRODUCT_LINE_ITEM WITH NOCHECK
ADD CONSTRAINT ck_outOfStock
CHECK (dbo.fn_lowInventory(ProductID) = 0)
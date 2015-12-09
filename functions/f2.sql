-- BUSINESS RULE

-- If inventory goes too low (below 5) we want to order more
-- of that product

CREATE FUNCTION fn_lowInventory (@ProductName VARCHAR(30))
RETURNS INT
AS
BEGIN
    DECLARE @Ret INT = 0

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

    IF (@Incoming - @Outgoing) < 5
        SET @Ret = 1

    RETURN @Ret
END

SELECT dbo.fn_lowInventory('Balls')

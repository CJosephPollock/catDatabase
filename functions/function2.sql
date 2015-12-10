-- TianAi Zhao

-- BUSINESS RULE

-- Customers without an address are not allowed to
-- adopt a cat. We want to make sure our cats
-- go to a good home!

-- FUNCTION

CREATE function fn_checkCustAddress()
RETURNS INT
AS
BEGIN
    DECLARE @result INT = 0
    IF EXISTS (
    	SELECT * FROM CUSTOMER C
    	WHERE C.CustAddressID = null
    )
    SET @result = 1

    RETURN @result
END

-- CHECK CONSTRAINT

ALTER TABLE SALES_ORDER WITH NOCHECK
ADD CONSTRAINT ck_noAddress
CHECK (dbo.fn_checkCustAddress() = 0)

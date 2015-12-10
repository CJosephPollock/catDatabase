-- TianAi Zhao

-- BUSINESS RULE


-- FUNCTION

CREATE function fn_checkCustAddress(@CustID int)
returns int
as
begin
    declare @result int = 0
    IF EXISTS (
    	select * from CUSTOMER C
    	where C.CustAddressID = null)
        	set @result = 1

    return @result
end

-- CHECK CONSTRAINT

ALTER TABLE SALES_ORDER WITH NOCHECK
ADD CONSTRAINT ck_noAddress
CHECK (dbo.fn_checkCustAddress(CustomerID) = 0)

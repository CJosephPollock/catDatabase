-- TianAi Zhao

-- BUSINESS RULE

-- Customers without an address are not allowed to
-- adopt a cat. We want to make sure our cats
-- go to a good home!

-- FUNCTION

CREATE function fn_checkCustAddress()
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
CHECK (dbo.fn_checkCustAddress() = 0)

-- TianAi Zhao

-- BUSINESS RULE

-- If inventory goes too low (below 5) we want to order more
-- of that product

-- FUNCTION

CREATE function fn_checkCustAddress(@CustID int)
returns int
as
begin
    declare @result int = 0
    if not exists(select * from CUSTOMER c 
    join CUST_ADDRESS ca on ca.CustAddressID = c.CustAddressID
    where ca.StreetAddress = null )
        set @result = 1

    return @result
end

-- CHECK CONSTRAINT

ALTER TABLE SALES_ORDER WITH NOCHECK
ADD CONSTRAINT ck_noAddress
CHECK (dbo.fn_checkCustAddress(CustomerID) = 0)

create function fn_checkCustAddress(@CustID int)
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



SELECT dbo.fn_checkCustAddress (51)
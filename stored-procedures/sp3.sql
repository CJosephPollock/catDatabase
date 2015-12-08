--STORED PROCEDURE 3
--adopt a cat SP
CREATE procedure adoptACat(@salesOrderID int, @catID int) 
as

declare @result int = 0;

begin
if exists (
    select * from SALES_ORDER so 

    join CAT_LINE_ITEM cli 
    on cli.SalesOrderID = so.SalesOrderID
    join CAT c 
    on c.CatID = cli.CatID

    where c.CatID = @catID) 

        set @result = 1
else
    DECLARE @custID int = (select CustomerID from SALES_ORDER so where so.SalesOrderID = @salesOrderID)
    if(dbo.fn_checkCustAddress(@custID) = 0)
        insert into CAT_LINE_ITEM(CatID, SalesOrderID) values (@catID, @salesOrderID)

return @result

end

create function fn_sumOfItemSales() 
RETURNS table
as
return
(
    SELECT P.ProductID, P.ProductName, p.Price, pli.Quantity, p.Price * pli.Quantity AS 'Total'
    FROM Product P 
    JOIN PRODUCT_LINE_ITEM pli on p.ProductID = pli.ProductID
    JOIN SALES_ORDER so ON pli.SalesOrderID = so.SalesOrderID   
)

go

select * from fn_sumOfItemSales()

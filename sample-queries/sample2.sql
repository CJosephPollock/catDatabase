--Find the high roller
SELECT c.CustomerID as CustomerID, MAX(p.Price) as Price, MAX(pli.Quantity) as Quantity

from CUSTOMER c 

join SALES_ORDER so 
on so.CustomerID = c.CustomerID

join PRODUCT_LINE_ITEM pli 
on pli.SalesOrderID = so.SalesOrderID

join PRODUCT p 
on p.ProductID = pli.ProductID

group by c.CustomerID
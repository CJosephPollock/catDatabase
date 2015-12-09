-- SAMPLE QUERY

-- Gets the customer who has made the most orders
SELECT TOP 1 c.CustomerID, C.FirstName, C.LastName, COUNT(*) AS OrderCount

from SALES_ORDER SO
    join CUSTOMER C 
        on so.CustomerID = c.CustomerID
WHERE C.CustomerID = SO.CustomerID
group by c.CustomerID, C.FirstName, C.LastName
ORDER BY OrderCount DESC
SELECT TOP 1 CatName, SalesOrderDate FROM CAT_LINE_ITEM CLI
    JOIN CAT C
        ON CLI.CatID = C.CatID
    JOIN SALES_ORDER SO
        ON CLI.SalesOrderID = SO.SalesOrderID
ORDER BY SO.SalesOrderDate
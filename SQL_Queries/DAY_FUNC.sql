SELECT 
    DAY(shipped_date) [DAY], 
    MONTH(shipped_date) [MONTH], 
    YEAR(shipped_date) [YEAR], 
    SUM(list_price * quantity) gross_sales
FROM 
    sales.orders o
    INNER JOIN sales.order_items i ON i.order_id = o.order_id
WHERE 
    shipped_date IS NOT NULL
    AND YEAR(shipped_date) = 2017
    AND MONTH(shipped_date) = 2
GROUP BY 
    DAY(shipped_date),
    MONTH(shipped_date), 
    YEAR(shipped_date)
ORDER BY [day];  

SELECT 
    * 
FROM
    sales.orders;

SELECT 
    * 
FROM
    sales.order_items;

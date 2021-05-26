
SELECT
    p1.category_id,
    ca.category_name,
    p1.product_name,
    p1.list_price
FROM
    production.products p1
INNER JOIN
    production.categories ca
ON
    p1.category_id = ca.category_id
WHERE
    p1.list_price IN(
        SELECT max_price
        FROM (
            SELECT 
                category_id,
                MAX(list_price) as max_price
            FROM 
                production.products
            GROUP BY 
                category_id
        ) AS prices
    )
ORDER BY
    p1.list_price DESC;

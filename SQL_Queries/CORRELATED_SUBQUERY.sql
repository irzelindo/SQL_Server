/*
    A correlated subquery is a subquery that uses the 
    values of the outer query. In other words, 
    it depends on the outer query for its values. 
    Because of this dependency, a correlated subquery 
    cannot be executed independently as a simple subquery.

    Moreover, a correlated subquery is executed repeatedly, 
    once for each row evaluated by the outer query. 
    The correlated subquery is also known as a repeating subquery.
*/

/*
    The following example finds the products whose list price 
    is equal to the highest list price of the products within 
    the same category:
*/

SELECT
    product_name,
    list_price,
    category_id
FROM
    production.products p1
WHERE
    list_price IN (
        SELECT
            MAX (p2.list_price)
        FROM
            production.products p2
        WHERE
            p2.category_id = p1.category_id
        GROUP BY
            p2.category_id
    )
ORDER BY
    category_id,
    product_name;

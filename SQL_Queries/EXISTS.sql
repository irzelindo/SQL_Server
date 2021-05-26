/*
    Using EXISTS with a subquery returns NULL example
    The following example returns all rows from the  customers table
    In this example, the subquery returned a result set that contains 
    NULL which causes the EXISTS operator to evaluate to TRUE. 
    Therefore, the whole query returns all rows from the customers table.
*/
SELECT
    customer_id,
    first_name,
    last_name
FROM
    sales.customers
WHERE
    EXISTS (SELECT NULL)
ORDER BY
    first_name,
    last_name;

/*
    Using EXISTS with a correlated subquery example
    Consider the following customers and orders tables
    The following example finds all customers who 
    have placed more than two orders.
*/

SELECT
    customer_id,
    first_name,
    last_name
FROM
    sales.customers c
WHERE
    EXISTS (
        SELECT
            COUNT (*)
        FROM
            sales.orders o
        WHERE
            customer_id = c.customer_id
        GROUP BY
            customer_id
        HAVING
            COUNT (*) > 2
    )
ORDER BY
    first_name,
    last_name;

/*
    The following statement uses the EXIST operator to find 
    the orders of the customers from San Jose.
*/

SELECT
    *
FROM
    sales.orders o
WHERE
    EXISTS (
        SELECT
            customer_id
        FROM
            sales.customers c
        WHERE
            o.customer_id = c.customer_id
        AND city = 'San Jose'
    )
ORDER BY
    o.customer_id,
    order_date;

/*
    In practice, you use the EXISTS when you just need to check 
    the existence of rows from related tables without returnning 
    data from them.
*/
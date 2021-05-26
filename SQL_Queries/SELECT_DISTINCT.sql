SELECT DISTINCT
    city
FROM
    sales.customers
ORDER BY
    city;

/*
    DISTINCT multiple columns example
    This statement returns all cities and states of all customers
    In this example, the statement used the combination of values 
    in both  city and state columns to evaluate the duplicate.
*/

SELECT DISTINCT
    city,
    state
FROM
    sales.customers;

/*  
    If you apply the DISTINCT clause to a column that has NULL, 
    the DISTINCT clause will keep only one NULL and eliminates the other. 
    In other words, the DISTINCT clause treats all NULL “values” as the same value.
*/

SELECT DISTINCT
    phone
FROM
    sales.customers
ORDER BY
    phone;

/*
    DISTINCT vs. GROUP BY
    The following statement uses the GROUP BY clause
    to return distinct cities together with state and zip code
    from the sales.customers table
*/
SELECT 
	city, 
	state, 
	zip_code
FROM 
	sales.customers
GROUP BY 
	city, state, zip_code
ORDER BY
	city, state, zip_code

/*
    Both DISTINCT and GROUP BY clause reduces the number of returned 
    rows in the result set by removing the duplicates.
    However, you should use the GROUP BY clause when you want to apply 
    an aggregate function on one or more columns.
*/


/*
    The following example uses a constant value to 
    return the top 10 most expensive products.
*/

SELECT TOP 10
    product_name, 
    list_price
FROM
    production.products
ORDER BY 
    list_price DESC;

/*
    The following example uses PERCENT to specify 
    the number of products returned in the result set. 
    The production.products table has 321 rows, therefore, 
    one percent of 321 is a fraction value ( 3.21), 
    SQL Server rounds it up to the next whole number 
    which is four (4) in this case.
*/

SELECT TOP 1 PERCENT
    product_name, 
    list_price
FROM
    production.products
ORDER BY 
    list_price DESC;

/*
    Using TOP WITH TIES to include rows that match 
    the values in the last row.
    The following statement returns the top three 
    most expensive products
*/
SELECT TOP 3 WITH TIES
    product_name, 
    list_price
FROM
    production.products
ORDER BY 
    list_price DESC;

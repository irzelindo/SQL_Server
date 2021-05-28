/*
    The following statement uses the CONCAT() 
    function to concatenate values in the first_name 
    and last_name columns of the sales.customers table
*/
SELECT 
    customer_id,
    first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) full_name
FROM 
    sales.customers
ORDER BY 
    full_name;



/*
    As clearly shown in the output, 
    if the customer has no phone number, 
    the CONCAT() function used an empty 
    for the concatenation.

    Note that we used the CHAR() 
    function to get the new line 
    character in this example.

    Char(10) – New Line / Line Break
    Char(13) – Carriage Return
    Char(9) – Tab
*/
SELECT 
    CONCAT(
        CHAR(13),
        CONCAT(first_name,' ',last_name),
        CHAR(13),
        phone,
        CHAR(13),
        CONCAT(city,' ',state),
        CHAR(13),
        zip_code
    ) customer_address
FROM
    sales.customers
ORDER BY 
    first_name,
    last_name;
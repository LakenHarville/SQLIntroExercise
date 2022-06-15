/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT 
    P.Name AS Product, C.Name AS Category
FROM
    products AS P
        INNER JOIN
    categories AS C ON C.CategoryID = P.ProductID
WHERE
    C.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT 
    products.Name, products.Price, reviews.Rating
FROM
    products
        INNER JOIN
    reviews ON reviews.ProductID = products.ProductID
WHERE
    reviews.Rating = 5;
    
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT 
    e.FirstName, e.LastName, Sum(s.Quantity) AS total
FROM
    sales AS s
        INNER JOIN
    employees AS e ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY total DESC
LIMIT 2;

SELECT 
    *
FROM
    sales
WHERE
    EmployeeID = 33809;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
 SELECT 
    d.Name AS 'Department Name', c.Name AS 'Category Name'
FROM
    departments AS d
        INNER JOIN
    categories AS c ON c.DepartmentID = d.DepartmentID
WHERE
    c.Name = 'Appliances'
        OR c.Name = 'Games';
 
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT 
    p.Name,
    SUM(s.Quantity) AS 'Total Sold',
    SUM(s.Quantity * s.PricePerUnit) AS 'Total Price'
FROM
    products AS p
        INNER JOIN
    sales AS s ON s.ProductID = p.ProductID
WHERE
    p.ProductID = 97;
-- Verification
SELECT 
    *
FROM
    sales
WHERE
    ProductID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT 
    p.Name, r.Reviewer, r.Rating, r.Comment
FROM
    products AS p
        INNER JOIN
    reviews AS r ON r.ProductID = p.ProductID
WHERE
    p.ProductID = 857 AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    p.Name,
    SUM(s.quantity) AS TotalSold
FROM
    sales AS s
        INNER JOIN
    employees AS e ON e.EmployeeID = s.EmployeeID
        INNER JOIN
    products AS p ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID , p.ProductID
ORDER BY TotalSold DESC;
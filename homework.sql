-- Week 5 - Wednesday
-- Questions

-- 1. List all customers who live in Texas (use
-- JOINs)

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)

-- 4. List all customers that live in Nepal (use the city
-- table)

-- 5. Which staff member had the most
-- transactions?

-- 6. How many movies of each rating are
-- there?

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)

-- 8. How many free rentals did our stores give away?

SELECT Customers.customer_id, Customers.name, Customers.email
FROM Customers
INNER JOIN Addresses ON Customers.customer_id = Addresses.customer_id
WHERE Addresses.state = 'Texas';

SELECT CONCAT(Customers.first_name, ' ', Customers.last_name) AS full_name, Payments.amount
FROM Customers
INNER JOIN Payments ON Customers.customer_id = Payments.customer_id
WHERE Payments.amount > 6.99;


SELECT CONCAT(first_name, ' ', last_name) AS customer_name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Payments
    WHERE amount > 175.00
);

SELECT Customers.customer_id, Customers.name, Customers.email
FROM Customers
INNER JOIN Addresses ON Customers.customer_id = Addresses.customer_id
INNER JOIN Cities ON Addresses.city_id = Cities.city_id
WHERE Cities.country_name = 'Nepal';

SELECT Staff.staff_id, Staff.staff_name, COUNT(*) AS transaction_count
FROM Staff
INNER JOIN Transactions ON Staff.staff_id = Transactions.staff_id
GROUP BY Staff.staff_id, Staff.staff_name
ORDER BY transaction_count DESC
LIMIT 1;

SELECT rating, COUNT(*) AS movie_count
FROM Movies
GROUP BY rating;

SELECT first_name, last_name, email
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Payments
    WHERE amount > 6.99
    GROUP BY customer_id
    HAVING COUNT(*) = 1
);

SELECT store_name, COALESCE(total_free_rentals, 0) AS free_rentals
FROM Stores
LEFT JOIN (
    SELECT store_id, COUNT(*) AS total_free_rentals
    FROM Rentals
    WHERE rental_cost = 0
    GROUP BY store_id
) AS Subquery ON Stores.store_id = Subquery.store_id;



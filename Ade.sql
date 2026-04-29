-- find all cities that start with "A"
SELECT * FROM city
WHERE city LIKE "A%";

-- find all customer that their first name is either MARY or Susan
SELECT * FROM customer
WHERE first_name IN ("Mary", "Susan");

-- How many files has the rental_rate greater than 30
SELECT count(*) AS rental_rate_three_above FROM film
WHERE rental_rate > 3.00;

-- find all actors whose last name start with "S"
SELECT * FROM actor
WHERE last_name LIKE ("S%")

-- show all payment where amount is greater than $8.00
SELECT * FROM payment
WHERE amount > 8

-- List all films with rating of "PG-13" and length greater than 120 minutes
SELECT * FROM film
where rating = "PG-13" and length >120;

-- List all customers order by last name alphabetically
SELECT * FROM 	customer
ORDER BY last_name ASC;

-- Show all films ordered by length ascending, then by title alphabetically
SELECT * FROM film
ORDER BY length ASC, title ASC; 

-- How many films are in each rating category
SELECT rating, count(*) AS film_count FROM film
GROUP BY rating
ORDER BY film_count ASC;  

-- what is the total payment amount collected from each customer, show the first name and total amount collected
-- identifying tables: payment p and customer c
-- identifying key columns: customer_id
SELECT c.first_name , sum(amount) AS total_amount FROM customer c
JOIN payment p
    ON c.customer_id = p.customer_id
GROUP BY first_name
ORDER BY total_amount

-- How many actors are there per last name
SELECT last_name, count(*) AS number_of_actor FROM actor
GROUP BY last_name
ORDER BY number_of_actor DESC;

-- What is the average rental rate per film category, show the category name and th?
-- identifying tables: category c, film_category fc, and film f
-- identifying key columns: customer_id, film_id
SELECT c.name AS category_name, avg(rental_rate) as average_rental_rate FROM film f
JOIN film_category fc
		ON f.film_id = fc.film_id
JOIN category c
        ON fc.category_id = c.category_id
GROUP BY category_name
ORDER BY average_rental_rate DESC  

-- How many films does each language have
-- identifying tables: language l and film f
-- identifying key columns: language_id, film id
SELECT count(f.film_id) AS number_of_film FROM language l
JOIN film f 
    ON l.language_id = f.language_id
GROUP BY l.name
ORDER BY number_of_film DESC;  

-- Show all films along with their category name
-- identifying tables: film f, film_category fc and category c
-- identifying key columns: language_id, film id
SELECT f.title film_title, c.name as category_name FROM film f
JOIN film_category fc
	ON f.film_id = fc.film_id
JOIN category c
    ON fc.category_id = c.category_id
ORDER BY film_title ASC

-- Show each staff member and stock address they work at
-- identifying tables: store s, staff sf, address a
-- identifying key columns: store_id, staff_id
SELECT CONCAT(sf.first_name, " ", sf.last_name) AS full_name, a.address
FROM staff sf
JOIN store s
    ON s.store_id = sf.store_id
JOIN address a
    ON s.address_id = a.address_id
ORDER BY full_name;

-- Show all customers with their cities and country--
-- Show all customers with their cities and country
-- identifying tables: customer c, address a, city ci, country co
-- identifying key columns: address_id, city_id, country_id
SELECT CONCAT(c.first_name, " ", c.last_name) AS full_name, c.email, a.address, ci.city, co.country FROM customer c
JOIN address a
    ON c.address_id = a.address_id
JOIN city ci
    ON a.city_id = ci.city_id
JOIN country co
    ON ci.country_id = co.country_id
ORDER BY full_name;

-- Find all actors and the films they appeared in--
-- identifying tables: actor a, film_actor fa, film f
-- identifying key columns: actor_id, film_id
SELECT CONCAT(a.first_name, " ", a.last_name) AS full_name, f.title FROM actor a
JOIN film_actor fa
    ON a.actor_id = fa.actor_id
JOIN film f
    ON fa.film_id = f.film_id
ORDER BY full_name, f.title;

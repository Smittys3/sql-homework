-- 1. How mny actors are there with the last name ‘Wahlberg’?
-- Answer: 2
SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99?
-- Answer: 4764
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;


-- 3. What film does the store have the most of? (search in inventory)
-- Answer: film_id 200 count 9
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

-- 4. How many customers have the last name ‘William’?
-- Answer: 0
SELECT last_name
FROM customer
WHERE last_name = 'William';


-- 5. What store employee (get the id) sold the most rentals?
-- Answer: 1 sold 8040

SELECT staff_id, COUNT(staff_id)
FROM rental
GROUP BY staff_id
ORDER BY staff_id ASC;


-- 6. How many different district names are there?
-- Answer: 378
SELECT COUNT(DISTINCT district)
FROM address;


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- Answer: film_id 508 & 16 actors

SELECT DISTINCT(film_id), COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- Answer: 13
SELECT last_name, store_id
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1;

-- 9.How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430 ? (use group by and having > 250) 
-- Answer: 
-- 4.99	290	
-- 6.99	281	
-- 2.99	269

SELECT amount, COUNT(rental_id)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental_id) > 250
ORDER BY COUNT(rental_id) DESC;


-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
-- Answer: 5 rating categories & 223 PG-13
SELECT MAX(rating)
FROM film
GROUP BY rating;

SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY rating;
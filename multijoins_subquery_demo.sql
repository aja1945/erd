-- MULT JOINS
SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM actor;

SELECT *
FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
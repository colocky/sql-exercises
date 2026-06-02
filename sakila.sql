USE sakila;

SELECT title, rating
FROM film;

SELECT *
from sakila.category;

SELECT film_id, title, length
FROM film
ORDER BY length DESC;
USE sakila; 



-- 1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT sakila.film.film_id, sakila.film.title
FROM sakila.film
WHERE sakila.film.title = "Hunchback Impossible";


SELECT
	sakila.film.title,
    COUNT(sakila.inventory.film_id) AS "no. of copies"
FROM sakila.inventory
JOIN sakila.film
	ON sakila.inventory.film_id = sakila.film.film_id
/* WHERE
	sakila.inventory.film_id = (
    SELECT sakila.film.film_id, sakila.film.title
	FROM sakila.film
	WHERE sakila.film.title = "Hunchback Impossible")
*/
GROUP BY sakila.film.title;



-- 2. List all films whose length is longer than the average length of all the films in the Sakila database.

SELECT sakila.film.title AS "films longer than the avg movie (in inventory)", sakila.film.length
FROM sakila.film
WHERE sakila.film.length > 
	(SELECT AVG(sakila.film.length)
    FROM sakila.film)
ORDER BY sakila.film.length;
      
    
    
-- 3. Use a subquery to display all actors who appear in the film "Alone Trip".

SELECT CONCAT(sakila.actor.first_name, " ", sakila.actor.last_name) AS "Actor/Actress", sakila.film.title
FROM sakila.film
JOIN sakila.film_actor
	ON sakila.film_actor.film_ID = sakila.film.film_ID
JOIN sakila.actor
	ON sakila.actor.actor_id = sakila.film_actor.actor_id
WHERE sakila.film.title = "Alone Trip";
    



-- **Bonus**:

-- 4. Sales have been lagging among young families, and you want to target family movies for a promotion. Identify all movies categorized as family films. 
-- 5. Retrieve the name and email of customers from Canada using both subqueries and joins. To use joins, you will need to identify the relevant tables and their primary and foreign keys.
-- 6. Determine which films were starred by the most prolific actor in the Sakila database. A prolific actor is defined as the actor who has acted in the most number of films. First, you will need to find the most prolific actor and then use that actor_id to find the different films that he or she starred in.
-- 7. Find the films rented by the most profitable customer in the Sakila database. You can use the customer and payment tables to find the most profitable customer, i.e., the customer who has made the largest sum of payments.
-- 8. Retrieve the client_id and the total_amount_spent of those clients who spent more than the average of the total_amount spent by each client. You can use subqueries to accomplish this.


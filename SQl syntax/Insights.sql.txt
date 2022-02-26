/* Number of most rented film in Children category, release year between 2000 and 2020 */
Select  film.title, category.name as name_category
		,count(rental.rental_id) as no_film_rent
From film
Inner join film_category On film.film_id = film_category.film_id
Inner join category On film_category.category_id = category.category_id
Inner join inventory On film.film_id = inventory.film_id 
Inner join rental On rental.inventory_id = inventory.inventory_id
Inner join customer On customer.customer_id = rental.customer_id
Inner join language On film.language_id = language.language_id
Where category.name in ('Children', 'Animation', 'Music')
and film.release_year > 2000
and film.release_year < 2020
Group by 1, 2
Order by no_film_rent DESC;

WITH category_name AS 
	 			( 	
					SELECT name, category_id
					FROM category),
	iden_inventory AS
				( 
					SELECT film_id, inventory_id
					FROM inventory)
SELECT  film.title
		, iden_inventory.inventory_id
		, category_name.name
		, count(rental.rental_id) AS no_film_rented
FROM film
JOIN film_category ON film_category.film_id = film.film_id
JOIN category_name ON category_name.category_id = film_category.category_id
JOIN iden_inventory ON film.film_id = iden_inventory.film_id
JOIN rental ON rental.inventory_id = iden_inventory.inventory_id
Where category_name.name in ('Children', 'Animation', 'Music')
and film.release_year > 2000
and film.release_year < 2020
Group by 1, 2, 3
Order by no_film_rented DESC;
















/* Movie language in Children category */ 
Select 	language.name as language, title
From film
Inner join film_category
On film.film_id = film_category.film_id
Inner join category
On category.category_id = film_category.category_id
Inner join language 
On language.language_id = film.language_id
Where category.name = 'Children'
or category.name = 'Animation'
or category.name = ' Music'
Order by language.name  DESC;

/* VIP customer base on number of film rented in Children category */
Select customer.customer_id, customer.last_name, customer.first_name
		, count(distinct rental.rental_id) as no_film_rented
From film_category
Inner join film On film.film_id = film_category.film_id
Inner join category On film_category.category_id = category.category_id
Inner join inventory On film.film_id = inventory.film_id 
Inner join rental On rental.inventory_id = inventory.inventory_id
Inner join customer On customer.customer_id = rental.customer_id
Where category.name = 'Children'
or category.name = 'Animation'
or category.name = ' Music'
Group by customer.customer_id, customer.last_name, customer.first_name
Order by no_film_rented DESC;
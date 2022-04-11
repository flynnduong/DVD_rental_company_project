/*Popular run time among Children category*/
Select  length
		,count(film.film_id) as total_film_equal_length
From film
Inner join film_category
On film.film_id = film_category.film_id
Inner join category
On category.category_id = film_category.category_id
Where name = 'Children'
or name = 'Animation'
or name = ' Music'
Group by length
Order by count(film.film_id) DESC;

/* 3 differents groups of movie length in Children category */
Select  title
		, length
	,Case
	 When length >=46 and length <=92 then 'group_a' 
	 When length >=93 and length <=139 then 'group_b' 
	 When length >=140 and length<=185 then 'group_c' 
	End
From film_category
Inner join film
On film.film_id = film_category.film_id
Inner join category
On category.category_id = film_category.category_id
Where name = 'Children'
or name = 'Animation'
or name = ' Music'
Group by length, title
Order by length DESC;

/* Shortest movie length */
Select title, min(length)
From film_category
Inner join film
On film.film_id = film_category.film_id
Inner join category
On category.category_id = film_category.category_id
Where name = 'Children'
or name = 'Animation'
or name = ' Music'
Group by title
Order by min(length) ;

/* Longest movie length */
Select title, max(length)
From film_category
Inner join film
On film.film_id = film_category.film_id
Inner join category
On category.category_id = film_category.category_id
Where name = 'Children'
or name = 'Animation'
or name = ' Music'
Group by title
Order by max(length) DESC;
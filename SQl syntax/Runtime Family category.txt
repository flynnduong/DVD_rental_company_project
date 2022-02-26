/*Popular run time among Family category*/
Select  count(length)
		,length
From film
Inner join film_category
On film.film_id = film_category.film_id
Inner join category
On category.category_id = film_category.category_id
Where name = 'Family'
Group by length
Order by count(length) DESC;

/* Shortest length*/
Select title, min(length)
From film_category
Inner join film
On film.film_id = film_category.film_id
Inner join category
On category.category_id = film_category.category_id
Where name = 'Family'
Group by title
Order by min(length) ;

/* Longest length */
Select title, max(length)
From film_category
Inner join film
On film.film_id = film_category.film_id
Inner join category
On category.category_id = film_category.category_id
Where name = 'Family'
Group by title
Order by max(length) DESC ;

/* 3 differents groups of movie length */
Select  title
		, length
	,Case
	 When length >=48 and length <=93 then 'group_a' 
	 When length >=94 and length <=140 then 'group_b' 
	 When length >=141 and length<=184 then 'group_c' 
	End
From film_category
Inner join film
On film.film_id = film_category.film_id
Inner join category
On category.category_id = film_category.category_id
Where name = 'Family'
Group by length, title
Order by length DESC;
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
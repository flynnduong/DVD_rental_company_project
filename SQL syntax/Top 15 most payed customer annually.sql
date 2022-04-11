/* Sum amount of top 15 most payed customer*/
Select  payment.customer_id
		, round(sum(amount),2)
From payment
Inner join customer
On payment.customer_id = customer.customer_id
Group by payment.customer_id
Order by sum(amount) DESC
Limit 15;

/* Average amount of top 15 most payed customer*/
Select  payment.customer_id
		, round(avg(amount),2)
From payment
Inner join customer
On payment.customer_id = customer.customer_id
Group by payment.customer_id
Order by avg(amount) DESC
Limit 15;
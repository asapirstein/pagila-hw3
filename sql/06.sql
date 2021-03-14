/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1;
 * That is, list all actors that have appeared in a film with 'RUSSEL BACALL'.
 * Do not list 'RUSSEL BACALL', since he has a Bacall Number of 0.
 */
select first_name || ' ' || last_name as "Actor Name"
from film
inner join film_actor using(film_id) 
inner join actor using(actor_id)
where  upper(last_name) != 'BACALL' and title in (select title 
	from film
	inner join film_actor using (film_id)
	inner join actor using (actor_id) 
	where upper(first_name) =  'RUSSELL' and upper(last_name) = 'BACALL'
)
group by first_name, last_name
order by first_name || ' ' || last_name

/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSEL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */
select first_name || ' ' || last_name as "Actor Name"
from film 
inner join film_actor using(film_id)
inner join actor using(actor_id)
where title in (
	select title 
	from film
	inner join film_actor using(film_id)
	inner join actor using(actor_id)
	where (first_name,last_name) in (
		select first_name, last_name
                from film
                inner join film_actor using(film_id)
                inner join actor using(actor_id)
                where  upper(last_name) != 'BACALL' and title in (
                        select title
                        from film
                        inner join film_actor using (film_id)
                        inner join actor using (actor_id)
                        where upper(first_name) =  'RUSSELL' and upper(last_name) = 'BACALL'

		)
	)
	group by title
	)	
	and (first_name, last_name)  not in (
		select first_name,last_name 
		from film
		inner join film_actor using(film_id)
		inner join actor using(actor_id)
		where  title in (
			select title
        		from film
        		inner join film_actor using (film_id)
        		inner join actor using (actor_id)
        		where upper(first_name) =  'RUSSELL' and upper(last_name) = 'BACALL'
		)) or (first_name = 'SUSAN' and last_name = 'DAVIS')
group by "Actor Name"
order by "Actor Name"

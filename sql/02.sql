/*
 * Count the number of movies that contain each type of special feature.
 */
select word as special_features, count(*) as count
from film f,unnest(f.special_features) as word
group by word
order by word  asc

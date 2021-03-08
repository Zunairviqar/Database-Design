-- queries

-- a query that involves an inner join
-- Get all the titles having the country of production as India
select nt.title from netflix_titles nt
inner join netflix_titles_has_country_produced nthcp on nthcp.netflix_titles_showid = nt.showid
inner join country_produced cp on cp.country_id = nthcp.country_produced_country_id
where cp.name = 'India';

-- a query that involves an outer join (left, right or full)
-- Print the entire cast of a title with the entirety of the corresponding casts as well as the titles.
select nt.title, c.name from netflix_titles nt
inner join netflix_titles_has_cast nthc on nthc.netflix_titles_showid = nt.showid
left join cast c on c.cast_id = nthc.cast_cast_id
UNION
select nt.title, c.name  from netflix_titles nt
inner join netflix_titles_has_cast nthc on nthc.netflix_titles_showid = nt.showid
right join cast c on c.cast_id = nthc.cast_cast_id;

-- a query that involves an inner join and an aggregate function
-- Count the number of titles that have genre as 'Children & Family Movies' and type as 'Movie'
select count(g.name) from netflix_titles nt
inner join netflix_titles_has_genre nthg on nthg.netflix_titles_showid = nt.showid
inner join genre g on g.genre_id = nthg.genre_genre_id
inner join title_type tt on tt.type_id = nt.title_type_type_id
where tt.name = 'Movie' AND g.name = 'Children & Family Movies'
GROUP BY g.name;

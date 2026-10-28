-- 9. Names of all people who starred in a movie released in 2004, ordered by birth year
select distinct  people.id, people.name from people join stars on stars.person_id=people.id
join movies on  movies.id=stars.movie_id where year =2004 order by people.birth;

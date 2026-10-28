-- 12. Titles of all of movies in which both Jennifer Lawrence and Bradley Cooper starred
select title from movies where movies.id in (select movie_id from stars
 where person_id in (select id from people where name='Jennifer Lawrence'))
and movies.id in (select movie_id from stars
 where person_id in (select id from people where name='Bradley Cooper'));

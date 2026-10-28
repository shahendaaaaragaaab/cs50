-- 10. Names of all directors who have directed a movie that got a rating of at least 9.0
select distinct name from people join directors on people.id = directors.person_id join ratings on ratings.movie_id =directors.movie_id where rating >=9.0;

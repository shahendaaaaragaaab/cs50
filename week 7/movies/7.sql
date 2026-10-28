-- 7. All movies and ratings from 2010, in decreasing order by rating (alphabetical for those with same rating)

select ratings.rating, movies.title from movies
 join ratings on movies.id = ratings.movie_id where year=2010 order by rating desc,title asc;

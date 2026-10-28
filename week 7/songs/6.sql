-- 6. Write a SQL query that lists the names of songs that are by Post Malone.
-- Output: A table with a single column for the name of each song.
-- Note: Do not make any assumptions about what Post Malone's artist_id is.
select songs.name from songs join artists on artists.id= songs.artist_id where  artists.name = 'Post Malone' ;

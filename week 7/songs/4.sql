-- 4. Write a SQL query that lists the names of any songs that have danceability, energy, and valence greater than 0.75.
-- Output: A table with a single column for the name of each song.
select name from songs where danceability >=0.75 and energy >=0.75 and valence >= 0.75  ;

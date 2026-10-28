-- 8. Write a SQL query that lists the names of the songs that feature other artists.
-- Note: Songs that feature other artists will include "feat." in the name of the song.
-- Output: A table with a single column for the name of each song.
select name from songs WHERE name like '%feat%' ;

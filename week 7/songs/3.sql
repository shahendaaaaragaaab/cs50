-- 3. Write a SQL query to list the names of the top 5 longest songs, in descending order of length.
-- Output: A table with a single column for the name of each song.
select name from songs order by duration_ms desc limit 5;

--- 7. Write a SQL query that returns the average energy of songs that are by Drake.
-- Output: A table with a single column and a single row containing the average energy.
-- Note: Do not make any assumptions about what Drake's artist_id is.-
select avg(energy) from songs where artist_id =(select id from artists where name ='Drake');

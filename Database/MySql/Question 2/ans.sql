select city , length(city) as len from station 
order by len , city ASC  
limit 1;

select city , length(city) as len from station 
order by len DESC , city ASC  
limit 1;
select concat(NAME ,"(",substr(occupation,1,1),")")
from OCCUPATIONS
ORDER BY NAME ASC; 

select "There are a total of " , count(occupation) as occupation_count , concat(lower(occupation),"s.") 
from OCCUPATIONS 
GROUP BY occupation 
ORDER BY occupation_count ASC; 

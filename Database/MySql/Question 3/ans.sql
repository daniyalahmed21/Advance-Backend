select 
    CASE
        when A + B > C AND B + C > A AND A + C > B THEN 
            CASE
                When A = B AND B = C THEN "Equilateral"
                WHEN A = B OR A = C OR B = C THEN "Isosceles"
                ELSE "Scalene"
            
            END
        ELSE "Not A Triangle"
    END
from TRIANGLES ;
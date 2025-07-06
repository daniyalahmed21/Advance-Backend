Select Name , Grade , Marks
From Students join Grades 
on Students.Marks >= Grades.Min_Mark AND Students.Marks <= Grades.Max_Mark 
where Grades.Grade >= 8
ORDER BY Grades.Grade DESC , Students.Name ASC;

Select "NULL" , Grade , Marks
From Students join Grades 
on Students.Marks >= Grades.Min_Mark AND Students.Marks <= Grades.Max_Mark 
where Grades.Grade < 8
ORDER BY Grades.Grade DESC , Students.Name ASC;
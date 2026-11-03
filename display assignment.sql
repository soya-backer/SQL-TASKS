-- Tasks
-- 1. Display the different cities the students come from.
select* from students;
select city from students;
-- 2. Display the different departments.
select department from students;
-- 3. Display the different combinations of department and admission_year.
select distinct department,admission_year from students;
-- 4. Display all students from Kochi.
select student_id,city from students where city='kochi';
-- 5. Display first_name, last_name and percentage of students who scored above 80.
select  first_name, last_name , percentage from students where percentage>80;
-- 6. Display all students who are not in the Commerce department.
select*from students;
select student_id,department from students where department <>'commerce';
-- 7. Display all students admitted in 2023 or later.
select student_id,admission_year from students where admission_year>=2023;
-- 8. Display all female students in Computer Science.
select student_id,gender,department from students where gender='F'and department='computer science';
-- 9. Display all students in Electronics or Mechanical.
select* from students;
select student_id,department from students where department= 'Electronics' or 'Mechanical';
-- 10. Display all students from Kochi, Thrissur or Kozhikode.
select student_id,city from students where city='Thrissur' or 'Kozhikode';
-- 11. Display all students who are not from Chennai, Bengaluru or Trivandrum.
select student_id,city from students where city not in ('chennai','bengaluru','trivandrum');
-- 12. Display first_name, department and percentage of students who scored 70 or more and 85 or less.
select first_name,department,percentage from students where  percentage>=70 and percentage<=80;
-- 13. Display first_name, department and percentage  of students born on or after 1 January 2004 and on or before 30 June 2004.
select first_name, department , percentage from students where date_of_birth>= 2004-01-01 or  date_of_birth<=2004-06-30;
-- 14. Display first_name, department and percentage of Computer Science or Electronics students who scored above 85.
select* from students;
select first_name, department,percentage from students where department= 'Computer Science' or 'Electronics'and percentage>=85;
-- 15. Display all courses that have 4 credits.
select* from courses;
select course_name,credits from courses where credits=4;
-- 16. Display all enrollments of course 101 where the marks are 80 or more.
select * from enrollments;
select enrollment_id,course_id,marks from enrollments where course_id=101 and marks>=80;
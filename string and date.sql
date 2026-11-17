use college_db;
-- 1. Display the first names of all students in capital letters.
select first_name ,upper(first_name)as 'first name' from students ;
-- 2. Display the last names of all students in small letters.
select last_name,lower(last_name)as 'last name' from students;
-- 3. Display the full name of every student (first name, a space, then last name) with the heading Full Name.
select concat(first_name,' ',last_name)as together from students;
-- 4. Display each student’s first name along with the number of letters in it.
select first_name, length(first_name)as 'first name' from students;
-- 5. Display the first three letters of each student’s first name.
select first_name,substring(first_name,1,3)from students;
-- 6. Display each student’s initials, made of the first letter of the first name followed by the first letter of the last name, with the heading Initials.
select concat(substring(first_name,1,1),' ',substring(last_name,1,1))as initials from students;
-- 7. Display the first names of students whose first name has more than 6 letters.
select first_name, length(first_name)from students where length(first_name) >6;
-- 8. Display a student code for every student, made of the first four letters of the department in
-- capital letters followed by the student ID (for example COMP1), with the heading Student Code.
select*from students;
select concat(upper(left(department,4)),student_id) as 'student_code' from students;

-- 9. Take the text Route Academy with 3 extra spaces typed before it and 3 extra spaces typed
-- after it. Display the text after removing the extra spaces, and also display its length before
-- and after removing the spaces.
select concat('   ','route academy','   ');
select length(concat('   ','route academy','   '));
select trim(concat('   ','route academy','   '));
-- 10. Display each student’s first name along with the year of birth.
select concat(month(date_of_birth,'%Y'),first_name,' ')as 'date of birth'from students;
-- 11. Display each student’s first name along with the month of birth as a number.
select first_name,month(date_of_birth)as 'date of month'from students;
-- 12. Display the first name and date of birth of students born in March.
select first_name,month(date_of_birth) from students where month( date_of_birth)='3';

-- 13. Display each student’s date of birth in the form 12-03-2004 (day, month, year).
select first_name,date_format(date_of_birth,'%d-%m-%y')from students;

-- 14. Display each student’s date of birth in the form 12 March 2004.
select first_name ,date_format(date_of_birth,'%d-%M-%y')from students;
-- 15. Display each student’s first name along with the number of days from the date of birth to 1 January 2026.
select first_name,date_of_birth,datediff('2026-01-01',date_of_birth)from students;

-- 16. Display the number of students born in each year.
select year(date_of_birth)as 'year',count(student_id)as 'group'from students group by year(date_of_birth) order by year(date_of_birth)asc;
-- 17. For students born in 2004, display the departments that have at least 5 such students, along
-- with the number of students.
select department,count(*)from students where year(date_of_birth) group by department having count(*)>=5;
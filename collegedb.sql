use college_db;
select* from students;
select* from enrollments;
select* from semester_results;
select* from courses;
-- 1. Display each student's first name and percentage, showing 0 where the percentage is not yet available.
select first_name,percentage , ifnull(percentage,0)as percent from students;
-- 2. Display each enrollment ID and marks, showing the text "Result awaited" where the marks have not been entered.
select enrollment_id,marks, coalesce(marks,'result awaited') as result from enrollments;
 -- 3. Display the average percentage of all students, and then the average percentage if students without a percentage are counted as 0. Use the headings Average and Average With Zeros.
 SELECT  AVG(percentage) AS Average,AVG(IFNULL(percentage, 0)) AS `Average with Zeros` FROM students;
-- 4. Display each student's first name and the first phone number available from the mobile, home phone and guardian's phone, in that order, showing "No phone" if there is none.
SELECT first_name, COALESCE(mobile, home_phone, guardian_phone, 'No phone') AS phone FROM students;
-- 5. Display each student's first name and course ID, showing the text "Not enrolled" for students who are not enrolled in any course.

-- 6. Display the first names of students who have no phone number at all.
SELECT first_name FROM students WHERE mobile IS NULL AND home_phone IS NULL AND guardian_phone IS NULL;
-- 7. For students who have a percentage, display the first name and a band: "Top" for 85 or more, "Mid" for 70 or more, and "Low" for the rest.
SELECT
first_name,
CASE
WHEN percentage >= 85 THEN 'Top'
WHEN percentage >= 70 THEN 'Mid'
ELSE 'Low'
END AS band FROM students;

-- 8. Display the number of students in each grade: "Distinction" for 75 or more, "First Class" for 60 or more, "Second Class" for the rest, and "Result awaited" for students without a percentage.
SELECT percentage,
CASE
WHEN percentage >= 75 THEN 'Distinction'
 WHEN percentage >= 60 THEN 'First Class'
WHEN percentage IS NULL THEN 'Result awaited'
ELSE 'Second Class'
END AS grade FROM students;

-- 9. Display each enrollment ID and marks with a result: "Excellent" for 90 or more, "Good" for 75 or more, "Average" for the rest, and "Awaited" where the marks are missing.
SELECT enrollment_id,marks,
CASE
WHEN marks IS NULL THEN 'Awaited'
WHEN marks >= 90 THEN 'Excellent'
WHEN marks >= 75 THEN 'Good'
ELSE 'Average' 
END AS result FROM enrollments;
-- 10. Display each student's first name and state: "Kerala" for Kochi, Thrissur, Kozhikode and Trivandrum, "Tamil Nadu" for Chennai, and "Karnataka" for Bengaluru.
SELECT first_name,
CASE
WHEN city IN ('Kochi', 'Thrissur', 'Kozhikode', 'Trivandrum') THEN 'Kerala'
WHEN city = 'Chennai' THEN 'Tamil Nadu'
WHEN city = 'Bengaluru' THEN 'Karnataka'
ELSE 'Other'
END AS state FROM students;
-- 11. Display each student's first name and a grade: "Distinction" for 75 or more, "First Class" for 60 or more, "Second Class" for the rest, and "Result awaited" for students without a percentage.
SELECT first_name,
CASE
WHEN percentage IS NULL THEN 'Result awaited'
WHEN percentage >= 75 THEN 'Distinction'
WHEN percentage >= 60 THEN 'First Class'
ELSE 'Second Class'
END AS grade FROM students;
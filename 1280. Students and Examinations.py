# Write your MySQL query statement below
select Students.student_id ,Students.student_name, subjects.subject_name, count(examinations.subject_name) as attended_exams
from Students join subjects
left join examinations  on examinations.student_id = students.student_id
and examinations.subject_name =subjects.subject_name
GROUP BY 
    Students.student_id, 
    Subjects.subject_name
order by 
    Students.student_id,
    Subjects.subject_name;
select d.dept_name as dept_name , count(s.student_id) as student_number
from department as d
left join student as s
on d.dept_id = s.dept_id 
group by d.dept_name
order by student_number DESC, dept_name
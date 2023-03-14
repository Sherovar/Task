SELECT employees.full_name, job_name, salary
FROM employees
         JOIN jobs j on employees.id = j.employee_id
         JOIN salary s on employees.id = s.employee_id
WHERE employees.full_name LIKE '%Давид';



SELECT department, AVG(salary) AS average_salary
FROM employees
         JOIN salary s on employees.id = s.employee_id
         JOIN departments d on employees.id = d.employee_id
GROUP BY department;



SELECT DISTINCT job_name,
                AVG(salary),
                CASE
                    WHEN AVG(salary) < ALL (SELECT AVG(salary)
                                            FROM salary) THEN 'НЕТ'
                    ELSE 'ДА'
                    END more_than_average
FROM employees
         JOIN jobs j on employees.id = j.employee_id
         JOIN salary s on employees.id = s.employee_id
GROUP BY job_name;

CREATE VIEW task AS
SELECT job_name,
       ARRAY(SELECT Distinct department
             FROM employees
                      JOIN departments d on employees.id = d.employee_id
                      JOIN jobs j2 on employees.id = j2.employee_id
             WHERE j2.job_name LIKE j1.job_name) departments,
       jsonb_agg(json_build_object(department, ARRAY(
               SELECT full_name
               FROM employees
                        JOIN departments d on employees.id = d.employee_id
                        JOIN jobs j2 on employees.id = j2.employee_id
               WHERE j2.job_name LIKE j1.job_name
                 AND d.department LIKE d2.department
           ))),
       AVG(salary)                               average_salary
FROM employees
         JOIN departments d2 on employees.id = d2.employee_id
         JOIN jobs j1 on employees.id = j1.employee_id
         JOIN salary s on employees.id = s.employee_id
         JOIN hire_date hd on employees.hire_date_id = hd.id
WHERE hire_date > '2021-01-01'
GROUP BY job_name;



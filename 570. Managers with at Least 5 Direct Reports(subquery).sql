SELECT name
FROM Employee e
WHERE (
    SELECT COUNT(*)
    FROM Employee e2
    WHERE e2.managerId = e.id
) >= 5;

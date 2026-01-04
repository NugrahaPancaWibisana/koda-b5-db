-- GET SEAT SOLD/AVAILABLE
SELECT
    s.id,
    s.row,
    s.column,
    s.status
FROM
    seats s
    JOIN schedules sc ON s.schedule_id = sc.id
    JOIN cinemas c ON sc.cinema_id = c.id
WHERE
    sc.id = 1
    AND c.id = 1
ORDER BY
    s.row,
    s.column;
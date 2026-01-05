-- GET SCHEDULES
SELECT
    s.id,
    s.date,
    t.time,
    l.city,
    c.name AS cinema_name
FROM
    schedules s
    JOIN time t ON s.time_id = t.id
    JOIN cinemas c ON s.cinema_id = c.id
    JOIN locations l ON c.id = l.cinema_id
WHERE
    s.movie_id = 1
    AND s.cinema_id = 1
    AND s.date >= CURRENT_DATE
ORDER BY
    s.date ASC,
    t.time ASC;
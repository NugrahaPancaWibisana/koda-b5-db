-- GET SCHEDULES
SELECT
    s.date_time,
    c.name,
    cd.location
FROM
    schedules s
    JOIN cinemas c ON s.cinema_id = c.id
    JOIN cinema_details cd ON c.cinema_id = cd.id;
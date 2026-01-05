-- GET HISTORY
SELECT
    o.id AS order_id,
    o.booking_code,
    o.total_price,
    o.created_at,
    m.title,
    sch.date,
    t.time,
    c.name AS cinema_name,
    l.city,
    COUNT(os.seat_id) AS ticket_count,
    STRING_AGG (
        CONCAT(sr.row, s.column),
        ', '
        ORDER BY
            sr.row, s.column
    ) AS seats
FROM
    orders o
    JOIN schedules sch ON sch.id = o.schedule_id
    JOIN time t ON sch.time_id = t.id
    JOIN movies m ON sch.movie_id = m.id
    JOIN cinemas c ON c.id = sch.cinema_id
    JOIN locations l ON l.cinema_id = c.id
    JOIN order_seats os ON os.order_id = o.id
    JOIN seats s ON s.id = os.seat_id
    JOIN seat_rows sr ON s.seat_row_id = sr.id
WHERE 
    o.user_id = 1
GROUP BY 
    o.id,
    m.title,
    m.poster_path,
    sch.date,
    t.time,
    c.name,
    l.city
ORDER BY 
    o.created_at DESC;
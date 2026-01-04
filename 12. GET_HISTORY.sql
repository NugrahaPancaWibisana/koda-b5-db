-- GET HISTORY
SELECT
  m.title,
  sch.date_time,
  c.name,
  o.booking_code,
  (EXTRACT(hour FROM sch.date_time) || ':' || EXTRACT(minute FROM sch.date_time)) AS time,
  STRING_AGG (
        CONCAT(s.row, s.column),
        ', '
        ORDER BY
            s.row
    ) AS seats,
  CONCAT(EXTRACT(day FROM sch.date_time), ' ', TO_CHAR(TO_TIMESTAMP(EXTRACT(month FROM sch.date_time)::text, 'MM'), 'Month')) AS date,
  COUNT(s.id) AS count,
  o.total_price
FROM
    users u
    JOIN orders o ON o.user_id = u.id
    JOIN schedules sch ON sch.id = o.schedule_id
    JOIN movies m ON sch.movie_id = m.id
    JOIN cinemas c ON c.id = sch.cinema_id
    JOIN order_seats os ON os.order_id = o.id 
    JOIN seats s ON s.id = os.seat
  WHERE u.id = 1
  GROUP BY m.id, sch.date_time, c.name, o.booking_code, o.total_price;

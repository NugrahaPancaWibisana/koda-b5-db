-- GET POPULAR MOVIES
SELECT
    m.id,
    m.title,
    m.poster_path,
    m.release_date,
    STRING_AGG (
        DISTINCT g.name,
        ', '
        ORDER BY
            g.name
    ) AS genres
FROM
    movies m
    LEFT JOIN schedules s ON m.id = s.movie_id
    LEFT JOIN orders o ON s.id = o.schedule_id
    LEFT JOIN order_seats os ON o.id = os.order_id
    LEFT JOIN movie_genres mg ON m.id = mg.movie_id
    LEFT JOIN genres g ON mg.genres_id = g.id
WHERE
    m.release_date <= CURRENT_DATE
GROUP BY
    m.id,
    m.title,
    m.poster_path,
    m.release_date
ORDER BY
    COUNT(os.seat_id) DESC
LIMIT
    20;
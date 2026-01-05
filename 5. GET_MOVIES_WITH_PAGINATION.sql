-- GET MOVIES WITH PAGINATION
SELECT
    m.id,
    m.title,
    m.poster_path,
    m.release_date,
    STRING_AGG (
        g.name,
        ', '
        ORDER BY
            g.name
    ) AS genres
FROM
    movies m
    JOIN movie_genres mg ON m.id = mg.movie_id
    JOIN genres g ON mg.genres_id = g.id
WHERE
    m.release_date <= CURRENT_DATE
GROUP BY
    m.id
LIMIT
    20
OFFSET
    0;
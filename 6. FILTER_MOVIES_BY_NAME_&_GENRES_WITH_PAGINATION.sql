-- FILTER MOVIES BY NAME AND GENRES WITH PAGINATION
SELECT
    m.id,
    m.title,
    m.poster_path,
    m.release_date,
    m.vote_average,
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
    release_date <= CURRENT_DATE
    AND m.title LIKE 'title%'
    AND g.name IN ('Action', 'Adventure', 'Sci-Fi')
GROUP BY
    m.id
LIMIT
    20
OFFSET
    0;
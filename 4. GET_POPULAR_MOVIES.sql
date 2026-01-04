-- GET POPULAR MOVIES
SELECT
    m.id,
    m.title,
    m.poster_path,
    m.release_date,
    m.vote_average,
    m.popularity,
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
ORDER BY
    m.popularity DESC
LIMIT
    20;
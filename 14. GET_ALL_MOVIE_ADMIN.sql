-- GET ALL MOVIE (ADMIN)
SELECT
    m.id,
    m.poster_path,
    m.title,
    STRING_AGG (
        g.name,
        ', '
        ORDER BY
            g.name
    ) AS genres,
    m.release_date,
    md.runtime
FROM
    movies m
    JOIN movie_details md ON md.movie_id = m.id
    JOIN movie_genres mg ON m.id = mg.movie_id
    JOIN genres g ON mg.genres_id = g.id
GROUP BY
    m.id,
    md.runtime;
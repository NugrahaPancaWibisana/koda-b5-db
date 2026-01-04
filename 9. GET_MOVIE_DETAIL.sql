-- GET MOVIE DETAIL
SELECT
    m.id,
    m.title,
    m.backdrop_path,
    m.poster_path,
    m.release_date,
    d.name,
    m.overview,
    STRING_AGG (
        g.name,
        ', '
        ORDER BY
            g.name
    ) AS genres,
    STRING_AGG (
        a.original_name,
        ', '
        ORDER BY
            a.original_name
    ) AS casts
FROM
    movies m
    JOIN movie_details md ON md.movie_id = m.id
    JOIN directors d ON m.director_id = d.id
    JOIN movie_actors ma ON ma.movie_id = m.id
    JOIN actors a ON ma.actor_id = a.id
    JOIN movie_genres mg ON m.id = mg.movie_id
    JOIN genres g ON mg.genres_id = g.id
GROUP BY
    m.id,
    d.name;
-- GET MOVIE DETAIL
SELECT
    m.id,
    m.title,
    md.backdrop_path,
    m.poster_path,
    m.release_date,
    md.overview,
    md.runtime,
    d.name AS director,
    STRING_AGG (
        DISTINCT g.name,
        ', '
        ORDER BY
            g.name
    ) AS genres,
    STRING_AGG (
        DISTINCT a.original_name,
        ', '
        ORDER BY
            a.original_name
    ) AS casts
FROM
    movies m
    JOIN movie_details md ON md.movie_id = m.id
    JOIN directors d ON md.director_id = d.id 
    LEFT JOIN movie_actors ma ON ma.movie_id = m.id 
    LEFT JOIN actors a ON ma.actor_id = a.id
    LEFT JOIN movie_genres mg ON m.id = mg.movie_id
    LEFT JOIN genres g ON mg.genres_id = g.id
WHERE
    m.id = 1
GROUP BY
    m.id,
    m.title,
    md.backdrop_path,
    m.poster_path,
    m.release_date,
    md.overview,
    md.runtime,
    d.name;
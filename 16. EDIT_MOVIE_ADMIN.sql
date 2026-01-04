-- EDIT MOVIE (ADMIN)
UPDATE movies
SET
    poster_path = './image.png',
    title = 'movie title',
    release_date = '2001-01-01',
    director_id = 1,
    overview = 'text'
    updated_at = NOW()
WHERE id = 1;

DELETE FROM movie_genres
WHERE movie_id = 1;

INSERT INTO movie_genres (movie_id, genres_id)
VALUES
  (1, 1),
  (1, 3),
  (1, 5);

DELETE FROM movie_actors
WHERE movie_id = 1;

INSERT INTO movie_actors (movie_id, actor_id, character)
VALUES
  (1, 2, 'char name'),
  (1, 4, 'char name');
-- REGISTER
WITH
    inserted_user AS (
        INSERT INTO
            users (email, password)
        VALUES
            ('email@email.com', 'password') RETURNING id
    )
INSERT INTO
    user_details (user_id)
SELECT
    id
FROM
    inserted_user;
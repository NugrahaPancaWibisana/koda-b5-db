-- LOGIN
SELECT
    u.id,
    u.email,
    u.password,
    ud.first_name,
    ud.last_name,
    ud.phone_number
FROM
    users u
    JOIN user_details ud ON u.id = ud.user_id
WHERE
    u.email = 'email@email.com';
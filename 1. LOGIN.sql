-- LOGIN
SELECT
    u.id,
    u.email,
    u.password,
    u.role,
    ud.image,
    ud.first_name,
    ud.last_name,
    ud.phone_number,
    ud.points
FROM
    users u
    JOIN user_details ud ON u.id = ud.user_id
WHERE
    u.email = 'email@email.com';
-- GET PROFILE
SELECT
    u.id,
    u.email,
    u.role,
    u.last_login,
    ud.image,
    ud.first_name,
    ud.last_name,
    ud.phone_number,
    ud.points,
    u.created_at,
    u.updated_at
FROM
    users u
    JOIN user_details ud ON ud.user_id = u.id
WHERE
    u.id = 1;
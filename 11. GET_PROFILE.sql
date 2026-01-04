-- GET PROFILE
SELECT
    u.id,
    u.email,
    ud.first_name,
    ud.last_name,
    ud.phone_number
FROM
    users u
    JOIN user_details ud ON ud.user_id = u.id
WHERE
    u.id = 1;
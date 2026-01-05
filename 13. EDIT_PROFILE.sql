-- EDIT PROFILE
UPDATE user_details
SET
    first_name = 'Nugraha Panca',
    last_name = 'Wibisana',
    phone_number = '08123456789',
    updated_at = NOW()
WHERE
    user_id = 1;
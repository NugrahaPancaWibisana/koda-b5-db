-- CREATE ORDER
WITH new_order AS (
  INSERT INTO orders (
    schedule_id,
    user_id,
    booking_code,
    total_price,
    payment_method_id
  )
  VALUES (
    10,
    1,
    'BK-20260105-001',
    150000,
    1
  )
  RETURNING id
)
INSERT INTO order_seats (order_id, seat_id)
SELECT 
  new_order.id,
  seat_id
FROM 
  new_order,
  (VALUES (12), (13), (14)) AS seats(seat_id);


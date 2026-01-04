INSERT INTO orders (
  schedule_id,
  user_id,
  booking_code,
  total_price
)
VALUES (
  10,
  1,
  'BK-20260105-001',
  150
);

INSERT INTO order_seats (order_id, seat)
VALUES
  (5, 12),
  (5, 13),
  (5, 14);


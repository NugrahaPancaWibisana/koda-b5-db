-- GET SEAT SOLD/AVAILABLE
SELECT
    s.id,
    sr.row,
    s.column,
    st.name AS seat_type,
    s.price,
    COUNT(os.seat_id) > 0 AS is_sold
FROM
    seats s
    JOIN seat_rows sr ON s.seat_row_id = sr.id
    JOIN seat_types st ON s.seat_type_id = st.id
    LEFT JOIN order_seats os ON s.id = os.seat_id
    LEFT JOIN orders o ON os.order_id = o.id AND o.schedule_id = 1
GROUP BY
    s.id, sr.row, s.column, st.name, s.price
ORDER BY
    sr.row,
    s.column;
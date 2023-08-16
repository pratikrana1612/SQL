

SELECT COUNT(DISTINCT booking_date)
FROM bookings;

SELECT MAX(num_seats),
    MIN(num_seats)
FROM tables

SELECT MAX(amount_billed),
    MIN(amount_billed)
FROM bookings

SELECT MIN(category)
FROM tables

SELECT MIN(booking_date),
    MAX(booking_date)
FROM bookings

SELECT SUM(amount_billed),
    ROUND(AVG(num_guests), 0)
FROM bookings

SELECT ROUND(AVG(amount_tipped), 2)
FROM bookings
WHERE amount_billed > 20
    AND num_guests > 2
    
    SELECT MAX(num_guests),
    MAX(num_seats)
FROM bookings AS b
    RIGHT JOIN tables AS t ON b.table_id = t.id
    INNER JOIN payment_methods p ON p.id = b.payment_id
WHERE p.name = 'CASH'
    AND t.num_seats < 5
    
    SELECT booking_date,
    SUM(num_guests)
FROM bookings
GROUP BY booking_date

SELECT p.name,
    b.booking_date,
    COUNT(b.id),
    SUM(amount_tipped)
FROM bookings AS b
    INNER JOIN payment_methods AS p ON b.payment_id = p.id
GROUP BY p.name,
    booking_date
    
SELECT booking_date,
    COUNT(booking_date)
FROM bookings
WHERE amount_billed > 40
GROUP BY booking_date



SELECT booking_date,
    COUNT(booking_date)
FROM bookings
GROUP BY booking_date
HAVING SUM(amount_billed > 25);

UPDATE bookings SET amount_billed=21.20 WHERE id=1;

SELECT MIN(total_bills) FROM
(SELECT booking_date,SUM(amount_billed) AS total_bills FROM bookings
GROUP BY booking_date) AS tb

SELECT booking_date,amount_tipped,SUM(amount_tipped) OVER(PARTITION BY booking_date)
FROM bookings

SELECT booking_date,amount_tipped,
RANK() 
OVER(PARTITION BY booking_date ORDER BY amount_tipped DESC)FROM bookings
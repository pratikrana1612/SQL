INSERT INTO customers(
    first_name,
    last_name,
    email
)
VALUES(
    'Maria',
    'Jones',
    'maria@test.com'
);
SAVEPOINT save_1;

INSERT INTO orders(
   amount_billed,
   customer_id 
)
VALUES(
    103.12,
    23
);

delete from customers where id=22

START TRANSACTION
ROLLBACK TO save_1
ROLLBACK 
COMMIT
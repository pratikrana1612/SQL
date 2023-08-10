CREATE TABLE products(
    product_name VARCHAR(200) NOT NULL,
    price DECIMAL(5, 2) NOT NULL CHECK(price >= 0),
    description TEXT,
    amount_in_stock INT CHECK(amount_in_stock > 0),
    image VARCHAR(300)
);
INSERT INTO products (
        product_name,
        price,
        description,
        amount_in_stock,
        image
    )
VALUES (
        'Tv',
        199.99,
        'This is an tv product description.',
        10,
        'example_image.jpg'
    ),
    (
        'Computer',
        999.99,
        'This is an computer product description.',
        1,
        'example_image.jpg'
    );


-- MYSQL
-- ALTER TABLE products
-- MODIFY product_name VARCHAR(200) NOT NULL,
-- MODIFY price DECIMAL(5, 2) NOT NULL CHECK(price >= 0),
-- MODIFY amount_in_stock INT CHECK(amount_in_stock > 0);

-- POSTGRESQL
-- ALTER TABLE products
-- ALTER COLUMN product_name SET NOT NULL,
-- ALTER COLUMN price SET NOT NULL;

-- ALTER TABLE products
-- ADD CONSTRAINT check_positive CHECK (price>=0),
-- ADD CONSTRAINT check_amount_positive CHECK (amount_in_stock>0);

INSERT INTO products (
    product_name,
    price,
    description,
    amount_in_stock,
    image
  )
VALUES (
    'mobile',
    0,
    'this id des',
    1,
    'image'
  );

-- ALTER TABLE products
-- ADD COLUMN id INT PRIMARY KEY AUTO_INCREMENT;

ALTER TABLE products
ADD COLUMN id SERIAL,
ADD PRIMARY KEY (id);

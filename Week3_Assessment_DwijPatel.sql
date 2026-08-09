
-- WEEK 3 SQL ASSESSMENT
-- Student: Dwij Patel
-- Database: flipcart

-- C1
SELECT *
FROM products;

-- C2
SELECT product_name, price
FROM products
WHERE category = 'Books';

-- C3
SELECT *
FROM products
WHERE price > 10000
ORDER BY price DESC;

-- C4
SELECT product_name, price
FROM products
WHERE category = 'Electronics'
ORDER BY price DESC
LIMIT 5;

-- C5
SELECT *
FROM products
WHERE category IN ('Electronics', 'Apparel');

-- C6
SELECT *
FROM products
WHERE price BETWEEN 500 AND 2000;

-- C7
SELECT *
FROM products
WHERE product_name LIKE '%Watch%';

-- C8
SELECT *
FROM products
WHERE brand LIKE 'S%';

-- C9
SELECT DISTINCT category
FROM products;

-- C10
SELECT COUNT(*) AS total_products
FROM products;

-- C11
SELECT AVG(price) AS average_price
FROM products
WHERE category = 'Books';

-- C12
SELECT MAX(price) AS maximum_price,
       MIN(price) AS minimum_price
FROM products;

-- C13
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category;

-- C14
SELECT category, SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category;

-- C15
SELECT category, AVG(price) AS average_price
FROM products
GROUP BY category
ORDER BY average_price DESC;

-- C16
SELECT brand,
       COUNT(*) AS product_count,
       AVG(price) AS average_price
FROM products
GROUP BY brand
HAVING COUNT(*) > 1;

-- C17
SELECT category, COUNT(*) AS active_product_count
FROM products
WHERE is_active = TRUE
GROUP BY category
HAVING COUNT(*) > 4;

-- C18
SELECT *
FROM products
ORDER BY price DESC
LIMIT 3;

-- C19
SELECT category, AVG(price) AS average_price
FROM products
GROUP BY category
HAVING AVG(price) > 2000;

-- C20
SELECT *
FROM products
WHERE avg_rating IS NULL;

-- C21
SELECT product_name,
       COALESCE(avg_rating, 'New Launch') AS rating
FROM products;

-- C22
SELECT product_name,
       price,
       CASE
           WHEN price < 1000 THEN 'Budget'
           WHEN price < 10000 THEN 'Mid'
           ELSE 'Premium'
       END AS price_tier
FROM products;

-- C23
SELECT category,
       COUNT(*) AS total_products,
       SUM(
           CASE
               WHEN price >= 10000 THEN 1
               ELSE 0
           END
       ) AS premium_products
FROM products
GROUP BY category;

-- C24
SELECT category,
       COUNT(*) AS total_products,
       SUM(
           CASE
               WHEN is_active = TRUE THEN 1
               ELSE 0
           END
       ) AS active_products,
       AVG(price) AS average_price,
       CASE
           WHEN AVG(price) < 1000 THEN 'Budget'
           WHEN AVG(price) < 10000 THEN 'Mid'
           ELSE 'Premium'
       END AS category_tier
FROM products
GROUP BY category
HAVING COUNT(*) >= 3
ORDER BY average_price DESC;

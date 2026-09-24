-- Step 1: schema setup for the retail sales dashboard
USE RetailDashboard
CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name NVARCHAR(50),
    city NVARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name NVARCHAR(50),
    category NVARCHAR(50),
    unit_price DECIMAL(10, 2)
);

CREATE TABLE transactions (
    transaction_id INT IDENTITY(1,1) PRIMARY KEY,
    transaction_time DATETIME2,
    store_id INT FOREIGN KEY REFERENCES stores(store_id),
    product_id INT FOREIGN KEY REFERENCES products(product_id),
    quantity INT,
    unit_price DECIMAL(10, 2),
    revenue DECIMAL(10, 2)
);

-- I index transaction_time because every KPI query groups or filters by it
CREATE INDEX idx_tx_time ON transactions(transaction_time);

-- Seed data: stores (small table, so I insert it directly rather than importing a file)
INSERT INTO stores (store_id, store_name, city) VALUES
(1, 'Newmarket', 'Auckland'),
(2, 'Sylvia Park', 'Auckland'),
(3, 'Botany', 'Auckland'),
(4, 'Albany', 'Auckland'),
(5, 'Riccarton', 'Christchurch');

-- Seed data: products
INSERT INTO products (product_id, product_name, category, unit_price) VALUES
(1, 'Electric Shaver', 'Grooming', 149.00),
(2, 'Beard Trimmer', 'Grooming', 79.00),
(3, 'Hair Clipper', 'Grooming', 99.00),
(4, 'Hair Dryer', 'Hair Care', 129.00),
(5, 'Straightener', 'Hair Care', 159.00),
(6, 'Electric Toothbrush', 'Oral Care', 119.00),
(7, 'Replacement Blades', 'Accessories', 29.00),
(8, 'Shaving Foam', 'Accessories', 9.50),
(9, 'Travel Case', 'Accessories', 24.00),
(10, 'Gift Set', 'Gifts', 89.00);

-- Quick check: this should return 5 stores and 10 products
SELECT COUNT(*) AS store_count FROM stores;
SELECT COUNT(*) AS product_count FROM products;

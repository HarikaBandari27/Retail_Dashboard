INSERT INTO transactions (transaction_time, store_id, product_id, quantity, unit_price, revenue)
SELECT transaction_time, store_id, product_id, quantity, unit_price, revenue
FROM transactions_staging;

SELECT COUNT(*) FROM transactions;
DROP TABLE transactions_staging;
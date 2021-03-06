SELECT
  customer_id, customer_first_name, category_id, category_name, COUNT(order_items) AS number_purchased
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN order_items ON orders.id = order_items.order_id
WHERE customer_id = ?
GROUP BY customer_id

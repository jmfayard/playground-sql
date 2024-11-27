-- Ranking of publishers with number of books
SELECT p.name, count(p.id) AS count, b.isbn, b.title
FROM publishers p
INNER JOIN main.books b on p.id = b.publisher_id
GROUP BY p.id
ORDER BY count DESC
;

-- Ranking of clients
select count(client_id) as count,
       c.last_name as name
FROM orders
INNER JOIN main.order_books ob on orders.id = ob.order_id
INNER JOIN main.clients c on orders.client_id = c.id
GROUP BY   client_id
;


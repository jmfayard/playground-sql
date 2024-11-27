-- all boks from french authors
SELECT b.isbn,
       b.title,
       last_name AS author,
       p.name
FROM books b
INNER JOIN main.book_authors ba on b.isbn = ba.book_isbn
INNER JOIN main.authors a on a.id = ba.author_id
INNER JOIN main.publishers p on p.id = b.publisher_id
WHERE a.country = 'UK';

-- income and client name from all non cancelled orders
SELECT o.id,
       (ob.quantity * b.price) as total_price,
       b.isbn,
       b.title
FROM orders o
INNER JOIN main.order_books ob on o.id = ob.order_id
INNER JOIN main.clients c on c.id = o.client_id
INNER JOIN main.books b on ob.isbn = b.isbn;


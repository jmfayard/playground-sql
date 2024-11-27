-- books that have never been ordered
select b.isbn, b.title
FROM books b
WHERE b.isbn NOT IN (SELECT isbn
                     from order_books);


-- Authors with no books
select *
FROM authors a
WHERE a.id NOT IN (select author_id from book_authors);


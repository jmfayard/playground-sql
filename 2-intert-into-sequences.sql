-- Génération de la série avec une CTE récursive
WITH RECURSIVE generate_series(i) AS (
    SELECT 1
    UNION ALL
    SELECT i + 1
    FROM generate_series
    WHERE i < 500
)
-- Insérer des éditeurs
INSERT INTO publishers (id, name, country, established_year)
SELECT i,
       'Publisher ' || i,
       CASE WHEN i % 3 = 0 THEN 'USA'
            WHEN i % 3 = 1 THEN 'UK'
            ELSE 'France' END,
       1900 + (i % 120)
FROM generate_series WHERE i <= 50;

-- Insérer des auteurs
WITH RECURSIVE generate_series(i) AS (
    SELECT 1
    UNION ALL
    SELECT i + 1
    FROM generate_series
    WHERE i < 100
)
INSERT INTO authors (id, first_name, last_name, birth_year, country)
SELECT i, 'AuthorFirst' || i, 'AuthorLast' || i, 1920 + (i % 100),
       CASE WHEN i % 4 = 0 THEN 'USA'
            WHEN i % 4 = 1 THEN 'UK'
            WHEN i % 4 = 2 THEN 'France'
            ELSE 'Germany' END
FROM generate_series;

-- Insérer des livres
WITH RECURSIVE generate_series(i) AS (
    SELECT 1
    UNION ALL
    SELECT i + 1
    FROM generate_series
    WHERE i < 500
)
INSERT OR IGNORE INTO books (isbn, title, publication_year, stock, price, publisher_id)
SELECT
    '978-00-00-' || (i % 200),
       'Book Title ' || i,
       1900 + (i % 123),
       5 + (i % 50),
       5.99 + (i % 20) * 0.5,
       1 + (i % 50)
FROM generate_series;

-- Insérer des clients
WITH RECURSIVE generate_series(i) AS (
    SELECT 1
    UNION ALL
    SELECT i + 1
    FROM generate_series
    WHERE i < 200
)
INSERT INTO clients (id, first_name, last_name, email, phone, address)
SELECT i,
       'ClientFirst' || i, 'ClientLast' || i,
       'client' || i || '@example.com',
       '+33' || i || '1234567',
       'Address ' || i
FROM generate_series;

-- Insérer des commandes
WITH RECURSIVE generate_series(i) AS (
    SELECT 1
    UNION ALL
    SELECT i + 1
    FROM generate_series
    WHERE i < 300
)
INSERT INTO orders (id, client_id, order_date, status)
SELECT i,
       1 + (i % 200),
       '2024-11-' || (1 + (i % 30)),
       CASE WHEN i % 3 = 0 THEN 'Pending'
            WHEN i % 3 = 1 THEN 'Shipped'
            ELSE 'Cancelled' END
FROM generate_series;

-- Insérer les relations commande-livre
WITH RECURSIVE generate_series(i) AS (
    SELECT 1
    UNION ALL
    SELECT i + 1
    FROM generate_series
    WHERE i < 900
)
INSERT OR IGNORE INTO order_books (order_id, isbn, quantity)
SELECT 1 + (i % 300),
       '978-00-00-' || (i % 200),
       1 + (i % 5)
FROM generate_series;

-- Insérer les relations livre-auteur
WITH RECURSIVE generate_series(i) AS (
    SELECT 1
    UNION ALL
    SELECT i + 1
    FROM generate_series
    WHERE i < 500
)
INSERT INTO book_authors (book_isbn, author_id)
SELECT '978-0-' || i || '-00-' || (i % 1000),
       1 + (i % 100)
FROM generate_series;

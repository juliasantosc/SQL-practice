--SQL Exercises: OPERATIONS
-- Usando conjunto de dados IMDB-sample da calculadora RelaX

-- 1. Projetar o primeiro nome e o último nome dos atores que são diretores
SELECT first_name, last_name
FROM actors
INTERSECT
SELECT first_name, last_name
FROM directors

-- 2. Projetar o primeiro nome e o último nome dos atores que não são diretores
SELECT first_name, last_name
FROM actors
EXCEPT
SELECT first_name, last_name
FROM directors

-- 3. Projetar o primeiro nome e o último nome dos atores e diretores
SELECT first_name, last_name
FROM actors
UNION
SELECT first_name, last_name
FROM directors

-- 4. Projetar o nome dos filmes que não são dirigidos por nenhum diretor
SELECT m.name
FROM movies AS m
JOIN (
    SELECT id
    FROM movies
    EXCEPT 
    SELCET movie_id
    FROM movies_directors
) AS x ON m.id = x.id

-- 5. Projetar primeiro nome e o último nome dos atores que não atuaram em pelo menos dois filmes
SELECT a.first_name, a.last_name
FROM actors AS a 
JOIN(
    SELECT id
    FROM actors
    EXCEPT
    SELECT actor_id
    FROM (
        SELECT actor_id, COUNT(movie_id) AS number
        FROM roles
        GROUP BY actor_id
        HAVING number >= 2
    ) 
) AS x ON a.id = x.id

-- 6. Projetar, por gênero e ano, o número médio de filmes com menos de dois atores atuando
SELECT mg.genre, m.year, COUNT(*) as number
FROM movies_genres as mg 
JOIN (
    SELECT id
    FROM movies
    EXCEPT
    SELECT a.movie_id
    FROM (
        SELECT movie_id, COUNT(*) as total
        FROM roles
        GROUP BY movie_id
        HAVING total >= 2
    ) as a
) as x ON mg.movie_id = x.id
JOIN movies as m ON (m.id = x.id)
GROUP BY mg.genre, m.year


--SQL Exercises: JOIN
-- Usando conjunto de dados IMDB-sample da calculadora RelaX

-- 1.Projetar o nome do filme e o nome do diretor de cada filme
SELECT m.name, d.name
FROM movies_directors AS md 
JOIN directors AS d ON md.director_id = d.id 
JOIN movies AS m ON md.movie_id = m.id

-- 2. Projetar o nome do filme, nome do ator e o papel que cada ator teve no filme para filmes com ranking acima da nota 6
SELECT m.name, a.name, r.role
FROM roles AS r
JOIN actors AS a ON r.actor_id = a.id
JOIN movies AS m ON r.movie_id = m.id
WHERE m.rank > 6

-- 3. Projetar o nome do diretor e o número de filmes que cada diretor dirigiu
SELECT d.name, COUNT(mv.movie_id) AS number
FROM directors AS d 
JOIN movies_directors AS mv ON d.id = mv.director_id
GROUP BY d.name

-- 4. Projetar o gênero e o número de filmes de cada gênero
SELECT genre, COUNT(movie_id) AS number
FROM movies_genres
GROUP BY genre

-- 5. Projetar o gênero, o ranking (nota) médio, mínimo e máximo dos filmes do gênero
SELECT mg.genre, AVG(m.rank) AS average, MIN(m.rank) AS minimum, MAX(m.rank) AS maximum
FROM movies_genres AS mg
JOIN movies AS m ON m.id = mg.movie_id
GROUP BY mg.genre
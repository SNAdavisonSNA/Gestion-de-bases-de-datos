CREATE DATABASE videojuegos_db;
USE videojuegos_db;

-- Tabla de juegos
CREATE TABLE games (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    released DATE,
    rating DECIMAL(3,2),
    ratings_count INT,
    added INT,
    reviews_count INT,
    game_mode VARCHAR(50),
    status_yet INT,
    status_owned INT,
    status_beaten INT,
    status_toplay INT,
    status_dropped INT,
    status_playing INT,
    rating_rango VARCHAR(50)
);

-- Tabla de géneros (con AUTO_INCREMENT desde 1)
CREATE TABLE genres (
    id INT PRIMARY KEY AUTO_INCREMENT,
    genre VARCHAR(100) NOT NULL UNIQUE
) AUTO_INCREMENT = 1;

-- Tabla de plataformas (con AUTO_INCREMENT desde 1)
CREATE TABLE platforms (
    id INT PRIMARY KEY AUTO_INCREMENT,
    platform VARCHAR(100) NOT NULL UNIQUE
) AUTO_INCREMENT = 1;

-- Tabla de relación juego-género
CREATE TABLE game_genres (
    game_id INT,
    genre_id INT,
    PRIMARY KEY (game_id, genre_id),
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE
);

-- Tabla de relación juego-plataforma
CREATE TABLE game_platforms (
    game_id INT,
    platform_id INT,
    PRIMARY KEY (game_id, platform_id),
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    FOREIGN KEY (platform_id) REFERENCES platforms(id) ON DELETE CASCADE
);

-- Contar cuántos juegos hay por cada plataforma 
SELECT p.platform, COUNT(gp.game_id) as cantidad
FROM platforms p, game_platforms gp
WHERE p.id = gp.platform_id
GROUP BY p.platform;

-- Cantidad de juegos por cada Género
SELECT 
    gr.genre, 
    COUNT(gg.game_id) AS total_juegos
FROM genres gr
LEFT JOIN game_genres gg ON gr.id = gg.genre_id
GROUP BY gr.genre
ORDER BY total_juegos DESC;

-- Cuantos juegos tienen los usuarios pendiente en cada género.
SELECT gr.genre, SUM(g.status_toplay) AS total_por_jugar
FROM games g, game_genres gg, genres gr
WHERE g.id = gg.game_id 
  AND gg.genre_id = gr.id
GROUP BY gr.genre
ORDER BY total_por_jugar DESC;

-- Ranking de los mejores juegos por cada género
SELECT 
    gr.genre AS Categoria,
    ANY_VALUE(g.name) AS Game_Name, 
    MAX(g.rating) AS Mejor_Rating
FROM games g
JOIN game_genres gg ON g.id = gg.game_id
JOIN genres gr ON gg.genre_id = gr.id
GROUP BY gr.id, gr.genre
ORDER BY Mejor_Rating DESC;

-- Consulta para identificar la plataforma con mayor volumen de títulos
SELECT 
    p.platform AS Plataforma, 
    COUNT(gp.game_id) AS Total_Juegos
FROM platforms p
JOIN game_platforms gp ON p.id = gp.platform_id
GROUP BY p.id, p.platform
ORDER BY Total_Juegos DESC
LIMIT 2;


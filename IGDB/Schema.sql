-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS videojuegos_db;
USE videojuegos_db;

-- Tabla principal de juegos
CREATE TABLE IF NOT EXISTS games (
    id INT PRIMARY KEY,
    name VARCHAR(500) NOT NULL,
    created_at INT,
    rating DECIMAL(10,6),
    rating_count INT,
    summary TEXT,
    total_rating DECIMAL(10,6),
    total_rating_count INT,
    game_type TEXT
    );

-- Tabla de modos de juego
CREATE TABLE IF NOT EXISTS game_modes (
    id INT PRIMARY KEY,
    name VARCHAR(200) NOT NULL
);

-- Tabla de géneros
CREATE TABLE IF NOT EXISTS genres (
    id INT PRIMARY KEY,
    name VARCHAR(200) NOT NULL
);

-- Tabla de temas
CREATE TABLE IF NOT EXISTS themes (
    id INT PRIMARY KEY,
    name VARCHAR(200) NOT NULL
);

-- Tabla de plataformas
CREATE TABLE IF NOT EXISTS platforms (
    id INT PRIMARY KEY,
    name VARCHAR(500) NOT NULL,
    abbreviation VARCHAR(50),
    generation INT,
    summary TEXT
);

-- Tablas de relaciones (muchos a muchos)

-- Relación juegos - modos de juego
CREATE TABLE IF NOT EXISTS game_game_modes (
    game_id INT,
    game_mode_id INT,
    PRIMARY KEY (game_id, game_mode_id),
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    FOREIGN KEY (game_mode_id) REFERENCES game_modes(id) ON DELETE CASCADE
);

-- Relación juegos - géneros
CREATE TABLE IF NOT EXISTS game_genres (
    game_id INT,
    genre_id INT,
    PRIMARY KEY (game_id, genre_id),
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE
);

-- Relación juegos - temas
CREATE TABLE IF NOT EXISTS game_themes (
    game_id INT,
    theme_id INT,
    PRIMARY KEY (game_id, theme_id),
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    FOREIGN KEY (theme_id) REFERENCES themes(id) ON DELETE CASCADE
);

-- Relación juegos - plataformas
CREATE TABLE IF NOT EXISTS game_platforms (
    game_id INT,
    platform_id INT,
    PRIMARY KEY (game_id, platform_id),
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    FOREIGN KEY (platform_id) REFERENCES platforms(id) ON DELETE CASCADE
);

-- Mostrar tablas creadas
SHOW TABLES;
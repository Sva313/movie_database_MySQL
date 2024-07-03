-- Create the database
CREATE DATABASE movie_database;
USE movie_database;

-- Create the Movies table
CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year YEAR NOT NULL,
    genre_id INT,
    director_id INT,
    rating DECIMAL(3,1),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id),
    FOREIGN KEY (director_id) REFERENCES directors(director_id)
);

-- Create the Actors table
CREATE TABLE actors (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birthdate DATE,
    nationality VARCHAR(100)
);

-- Create the Directors table
CREATE TABLE directors (
    director_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birthdate DATE,
    nationality VARCHAR(100)
);

-- Create the Genres table
CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

-- Create the Movie_Actors table (Many-to-Many Relationship)
CREATE TABLE movie_actors (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);

-- Insert sample data into the Genres table
INSERT INTO genres (genre_name) VALUES 
('Action'), 
('Comedy'), 
('Drama'), 
('Horror'), 
('Sci-Fi');

-- Insert sample data into the Directors table
INSERT INTO directors (name, birthdate, nationality) VALUES 
('Steven Spielberg', '1946-12-18', 'American'),
('Christopher Nolan', '1970-07-30', 'British-American');

-- Insert sample data into the Movies table
INSERT INTO movies (title, release_year, genre_id, director_id, rating) VALUES 
('Jurassic Park', 1993, 1, 1, 8.1),
('Inception', 2010, 5, 2, 8.8);

-- Insert sample data into the Actors table
INSERT INTO actors (name, birthdate, nationality) VALUES 
('Leonardo DiCaprio', '1974-11-11', 'American'),
('Sam Neill', '1947-09-14', 'New Zealander');

-- Insert sample data into the Movie_Actors table
INSERT INTO movie_actors (movie_id, actor_id) VALUES 
(1, 2),  -- Sam Neill in Jurassic Park
(2, 1);  -- Leonardo DiCaprio in Inception

-- Query to retrieve information from the database
SELECT 
    m.title,
    m.release_year,
    g.genre_name,
    d.name AS director_name,
    m.rating
FROM 
    movies m
JOIN 
    genres g ON m.genre_id = g.genre_id
JOIN 
    directors d ON m.director_id = d.director_id;

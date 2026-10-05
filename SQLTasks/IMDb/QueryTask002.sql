CREATE DATABASE IMDb
USE IMDb

CREATE TABLE Directors
(
    DirectorId       INT PRIMARY KEY IDENTITY,
    DirectorFullName NVARCHAR(50) NOT NULL,
    Country          NVARCHAR(50)
)

CREATE TABLE Movies
(
    MovieId        INT PRIMARY KEY IDENTITY,
    Title          NVARCHAR(50) NOT NULL,
    Raiting        DECIMAL(3, 1),
    ReleaseYear    INT,
    RuntimeMinutes INT,
    DirectorId     INT,
    CONSTRAINT FK_Movies_Directors FOREIGN KEY (DirectorId) REFERENCES Directors (DirectorId)
)

CREATE TABLE Genres
(
    GenreId   INT PRIMARY KEY IDENTITY,
    GenreName NVARCHAR(50) NOT NULL
)

CREATE TABLE Actors
(
    ActorId       INT PRIMARY KEY IDENTITY,
    ActorFullName NVARCHAR(50) NOT NULL,
    BirthYear     INT
)


CREATE TABLE MoviesGenres
(
    Id      INT PRIMARY KEY IDENTITY,
    MovieId INT FOREIGN KEY REFERENCES Movies (MovieId),
    GenreId INT FOREIGN KEY REFERENCES Genres (GenreId)
)


CREATE TABLE MoviesActors
(
    Id      INT PRIMARY KEY IDENTITY,
    MovieId INT FOREIGN KEY REFERENCES Movies (MovieId),
    ActorId INT FOREIGN KEY REFERENCES Actors (ActorId)
)


INSERT INTO Movies (Title, Raiting, ReleaseYear, RuntimeMinutes)
VALUES ('Inception', 8.8, 2010, 148),
       ('The Dark Knight', 9.0, 2008, 152),
       ('Interstellar', 8.6, 2014, 169),
       ('Pulp Fiction', 8.9, 1994, 154),
       ('The Shawshank Redemption', 9.3, 1994, 142)

INSERT INTO Directors (DirectorFullName, Country)
VALUES ('Christopher Nolan', 'UK'),
       ('Quentin Tarantino', 'USA'),
       ('Frank Darabont', 'USA')

INSERT INTO Genres (GenreName)
VALUES ('Action'),
       ('Drama'),
       ('Sci-Fi'),
       ('Crime')

INSERT INTO Actors (ActorFullName, BirthYear)
VALUES ('Leonardo DiCaprio', 1974),
       ('Christian Bale', 1974),
       ('Matthew McConaughey', 1969),
       ('John Travolta', 1954),
       ('Morgan Freeman', 1937)


INSERT INTO MoviesGenres (MovieId, GenreId)
VALUES (1, 1),
       (1, 3),
       (2, 1),
       (2, 4),
       (3, 2),
       (3, 3),
       (4, 2),
       (4, 4),
       (5, 2)

INSERT MoviesActors(MovieId, ActorId)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5)

UPDATE Movies
SET DirectorId = 1
WHERE Title IN ('Inception', 'The Dark Knight', 'Interstellar');
UPDATE Movies
SET DirectorId = 2
WHERE Title = 'Pulp Fiction';
UPDATE Movies
SET DirectorId = 3
WHERE Title = 'The Shawshank Redemption';

--Query 1
SELECT m.Title, m.Raiting, g.GenreName, d.DirectorFullName, a.ActorFullName
FROM Movies m
         JOIN MoviesGenres mg ON m.MovieId = mg.MovieId
         JOIN Genres g ON mg.GenreId = g.GenreId
         JOIN Directors d ON m.DirectorId = d.DirectorId
         JOIN MoviesActors ma ON m.MovieId = ma.MovieId
         JOIN Actors a ON ma.ActorId = a.ActorId
WHERE m.Raiting > 6.0

--Query 2
SELECT m.Title, m.Raiting, g.GenreName
FROM Movies m
         JOIN MoviesGenres mg ON m.MovieId = mg.MovieId
         JOIN Genres g ON mg.GenreId = g.GenreId
WHERE g.GenreName LIKE '%a%'

--Query 3
SELECT m.Title, m.Raiting, m.RuntimeMinutes, g.GenreName
FROM Movies m
         JOIN MoviesGenres mg ON m.MovieId = mg.MovieId
         JOIN Genres g ON mg.GenreId = g.GenreId
WHERE LEN(m.Title) > 10
  AND m.Title LIKE '%t'

--Query 4
SELECT m.Title, m.Raiting, g.GenreName, d.DirectorFullName, a.ActorFullName
FROM Movies m
         JOIN MoviesGenres mg ON m.MovieId = mg.MovieId
         JOIN Genres g ON mg.GenreId = g.GenreId
         JOIN Directors d ON d.DirectorId = m.DirectorId
         JOIN MoviesActors ma ON ma.MovieId = m.MovieId
         JOIN Actors a ON a.ActorId = ma.ActorId
WHERE m.Raiting > (SELECT AVG(m.Raiting) FROM Movies m)
ORDER BY m.Raiting DESC


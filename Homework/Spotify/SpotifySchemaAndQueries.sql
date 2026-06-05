CREATE DATABASE Spotify
USE Spotify

CREATE TABLE Artists
(
    ArtistId       INT PRIMARY KEY IDENTITY,
    ArtistFullName NVARCHAR(100) NOT NULL,
    BirthYear      NVARCHAR(50)
)

CREATE TABLE Albums
(
    AlbumId     INT PRIMARY KEY IDENTITY,
    Title       NVARCHAR(100) NOT NULL,
    ReleaseYear INT,
    ArtistId    INT,
    CONSTRAINT FK_Albums_Artists FOREIGN KEY (ArtistId) REFERENCES Artists (ArtistId)
)

CREATE TABLE Musics
(
    MusicId         INT PRIMARY KEY IDENTITY,
    Title           NVARCHAR(100) NOT NULL,
    Popularity      INT,
    DurationSeconds INT,
    AlbumId         INT,
    ArtistId        INT,
    CONSTRAINT FK_Songs_Albums FOREIGN KEY (AlbumId) REFERENCES Albums (AlbumId),
    CONSTRAINT FK_Songs_Artists FOREIGN KEY (ArtistId) REFERENCES Artists (ArtistId)
)

INSERT INTO Artists (ArtistFullName, BirthYear)
VALUES ('Taylor Swift', '1989'),
       ('Ed Sheeran', '1991'),
       ('Adele', '1988'),
       ('Drake', '1986'),
       ('Beyoncé', '1981')

INSERT INTO Albums (Title, ReleaseYear, ArtistId)
VALUES ('1989', 2014, 1),
       ('Divide', 2017, 2),
       ('25', 2015, 3),
       ('Scorpion', 2018, 4),
       ('Lemonade', 2016, 5)

INSERT INTO Musics (Title, Popularity, DurationSeconds, AlbumId, ArtistId)
VALUES ('Blank Space', 95, 231, 1, 1),
       ('Shape of You', 98, 233, 2, 2),
       ('Hello', 97, 295, 3, 3),
       ('Gods Plan', 96, 198, 4, 4),
       ('Formation', 94, 220, 5, 5),
       ('Bad Blood', 93, 211, 1, 1),
       ('Perfect', 92, 263, 2, 2),
       ('Someone Like You', 91, 285, 3, 3),
       ('In My Feelings', 90, 217, 4, 4),
       ('Sorry', 89, 200, 5, 5)


--Query 1:
SELECT m.Title,al.Title,ar.ArtistFullName,m.DurationSeconds FROM Musics m
JOIN Albums al ON al.AlbumId = m.AlbumId
JOIN Artists ar ON ar.ArtistId = m.ArtistId

--Query 2:
SELECT 
    al.Title AS AlbumName,
    (
        SELECT COUNT(*)
        FROM Musics m
        WHERE m.AlbumId = al.AlbumId
    ) AS SongCount
FROM Albums al;

--Task 1
CREATE VIEW GetMusicNameWithAlbumNameArtistNameDurationTime
AS
SELECT m.Title MusicTitle,al.Title AlbumTitle,ar.ArtistFullName,m.DurationSeconds FROM Musics m
JOIN Albums al ON al.AlbumId = m.AlbumId
JOIN Artists ar ON ar.ArtistId = m.ArtistId

SELECT * FROM GetMusicNameWithAlbumNameArtistNameDurationTime

--Task2
CREATE VIEW GetAlbumsWithSongCount
AS 
SELECT al.Title AlbumName, COUNT(m.Title)SongCount FROM Albums al
JOIN Musics m On al.AlbumId = m.AlbumId
GROUP BY al.Title

SELECT * FROM GetAlbumsWithSongCount

--Task 3
CREATE PROCEDURE GetSongsByAlbumAndListenerCount @listenerCount INT, @searchText NVARCHAR(20)
AS
BEGIN
SELECT m.Title MusicName ,al.Title AlbumName ,m.Popularity ListenerCount FROM Musics m
JOIN Albums al On al.AlbumId = m.AlbumId
WHERE m.Popularity > @listenerCount	AND al.Title LIKE '%' + @searchTexT + '%'
END

EXEC GetSongsByAlbumAndListenerCount 12,2
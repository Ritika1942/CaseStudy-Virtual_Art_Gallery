create database artgallery

-- Artist Table
CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(255) NOT NULL,
    Biography TEXT,
    BirthDate DATE,
    Nationality VARCHAR(100),
    Website VARCHAR(255),
    ContactInfo VARCHAR(255)
)

--Artwork Table
CREATE TABLE Artwork (
    ArtworkID INT PRIMARY KEY IDENTITY,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    CreationDate DATE,
    Medium VARCHAR(100),
    ImageURL VARCHAR(255),
    ArtistID INT,
    CONSTRAINT FK_Artwork_Artist FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
)

--user table
CREATE TABLE [User] (
    UserID INT PRIMARY KEY IDENTITY,
    Username VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DateOfBirth DATE,
    ProfilePicture VARCHAR(255)
)
--gallery table
CREATE TABLE Gallery (
    GalleryID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Location VARCHAR(255),
    CuratorID INT,
    OpeningHours VARCHAR(100),
    CONSTRAINT FK_Gallery_Curator FOREIGN KEY (CuratorID) REFERENCES Artist(ArtistID)
)

-- User_Favorite_Artwork Table (Junction table for User and Artwork)
CREATE TABLE User_Favorite_Artwork (
    UserID INT,
    ArtworkID INT,
    CONSTRAINT PK_User_Favorite_Artwork PRIMARY KEY (UserID, ArtworkID),
    CONSTRAINT FK_User_Favorite_Artwork_User FOREIGN KEY (UserID) REFERENCES [User](UserID),
    CONSTRAINT FK_User_Favorite_Artwork_Artwork FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID)
)
--artwork gallery
CREATE TABLE Artwork_Gallery (
    ArtworkID INT,
    GalleryID INT,
    CONSTRAINT PK_Artwork_Gallery PRIMARY KEY (ArtworkID, GalleryID),
    CONSTRAINT FK_Artwork_Gallery_Artwork FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID),
    CONSTRAINT FK_Artwork_Gallery_Gallery FOREIGN KEY (GalleryID) REFERENCES Gallery(GalleryID)
)

--tables created according to case study requirements
--review tbl
CREATE TABLE Reviews (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL FOREIGN KEY REFERENCES [User](UserID),
    ArtworkID INT NOT NULL FOREIGN KEY REFERENCES Artwork(ArtworkID),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comments NVARCHAR(1000),
    ReviewDate DATETIME DEFAULT GETDATE()
)

-- Visits Table
CREATE TABLE Visits (
    VisitID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL FOREIGN KEY REFERENCES [User](UserID),
    GalleryID INT NOT NULL FOREIGN KEY REFERENCES Gallery(GalleryID),
    VisitDate DATETIME DEFAULT GETDATE()
)

ALTER TABLE Artist ADD TotalArtworks INT DEFAULT 0

ALTER TABLE Gallery
ADD VisitorCount INT DEFAULT 0,GalleryType NVARCHAR(50) NULL

ALTER TABLE [User]
ADD Role NVARCHAR(50) DEFAULT 'User',LastLoginDate DATETIME NULL

ALTER TABLE User_Favorite_Artwork
ADD DateAdded DATETIME DEFAULT GETDATE(),Notes NVARCHAR(255) NULL
ALTER TABLE Artwork_Gallery
ADD DisplayStartDate DATETIME DEFAULT GETDATE(),DisplayEndDate DATETIME NULL, Position NVARCHAR(50) NULL

INSERT INTO Artist (Name, Biography, BirthDate, Nationality, ContactInfo)
VALUES
('Leonardo da Vinci', 'Renaissance polymath known for Mona Lisa and The Last Supper.', '1452-04-15', 'Italian', 'leonardo.davinci@gmail.com'),
('Vincent van Gogh', 'Post-Impressionist painter known for Starry Night.', '1853-03-30', 'Dutch', 'vincent.vangogh@gmail.com'),
('Pablo Picasso', 'Co-founder of Cubism and creator of Guernica.', '1881-10-25', 'Spanish', 'pablo.picasso@gmail.com'),
('Claude Monet', 'Founder of French Impressionist painting.', '1840-11-14', 'French', 'claude.monet@gmail.com'),
('Andy Warhol', 'Leading figure in the Pop Art movement.', '1928-08-06', 'American', 'andy.warhol@gmail.com'),
('Georgia O Keeffe', 'Known for modernist paintings of flowers and landscapes.', '1887-11-15', 'American', 'georgia.okeeffe@gmail.com'),
('Frida Kahlo', 'Mexican painter known for self-portraits.', '1907-07-06', 'Mexican', 'frida.kahl@gmail.com'),
('Salvador Dalí', 'Surrealist artist known for The Persistence of Memory.', '1904-05-11', 'Spanish', 'salvador.dali@gmail.com'),
('Henri Matisse', 'Known for his use of color and fluid draughtsmanship.', '1869-12-31', 'French', 'henri.matisse@gmail.com'),
('Rembrandt van Rijn', 'Dutch painter known for The Night Watch.', '1606-07-15', 'Dutch', 'rembrandt.vanrijn@gmail.com')

INSERT INTO Artwork (Title, Description, CreationDate, Medium, ImageURL, ArtistID)
VALUES 
('Starry Night', 'A depiction of a night sky filled with swirling clouds, stars, and a crescent moon.', '1889-06-01', 'Oil on Canvas', 'http://example.com/starrynight.jpg', 2),
('Mona Lisa', 'Portrait of a woman with a mysterious smile.', '1503-10-01', 'Oil on Panel', 'http://example.com/monalisa.jpg', 1),
('The Persistence of Memory', 'Surreal landscape with melting clocks.', '1931-04-01', 'Oil on Canvas', 'http://example.com/persistence.jpg', 8),
('Sunflowers', 'Vibrant still life of yellow sunflowers in a vase.', '1888-08-01', 'Oil on Canvas', 'http://example.com/sunflowers.jpg', 2),
('The Last Supper', 'Depiction of Jesus and his disciples at the Last Supper.', '1498-01-01', 'Tempera on Gesso', 'http://example.com/lastsupper.jpg', 1),
('Guernica', 'Political statement on the bombing of Guernica during the Spanish Civil War.', '1937-06-01', 'Oil on Canvas', 'http://example.com/guernica.jpg', 3),
('The Scream', 'Expressionist depiction of a figure against a tumultuous sky.', '1893-01-01', 'Oil, Tempera, and Pastel on Cardboard', 'http://example.com/scream.jpg', 4),
('The Birth of Venus', 'Depiction of Venus emerging from the sea on a shell.', '1486-01-01', 'Tempera on Canvas', 'http://example.com/birthofvenus.jpg', 1),
('Girl with a Pearl Earring', 'Portrait of a young girl wearing a pearl earring.', '1665-01-01', 'Oil on Canvas', 'http://example.com/girlpearl.jpg', 9),
('Campbell\s Soup Cans', 'Pop art series of 32 canvases depicting soup cans.', '1962-01-01', 'Synthetic Polymer Paint', 'http://example.com/campbells.jpg', 6)

INSERT INTO [User] (Username, Password, Email, FirstName, LastName, DateOfBirth, ProfilePicture)
VALUES 
('art_enthusiast', 'paintbrush123', 'artlover@example.com', 'Leonard', 'Brush', '1995-05-10', 'http://example.com/leonard.jpg'),
('van_gogh_fan', 'starrynight', 'vangoghfan@example.com', 'Vincent', 'Star', '1993-03-25', 'http://example.com/vincent.jpg'),
('modern_art', 'colorsplash', 'modernart@example.com', 'Andy', 'Canvas', '1989-11-08', 'http://example.com/andy.jpg'),
('renaissance_girl', 'davinci2024', 'renaissance@example.com', 'Lisa', 'Vinci', '1996-07-19', 'http://example.com/lisa.jpg'),
('surreal_dreamer', 'meltingtime', 'surreal@example.com', 'Dali', 'Vision', '1992-02-12', 'http://example.com/dali.jpg'),
('nature_artist', 'flowerpower', 'natureart@example.com', 'Georgia', 'Petal', '1998-10-22', 'http://example.com/georgia.jpg'),
('classic_creator', 'timelessart', 'classicart@example.com', 'Claude', 'Impress', '1990-06-14', 'http://example.com/claude.jpg'),
('cubism_king', 'abstract123', 'cubism@example.com', 'Pablo', 'Shapes', '1987-08-05', 'http://example.com/pablo.jpg'),
('portrait_master', 'pearl123', 'portrait@example.com', 'Johannes', 'Earring', '1985-01-23', 'http://example.com/johannes.jpg'),
('pop_art_pro', 'popculture', 'popart@example.com', 'Marilyn', 'Warhol', '1994-03-03', 'http://example.com/marilyn.jpg')

INSERT INTO Gallery (Name, Description, Location, CuratorID, OpeningHours)
VALUES
('Art of the Renaissance', 'Masterpieces from the Renaissance era.', 'Florence', 1, '8:00 AM - 5:00 PM'),
('Modern Marvels', 'Showcasing contemporary artwork.', 'London', 2, '10:00 AM - 6:00 PM'),
('Impressionist Inspirations', 'Featuring works by Impressionist masters.', 'Paris', 3, '9:00 AM - 4:00 PM'),
('Surrealist Dreams', 'Exploring the surreal and the bizarre.', 'Barcelona', 4, '10:30 AM - 6:30 PM'),
('Abstract Horizons', 'A gallery of bold abstract art.', 'Berlin', 5, '9:30 AM - 5:30 PM'),
('Portraits Through Time', 'The evolution of portrait art.', 'Amsterdam', 6, '8:30 AM - 4:30 PM'),
('Nature’s Palette', 'Landscapes and nature-inspired pieces.', 'Zurich', 7, '9:00 AM - 6:00 PM'),
('Cubism Chronicles', 'Diving into the world of Cubism.', 'Prague', 8, '10:00 AM - 7:00 PM'),
('Pop Culture Icons', 'Celebrating icons of popular culture.', 'Los Angeles', 9, '11:00 AM - 7:00 PM'),
('Timeless Treasures', 'Artworks that have stood the test of time.', 'Vienna', 10, '8:30 AM - 5:30 PM')

INSERT INTO User_Favorite_Artwork (UserID, ArtworkID, DateAdded, Notes)
VALUES 
(2, 2, '2024-11-10', 'Donald Duck is hilarious!'),
(3, 5, '2024-11-11', 'Jerry’s antics are timeless.'),
(4, 9, '2024-11-12', 'Daffy Duck is my favorite.'),
(5, 10, '2024-11-13', 'Shrek’s story is inspiring.'),
(6, 4, '2024-11-14', 'Tom’s determination is unmatched.'),
(7, 6, '2024-11-15', 'Bugs Bunny’s wit is unbeatable.'),
(8, 1, '2024-11-16', 'Mickey Mouse reminds me of my childhood.'),
(9, 3, '2024-11-17', 'SpongeBob never fails to make me laugh.'),
(10, 7, '2024-11-18', 'Pikachu’s charm is unbeatable.'),
(1, 8, '2024-11-19', 'Scooby-Doo’s adventures are unforgettable.')

INSERT INTO Artwork_Gallery (ArtworkID, GalleryID, DisplayStartDate, DisplayEndDate, Position)
VALUES 
(2, 2, '2024-11-15', '2024-12-15', 'Main Hall'),
(5, 5, '2024-11-20', '2024-12-20', 'East Wing'),
(9, 6, '2024-11-25', '2024-12-25', 'Showcase Shelf')



INSERT INTO Reviews (UserID, ArtworkID, Rating, Comments)
VALUES 
(2, 2, 4, 'Donald Duck always makes me laugh!'),
(3, 5, 5, 'Jerry is an all-time favorite.'),
(4, 9, 3, 'Daffy Duck is funny but underrated.'),
(5, 10, 5, 'Shrek’s story never gets old.')
INSERT INTO Visits (UserID, GalleryID, VisitDate)
VALUES 
(2, 2, '2024-11-10'),
(3, 5, '2024-11-11'),
(4, 6, '2024-11-12'),
(5, 3, '2024-11-13'),
(1, 4, '2024-11-14')

UPDATE Artist
SET Website = CASE WHEN Name = 'Leonardo da Vinci' THEN 'https://www.leonardodavinci.net'
WHEN Name = 'Vincent van Gogh' THEN 'https://www.vincentvangogh.org'
WHEN Name = 'Pablo Picasso' THEN 'https://www.picasso.org'
WHEN Name = 'Claude Monet' THEN 'https://www.claudemonetgallery.org'
WHEN Name = 'Andy Warhol' THEN 'https://www.warhol.org'
WHEN Name = 'Georgia O Keeffe' THEN 'https://www.okeeffemuseum.org'
WHEN Name = 'Frida Kahlo' THEN 'https://www.fridakahlo.org'
WHEN Name = 'Salvador Dalí' THEN 'https://www.dali.org'
WHEN Name = 'Henri Matisse' THEN 'https://www.henri-matisse.net'
WHEN Name = 'Rembrandt van Rijn' THEN 'https://www.rembrandtpainting.net' ELSE NULL END



INSERT INTO Artwork (Title, Description, CreationDate, Medium, ImageURL, ArtistID) VALUES
('Mona Lisa', 'Renaissance portrait of a woman with a mysterious smile.', '1503-01-01', 'Oil on canvas', 'http://example.com/monalisa.jpg', 1),
('The Last Supper', 'Famous depiction of the final meal of Jesus Christ with his disciples.', '1495-01-01', 'Tempera on gesso', 'http://example.com/lastsupper.jpg', 1),
('Starry Night', 'A swirling depiction of the night sky over a small town.', '1889-06-01', 'Oil on canvas', 'http://example.com/starrynight.jpg', 2),
('Sunflowers', 'A vibrant still life featuring sunflowers in a vase.', '1888-08-01', 'Oil on canvas', 'http://example.com/sunflowers.jpg', 2),
('Guernica', 'A powerful anti-war mural depicting the horrors of the Spanish Civil War.', '1937-04-26', 'Oil on canvas', 'http://example.com/guernica.jpg', 3),
('The Weeping Woman', 'An emotional depiction of a woman crying, symbolic of the pain of war.', '1937-07-01', 'Oil on canvas', 'http://example.com/weepingwoman.jpg', 3),
('Water Lilies', 'A serene depiction of water lilies floating on a pond.', '1906-01-01', 'Oil on canvas', 'http://example.com/waterlilies.jpg', 4),
('Impression, Sunrise', 'The artwork that gave Impressionism its name, showing a hazy sunrise.', '1872-01-01', 'Oil on canvas', 'http://example.com/impression.jpg', 4)

UPDATE Artist
SET TotalArtworks = (SELECT COUNT(*)
FROM Artwork
WHERE Artwork.ArtistID = Artist.ArtistID
)

ALTER TABLE Artwork
DROP CONSTRAINT FK_Artwork_Artist

ALTER TABLE Artwork
ADD CONSTRAINT FK_Artwork_Artist
FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
ON DELETE CASCADE

UPDATE Gallery
SET GalleryType = CASE
WHEN Name = 'Disney Classics' THEN 'Classic Animation'
WHEN Name = 'Looney Tunes Forever' THEN 'Comedy Animation'
WHEN Name = 'Pokémon Center' THEN 'Anime'
WHEN Name = 'Mystery Inc.' THEN 'Adventure Animation'
WHEN Name = 'DreamWorks Legends' THEN 'Modern Animation'
WHEN Name = 'Cartoon Network Classics' THEN 'Retro Animation'
WHEN Name = 'Anime Universe' THEN 'Japanese Anime'
WHEN Name = 'Pixar Paradise' THEN '3D Animation'
WHEN Name = 'Retro Cartoons' THEN 'Nostalgia'
WHEN Name = 'Animal Characters' THEN 'Animal-Themed Art'
ELSE 'Special Exhibits' END

UPDATE [User]
SET LastLoginDate = CASE
WHEN UserID = 1 THEN '2024-9-05 10:15:00'
WHEN UserID = 2 THEN '2024-10-07 14:30:00'
WHEN UserID = 3 THEN '2024-12-08 08:45:00'
WHEN UserID = 4 THEN '2024-12-09 12:20:00'
WHEN UserID = 5 THEN '2024-11-10 09:50:00'
WHEN UserID = 6 THEN '2024-11-11 16:00:00'
WHEN UserID = 7 THEN '2024-11-12 11:30:00'
WHEN UserID = 8 THEN '2024-11-12 14:00:00'
ELSE NULL END

Select * from Artwork
Select * from [User]
Select * from User_Favorite_Artwork
Select * from Gallery

ALTER TABLE User_Favorite_Artwork
DROP CONSTRAINT FK_User_Favorite_Artwork_Artwork



EXEC sp_help 'Artwork_Gallery'



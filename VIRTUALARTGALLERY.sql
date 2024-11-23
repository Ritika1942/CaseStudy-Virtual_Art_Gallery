CREATE DATABASE VIRTUALARTGALLERY

CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY, 
    Name NVARCHAR(100) NOT NULL, 
    Biography NVARCHAR(MAX), 
    BirthDate DATE, 
    Nationality NVARCHAR(50),
    Website NVARCHAR(255), 
    ContactInformation NVARCHAR(255),
    TotalArtWorks INT DEFAULT 0 
)

CREATE TABLE Artwork (
    ArtworkID INT IDENTITY(1,1) PRIMARY KEY,  
    Title NVARCHAR(200) NOT NULL, 
    Description NVARCHAR(MAX), 
    CreationDate DATE, 
    Medium NVARCHAR(100),
    ImageURL NVARCHAR(255), 
    ArtistID INT, 
    CONSTRAINT FK_Artist FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID) ON DELETE CASCADE
);

CREATE TABLE Gallery (
    GalleryID INT PRIMARY KEY, 
    Name NVARCHAR(200) NOT NULL, 
    Description NVARCHAR(MAX), 
    Location NVARCHAR(255),
    Curator INT, 
    OpeningHours NVARCHAR(100), 
    VisitorType NVARCHAR(50), 
    GalleryType NVARCHAR(50), 
    CONSTRAINT FK_Curator FOREIGN KEY (Curator) REFERENCES Artist(ArtistID) ON DELETE SET NULL
)

CREATE TABLE Artwork_Gallery (
    ArtworkID INT, 
    GalleryID INT,
    DisplayStartDate DATE NOT NULL,
    DisplayEndDate DATE, 
    Position NVARCHAR(100), 
    PRIMARY KEY (ArtworkID, GalleryID),
    CONSTRAINT FK_Artwork FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID) ON DELETE CASCADE,
    CONSTRAINT FK_Gallery FOREIGN KEY (GalleryID) REFERENCES Gallery(GalleryID) ON DELETE CASCADE
)
CREATE TABLE [User] (
    UserID INT PRIMARY KEY, 
    Username NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL, 
    Email NVARCHAR(255) NOT NULL UNIQUE, 
    FirstName NVARCHAR(100), 
    LastName NVARCHAR(100),
    DateOfBirth DATE, 
    ProfilePicture NVARCHAR(255)
)

CREATE TABLE User_FavoriteArtworks (
    UserID INT, 
    ArtworkID INT, 
    PRIMARY KEY (UserID, ArtworkID), 
    CONSTRAINT FK_User_Favorites FOREIGN KEY (UserID) REFERENCES [User](UserID) ON DELETE CASCADE,
    CONSTRAINT FK_Artwork_Favorites FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID) ON DELETE CASCADE
)

INSERT INTO Artist (ArtistID, Name, Biography, BirthDate, Nationality, Website, ContactInformation, TotalArtWorks)
VALUES 
(1, 'Leonardo da Vinci', 'Renaissance polymath and painter of the Mona Lisa', '1452-04-15', 'Italian', 'https://www.leonardodavinci.com', 'leonardo@gmail.com', 5),

(2, 'Vincent van Gogh', 'Dutch post-impressionist painter known for The Starry Night', '1853-03-30', 'Dutch', 'https://www.vangogh.com', 'vincent@gmail.com', 4),

(3, 'Frida Kahlo', 'Mexican painter known for her self-portraits and surrealist works', '1907-07-06', 'Mexican', 'https://www.fridakahlo.com', 'friday@gmail.com', 8),

(4, 'Claude Monet', 'Founder of French Impressionist painting, famous for Water Lilies', '1840-11-14', 'French', 'https://www.monet.com', 'claude@gmail.com', 6),

(5, 'Pablo Picasso', 'Spanish painter and sculptor, co-founder of Cubism', '1881-10-25', 'Spanish', 'https://www.picasso.com', 'pablo@gmail.com', 7);

INSERT INTO Artwork (Title, Description, CreationDate, Medium, ImageURL, ArtistID)
VALUES 
('Mona Lisa', 'Famous portrait painting by Leonardo da Vinci', '1503-01-01', 'Oil on Canvas', 'https://www.example.com/monalisa.jpg', 1),
('The Starry Night', 'Post-impressionist painting by Vincent van Gogh', '1889-06-01', 'Oil on Canvas', 'https://www.example.com/starrynight.jpg', 2),
('The Two Fridas', 'Surrealist painting by Frida Kahlo', '1939-01-01', 'Oil on Canvas', 'https://www.example.com/thetwofridas.jpg', 3),
('Water Lilies', 'A series of impressionist paintings by Claude Monet', '1916-01-01', 'Oil on Canvas', 'https://www.example.com/waterlilies.jpg', 4),
('Guernica', 'Large oil painting by Pablo Picasso depicting the horrors of war', '1937-01-01', 'Oil on Canvas', 'https://www.example.com/guernica.jpg', 5);


INSERT INTO Gallery (GalleryID, Name, Description, Location, Curator, OpeningHours, VisitorType, GalleryType)
VALUES
(1, 'Louvre Museum', 'World-famous art museum known for iconic pieces like the Mona Lisa.', 'Paris, France', 1, '9:00 AM - 6:00 PM', 'General Public', 'Art Museum'),

(2, 'Van Gogh Museum', 'Dedicated to the works of Vincent van Gogh and his contemporaries.', 'Amsterdam, Netherlands', 2, '9:00 AM - 5:00 PM', 'Art Enthusiasts', 'Artist Museum'),

(3, 'Frida Kahlo Museum', 'Also known as Casa Azul, showcasing the life and work of Frida Kahlo.', 'Mexico City, Mexico', 3, '10:00 AM - 5:00 PM', 'Tourists', 'House Museum'),

(4, 'Monet Garden Museum', 'Features Monets paintings and gardens that inspired his work.', 'Giverny, France', 4, '9:30 AM - 6:30 PM', 'Nature Lovers', 'Historic Site'),

(5, 'Picasso Museum', 'Explores the life and works of Pablo Picasso.', 'Barcelona, Spain', 5, '10:00 AM - 8:00 PM', 'Art Scholars', 'Artist Museum');


SELECT * FROM Artwork;
SELECT * FROM Gallery;
INSERT INTO Artwork_Gallery (ArtworkID, GalleryID, DisplayStartDate, DisplayEndDate, Position)
VALUES
(1, 1, '2024-01-01', '2024-03-31', 'Main Hall'),
(2, 2, '2024-02-01', '2024-04-30', 'Exhibition Room A'),
(3, 3, '2024-03-01', '2024-06-30', 'Gallery Center'),
(4, 4, '2024-04-01', '2024-07-31', 'Outdoor View'),
(5, 5, '2024-05-01', NULL, 'Historical Showcase')

SELECT * FROM Artwork_Gallery

INSERT INTO [User] (UserID, Username, Password, Email, FirstName, LastName, DateOfBirth, ProfilePicture)
VALUES
(1, 'artlover01', 'Password@123', 'artlover01@example.com', 'Alice', 'Smith', '1995-04-10', 'https://example.com/profiles/alice.jpg'),
(2, 'vincentfan', 'SecurePass!89', 'vincentfan@example.com', 'Bob', 'Johnson', '1988-09-25', 'https://example.com/profiles/bob.jpg'),
(3, 'frida_fanatic', 'MySecret#56', 'fridafan@example.com', 'Charlie', 'Brown', '1992-07-14', 'https://example.com/profiles/charlie.jpg'),
(4, 'monet_master', 'ILoveArt!22', 'monetmaster@example.com', 'Diana', 'Morris', '2000-03-08', 'https://example.com/profiles/diana.jpg'),
(5, 'picasso_enthusiast', 'Artistic@789', 'picasso@example.com', 'Eve', 'Williams', '1985-11-30', 'https://example.com/profiles/eve.jpg');
INSERT INTO User_FavoriteArtworks (UserID, ArtworkID)
VALUES
(1, 1), 
(1, 3), 
(2, 2), 
(2, 4), 
(3, 5), 
(4, 1), 
(4, 2), 
(5, 3), 
(5, 5)



select * from Artist
select * from [User]
select * from Artwork
select * from Artwork_Gallery
select * from Gallery
select * from User_FavoriteArtworks
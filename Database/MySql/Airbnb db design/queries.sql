CREATE DATABASE Airbnb;
USE Airbnb;

CREATE TABLE Users (
    UserId INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    ConatactNumber VARCHAR(50),
    Bio TEXT,
    UserType ENUM('Host', 'Guest', 'Both'),
    Language VARCHAR(50),
    PasswordHash VARCHAR(100)
);

CREATE TABLE Listings (
    ListingId INT PRIMARY KEY,
    HostId INT NOT NULL,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    Location VARCHAR(255),
    Accommodation ENUM('Rooms', 'House', 'Unique Stay'),
    Amenities JSON,
    Availability JSON,
    Currency VARCHAR(3),
    MaxGuest INT,
    ImageGallery TEXT,
    CostPerNight DECIMAL(10, 2),
    FOREIGN KEY (HostId) REFERENCES Users(UserId)
);

CREATE TABLE Bookings (
    BookingId INT PRIMARY KEY AUTO_INCREMENT,
    GuestId INT,
    ListingId INT,users
    CheckInDate DATE,
    CheckOutDate DATE,
    GuestCount INT,
    TotalPrice DECIMAL(10, 2),
    Currency VARCHAR(3),
    Status ENUM('Pending', 'Confirmed', 'Completed', 'Cancelled'),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (GuestId) REFERENCES Users(UserId),
    FOREIGN KEY (ListingId) REFERENCES Listings(ListingId)
);


create TABLE Reviews (
    ReviewId INT PRIMARY KEY AUTO_INCREMENT,
    ListingId INT,
    UserId INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    ReviewDate DATE,
    FOREIGN KEY (ListingId) REFERENCES Listings(ListingId),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

INSERT INTO Users (Name, Email, ConatactNumber, Bio, UserType, Language, PasswordHash)
VALUES
('Alice Johnson', 'alice@example.com', '1234567890', 'Nature lover and host in the mountains.', 'Host', 'English', 'hashed_pwd_1'),
('Bob Smith', 'bob@example.com', '0987654321', 'Traveler and photographer.', 'Guest', 'English', 'hashed_pwd_2'),
('Carla Mendes', 'carla@example.com', '5551112233', 'I love hosting people from different cultures.', 'Host', 'Portuguese', 'hashed_pwd_3'),
('David Lee', 'david@example.com', '4442228899', 'Guest exploring Europe.', 'Guest', 'Korean', 'hashed_pwd_4');


INSERT INTO Listings (ListingId, HostId, Title, Description, Location, Accommodation, Amenities, Availability, Currency, MaxGuest, ImageGallery, CostPerNight)
VALUES
(1, 1, 'Cozy Cabin in the Woods', 'A peaceful retreat in the forest.', 'Colorado, USA', 'House', 
    JSON_OBJECT('wifi', true, 'heating', true), 
    JSON_ARRAY(JSON_OBJECT('from', '2025-07-10', 'to', '2025-07-20')), 
    'USD', 4, 'cabin.jpg', 150.00),

(2, 3, 'Modern Apartment Downtown', 'Perfect for business trips and city getaways.', 'Lisbon, Portugal', 'Rooms', 
    JSON_OBJECT('wifi', true, 'kitchen', true, 'elevator', true), 
    JSON_ARRAY(JSON_OBJECT('from', '2025-08-01', 'to', '2025-08-15')), 
    'EUR', 2, 'apartment.jpg', 95.00),

(3, 1, 'Mountain View Studio', 'Ideal for hikers and adventurers.', 'Denver, USA', 'Unique Stay', 
    JSON_OBJECT('wifi', true, 'fireplace', true), 
    JSON_ARRAY(JSON_OBJECT('from', '2025-09-01', 'to', '2025-09-30')), 
    'USD', 2, 'studio.jpg', 120.00),

(4, 3, 'Beachfront Bungalow', 'Relax by the sea in this cozy bungalow.', 'Algarve, Portugal', 'House', 
    JSON_OBJECT('wifi', true, 'beachAccess', true), 
    JSON_ARRAY(JSON_OBJECT('from', '2025-07-15', 'to', '2025-07-25')), 
    'EUR', 3, 'beach.jpg', 180.00);


INSERT INTO Bookings (GuestId, ListingId, CheckInDate, CheckOutDate, GuestCount, TotalPrice, Currency, Status)
VALUES
(2, 1, '2025-07-11', '2025-07-15', 2, 600.00, 'USD', 'Confirmed'),
(4, 2, '2025-08-02', '2025-08-06', 1, 380.00, 'EUR', 'Pending'),
(2, 3, '2025-09-05', '2025-09-10', 2, 600.00, 'USD', 'Completed'),
(4, 4, '2025-07-16', '2025-07-20', 3, 720.00, 'EUR', 'Confirmed');

INSERT INTO Reviews (ListingId, UserId, Rating, Comment, ReviewDate)
VALUES
(1, 2, 5, 'Amazing stay! Loved the cabin and nature around it.', '2025-07-16'),
(2, 4, 4, 'Nice apartment, great location, but a bit noisy.', '2025-08-07'),
(3, 2, 5, 'Perfect for solo adventures. Clean and cozy.', '2025-09-11'),
(4, 4, 4, 'Lovely view and easy beach access. Would come again.', '2025-07-21');


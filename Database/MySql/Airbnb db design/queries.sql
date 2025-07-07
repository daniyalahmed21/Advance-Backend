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

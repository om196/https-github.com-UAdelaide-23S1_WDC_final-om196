-- >Create the bookstore database
CREATE DATABASE bookstore;
USE bookstore;

-- >Create the User table
CREATE TABLE User (
  UserID INT PRIMARY KEY,
  Username VARCHAR(50),
  Password VARCHAR(50),
  Email VARCHAR(100),
  Role VARCHAR(10)
);

-- >Insert test data into the User table
INSERT INTO User (UserID, Username, Password, Email, Role)
VALUES (1, 'om', 'pass1', 'om@example.com', 'buyer'),
       (2, 'samit', 'pass2', 'samit@example.com', 'seller');







-- >Create the Book table
CREATE TABLE Book (
  BookID INT PRIMARY KEY,
  Title VARCHAR(100),
  Author VARCHAR(100),
  ISBN VARCHAR(20),
  Price DECIMAL(10, 2)
);

--> Insert test data into the Book table
INSERT INTO Book (BookID, Title, Author, ISBN, Price)
VALUES (1, 'Harry Potter', 'J. K. Rowling', '12345678', 10.00),
       (2, 'Half Girlfriend', 'Chetan Bhagat', '23456789', 15.00);







-- >Create the Seller table
CREATE TABLE Seller (
  SellerID INT PRIMARY KEY,
  UserID INT,
  Location VARCHAR(100),
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- >Insert test data into the Seller table
INSERT INTO Seller (SellerID, UserID, Location)
VALUES (1, 2, 'Patan');







--> Create the Purchase table
CREATE TABLE Purchase (
  PurchaseID INT PRIMARY KEY,
  BuyerID INT,
  SellerID INT,
  BookID INT,
  PurchaseDate DATE,
  FOREIGN KEY (BuyerID) REFERENCES User(UserID),
  FOREIGN KEY (SellerID) REFERENCES Seller(SellerID),
  FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

--> Insert test data into the Purchase table
INSERT INTO Purchase (PurchaseID, BuyerID, SellerID, BookID, PurchaseDate)
VALUES (1, 1, 1, 1, '2023-06-01'),
       (2, 1, 1, 2, '2023-06-05');


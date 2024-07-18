CREATE DATABASE ApartmentManagement;

USE ApartmentManagement;
CREATE TABLE users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Role VARCHAR(50)  -- or any other fields you require
);


CREATE TABLE Owners (
    OwnerID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    ContactInfo VARCHAR(255)
);

CREATE TABLE Buildings (
    BuildingID INT PRIMARY KEY,
    OwnerID INT,
    TotalFloors INT,
    Address VARCHAR(255),
    FOREIGN KEY (OwnerID) REFERENCES Owners(OwnerID)
);

CREATE TABLE Apartments (
    ApartmentID INT PRIMARY KEY,
    ApartmentNumber VARCHAR(50),
    BuildingID INT,
    RentAmount DECIMAL(10, 2),
    NumberOfRooms INT,
    FOREIGN KEY (BuildingID) REFERENCES Buildings(BuildingID)
);

CREATE TABLE Tenants (
    TenantID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    MovingDate DATE,
    ContactInfo VARCHAR(255)
);

CREATE TABLE LeaseRent (
    TenantID INT,
    OwnerID INT,
    LeaseStartDate DATE,
    LeaseEndDate DATE,
    Rent DECIMAL(10, 2),
    ApartmentID INT,
    PRIMARY KEY (TenantID, ApartmentID),
    FOREIGN KEY (TenantID) REFERENCES Tenants(TenantID),
    FOREIGN KEY (OwnerID) REFERENCES Owners(OwnerID),
    FOREIGN KEY (ApartmentID) REFERENCES Apartments(ApartmentID)
);

CREATE TABLE MaintenanceStaff (
    StaffID INT PRIMARY KEY,
    FirstName VARCHAR(255),Apartments
    LastName VARCHAR(255),
    ContactInfo VARCHAR(255)
);

CREATE TABLE MaintenanceRequest (
    RequestID INT PRIMARY KEY,
    Description VARCHAR(255),
    StaffID INT,
    ApartmentID INT,
    Status VARCHAR(50),
    FOREIGN KEY (StaffID) REFERENCES MaintenanceStaff(StaffID),
    FOREIGN KEY (ApartmentID) REFERENCES Apartments(ApartmentID)
);
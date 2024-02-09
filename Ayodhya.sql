Create Database Ayodhya;
USE Ayodhya;

-- Table for Deity 
Create Table Deity(
DeityID INT PRIMARY KEY,
Name VARCHAR(255) NOT NULL,
Description TEXT
);

-- Table for Temple
CREATE TABLE Temple(
TempleID INT PRIMARY KEY,
Name VARCHAR(255) NOT NULL,
Location VARCHAR(255),
ConstructionStartDate date,
ExceptedCompletionDate date
);

-- Table for constructionPhase 
CREATE TABLE ConstructionPhase(
PhaseID INT PRIMARY KEY,
TempleID INT,
PhaseName VARCHAR(255) NOT NULL,
StartDate DATE,
CompletionDate DATE,
CONSTRAINT fk_temple FOREIGN KEY(TempleID) REFERENCES Temple(TempleID)
);

-- Table for Architecture
CREATE TABLE Architecture (
    ArchitectureID INT PRIMARY KEY,
    TempleID INT,
    ArchitectName VARCHAR(255) NOT NULL,
    Description TEXT,
    CONSTRAINT fk_temple_architecture FOREIGN KEY (TempleID) REFERENCES Temple(TempleID)
);

-- Table for Donation 
CREATE TABLE Donations (
    DonationID INT PRIMARY KEY,
    DonorName VARCHAR(255) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    DonationDate DATE,
    TempleID INT,
    CONSTRAINT fk_temple_donations FOREIGN KEY (TempleID) REFERENCES Temple(TempleID)
);

-- table for Events
CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(255) NOT NULL,
    EventDate DATE,
    Description TEXT
);

-- Table for TempleEvents
CREATE TABLE TempleEvents (
    TempleID INT,
    EventID INT,
    CONSTRAINT fk_temple_events_temple FOREIGN KEY (TempleID) REFERENCES Temple(TempleID),
    CONSTRAINT fk_temple_events_event FOREIGN KEY (EventID) REFERENCES Events(EventID),
    PRIMARY KEY (TempleID, EventID)
);


-- Inserting values into Deity table
INSERT INTO Deity (DeityID,Name,Description)
VALUES
 (1, 'Rama', 'An incarnation of Vishnu, a principal deity of Hinduism born in Ayodhya.'),
 (2, 'Ram Lalla Virajman', 'The infant form of Rama, the presiding deity of the Ram Mandir temple.');

-- Inserting SAMPLE data into the Temple Table
INSERT INTO Temple (TempleID, Name, Location, ConstructionStartDate, ExceptedCompletionDate)
VALUES
    (1, 'Ram Mandir', 'Ayodhya, Uttar Pradesh, India', '2020-03-01', '2024-01-22');

-- Example values for ConstructionPhase Table
INSERT INTO ConstructionPhase (PhaseID, TempleID, PhaseName, StartDate, CompletionDate)
VALUES
    (1, 1, 'Phase 1', '2020-03-01', '2020-05-15'),
    (2, 1, 'Phase 2', '2020-06-01', '2020-08-30'),
    (3, 1, 'Phase 3', '2021-01-10', '2021-03-25'),
    (4, 1, 'Phase 4', '2021-06-15', '2022-02-28');
    
-- Inserting values into the Architecture Table
INSERT INTO Architecture (ArchitectureID, TempleID, ArchitectName, Description)
VALUES
    (1, 1, 'Chandrakant Sompura', 'Chief architect of the temple'),
    (2, 1, 'Nikhil Sompura', 'Assistant architect'),
    (3, 1, 'Ashish Sompura', 'Assistant architect');
    
--  Inserting SAMPLE data for Donations -- Assuming TempleID 1 corresponds to the Ram Mandir
INSERT INTO Donations (DonationID, DonorName, Amount, DonationDate, TempleID)
VALUES
(2, 'Anonymous Donor', 100.00, '2021-02-01', 1),
(3, 'Leadership Council', 1000000.00, '2021-03-10', 1),
(4, 'H.D. Kumaraswamy', 5000.00, '2021-05-01', 1),
(5, 'Siddaramaiah', 20000.00, '2021-05-15', 1),
(6, 'VHP Activist 1', 50.00, '2021-06-01', 1),
(7, 'VHP Activist 2', 75.00, '2021-06-15', 1),
(8, 'Muslim Community Member', 1000.00, '2021-07-01', 1),
(9, 'Christian Community Member', 500.00, '2021-07-15', 1),
(10, 'Anonymous Supporter', 200.00, '2021-08-01', 1);


-- Add more donation records as needed

-- Inserting SAMPLE values into Events Table
INSERT INTO Events (EventID, EventName, EventDate, Description)
VALUES
    (1, 'Commencement Ceremony', '2020-08-05', 'Ceremony celebrating the commencement of Ram Mandir construction by PM Narendra Modi'),
    (2, 'Bhoomi Pujan Ceremony', '2020-08-05', 'Ground-breaking ceremony with Vedic rituals and foundation stone laying by PM Narendra Modi'),
    (3, 'Vijay Mahamantra Jaap Anushthan', '2020-04-06', 'Chanting of Vijay Mahamantra for victory over hurdles in temple construction'),
    (4, 'Pran Pratishtha Ceremony', '2024-01-22', 'Consecration ceremony scheduled for the installation of Lord Ram idol in the garbhagriha');

-- Insert values into TempleEvents Table
INSERT INTO TempleEvents (TempleID, EventID) VALUES
    (1, 1), -- Assuming TempleID 1 and EventID 1 are associated
    (1, 2), -- Assuming TempleID 1 and EventID 2 are associated
    (1, 3), -- Assuming TempleID 1 and EventID 3 are associated
    (1, 4); -- Assuming TempleID 1 and EventID 4 are associated
















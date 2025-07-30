-- ===============================
-- Cybersecurity Incident Management System
-- Complete SQL for Database Setup
-- ===============================

-- 1. Create the Database
CREATE DATABASE IF NOT EXISTS CyberSecIncidentDB;
USE CyberSecIncidentDB;

-- ===============================
-- 2. USERS TABLE
-- ===============================
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Department VARCHAR(100)
);

-- ===============================
-- 3. ANALYSTS TABLE
-- ===============================
CREATE TABLE Analysts (
    AnalystID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Specialty VARCHAR(100)
);

-- ===============================
-- 4. ASSETS TABLE
-- ===============================
CREATE TABLE Assets (
    AssetID INT AUTO_INCREMENT PRIMARY KEY,
    AssetName VARCHAR(100) NOT NULL,
    AssetType VARCHAR(50) NOT NULL,
    IPAddress VARCHAR(45),
    Criticality ENUM('Low', 'Medium', 'High') DEFAULT 'Medium'
);

-- ===============================
-- 5. INCIDENTS TABLE
-- ===============================
CREATE TABLE Incidents (
    IncidentID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    Description TEXT,
    Severity ENUM('Low', 'Medium', 'High', 'Critical') DEFAULT 'Medium',
    Status ENUM('Open', 'Investigating', 'Resolved', 'Closed') DEFAULT 'Open',
    ReportedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    UserID INT,
    AnalystID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE SET NULL,
    FOREIGN KEY (AnalystID) REFERENCES Analysts(AnalystID) ON DELETE SET NULL
);

-- ===============================
-- 6. INCIDENT-ASSET RELATIONSHIP TABLE
-- ===============================
CREATE TABLE IncidentAsset (
    IncidentID INT,
    AssetID INT,
    PRIMARY KEY (IncidentID, AssetID),
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID) ON DELETE CASCADE,
    FOREIGN KEY (AssetID) REFERENCES Assets(AssetID) ON DELETE CASCADE
);

-- ===============================
-- 7. ACTIONS TABLE (Incident Response Logs)
-- ===============================
CREATE TABLE Actions (
    ActionID INT AUTO_INCREMENT PRIMARY KEY,
    IncidentID INT NOT NULL,
    ActionTaken TEXT NOT NULL,
    ActionDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    PerformedBy VARCHAR(100),
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID) ON DELETE CASCADE
);

-- ===============================
-- ✅ OPTIONAL: SAMPLE DATA (REMOVE IF NEEDED)
-- ===============================
INSERT INTO Users (FullName, Email, Department)
VALUES
('Alice Njoroge', 'alice@company.com', 'Finance'),
('Brian Kamau', 'brian@company.com', 'IT');

INSERT INTO Analysts (FullName, Email, Specialty)
VALUES
('Jane Cyber', 'jcyber@sec.com', 'Malware Analysis'),
('Mike Red', 'mike.red@sec.com', 'Network Forensics');

INSERT INTO Assets (AssetName, AssetType, IPAddress, Criticality)
VALUES
('Finance Server', 'Server', '10.0.0.1', 'High'),
('Employee Laptop', 'Workstation', '10.0.0.25', 'Medium');

INSERT INTO Incidents (Title, Description, Severity, Status, UserID, AnalystID)
VALUES
('Ransomware Detected', 'Malware activity observed in Finance Server', 'High', 'Investigating', 1, 1);

INSERT INTO IncidentAsset (IncidentID, AssetID)
VALUES
(1, 1);

INSERT INTO Actions (IncidentID, ActionTaken, PerformedBy)
VALUES
(1, 'Isolated infected server from network', 'Jane Cyber');


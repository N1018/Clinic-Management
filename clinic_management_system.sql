
CREATE DATABASE clinicDB;
USE clinicDB;
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    ContactNumber VARCHAR(20),
    Email VARCHAR(100) UNIQUE,
    PRIMARY KEY (PatientID)
    );
    
    CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialty VARCHAR(100),
    ContactNumber VARCHAR(20),
    Email VARCHAR(100) UNIQUE,
    PRIMARY KEY (DoctorID)
);
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    AppointmentTime TIME,
    PRIMARY KEY (AppointmentID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
CREATE TABLE Treatments (
    TreatmentID INT AUTO_INCREMENT,
    TreatmentName VARCHAR(100) NOT NULL,
    Description VARCHAR(200),
    PRIMARY KEY (TreatmentID)
);

CREATE TABLE PatientTreatments (
    PatientID INT,
    TreatmentID INT,
    TreatmentDate DATE,
    PRIMARY KEY (PatientID, TreatmentID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (TreatmentID) REFERENCES Treatments(TreatmentID)
);

CREATE TABLE Medications (
    MedicationID INT AUTO_INCREMENT,
    MedicationName VARCHAR(100) NOT NULL,
    Dosage VARCHAR(50),
    PRIMARY KEY (MedicationID)
);

CREATE TABLE Prescriptions (
    PrescriptionID INT AUTO_INCREMENT,
    PatientID INT,
    MedicationID INT,
    PrescriptionDate DATE,
    PRIMARY KEY (PrescriptionID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
);

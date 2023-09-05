-- Active: 1693915950566@@127.0.0.1@7499
CREATE DATABASE clinic;
CREATE TABLE patients(id SERIAL PRIMARY KEY, name VARCHAR(40), date_of_birth DATE);
CREATE TABLE medical_histories(ID INT, admitted_at TIMESTAMP, patient_id INT, status VARCHAR(90),
PRIMARY KEY(ID),
FOREIGN KEY(patient_id) REFERENCES patients(id));
SELECT * FROM medical_histories;
CREATE TABLE treatments(id INT PRIMARY KEY,  type VARCHAR(60), name VARCHAR(50));

-- Now a talbe to join the id of treatment and medical history
CREATE TABLE medical_treatment (
    medical_history_id INT,
    treatment_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(ID),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);



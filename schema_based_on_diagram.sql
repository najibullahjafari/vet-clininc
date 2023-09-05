-- Active: 1693915950566@@127.0.0.1@7499
CREATE DATABASE clinic;
CREATE TABLE patients(id SERIAL PRIMARY KEY, name VARCHAR(40), date_of_birth DATE);
CREATE INDEX ON patients (id);
CREATE TABLE medical_histories(ID INT, admitted_at TIMESTAMP, patient_id INT, status VARCHAR(90),
PRIMARY KEY(ID),
FOREIGN KEY(patient_id) REFERENCES patients(id));
CREATE INDEX ON medical_histories (ID);

CREATE TABLE treatments(id INT PRIMARY KEY,  type VARCHAR(60), name VARCHAR(50));
CREATE INDEX ON treatments (id);



-- Now a talbe to join the id of treatment and medical history
CREATE TABLE medical_treatment (
    medical_history_id INT,
    treatment_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(ID),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE TABLE invoices(id SERIAL PRIMARY KEY, total_amount DECIMAL, generated_at TIMESTAMP, payed_at TIMESTAMP, medical_history_id INT,
FOREIGN KEY(medical_history_id) REFERENCES medical_histories(ID));
CREATE INDEX ON invoices (id);


CREATE TABLE invoice_item(id SERIAL PRIMARY KEY, unit_price DECIMAL, quantity INT, total_price DECIMAL, invoice_id INT, treatment_id INT,
FOREIGN KEY(invoice_id) REFERENCES invoices(id),
FOREIGN KEY(treatment_id) REFERENCES treatments(id));
CREATE INDEX ON invoice_item (id);



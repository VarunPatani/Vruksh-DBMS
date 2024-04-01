use vruksh_hospital_management;

create database vruksh_hospital_management;
drop database vruksh_hospital_management;

create table doctor(
doctor_id varchar(30) primary key,
fname char(20) not null,
lname char(20) not null,
gender char(2) not null,
dob date not null,
specialization varchar(30) not null,
address varchar(20) not null,
contact numeric not null,
email varchar(30) not null,
department_id varchar(30),
branch_id varchar(30));


create table patient(
patient_id varchar(30) primary key,
fname char(20) not null,
lname char(20) not null,
gender char(2) not null,
dob  date not null,
email varchar(30) not null,
address varchar(20) not null,
contact numeric not null,
diagnosis varchar(100) not null, 
blood_group char(4) not null,
record_id varchar(30),
department_id varchar(30),
branch_id varchar(30),
doctor_id varchar(30));


create table nurse(
nurse_id varchar(30) primary key,
fname char(20) not null,
lname char(20) not null,
gender char(2) not null,
dob date not null, 
email varchar(30) not null,
address varchar(20) not null,
contact numeric not null,
department_id varchar(30),
branch_id varchar(30));


create table staff(
staff_id varchar(30) primary key,
fname char(20) not null,
lname char(20) not null,
gender char(2) not null,
dob date not null,  
email varchar(30) not null,
address varchar(20) not null,
contact numeric not null,
department_id varchar(30),
branch_id varchar(30));


create table department(
department_id varchar(30) primary key,
department_name varchar(20) not null,
operating_hours numeric not null,
bed_occupancy numeric not null,
branch_id varchar(30));


create table medication(
medication_id varchar(30) primary key,
medication_name varchar(30) not null,
manufacturer varchar(30) not null,
unit_price numeric not null,
expiry_date date not null,
total_quantity numeric not null,
medication_status char(2) not null);



create table medical_records(
record_id varchar(30) primary key,
admission_date date not null,
discharge_date date not null,
doctor_id varchar(30));


create table billing(
billing_id varchar(30) primary key,
amount numeric not null,
payment_date date not null,
patient_id varchar(30),
staff_id varchar(30));

	
create table branch(
branch_id varchar(30) primary key,
branch_name char(100) not null,
branch_address varchar(100) not null);


create table non_medical_supplies(
item_name varchar(30) primary key,
quantity numeric not null,
supply_status char(2) not null,
manufacturer varchar(30) not null);


-- many to many tables
create table doctor_medication(
doctor_id varchar(30),
medication_id varchar(30),
medication_dosage numeric(30) not null); 
	

create table doctor_nurse(
doctor_id varchar(30),
nurse_id varchar(30));


create table patient_nurse(
patient_id varchar(30),
nurse_id varchar(30));


create table patient_medication(
patient_id varchar(30),
medication_id varchar(30));


create table department_medication(
department_id varchar(30),
medication_id varchar(30));


create table department_non_medical_supplies(
department_id varchar(30),
item_name varchar(30));





 
-- Foriegn keys in doctor
ALTER TABLE doctor
ADD CONSTRAINT fk_doctor_department FOREIGN KEY (department_id) REFERENCES department(department_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE doctor
ADD CONSTRAINT fk_doctor_branch FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- Foreign keys in patient
ALTER TABLE patient
ADD CONSTRAINT fk_patient_record FOREIGN KEY (record_id) REFERENCES medical_records(record_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE patient
ADD CONSTRAINT fk_patient_department FOREIGN KEY (department_id) REFERENCES department(department_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE patient
ADD CONSTRAINT fk_patient_branch FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE patient
ADD CONSTRAINT fk_patient_doctor FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- Foreign keys in nurse
ALTER TABLE nurse
ADD CONSTRAINT fk_nurse_department FOREIGN KEY (department_id) REFERENCES department(department_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE nurse
ADD CONSTRAINT fk_nurse_branch FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- Foreign keys in staff
ALTER TABLE staff
ADD CONSTRAINT fk_staff_branch FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE staff
ADD CONSTRAINT fk_staff_department FOREIGN KEY (department_id) REFERENCES department(department_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- Foreign key in department
ALTER TABLE department
ADD CONSTRAINT fk_department_branch FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- Foreign key in medical_records
ALTER TABLE medical_records
ADD CONSTRAINT fk_record_doctor FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- Foreign keys in billing
ALTER TABLE billing
ADD CONSTRAINT fk_billing_patient FOREIGN KEY (patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE billing
ADD CONSTRAINT fk_billing_staff FOREIGN KEY (staff_id) REFERENCES staff(staff_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- Foreign keys in many-to-many tables
ALTER TABLE doctor_medication
ADD CONSTRAINT fk_doctor_medication_doctor FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE doctor_medication
ADD CONSTRAINT fk_doctor_medication_medication FOREIGN KEY (medication_id) REFERENCES medication(medication_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE doctor_nurse
ADD CONSTRAINT fk_doctor_nurse_doctor FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE doctor_nurse
ADD CONSTRAINT fk_doctor_nurse_nurse FOREIGN KEY (nurse_id) REFERENCES nurse(nurse_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE patient_nurse
ADD CONSTRAINT fk_patient_nurse_patient FOREIGN KEY (patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE patient_nurse
ADD CONSTRAINT fk_patient_nurse_nurse FOREIGN KEY (nurse_id) REFERENCES nurse(nurse_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE patient_medication
ADD CONSTRAINT fk_patient_medication_patient FOREIGN KEY (patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE patient_medication
ADD CONSTRAINT fk_patient_medication_medication FOREIGN KEY (medication_id) REFERENCES medication(medication_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE department_medication
ADD CONSTRAINT fk_department_medication_department FOREIGN KEY (department_id) REFERENCES department(department_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE department_medication
ADD CONSTRAINT fk_department_medication_medication FOREIGN KEY (medication_id) REFERENCES medication(medication_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE department_non_medical_supplies
ADD CONSTRAINT fk_department_supplies_department FOREIGN KEY (department_id) REFERENCES department(department_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE department_non_medical_supplies
ADD CONSTRAINT fk_department_supplies_item FOREIGN KEY (item_name) REFERENCES non_medical_supplies(item_name) ON DELETE CASCADE ON UPDATE CASCADE;



desc doctor;
desc patient;
desc nurse;
desc staff;
desc department;
desc medication;
desc medical_records;
desc billing;
desc branch;
desc non_medical_supplies;
desc doctor_medication;
desc doctor_nurse;
desc patient_nurse;
desc patient_medication;
desc department_medication;
desc department_non_medical_supplies;
desc medication_medical_records;

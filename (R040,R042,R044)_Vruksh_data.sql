use vruksh_hospital_management;


INSERT INTO branch (branch_id, branch_name, branch_address) VALUES
('B001', 'Sai Hospital', '123 Nehru Road, New Delhi, Delhi'),
('B002', 'Vishnu Children''s Clinic', '456 Mahatma Gandhi Marg, Mumbai, Maharashtra'),
('B003', 'Shiva Cardiac Centre', '789 Rajiv Gandhi Salai, Chennai, Tamil Nadu'),
('B004', 'Ganesh General Hospital', '321 Indira Nagar, Bengaluru, Karnataka'),
('B005', 'Krishna Multi-Specialty Clinic', '654 Mahatma Gandhi Road, Ahmedabad, Gujarat'),
('B006', 'Lakshmi Women''s Hospital', '987 Rajaji Salai, Coimbatore, Tamil Nadu'),
('B007', 'Saraswati Eye Care Centre', '753 Baji Rao Marg, Pune, Maharashtra'),
('B008', 'Hanuman Orthopedic Hospital', '246 Subhash Chandra Bose Road, Kolkata, West Bengal'),
('B009', 'Ganesha Neurology Institute', '159 Nehru Place, New Delhi, Delhi'),
('B010', 'Durga Ayurvedic Hospital', '753 Sardar Patel Marg, Jaipur, Rajasthan');

-- Inserting data into the department table
INSERT INTO department (department_id, department_name, operating_hours, bed_occupancy, branch_id) VALUES
('D001', 'Cardiology', 24, 80, 'B003'),
('D002', 'Pediatrics', 16, 60, 'B002'),
('D003', 'General Medicine', 20, 120, 'B001'),
('D004', 'Orthopedics', 18, 75, 'B008'),
('D005', 'Neurology', 20, 90, 'B008'),
('D006', 'Ophthalmology', 14, 50, 'B008'),
('D007', 'Gynecology', 16, 65, 'B003'),
('D008', 'Ayurveda', 12, 40, 'B010'),
('D009', 'Oncology', 20, 100, 'B004'),
('D010', 'Nephrology', 18, 70, 'B004');

-- Inserting data into the doctor table
INSERT INTO doctor (doctor_id, fname, lname, gender, dob, specialization, address, contact, email, department_id, branch_id) VALUES
('DR001', 'Rahul', 'Sharma', 'M', '1980-05-15', 'Cardiology', '123 Laxmi Nagar', 9876543210, 'rahul.sharma@hospital.com', 'D001', 'B003'),
('DR002', 'Priya', 'Desai', 'F', '1975-09-22', 'Pediatrics', '456 Andheri West', 8765432109, 'priya.desai@hospital.com', 'D002', 'B002'),
('DR003', 'Amit', 'Singh', 'M', '1970-03-10', 'General Medicine', '789 Saket', 7654321098, 'amit.singh@hospital.com', 'D003', 'B001'),
('DR004', 'Neha', 'Patel', 'F', '1985-11-05', 'Orthopedics', '321 Koramangala', 6543210987, 'neha.patel@hospital.com', 'D004', 'B008'),
('DR005', 'Sanjay', 'Gupta', 'M', '1978-07-20', 'Neurology', '654 Vasant Kunj', 5432109876, 'sanjay.gupta@hospital.com', 'D005', 'B009'),
('DR006', 'Richa', 'Malhotra', 'F', '1982-03-15', 'Ophthalmology', '987 Aundh', 4321098765, 'richa.malhotra@hospital.com', 'D006', 'B007'),
('DR007', 'Vikram', 'Kapoor', 'M', '1975-11-02', 'Gynecology', '753 RS Puram', 3210987654, 'vikram.kapoor@hospital.com', 'D007', 'B006'),
('DR008', 'Isha', 'Chopra', 'F', '1988-09-18', 'Ayurveda', '246 Salt Lake', 2109876543, 'isha.chopra@hospital.com', 'D008', 'B010'),
('DR009', 'Arjun', 'Reddy', 'M', '1979-04-25', 'Oncology', '159 Whitefield', 1098765432, 'arjun.reddy@hospital.com', 'D009', 'B004'),
('DR010', 'Meera', 'Nair', 'F', '1983-12-10', 'Nephrology', '753 Navrangpura', 9012345678, 'meera.nair@hospital.com', 'D010', 'B005');

-- Inserting data into the patient table
INSERT INTO patient (patient_id, fname, lname, gender, dob, email, address, contact, diagnosis, blood_group, record_id, department_id, branch_id, doctor_id) VALUES
('P001', 'Aman', 'Kumar', 'M', '1990-02-28', 'aman.kumar@email.com', '111 Dilshad Garden', 9876543210, 'Heart Condition', 'B+', 'R001', 'D001', 'B003', 'DR001'),
('P002', 'Riya', 'Mehta', 'F', '2015-06-12', 'riya.mehta@email.com', '222 Vile Parle', 8765432109, 'Flu', 'O-', 'R002', 'D002', 'B002', 'DR002'),
('P003', 'Rohan', 'Sharma', 'M', '1985-11-05', 'rohan.sharma@email.com', '333 Patel Nagar', 7654321098, 'Pneumonia', 'AB+', 'R003', 'D003', 'B001', 'DR003'),
('P004', 'Anisha', 'Patel', 'F', '1998-07-20', 'anisha.patel@email.com', '444 Indiranagar', 6543210987, 'Fracture', 'A-', 'R004', 'D004', 'B008', 'DR004'),
('P005', 'Aryan', 'Gupta', 'M', '1992-03-15', 'aryan.gupta@email.com', '555 Safdarjung', 5432109876, 'Migraine', 'O+', 'R005', 'D005', 'B009', 'DR005'),
('P006', 'Divya', 'Malhotra', 'F', '1980-11-02', 'divya.malhotra@email.com', '666 Baner', 4321098765, 'Cataract', 'B-', 'R006', 'D006', 'B007', 'DR006'),
('P007', 'Nitin', 'Kapoor', 'M', '1985-09-18', 'nitin.kapoor@email.com', '777 Peelamedu', 3210987654, 'Pregnancy', 'AB-', 'R007', 'D007', 'B006', 'DR007'),
('P008', 'Ananya', 'Chopra', 'F', '1990-04-25', 'ananya.chopra@email.com', '888 Saltlake City', 2109876543, 'Joint Pain', 'A+', 'R008', 'D008', 'B010', 'DR008'),
('P009', 'Aditya', 'Reddy', 'M', '1978-12-10', 'aditya.reddy@email.com', '999 HRBR Layout', 1098765432, 'Leukemia', 'B+', 'R009', 'D009', 'B004', 'DR009'),
('P010', 'Kavya', 'Nair', 'F', '1995-06-01', 'kavya.nair@email.com', '101 Paldi', 9012345678, 'Kidney Stone', 'O-', 'R010', 'D010', 'B005', 'DR010'),
('P011', 'Akansha', 'Nair', 'F', '1996-07-12', 'akansha.nair@email.com', '69402 wallstreet', 9082432129, 'Liver issues', 'O-', 'R010', 'D010', 'B005', 'DR010');


-- Inserting data into the nurse table
INSERT INTO nurse (nurse_id, fname, lname, gender, dob, email, address, contact, department_id, branch_id) VALUES
('N001', 'Pooja', 'Verma', 'F', '1988-07-20', 'pooja.verma@hospital.com', '444 Lajpat Nagar', 9876543211, 'D001', 'B003'),
('N002', 'Avinash', 'Patil', 'M', '1992-03-15', 'avinash.patil@hospital.com', '555 Bandra', 8765432110, 'D002', 'B002'),
('N003', 'Neha', 'Kapoor', 'F', '1980-11-02', 'neha.kapoor@hospital.com', '666 Rajouri Garden', 7654321099, 'D003', 'B001'),
('N004', 'Akash', 'Patel', 'M', '1985-09-18', 'akash.patel@hospital.com', '777 Jayanagar', 6543210988, 'D004', 'B008'),
('N005', 'Simran', 'Gupta', 'F', '1990-04-25', 'simran.gupta@hospital.com', '888 Greater Kailash', 5432109877, 'D005', 'B009'),
('N006', 'Rohan', 'Malhotra', 'M', '1978-12-10', 'rohan.malhotra@hospital.com', '999 Karvenagar', 4321098766, 'D006', 'B007'),
('N007', 'Priya', 'Kapoor', 'F', '1995-06-01', 'priya.kapoor@hospital.com', '101 Adyar', 3210987655, 'D007', 'B006'),
('N008', 'Arjun', 'Chopra', 'M', '1988-09-18', 'arjun.chopra@hospital.com', '246 Rajarhat', 2109876544, 'D008', 'B010'),
('N009', 'Diya', 'Reddy', 'F', '1979-04-25', 'diya.reddy@hospital.com', '159 JP Nagar', 1098765433, 'D009', 'B004'),
('N010', 'Anirudh', 'Nair', 'M', '1983-12-10', 'anirudh.nair@hospital.com', '753 Satellite', 9012345679, 'D010', 'B005');

-- Inserting data into the staff table
INSERT INTO staff (staff_id, fname, lname, gender, dob, email, address, contact, department_id, branch_id) VALUES
('S001', 'Ravi', 'Sharma', 'M', '1985-09-18', 'ravi.sharma@hospital.com', '777 Pitampura', 9876543212, 'D001', 'B003'),
('S002', 'Nisha', 'Patel', 'F', '1990-04-25', 'nisha.patel@hospital.com', '888 Juhu', 8765432111, 'D002', 'B002'),
('S003', 'Mohit', 'Singh', 'M', '1978-12-10', 'mohit.singh@hospital.com', '999 Rohini', 7654321100, 'D003', 'B001'),
('S004', 'Ankita', 'Desai', 'F', '1995-06-01', 'ankita.desai@hospital.com', '101 Basavanagudi', 6543210989, 'D004', 'B008'),
('S005', 'Arjun', 'Gupta', 'M', '1988-09-18', 'arjun.gupta@hospital.com', '246 Chanakyapuri', 5432109878, 'D005', 'B009'),
('S006', 'Isha', 'Malhotra', 'F', '1979-04-25', 'isha.malhotra@hospital.com', '159 Kalyani Nagar', 4321098767, 'D006', 'B007'),
('S007', 'Aditya', 'Kapoor', 'M', '1983-12-10', 'aditya.kapoor@hospital.com', '753 Adyar', 3210987656, 'D007', 'B006'),
('S008', 'Ananya', 'Chopra', 'F', '1988-07-20', 'ananya.chopra@hospital.com', '444 Newtown', 2109876545, 'D008', 'B010'),
('S009', 'Aryan', 'Reddy', 'M', '1992-03-15', 'aryan.reddy@hospital.com', '555 Marathahalli', 1098765434, 'D009', 'B004'),
('S010', 'Meera', 'Nair', 'F', '1980-11-02', 'meera.nair@hospital.com', '666 Vastrapur', 9012345680, 'D010', 'B005');

-- Inserting data into the medication table
INSERT INTO medication (medication_id, medication_name, manufacturer, unit_price, expiry_date, total_quantity, medication_status) VALUES
('M001', 'Paracetamol', 'Cipla Ltd.', 10.50, '2025-12-31', 5000, 'Y'),
('M002', 'Amoxicillin', 'Sun Pharma', 25.75, '2026-06-30', 3000, 'Y'),
('M003', 'Metformin', 'Lupin Ltd.', 18.99, '2024-09-15', 4000, 'Y'),
('M004', 'Aspirin', 'Zydus Cadila', 5.25, '2027-03-31', 6000, 'Y'),
('M005', 'Omeprazole', 'Dr. Reddy''s Labs', 12.80, '2025-07-15', 4500, 'Y'),
('M006', 'Salbutamol', 'Cipla Ltd.', 22.50, '2026-11-30', 3500, 'Y'),
('M007', 'Insulin', 'Biocon Ltd.', 75.00, '2024-06-01', 2000, 'Y'),
('M008', 'Atorvastatin', 'Aurobindo Pharma', 30.75, '2025-02-28', 4200, 'Y'),
('M009', 'Amlodipine', 'Alkem Labs', 18.20, '2026-09-30', 5500, 'N'),
('M010', 'Azithromycin', 'Glenmark Pharma', 45.60, '2024-12-15', 3800, 'N');

-- Inserting data into the medical_records table
INSERT INTO medical_records (record_id, admission_date, discharge_date, doctor_id) VALUES
('R001', '2023-03-01', '2023-03-10', 'DR001'),
('R002', '2023-03-15', '2023-03-20', 'DR002'),
('R003', '2023-03-25', '2023-04-02', 'DR003'),
('R004', '2023-04-05', '2023-04-15', 'DR004'),
('R005', '2023-04-18', '2023-04-25', 'DR005'),
('R006', '2023-05-01', '2023-05-08', 'DR006'),
('R007', '2023-05-10', '2023-05-20', 'DR007'),
('R008', '2023-05-22', '2023-06-01', 'DR008'),
('R009', '2023-06-03', '2023-06-18', 'DR009'),
('R010', '2023-06-20', '2023-06-30', 'DR010');

-- Inserting data into the billing table
INSERT INTO billing (billing_id, amount, payment_date, patient_id, staff_id) VALUES
('B001', 15000.00, '2023-03-10', 'P001', 'S001'),
('B002', 8500.00, '2023-03-20', 'P002', 'S002'),
('B003', 22800.50, '2023-04-02', 'P003', 'S003'),
('B004', 12000.75, '2023-04-15', 'P004', 'S004'),
('B005', 10500.25, '2023-04-25', 'P005', 'S005'),
('B006', 18700.60, '2023-05-08', 'P006', 'S006'),
('B007', 14200.00, '2023-05-20', 'P007', 'S007'),
('B008', 9800.50, '2023-06-01', 'P008', 'S008'),
('B009', 25000.00, '2023-06-18', 'P009', 'S009'),
('B010', 16300.75, '2023-06-30', 'P010', 'S010');

-- Inserting data into the non_medical_supplies table
INSERT INTO non_medical_supplies (item_name, quantity, supply_status, manufacturer) VALUES
('Bandages', 10000, 'Y', 'MediSupplies Co.'),
('Syringes', 20000, 'Y', 'HealthCare Supplies'),
('Gauze Pads', 15000, 'Y', 'SupplySource Ltd.'),
('Surgical Gloves', 12000, 'Y', 'MedEquip Inc.'),
('Thermometers', 5000, 'Y', 'AccuTemp Devices'),
('Stethoscopes', 3000, 'Y', 'PreciseMed Supplies'),
('Wheelchairs', 1000, 'Y', 'MobilityAid Co.'),
('Crutches', 2500, 'N', 'WalkRight Suppliers'),
('Oxygen Cylinders', 1500, 'N', 'BreathEasy Gases'),
('IV Stands', 800, 'Y', 'FluidFlow Equipments');

-- Inserting data into the many-to-many tables
INSERT INTO doctor_medication (doctor_id, medication_id, medication_dosage) VALUES
('DR001', 'M001', 12),
('DR002', 'M002', 3),
('DR003', 'M003', 90),
('DR004', 'M004', 41),
('DR005', 'M005', 1),
('DR006', 'M006', 45),
('DR007', 'M007', 23),
('DR008', 'M008', 6),
('DR009', 'M009', 9),
('DR010', 'M010', 12);

INSERT INTO doctor_nurse (doctor_id, nurse_id) VALUES
('DR001', 'N001'),
('DR002', 'N002'),
('DR003', 'N003'),
('DR004', 'N004'),
('DR005', 'N005'),
('DR006', 'N006'),
('DR007', 'N007'),
('DR008', 'N008'),
('DR009', 'N009'),
('DR010', 'N010');

INSERT INTO patient_nurse (patient_id, nurse_id) VALUES
('P001', 'N001'),
('P002', 'N002'),
('P003', 'N003'),
('P004', 'N004'),
('P005', 'N005'),
('P006', 'N006'),
('P007', 'N007'),
('P008', 'N008'),
('P009', 'N009'),
('P010', 'N010'),
('P011','N010');

INSERT INTO patient_medication (patient_id, medication_id) VALUES
('P001', 'M001'),
('P002', 'M002'),
('P003', 'M003'),
('P004', 'M004'),
('P005', 'M005'),
('P006', 'M006'),
('P007', 'M007'),
('P008', 'M008'),
('P009', 'M009'),
('P010', 'M010');

INSERT INTO department_medication (department_id, medication_id) VALUES
('D001', 'M001'),
('D002', 'M002'),
('D003', 'M003'),
('D004', 'M004'),
('D005', 'M005'),
('D006', 'M006'),
('D007', 'M007'),
('D008', 'M008'),
('D009', 'M009'),
('D010', 'M010');

INSERT INTO department_non_medical_supplies (department_id, item_name) VALUES
('D001', 'Bandages'),
('D002', 'Syringes'),
('D003', 'Gauze Pads'),
('D004', 'Surgical Gloves'),
('D005', 'Thermometers'),
('D006', 'Stethoscopes'),
('D007', 'Wheelchairs'),
('D008', 'Crutches'),
('D009', 'Oxygen Cylinders'),
('D010', 'IV Stands');

select * from doctor;
select * from patient;
select * from nurse;
select * from staff;
select * from department;
select * from medication;
select * from medical_records;
select * from billing;
select * from branch;
select * from non_medical_supplies;
select * from doctor_nurse;
select * from patient_nurse;
select * from patient_medication;
select * from department_medication;
select * from department_non_medical_supplies;
select * from medication_medical_records;
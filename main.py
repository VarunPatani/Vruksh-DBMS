from flask import Flask, render_template, request
import mysql.connector


app = Flask(__name__)

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Varun1.marmik",
    database="vruksh_hospital_management"
)


@app.route('/')
def login():
    return render_template('login.html')


@app.route('/tables')
def table():
    return render_template('tableSelection.html')


@app.route('/tables/doctor', methods=['GET', 'POST'])
def doctor():
    doc_cursor = mydb.cursor()
    if request.method == 'POST':
        if 'doctor_id' in request.form:
            # Insert new record
            doctor_id = request.form['doctor_id']
            fname = request.form['fname']
            lname = request.form['lname']
            gender = request.form['gender']
            dob = request.form['dob']
            specialization = request.form['specialization']
            address = request.form['address']
            contact = request.form['contact']
            email = request.form['email']
            department_id = request.form['department_id']
            branch_id = request.form['branch_id']

            sql = "INSERT INTO doctor (doctor_id,fname, lname, gender, dob, specialization, address, contact, email, department_id, branch_id) VALUES (%s,%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            values = (doctor_id, fname, lname, gender, dob, specialization,
                      address, contact, email, department_id, branch_id)
            doc_cursor.execute(sql, values)
            mydb.commit()

        elif 'delete' in request.form:
            # Delete record
            doctor_id = request.form['delete']
            sql = "DELETE FROM doctor WHERE doctor_id in (%s)"
            values = (doctor_id,)
            doc_cursor.execute(sql, values)
            mydb.commit()

    doc_cursor.execute("SELECT * FROM doctor")

    result = doc_cursor.fetchall()

    attributes = [attribute[0] for attribute in doc_cursor.description]

    doc_cursor.close()

    return render_template('doctor.html', result=result, attributes=attributes)


@app.route('/tables/patient', methods=['GET', 'POST'])
def patient():
    patient_cursor = mydb.cursor()
    if request.method == 'POST':
        if 'patient_id' in request.form:
            # Insert new record
            patient_id = request.form['patient_id']
            fname = request.form['fname']
            lname = request.form['lname']
            gender = request.form['gender']
            dob = request.form['dob']
            email = request.form['email']
            address = request.form['address']
            contact = request.form['contact']
            diagnosis = request.form['diagnosis']
            blood_group = request.form['blood_group']
            record_id = request.form['record_id']
            department_id = request.form['department_id']
            branch_id = request.form['branch_id']
            doctor_id = request.form['doctor_id']

            sql = "INSERT INTO patient (patient_id, fname, lname, gender, dob, email, address, contact, diagnosis, blood_group, record_id, department_id, branch_id, doctor_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            values = (patient_id, fname, lname, gender, dob, email, address, contact,
                      diagnosis, blood_group, record_id, department_id, branch_id, doctor_id)
            patient_cursor.execute(sql, values)
            mydb.commit()

        elif 'delete' in request.form:
            # Delete record
            patient_id = request.form['delete']
            sql = "DELETE FROM patient WHERE patient_id = %s"
            values = (patient_id,)
            patient_cursor.execute(sql, values)
            mydb.commit()

    patient_cursor.execute("SELECT * FROM patient")
    result = patient_cursor.fetchall()
    attributes = [attribute[0] for attribute in patient_cursor.description]
    patient_cursor.close()
    return render_template('patient.html', result=result, attributes=attributes)


@app.route('/tables/nurse', methods=['GET', 'POST'])
def nurse():
    nurse_cursor = mydb.cursor()
    if request.method == 'POST':
        if 'nurse_id' in request.form:
            # Insert new record
            nurse_id = request.form['nurse_id']
            fname = request.form['fname']
            lname = request.form['lname']
            gender = request.form['gender']
            dob = request.form['dob']
            email = request.form['email']
            address = request.form['address']
            contact = request.form['contact']
            department_id = request.form['department_id']
            branch_id = request.form['branch_id']

            sql = "INSERT INTO nurse (nurse_id, fname, lname, gender, dob, email, address, contact, department_id, branch_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            values = (nurse_id, fname, lname, gender, dob, email,
                      address, contact, department_id, branch_id)
            nurse_cursor.execute(sql, values)
            mydb.commit()

        elif 'delete' in request.form:
            # Delete record
            nurse_id = request.form['delete']
            sql = "DELETE FROM nurse WHERE nurse_id = %s"
            values = (nurse_id,)
            nurse_cursor.execute(sql, values)
            mydb.commit()

    nurse_cursor.execute("SELECT * FROM nurse")
    result = nurse_cursor.fetchall()
    attributes = [attribute[0] for attribute in nurse_cursor.description]
    nurse_cursor.close()
    return render_template('nurse.html', result=result, attributes=attributes)


@app.route('/tables/staff', methods=['GET', 'POST'])
def staff():
    staff_cursor = mydb.cursor()
    if request.method == 'POST':
        if 'staff_id' in request.form:
            # Insert new record
            staff_id = request.form['staff_id']
            fname = request.form['fname']
            lname = request.form['lname']
            gender = request.form['gender']
            dob = request.form['dob']
            email = request.form['email']
            address = request.form['address']
            contact = request.form['contact']
            department_id = request.form['department_id']
            branch_id = request.form['branch_id']

            sql = "INSERT INTO staff (staff_id, fname, lname, gender, dob, email, address, contact, department_id, branch_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            values = (staff_id, fname, lname, gender, dob, email,
                      address, contact, department_id, branch_id)
            staff_cursor.execute(sql, values)
            mydb.commit()

        elif 'delete' in request.form:
            # Delete record
            staff_id = request.form['delete']
            sql = "DELETE FROM staff WHERE staff_id = %s"
            values = (staff_id,)
            staff_cursor.execute(sql, values)
            mydb.commit()

    staff_cursor.execute("SELECT * FROM staff")
    result = staff_cursor.fetchall()
    attributes = [attribute[0] for attribute in staff_cursor.description]
    staff_cursor.close()
    return render_template('staff.html', result=result, attributes=attributes)


@app.route('/tables/department', methods=['GET', 'POST'])
def department():
    department_cursor = mydb.cursor()
    if request.method == 'POST':
        if 'department_id' in request.form:
            # Insert new record
            department_id = request.form['department_id']
            department_name = request.form['department_name']
            operating_hours = request.form['operating_hours']
            bed_occupancy = request.form['bed_occupancy']
            branch_id = request.form['branch_id']

            sql = "INSERT INTO department (department_id, department_name, operating_hours, bed_occupancy, branch_id) VALUES (%s, %s, %s, %s, %s)"
            values = (department_id, department_name,
                      operating_hours, bed_occupancy, branch_id)
            department_cursor.execute(sql, values)
            mydb.commit()

        elif 'delete' in request.form:
            # Delete record
            department_id = request.form['delete']
            sql = "DELETE FROM department WHERE department_id = %s"
            values = (department_id,)
            department_cursor.execute(sql, values)
            mydb.commit()

    department_cursor.execute("SELECT * FROM department")
    result = department_cursor.fetchall()
    attributes = [attribute[0] for attribute in department_cursor.description]
    department_cursor.close()
    return render_template('department.html', result=result, attributes=attributes)


@app.route('/tables/medication', methods=['GET', 'POST'])
def medication():
    medication_cursor = mydb.cursor()
    if request.method == 'POST':
        if 'medication_id' in request.form:
            # Insert new record
            medication_id = request.form['medication_id']
            medication_name = request.form['medication_name']
            manufacturer = request.form['manufacturer']
            unit_price = request.form['unit_price']
            expiry_date = request.form['expiry_date']
            total_quantity = request.form['total_quantity']
            medication_status = request.form['medication_status']

            sql = "INSERT INTO medication (medication_id, medication_name, manufacturer, unit_price, expiry_date, total_quantity, medication_status) VALUES (%s, %s, %s, %s, %s, %s, %s)"
            values = (medication_id, medication_name, manufacturer,
                      unit_price, expiry_date, total_quantity, medication_status)
            medication_cursor.execute(sql, values)
            mydb.commit()

        elif 'delete' in request.form:
            # Delete record
            medication_id = request.form['delete']
            sql = "DELETE FROM medication WHERE medication_id = %s"
            values = (medication_id,)
            medication_cursor.execute(sql, values)
            mydb.commit()

    medication_cursor.execute("SELECT * FROM medication")
    result = medication_cursor.fetchall()
    attributes = [attribute[0] for attribute in medication_cursor.description]
    medication_cursor.close()
    return render_template('medication.html', result=result, attributes=attributes)


@app.route('/tables/medical_records', methods=['GET', 'POST'])
def medical_records():
    medical_records_cursor = mydb.cursor()
    if request.method == 'POST':
        if 'record_id' in request.form:
            # Insert new record
            record_id = request.form['record_id']
            admission_date = request.form['admission_date']
            discharge_date = request.form['discharge_date']
            doctor_id = request.form['doctor_id']

            sql = "INSERT INTO medical_records (record_id, admission_date, discharge_date, doctor_id) VALUES (%s, %s, %s, %s)"
            values = (record_id, admission_date, discharge_date, doctor_id)
            medical_records_cursor.execute(sql, values)
            mydb.commit()

        elif 'delete' in request.form:
            # Delete record
            record_id = request.form['delete']
            sql = "DELETE FROM medical_records WHERE record_id = %s"
            values = (record_id,)
            medical_records_cursor.execute(sql, values)
            mydb.commit()

    medical_records_cursor.execute("SELECT * FROM medical_records")
    result = medical_records_cursor.fetchall()
    attributes = [attribute[0]
                  for attribute in medical_records_cursor.description]
    medical_records_cursor.close()
    return render_template('medical_records.html', result=result, attributes=attributes)


@app.route('/tables/billing', methods=['GET', 'POST'])
def billing():
    billing_cursor = mydb.cursor()
    if request.method == 'POST':
        if 'billing_id' in request.form:
            # Insert new record
            billing_id = request.form['billing_id']
            amount = request.form['amount']
            payment_date = request.form['payment_date']
            patient_id = request.form['patient_id']
            staff_id = request.form['staff_id']

            sql = "INSERT INTO billing (billing_id, amount, payment_date, patient_id, staff_id) VALUES (%s, %s, %s, %s, %s)"
            values = (billing_id, amount, payment_date, patient_id, staff_id)
            billing_cursor.execute(sql, values)
            mydb.commit()

        elif 'delete' in request.form:
            # Delete record
            billing_id = request.form['delete']
            sql = "DELETE FROM billing WHERE billing_id = %s"
            values = (billing_id,)
            billing_cursor.execute(sql, values)
            mydb.commit()

    billing_cursor.execute("SELECT * FROM billing")
    result = billing_cursor.fetchall()
    attributes = [attribute[0] for attribute in billing_cursor.description]
    billing_cursor.close()
    return render_template('billing.html', result=result, attributes=attributes)


@app.route('/tables/branch', methods=['GET', 'POST'])
def branch():
    branch_cursor = mydb.cursor()
    if request.method == 'POST':
        if 'branch_id' in request.form:
            # Insert new record
            branch_id = request.form['branch_id']
            branch_name = request.form['branch_name']
            branch_address = request.form['branch_address']

            sql = "INSERT INTO branch (branch_id, branch_name, branch_address) VALUES (%s, %s, %s)"
            values = (branch_id, branch_name, branch_address)
            branch_cursor.execute(sql, values)
            mydb.commit()

        elif 'delete' in request.form:
            # Delete record
            branch_id = request.form['delete']
            sql = "DELETE FROM branch WHERE branch_id = %s"
            values = (branch_id,)
            branch_cursor.execute(sql, values)
            mydb.commit()

    branch_cursor.execute("SELECT * FROM branch")
    result = branch_cursor.fetchall()
    attributes = [attribute[0] for attribute in branch_cursor.description]
    branch_cursor.close()
    return render_template('branch.html', result=result, attributes=attributes)


@app.route('/tables/non_medical_supplies', methods=['GET', 'POST'])
def non_medical_supplies():
    non_medical_supplies_cursor = mydb.cursor()
    if request.method == 'POST':
        if 'item_name' in request.form:
            # Insert new record
            item_name = request.form['item_name']
            quantity = request.form['quantity']
            supply_status = request.form['supply_status']
            manufacturer = request.form['manufacturer']

            sql = "INSERT INTO non_medical_supplies (item_name, quantity, supply_status, manufacturer) VALUES (%s, %s, %s, %s)"
            values = (item_name, quantity, supply_status, manufacturer)
            non_medical_supplies_cursor.execute(sql, values)
            mydb.commit()

        elif 'delete' in request.form:
            # Delete record
            item_name = request.form['delete']
            sql = "DELETE FROM non_medical_supplies WHERE item_name = %s"
            values = (item_name,)
            non_medical_supplies_cursor.execute(sql, values)
            mydb.commit()

    non_medical_supplies_cursor.execute("SELECT * FROM non_medical_supplies")
    result = non_medical_supplies_cursor.fetchall()
    attributes = [attribute[0]
                  for attribute in non_medical_supplies_cursor.description]
    non_medical_supplies_cursor.close()
    return render_template('non_medical_supplies.html', result=result, attributes=attributes)


@app.route('/tables/doctor_medication', methods=['GET', 'POST'])
def doctor_medication():
    doctor_medication_cursor = mydb.cursor()
    if request.method == 'POST':
        if 'doctor_id' in request.form:
            # Insert new record
            doctor_id = request.form['doctor_id']
            medication_id = request.form['medication_id']
            medication_dosage = request.form['medication_dosage']

            sql = "INSERT INTO doctor_medication (doctor_id, medication_id, medication_dosage) VALUES (%s, %s, %s)"
            values = (doctor_id, medication_id, medication_dosage)
            doctor_medication_cursor.execute(sql, values)
            mydb.commit()

        elif 'delete' in request.form:
            # Delete record
            doctor_id = request.form['delete']
            sql = "DELETE FROM doctor_medication WHERE doctor_id = %s"
            values = (doctor_id,)
            doctor_medication_cursor.execute(sql, values)
            mydb.commit()

    doctor_medication_cursor.execute("SELECT * FROM doctor_medication")
    result = doctor_medication_cursor.fetchall()
    attributes = [attribute[0]
                  for attribute in doctor_medication_cursor.description]
    doctor_medication_cursor.close()
    return render_template('doctor_medication.html', result=result, attributes=attributes)


@app.route('/tables/doctor_nurse', methods=['GET', 'POST'])
def doctor_nurse():
    doctor_nurse_cursor = mydb.cursor()
    if request.method == 'POST':
        if 'doctor_id' in request.form:
            # Insert new record
            doctor_id = request.form['doctor_id']
            nurse_id = request.form['nurse_id']

            sql = "INSERT INTO doctor_nurse (doctor_id, nurse_id) VALUES (%s, %s)"
            values = (doctor_id, nurse_id)
            doctor_nurse_cursor.execute(sql, values)
            mydb.commit()

        elif 'delete' in request.form:
            # Delete record
            doctor_id = request.form['delete']
            sql = "DELETE FROM doctor_nurse WHERE doctor_id = %s"
            values = (doctor_id,)
            doctor_nurse_cursor.execute(sql, values)
            mydb.commit()

    doctor_nurse_cursor.execute("SELECT * FROM doctor_nurse")
    result = doctor_nurse_cursor.fetchall()
    attributes = [attribute[0]
                  for attribute in doctor_nurse_cursor.description]
    doctor_nurse_cursor.close()
    return render_template('doctor_nurse.html', result=result, attributes=attributes)


@app.route('/tables/patient_nurse', methods=['GET', 'POST'])
def patient_nurse():
    patient_nurse_cursor = mydb.cursor()
    if request.method == 'POST':
        if 'patient_id' in request.form:
            # Insert new record
            patient_id = request.form['patient_id']
            nurse_id = request.form['nurse_id']
            sql = "INSERT INTO patient_nurse (patient_id, nurse_id) VALUES (%s, %s)"
            values = (patient_id, nurse_id)
            patient_nurse_cursor.execute(sql, values)
            mydb.commit()

        elif 'delete' in request.form:
            # Delete record
            patient_id = request.form['delete']
            sql = "DELETE FROM patient_nurse WHERE patient_id = %s"
            values = (patient_id,)
            patient_nurse_cursor.execute(sql, values)
            mydb.commit()

    patient_nurse_cursor.execute("SELECT * FROM patient_nurse")
    result = patient_nurse_cursor.fetchall()
    attributes = [attribute[0]
                  for attribute in patient_nurse_cursor.description]
    patient_nurse_cursor.close()
    return render_template('patient_nurse.html', result=result, attributes=attributes)


@app.route('/tables/patient_medication', methods=['GET', 'POST'])
def patient_medication():
    patient_medication_cursor = mydb.cursor()
    if request.method == 'POST':
        if 'patient_id' in request.form:
            # Insert new record
            patient_id = request.form['patient_id']
            medication_id = request.form['medication_id']

            sql = "INSERT INTO patient_medication (patient_id, medication_id) VALUES (%s, %s)"
            values = (patient_id, medication_id)
            patient_medication_cursor.execute(sql, values)
            mydb.commit()

        elif 'delete' in request.form:
            # Delete record
            patient_id = request.form['delete']
            sql = "DELETE FROM patient_medication WHERE patient_id = %s"
            values = (patient_id,)
            patient_medication_cursor.execute(sql, values)
            mydb.commit()

    patient_medication_cursor.execute("SELECT * FROM patient_medication")
    result = patient_medication_cursor.fetchall()
    attributes = [attribute[0]
                  for attribute in patient_medication_cursor.description]
    patient_medication_cursor.close()
    return render_template('patient_medication.html', result=result, attributes=attributes)


@app.route('/tables/department_medication', methods=['GET', 'POST'])
def department_medication():
    department_medication_cursor = mydb.cursor()
    if request.method == 'POST':
        if 'department_id' in request.form:
            # Insert new record
            department_id = request.form['department_id']
            medication_id = request.form['medication_id']

            sql = "INSERT INTO department_medication (department_id, medication_id) VALUES (%s, %s)"
            values = (department_id, medication_id)
            department_medication_cursor.execute(sql, values)
            mydb.commit()

        elif 'delete' in request.form:
            # Delete record
            department_id = request.form['delete']
            sql = "DELETE FROM department_medication WHERE department_id = %s"
            values = (department_id,)
            department_medication_cursor.execute(sql, values)
            mydb.commit()

    department_medication_cursor.execute("SELECT * FROM department_medication")
    result = department_medication_cursor.fetchall()
    attributes = [attribute[0]
                  for attribute in department_medication_cursor.description]
    department_medication_cursor.close()
    return render_template('department_medication.html', result=result, attributes=attributes)


@app.route('/tables/department_non_medical_supplies', methods=['GET', 'POST'])
def department_non_medical_supplies():
    department_non_medical_supplies_cursor = mydb.cursor()
    if request.method == 'POST':
        if 'department_id' in request.form:
            # Insert new record
            department_id = request.form['department_id']
            item_name = request.form['item_name']

            sql = "INSERT INTO department_non_medical_supplies (department_id, item_name) VALUES (%s, %s)"
            values = (department_id, item_name)
            department_non_medical_supplies_cursor.execute(sql, values)
            mydb.commit()

        elif 'delete' in request.form:
            # Delete record
            department_id = request.form['delete']
            sql = "DELETE FROM department_non_medical_supplies WHERE department_id = %s"
            values = (department_id,)
            department_non_medical_supplies_cursor.execute(sql, values)
            mydb.commit()

    department_non_medical_supplies_cursor.execute(
        "SELECT * FROM department_non_medical_supplies")
    result = department_non_medical_supplies_cursor.fetchall()
    attributes = [attribute[0]
                  for attribute in department_non_medical_supplies_cursor.description]
    department_non_medical_supplies_cursor.close()
    return render_template('department_non_medical_supplies.html', result=result, attributes=attributes)


if __name__ == '__main__':
    app.run(debug=True)

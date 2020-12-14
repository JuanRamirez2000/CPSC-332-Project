INSERT INTO doctor_backup SELECT * FROM doctor;
INSERT INTO doctor_specialty_backup SELECT * FROM doctor_specialty;
INSERT INTO doctor_specialty_audit_table_backup SELECT * FROM doctor_specialty_audit_table;
INSERT INTO patient_backup SELECT * FROM patient;
INSERT INTO appointment_backup SELECT * FROM appointment;
INSERT INTO prescription_backup SELECT * FROM prescription;
INSERT INTO test_backup SELECT * FROM test;
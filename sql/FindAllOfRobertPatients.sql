SELECT patient.patient_first_name, patient.patient_last_name, patient.primary_phone_number, doctor_first_name, doctor_last_name
FROM patient
INNER JOIN doctor
ON doctor_first_name = "Robert" AND doctor_last_name = "Stevens" AND patient.doctor_patient = doctor.doctor_id;
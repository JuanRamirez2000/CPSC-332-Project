SELECT doctor.doctor_first_name, doctor_last_name, prescription.prescription_name
FROM doctor
INNER JOIN prescription
ON prescription.prescription_name = "Vicodin" AND doctor.doctor_id = prescription.doctor_id;
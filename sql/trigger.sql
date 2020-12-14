CREATE TRIGGER Doctor_Specialty_Added
BEFORE INSERT
ON doctor_specialty
FOR EACH ROW
INSERT INTO doctor_specialty_audit_table VALUES (NEW.doctor_first_name, "added", NEW.specialty, CURRENT_DATE);

CREATE TRIGGER Doctor_Specialty_Updated
BEFORE UPDATE
ON doctor_specialty
FOR EACH ROW
INSERT INTO doctor_specialty_audit_table VALUES (NEW.doctor_first_name, "added", NEW.specialty, CURRENT_DATE);
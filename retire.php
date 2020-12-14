<?php
include "index.html";
$servername = "localhost";
$username = "root";
$password = "";
$database = "DocOffice";

$mysqli = new mysqli($servername, $username, $password, $database);

if ($mysqli -> connect_errno){
    echo "Failed to connect to MySQL " . $mysqli -> connect_error;
    exit();
}
$sql = "SELECT patient.patient_first_name, patient.patient_last_name, patient.primary_phone_number, doctor_first_name, doctor_last_name
        FROM patient
        INNER JOIN doctor
        ON doctor_first_name = 'Robert' AND doctor_last_name = 'Stevens' AND patient.doctor_patient = doctor.doctor_id;
";
$result = mysqli_query($mysqli, $sql);

        print "<table class=\"mx-auto my-20\">
            <thead class=\"bg-indigo-600 text-gray-100 text-2xl\">
                <tr>
                    <td class=\"border-2\"> Patient's Name </td>
                    <td class=\"border-2\"> Patient's Phone Number </td>
                    <td class=\"border-2\"> Doctor's Name </td>

                </tr>
             </thead>";
        print "<tbody class=\"bg-indigo-400 text-gray-100\">";
    while($row = mysqli_fetch_array($result)){
        print " <tr>
                    <td> $row[patient_first_name] $row[patient_last_name]</td>
                    <td> $row[primary_phone_number] </td>
                    <td> $row[doctor_first_name] $row[doctor_last_name]</td>
                </tr>";
    }
        print "</tbody>
        </table>";

?>
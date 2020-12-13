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
$sql = "SELECT patient.patient_name, patient.primary_phone_number, doctor_name
        FROM patient
        INNER JOIN doctor
        ON doctor_id = 1234567890 AND patient.doctor_patient = 1234567890;
";
$result = mysqli_query($mysqli, $sql);

        print "<table class=\"mx-auto my-20\">
            <thead class=\"bg-indigo-600 text-gray-100 text-2xl\">
                <tr>
                    <td class=\"border-2\"> Patient Name </td>
                    <td class=\"border-2\"> Patient Phone Number </td>
                    <td class=\"border-2\"> Doctor's Name </td>
                </tr>
             </thead>";
        print "<tbody class=\"bg-indigo-400 text-gray-100\">";
    while($row = mysqli_fetch_array($result)){
        print " <tr>
                    <td> $row[patient_name] </td>
                    <td> $row[primary_phone_number] </td>
                    <td> $row[doctor_name] </td>
                </tr>";
    }
        print "</tbody>
        </table>";

?>
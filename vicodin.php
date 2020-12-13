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
$sql = "SELECT doctor.doctor_name, prescription.prescription_name
        FROM doctor
        INNER JOIN prescription
        ON prescription.prescription_name = 'Vicodin' AND doctor.doctor_id = prescription.doctor_id;
";
        print "<table>
            <thead class=\"bg-indigo-600 text-gray-100\">
                <tr>
                    <td> Doctor's Name </td>
                    <td> Precription Name </td>
                </tr>
             </thead>";
        print "<tbody class=\"bg-indigo-400 text-gray-100\">";
$result = mysqli_query($mysqli, $sql);
    while($row = mysqli_fetch_array($result)){
        print " <tr>
                    <td> $row[doctor_name] </td>
                    <td> $row[prescription_name] </td>
                </tr>";
    }
        print "</tbody>
        </table>";
?>
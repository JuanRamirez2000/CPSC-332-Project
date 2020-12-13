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
$sql = "SELECT doctor_name, specialty
        FROM doctor;
";
$result = mysqli_query($mysqli, $sql);
        print "<table>
            <thead class=\"bg-indigo-600 text-gray-100\">
                <tr>
                    <td> Doctor's Name </td>
                    <td> Doctor's Specialty </td>
                </tr>
             </thead>";
        print "<tbody class=\"bg-indigo-400 text-gray-100\">";
    while($row = mysqli_fetch_array($result)){
        print " <tr>
                    <td> $row[doctor_name] </td>
                    <td> $row[specialty] </td>
                </tr>";
    }
        print "</tbody>
        </table>";
?>
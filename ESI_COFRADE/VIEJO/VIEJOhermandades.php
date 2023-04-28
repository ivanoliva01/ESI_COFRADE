<!DOCTYPE html>
<html>

<head>
    <title>Listado de Hermandades</title>
    <meta charset="UTF-8">
</head>

<body>

    <!DOCTYPE html>
    <html>

    <head>
        <title>Listado de Hermandades</title>
        <meta charset="UTF-8">
    </head>

    <body>
        <h1>Listado de Hermandades</h1>
        <?php

        // Conexión a la base de datos Oracle
        $conn = oci_connect('Ivan', 'huerto11', '//localhost:1521/XEPDB1');

        if (!$conn) {
            $e = oci_error();
            trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
        }
        
        // consulta SQL para obtener las hermandades
        $query = "SELECT h.nombre, m.nombre as ciudad, h.dia_salida 
        FROM hermandades h JOIN municipios m ON h.ciudad.id = m.id
        ORDER BY h.dia_salida, h.id";

        // preparar la consulta SQL
        $stmt = oci_parse($conn, $query);

        // ejecutar la consulta SQL
        oci_execute($stmt);

        // mostrar los resultados en una tabla HTML
        echo "<table>";
        echo "<tr><th>Nombre</th><th>Ciudad</th><th>Día de salida</th></tr>";
        while ($row = oci_fetch_array($stmt, OCI_ASSOC + OCI_RETURN_NULLS)) {
            echo "<tr>";
            echo "<td>" . $row['NOMBRE'] . "</td>";
            echo "<td>" . $row['CIUDAD'] . "</td>";
            echo "<td>" . $row['DIA_SALIDA'] . "</td>";
            echo "</tr>";
        }
        echo "</table>";

        // cerrar la conexión a la base de datos
        oci_free_statement($stmt);
        oci_close($conn);
        ?>

    </body>

    </html>
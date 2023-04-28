<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" /> <!-- COMENTARIO-->
    <title>ESI COFRADE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
    <link rel="stylesheet" href="css/estiloMenu.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
</head>

<body class="hermandad">
    <audio autoplay>
        <source src="/music/marcha3.mp3" type="audio/mpeg">
        tu navegador no es compatible con este audio
    </audio>

    <h1><img class="logo" src="/img/logo.jpg" alt="logo de mi web">
        <p>ESI COFRADE
        <p>
    </h1>
    <nav>
        <a class="btn" href="http://localhost:3000/menu.php">Inicio</a>
    </nav>
    <?php
    // Conexión a la base de datos Oracle
    $conn = oci_connect('System', 'MiCarmen', '//localhost:1521/XE');
    //$conn = oci_connect('Ivan', 'huerto11', '//localhost:1521/XEPDB1');
    if (!$conn) {
        $e = oci_error();
        trigger_error(htmlentities($e['Error de conexión'], ENT_QUOTES), E_USER_ERROR);
    }
    $nombre = $_GET["Nombre"];
    // consulta SQL
    $query =
        "SELECT h.nombre, h.anio_fundacion, h.dia_salida, m.nombre as ciudad
        FROM hermandades h JOIN municipios m ON h.ciudad.id = m.id
        WHERE h.nombre LIKE '" . $nombre . "'";
    $stmt = oci_parse($conn, $query); // preparar la consulta SQL
    oci_execute($stmt); // ejecutar la consulta SQL
    // Imprimir los datos de una hermandad en una tabla
    echo "<table>";
    while ($row1 = oci_fetch_array($stmt, OCI_ASSOC + OCI_RETURN_NULLS)) {
        echo "<tr><td><h4>Nombre:</h4></td><td>" . $row1['NOMBRE'] . "</td></tr>";
        echo "<tr><td><h4>Año de fundación:</h4></td><td>" . $row1['ANIO_FUNDACION'] . "</td></tr>";
        echo "<tr><td><h4>Dia de Salida:</h4></td><td>" . $row1['DIA_SALIDA'] . "</td></tr>";
        echo "<tr><td><h4>Ciudad:</h4></td><td>" . $row1['CIUDAD'] . "</td></tr>";
    }
    echo "</table>";
    oci_free_statement($stmt); // Cerrar la conexión
    
    // consulta SQL
    $query = "SELECT c.contenido as CURIOSIDAD
        FROM CURIOSIDADES c JOIN HERMANDADES h ON c.hermandad.nombre = h.nombre
        WHERE c.hermandad.nombre LIKE '" . $nombre . "'";
    $stmt = oci_parse($conn, $query); // preparar la consulta SQL
    oci_execute($stmt); // ejecutar la consulta SQL
    
    // imprimir la lista de curiosidades en una tabla
    
    echo "<table>";
    $row = oci_fetch_array($stmt, OCI_ASSOC + OCI_RETURN_NULLS);
    echo "<tr><td><h4>Curiosidades</h4></td></tr>";
    if ($row == null)
        echo "<tr><td>Vaya... no tenemos curiosidades para esta hermandad. Sé el primero en contarnos una:</td></tr>";
    else {
        do {
            echo "<tr><td>" . $row['CURIOSIDAD'] . "</td></tr>";
        } while (($row = oci_fetch_array($stmt, OCI_ASSOC + OCI_RETURN_NULLS)));
    }
    echo "</table>";

    // Cerrar la conexión
    oci_free_statement($stmt);
    oci_close($conn);
    ?>

    <table>
        <tr>
            <td>
                <h4>AÑADIR UNA CURIOSIDAD: </h4>
                <form action="addCuriosidad.php" method="GET">
                    <input type="hidden" id="Hermandad" name="Hermandad" value="<?php echo $nombre ?>">
                    <input type="text" id="Curiosidad" name="Curiosidad">
                    <input type="submit" value="Enviar">
                </form>
            </td>
            <td>
                <h4>HAZTE HERMANO: </h4>
                <form action="addHermano.php" method="GET">
                    <input type="hidden" id="Hermandad" name="Hermandad" value="<?php echo $nombre ?>">
                    <input type="submit" value="HAZTE HERMANO">
                </form>
            </td>
        </tr>
    </table>

</body>

</html>
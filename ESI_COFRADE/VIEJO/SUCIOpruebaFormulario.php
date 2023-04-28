<!DOCTYPE html>
<html>

<head>
    <title>Listado de Hermandades</title>
    <meta charset="UTF-8">
</head>

<body>
    <?php
    // Conexión a la base de datos Oracle
    $conn = oci_connect('System', 'MiCarmen', '//localhost:1521/XE');

    if (!$conn) {
        $e = oci_error();
        trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
    }

    // consulta SQL
    
    echo $query;
    // preparar la consulta SQL
    $stmt = oci_parse($conn, $query);

    // ejecutar la consulta SQL
    oci_execute($stmt);

    // imprimir la lista de curiosidades
    while ($row = oci_fetch_array($stmt, OCI_ASSOC + OCI_RETURN_NULLS)) {
        echo "Curiosidad 1:" . $row['CONTENIDO'] . "<br/>";
    }
    // Cerrar la conexión
    oci_free_statement($stmt);
    oci_close($conn);
    ?>
</body>

</html>
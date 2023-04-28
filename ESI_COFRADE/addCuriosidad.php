<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <title>ESI COFRADE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
    <link rel="stylesheet" href="css/estiloMenu.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />

</head>

<body>
    <h1>INTENTANDO CONECTAR</H1>
    <?php
    $conn = oci_connect('System', 'MiCarmen', '//localhost:1521/XE');
    // $conn = oci_connect('Ivan', 'huerto11', '//localhost:1521/XEPDB1');
    if (!$conn) {
        $e = oci_error();
        trigger_error(htmlentities($e['NO HAY CONEXION'], ENT_QUOTES), E_USER_ERROR);
    }
    $curiosidad = $_GET["Curiosidad"];
    $hermandad = $_GET["Hermandad"];
    echo $curiosidad, $hermandad;
    // consulta SQL
    $query =
        "BEGIN PaqueteHermandad.InsertarCuriosidad(
        p_nombreHermandad => '" . $hermandad . "',
        p_curiosidad => '" . $curiosidad . "'
        ); END; ";
    
    $stmt = oci_parse($conn, $query); // preparar la consulta SQL
    oci_execute($stmt); // ejecutar la consulta SQL
    ?>
    <h1> Su curiosidad se ha añadido exitosamente </h1>
    <button onclick="window.location.href='hermandad.php?Nombre=<?php echo $hermandad ?>'">Volver</button>
</body>

</html>
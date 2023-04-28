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

<body class="hermandades_municipio">
<audio  autoplay>
  <source src="/music/marcha2.mp3" type="audio/mpeg">
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
    // consulta SQL
    $query1 = "SELECT nombre as nombre
        FROM hermandades h WHERE h.dia_salida LIKE '" . $_GET["DiaSemana"] . "'
        AND h.ciudad.nombre LIKE '" . $_GET["Municipio"] . "'";
    $stmt1 = oci_parse($conn, $query1); // preparar la consulta SQL
    oci_execute($stmt1); // ejecutar la consulta SQL
    // Mostrar menu de las hermandades que salen ese dia en esa ciudad
    echo '<ul class="menu">';
    while ($row = oci_fetch_array($stmt1, OCI_ASSOC + OCI_RETURN_NULLS)) {
        echo '<li><a href="hermandad.php?Nombre=' . $row['NOMBRE'] . '">' . $row["NOMBRE"] . '</a></li>';
    }
    ?>
    </ul>
</body>

</html>
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


<body class="home">
    <?php
    // Conexión a la base de datos Oracle
    $conn = oci_connect('System', 'MiCarmen', '//localhost:1521/XE');
    // $conn = oci_connect('Ivan', 'huerto11', '//localhost:1521/XEPDB1');
    if (!$conn) {
        $e = oci_error();
        trigger_error(htmlentities($e['Error de conexión'], ENT_QUOTES), E_USER_ERROR);
    }
    // consulta SQL
    $query1 = "SELECT nombre FROM municipios";
    $stmt1 = oci_parse($conn, $query1); // preparar la consulta SQL
    oci_execute($stmt1); // ejecutar la consulta SQL
    ?>



<audio autoplay>
  <source src="music/marcha1.mp3" type="audio/mpeg">
  tu navegador no es compatible con este audio
</audio>

<h1><img class="logo" src="img/logo.jpg" alt="logo de mi web">
        <p>ESI COFRADE
        <p>
</h1>

<nav>
<a class="btn" href="http://localhost:3000/menu.php">Inicio</a>
</nav>

<ul class="menu">
    <!-- Encabezado con título y logo de la página -->
    <li>
        <div class="Desplegable">
            <p><b>Despliega para ver hermandades</b><i class="icono derecha fa fa-chevron-down" aria-hidden="true"></i></p>
        </div>
        <ul class="submenu">
            <?php
            while ($row = oci_fetch_array($stmt1, OCI_ASSOC + OCI_RETURN_NULLS)) {
                echo '<li><a href="#">' . $row['NOMBRE'] . '<i class="icono derecha fa fa-chevron-down" aria-hidden="true"></i></a>';
                echo '<ul>';
                echo '<li><a href="hermandad_dia_municipio.php?Municipio=' . $row['NOMBRE'] . '&DiaSemana=Viernes de Dolores">Viernes de Dolores</a></li>';
                echo '<li><a href="hermandad_dia_municipio.php?Municipio=' . $row['NOMBRE'] . '&DiaSemana=Sabado de Pasion">Sábado de Pasion</a></li>';
                echo '<li><a href="hermandad_dia_municipio.php?Municipio=' . $row['NOMBRE'] . '&DiaSemana=Domingo de Ramos">Domingo de Ramos</a></li>';
                echo '<li><a href="hermandad_dia_municipio.php?Municipio=' . $row['NOMBRE'] . '&DiaSemana=Lunes Santo">Lunes Santo</a></li>';
                echo '<li><a href="hermandad_dia_municipio.php?Municipio=' . $row['NOMBRE'] . '&DiaSemana=Martes Santo">Martes Santo</a></li>';
                echo '<li><a href="hermandad_dia_municipio.php?Municipio=' . $row['NOMBRE'] . '&DiaSemana=Miercoles Santo">Miercoles Santo</a></li>';
                echo '<li><a href="hermandad_dia_municipio.php?Municipio=' . $row['NOMBRE'] . '&DiaSemana=Jueves Santo">Jueves Santo</a></li>';
                echo '<li><a href="hermandad_dia_municipio.php?Municipio=' . $row['NOMBRE'] . '&DiaSemana=Madrugada">Madrugada</a></li>';
                echo '<li><a href="hermandad_dia_municipio.php?Municipio=' . $row['NOMBRE'] . '&DiaSemana=Viernes Santo">Viernes Santo</a></li>';
                echo '<li><a href="hermandad_dia_municipio.php?Municipio=' . $row['NOMBRE'] . '&DiaSemana=Sabado Santo">Sábado Santo</a></li>';
                echo '<li><a href="hermandad_dia_municipio.php?Municipio=' . $row['NOMBRE'] . '&DiaSemana=Domingo de Resurreccion">Domingo de Resurreccion</a></li>';
                echo '</ul></li>';
            }
            // Cerrar la conexión
            oci_free_statement($stmt1);
            oci_close($conn);
            ?>
        </ul>
    </li>
</ul>

</body>



</html>
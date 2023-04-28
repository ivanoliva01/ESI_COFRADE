<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <title>SICA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
    <link rel="stylesheet" href="css/estilos.css" />

    <link rel="stylesheet" href="css/estiloMenu.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />

</head>

<body>

    <header id="menu">
        <header id="logo">
            <a href="index.php">
                <img src="img/logo.png" />
            </a>
        </header>
        <ul class="menu">
            <li><a href="#"><i class="icono izquierda fa fa-cogs" aria-hidden="true"></i>ESICOFRADE<i
                        class="icono derecha fa fa-chevron-down" aria-hidden="true"></i></a>
                <ul class="submenu">
                    <li>
                        <form action="hermandad_dia_municipio.php" method="GET">
                            <select id="DiaSemana" name="DiaSemana">
                                <option value="Viernes Santo">"Viernes santo"</option>
                                <option value="Sabado Santo">"Sabado santo"</option>

                            </select>
                            <input type="submit" value="enviar">
                            <label for="Municipio">Municipio</label>
                            <input type="text" id="Municipio" name="Municipio">
                    </li>
                    
                </ul>
            </li>
        </ul>
    </header>

    <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="..." class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="..." class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="..." class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

</body>

</html>
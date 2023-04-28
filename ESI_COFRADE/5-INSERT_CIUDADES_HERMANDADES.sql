 -- Ciudades Sevilla y Cadiz
INSERT INTO MUNICIPIOS (nombre) VALUES ('Sevilla');
INSERT INTO MUNICIPIOS (nombre) VALUES ('Cadiz');
-- Tabla temporal que almacena los datos de la hermandad y el nombre de su ciudad
CREATE GLOBAL TEMPORARY TABLE hermandades_temp (
  nombre VARCHAR2(50),
  anio_fundacion NUMBER,
  dia_salida VARCHAR2(50),
  ciudad VARCHAR2(30)
);
/
-- DATOS SEVILLA
INSERT INTO hermandades_temp (nombre, anio_fundacion, dia_salida, ciudad)
SELECT 'Hermandad de Pino Montano',                   1982, 'Viernes de Dolores', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Hermandad de La Mision',                      1949, 'Viernes de Dolores', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Hermandad de Bellavista',                     1992, 'Viernes de Dolores', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Hermandad de Pasion y Muerte',                1991, 'Viernes de Dolores', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Hermandad de La Corona',                      1340, 'Viernes de Dolores', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Hermandad del Divino Perdon',                 1990, 'Sabado de Pasion', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Hermandad de Padre Pio',                      2005, 'Sabado de Pasion', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Hermandad de los Dolores',                    1994, 'Sabado de Pasion', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Hermandad de La Milagrosa',                   1998, 'Sabado de Pasion', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Hermandad de San Jose Obrero',                1960, 'Sabado de Pasion', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Jesus Despojado',                             1936, 'Domingo de Ramos', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La Paz',                                      1939, 'Domingo de Ramos', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La Cena',                                     1580, 'Domingo de Ramos', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La Hiniesta',                                 1412, 'Domingo de Ramos', 'Sevilla' FROM DUAL UNION ALL
SELECT 'San Roque',                                   1901, 'Domingo de Ramos', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La Estrella',                                 1560, 'Domingo de Ramos', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La Amargura',                                 1893, 'Domingo de Ramos', 'Sevilla' FROM DUAL UNION ALL
SELECT 'El Amor',                                     1508, 'Domingo de Ramos', 'Sevilla' FROM DUAL UNION ALL
SELECT 'San Pablo',                                   2005, 'Lunes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La Redencion',                                1955, 'Lunes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Santa Genoveva',                              1956, 'Lunes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Santa Marta',                                 1948, 'Lunes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'San Gonzalo',                                 1942, 'Lunes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Veracruz',                                    1448, 'Lunes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Las Penas',                                   1875, 'Lunes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Las Aguas',                                   1750, 'Lunes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'El Museo',                                    1575, 'Lunes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'El Cerro',                                    1944, 'Martes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Los Javieres',                                1955, 'Martes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'San Esteban',                                 1926, 'Martes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Los Estudiantes',                             1924, 'Martes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'San Benito',                                  1554, 'Martes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La Candelaria',                               1921, 'Martes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'El Dulce nombre',                             1584, 'Martes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Santa Cruz',                                  1904, 'Martes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Carmen Doloroso',                             1982, 'Miercoles Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La Sed',                                      1969, 'Miercoles Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'San Bernardo',                                1748, 'Miercoles Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'El Buen Fin',                                 1590, 'Miercoles Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La Lanzada',                                  1595, 'Miercoles Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'El Baratillo',                                1693, 'Miercoles Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Cristo de Burgos',                            1943, 'Miercoles Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Las Siete Palabras',                          1561, 'Miercoles Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Los Panaderos',                               1601, 'Miercoles Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Los Negritos',                                1393, 'Jueves Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La Exaltacion',                               1660, 'Jueves Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Las Cigarreras',                              1563, 'Jueves Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Montesion',                                   1560, 'Jueves Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La Quinta Angustia',                          1500, 'Jueves Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'El Valle',                                    1590, 'Jueves Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Pasion',                                      1535, 'Jueves Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'El Silencio',                                 1340, 'Madrugada', 'Sevilla' FROM DUAL UNION ALL
SELECT 'El Gran Poder',                               1431, 'Madrugada', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Macarena',                                    1595, 'Madrugada', 'Sevilla' FROM DUAL UNION ALL
SELECT 'El Calvario',                                 1571, 'Madrugada', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Esperanza de Triana',                         1418, 'Madrugada', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Los Gitanos',                                 1753, 'Madrugada', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La Carreteria',                               1550, 'Viernes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La Soledad de San Buenaventura',              1847, 'Viernes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'El Cachorro',                                 1689, 'Viernes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La O',                                        1566, 'Viernes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'San Isidoro',                                 1605, 'Viernes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Montserrat',                                  1601, 'Viernes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La Sagrada Mortaja',                          1592, 'Viernes Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'El Sol',                                      1932, 'Sabado Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Los Servitas',                                1696, 'Sabado Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La Trinidad',                                 1507, 'Sabado Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'Santo Entierro',                              1570, 'Sabado Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La Soledad de San Lorenzo',                   1575, 'Sabado Santo', 'Sevilla' FROM DUAL UNION ALL
SELECT 'La Resurreccion',                             1969, 'Domingo de Resurreccion', 'Sevilla' FROM DUAL UNION ALL
-- DATOS CADIZ
SELECT 'Orden Tercera de Servitas',                   1735, 'Viernes de Dolores', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Archicofradia de la Merced',                  1626, 'Sabado de Pasion', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de la Borriquita',                  1944, 'Domingo de Ramos', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de Jesus Despojado',                2007, 'Domingo de Ramos', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de la Cena',                        1963, 'Domingo de Ramos', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de las Penas',                      1977, 'Domingo de Ramos', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de Humildad y Paciencia',           1621, 'Domingo de Ramos', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de la Palma',                       1961, 'Lunes Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad del Prendimiento',                  1976, 'Lunes Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad del Nazareno del Amor',             1951, 'Lunes Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de la Vera Cruz',                   1566, 'Lunes Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de Jesus Caido (Universitarios)',   1942, 'Martes Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad del Ecce Homo',                     1668, 'Martes Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de la Columna',                     1660, 'Martes Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de la Piedad',                      1731, 'Martes Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de la Sanidad',                     1946, 'Martes Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de las Cigarreras',                 1912, 'Miercoles Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de Sentencia (Estudiantes)',        1929, 'Miercoles Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de las Aguas',                      1944, 'Miercoles Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de la Virgen de las Angustias',     1748, 'Miercoles Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de la Oracion en el Huerto',        1955, 'Jueves Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de los Afligidos',                  1726, 'Jueves Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de Medinaceli',                     1938, 'Jueves Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de Jesus Nazareno',                 1590, 'Jueves Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad del Perdon',                        1935, 'Madrugada', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad del Descendimiento',                1664, 'Viernes Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de la Expiracion',                  1944, 'Viernes Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de las Siete Palabras',             1944, 'Viernes Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad de la Buena Muerte',                1894, 'Viernes Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Congregacion Ecce Mater Tua',                 1953, 'Sabado Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad del Santo Entierro',                1601, 'Sabado Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Archicofradia de la Resurrecion',                 1660, 'Domingo de Resurreccion', 'Cadiz' FROM DUAL ;
/
-- Script PL/SQL para insertar los datos de la tabla temporal
DECLARE
  CURSOR c_hermandad IS SELECT * FROM hermandades_temp;
  v_nombre_hermandad hermandades_temp.nombre%TYPE;
  v_anio_fundacion hermandades_temp.anio_fundacion%TYPE;
  v_dia_salida hermandades_temp.dia_salida%TYPE;
  v_nombre_ciudad hermandades_temp.ciudad%TYPE;
BEGIN
  FOR r_hermandad IN c_hermandad LOOP
    v_nombre_hermandad := r_hermandad.nombre;
    v_anio_fundacion := r_hermandad.anio_fundacion;
    v_dia_salida := r_hermandad.dia_salida;
    v_nombre_ciudad := r_hermandad.ciudad;
    PaqueteHermandad.InsertarHermandad(
      p_nombre => v_nombre_hermandad,
      p_anio_fundacion => v_anio_fundacion,
      p_dia_salida => v_dia_salida,
      p_ciudad => v_nombre_ciudad
    );
  END LOOP;
END;
/
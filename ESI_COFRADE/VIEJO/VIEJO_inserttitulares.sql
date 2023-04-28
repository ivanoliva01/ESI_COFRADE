-- Tabla temporal que almacena los datos del titular y el nombre de su hermandad
CREATE GLOBAL TEMPORARY TABLE titulares_temp (
  nombre VARCHAR2(30),
  nombre_hermandad VARCHAR2(50),
  autor VARCHAR(30),
  anio_realizacion NUMBER
);
/
-- DATOS SEVILLA
INSERT INTO titulares_temp (nombre, nombre_hermandad, autor, anio_realizacion)
SELECT '', 'Hermandad de Pino Montano',                   'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de La Mision',                      'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de Bellavista',                     'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de Pasion y Muerte',                'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de La Corona',                      'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad del Divino Perdon',                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de Padre Pio',                      'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de los Dolores',                    'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de La Milagrosa',                   'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de San Jose Obrero',                'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Jesus Despojado',                             'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La Paz',                                      'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La Cena',                                     'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La Hiniesta',                                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'San Roque',                                   'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La Estrella',                                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La Amargura',                                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'El Amor',                                     'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'San Pablo',                                   'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La Redencion',                                'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Santa Genoveva',                              'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Santa Marta',                                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'San Gonzalo',                                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Veracruz',                                    'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Las Penas',                                   'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Las Aguas',                                   'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'El Museo',                                    'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'El Cerro',                                    'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Los Javieres',                                'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'San Esteban',                                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Los Estudiantes',                             'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'San Benito',                                  'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La Candelaria',                               'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'El Dulce nombre',                             'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Santa Cruz',                                  'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Carmen Doloroso',                             'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La Sed',                                      'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'San Bernardo',                                'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'El Buen Fin',                                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La Lanzada',                                  'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'El Baratillo',                                'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Cristo de Burgos',                            'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Las Siete Palabras',                          'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Los Panaderos',                               'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Los Negritos',                                'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La Exaltacion',                               'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Las Cigarreras',                              'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Montesion',                                   'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La Quinta Angustia',                          'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'El Valle',                                    'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Pasion',                                      'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'El Silencio',                                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'El Gran Poder',                               'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Macarena',                                    'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'El Calvario',                                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Esperanza de Triana',                         'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Los Gitanos',                                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La Carreteria',                               'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La Soledad de San Buenaventura',              'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'El Cachorro',                                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La O',                                        'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'San Isidoro',                                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Montserrat',                                  'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La Sagrada Mortaja',                          'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'El Sol',                                      'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Los Servitas',                                'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La Trinidad',                                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Santo Entierro',                              'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La Soledad de San Lorenzo',                   'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'La Resurreccion',                             'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
-- DATOS CADIZ
SELECT '', 'Orden Tercera de Servitas',                   'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Archicofradia de la Merced',                  'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Borriquita',                  'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Borriquita',                  'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de Jesus Despojado',                'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Cena',                        'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de las Penas',                      'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de las Penas',                      'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de Humildad y Paciencia',           'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de Humildad y Paciencia',           'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Palma',                       'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Palma',                       'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad del Prendimiento',                  'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad del Prendimiento',                  'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad del Nazareno del Amor',             'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad del Nazareno del Amor',             'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Vera Cruz',                   'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Vera Cruz',                   'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de Jesus Caido (Universitarios)',   'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de Jesus Caido (Universitarios)',   'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad del Ecce Homo',                     'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad del Ecce Homo',                     'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Columna',                     'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Columna',                     'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Columna',                     'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Piedad',                      'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Piedad',                      'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Sanidad',                     'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Sanidad',                     'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de las Cigarreras',                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de las Cigarreras',                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de Sentencia (Estudiantes)',        'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de Sentencia (Estudiantes)',        'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de las Aguas',                      'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de las Aguas',                      'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de las Aguas',                      'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Virgen de las Angustias',     'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Oracion en el Huerto',        'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Oracion en el Huerto',        'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de los Afligidos',                  'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de Medinaceli',                     'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de Medinaceli',                     'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de Jesus Nazareno',                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de Jesus Nazareno',                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad del Perdon',                        'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad del Perdon',                        'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad del Descendimiento',                'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Expiracion',                  'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL 
SELECT '', 'Hermandad de la Expiracion',                  'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL 
SELECT '', 'Hermandad de las Siete Palabras',             'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad de la Buena Muerte',                'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Congregacion Ecce Mater Tua',                 'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad del Santo Entierro',                'AUTOR', AÑO_REALIZACIÓN FROM DUAL UNION ALL
SELECT '', 'Hermandad del Santo Entierro',                'AUTOR', AÑO_REALIZACIÓN FROM DUAL
/
-- Script PL/SQL para insertar los datos de la tabla temporal
DECLARE
  CURSOR c_titulares IS SELECT * FROM titulares_temp;
  v_nombre titulares_temp.nombre%TYPE;
  v_nombre_hermandad titulares_temp.anio_fundacion%TYPE;
  v_autor titulares_temp.dia_salida%TYPE;
  v_anio_realizacion titulares_temp.ciudad%TYPE;
BEGIN
  FOR r_titular IN c_titulares LOOP
    v_nombre := r_titular.nombre;
    v_nombre_hermandad := r_titular.nombre_hermandad;
    v_autor := r_titular.autor;
    v_anio_realizacion := r_titular.anio_realizacion;
    PaqueteHermandad.InsertarTitular(
      p_nombre => v_nombre,
      p_autor => v_autor,
      p_anio_realizacion => v_anio_fundacion,
      p_nombreHermandad => v_nombre_hermandad
    );
  END LOOP;
END;
/
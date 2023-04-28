-- Tabla temporal que almacena los datos del titular y el nombre de su hermandad
CREATE GLOBAL TEMPORARY TABLE titulares_temp (
  nombre VARCHAR2(100),
  nombre_hermandad VARCHAR2(50),
  autor VARCHAR2(50),
  anio_realizacion NUMBER
);
/
-- DATOS SEVILLA
INSERT INTO titulares_temp (nombre, nombre_hermandad, autor, anio_realizacion)
SELECT 'Nuestro Padre Jesus de Nazaret', 'Hermandad de Pino Montano','Fernando Castejon', 1994  FROM DUAL UNION ALL
SELECT 'Maria Santisima del Amor', 'Hermandad de Pino Montano', 'Fernando Castejon', 1998 FROM DUAL UNION ALL
SELECT 'Nuestro Padre jesus de la Mision', 'Hermandad de La Mision','Jose Manuel Bonilla',1998  FROM DUAL UNION ALL
SELECT 'Maria Santisima del Amparo', 'Hermandad de La Mision', 'Miguel Lainez Capote', 1967  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Salud y Remedios', 'Hermandad de Bellavista',' Antonio Castillo Lastrucci ', 1964  FROM DUAL UNION ALL
SELECT 'Maria Santisima del Dulce Nombre', 'Hermandad de Bellavista','Luis Alvarez Duarte', 1969  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de Pasion y Muerte ', 'Hermandad de Pasion y Muerte','Jose Antonio Navarro Arteaga', 1996  FROM DUAL UNION ALL
SELECT 'Maria Santisima del Consuelo y Visitacion', 'Hermandad de Pasion y Muerte','Jose Antonio Navarro Arteaga', 1996  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Corona', 'Hermandad de La Corona', NULL, NULL  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus del Divino Perdon', 'Hermandad del Divino Perdon','Jose Antonio Navarro Arteaga', 2001  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Purisima Concepcion', 'Hermandad del Divino Perdon','Jose Antonio Navarro Arteaga', 2002  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Salud', 'Hermandad de Padre Pio','Fernando Murciano',1996  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Divina Gracia', 'Hermandad de Padre Pio', 'Luis Alvarez Duarte', 1996  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus Cautivo Ante Pilatos', 'Hermandad de los Dolores','Jesus Mendez Lastrucci', 1991  FROM DUAL UNION ALL
SELECT 'Maria Santisima de los Dolores', 'Hermandad de los Dolores','Jose Maria Gamero', 1988  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus en el Puente del Cedron', 'Hermandad de La Milagrosa','Jose Antonio Navarro Arteaga', 2008 FROM DUAL UNION ALL
SELECT 'Maria Santisima del Rosario', 'Hermandad de La Milagrosa','Buiza', 1963  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Caridad', 'Hermandad de San Jose Obrero','Jose Aguado Fernandez', 2012  FROM DUAL UNION ALL
SELECT 'Maria Santisima de los Dolores', 'Hermandad de San Jose Obrero','Luis Alvarez Duarte', 1962  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus Despojado de sus Vestiduras','Jesus Despojado','Antonio Perea',1939  FROM DUAL UNION ALL
SELECT 'Maria Santisima de los Dolores y Misericordia','Jesus Despojado','Antonio Eslava',1962 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Victoria', 'La Paz','Antonio Illanes', 1940  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Paz Coronada', 'La Paz','Antonio Illanes', 1939 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Cena', 'La Cena', 'Sebastian Santos', 1955  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Humildad y Paciencia', 'La Cena', NULL,NULL  FROM DUAL UNION ALL
SELECT 'Maria Santisima del Subterraneo', 'La Cena', 'Juan de Astorga', 1829  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Buena Muerte', 'La Hiniesta','Antonio Castillo Lastrucci', 1938 FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Hiniesta', 'La Hiniesta','Antonio Castillo Lastrucci', 1937 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de las Penas', 'San Roque','Antonio Illanes ', 1939 FROM DUAL UNION ALL
SELECT 'Maria Santisima de Gracia y Esperanza Coronada', 'San Roque','Fernandez Andes', 1838  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de las Penas', 'La Estrella','Jose de Arce', 1655  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Estrella', 'La Estrella', NULL,  NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus del Silencio Blanco','La Amargura', 'Pedro Roldan',1698  FROM DUAL UNION ALL
SELECT 'Maria Santisima de', 'La Amargura',NULL, NULL  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Sagrada Entrada en Jerusalen', 'El Amor',NULL,  NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus del Amor', 'El Amor','Juan de Mesa', 1620 FROM DUAL UNION ALL
SELECT 'Maria Santisima del Socorro', 'El Amor',NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus Cautivo y Rescatado', 'San Pablo','Luis Alvarez Duarte', 1992  FROM DUAL UNION ALL
SELECT 'Maria Santisima del Rosario Doloroso', 'San Pablo','Luis Alvarez Duarte', 2008  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Redencion', 'La Redencion','Castillo Lastrucci', 1958  FROM DUAL UNION ALL
SELECT 'Maria Santisima del Rocio', 'La Redencion','Castillo Lastrucci', 1959  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus Cautivo', 'Santa Genoveva','Paz Velez', 1957 FROM DUAL UNION ALL
SELECT 'Maria Santisima de las Mercedes Coronada', 'Santa Genoveva', 'Paz Velez', 1956  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Caridad', 'Santa Marta','Ortega Bru', 1953  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Caridad', 'Santa Marta','Sebastian Santos', 1950  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus del Soberano Poder', 'San Gonzalo','Ortega Bru', 1975 FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Salud', 'San Gonzalo','Castillo Lastrucci', 1977 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Vera Cruz', 'Veracruz', NULL, NULL FROM DUAL UNION ALL
SELECT 'Maria Santisima de las Tristezas', 'Veracruz','Illanes', 1942 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de las Penas', 'Las Penas',NULL, NULL FROM DUAL UNION ALL
SELECT 'Maria Santisima de los Dolores', 'Las Penas',NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus', 'Las Aguas','Illanes', 1942 FROM DUAL UNION ALL
SELECT 'Maria Santisima de', 'Las Aguas','Luis Alvarez Duarte', 1965  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Expiracion', 'El Museo','Marcos Cabrera', 1575  FROM DUAL UNION ALL
SELECT 'Maria Santisima de las Aguas', 'El Museo','Cristobal Ramos', 1772  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus del Desamparo y Abandono', 'El Cerro',NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Humildad', 'El Cerro', NULL, NULL FROM DUAL UNION ALL
SELECT 'Maria Santisima de los Dolores Coronada', 'El Cerro', 'Sebastian Santos', 1955  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de las Almas', 'Los Javieres',  'Pires Azcarraga', 1945 FROM DUAL UNION ALL
SELECT 'Maria Santisima de Gracia y Amparo', 'Los Javieres', 'Fernandez Andes', 1945 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Salud y Buen Viaje', 'San Esteban', NULL, NULL FROM DUAL UNION ALL
SELECT 'Maria Santisima de los Desamparados', 'San Esteban', 'Manuel Galiano', 1923  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Buena Muerte', 'Los Estudiantes', 'Juan de Mesa', 1620  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Angustia', 'Los Estudiantes', 'Juan de Astorga', 1817  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Presentacion al Pueblo', 'San Benito', 'Lastrucci', 1928  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Sangre', 'San Benito', 'Buiza', 1966 FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Encarnacion Coronada', 'San Benito', NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Salud', 'La Candelaria', NULL, NULL FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Candelaria', 'La Candelaria',  'Manuel Galiano', 1923  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus ante Anas', 'El Dulce nombre',    'Antonio Castillo Lastrucci', 1923 FROM DUAL UNION ALL
SELECT 'Maria Santisima del Dulce Nombre', 'El Dulce nombre',    'Antonio Castillo Lastrucci', 1923 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de las Misericordias', 'Santa Cruz',        NULL, NULL  FROM DUAL UNION ALL
SELECT 'Maria Santisima de los Dolores', 'Santa Cruz',         'Antonio Eslava', 1967 FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Antigua', 'Santa Cruz',         'Emilio Pizarro', 1904 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus la Paz', 'Carmen Doloroso',    'Villadiego', 1996  FROM DUAL UNION ALL
SELECT 'Maria Santisima del Carmen en sus Misterios Dolorosos', 'Carmen Doloroso',    'Francisco Berlanga', 1984  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Sed', 'La Sed',             'Luis Alvarez Duarte', 1970  FROM DUAL UNION ALL
SELECT 'Maria Santisima de Consolacion', 'La Sed',             'Dube de Luque', 1969 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus', 'San Bernardo',       'Andres Cansino', 1669  FROM DUAL UNION ALL
SELECT 'Maria Santisima del Refugio', 'San Bernardo',       'Sebastian Santos', 1938  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus del Buen Fin', 'El Buen Fin',        'Sebastian Rodriguez', 1645  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Palma Coronada', 'El Buen Fin', NULL, NULL  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Lanzada', 'La Lanzada', 'Antonio Illanes', 1929 FROM DUAL UNION ALL
SELECT 'Maria Santisima de Guia', 'La Lanzada', 'Antonio Illanes',  1971 FROM DUAL UNION ALL
SELECT 'Maria Santisima del Buen Fin', 'La Lanzada', ' Juan de Astorga ', 1810  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Misericordia', 'El Baratillo',       'Luis Ortega Bru', 1950 FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Piedad', 'El Baratillo',       'Ferna�?ndez Andes ', 1945 FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Caridad Coronada', 'El Baratillo',       'Ferna�?ndez Andes ', 1941 FROM DUAL UNION ALL
SELECT 'Santisimo Cristo de Burgos', 'Cristo de Burgos',   ' Juan Bautista Va�?zquez', 1573 FROM DUAL UNION ALL
SELECT 'Madre de Dios de la Palma', 'Cristo de Burgos',   'Gutierrez-Reyes', 1894 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de las Siete Palabras', 'Las Siete Palabras', 'Felipe Martinez', NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Divina Misericordia', 'Las Siete Palabras', 'Felipe de Rivas', 1641  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Cabeza', 'Las Siete Palabras', 'Emilio Pizarro', 1878 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus del Soberano Poder en su Prendimiento', 'Los Panaderos',      'Antonio Castillo Lastrucci', 1945 FROM DUAL UNION ALL
SELECT 'Maria Santisima de Regla Coronada', 'Los Panaderos', NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Fundacion', 'Los Negritos','Andres de Ocampo', 1622  FROM DUAL UNION ALL
SELECT 'Maria Santisima de los Angeles Coronada', 'Los Negritos', NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Exaltacion', 'La Exaltacion', 'Pedro Roldan', 1628  FROM DUAL UNION ALL
SELECT 'Maria Santisima de las Lagrimas', 'La Exaltacion', NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Sagrada Columna y Azotes', 'Las Cigarreras',     'Buiza', 1974  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Victoria Coronada', 'Las Cigarreras',NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Oracion en el Huerto', 'Montesion','Pedro Roldan', 1675  FROM DUAL UNION ALL
SELECT 'Maria Santisima del Rosario Coronada en sus Misterios Dolorosos', 'Montesion',   NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus del Sagrado Descendimiento', 'La Quinta Angustia', 'Pedro Roldan', 1659 FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Quinta Angustia', 'La Quinta Angustia', 'Vidente Rodriguez-Caso', 1934  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Coronacion de Espinas', 'El Valle','Agustin Perea', 1687 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus con la Cruz al Hombro', 'El Valle', NULL, NULL FROM DUAL UNION ALL
SELECT 'Maria Santisima del Valle Coronada', 'El Valle', NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de Pasion', 'Pasion', 'Juan Martinez Montaniez', 1615  FROM DUAL UNION ALL
SELECT 'Maria Santisima de', 'Pasion', 'Sebastian Santos', 1966 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus Nazareno', 'El Silencio', 'Francisco de Ocampo', 1609  FROM DUAL UNION ALL
SELECT 'Maria Santisima de', 'El Silencio', 'Sebastian Santos', 1954 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus del Gran Poder', 'El Gran Poder', 'Juan de Mesa', 1620  FROM DUAL UNION ALL
SELECT 'Maria Santisima del Mayor Dolor y Traspaso', 'El Gran Poder', NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Sentencia', 'Macarena','Cristobal Perez', 1681  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Esperanza Macarena Coronada', 'Macarena',    NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus del Calvario', 'El Calvario', 'Francisco de Ocampo', 1612  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Presentacion', 'El Calvario', 'Juan de Astorga', 1845  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus las Tres Caidas', 'Esperanza de Triana', NULL, NULL  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Esperanza de Triana Coronada', 'Esperanza de Triana', 'Juan de Astorga', 1816 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Salud', 'Los Gitanos', 'Fernadez-Andes', 1938 FROM DUAL UNION ALL
SELECT 'Maria Santisima de las Angustias Coronada', 'Los Gitanos', 'Fernadez-Andes', 1937 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Salud', 'La Carreteria', NULL, NULL FROM DUAL UNION ALL
SELECT 'Maria Santisima del Mayor Dolor en su Soledad', 'La Carreteria',   'Alonso Alvarez de Albarran', 1629  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Luz', 'La Carreteria',   'Pedro Roldan',  NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Salvacion', 'La Soledad de San Buenaventura',    NULL, NULL FROM DUAL UNION ALL
SELECT 'Maria Santisima dela Soledad', 'La Soledad de San Buenaventura',    'Gabriel de Astorga', 1851  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Expiracion', 'El Cachorro', 'Francisco Antonio Gijon', 1682 FROM DUAL UNION ALL
SELECT 'Maria Santisima del Patrocinio', 'El Cachorro', 'Alvarez Duarte', 1973  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus Nazareno', 'La O',    'Pedro Roldan', 1685  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la O Coronada', 'La O',    'Castillo Lastrucci', 1937 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de las Tres Caidas', 'San Isidoro',         'Alonso Martinez', 1668  FROM DUAL UNION ALL
SELECT 'Maria Santisima de Loreto', 'San Isidoro',       NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Conversion del Buen Ladron', 'Montserrat',          'Juan de Mesa', 1620  FROM DUAL UNION ALL
SELECT 'Maria Santisima de Monserrat', 'Montserrat',          'Gaspar de la Cueva', NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus Descendido de la Cruz en el Misterio de su Sagrada Mortaja', 'La Sagrada Mortaja',  'Cristobal Perez', 1677 FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Piedad', 'La Sagrada Mortaja',  'Pedro Roldan', 1676 FROM DUAL UNION ALL
SELECT 'Santo Cristo Varon de Dolores', 'El Sol','Jose Manuel Bonilla', 2003  FROM DUAL UNION ALL
SELECT 'Maria Santisima del Sol', 'El Sol',  'Jose Manuel Bonilla', 1990  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Providencia', 'Los Servitas',        'Montes de Oca', 1730  FROM DUAL UNION ALL
SELECT 'Maria Santisima de los Dolores', 'Los Servitas',       'Montes de Oca', 1730 FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Soledad', 'Los Servitas',        'Dube de Luque', 1966 FROM DUAL UNION ALL
SELECT 'Dios-Hijo', 'La Trinidad',         'Emilio Pizarro', 1913  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Trinidad Coronada', 'La Trinidad',   'Juan de Astorga', 1820  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Concepcion', 'La Trinidad',   'Bidon', 1958  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de las Cinco LLagas', 'La Trinidad',  'Luis Alvarez Duarte', 2002 FROM DUAL UNION ALL
SELECT 'La Canina', 'Santo Entierro', NULL, NULL FROM DUAL UNION ALL
SELECT 'Santisimo Cristo Yacente', 'Santo Entierro',  NULL, 1619  FROM DUAL UNION ALL
SELECT 'Maria Santisima de Villaviciosa', 'Santo Entierro',    'Antonio Cardoso de Quiros', 1693 FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Soledad', 'La Soledad de San Lorenzo',  NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus la Resurreccion', 'La Resurreccion',  'Francisco Buiza', 1975 FROM DUAL UNION ALL
SELECT 'Maria Santisima de', 'La Resurreccion',   'Antonio Dube de Luque', 1978  FROM DUAL UNION ALL
-- CADIZ
SELECT 'Maria Santisima de los Dolores Coronada', 'Orden Tercera de Servitas',   NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus Nazareno de la Obediencia Cadiz', 'Archicofradia de la Merced',  'Cosme Velazquez', NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Paz en su Real y Triunfal Entrada en Jerusalen', 'Hermandad de la Borriquita', 'Lainez Capote', 1944  FROM DUAL UNION ALL
SELECT 'Maria Santisima del Amparo', 'Hermandad de la Borriquita',  NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus del Amor Despojado de sus Vestiduras', 'Hermandad de Jesus Despojado',      'Francisco Romero Zafra', 2008 FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Concepcion', 'Hermandad de Jesus Despojado',  'Francisco Romero Zafra', 2010 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus en la Sagrada Cena', 'Hermandad de la Cena',    'Luis Gonzalez Rey', 1991 FROM DUAL UNION ALL
SELECT 'Maria Santisima Reina de Todos los Santos', 'Hermandad de la Cena',   'Miguel Angel Valverde Jimenez', 2004  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de las Penas', 'Hermandad de las Penas',            'Luis Alvarez Duarte', 1986  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Caridad', 'Hermandad de las Penas',            'Luis Alvarez Duarte', 1983  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Humildad y Paciencia', 'Hermandad de Humildad y Paciencia', 'Jacinto Pimente', 1638 FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Amargura', 'Hermandad de Humildad y Paciencia', 'Sebastian Santos', 1967 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Misericordia', 'Hermandad de la Palma', NULL, NULL FROM DUAL UNION ALL
SELECT 'Maria Santisima de las Penas Coronada', 'Hermandad de la Palma',  NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus en su Prendimiento', 'Hermandad del Prendimiento',        'Alfonso Berraquero', 1978 FROM DUAL UNION ALL
SELECT 'Maria Santisima del Patrocinio', 'Hermandad del Prendimiento',        NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus Nazareno del Amor', 'Hermandad del Nazareno del Amor',   'Jose Rivera Garcia', 1940  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Esperanza', 'Hermandad del Nazareno del Amor',   'Luis Jimenez', 1962 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Veracruz', 'Hermandad de la Vera Cruz',   NULL, NULL FROM DUAL UNION ALL
SELECT 'Maria Santisima de de la Soledad', 'Hermandad de la Vera Cruz',         'Sebastian Santos',  1945 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus Caido', 'Hermandad de Jesus Caido (Universitarios)',   'Miguel Lainez Capote', 1941 FROM DUAL UNION ALL
SELECT 'Maria Santisima de los Desamparados', 'Hermandad de Jesus Caido (Universitarios)',   'Jose Rivera Garcia', 1964 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus del Ecce-Homo', 'Hermandad del Ecce Homo',      'Montes de Oca', 1730  FROM DUAL UNION ALL
SELECT 'Maria Santisima de las Angustias', 'Hermandad del Ecce Homo',      'Manuel Fernandez Guerrero', NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus Atado a la Columna y Azotes', 'Hermandad de la Columna',  'Jacinto Pimentel', 1660  FROM DUAL UNION ALL
SELECT 'Maria Santisima de las Lagrimas', 'Hermandad de la Columna',  'Domenico Giscardi', 1776 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Piedad', 'Hermandad de la Piedad',   'Francisco Maria Mayo', 1754 FROM DUAL UNION ALL
SELECT 'Maria Santisima de las Lagrimas', 'Hermandad de la Piedad',   'Francisco Buiza', 1958 FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Consolacion', 'Hermandad de la Piedad',   'Luis Gonzalez Rey', 1997  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus del Mayor Dolor', 'Hermandad de la Sanidad',  'Miguel Jose Lainez Capote', 1950 FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Salud', 'Hermandad de la Sanidad',  'Francisco Buiza', 1978 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Salud', 'Hermandad de las Cigarreras',  'Francisco de Villegas', NULL FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Esperanza', 'Hermandad de las Cigarreras',  'Luis Alvarez Duarte', 2005 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Sentencia', 'Hermandad de Sentencia (Estudiantes)',  NULL, NULL FROM DUAL UNION ALL
SELECT 'Maria Santisima del Buen Fin', 'Hermandad de Sentencia (Estudiantes)',   'Francisco Buiza',  1961 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de las Aguas', 'Hermandad de las Aguas',                 'Francisco Buiza', 1981 FROM DUAL UNION ALL
SELECT 'San Juan Evangelista', 'Hermandad de las Aguas','Eslava Rubio',  1951 FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Luz', 'Hermandad de las Aguas', 'Francisco Buiza', 1981  FROM DUAL UNION ALL
SELECT 'Maria Santisima de Guadalupe', 'Hermandad de las Aguas','Francisco Javier Navarro Moragas', 1995 FROM DUAL UNION ALL
SELECT 'Maria Santisima de las Angustias', 'Hermandad de la Virgen de las Angustias','Diego Roldan', 1748  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Oracion en el Huerto', 'Hermandad de la Oracion en el Huerto',   'Manuel Ramos Corona', 1989  FROM DUAL UNION ALL
SELECT 'Maria Santisima de Gracia y Esperanza', 'Hermandad de la Oracion en el Huerto',   'Manuel Ramos Corona', 1990 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de los Afligidos', 'Hermandad de los Afligidos',   'Peter Sterling', 1727 FROM DUAL UNION ALL
SELECT 'Maria Santisima de los Desconsuelos', 'Hermandad de los Afligidos',    'Peter Sterling', 1727 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus Cautivo y Rescatado', 'Hermandad de Medinaceli',  'Lainez Capote', 1938  FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Trinidad', 'Hermandad de Medinaceli',   'Francisco Buiza', 1967 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus Nazareno', 'Hermandad de Jesus Nazareno',   'Andres de Castillejo', 1591 FROM DUAL UNION ALL
SELECT 'Maria Santisima de los Dolores', 'Hermandad de Jesus Nazareno',   'Juan Luis Vassallo Parodi', 1943  FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus del Perdon', 'Hermandad del Perdon',  'Luis Ortega Bru', 1980  FROM DUAL UNION ALL
SELECT 'Maria Santisima del Rosario en sus Misterios Dolorosos', 'Hermandad del Perdon',        'Alfonso Berraquero', 1983 FROM DUAL UNION ALL
SELECT 'Maria Santisima del Calvario', 'Hermandad del Perdon',   'Luis Ortega Bru', 1981 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus del Descendimiento de la Santa Cruz', 'Hermandad del Descendimiento',           'Francisco Berlanga', 1985 FROM DUAL UNION ALL
SELECT 'Maria Santisima en su Quinta Angustia', 'Hermandad del Descendimiento',         NULL,  NULL FROM DUAL UNION ALL
SELECT 'Maria Santisima de los Dolores', 'Hermandad del Descendimiento',           NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Expiracion', 'Hermandad de la Expiracion',            NULL, NULL FROM DUAL UNION ALL 
SELECT 'Maria Santisima de la Victoria', 'Hermandad de la Expiracion',             'Carlos Emilio Bartus Loreto',  1940 FROM DUAL UNION ALL 
SELECT 'Nuestro Padre Jesus de la Sed', 'Hermandad de las Siete Palabras',        ' Luis Gonzalez Rey', 2007 FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Piedad', 'Hermandad de las Siete Palabras',        ' Luis Gonzalez Rey', 2005 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Buena Muerte', 'Hermandad de la Buena Muerte',  NULL, 1648  FROM DUAL UNION ALL
SELECT 'Maria Santisima del Mayor Dolor', 'Hermandad de la Buena Muerte',       NULL, NULL FROM DUAL UNION ALL
SELECT 'Maria Santisima de', 'Congregacion Ecce Mater Tua',            'Domingo Sanchez Mesa', 1955 FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus Yacente', 'Hermandad del Santo Entierro',        NULL, NULL FROM DUAL UNION ALL
SELECT 'Maria Santisima de la Soledad', 'Hermandad del Santo Entierro',        NULL, NULL FROM DUAL UNION ALL
SELECT 'Nuestro Padre Jesus de la Resurreccion', 'Hermandad de la Resurreccion',  'Domenico Giscardi', NULL FROM DUAL;
/

-- Script PL/SQL para insertar los datos de la tabla temporal
DECLARE
  CURSOR c_titulares IS SELECT * FROM titulares_temp;
  v_nombre titulares_temp.nombre%TYPE;
  v_nombre_hermandad titulares_temp.nombre_hermandad%TYPE;
  v_autor titulares_temp.autor%TYPE;
  v_anio_realizacion titulares_temp.anio_realizacion%TYPE;
BEGIN
  FOR r_titular IN c_titulares LOOP
    v_nombre := r_titular.nombre;
    v_nombre_hermandad := r_titular.nombre_hermandad;
    v_autor := r_titular.autor;
    v_anio_realizacion := r_titular.anio_realizacion;
    PaqueteHermandad.insertartitular(
      p_nombre => v_nombre,
      p_nombreHermandad => v_nombre_hermandad,
      p_autor => v_autor,
      p_anio_realizacion => v_anio_realizacion
    );
  END LOOP;
END;
/
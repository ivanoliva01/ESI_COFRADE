-- Eliminar tablas
DROP TABLE CONTRATOS CASCADE CONSTRAINTS;
DROP TABLE BANDAS CASCADE CONSTRAINTS;
DROP TABLE PERSONAS CASCADE CONSTRAINTS;
DROP TABLE TITULARES CASCADE CONSTRAINTS;
DROP TABLE HERMANDADES CASCADE CONSTRAINTS;
DROP TABLE MUNICIPIOS CASCADE CONSTRAINTS;
-- Eliminar tabla temporal (inserts de hermandades)
DROP TABLE hermandades_temp CASCADE CONSTRAINTS FORCE;
DROP TABLE titulares_temp CASCADE CONSTRAINTS FORCE;
-- Eliminar paquetes
DROP PACKAGE PaqueteHermandad;
-- Eliminar secuencias
DROP SEQUENCE CONTRATOS_SEQ;
DROP SEQUENCE BANDAS_SEQ;
DROP SEQUENCE PERSONAS_SEQ;
DROP SEQUENCE TITULARES_SEQ;
DROP SEQUENCE HERMANDADES_SEQ;
DROP SEQUENCE MUNICIPIOS_SEQ;
-- Eliminar tipos
DROP TYPE contrato_objtyp FORCE;
DROP TYPE lista_contratos_tabletyp FORCE;
DROP TYPE persona_objtyp FORCE;
DROP TYPE lista_hermanos_tabletyp FORCE;
DROP TYPE titular_objtyp FORCE;
DROP TYPE lista_titulares_tabletyp FORCE;
DROP TYPE banda_objtyp FORCE;
DROP TYPE hermandad_objtyp FORCE;
DROP TYPE lista_hermandades_tabletyp FORCE;
DROP TYPE municipio_objtyp FORCE;
DROP TYPE lista_curiosidades_tabletyp FORCE;
/
-- Declaracion anticipada de objetos banda y hermandad
CREATE OR REPLACE TYPE banda_objtyp;
/
CREATE OR REPLACE TYPE hermandad_objtyp;
/
-- Tipo objeto contrato
CREATE OR REPLACE TYPE contrato_objtyp AS OBJECT(
    id NUMBER,
    fecha_inicio DATE,
    fecha_fin DATE,
    hermandad REF hermandad_objtyp,
    banda REF banda_objtyp,
    fecha_firma DATE,
    precio NUMBER
);
/
-- Tipo lista_contratos
CREATE OR REPLACE TYPE lista_contratos_tabletyp AS TABLE OF REF contrato_objtyp;
/
-- Tipo banda
CREATE OR REPLACE TYPE banda_objtyp AS OBJECT(
    id NUMBER(5),
    nombre VARCHAR2(50),
    tipo VARCHAR2(30),
    lista_contratos lista_contratos_tabletyp
);
/
-- Tipo objeto persona
CREATE OR REPLACE TYPE persona_objtyp AS OBJECT (
    id NUMBER,
    nombre VARCHAR2(30),
    fecha_nacimiento DATE,
    email VARCHAR2(30),
    telefono NUMBER(9)
);
/
-- Tipo lista de hermanos
CREATE OR REPLACE TYPE lista_hermanos_tabletyp AS TABLE OF persona_objtyp;
/
-- Tipo lista de curiosidades
CREATE OR REPLACE TYPE lista_curiosidades_tabletyp AS TABLE OF VARCHAR2(200); 
/
-- Tipo objeto titular
CREATE OR REPLACE TYPE titular_objtyp AS OBJECT (
    id NUMBER,
    hermandad REF hermandad_objtyp,
    nombre VARCHAR2(100),
    autor VARCHAR2(50),
    anio_realizacion NUMBER,
    imagen VARCHAR2(30)
);
/
-- Tipo lista titulares*/
CREATE OR REPLACE TYPE lista_titulares_tabletyp AS TABLE OF REF titular_objtyp;
/
-- Declaracion adelantada de objeto municipio*/
CREATE OR REPLACE TYPE municipio_objtyp;
/
-- Tipo hermandad
CREATE OR REPLACE TYPE hermandad_objtyp AS OBJECT(
    id NUMBER(5),
    nombre VARCHAR2(50),
    anio_fundacion NUMBER(4),
    dia_salida VARCHAR2(50),
    ciudad REF municipio_objtyp,
    lista_curiosidades lista_curiosidades_tabletyp,
    lista_titulares lista_titulares_tabletyp,
    lista_hermanos lista_hermanos_tabletyp,
    lista_contratos lista_contratos_tabletyp,
    escudo VARCHAR2(30),
    -- Funcion miembro para aniadir una persona a la lista de hermanos del objeto
    MEMBER PROCEDURE addHermano(p_persona persona_objtyp),
    -- Funcion miembro para aniadir un titular a la lista de titulares del objeto
    MEMBER PROCEDURE addTitular(p_titular REF titular_objtyp),
    -- Funcion miembro para aniadir curiosidades a la hermandad
    MEMBER PROCEDURE addCuriosidad(p_curiosidad VARCHAR2)
);
/
-- Tipo lista de hermandades
CREATE OR REPLACE TYPE lista_hermandades_tabletyp AS TABLE OF REF hermandad_objtyp; 
/
-- Tipo municipio
CREATE OR REPLACE TYPE municipio_objtyp AS OBJECT (
    id NUMBER,
    lista_hermandades lista_hermandades_tabletyp,
    nombre VARCHAR2(30),
    -- Funcion miembro para aniadir una hermanandad a la lista de hermandades del objeto
    MEMBER PROCEDURE addHermandad(p_hermandad REF hermandad_objtyp)
);
/
-- Body de hermandad
CREATE OR REPLACE TYPE BODY hermandad_objtyp AS
    -- Funcion miembro para aniadir una persona a la lista de hermanos del objeto
    MEMBER PROCEDURE addHermano(p_persona persona_objtyp) IS
    BEGIN
        IF lista_hermanos IS NULL THEN
            lista_hermanos := lista_hermanos_tabletyp(p_persona);
        ELSE
            lista_hermanos.extend(1);
            lista_hermanos(lista_hermanos.last) := p_persona;
        END IF;
    END addHermano;
    -- Funcion miembro para aniadir un titular a la lista de titulares del objeto
    MEMBER PROCEDURE addTitular(p_titular REF titular_objtyp) IS
    BEGIN
        IF lista_titulares IS NULL THEN
            lista_titulares := lista_titulares_tabletyp(p_titular);
        ELSE
            lista_titulares.extend(1);
            lista_titulares(lista_titulares.last) := p_titular;
        END IF;
    END addTitular;
    -- Funcion miembro para aniadir curiosidades a la hermandad
    MEMBER PROCEDURE addCuriosidad(p_curiosidad VARCHAR2) IS
    BEGIN
        IF lista_curiosidades IS NULL THEN
                lista_curiosidades := lista_curiosidades_tabletyp(p_curiosidad);
            ELSE
                lista_curiosidades.extend(1);
                lista_curiosidades(lista_curiosidades.last) := p_curiosidad;
            END IF;
    END addCuriosidad;
END;
/
-- Body de municipio
CREATE OR REPLACE TYPE BODY municipio_objtyp AS
    -- Funcion miembro para aniadir una hermanandad a la lista de hermandades del objeto
    MEMBER PROCEDURE addHermandad(p_hermandad REF hermandad_objtyp) IS
    BEGIN
        IF lista_hermandades IS NULL THEN
            lista_hermandades := lista_hermandades_tabletyp(p_hermandad);
        ELSE
            lista_hermandades.extend(1);
            lista_hermandades(lista_hermandades.last) := p_hermandad;
        END IF;
    END addHermandad;
END;
/
-- Secuencia para la PK de la tabla CONTRATOS
CREATE SEQUENCE CONTRATOS_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 99999 NOCYCLE
/*no se reinicia despues de llegar al maximo*/
CACHE 20;
/*se almacenan los siguientes 20 valores*/
-- Secuencia para la PK de la tabla BANDAS
CREATE SEQUENCE BANDAS_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 99999 NOCYCLE CACHE 20;
-- Secuencia para la PK de la tabla PERSONAS
CREATE SEQUENCE PERSONAS_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 99999 NOCYCLE CACHE 20;
-- Secuencia para la PK de la tabla TITULARES
CREATE SEQUENCE TITULARES_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 99999 NOCYCLE CACHE 20;
-- Secuencia para la PK de la tabla HERMANDADES
CREATE SEQUENCE HERMANDADES_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 99999 NOCYCLE CACHE 20;
-- Secuencia para la PK de la tabla MUNICIPIOS
CREATE SEQUENCE MUNICIPIOS_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 99999 NOCYCLE CACHE 20;
/
-- TABLA CONTRATOS
CREATE TABLE CONTRATOS OF contrato_objtyp (
    id DEFAULT CONTRATOS_SEQ.NEXTVAL,
    hermandad NOT NULL, -- hermandad como FK
    banda NOT NULL,     -- banda como FK
    CONSTRAINT pk_contratos PRIMARY KEY (id) -- id como PK
);
/
-- TABLA BANDAS
CREATE TABLE BANDAS OF BANDA_objtyp (
    id DEFAULT BANDAS_SEQ.NEXTVAL,
    CONSTRAINT pk_bandas PRIMARY KEY (id), -- id como PK
    CONSTRAINT ck_banda_tipo CHECK (
        tipo IN (
            'Cornetas y Tambores',
            'Agrupacion Musical',
            'Banda de Musica',  
            'Trio de Capilla'
        ) -- unicos datos para el tipo de banda
    )
) NESTED TABLE lista_contratos STORE AS contratos_banda; -- tabla de la listas de contratos
/
-- TABLA PERSONAS
CREATE TABLE PERSONAS OF PERSONA_objtyp (
    id DEFAULT PERSONAS_SEQ.NEXTVAL,
    CONSTRAINT pk_personas PRIMARY KEY (id) -- id como PK
);
/
-- TABLA TITULARES
CREATE TABLE TITULARES OF titular_objtyp (
    id DEFAULT TITULARES_SEQ.NEXTVAL,
    hermandad NOT NULL, -- hermandad como FK
    CONSTRAINT pk_titulares PRIMARY KEY (id) -- id como PK
);
/
-- TABLA HERMANDADES
CREATE TABLE HERMANDADES OF hermandad_objtyp(
    id DEFAULT HERMANDADES_SEQ.NEXTVAL,
    nombre NOT NULL UNIQUE,
    ciudad NOT NULL, -- ciudad como FK
    CONSTRAINT pk_hermandades PRIMARY KEY (id), -- id como PK
    CONSTRAINT ck_hermandad_dia CHECK (
        dia_salida IN (
            'Viernes de Dolores',
            'Sabado de Pasion',
            'Domingo de Ramos',
            'Lunes Santo',
            'Martes Santo',
            'Miercoles Santo',
            'Jueves Santo',
            'Madrugada',
            'Viernes Santo',
            'Sabado Santo',
            'Domingo de Resurreccion'
        ) -- unicos datos para el dia de salida
    )
) NESTED TABLE lista_curiosidades STORE AS curiosidades_hermandad  -- tabla de la listas de hermanos
  NESTED TABLE lista_titulares STORE AS titulares_hermandad  -- tabla de la listas de titulares 
  NESTED TABLE lista_hermanos STORE AS hermanos_hermandad  -- tabla de la listas de hermanos
  NESTED TABLE lista_contratos STORE AS contratos_hermandad;  -- tabla de la listas de contratos
/
-- TABLA MUNICIPIOS
CREATE TABLE MUNICIPIOS OF municipio_objtyp (
    id DEFAULT MUNICIPIOS_SEQ.NEXTVAL,
    CONSTRAINT pk_municipios PRIMARY KEY (id) -- id como PK
) NESTED TABLE lista_hermandades STORE AS hermandades_municipios;  -- tabla de la listas de hermandades
/
-- Paquete de proc/func relacionado con objetos Hermandad
CREATE OR REPLACE PACKAGE PaqueteHermandad AS
    -- Insertar una hermandad
    PROCEDURE InsertarHermandad(
        p_nombre IN VARCHAR2,
        p_anio_fundacion IN NUMBER,
        p_dia_salida IN VARCHAR2,
        p_ciudad IN VARCHAR2
    );
    -- Insertar una persona de una hermandad
    PROCEDURE InsertarPersona(
        p_nombre IN VARCHAR2,
        p_fecha_nacimiento IN DATE,
        p_email IN VARCHAR2,
        p_telefono IN NUMBER,
        p_nombreHermandad IN VARCHAR2
    );
    -- Insertar un titular y añadirlo a su correspondiente hermandad
    PROCEDURE InsertarTitular(
        p_nombre IN VARCHAR2,
        p_nombreHermandad IN VARCHAR2,
        p_autor IN VARCHAR2,
        p_anio_realizacion IN NUMBER
    );
    PROCEDURE InsertarCuriosidad(
            p_nombreHermandad IN VARCHAR2,
            p_curiosidad IN VARCHAR2
    );
END PaqueteHermandad;
/
-- Paquete de proc/func relacionado con objetos Hermandad
CREATE OR REPLACE PACKAGE BODY PaqueteHermandad AS
    -- Insertar una hermandad
    PROCEDURE InsertarHermandad(
            p_nombre IN VARCHAR2,
            p_anio_fundacion IN NUMBER,
            p_dia_salida IN VARCHAR2,
            p_ciudad IN VARCHAR2
        ) AS
            v_persona REF municipio_objtyp;
            v_hermandad REF hermandad_objtyp;
            v_persona_obj municipio_objtyp; 
        BEGIN
            -- Buscamos la ciudad en la tabla municipio y la referenciamos
            SELECT REF(m) INTO v_persona
                FROM MUNICIPIOS m
                WHERE m.nombre = p_ciudad;
            -- Creamos la nueva hermandad
            INSERT INTO HERMANDADES (nombre, anio_fundacion, dia_salida, ciudad)
            VALUES (p_nombre, p_anio_fundacion, p_dia_salida, v_persona);
            -- Buscamos la hermandad en la tabla hermandades y la referenciamos
            SELECT REF(h) INTO v_hermandad
                FROM HERMANDADES h
                WHERE h.id = (SELECT MAX(id) FROM TITULARES);
            -- Agregamos la nueva hermandad a la lista de hermandades del municipio
            SELECT DEREF(v_persona) INTO v_persona_obj FROM DUAL;
            -- Funcion miembro para aniadir una hermanandad a la lista de hermandades del objeto
            v_persona_obj.addHermandad(v_hermandad);
            -- Actualizamosel objeto en la tabla municipios
            UPDATE MUNICIPIOS SET lista_hermandades = v_persona_obj.lista_hermandades WHERE id = v_persona_obj.id;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN -- Si no encuentra datos a procesar
                DBMS_OUTPUT.PUT_LINE('No hay datos para procesar');
    END InsertarHermandad;
    -- Insertar una persona de una hermandad
    PROCEDURE InsertarPersona(
            p_nombre IN VARCHAR2,
            p_fecha_nacimiento IN DATE,
            p_email IN VARCHAR2,
            p_telefono IN NUMBER,
            p_nombreHermandad IN VARCHAR2
        ) AS
            v_persona REF persona_objtyp;
            v_hermandad REF hermandad_objtyp;
            v_persona_obj persona_objtyp;
            v_hermandad_obj hermandad_objtyp; 
        BEGIN
            -- Creamos el nuevo hermano
            INSERT INTO PERSONAS (nombre, fecha_nacimiento, email, telefono)
            VALUES (p_nombre, p_fecha_nacimiento, p_email, p_telefono);
            -- Buscamos el hermano en la tabla persona y lo referenciamos
            SELECT REF(p) INTO v_persona
            FROM PERSONAS p
            WHERE p.nombre = p_nombre;
            -- Buscamos la hermandad en la tabla hermandades y la referenciamos
            SELECT REF(h) INTO v_hermandad
            FROM HERMANDADES h
            WHERE h.nombre = p_nombreHermandad;
            -- Agregamos la nueva hermandad a la lista de hermandades del municipio
            SELECT DEREF(v_hermandad) INTO v_hermandad_obj FROM DUAL;
            SELECT DEREF(v_persona) INTO v_persona_obj FROM DUAL;
            -- Funcion miembro para aniadir una persona a la lista de hermanos del objeto
            v_hermandad_obj.addHermano(v_persona_obj);
            -- Actualizamos el objeto en la tabla hermandades
            UPDATE HERMANDADES SET lista_hermanos = v_hermandad_obj.lista_hermanos WHERE id = v_hermandad_obj.id;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN -- Si no encuentra datos a procesar
                DBMS_OUTPUT.PUT_LINE('No hay datos para procesar');
    END InsertarPersona;
    -- Insertar un titular y añadirlo a su correspondiente hermandad
    PROCEDURE InsertarTitular(
            p_nombre IN VARCHAR2,
            p_nombreHermandad IN VARCHAR2,
            p_autor IN VARCHAR2,
            p_anio_realizacion IN NUMBER
        ) AS
            v_titular   REF titular_objtyp;
            v_hermandad REF hermandad_objtyp;
            v_titular_obj   titular_objtyp; 
            v_hermandad_obj hermandad_objtyp;
        BEGIN
            -- Buscamos la hermandad en la tabla hermandad y la referenciamos
            SELECT REF(h) INTO v_hermandad
                FROM HERMANDADES h
                WHERE h.nombre = p_nombreHermandad;
            -- Creamos el nuevo titular
            INSERT INTO TITULARES (hermandad, nombre, autor, anio_realizacion)
            VALUES (v_hermandad, p_nombre, p_autor, p_anio_realizacion);
            -- Buscamos el titular en la tabla titulares y lo referenciamos
            SELECT REF(t) INTO v_titular
                FROM TITULARES t
                WHERE t.id = (SELECT MAX(id) FROM TITULARES);
            -- Agregamos el titular a la lista de titulares de la hermandad
            SELECT DEREF(v_hermandad) INTO v_hermandad_obj FROM DUAL;
            -- Funcion miembro para aniadir una hermanandad a la lista de hermandades del objeto
            v_hermandad_obj.addTitular(v_titular);
            -- Actualizamosel objeto en la tabla municipios
            UPDATE HERMANDADES SET lista_titulares = v_hermandad_obj.lista_titulares WHERE id = v_hermandad_obj.id;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN -- Si no encuentra datos a procesar
                DBMS_OUTPUT.PUT_LINE('No hay datos para procesar');
    END InsertarTitular;
    -- Insertar una curiosidad de una hermandad
    PROCEDURE InsertarCuriosidad(
            p_nombreHermandad IN VARCHAR2,
            p_curiosidad IN VARCHAR2
        ) AS
            v_hermandad REF hermandad_objtyp;
            v_hermandad_obj hermandad_objtyp;
        BEGIN
            -- Buscamos la hermandad en la tabla hermandad y la referenciamos
            SELECT REF(h) INTO v_hermandad
                FROM HERMANDADES h
                WHERE h.nombre = p_nombreHermandad;
            -- Agregamos la curiosidad a la lista de curiosidades de la hermandad
            SELECT DEREF(v_hermandad) INTO v_hermandad_obj FROM DUAL;
            -- Funcion miembro para aniadir una hermanandad a la lista de hermandades del objeto
            v_hermandad_obj.addCuriosidad(p_curiosidad);
            -- Actualizamosel objeto en la tabla municipios
            UPDATE HERMANDADES SET lista_curiosidades = v_hermandad_obj.lista_curiosidades WHERE id = v_hermandad_obj.id;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN -- Si no encuentra datos a procesar
                DBMS_OUTPUT.PUT_LINE('No hay datos para procesar');
    END InsertarCuriosidad;
END PaqueteHermandad;
/
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
SELECT 'Congregacion Ecce Mater Tua',                 1953, 'Sabado Santo', 'Cadiz' FROM DUAL UNION ALL
SELECT 'Hermandad del Santo Entierro',                1601, 'Sabado Santo', 'Cadiz'FROM DUAL;
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
-- Bandas de Sevilla
INSERT INTO BANDAS (nombre, tipo) VALUES ('Agrupacion Musical Ntra. Seniora de la Encarnacion', 'Agrupacion Musical');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Nuestra Seniora del Carmen de Salteras', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Golgota', 'Trio de Capilla');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Ntra. Seniora de la Victoria', 'Trio de Capilla');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Nuestra Seniora de la Victoria, Las Cigarreras', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Nuestro Padre Jesus de la Redencion tras el senior', 'Agrupacion Musical');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Banda Jesus Nazareno de Sevilla', 'Agrupacion Musical');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Santa Ana de Dos Hermanas', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('La Sentencia de Jerez', 'Agrupacion Musical');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Las Nieves de Olivares', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Presentacion al Pueblo de Dos Hermanas', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Rosario de Sanlucar la Mayor', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Santa Cecilia', 'Agrupacion Musical');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Las Angustias', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('La Cruz Roja', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Nuestro Padre Jesus de la Salud', 'Agrupacion Musical');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Banda de Musica de Coria del Rio', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Nuestra Seniora del Sol', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Virgen de los Reyes', 'Agrupacion Musical');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Liceo Municipal de Moguer', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Santa Maria Magdalena de Arahal', 'Agrupacion Musical');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Banda Municipal de Mairena del Alcor', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Capilla Musical Maria Auxiliadora', 'Trio de Capilla');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Maestro Tejera', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Esencia', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Tres Caidas de Triana', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Nuestra Seniora de la Oliva de Salteras', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Nuestra Seniora de la Victoria', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('San Juan Evangelista de Triana', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Virgen del Castillo de Lebrija', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Pasion de Linares', 'Agrupacion Musical');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Calvarium', 'Trio de Capilla');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Nuestra Seniora del Rosario de Cadiz', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Santa Maria de la Esperanza', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Nuestro Padre Jesus Nazareno de Huelva', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Los Gitanos', 'Agrupacion Musical');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Cristo de la Sangre', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Banda Municipal de la Puebla del Rio', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Julian Cerdan de Sanlucar de Barrameda', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Ntra. Sra. del Aguila de Alcala de Guadaira', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Banda Municipal de la Puebla del Rio', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Capilla Musical', 'Trio de Capilla');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Soledad de Cantillana', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Centuria Romana Macarena', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Carmen de Villalba del Alcor', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Ars Sacra', 'Trio de Capilla');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Paso y Esperanza de Malaga', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Municipal de Arahal', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('La Pasion', 'Trio de Capilla');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Nuestra Seniora del Sol', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Coral Polifonica', 'Trio de Capilla');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Banda Municipal de Sevilla', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Banda del Ejercito', 'Banda de Musica');
-- Bandas de Cadiz
INSERT INTO BANDAS (nombre, tipo) VALUES ('Polillas', 'Agrupacion Musical');
INSERT INTO BANDAS (nombre, tipo) VALUES ('La Salud', 'Agrupacion Musical');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Nuestra Padre Jesus Nazareno de San Fernando', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Santa Cruz de Almeria', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Cristo de la Columna de Daimiel', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('La Union', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Banda del Ejercito', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Filarmonica de Conil', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Nuestra Seniora del Rosario de Arriate', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Nuestro Padre Jesus Nazareno de Rota', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Veracruz de Utrera', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Nuestra Seniora del Rosario del Cuervo', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Lignum Crucis', 'Trio de Capilla');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Enrique Montero de Chiclana', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Gailin de Puerto Serrano', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Virgen de la Oliva', 'Agrupacion Musical');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Nuestra Seniora de Palomares de Trebujena', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Los Gitanos de Malaga', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Union Musical Astigitana de Ecija', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('La Humildada de Huelva', 'Cornetas y Tambores');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Sagrada Resurreccion de Chiclana', 'Agrupacion Musical');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Bollullos del Condado', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Maestro Alvarez Hidalgo', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Quinteto Julian Cerdan', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Jesus Cautivo de Estepona', 'Agrupacion Musical');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Maestro Enrique Galan de Rota', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Santa Cruz de Huelva', 'Agrupacion Musical');
INSERT INTO BANDAS (nombre, tipo) VALUES ('La Salud de Barbate', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Calvarium de Sevilla', 'Trio de Capilla');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Nuestra Seniora del Carmen de Padro del Rey', 'Banda de Musica');
INSERT INTO BANDAS (nombre, tipo) VALUES ('Ecce Mater Tua', 'Agrupacion Musical');
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
SELECT 'Nuestro Padre Jesus de la Resurreccion', 'Hermandad de la Columna',  'Domenico Giscardi', NULL FROM DUAL UNION ALL
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
SELECT 'Maria Santisima de la Soledad', 'Hermandad del Santo Entierro',        NULL, NULL FROM DUAL;
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
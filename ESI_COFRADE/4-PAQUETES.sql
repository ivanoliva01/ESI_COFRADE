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
    -- FUNCTION ContarHermanos(p_hermandad IN VARCHAR2)
    -- RETURN NUMBER;
END PaqueteHermandad;
/
CREATE OR REPLACE PACKAGE PaqueteFuncionesHermandad AS
    FUNCTION ContarHermanos(p_hermandad IN VARCHAR2)
    RETURN NUMBER;
END PaqueteFuncionesHermandad;
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
            v_curiosidad REF curiosidad_objtyp;
        BEGIN
            -- Buscamos la hermandad en la tabla hermandad y la referenciamos
            SELECT REF(h) INTO v_hermandad
                FROM HERMANDADES h
                WHERE h.nombre LIKE p_nombreHermandad;
            -- Creamos la nueva curiosidad
            INSERT INTO CURIOSIDADES (hermandad, contenido)
                VALUES (v_hermandad, p_curiosidad);
            -- Buscamos la curiosidad en la tabla curiosidad y la referenciamos
            SELECT REF(c) INTO v_curiosidad
                FROM CURIOSIDADES c
                WHERE c.contenido = p_curiosidad;
            -- Agregamos la curiosidad a la lista de curiosidades de la hermandad
            SELECT DEREF(v_hermandad) INTO v_hermandad_obj FROM DUAL;
            -- Funcion miembro para aniadir una hermandad a la lista de hermandades del objeto
            v_hermandad_obj.addCuriosidad(v_curiosidad);
            -- Actualizamosel objeto en la tabla municipios
            UPDATE HERMANDADES SET lista_curiosidades = v_hermandad_obj.lista_curiosidades WHERE id = v_hermandad_obj.id;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN -- Si no encuentra datos a procesar
                DBMS_OUTPUT.PUT_LINE('No hay datos para procesar');
    END InsertarCuriosidad;
END PaqueteHermandad;
/
-- Paquete de proc/func relacionado con objetos Hermandad
CREATE OR REPLACE PACKAGE BODY PaqueteFuncionesHermandad AS
    FUNCTION ContarHermanos(p_hermandad IN VARCHAR2) RETURN NUMBER
    AS
        v_hermandad_ref REF hermandad_objtyp;
        v_hermandad_obj hermandad_objtyp;   
    BEGIN
        SELECT REF(h) INTO v_hermandad_ref
        FROM HERMANDADES h
        WHERE h.nombre = p_hermandad;
        SELECT DEREF(v_hermandad_ref) INTO v_hermandad_obj FROM DUAL;
        RETURN v_hermandad_obj.lista_hermanos.COUNT;
    END ContarHermanos;
END PaqueteFuncionesHermandad;

/

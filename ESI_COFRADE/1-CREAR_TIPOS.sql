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
-- Tipo curiosidad
CREATE OR REPLACE TYPE curiosidad_objtyp AS OBJECT(
    id NUMBER(5),
    hermandad REF hermandad_objtyp,
    contenido VARCHAR2(200)
);
/
-- Tipo lista de curiosidades
CREATE OR REPLACE TYPE lista_curiosidades_tabletyp AS TABLE OF REF curiosidad_objtyp; 
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
    MEMBER PROCEDURE addCuriosidad(p_curiosidad REF curiosidad_objtyp)
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
    MEMBER PROCEDURE addCuriosidad(p_curiosidad REF curiosidad_objtyp) IS
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
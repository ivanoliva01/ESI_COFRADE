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
-- TABLA CURIOSIDADES
CREATE TABLE CURIOSIDADES OF curiosidad_objtyp(
    id DEFAULT CURIOSIDADES_SEQ.NEXTVAL,
    hermandad NOT NULL,
    CONSTRAINT pk_curiosidades PRIMARY KEY (id) -- id como PK
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
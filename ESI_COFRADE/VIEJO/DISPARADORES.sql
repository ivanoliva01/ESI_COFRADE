-- Actualizar la tabla hermandad cada vez que insertamos un titular
/*CREATE OR REPLACE TRIGGER actualizar_referencias_titulares
    AFTER INSERT ON titular_objtyp
    FOR EACH ROW
    DECLARE
        hermandad_ref REF hermandad_objtyp;
BEGIN
    -- Obtener la referencia a la hermandad del titular insertado
    SELECT hermandad INTO hermandad_ref FROM TITULARES WHERE id = :new.id;
    -- Actualizar la lista de titulares de la hermandad
    UPDATE HERMANDADES SET lista_titulares = lista_titulares MULTISET UNION DISTINCT :new
        WHERE REF(hermandad_objtyp) = hermandad_ref;
END;
/
-- Actualizar la tabla hermandad y banda cada vez que se inserta un contrato
CREATE OR REPLACE TRIGGER actualizar_listas_contratos
    AFTER INSERT ON contrato_objtyp
    FOR EACH ROW
    DECLARE   
        hermandad_ref REF hermandad_objtyp;
        banda_ref REF banda_objtyp;
BEGIN
    -- Obtener la referencia a la hermandad del contrato insertado
    SELECT hermandad INTO hermandad_ref FROM CONTRATOS WHERE id = :new.id;
    -- Actualizar la lista de contratos de la hermandad
    UPDATE hermandad_objtyp SET lista_contratos = lista_contratos MULTISET UNION DISTINCT :new
        WHERE REF(hermandad_objtyp) = hermandad_ref;
    -- Obtener la referencia a la banda del contrato insertado
    SELECT banda INTO banda_ref FROM CONTRATOS WHERE id = :new.id;
    -- Actualizar la lista de contratos de la banda
    UPDATE banda_objtyp SET lista_contratos = lista_contratos MULTISET UNION DISTINCT :new
        WHERE REF(banda_objtyp) = banda_ref;
END;
/
*/
        
-- Actualizar la tabla municipio cada vez que insertamos una hermandad en la tabla hermandad
CREATE OR REPLACE TRIGGER actualizar_lista_hermandades
    AFTER INSERT ON HERMANDADES
    FOR EACH ROW
    DECLARE
        municipio_ref REF municipio_objtyp;
        hermandad_ref REF hermandad_objtyp;
        municipio_obj municipio_objtyp;
BEGIN
    -- Obtener la referencia a la hermandad insertada
    SELECT REF(h) INTO hermandad_ref FROM HERMANDADES h
        WHERE h.id = :new.id;
    -- Obtener la referencia al municipio de la hermandad insertada
    SELECT ciudad INTO municipio_ref FROM HERMANDADES 
        WHERE id = :new.id;
    -- Obtener el objeto de municipio apuntado por la referencia
    municipio_obj := DEREF(municipio_ref);
    -- Actualizar la lista de hermandades del municipio
    UPDATE MUNICIPIOS
        SET lista_hermandades = lista_hermandades MULTISET UNION DISTINCT hermandad_ref
        WHERE id = municipio_obj.id;
END actualizar_lista_hermandades;
/

-- Actualizar la lista de hermanos cada vez que insertamos una persona en personas*/
/*CREATE OR REPLACE TRIGGER actualizar_lista_hermanos
    AFTER INSERT ON persona_objtyp
    FOR EACH ROW
    DECLARE
    hermandad_ref REF hermandad_objtyp;
BEGIN
    -- Obtener la referencia a la hermandad del nuevo hermano
    SELECT hermandad INTO hermandad_ref FROM TITULARES WHERE id = :new.id;
    -- Actualizar la lista de hermanos de la hermandad
    UPDATE hermandad_objtyp SET lista_hermanos = lista_hermanos MULTISET UNION DISTINCT :new
        WHERE REF(hermandad_objtyp) = hermandad_ref;
END;
/
*/
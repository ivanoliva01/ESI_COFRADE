BEGIN
    PaqueteHermandad.InsertarPersona(
        p_nombre => 'Juan Pedro',
        p_fecha_nacimiento => '10/10/2010',
        p_email => 'juanPedro@gmail.com',
        p_telefono => 123456789,
        p_nombreHermandad => 'Macarena'
    );
    END;
/
SET SERVEROUTPUT ON
DECLARE
    
    v_num_hermanos NUMBER;
BEGIN
    -- Llamamos a la función ContarHermanos para obtener el número de hermanos de la hermandad
    v_num_hermanos := PaqueteHermandad.ContarHermanos(p_hermandad => 'Macarena');
    -- Mostramos el resultado
    DBMS_OUTPUT.PUT_LINE('La hermandad tiene ' || v_num_hermanos || ' hermanos.');
END;
/
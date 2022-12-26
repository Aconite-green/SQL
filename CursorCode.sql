USE market_db;
DROP PROCEDURE IF EXISTS cursor_proc;
DELIMITER $$
CREATE PROCEDURE cursor_proc()
BEGIN
    DECLARE memNumber INT;
    DECLARE cnt INT DEFAULT 0;
    DECLARE totNumber INT DEFAULT 0;
    DECLARE end0fRow BOOLEAN DEFAULT FALSE;

    DECLARE memberCuror CURSOR FOR
        SELECT mem_number FROM member;

    DECLARE CONtiNUE HANDLER
        FOR NOT FOUND SET end0fRow = TRUE;

    OPEN memberCuror;

    cursor_loop: LOOP
        FETCH memberCuror INTO memNumber;

        IF end0fRow THEN
            LEAVE cursor_loop;
        END IF;

        SET cnt = cnt + 1;
        SET totNumber = totNumber + memNumber;
    END LOOP cursor_loop;

    SELECT (totNumber / cnt) AS 'Avg of members';

    CLOSE memberCuror;
END $$
DELIMITER ;

CALL cursor_proc();
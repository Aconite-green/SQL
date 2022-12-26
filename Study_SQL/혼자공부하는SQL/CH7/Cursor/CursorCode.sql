USE market_db;
DROP PROCEDURE IF EXISTS cursor_proc;
DELIMITER $$
CREATE PROCEDURE cursor_proc()
BEGIN
    
    -- 1.사용할 변수 준비 --
    DECLARE memNumber INT;
    DECLARE cnt INT DEFAULT 0;
    DECLARE totNumber INT DEFAULT 0;
    DECLARE end0fRow BOOLEAN DEFAULT FALSE;

    -- 커서 선언 -- 
    DECLARE memberCuror CURSOR FOR
        SELECT mem_number FROM member;

    -- 반복 조건 선언 --
    DECLARE CONtiNUE HANDLER
        FOR NOT FOUND SET end0fRow = TRUE;

    -- 커서 열기 --
    OPEN memberCuror;
    -- 행 반복하기 --
    cursor_loop: LOOP
        -- 한 행씩 읽어오기 --
        FETCH memberCuror INTO memNumber;

        IF end0fRow THEN
            LEAVE cursor_loop;
        END IF;

        SET cnt = cnt + 1;
        SET totNumber = totNumber + memNumber;
    END LOOP cursor_loop;

    SELECT (totNumber / cnt) AS 'Avg of members';
    
    -- 커서 닫기 --
    CLOSE memberCuror;
END $$
DELIMITER ;

CALL cursor_proc();
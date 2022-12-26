# Stored Procedure

## **Utilize output parameters**
```sql
-- Create Procedure --
DROP PROCEDURE IF EXISTS user_proc3;
DELIMITER $$
CREATE PROCEDURE user_proc3(
IN txtValue CHAR(10),
OUT outValue INT )
BEGIN
	INSERT INTO noTable VALUES(NULL, txtValue);
    SELECT MAX(id) INTO outValue FROM noTable;
END $$
DELIMITER ;


-- Procedure can be declared without Table --
CREATE TABLE IF NOT EXISTS noTable(
	id INT AUTO_INCREMENT PRIMARY KEY,
    txt CHAR(10)
);


-- Excute --
CALL user_proc3('test1', @myValue);
SELECT CONCAT('input_value->', @myValue);
```

## **Leverage SQL programming**
* **If~Else**

```sql
DROP PROCEDURE IF EXISTS ifelse_proc;
DELIMITER $$
CREATE PROCEDURE ifelse_proc(
	IN memName VARCHAR(10)
)
BEGIN
	DECLARE debutYear INT;
    SELECT YEAR(debut_date) INTO debutYear FROM member
		WHERE mem_name = memName;
	IF (debutYear >= 2015) THEN
		SELECT '화이팅' AS 'Message';
	ELSE
		SELECT '수고하셨습니다' AS 'Message';
	END IF;
END $$
DELIMITER ;

CALL ifelse_proc('오마이걸');

```

<br>

* **While**
```sql
DROP PROCEDURE IF EXISTS while_proc;
DELIMITER $$
CREATE PROCEDURE while_proc()
BEGIN 
	DECLARE hap INT;
    DECLARE num INT;
    SET hap = 0;
    SET num = 1;
    WHILE(num <= 100) DO
		SET hap = hap + num;
        SET num = num + 1;
	END WHILE;
    SELECT hap AS 'Total sum of 1~100';
END $$
DELIMITER ;

CALL while_proc();
```

<br>

* **Dynamic SQL**
```sql
DROP PROCEDURE IF EXISTS dynamic_proc;
DELIMITER $$
CREATE PROCEDURE dynamic_proc(
	IN tableName VARCHAR(20)
)
BEGIN
	SET @sqlQuery = CONCAT('SELECT * FROM ', tableName);
    PREPARE myQuery FROM @sqlQuery;
	EXECUTE myQuery;
    DEALLOCATE PREPARE myQuery;
END $$
DELIMITER ;

CALL dynamic_proc('member');
```

<br>



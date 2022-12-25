# Advanced SQL

> * __변수__ : mySQL에서 제공하는 변수는 앞에 __@__ 을 붙입니다<br>
> 
> * __형 변환__
>      
>  ```SQL
> CAST (value AS data_type)
> CONVERT (vlaue, data_type)
>  ```
><br>
>
> ### __정수형__
> Data type |Byte|Range
> :-----:|:---:|:---:
> TINYINT|1| -128 ~ 128
> SMALLINT|2|-32768 ~ 32767
> INT|4|약 -21경 ~ +21경
> BIGINT|8| 약 -900경 ~ +900경
> <br>
>
> ### __문자형__
> Data type |Byte
> :-----:|:---:
> CHAR(개수)| 1 ~ 255
> VARCHAR(개수)|1 ~ 16383
> <br>
>
> ### __대량의 데이터 형(문자, 이미지)__
> Data type |Byte|
> :-----:|:---:
> TEXT|1 ~ 65535
> LONGTEXT|1 ~ 4294967295
> BLOB|1 ~ 65535
> LONGBLOB| 1 ~ 4294967295
> <br>
>
> ### __실수형__
> Data type |Byte|
> :-----:|:---:
> FLOAT (아래 7자리)|4
> DOUBLE (아래 15자리)| 8
> <br>
>
> ### __날짜형__
> Data type |Byte|Range
> :-----:|:---:|:---:
> DATE|3| 날짜만 저장. YYYY-MM-DD 형식
> TIME|3|시간만 저장. YYYY-MM-DD 형식
> DATETIME|8|날짜 및 시간 저장. YYYY-MM-DD YYYY-MM-DD 형식
> <br> 
> 
>  * __INNER JOIN__ 
> ```sql
>SELECT [column]
>    FROM [first_table]
>    INNER JOIN [second_table]
>    ON [join_condition]
>WHERE [where_condition]
>```
>  * __OUTER JOIN__ 
> ```sql
>SELECT [column]
>-- All contents of the left table should be printed
>    FROM [first_table] 
>    [LEFT | RIGHT] OUTER JOIN [second_table]
>    ON [join_condition]
>WHERE [where_condition]
>```
> * __CROSS JOIN__<br>
> 두 테이블의 모든 행을 조인 시킴<br> # of 'A' table col * # of 'B' table col <br>= total number of Cross join col
>
> * __SELF JOIN__
> ```sql
>SELECT A.emp "직원", B.emp "직속상관", B.phone "직속상관연락처"
>   FROM emp_table A
>       INNER JOIN emp_table B
>       ON A.manager = B.emp
>   WHERE A.emp = "경리부장";  
>```
> * __IF__ 
> ```sql
>DROP PROCEDURE IF EXISTS ifProc3;
>DELIMITER $$
>CREATE PROCEDURE ifProc3()
>BEGIN 
>    DECLARE debutDate DATE;
>    DECLARE curDate DATE;
>    DECLARE days INT;
>
>    SELECT debut_date INTO debutDate
>        FROM market_db.mamber
>        WHERE mem_id = 'APN';
>    
>    SET curDATE = CURRENT_DATE();
>    SET days = DATEDIFF(curDATE, debutDate)
>
>    IF (days/365) >= 5 THEN
>        SELECT CONCAT('데뷔한 지', days, '축하합니다');
>    ELSE 
>        SELECT '데뷔한지' + days + '화이팅';
>    END IF;
>END $$
>DELIMITER ;
>CALL ifProc3();
>``` 
><br>
>
>### __Function with Date__
>Function| Description
>--|--
>CURRNT_DATE|오늘 날짜를 알려줍니다
>CURRENT_TIMESTAMP|오늘 날짜 및 시간을 함께 알려줍니다
>DATEDIFF(날짜1, 날짜2)|날짜2부터 날짜1까지 일수로 몇일인지 알려줍니다
><br>
>
>* __CASE__
>```sql
>SELECT M.mem_id, M.mem_name, SUM(price*amount) 'total buy',
>    CASE
>        WHEN SUM(price*amount) >= 1500 THEN '최우수고객'
>        WHEN SUM(price*amount) >= 1000 THEN '우수고객'
>        WHEN SUM(price*amount) >= 1 THEN '일반고객'
>        ELSE '유령고객'
>    END '회원등급'
>    FROM buy B
>        RIGHT OUTER JOIN member M
>        ON B.mem_id = M.mem_id
>    GROUP BY M.mem_id
>    ORDER BY SUM(price*amount) DESC;
>```
><br>
>
>* __WHILE__
>
>```sql
>DROP PROCEDURE IF EXISTS whileProc2;
>DELIMITER $$
>CREATE PROCEDURE whileProc2()
>BEGIN
>    DECLARE i INT; 
>    DECLARE hap INT;
>    SET i = 1;
>    SET hap = 0;
>
>    myWhile:
>    WHILE(i <= 100) DO
>        IF (i%4 =0) THEN
>            SET i = i + 1;
>            ITERATE myWhile; -- continue
>        END IF;
>
>        SET hap = hap + i;
>        IF (hap > 1000) THEN
>            LEAVE myWhile; -- break
>        END IF;
>        SET i = i + 1;
>    END WHILE;
>    
>    SELECT 'Sum of 1~100(exclude multiples of 4)', hap;
>END $$
>DELIMITER ;
>CALL whileProc2();
>```
><br>
>
>* __PREPARE & EXECUTE__
>```sql
>DROP TABLE IF EXISTS gat_table;
>CREATE TABLE gate_table (id INT AUTO_INCREMENT PRIMARY KEY, entry_time DATETIME);
>
>SET @curDate = CURRENT_TIMESTAMP(); -- Before Prepare function
>
>PREPARE myQuery FROM 'INSERT INTO gate_table VALUES(NULL, ?)';
>EXECUTE myQuery USING @curDate;
>DEALLOCATE PREPARE myQuery; -- 문장 해제
>
>SELECT * FROM get_table
>``` 



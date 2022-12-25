# Table and View

## **DB modeling**

1. **Designing Databases and Tables**
    * table name, Col name, date type, Not Null, (Key, Auto_Increment etc)
<br><br>

2. **Create DB**
    ```sql
    DROP DATABASE IF EXISTS naver_db;
    CREATE DATABASE naver_db;
    ```
<br>

3. **Create Table**
    ```sql
    USE naver_db;
    DROP TABLE IF EXISTS member;
    CREATE TABLE member
    ( 
    	mem_id CHAR(8) NOT NULL PRIMARY KEY,
    	mem_name VARCHAR(10) NOT NULL,
        mem_number TINYINT NOT NULL,
        addr CHAR(2) NOT NULL,
        phone1 CHAR(3) NULL,
        phone2 CHAR(8) NULL,
        height TINYINT UNSIGNED NULL,
        debut_date DATE NULL
    );
    
    CREATE TABLE buy
    ( 
    	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
        mem_id CHAR(8) NOT NULL,
        prod_name CHAR(6) NOT NULL,
        group_name CHAR(4) NULL,
        price INT UNSIGNED NOT NULL,
        amount SMALLINT UNSIGNED NOT NULL,
        FOREIGN KEY(mem_id) REFERENCES member(mem_id)
    );
    ```

<br>

4. **Insert Data**
    ```sql
    USE naver_db;
    INSERT INTO member VALUES('TWC', 'twice', 9, '서울', '02', '111', 167, '20110-19');
    INSERT INTO member VALUES('BLK', 'blackpink', 4, '경남', '055', '222', '163', '2016-8-8');
    INSERT INTO member VALUES('WMN', 'girlfriend', 6, '경기', '031', '333', 166, '2015-1-15');
    ```

<br>

## **Constraints**

* **Primary Key**
  * Alter Constraints
  ```sql
  ALTER TABLE member
    ADD CONSTRAINT
    PRIMARY KEY (mem_id);
  ```
  * Duplicate **X** , Null **X**


<br>

* **Foreign Key**
  *  PK 와 FK는 연동되어 있어서 DB에 **무결성**을 제공함
  
  *  Alter Constraints
  ```sql
  ALTER TABLE buy
  ADD CONSTRAINT
  FOREIGN KEY(mem_id)
  REFERENCES member(mem_id);
  ```
  * Dynamic Programming
  ```sql
  ALTER TABLE buy
  ADD CONSTRAINT
  FOREIGN KEY(mem_id) REFERENCES member(mem_id)
  ON UPDATE CASCADE
  ON DELETE CASCADE;
  ```

<br>


* **NULL & CHECK & DEFAULT**
  *  UNIQUE : 중복 불가, 단 **NULL** 값의 입력과 중복은 가능
  
  *  Using Create table
  ```sql
  DROP TABLE IF EXISTS member;
  CREATE TABLE member
  (
  mem_id CHAR(8) NOT NULL PRIMARY KEY,
  mem_name VARCHAR(10) NOT NULL DEFAULT 'tom',
  height TINYINT UNSIGNED NULL CHECK(height >= 100),
  email CHAR(30) NULL UNIQUE
  )
  ```

  * Alter
  ```sql
  ALTER TABLE member
        ADD CONSTRAINT
        CHECK (phone1 IN ('02', '031', '032', '054', '055'))

  ALTER TABLE member
        ALTER COLUMN phone1 SET DEFAULT '02';
  ```

## **Virtual Table : View**

* **Create View**
  * 데이터 베이스에 보안을 위해 사용 됨(접근 권한 제한)
  
  * Code
  ```sql
      CREATE VIEW v_viewtest1
    AS
    	SELECT 
        B.mem_id `MEMBER ID`, M.mem_name `MEMBER NAME`, 
        B.prod_name `Product Name`, 
        CONCAT(M.phone1, M.phone2)  `Office Phone`
    		FROM buy B
    			INNER JOIN member M
                ON B.mem_id = M.mem_id;
    
    SELECT DISTINCT `MEMBER ID`, `MEMBER NAME` 
            FROM v_viewtest1;
  ```

* **Alter View**
  * Code
  ```sql
  ALTER VIEW v_viewtest1
    AS
    	SELECT 
        B.mem_id `회원 아이디`, M.mem_name `회원 이름`, 
        B.prod_name `제품 이름`, 
        CONCAT(M.phone1, M.phone2)  `연락처`
    		FROM buy B
    			INNER JOIN member M
                ON B.mem_id = M.mem_id;
    
    SELECT DISTINCT `회원 아이디`, `회원 이름` 
            FROM v_viewtest1;
  ```

* **Drop View**
  * Code
  ```sql
  DESCRIBE v_viewtest1; -- Check View info
  SHOW CREATE VIEW v_viewtest1; -- Check View src code
  
  DROP VIEW v_viewtest1;
  ```

* **Data via Views**
  ```sql
  -- UPDATE -- 
  UPDATE v_member SET addr = '부산' WHERE mem_id = 'BLK';  

  -- INSERT --
  INSERT INTO v_member(mem_id, mem_name, addr) 
  VALUES ('BTS', '방탄소년단', '경기')
  
  -- In Condition --
  CREATE VIEW v_heights167
  AS
        SELECT * FROM member WHERE height >= 167;
        WITH CHECK OPTION -- 위의 조건 외에 값은 받지 않음
  SELECT * FROM v_heights167;

  -- Check View Status --
  CHECK TABLE v_heights167;

  ```
  * 관련 뷰가 있더라도 테이블은 삭제 될 수 있음   

<br>

* **단순 뷰 / 복합 뷰** : 하나의 테이블로 만든 뷰/ 두 개이상 ""


# Basic SQL 

> * __USE__ : 데이터 베이스를 선택
> * __기본 구문__
>      
>  ```SQL
>  SELECT column_name
>      FROM table_name
>      WHERE where_condition
>      GROUP BY column_name
>      HAVING having_condition
>      ORDER BY column_name
>      LIMIT number 
>  ```
> * __BETWEEN ~ AND / IN / LIKE__
> ```sql
>WHERE height BETWEEN 163 AND 170;
>WHERE addr IN("US", "UK", "KOREA");
>WHERE mem_name LIKE "tom%";
>```
>
> 용어 |영문용어|설명
> :-----:|:---:|:---:
> 주석|remark| --
> AUTO_INCREMENT||자동으로 숫자를 입력시켜줌
> _||문자열에서 한 문자에 대응
> <br>
>  * __INSERT__ 문은 테이블에 데이터를 입력하는 명령입니다
> ```sql
>INSERT INTO table_name (column1, column2, ..) VALUES (value1, value2 ..)
>```
> * __AUTO_INCREMENT__ 
> ```sql
>CREATE TABLE test_table(
>column1 INT AUTO_INCREMENT PRIMARY KEY, -- auto 는 pk
>column2 CHAR(4)
>)
>ALTER TABLE test_table AUTO_INCREMENT = 100; --start from 100
>SET @auto_increment=3; -- get bigger by 3
>
> -- 한번에 INSERT 하기
>-- INSERT INTO table_name (column1, column2 ...)
>--    SELECT ...;
>```
>
>* __UPDATE__
>```sql
>UPDATE table_name
>   SET column1 = value1, column2 = value2 ...
>   WHERE where_condition
>```
>* __DELETE__
>```sql
>DELETE FROM table_name WHERE where_condition;
>```
>* __DELETE, TRUCATE, DROP__
>```sql
>DELETE FROM big_table1 -- excute by row
>DROP TABLE big_table2  -- remove table
>TRUNCATE TABLE big_table3 -- remove data only not table
>```

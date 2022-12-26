# Index

## **Advantages and Disadvantages of indexes**

* **Adventages**
  * SELECT 문으로 검색하는 속도가 매우 빨라집니다
  * 그 결과 컴퓨터의 부담이 줄어들어서 결국 전체 시스템의 성능이 향상됩니다

* **Disadvantages**
  * 인덱스도 공간을 차지해서 데이터베이스 안에 추가적인 공간이 필요합니다(인덱스는 대략 테이블 크기의 **10%** 정도의 공간이 추가로 필요합니다)
  
  * 처음에 인덱스를 만드는 데 시간이 오래 걸릴 수 있습니다
  * SELECT가 아닌 데이터의 변경 작업 **(INSERT, UPDATE, DELETE)** 이 자주 일어나면 오히려 성능이 나빠질 수도 있습니다 

## **Type of Index**
```sql
CREATE TABLE table2
(
col1 INT PRIMARY KEY, -- Clusterd Index
col2 INT UNIQUE,      -- Secondary Index
col3 INT UNIQUE
);

SHOW INDEX FROM table2;
``` 

* **Clusterd Index**
  * 영어사전처럼 내용이 이미 내용이 정렬되어 있는 인덱스
  * 기본 키로 지정하면 클러스터형 인덱스가 생성되고 해당열로 자동 정렬
  * 테이블 당 1개

* **Secondary Index**
  * 별도의 공간에 인덱스가 생성
  * 고유 키로 지정하면 보조 인덱스가 생성되고 자동 정렬 되지 않음
  * 테이블 당 여러 개
  
## **Index Structure**

* **Clusterd Index**
  * Alter
    ```sql
    ALTER TABLE cluster
            ADD CONSTRAINT
            PRIMARY KEY(mem_id);
    ```
   ![title](/Study_SQL/texture/cluster.JPG)
<br>

* **Secondary Index**
  * Alter
  ```sql
  ALTER TABLE second
            ADD CONSTRAINT
            UNIQUE (mem_id);
  ```

  ![title](/Study_SQL/texture/secondaryindex.JPG)
<br>

* **페이지 분할**
  * 데이터를 입력할 때, 입력할 페이지에 공간이 없어서 2개의 페이지로 데이터가 나눠지는 것을 말함 (Insert 시 속도저하 유발)

## **Index Syntax**
```sql
-- 테이블에 생성된 인덱스 정보 표시
SHOW INDEX FROM member; 


-- 테이블에 생성된 인덱스 크기 표시
-- LIKE : 'member' 이름이 들어간 테이블 찾기
-- ANALYZE : Analyze 명령 후 인덱스 적용 됨
ANALYZE TABLE member;
SHOW TABLE STATUS LIKE 'member';

-- 단순 보조 인덱스
CREATE INDEX idx_member_addr
        ON member (addr);

-- 고유 보조 인덱스, 중복 값 입력 X
CREATE UNIQUE INDEX idx_member_mem_number
        ON member(mem_number);

-- 인덱스 제거
DROP INDEX idx_member_addr ON member;
```
* 인덱스가 있어도 MySQL 인 판단하여 사용하지 않을 수 있음

* WHERE 문에서 열에 연산이 가해지면 인덱스를 사용하지 않음


## **How to use indexes effectively**

1. WHERE 절에서 사용되는 열에 인덱스를 만들어야 함
```sql
SELECT mem_id, mem_name, mem_number
    FROM member
    -- mem_name에 index 생성 필요
    WHERE mem_name = '에이핑크';
```

2. WHERE 절에 사용되더라도 자주 사용되어야 함
3. 데이터의 중복이 높은 열은 인덱스를 만들어도 별 효과가 없음
4. 사용하지 않는 인덱스는 제거하는 것이 바람직함


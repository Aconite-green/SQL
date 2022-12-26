-- Create Main DB
USE market_db;
CREATE TABLE singer (SELECT mem_id, mem_name, mem_number, addr FROM member);

-- Create Backup DB
CREATE TABLE backup_singer
(
    mem_id CHAR(8) NOT NULL,
    mem_name VARCHAR(10) NOT NULL,
    mem_number INT NOT NULL,
    addr CHAR(2) NOT NULL,
    modType CHAR(2), -- Delete or Update
    modDate DATE, -- Changed date
    modUser VARCHAR(30) -- User who changes
);

-- Create Update Trigger

DROP TRIGGER IF EXISTS singer_updateTrg;
DELIMiter $$
CREATE TRIGGER singer_updateTrg
    AFTER UPDATE
    ON singer 
    FOR EACH ROW
BEGIN
    INSERT INTO backup_singer VALUES (OLD.mem_id, OLD.mem_name,
        OLD.mem_number, OLD.addr, 'update', CURDATE(), CURRENT_USER());

END $$
DELIMiter ;

-- Create Delete Trigger

DROP TRIGGER IF EXISTS singer_deleteTrg;
DELIMiter $$
CREATE TRIGGER singer_deleteTrg
    AFTER DELETE
    ON singer 
    FOR EACH ROW
BEGIN
    INSERT INTO backup_singer VALUES (OLD.mem_id, OLD.mem_name,
        OLD.mem_number, OLD.addr, 'delete', CURDATE(), CURRENT_USER());

END $$
DELIMiter ;

-- OLD : 내장 테이블 update, delete 시 기록테이블로 쓰임
-- NEW : 내장 테이블 insert 시 이 테이블을 거쳐서 작업 테이블로 데이터가 입력됨
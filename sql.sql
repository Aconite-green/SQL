-- Create Main DB
USE market_db;
CREATE TABLE singer (SELECT mem_id, mem_name, mem_number, addr FROM member);

-- Create Backup DB
CREATE TABLE backup_singer
(
    mem_id CHAR(8) NOT NULL,
    mem_name VARCHAR(10) NOT NULL,
    addr CHAR(2) NOT NULL,
    modType CHAR(2), -- Delete or Update
    modDate DATE, -- Changed date
    modUser VARCHAR(30) -- User who changes
);

-- Create Update Trigger


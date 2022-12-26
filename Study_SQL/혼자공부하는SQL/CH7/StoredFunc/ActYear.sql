DROP FUNCTION IF EXISTS calcYearFunc;
DELIMITER $$
CREATE FUNCTION calcYearFunc(dYear INT)
	RETURNS INT
BEGIN
	DECLARE runYear INT;
    SET runYear = YEAR(curdate()) - dYear;
    RETURN runYear;
END $$
DELIMITER ;

SELECT calcYearFunc(2010) AS '활동 햇수'; 
--Joe Pollock

--STORED PROCEDURE 1

--put down a cat if it’s older than 10

CREATE PROCEDURE putDownIfTen
AS
DELETE CAT
FROM CAT
WHERE DATEDIFF(YEAR, DateOfBirth, GETDATE()) >= 10

-- EXECUTION

exec putDownIfTen

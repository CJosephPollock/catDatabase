-- Jordan Hand

--STORED PROCEDURE 2

--insert a new cat

CREATE PROCEDURE InsertCat
    @CatName varchar(30), 
    @BreedName varchar(30),
    @DateOfBirth DATE,
    @VendorName varchar(30)
AS
BEGIN

    DECLARE @VendorID INT = 
        (
            SELECT VendorID FROM VENDOR V WHERE V.VendorName = @VendorName
        )
    DECLARE @BreedID INT = 
        (
            SELECT BreedID FROM BREED B WHERE B.BreedName =  @BreedName
        )
    DECLARE @Price MONEY = (SELECT RAND() * 20.00)

    IF @BreedID IS NOT NULL OR @VendorID IS NOT NULL 
    BEGIN
        INSERT INTO dbo.CAT
            (
                CatName,
                VendorID,
                BreedID,
                DateOfBirth,
                Price
            )

        VALUES
            (
                @CatName,
                @VendorID,
                @BreedID,
                @DateOfBirth,
                @Price
            )
    END
END

-- EXECUTIONS

EXECUTE InsertCat 'Fluffles', 'Burmese', '20151010', '3M'
EXECUTE InsertCat 'Ash', 'American Wirehair', '20130302', '3M Stationery'
EXECUTE InsertCat 'Annie', 'Balinese', '20130502', '3M Stationery'
EXECUTE InsertCat 'Amy', 'Bombay', '20130302', 'White Rain Company'
EXECUTE InsertCat 'Bucket', 'Bengal Cats', '20141102', '3M Stationery'
EXECUTE InsertCat 'Ash', 'Bombay', '20141207', 'White Rain Company'

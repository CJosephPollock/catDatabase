-- Joe Pollock

-- BUSINESS RULE

-- outbreak of ebola caused by Siamese cats.
-- Thus our shelter will no longer accept/buy
-- any Siamese cats from our suppliers

-- FUNCTION

create function fn_checkBreedType()
returns int
as
begin
    declare @result int = 0
    if exists(select * from CAT c join BREED b on b.BreedID = c.BreedID where b.BreedName like '%Siamese%')
        set @result = 1

    return @result
end

go

-- CHECK CONSTRAINT

alter table CAT 
add constraint checkBreedType
check (dbo.fn_checkBreedType() = 0)

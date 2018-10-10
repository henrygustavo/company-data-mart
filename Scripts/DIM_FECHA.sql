-- declare variables to hold the start and end date
DECLARE @StartDate datetime
DECLARE @EndDate datetime

--- assign values to the start date and end date we 
-- want our reports to cover (this should also take
-- into account any future reporting needs)
SET @StartDate = '01/01/2018'
SET @EndDate = '01/01/2019' 

-- using a while loop increment from the start date 
-- to the end date
DECLARE @LoopDate datetime
SET @LoopDate = @StartDate

WHILE @LoopDate <= @EndDate
BEGIN
 -- add a record into the date dimension table for this date
 INSERT INTO DIM_FECHA(ANIO,MES,DIA,Hora) VALUES (Year(@LoopDate),Month(@LoopDate), Day(@LoopDate), DATEPART(HOUR, @LoopDate))

 
 -- increment the LoopDate by 1 day before
 -- we start the loop again
 SET @LoopDate = DateAdd(hh, 1, @LoopDate)
END





--truncate table  dim_fecha

--select * from  dim_fecha
create table DimRailwayStations
(
   StationKey INT IDENTITY PRIMARY KEY NOT NULL,
   Station_id INT NOT NULL,
   Propertyid INT NOT NULL,
   StationName varchar(50) NOT NULL,
   StreetName varchar(50) NOT NULL,
   StreetType varchar(50) NOT NULL,
   EntranceType varchar(50) NOT NULL,
   Latitude decimal(9,6) NOT NULL,
   Longitude decimal(9,6) NOT NULL,
   ExitNumber INT NOT NULL
);

CREATE TABLE DimProperties
(
   PropertyKey INT PRIMARY KEY IDENTITY NOT NULL,
   PropertyId INT NOT NULL,
   State varchar(50) NOT NULL,
   Suburb varchar(50) NOT NULL,
   Property_Median_Value money NOT NULL
);

CREATE TABLE DimSuburbs
(
   SuburbKey INT PRIMARY KEY IDENTITY NOT NULL,
   Suburb_id INT NOT NULL,
   School_id INT NOT NULL,
   Suburbname varchar(50) NOT NULL,
   Cityname varchar(50) NOT NULL,
   State varchar(50) NOT NULL,
   Statecode varchar(25) NOT NULL,
   Postcode INT NOT NULL,
   Latitude decimal(9,6) NOT NULL,
   Longitude decimal(9,6) NOT NULL
);

CREATE TABLE DimSchools
(
   SchoolKey INT IDENTITY PRIMARY KEY NOT NULL,
   School_id INT NOT NULL,
   Suburb_id INT NOT NULL,
   School_Code INT NOT NULL,
   SchoolName varchar(50) NOT NULL,
   SchoolAddress varchar(50) NOT NULL,
   Town_Suburb varchar(50) NOT NULL,
   Postcode INT NOT NULL, 
   School_speciality_type varchar(50) NOT NULL,
   StudentNumber INT NOT NULL,
   Gender varchar(50) NOT NULL,
   ICSEA_Value INT NOT NULL,
   LevelofSchooling varchar(50) NOT NULL,
   IsSelective varchar(30) NOT NULL,
   local_health_district varchar(50) NOT NULL,
   ASGS_Remoteness varchar(50) NOT NULL,
   Latitude decimal(9,6) NOT NULL,
   Longitude decimal(9,6) NOT NULL
);


CREATE TABLE FactAustraliaProperties
(
   FactKey INT IDENTITY PRIMARY KEY NOT NULL,
   PropertyKey INT NOT NULL,
   StationKey INT NOT NULL,
   SuburbKey INT NOT NULL,
   SchoolKey INT NOT NULL,
   DateKey INT NOT NULL,
   FullDate DATE NULL
);

ALTER TABLE [dbo].[FactAustraliaProperties]
ADD FOREIGN KEY(PropertyKey) REFERENCES [dbo].[DimProperties](PropertyKey),
ADD FOREIGN KEY(StationKey) REFERENCES [dbo].[DimRailwayStations](StationKey),
ADD FOREIGN KEY([SchoolKey]) REFERENCES [dbo].[DimSchools](SchoolKey),
ADD FOREIGN KEY([SuburbKey]) REFERENCES [dbo].[DimSuburbs](SuburbKey),
ADD FOREIGN KEY([DateKey]) REFERENCES [dbo].[DimDates](DateKey)


Create table DimDates
(
   DateKey INT NOT NULL IDENTITY PRIMARY KEY,
   FullDate DATE NULL,
   DateName nchar(11) NOT NULL,
   DayOfWeek tinyint NOT NULL,
   DayNameOfWeek nchar(10) NOT NULL,
   DayOfMonth tinyint NOT NULL,
   DayOfYear smallint NOT NULL,
   WeekdayWeekend nchar(10) NOT NULL,
   WeekOfYear tinyint NOT NULL,
   MonthName nchar(10) NOT NULL,
   MonthOfYear tinyint NOT NULL,
   IsLastDayOfMonth nchar(1) NOT NULL,
   CalendarQuarter tinyint NOT NULL,
   CalendarYear smallint NOT NULL,
   CalendarYearMonth nchar(10) NOT NULL,
   CalendarYearQtr nchar(10) NOT NULL,
   FiscalMonthOfYear tinyint NOT NULL,
   FiscalQuarter tinyint NOT NULL,
   FiscalYear INT NOT NULL,
   FiscalYearMonth nchar(10) NOT NULL,
   FiscalYearQtr nchar(10) NOT NULL
);

select * from [dbo].[DimSuburbs]

select * from [dbo].[DimRailwayStations]

select * from [dbo].[DimSchools]

SELECT * FROM [dbo].[FactAustraliaProperties]

select * from [dbo].[DimDates]

select * from [dbo].[DimProperties]
















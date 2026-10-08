USE ShopDB; 
GO


IF OBJECT_ID('dbo.TestTable', 'U') IS NOT NULL
    DROP TABLE dbo.TestTable;
GO


CREATE TABLE dbo.TestTable (
    ID INT IDENTITY(1,1) NOT NULL,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    CreatedDate DATETIME,
    ValueData INT
);
GO


SET NOCOUNT ON;
INSERT INTO dbo.TestTable (FirstName, LastName, Email, CreatedDate, ValueData)
SELECT TOP 1000000 
    'Name_' + CAST(a.object_id AS VARCHAR(10)),
    'Last_' + CAST(b.object_id AS VARCHAR(10)),
    'user_' + CAST(a.object_id AS VARCHAR(10)) + '@test.com',
    DATEADD(day, - (a.object_id % 365), GETDATE()),
    ABS(CHECKSUM(NEWID())) % 10000
FROM sys.all_objects a
CROSS JOIN sys.all_objects b
CROSS JOIN sys.all_objects c;
GO
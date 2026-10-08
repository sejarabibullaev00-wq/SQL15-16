USE ShopDB;
GO

SET STATISTICS IO ON;
GO

SELECT * 
FROM dbo.TestTable 
WHERE ValueData = 5000;
GO

CREATE CLUSTERED INDEX IX_TestTable_ValueData 
ON dbo.TestTable (ValueData);
GO
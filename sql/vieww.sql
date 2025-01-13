CREATE VIEW GOLDDD.coviddataa
AS
SELECT * FROM OPENROWSET(
    BULK 'https://covidanalyzingstorage.dfs.core.windows.net/silver/CoviddataTransformed/',
    FORMAT ='PARQUET'
) as query1
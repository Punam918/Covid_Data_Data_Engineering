CREATE DATABASE SCOPED CREDENTIAL cred_punam
WITH
    IDENTITY = 'Managed Identity'

CREATE EXTERNAL DATA SOURCE source_silver
WITH
(
    LOCATION = 'https://covidanalyzingstorage.dfs.core.windows.net/silver/',
    CREDENTIAL = cred_punam

)

CREATE EXTERNAL DATA SOURCE source_gold
WITH
(
    LOCATION = 'https://covidanalyzingstorage.dfs.core.windows.net/gold',
    CREDENTIAL = cred_punam
)

CREATE EXTERNAL FILE FORMAT  format_parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

CREATE EXTERNAL TABLE gold.covid
WITH 
(
    LOCATION = 'covid',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS 
SELECT * FROM gold.coviddataa;















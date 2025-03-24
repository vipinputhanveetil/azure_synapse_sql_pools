####serverless sql test query
-- This is auto-generated code
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://pocdlsgen2acc.dfs.core.windows.net/inbound/customer.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0'
    ) AS [result]




###dedicated sql quereis
CREATE TABLE [dbo].[customer]
(
    customer_id NVARCHAR(50),
    name NVARCHAR(50),
    email NVARCHAR(50),
    country NVARCHAR(50)
)
WITH
(
    DISTRIBUTION = HASH (customer_id),
    CLUSTERED COLUMNSTORE INDEX
)
GO
COPY INTO [dbo].[customer]
(customer_id 1, name 2,email 3,country 4)
FROM 'https://pocdlsgen2acc.dfs.core.windows.net/inbound/customer.csv'
WITH
(
    FILE_TYPE = 'CSV'
);

SELECT * FROM [dbo].[customer] ORDER BY customer_id;

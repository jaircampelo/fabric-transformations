CREATE TABLE [SalesLT].[Address] (

	[AddressID] int NULL, 
	[AddressLine1] varchar(60) NULL, 
	[AddressLine2] varchar(60) NULL, 
	[City] varchar(30) NULL, 
	[StateProvince] varchar(50) NULL, 
	[CountryRegion] varchar(50) NULL, 
	[PostalCode] varchar(15) NULL, 
	[rowguid] uniqueidentifier NULL, 
	[ModifiedDate] datetime2(6) NULL
);
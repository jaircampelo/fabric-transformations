CREATE   PROCEDURE [SalesLT].[sp_upsert_Adress]
    @ModifiedSince DATETIME2(0)
AS
BEGIN

MERGE INTO [dw_fabric_transformations].[SalesLT].[Address]  as t
USING [lh_fabric_transformations].[SalesLT].[Address]       as s
   ON t.AddressID = s.AddressID
 WHEN MATCHED AND s.ModifiedDate >= @ModifiedSince THEN
      UPDATE SET t.AddressLine1  = s.AddressLine1
               , t.AddressLine2  = s.AddressLine2
               , t.City          = s.City
               , t.StateProvince = s.StateProvince
               , t.CountryRegion = s.CountryRegion
               , t.PostalCode    = s.PostalCode
               , t.rowguid       = s.rowguid
               , t.ModifiedDate  = s.ModifiedDate
 WHEN NOT MATCHED BY TARGET THEN
      INSERT (
               AddressID
             , AddressLine1
             , AddressLine2
             , City
             , StateProvince
             , CountryRegion
             , PostalCode
             , rowguid
             , ModifiedDate
             )
      VALUES (
               s.AddressID
             , s.AddressLine1
             , s.AddressLine2
             , s.City
             , s.StateProvince
             , s.CountryRegion
             , s.PostalCode
             , s.rowguid
             , s.ModifiedDate
             );

END;
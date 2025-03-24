/*
============================================================
create Database and schema
============================================================
Script purpose:
  This script creayes a new database named 'DataWarehouse' after checking if it already exists.
  if the database already exists, it will be dropped and recreated.
  Additionally, it creates a three(3) schemas: 'bronze', 'silver', 'gold' in the database.

    The 'bronze' schema is used to store the raw data from the source.
    The 'silver' schema is used to store the transformed data from the 'bronze' schema.
    The 'gold' schema is used to store the final data that will be used for analysis.

    WARNING: This script will drop the database if it already exists.
    Ensure that you have backed up the database before running this script.
*/

USE master;
GO
-- Drop and recreate the database
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END
GO
-- Create the database
CREATE DATABASE DataWarehouse;
GO

-- Create the schemas
USE DataWarehouse;
GO
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;

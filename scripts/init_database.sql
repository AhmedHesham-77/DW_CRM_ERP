-- Drop old database if exists
DO $$
BEGIN
	PERFORM dblink_exec('dbname=postgres user=admin', 'DROP DATABASE IF EXISTS baraa_project;');
END $$;

-- Create new database
DO $$
BEGIN
	PERFORM dblink_exec('dbname=postgres user=admin', 'CREATE DATABASE baraa_project;');
END $$;

-- Create schemas
DO $$
BEGIN
	PERFORM dblink_exec('dbname=baraa_project user=admin', 'CREATE SCHEMA bronze; CREATE SCHEMA silver; CREATE SCHEMA gold;');
END $$;
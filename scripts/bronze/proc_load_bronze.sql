CREATE OR REPLACE PROCEDURE BRONZE.LOAD_BRONZE () LANGUAGE PLPGSQL AS $$
BEGIN

-- Loading cust_info table
TRUNCATE TABLE BRONZE.CUST_INFO;
COPY BRONZE.CUST_INFO
FROM
	'/mnt/d/Projects/Data Warehouse/DW with Baraa project/DW_CRM_ERP/datasets/source_crm/cust_info.csv'
WITH
	(FORMAT CSV, HEADER TRUE);

-- Loading prd_info table
TRUNCATE TABLE BRONZE.PRD_INFO;
COPY BRONZE.PRD_INFO
FROM
	'/mnt/d/Projects/Data Warehouse/DW with Baraa project/DW_CRM_ERP/datasets/source_crm/prd_info.csv'
WITH
	(FORMAT CSV, HEADER TRUE);

-- Loading sales_details table
TRUNCATE TABLE BRONZE.SALES_DETAILS;
COPY BRONZE.SALES_DETAILS
FROM
	'/mnt/d/Projects/Data Warehouse/DW with Baraa project/DW_CRM_ERP/datasets/source_crm/sales_details.csv'
WITH
	(FORMAT CSV, HEADER TRUE);

-- Loading CUST_AZ12 table
TRUNCATE TABLE BRONZE.CUST_AZ12;
COPY BRONZE.CUST_AZ12
FROM
	'/mnt/d/Projects/Data Warehouse/DW with Baraa project/DW_CRM_ERP/datasets/source_erp/CUST_AZ12.csv'
WITH
	(FORMAT CSV, HEADER TRUE);

-- Loading LOC_A101 table
TRUNCATE TABLE BRONZE.LOC_A101;
COPY BRONZE.LOC_A101
FROM
	'/mnt/d/Projects/Data Warehouse/DW with Baraa project/DW_CRM_ERP/datasets/source_erp/LOC_A101.csv'
WITH
	(FORMAT CSV, HEADER TRUE);

-- Loading PX_CAT_G1V2 table
TRUNCATE TABLE BRONZE.PX_CAT_G1V2;
COPY BRONZE.PX_CAT_G1V2
FROM
	'/mnt/d/Projects/Data Warehouse/DW with Baraa project/DW_CRM_ERP/datasets/source_erp/PX_CAT_G1V2.csv'
WITH
	(FORMAT CSV, HEADER TRUE);
EXCEPTION
	WHEN OTHERS THEN
		RAISE NOTICE 'Error while loading :%', SQLERRM;
		
END $$;
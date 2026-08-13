/*

*/

EXEC bronze.chargement_bronze

CREATE OR ALTER PROCEDURE bronze.chargement_bronze AS
BEGIN
	DECLARE @deb_chargmt DATETIME, @fin_chargmt DATETIME
	BEGIN TRY
		PRINT '==================================================='
		PRINT 'CHARGEMENT DE LA COUCHE BRONZE'
		PRINT '==================================================='

		PRINT '---------------------------------------------------'
		PRINT 'CHARGEMENT SOURCE CRM'
		PRINT '---------------------------------------------------'

		SET @deb_chargmt = GETDATE()
		PRINT 'SUPPRESSION DU CONTENU PRECEDENT'
		TRUNCATE TABLE  bronze.crm_cust_info

		PRINT 'CHARGEMENT DU NOUVEAU CONTENU'
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\HP\Documents\DataWarehouse-Project\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2, 
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		SET @fin_chargmt = GETDATE()
		PRINT 'TEMPS CHARGEMENT bronze.crm_cust_info : ' + CAST(DATEDIFF(second, @fin_chargmt, @deb_chargmt) AS VARCHAR) + ' secondes '

		SET @deb_chargmt = GETDATE()
		PRINT 'SUPPRESSION DU CONTENU PRECEDENT'
		TRUNCATE TABLE  bronze.crm_prd_info

		PRINT 'CHARGEMENT DU NOUVEAU CONTENU'
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\HP\Documents\DataWarehouse-Project\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2, 
			FIELDTERMINATOR = ',',
			TABLOCK
		)

		SET @deb_chargmt = GETDATE()
		PRINT 'SUPPRESSION DU CONTENU PRECEDENT'
		TRUNCATE TABLE  bronze.crm_sales_details

		PRINT 'CHARGEMENT DU NOUVEAU CONTENU'
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\HP\Documents\DataWarehouse-Project\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2, 
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		SET @fin_chargmt = GETDATE()
		PRINT 'TEMPS CHARGEMENT bronze.crm_sales_details : ' + CAST(DATEDIFF(second, @fin_chargmt, @deb_chargmt) AS VARCHAR) + ' secondes '

		PRINT '---------------------------------------------------'
		PRINT 'CHARGEMENT SOURCE ERP'
		PRINT '---------------------------------------------------'

		SET @deb_chargmt = GETDATE()
		PRINT 'SUPPRESSION DU CONTENU PRECEDENT'
		TRUNCATE TABLE  bronze.erp_cust_az12

		PRINT 'CHARGEMENT DU NOUVEAU CONTENU'
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\HP\Documents\DataWarehouse-Project\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2, 
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		SET @fin_chargmt = GETDATE()
		PRINT 'TEMPS CHARGEMENT bronze.erp_cust_az12 : ' + CAST(DATEDIFF(second, @fin_chargmt, @deb_chargmt) AS VARCHAR) + ' secondes '

		SET @deb_chargmt = GETDATE()
		PRINT 'SUPPRESSION DU CONTENU PRECEDENT'
		TRUNCATE TABLE  bronze.erp_loc_a101

		PRINT 'CHARGEMENT DU NOUVEAU CONTENU'
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\HP\Documents\DataWarehouse-Project\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2, 
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		SET @fin_chargmt = GETDATE()
		PRINT 'TEMPS CHARGEMENT bronze.erp_loc_a101 : ' + CAST(DATEDIFF(second, @fin_chargmt, @deb_chargmt) AS VARCHAR) + ' secondes '

		SET @deb_chargmt = GETDATE()
		PRINT 'SUPPRESSION DU CONTENU PRECEDENT'
		TRUNCATE TABLE  bronze.erp_px_cat_g1v2

		PRINT 'CHARGEMENT DU NOUVEAU CONTENU'
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\HP\Documents\DataWarehouse-Project\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2, 
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		SET @fin_chargmt = GETDATE()
		PRINT 'TEMPS CHARGEMENT bronze.erp_px_cat_g1v2 : ' + CAST(DATEDIFF(second, @fin_chargmt, @deb_chargmt) AS VARCHAR) + ' secondes '
	END TRY
	BEGIN CATCH
		PRINT '==================================================='
		PRINT 'ERREUR LORS DU CHARGEMENT DES DONNEES'
		PRINT 'message d erreur' + ERROR_MESSAGE()
		PRINT 'CODE ERREUR' + CAST(ERROR_NUMBER() AS VARCHAR)
		PRINT '==================================================='
	END CATCH
END

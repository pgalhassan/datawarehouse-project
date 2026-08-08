/*
=============================================================
Création de la base de données et des schémas
=============================================================
Objectif du script :

Ce script crée une nouvelle base de données nommée « Datawarehouse » après avoir vérifié si elle existe déjà.

Si la base de données existe déjà, elle est supprimée puis recréée. De plus, le script configure trois schémas :

« bronze », « silver » et « gold ».

AVERTISSEMENT :

L’exécution de ce script supprimera l’intégralité de la base de données « DataWarehouse » si elle existe.

Toutes les données de la base de données seront définitivement effacées. Procédez avec prudence et assurez-vous de disposer de sauvegardes adéquates avant d’exécuter ce script.

*/

USE master;
GO

-- Supprimez et recréez la base de données « DataWarehouse ».
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Datawarehouse')
BEGIN
    ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Datawarehouse;
END;
GO
CREATE DATABASE Datawarehouse
GO
USE Datawarehouse
GO
CREATE SCHEMA bronze
GO
CREATE SCHEMA silver
GO
CREATE SCHEMA gold
GO

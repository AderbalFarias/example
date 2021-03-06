-- Changing database properties

-- Get key database properties for all databases on current instance
SELECT db.[name] AS [Database Name], db.recovery_model_desc AS [Recovery Model], db.state_desc, db.containment_desc,
db.log_reuse_wait_desc AS [Log Reuse Wait Description], db.[compatibility_level] AS [DB Compatibility Level], 
db.page_verify_option_desc AS [Page Verify Option], db.is_auto_create_stats_on, db.is_auto_update_stats_on, 
db.is_auto_update_stats_async_on, db.is_parameterization_forced, db.snapshot_isolation_state_desc, 
db.is_read_committed_snapshot_on, db.is_auto_close_on, db.is_auto_shrink_on, 
db.target_recovery_time_in_seconds, db.is_cdc_enabled, db.is_published, db.is_distributor, db.is_encrypted,
db.group_database_id, db.replica_id,db.is_memory_optimized_elevate_to_snapshot_on, 
db.delayed_durability_desc, db.is_auto_create_stats_incremental_on, db.is_sync_with_backup, 
db.is_supplemental_logging_enabled, db.is_encrypted, 
de.encryption_state, de.percent_complete, de.key_algorithm, de.key_length      
FROM sys.databases AS db WITH (NOLOCK)
LEFT OUTER JOIN sys.dm_database_encryption_keys AS de WITH (NOLOCK)
ON db.database_id = de.database_id
ORDER BY db.[name];


-- Change some database poperties
USE [master]
GO

ALTER DATABASE [TestingWorks] SET AUTO_UPDATE_STATISTICS_ASYNC ON WITH NO_WAIT;
GO
ALTER DATABASE [TestingWorks] SET PAGE_VERIFY CHECKSUM  WITH NO_WAIT;
GO
ALTER DATABASE [TestingWorks] SET DELAYED_DURABILITY = ALLOWED WITH NO_WAIT;
GO

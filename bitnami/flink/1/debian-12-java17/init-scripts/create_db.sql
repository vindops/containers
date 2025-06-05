create database snp_data_dev;

SELECT 
    resource_type,
    resource_database_id,
    DB_NAME(resource_database_id) AS DatabaseName,
    request_mode,
    request_session_id,
    request_status
FROM sys.dm_tran_locks
WHERE resource_database_id = DB_ID('model');

KILL 76;
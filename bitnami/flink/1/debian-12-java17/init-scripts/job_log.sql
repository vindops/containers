-- snp_data_dev.dbo.job_log definition

-- Drop table

-- DROP TABLE snp_data_dev.dbo.job_log;

CREATE TABLE dbo.job_log (
	id INT IDENTITY(1,1) NOT NULL,
	[level] VARCHAR(10) NULL,
	env VARCHAR(255) NULL,
	job_name VARCHAR(255) NULL,
	log_message TEXT NOT NULL,
	log_data TEXT NULL,
	log_timestamp DATETIME NULL,
	CONSTRAINT PK_JOB_LOG PRIMARY KEY (id)
);
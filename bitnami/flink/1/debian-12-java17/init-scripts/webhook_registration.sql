-- Create table webhook_registration --
create table webhook_registration
(
    id                      INT IDENTITY(1,1) NOT NULL,
    callback_url            VARCHAR(255) NULL,
    destination_system_code VARCHAR(255) NULL,
    table_name              VARCHAR(255) NULL,
    topic                   VARCHAR(255) NULL,
    type                    VARCHAR(15) NULL,
    CONSTRAINT PK_WEBHOOK_REGISTRATION PRIMARY KEY (id)
);

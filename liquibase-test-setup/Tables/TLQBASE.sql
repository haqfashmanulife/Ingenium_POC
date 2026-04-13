--liquibase formatted sql
--changeset firoz:create_tlqbase_table

-------------------------------------------------------------------------------
-- Set DB2 CURRENT PATH
-- appSchema is injected by Liquibase via --changeLogParameter
-------------------------------------------------------------------------------

SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM",${appSchema}

-------------------------------------------------------------------------------
-- Create table TLQBASE
-------------------------------------------------------------------------------

CREATE TABLE ${appSchema}.TLQBASE (
    ID        INTEGER NOT NULL,
    NAME      VARCHAR(50),
    CREATED_TS TIMESTAMP DEFAULT CURRENT TIMESTAMP
);

-------------------------------------------------------------------------------
-- Add Primary Key
-------------------------------------------------------------------------------

ALTER TABLE ${appSchema}.TLQBASE
    ADD CONSTRAINT PK_TLQBASE PRIMARY KEY (ID);

-------------------------------------------------------------------------------
-- Rollback section
-------------------------------------------------------------------------------
--rollback ALTER TABLE ${appSchema}.TLQBASE DROP CONSTRAINT PK_TLQBASE
--rollback DROP TABLE ${appSchema}.TLQBASE

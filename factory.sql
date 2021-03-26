CREATE TABLE __Factory__ (
    Id int IDENTITY (1,1) NOT NULL
    ,FactoryId varchar(100)
    ,FactoryName varchar(200)
    ,IsActive bit NOT NULL DEFAULT 1
    ,CONSTRAINT PK___Factory___Id PRIMARY KEY NONCLUSTERED (Id)
    ,CONSTRAINT UQ___Factory___FactoryId UNIQUE CLUSTERED (FactoryId)
    ,CONSTRAINT UQ___Factory___FactoryName UNIQUE NONCLUSTERED (FactoryName)
);

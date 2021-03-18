CREATE TABLE Factory (
    Id int IDENTITY (1,1) NOT NULL
    ,FactoryId varchar(100)
    ,FactoryName varchar(200)
    ,IsActive bit NOT NULL DEFAULT 1
    ,CONSTRAINT PK_Factory_Id PRIMARY KEY NONCLUSTERED (Id)
    ,CONSTRAINT UQ_Factory_FactoryId UNIQUE CLUSTERED (FactoryId)
    ,CONSTRAINT UQ_Factory_FactoryName UNIQUE NONCLUSTERED (FactoryName)
);

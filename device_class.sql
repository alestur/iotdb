CREATE TABLE DeviceClass (
    Id int IDENTITY (1,1) NOT NULL
    ,ClassName varchar(100)
    ,TableName varchar(100)
    ,CONSTRAINT PK_DeviceClass_Id PRIMARY KEY NONCLUSTERED (Id)
    ,CONSTRAINT UQ_DeviceClass_ClassName UNIQUE CLUSTERED (ClassName)
);

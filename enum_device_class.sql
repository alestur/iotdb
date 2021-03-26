CREATE TABLE __EnumDeviceClass__ (
    Id int IDENTITY (1,1) NOT NULL
    ,ClassName varchar(100)
    ,TableName varchar(100)
    ,CONSTRAINT PK___EnumDeviceClass___Id PRIMARY KEY NONCLUSTERED (Id)
    ,CONSTRAINT UQ___EnumDeviceClass___ClassName UNIQUE CLUSTERED (ClassName)
);

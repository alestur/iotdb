CREATE TABLE Device (
    Id int IDENTITY (1,1) NOT NULL
    ,DeviceId varchar(100) NOT NULL
    ,Factory int NOT NULL FOREIGN KEY REFERENCES Factory(Id)
    ,DeviceClass int FOREIGN KEY REFERENCES DeviceClass(Id)
    ,MachineName varchar(100)
    ,IsActive bit NOT NULL DEFAULT 1
    ,CONSTRAINT PK_Device_Id PRIMARY KEY NONCLUSTERED (Id)
    ,CONSTRAINT UQ_DeviceClass_DeviceId UNIQUE CLUSTERED (DeviceId)
);

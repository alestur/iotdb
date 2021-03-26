CREATE TABLE __Device__ (
    Id int IDENTITY (1,1) NOT NULL
    ,DeviceId varchar(100) NOT NULL
    ,Factory int NOT NULL FOREIGN KEY REFERENCES __Factory__(Id)
    ,DeviceClass int FOREIGN KEY REFERENCES __EnumDeviceClass__(Id)
    ,MachineName varchar(100)
    ,IsActive bit NOT NULL DEFAULT 1
    ,CONSTRAINT PK___Device___Id PRIMARY KEY NONCLUSTERED (Id)
    ,CONSTRAINT UQ___DeviceClass___DeviceId UNIQUE CLUSTERED (DeviceId)
);

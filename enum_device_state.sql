CREATE TABLE __EnumDeviceState__ (
    Id int IDENTITY (1,1) NOT NULL
    ,DeviceClass int FOREIGN KEY REFERENCES __EnumDeviceClass__(Id)
    ,Slug varchar(20) NOT NULL
    ,Label varchar(100) NOT NULL
    ,CONSTRAINT PK___DeviceState___Id PRIMARY KEY NONCLUSTERED (Id)
    ,CONSTRAINT UQ___DeviceState___Slug UNIQUE CLUSTERED (DeviceClass, Slug)
);


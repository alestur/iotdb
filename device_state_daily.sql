CREATE TABLE __DeviceStateDaily__ (
    Id int IDENTITY (1,1) NOT NULL
    ,Day date NOT NULL
    ,Device int NOT NULL FOREIGN KEY REFERENCES __Device__(Id)
    ,DeviceState int NOT NULL FOREIGN KEY REFERENCES __EnumDeviceState__(Id)
    ,Hours float NOT NULL
    ,Percentage float NOT NULL
    ,CONSTRAINT PK___DeviceStateDaily___Id PRIMARY KEY NONCLUSTERED (Id)
    ,CONSTRAINT UQ___DeviceStateDaily___DDS UNIQUE CLUSTERED (Day, Device, DeviceState)
);

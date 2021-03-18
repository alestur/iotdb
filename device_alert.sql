CREATE TABLE DeviceAlert (
    Id int IDENTITY (1,1) NOT NULL
    ,Device int FOREIGN KEY REFERENCES Device(Id)
    ,Tst datetime NOT NULL
    ,DeviceTime datetime
    ,DeviceStatus varchar(20)
    ,AlertCode varchar(20)
    ,AlertMsg varchar(8000)
    ,AlertLevel varchar(20)
    ,CONSTRAINT PK_DeviceAlert_Id PRIMARY KEY CLUSTERED (Id)
);

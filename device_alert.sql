CREATE TABLE __DeviceAlert__ (
    Id int IDENTITY (1,1) NOT NULL
    ,Device int FOREIGN KEY REFERENCES __Device__(Id)
    ,Tst datetime NOT NULL
    ,DeviceTime datetime
    ,DeviceStatus varchar(20)
    ,AlertType varchar(20)
    ,AlertCode varchar(20)
    ,AlertMsg varchar(8000)
    ,AlertLevel varchar(20)
    ,CONSTRAINT PK___DeviceAlert___Id PRIMARY KEY CLUSTERED (Id)
);

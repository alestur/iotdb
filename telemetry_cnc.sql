CREATE TABLE __TelemetryCNC__ (
    Id int IDENTITY (1,1) NOT NULL
    ,DeviceId varchar(100)
    ,FactoryId varchar(100)
    ,Tst datetime NOT NULL
    ,DeviceTime datetime
    ,DeviceStatus varchar(20)
    ,MachineTime datetime
    ,MachineState varchar(20)
    ,RunTime float
    ,ShiftTime float
    ,SpindleLoad float
    ,XAxisLoad float
    ,YAxisLoad float
    ,ZAxisLoad float
    ,SpindlePtc float   -- TODO
    ,FeedPct float      -- TODO
    ,TraversePtc float  -- TODO
    ,CONSTRAINT PK___TelemetryCNC___Id PRIMARY KEY NONCLUSTERED (Id)
    ,CONSTRAINT UQ___TelemetryCNC___Tst UNIQUE CLUSTERED (DeviceId, Tst)
);

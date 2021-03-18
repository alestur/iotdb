CREATE TABLE TelemetryCNC (
    Id int IDENTITY (1,1) NOT NULL
    ,DeviceId varchar(100)
    ,Tst datetime NOT NULL
    ,DeviceTime datetime
    ,MachineTime datetime
    ,RunTime float
    ,DeviceStatus varchar(20)
    ,State varchar(20)
    ,SpindleLoad float
    ,XAxisLoad float
    ,YAxisLoad float
    ,ZAxisLoad float
    ,SpindlePtc float
    ,FeedPct float
    ,TraversePtc float
    ,AutoRunTime float
    ,IdleRunTime float
    ,CONSTRAINT PK_TelemetryCNC_Id PRIMARY KEY NONCLUSTERED (Id)
    ,CONSTRAINT UQ_TelemetryCNC_Tst UNIQUE CLUSTERED (DeviceId, Tst)
);

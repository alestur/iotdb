CREATE TABLE __TelemetryCNCAggr__ (
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
    ,SpindleLoadAvg float
    ,SpindleLoadMax float
    ,SpindleLoadMin float
    ,XAxisLoadAvg float
    ,XAxisLoadMax float
    ,XAxisLoadMin float
    ,YAxisLoadAvg float
    ,YAxisLoadMax float
    ,YAxisLoadMin float
    ,ZAxisLoadAvg float
    ,ZAxisLoadMax float
    ,ZAxisLoadMin float
    ,SpindlePtcAvg float
    ,SpindlePtcMax float
    ,SpindlePtcMin float
    ,FeedPtcAvg float
    ,FeedPtcMax float
    ,FeedPtcMin float
    ,TraversePtcAvg float
    ,TraversePtcMax float
    ,TraversePtcMin float
    ,CONSTRAINT PK___TelemetryCNCAggr___Id PRIMARY KEY NONCLUSTERED (Id)
    ,CONSTRAINT UQ___TelemetryCNCAggr___Tst UNIQUE CLUSTERED (DeviceId, Tst)
);

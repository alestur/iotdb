CREATE TABLE DevFactory0 (
    FactoryId int IDENTITY (1,1) NOT NULL
    ,FactoryName varchar(200)
    ,IsActive bit NOT NULL DEFAULT 1
    ,CONSTRAINT PK_DevFactory0_FactoryId PRIMARY KEY NONCLUSTERED (FactoryID)
    ,CONSTRAINT PK_DevFactory0_FactoryName UNIQUE CLUSTERED (FactoryName)
);

CREATE TABLE DevFactoryDaily0 (
    FactoryDailyId int IDENTITY (1,1) NOT NULL
    ,FactoryId int NOT NULL FOREIGN KEY REFERENCES DevFactory0(FactoryId)
    ,Day date NOT NULL
    ,Efficiency float
    ,CONSTRAINT PK_DevFactoryDaily0_DevFactoryDailyId PRIMARY KEY NONCLUSTERED (FactoryDailyId)
    ,CONSTRAINT PK_DevFactoryDaily0_Day UNIQUE CLUSTERED (FactoryId, Day)
);

CREATE TABLE DevDeviceClass0 (
    DeviceClassId int IDENTITY (1,1) NOT NULL
    ,ClassName varchar(100)
    ,TableName varchar(100)
    ,CONSTRAINT PK_DeviceClassId_DeviceClassId PRIMARY KEY NONCLUSTERED (DeviceClassId)
    ,CONSTRAINT PK_DeviceClassId_ClassName UNIQUE CLUSTERED (ClassName)
);

CREATE TABLE DevDevice0 (
    DeviceId varchar(100) NOT NULL
    ,FactoryId int NOT NULL FOREIGN KEY REFERENCES DevFactory0(FactoryId)
    ,DeviceClassId int FOREIGN KEY REFERENCES DevDeviceClass0(DeviceClassId)
    ,MachineName varchar(100)
    ,IsActive bit NOT NULL DEFAULT 1
    ,CONSTRAINT PK_DevDevice0_DeviceId PRIMARY KEY CLUSTERED (DeviceId)
);

CREATE TABLE DevDeviceCNC0 (
    DeviceId varchar(100) FOREIGN KEY REFERENCES DevDevice0(DeviceId)
    ,ShiftHours int
    ,RunTimeMark bit NOT NULL
    ,ShiftStartTime time
    ,OilChangeInterval int
    ,OilHoursResetTime int
    ,OilHours int
    ,SpindleChangeInterval int
    ,SpindleHoursResetTime float
    ,SpindleHours float
    ,CONSTRAINT PK_DevDeviceCNC0_DeviceId PRIMARY KEY CLUSTERED (DeviceId)
);

CREATE TABLE DevDeviceAlert0 (
    DeviceAlertId int IDENTITY (1,1) NOT NULL
    ,DeviceId varchar(100) FOREIGN KEY REFERENCES DevDevice0(DeviceId)
    ,Tst datetime NOT NULL
    ,AlertCode varchar(20)
    ,AlertMsg varchar(8000)
    ,AlertLevel varchar(20)
    ,CONSTRAINT PK_DevDeviceAlert0_DeviceAlertId PRIMARY KEY CLUSTERED (DeviceAlertId)
);

CREATE TABLE DevTelemetryCNC0 (
    TelemetryCNCId int IDENTITY (1,1) NOT NULL
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
    ,CONSTRAINT PK_DevTelemetryCNC0_TelemetryCNCId PRIMARY KEY NONCLUSTERED (TelemetryCNCId)
    ,CONSTRAINT PK_DevTelemetryCNC0_Tst UNIQUE CLUSTERED (DeviceId, Tst)
);

CREATE TABLE DevDeviceDailyCNC0 (
    DevDeviceDailyCNCId int IDENTITY (1,1) NOT NULL
    ,DeviceId varchar(100) NOT NULL FOREIGN KEY REFERENCES DevDevice0(DeviceId)
    ,Day date NOT NULL
    ,Efficiency float NOT NULL
    ,AutoRunTime time NOT NULL
    ,AlertsWarning int NOT NULL
    ,AlertsStd int NOT NULL
    ,AlertsCrit int NOT NULL
    ,CONSTRAINT PK_DevDeviceAlert0_DevDeviceDailyCNCId PRIMARY KEY CLUSTERED (DevDeviceDailyCNCId)
);


--
-- Stream Analytics job query
--
SELECT [DeviceId] AS [DeviceId]
    ,System.TimeStamp AS [Tst]
    ,CAST(CONCAT(
        SUBSTRING([DeviceTime], 1, 4), '-'
        ,SUBSTRING([DeviceTime], 5, 2), '-'
        ,SUBSTRING([DeviceTime], 7, 2), 'T'
        ,SUBSTRING([DeviceTime], 9, 2), ':'
        ,SUBSTRING([DeviceTime], 11, 2), ':'
        ,SUBSTRING([DeviceTime], 13, 6)
    ) as datetime) AS [DeviceTime]
    ,CAST(CONCAT(
        SUBSTRING([MachineTime], 1, 4), '-'
        ,SUBSTRING([MachineTime], 5, 2), '-'
        ,SUBSTRING([MachineTime], 7, 2), 'T'
        ,SUBSTRING([MachineTime], 9, 2), ':'
        ,SUBSTRING([MachineTime], 11, 2), ':'
        ,SUBSTRING([MachineTime], 13, 6)
    ) as datetime) AS [MachineTime]
    ,CAST(SUBSTRING([RunTime], 1, LEN([RunTime]) - 4) as float) * 3600
        + CAST(SUBSTRING([RunTime], LEN([RunTime]) - 3, 2) as float) * 60
        + CAST(SUBSTRING([RunTime], LEN([RunTime]) - 1, 2) as float) AS [RunTime]
    ,CONCAT([RunStatusAuto], [RunStatusStart], [RunStatusMDI]) AS [DeviceStatus]
    ,'' AS [State]
    ,CAST([SpindleLoad] as float) AS [SpindleLoad]
    ,CAST([XAxisLoad] as float) AS [XAxisLoad]
    ,CAST([YAxisLoad] as float) AS [YAxisLoad]
    ,CAST([ZAxisLoad] as float) AS [ZAxisLoad]
    ,CAST([SpindlePtc] as float) AS [SpindlePtc]
    ,CAST([FeedPct] as float) AS [FeedPct]
    ,CAST([TraversePtc] as float) AS [TraversePtc]
    ,CAST(SUBSTRING([AutoRunTime], 1, LEN([AutoRunTime]) - 4) as float) * 3600
        + CAST(SUBSTRING([AutoRunTime], LEN([AutoRunTime]) - 3, 2) as float) * 60
        + CAST(SUBSTRING([AutoRunTime], LEN([AutoRunTime]) - 1, 2) as float) AS [AutoRunTime]
    ,CAST(SUBSTRING([IdleRunTime], 1, LEN([IdleRunTime]) - 4) as float) * 3600
        + CAST(SUBSTRING([IdleRunTime], LEN([IdleRunTime]) - 3, 2) as float) * 60
        + CAST(SUBSTRING([IdleRunTime], LEN([IdleRunTime]) - 1, 2) as float) AS [IdleRunTime]
INTO
    [DevTelemetryCNC0]
FROM
    [DevIoTHub0]

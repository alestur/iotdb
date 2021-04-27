SELECT [T].[DeviceID] AS [DeviceId]
    ,[T].[FactoryID] AS [FactoryId]
    ,System.TimeStamp AS [Tst]
    ,CAST(CONCAT(
        SUBSTRING([T].[DeviceTime], 1, 4), '-'
        ,SUBSTRING([T].[DeviceTime], 5, 2), '-'
        ,SUBSTRING([T].[DeviceTime], 7, 2), 'T'
        ,SUBSTRING([T].[DeviceTime], 9, 2), ':'
        ,SUBSTRING([T].[DeviceTime], 11, 2), ':'
        ,SUBSTRING([T].[DeviceTime], 13, 6)
    ) as datetime) AS [DeviceTime]
    ,[T].[DeviceStatus] AS [DeviceStatus]
    ,CAST(CONCAT(
        SUBSTRING([T].[MachineTime], 1, 4), '-'
        ,SUBSTRING([T].[MachineTime], 5, 2), '-'
        ,SUBSTRING([T].[MachineTime], 7, 2), 'T'
        ,SUBSTRING([T].[MachineTime], 9, 2), ':'
        ,SUBSTRING([T].[MachineTime], 11, 2), ':'
        ,SUBSTRING([T].[MachineTime], 13, 6)
    ) as datetime) AS [MachineTime]
    ,[T].[MachineState] AS [MachineState]
    ,CAST(SUBSTRING([T].[RunTime], 1, LEN([T].[RunTime]) - 4) as float) * 3600
        + CAST(SUBSTRING([T].[RunTime], LEN([T].[RunTime]) - 3, 2) as float) * 60
        + CAST(SUBSTRING([T].[RunTime], LEN([T].[RunTime]) - 1, 2) as float) AS [RunTime]
    ,DATEDIFF(second, '00:00:00', CAST(System.TimeStamp AS DATETIME)) - [__DeviceCNC__].[ShiftStartSec] AS [ShiftTime]
    ,CAST([T].[SpindleLoad] as float) AS [SpindleLoad]
    ,CAST([T].[XAxisLoad] as float) AS [XAxisLoad]
    ,CAST([T].[YAxisLoad] as float) AS [YAxisLoad]
    ,CAST([T].[ZAxisLoad] as float) AS [ZAxisLoad]
    ,CAST([T].[SpindlePtc] as float) AS [SpindlePtc]
    ,CAST([T].[FeedPtc] as float) AS [FeedPtc]
    ,CAST([T].[TraversePtc] as float) AS [TraversePtc]
INTO
    [__TelemetryCNC__]
FROM
    [__IoTHub__] [T]
    INNER JOIN [__DeviceCNC__] ON [T].[DeviceID] = [__DeviceCNC__].[DeviceID]

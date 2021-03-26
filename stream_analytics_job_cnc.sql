SELECT [DeviceID] AS [DeviceId]
    ,[FactoryID] AS [FactoryId]
    ,System.TimeStamp AS [Tst]
    ,CAST(CONCAT(
        SUBSTRING([DeviceTime], 1, 4), '-'
        ,SUBSTRING([DeviceTime], 5, 2), '-'
        ,SUBSTRING([DeviceTime], 7, 2), 'T'
        ,SUBSTRING([DeviceTime], 9, 2), ':'
        ,SUBSTRING([DeviceTime], 11, 2), ':'
        ,SUBSTRING([DeviceTime], 13, 6)
    ) as datetime) AS [DeviceTime]
    ,[DeviceStatus] AS [DeviceStatus]
    ,CAST(CONCAT(
        SUBSTRING([MachineTime], 1, 4), '-'
        ,SUBSTRING([MachineTime], 5, 2), '-'
        ,SUBSTRING([MachineTime], 7, 2), 'T'
        ,SUBSTRING([MachineTime], 9, 2), ':'
        ,SUBSTRING([MachineTime], 11, 2), ':'
        ,SUBSTRING([MachineTime], 13, 6)
    ) as datetime) AS [MachineTime]
    ,[MachineState] AS [MachineState]
    ,CAST(SUBSTRING([RunTime], 1, LEN([RunTime]) - 4) as float) * 3600
        + CAST(SUBSTRING([RunTime], LEN([RunTime]) - 3, 2) as float) * 60
        + CAST(SUBSTRING([RunTime], LEN([RunTime]) - 1, 2) as float) AS [RunTime]
    ,DATEDIFF(second, [__DeviceCNC__].[ShiftStartTime], CAST(System.TimeStamp AS TIME)) AS [ShiftTime]
    ,CAST([SpindleLoad] as float) AS [SpindleLoad]
    ,CAST([XAxisLoad] as float) AS [XAxisLoad]
    ,CAST([YAxisLoad] as float) AS [YAxisLoad]
    ,CAST([ZAxisLoad] as float) AS [ZAxisLoad]
    ,CAST([SpindlePtc] as float) AS [SpindlePtc]
    ,CAST([FeedPct] as float) AS [FeedPct]
    ,CAST([TraversePtc] as float) AS [TraversePtc]
INTO
    [__TelemetryCNC__]
    LEFT JOIN [__Device__] ON [__Device__].[DeviceId] = [DeviceId]
    LEFT JOIN [__DeviceCNC__] ON [__DeviceCNC__].[Device] = [__Device__].[Id]
FROM
    [__IoTHub__]

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

INSERT INTO {pref:s}TelemetryCNCAggr{ver:03d} (
    DeviceId
    ,FactoryId
    ,Tst
    ,DeviceTime
    ,MachineTime
    ,RunTime
    ,ShiftTime
    ,SpindleLoadAvg
    ,SpindleLoadMax
    ,SpindleLoadMin
    ,XAxisLoadAvg
    ,XAxisLoadMax
    ,XAxisLoadMin
    ,YAxisLoadAvg
    ,YAxisLoadMax
    ,YAxisLoadMin
    ,ZAxisLoadAvg
    ,ZAxisLoadMax
    ,ZAxisLoadMin
    ,SpindlePtcAvg
    ,SpindlePtcMax
    ,SpindlePtcMin
    ,FeedPtcAvg
    ,FeedPtcMax
    ,FeedPtcMin
    ,TraversePtcAvg
    ,TraversePtcMax
    ,TraversePtcMin
) SELECT
    T.DeviceId DeviceId
    ,T.FactoryId FactoryId
    ,MAX(T.Tst) Tst
    ,DATEADD(SECOND, DATEDIFF(SECOND, MIN(T.DeviceTime), MAX(T.DeviceTime)) / 2, MIN(T.DeviceTime)) DeviceTime
    ,DATEADD(SECOND, DATEDIFF(SECOND, MIN(T.MachineTime), MAX(T.MachineTime)) / 2, MIN(T.MachineTime)) MachineTime
    ,(MAX(T.RunTime) + MIN(T.RunTime)) / 2 RunTime
    ,(MAX(T.ShiftTime) + MIN(T.ShiftTime)) / 2 ShiftTime
    ,AVG(T.SpindleLoad) SpindleLoadAvg
    ,MAX(T.SpindleLoad) SpindleLoadMax
    ,MIN(T.SpindleLoad) SpindleLoadMin
    ,AVG(T.XAxisLoad) XAxisLoadAvg
    ,MAX(T.XAxisLoad) XAxisLoadMax
    ,MIN(T.XAxisLoad) XAxisLoadMin
    ,AVG(T.YAxisLoad) YAxisLoadAvg
    ,MAX(T.YAxisLoad) YAxisLoadMax
    ,MIN(T.YAxisLoad) YAxisLoadMin
    ,AVG(T.ZAxisLoad) ZAxisLoadAvg
    ,MAX(T.ZAxisLoad) ZAxisLoadMax
    ,MIN(T.ZAxisLoad) ZAxisLoadMin
    ,AVG(T.SpindlePtc) SpindlePtcAvg
    ,MAX(T.SpindlePtc) SpindlePtcMax
    ,MIN(T.SpindlePtc) SpindlePtcMin
    ,AVG(T.FeedPtc) FeedPtcAvg
    ,MAX(T.FeedPtc) FeedPtcMax
    ,MIN(T.FeedPtc) FeedPtcMin
    ,AVG(T.TraversePtc) TraversePtcAvg
    ,MAX(T.TraversePtc) TraversePtcMax
    ,MIN(T.TraversePtc) TraversePtcMin
FROM
    {pref:s}TelemetryCNC{ver:03d} T
    LEFT JOIN (
        SELECT
            MIN(A.Tst) Tst
            ,A.DeviceId
        FROM
            {pref:s}TelemetryCNC{ver:03d} A
        WHERE
            A.Tst > (SELECT MAX(B.Tst) FROM {pref:s}TelemetryCNCAggr{ver:03d} B WHERE A.DeviceId = B.DeviceId)
        GROUP BY
            A.DeviceId
    ) XMaxTst ON XMaxTst.DeviceId = T.DeviceId
    ,{pref:s}Settings{ver:03d} S
WHERE
    S.Param = 'TelemetryAggregationMidSeconds'
    AND (
        DATEDIFF(SECOND, XMaxTst.Tst, GETDATE()) > CAST(S.Value AS INT)
        AND T.Tst > XMaxTst.Tst
        AND DATEADD(SECOND, CAST(S.Value AS INT), XMaxTst.Tst) >= T.Tst
    ) OR (
        XMaxTst.Tst IS NULL
        AND T.Tst > DATEADD(SECOND, - CAST(S.Value AS INT), GETDATE())
        AND GETDATE() >= T.Tst
    )
GROUP BY
    T.DeviceId
    ,T.FactoryId
;

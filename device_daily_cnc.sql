CREATE TABLE DeviceDailyCNC (
    Id int IDENTITY (1,1) NOT NULL
    ,Device int NOT NULL FOREIGN KEY REFERENCES Device(Id)
    ,Day date NOT NULL
    ,AutoRunTime float NOT NULL
    ,FeedRate float NOT NULL
    ,Efficiency float NOT NULL
    ,CONSTRAINT PK_DeviceAlert_Id PRIMARY KEY CLUSTERED (Id)
);

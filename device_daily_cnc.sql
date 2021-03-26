CREATE TABLE __DeviceDailyCNC__ (
    Id int IDENTITY (1,1) NOT NULL
    ,Device int NOT NULL FOREIGN KEY REFERENCES __Device__(Id)
    ,Day date NOT NULL
    ,AutoRunTime float NOT NULL
    ,FeedRate float NOT NULL
    ,Efficiency float NOT NULL
    ,CONSTRAINT PK___DeviceDailyCNC___Id PRIMARY KEY CLUSTERED (Id)
);

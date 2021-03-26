CREATE TABLE __DeviceDaily__ (
    Id int IDENTITY (1,1) NOT NULL
    ,Device int NOT NULL FOREIGN KEY REFERENCES __Device__(Id)
    ,Day date NOT NULL
    ,AlertsWarning int NOT NULL
    ,AlertsStd int NOT NULL
    ,AlertsCrit int NOT NULL
    ,CONSTRAINT PK___DeviceDaily___Id PRIMARY KEY CLUSTERED (Id)
);

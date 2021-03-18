CREATE TABLE FactoryDaily (
    Id int IDENTITY (1,1) NOT NULL
    ,Factory int NOT NULL FOREIGN KEY REFERENCES DevFactory0(Id)
    ,Day date NOT NULL
    ,Efficiency float
    ,CONSTRAINT PK_FactoryDaily_Id PRIMARY KEY NONCLUSTERED (Id)
    ,CONSTRAINT UQ_FactoryDaily_Day UNIQUE CLUSTERED (Factory, Day)
);

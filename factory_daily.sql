CREATE TABLE __FactoryDaily__ (
    Id int IDENTITY (1,1) NOT NULL
    ,Factory int NOT NULL FOREIGN KEY REFERENCES __Factory__(Id)
    ,Day date NOT NULL
    ,Efficiency float
    ,CONSTRAINT PK___FactoryDaily___Id PRIMARY KEY NONCLUSTERED (Id)
    ,CONSTRAINT UQ___FactoryDaily___Day UNIQUE CLUSTERED (Factory, Day)
);

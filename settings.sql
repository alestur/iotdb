CREATE TABLE __Settings__ (
    Id int IDENTITY (1,1) NOT NULL
    ,Param varchar(100) NOT NULL
    ,Value varchar(8000)
    ,Description varchar(100)
    ,CONSTRAINT PK___Settings___Id PRIMARY KEY NONCLUSTERED (Id)
    ,CONSTRAINT UQ___Settings___Param UNIQUE CLUSTERED (Param)
);

CREATE TABLE DeviceCNC (
    Device int FOREIGN KEY REFERENCES Device(Id)
    ,ShiftHours int
    ,ShiftStartTime time
    ,OilChangeInterval int
    ,OilHoursResetTime int
    ,OilHours int
    ,SpindleChangeInterval int
    ,SpindleHoursResetTime float
    ,SpindleHours float
    ,CONSTRAINT PK_DeviceCNC_Id PRIMARY KEY CLUSTERED (Id)
);

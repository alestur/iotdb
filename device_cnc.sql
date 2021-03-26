CREATE TABLE __DeviceCNC__ (
    Device int FOREIGN KEY REFERENCES __Device__(Id)
    ,ShiftHours int
    ,ShiftStartTime time
    ,OilChangeInterval int
    ,OilHoursResetTime int
    ,OilHours int
    ,SpindleChangeInterval int
    ,SpindleHoursResetTime float
    ,SpindleHours float
    ,CONSTRAINT PK___DeviceCNC___Id PRIMARY KEY CLUSTERED (Device)
);

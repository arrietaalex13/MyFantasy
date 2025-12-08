CREATE TABLE fantasy.drivers (
    driverid VARCHAR2 (20),
    name     VARCHAR2 (40),
    code     VARCHAR2 (3),
    CONSTRAINT pk_drivers
        PRIMARY KEY (driverid)
);
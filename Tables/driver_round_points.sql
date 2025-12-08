CREATE TABLE fantasy.driver_round_points (
    YEAR     NUMBER (4, 0),
    ROUND    NUMBER (2, 0) NOT NULL ENABLE,
    DRIVERID VARCHAR2 (15),
    POINTS   NUMBER (3, 0),
    CONSTRAINT pk_driver_round_points PRIMARY KEY (year,
                                                   round,
                                                   driverid),
    CONSTRAINT fk_round_points_driver FOREIGN KEY (driverid)
        REFERENCES fantasy.drivers (driverid)
);
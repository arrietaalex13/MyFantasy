CREATE TABLE fantasy.con_round_points (
    year          NUMBER (4, 0),
    round         NUMBER (2, 0),
    constructorid VARCHAR2 (20),
    points        NUMBER (3, 0),
    CONSTRAINT pk_con_round_points PRIMARY KEY (year,
                                                round,
                                                constructorid),
    CONSTRAINT fk_con_round_points FOREIGN KEY (constructorid)
        REFERENCES fantasy.constructors (constructorid));
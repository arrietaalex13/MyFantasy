CREATE OR REPLACE VIEW FANTASY.V_DRIVER_ROUND_POINTS (
    YEAR,
    ROUND,
    DRIVERID,
    POINTS,
    POS
) AS
    SELECT t.year,
           t.round,
           t.driverid,
           t.points,
           ROW_NUMBER ()
           OVER (PARTITION BY t.year, t.round
                 ORDER BY t.points DESC
           )
      FROM fantasy.driver_round_points t;
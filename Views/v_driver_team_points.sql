CREATE OR REPLACE VIEW FANTASY.V_DRIVER_TEAM_POINTS (
    team,
    driverid,
    total_points
) AS
    SELECT t.username,
           t.pick,
           SUM (t.points)
      FROM fantasy.v_lineup_with_points t
     GROUP BY t.username,
              t.pick;
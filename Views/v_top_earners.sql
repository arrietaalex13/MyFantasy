CREATE OR REPLACE FORCE VIEW FANTASY.V_TOP_EARNERS (
    team,
    driverid,
    points
) AS
    SELECT t.team,
           MAX (t.driverid) KEEP (DENSE_RANK FIRST ORDER BY t.total_points DESC NULLS LAST),
           MAX (t.total_points) KEEP (DENSE_RANK FIRST ORDER BY t.total_points DESC NULLS LAST)
      FROM fantasy.v_driver_team_points t
     GROUP BY t.team;
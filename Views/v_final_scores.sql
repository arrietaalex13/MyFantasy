   CREATE OR REPLACE FORCE VIEW fantasy.v_final_scores (YEAR, team_name, total_points) AS
   SELECT a.year,
          u.team_name,
          a.points+u.base_points
     FROM (
             SELECT t.year,
                    t.username,
                    SUM(t.points) points
               FROM fantasy.v_points_by_round t
           GROUP BY t.year,
                    t.username
          ) a
     JOIN fantasy.users u ON u.username=a.username
 ORDER BY a.points+u.base_points DESC;
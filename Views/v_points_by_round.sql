   CREATE OR REPLACE FORCE VIEW fantasy.v_points_by_round (
YEAR,
round,
username,
points,
running_total,
rank
) AS
   SELECT b.year,
          b.round,
          b.username,
          b.points,
          b.running_total,
          DENSE_RANK() over (
          PARTITION BY b.year,
                    b.round
           ORDER BY b.running_total DESC
          ) rank
     FROM (
             SELECT a.year,
                    a.round,
                    a.username,
                    a.points,
                    SUM(a.points) over (
                    PARTITION BY a.username
                     ORDER BY a.year,
                              a.round
                    ) running_total
               FROM (
                       SELECT ut.year,
                              ut.round,
                              ut.username,
                              GREATEST(
                              SUM(
                              CASE
                                        WHEN ut.is_star_driver=1
                                              AND fantasy.can_use_star_driver (ut.year, ut.round, ut.username) THEN drp.points*2
                                                  ELSE drp.points
                              END
                              )+SUM(crp.points),
                              650
                              ) points
                         FROM fantasy.users_teams ut
                    LEFT JOIN fantasy.driver_round_points drp ON drp.driverid=ut.pickid
                          AND drp.year=ut.year
                          AND drp.round=ut.round
                    LEFT JOIN fantasy.con_round_points crp ON crp.constructorid=ut.pickid
                          AND crp.year=ut.year
                          AND crp.round=ut.round
                     GROUP BY ut.year,
                              ut.round,
                              ut.username
                    ) a
          ) b;
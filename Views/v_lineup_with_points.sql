CREATE OR REPLACE FORCE EDITIONABLE VIEW FANTASY.V_LINEUP_WITH_POINTS (
    YEAR,
    round,
    username,
    pick,
    points
) AS
    SELECT ut.year,
           ut.round,
           ut.username,
           COALESCE (drp.driverid, crp.constructorid) pick,
           CASE
               WHEN ut.is_star_driver = 1 THEN
                   COALESCE (drp.points, crp.points) * 2
               ELSE
                   COALESCE (drp.points, crp.points)
           END                                        points
      FROM fantasy.users_teams         ut
      LEFT JOIN fantasy.driver_round_points drp
    ON drp.driverid = ut.pickid
       AND drp.round = ut.round
       AND drp.year = ut.year
      LEFT JOIN fantasy.con_round_points    crp
    ON crp.constructorid = ut.pickid
       AND crp.round = ut.round
       AND crp.year = ut.year;
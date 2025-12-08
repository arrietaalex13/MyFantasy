CREATE OR REPLACE FORCE VIEW fantasy.v_star_popularity_by_round (
    driverid,
    round,
    YEAR,
    num_picks,
    who_picked
) AS
    SELECT d.driverid,
           ut.round,
           ut.year,
           COUNT (*),
           LISTAGG (ut.username, ',')
      FROM fantasy.drivers d
      JOIN fantasy.users_teams ut
    ON ut.pickid = d.driverid
       AND ut.is_star_driver = 1
     GROUP BY d.driverid,
              ut.round,
              ut.year
     ORDER BY ut.round,
              COUNT (*) DESC;
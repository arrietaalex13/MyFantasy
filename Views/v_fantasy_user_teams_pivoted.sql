CREATE OR REPLACE FORCE VIEW fantasy.v_fantasy_users_teams_pivoted (
YEAR,
round,
username,
driver1,
driver2,
driver3,
driver4,
driver5,
CONSTRUCTOR
) AS
   SELECT YEAR,
          round,
          username,
          driver1,
          driver2,
          driver3,
          driver4,
          driver5,
          CONSTRUCTOR
     FROM (
             SELECT YEAR,
                    round,
                    username,
                    pick_type,
                    pickid
               FROM fantasy.users_teams
          ) pivot (
          MAX(pickid) FOR pick_type IN (
          'DRIVER1' AS driver1,
          'DRIVER2' AS driver2,
          'DRIVER3' AS driver3,
          'DRIVER4' AS driver4,
          'DRIVER5' AS driver5,
          'CONSTRUCTOR' AS CONSTRUCTOR
          )
          );
CREATE OR REPLACE VIEW fantasy.v_fantasy_users_teams_pivoted (
    year,
    round,
    username,
    driver1,
    driver2,
    driver3,
    driver4,
    driver5,
    constructor
) AS
    SELECT year,
           round,
           username,
           driver1,
           driver2,
           driver3,
           driver4,
           driver5,
           constructor
      FROM (SELECT year,
                   round,
                   username,
                   pick_type,
                   pickid
            FROM fantasy.users_teams
           ) PIVOT (
        MAX (pickid)
        FOR pick_type
        IN ('DRIVER1' AS driver1, 'DRIVER2' AS driver2, 'DRIVER3' AS driver3, 'DRIVER4' AS driver4, 'DRIVER5' AS driver5, 'CONSTRUCTOR'
        AS constructor)
    );
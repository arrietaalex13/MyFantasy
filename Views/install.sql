col db_name format a10

spool install.log

select to_char(current_date, 'mm/dd/yyyy hh:mi:ss am') timestamp from dual;

select substr(global_name, instr(global_name, '_')+1, length(global_name)) db_name from global_name;

@@v_fantasy_user_teams_pivoted.sql
show errors

@@v_final_scores.sql
show errors

@@v_lineup_with_points.sql
show errors

@@v_points_by_round.sql
show errors

@@v_popularity_by_round.sql
show errors

@@v_star_popularity_by_round.sql
show errors

@@v_driver_round_points.sql
show errors

@@v_driver_team_points.sql
show errors

@@v_top_earners.sql
show errors

select to_char(current_date, 'mm/dd/yyyy hh:mi:ss am') timestamp from dual;

spool off
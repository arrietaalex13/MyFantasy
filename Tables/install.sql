col db_name format a10

spool install.log

select to_char(current_date, 'mm/dd/yyyy hh:mi:ss am') timestamp from dual;

select substr(global_name, instr(global_name, '_')+1, length(global_name)) db_name from global_name;

@@constructors.sql
show errors

@@con_round_points.sql
show errors

@@drivers.sql
show errors

@@driver_round_points.sql
show errors

@@leagues.sql
show errors

select to_char(current_date, 'mm/dd/yyyy hh:mi:ss am') timestamp from dual;

spool off
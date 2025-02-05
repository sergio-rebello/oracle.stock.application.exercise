--========================================================================
-- Function GET_LOC_LOV
-- 4th February 2025
--========================================================================
CREATE OR REPLACE FUNCTION get_loc_lov RETURN loc_table_type PIPELINED IS
--
BEGIN
     --
     FOR r IN (SELECT loc,
                      loc_desc 
                 FROM loc
              ) LOOP
         PIPE ROW(loc_obj_type(r.loc, r.loc_desc));
     END LOOP;
     --
     RETURN;
     --
END get_loc_lov;
/
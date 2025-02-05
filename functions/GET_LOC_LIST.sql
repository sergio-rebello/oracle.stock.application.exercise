--========================================================================
-- Function GET_LOC_LIST
-- 4th February 2025
--========================================================================
CREATE OR REPLACE FUNCTION get_loc_list RETURN loc_table_type PIPELINED IS
--
BEGIN
     --
     FOR loc_rec IN (SELECT loc,
                            loc_desc
                       FROM loc
                      ORDER BY loc
                    ) LOOP
         PIPE ROW(loc_obj_type(loc_rec.loc, loc_rec.loc_desc));
     END LOOP;
     --
     RETURN;
     --
END get_loc_list;
/
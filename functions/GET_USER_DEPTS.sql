--========================================================================
-- Function GET_USER_DEPTS
-- 4th February 2025
--========================================================================
CREATE OR REPLACE FUNCTION get_user_depts RETURN SYS.ODCINUMBERLIST IS
--
      l_depts SYS.ODCINUMBERLIST := SYS.ODCINUMBERLIST();
--
BEGIN
     --
     FOR r IN (SELECT dept 
               FROM user_dept 
               WHERE user_id = v('APP_USER')) LOOP
         l_depts.EXTEND;
         l_depts(l_depts.COUNT) := r.dept;
     END LOOP;
     --
     RETURN l_depts;
     --
END get_user_depts;
/
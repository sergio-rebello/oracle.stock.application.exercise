--========================================================================
-- View ITEM_LOC_SOH_FILTERED
-- 4th February 2025
--========================================================================
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ITEM_LOC_SOH_FILTERED" ("ITEM", "LOC", "DEPT", "UNIT_COST", "STOCK_ON_HAND", "STOCK_VALUE") AS 
  SELECT ils.item, 
         ils.loc, 
         ils.dept, 
         ils.unit_cost, 
         ils.stock_on_hand, 
         ils.unit_cost * ils.stock_on_hand AS stock_value
    FROM item_loc_soh ils
   WHERE ils.dept IN (SELECT dept
                        FROM TABLE(get_user_depts())
                     );
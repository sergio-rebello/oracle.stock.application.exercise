--========================================================================
-- View STOCK_VIEW
-- 4th February 2025
--========================================================================
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "STOCK_VIEW" ("ITEM", "LOC", "DEPT", "STOCK_ON_HAND", "UNIT_COST", "STOCK_VALUE") AS 
  SELECT ils.item, 
         ils.loc, 
         ils.dept, 
         ils.stock_on_hand, 
         ils.unit_cost,
         (ils.unit_cost * ils.stock_on_hand) AS stock_value
    FROM item_loc_soh ils;
--========================================================================
-- Package Body ITEM_LOC_HISTORY_PKG
-- 4th February 2025
--========================================================================
CREATE OR REPLACE PACKAGE BODY item_loc_history_pkg AS
    --
    PROCEDURE save_item_loc_history IS
    BEGIN
        INSERT INTO item_loc_soh_history (item, loc, dept, unit_cost, stock_on_hand, stock_value)
        SELECT item,
               loc,
               dept,
               unit_cost,
               stock_on_hand,
               (unit_cost * stock_on_hand) AS stock_value
        FROM item_loc_soh;
        --
        COMMIT;
    END save_item_loc_history;
    --
END item_loc_history_pkg;
/
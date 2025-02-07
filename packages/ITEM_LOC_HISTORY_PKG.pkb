--========================================================================
-- Package Body ITEM_LOC_HISTORY_PKG
-- 4th February 2025
--========================================================================
CREATE OR REPLACE PACKAGE BODY item_loc_history_pkg AS
    --
    PROCEDURE save_item_loc_history IS
        --
        --cursor para selecionar os dados da tabela item_loc_soh
        --
        CURSOR c_item_loc_soh IS
            SELECT item,
                   loc,
                   dept,
                   unit_cost,
                   stock_on_hand,
                   (unit_cost * stock_on_hand) AS stock_value
            FROM item_loc_soh;
    --
    BEGIN
        --
        FOR rec IN c_item_loc_soh LOOP
            INSERT INTO item_loc_soh_history (item, loc, dept, unit_cost, stock_on_hand, stock_value)
            VALUES (rec.item, rec.loc, rec.dept, rec.unit_cost, rec.stock_on_hand, rec.stock_value);
        END LOOP;
        --
        COMMIT;
    END save_item_loc_history;
    --
END item_loc_history_pkg;
/
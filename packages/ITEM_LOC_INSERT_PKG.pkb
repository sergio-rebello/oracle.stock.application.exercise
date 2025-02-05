--========================================================================
-- Package Body ITEM_LOC_INSERT_PKG
-- 4th February 2025
--========================================================================
CREATE OR REPLACE PACKAGE BODY item_loc_insert_pkg IS
    --
    PROCEDURE insert_item_loc_soh_batch IS
        CURSOR cur_item_loc IS
            SELECT item,
                   loc,
                   dept, 
                   DBMS_RANDOM.value(5000, 50000) AS unit_cost, 
                   ROUND(DBMS_RANDOM.value(1000, 100000)) AS stock_on_hand
            FROM item,
                 loc
            WHERE ROWNUM <= 380000;
        --
        TYPE item_loc_table IS TABLE OF cur_item_loc%ROWTYPE;
        v_item_loc_data item_loc_table;
    --
    BEGIN
        --
        OPEN cur_item_loc;
        --
        LOOP
            --
            FETCH cur_item_loc BULK COLLECT INTO v_item_loc_data LIMIT 5000;
            --
            EXIT WHEN v_item_loc_data.COUNT = 0;
            --
            FOR i IN 1..v_item_loc_data.COUNT LOOP
                INSERT INTO item_loc_soh (item, loc, dept, unit_cost, stock_on_hand)
                VALUES (
                        v_item_loc_data(i).item,
                        v_item_loc_data(i).loc,
                        v_item_loc_data(i).dept,
                        v_item_loc_data(i).unit_cost,
                        v_item_loc_data(i).stock_on_hand
                       );
            END LOOP;
            --
            COMMIT;
        END LOOP;
        --
        CLOSE cur_item_loc;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END insert_item_loc_soh_batch;
    --
END item_loc_insert_pkg;
/
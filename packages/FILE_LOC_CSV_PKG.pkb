--========================================================================
-- Package Body FILE_LOC_CSV_PKG
-- 4th February 2025
--========================================================================
CREATE OR REPLACE PACKAGE BODY file_loc_csv_pkg AS
    --
    PROCEDURE generate_clob_for_location IS
              v_clob          CLOB;
              v_location      NUMBER(10);
              v_item          VARCHAR2(25);
              v_dept          NUMBER(4);
              v_unit_cost     NUMBER(20,4);
              v_stock_on_hand NUMBER(12,4);
              v_stock_value   NUMBER(20,4);
              v_csv_line      VARCHAR2(4000);
    BEGIN
        --
        FOR r IN (SELECT DISTINCT loc FROM item_loc_soh) LOOP
            v_location := r.loc;
            --
            DBMS_LOB.createtemporary(v_clob, TRUE);
            --
            v_csv_line := 'Item,Dept,Unit_Cost,Stock_On_Hand,Stock_Value';
            DBMS_LOB.writeappend(v_clob, LENGTH(v_csv_line), v_csv_line);
            --
            FOR data IN (SELECT item,
                                dept,
                                unit_cost,
                                stock_on_hand,
                                unit_cost * stock_on_hand AS stock_value
                           FROM item_loc_soh
                          WHERE loc = v_location
                         ) LOOP
                --
                v_item          := data.item;
                v_dept          := data.dept;
                v_unit_cost     := data.unit_cost;
                v_stock_on_hand := data.stock_on_hand;
                v_stock_value   := data.stock_value;
                --
                v_csv_line      := v_item || ',' || v_dept || ',' || v_unit_cost || ',' || v_stock_on_hand || ',' || v_stock_value;
                --
                DBMS_LOB.writeappend(v_clob, LENGTH(v_csv_line), v_csv_line);
            END LOOP;
            --
            INSERT INTO file_location_clob (loc, file_content)
            VALUES (v_location, v_clob);
            --
            DBMS_LOB.freetemporary(v_clob);
        END LOOP;
        --
        COMMIT;
    END generate_clob_for_location;
    --
END file_loc_csv_pkg;
/
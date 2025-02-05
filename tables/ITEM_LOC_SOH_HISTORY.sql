--========================================================================
-- Table ITEM_LOC_SOH_HISTORY
-- 4th February 2025
--========================================================================
CREATE TABLE "ITEM_LOC_SOH_HISTORY" 
("ITEM"          VARCHAR2(25) NOT NULL ENABLE, 
 "LOC"           NUMBER(10,0) NOT NULL ENABLE, 
 "DEPT"          NUMBER(4,0)  NOT NULL ENABLE, 
 "UNIT_COST"     NUMBER(20,4) NOT NULL ENABLE, 
 "STOCK_ON_HAND" NUMBER(12,4) NOT NULL ENABLE, 
 "STOCK_VALUE"   NUMBER(20,4) NOT NULL ENABLE, 
 "DATE_ADDED"    DATE         DEFAULT SYSDATE
);
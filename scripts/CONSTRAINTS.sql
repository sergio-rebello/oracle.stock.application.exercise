-- Tabela ITEM:
ALTER TABLE item ADD CONSTRAINT pk_item PRIMARY KEY (item);
ALTER TABLE item ADD CONSTRAINT chk_dept CHECK (dept > 0);
-- Tabela LOC:
ALTER TABLE loc ADD CONSTRAINT pk_loc PRIMARY KEY (loc);
-- Tabela ITEM_LOC_SOH:
ALTER TABLE item_loc_soh ADD CONSTRAINT fk_item FOREIGN KEY (item) REFERENCES item (item);
ALTER TABLE item_loc_soh ADD CONSTRAINT fk_loc FOREIGN KEY (loc) REFERENCES loc (loc);
ALTER TABLE item_loc_soh ADD CONSTRAINT chk_stock CHECK (stock_on_hand >= 0);
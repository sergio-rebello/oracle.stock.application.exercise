-- INDEX:
CREATE INDEX idx_item_dept ON item_loc_soh (dept);
CREATE INDEX idx_item_loc ON item_loc_soh (loc);
CREATE INDEX idx_item_dept_loc ON item_loc_soh (dept, loc);
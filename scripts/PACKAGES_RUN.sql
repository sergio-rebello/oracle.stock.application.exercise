-- Insert data on item_loc_soh
BEGIN
     item_loc_insert_pkg.insert_item_loc_soh_batch;
END;
--
-- Transfer Data from item_loc_soh to item_loc_soh_history
BEGIN
     item_loc_pkg.save_item_loc_history;
END;
--
-- Generate the csv files for each location and insert the file CLOB on a specific table
BEGIN
     file_loc_csv_pkg.generate_clob_for_location;
END;
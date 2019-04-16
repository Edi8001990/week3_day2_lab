DROP TABLE IF EXISTS property_tracker;

CREATE TABLE property_tracker(
  id SERIAL4 PRIMARY KEY,
  address VARCHAR(255),
  number_of_rooms INT4,
  build_type VARCHAR(255),
  year_built INT4

);

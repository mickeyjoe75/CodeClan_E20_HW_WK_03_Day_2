

CREATE TABLE bounties (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  collected_by VARCHAR(255),
  bounty_value INT
);

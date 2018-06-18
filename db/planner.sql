DROP TABLE notes;
DROP TABLE days;

CREATE TABLE days (
  id SERIAL4 PRIMARY KEY,
  day VARCHAR(255)
);

CREATE TABLE notes (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  description VARCHAR(255),
  day_id INT4
);

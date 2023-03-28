-- for schemas
CREATE TABLE items(
    id serial PRIMARY KEY,
    label_id VARCHAR(100),
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    FOREIGN KEY (label_id) REFERENCES labels (id),
)

CREATE TABLE books (
    id serial primary key,
    title VARCHAR(100),
    publisher VARCHAR(100),
    cover_state VARCHAR(100),
    FOREIGN KEY(id) REFERENCES items(id)
)

CREATE TABLE labels (
    id serial primary key,
    title VARCHAR(100),
    color VARCHAR(100),
)

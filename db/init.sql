CREATE TABLE IF NOT EXISTS book (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(255),
  published_year INT
);

-- Optional: Insert one record
INSERT INTO book (title, author, published_year)
VALUES ('Atomic Habits', 'James Clear', 2018);

CREATE TABLE expenses (
  id serial PRIMARY KEY,
  amount numeric(6,2) CHECK(amount >= 0.01) NOT NULL,
  memo text NOT NULL,
  created_on date NOT NULL
);

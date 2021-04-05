DROP TABLE "workers";
CREATE TABLE "workers"(
  "id" bigserial PRIMARY KEY,
  "birthday" date NOT NULL CHECK (birthday < current_date),
  "name" varchar(255),
  "salary" integer NOT NULL CHECK ("salary" > 0)
);
/*  */
INSERT INTO "workers"("birthday", "name", "salary")
values('1990-01-30', 'Nikita', 300);
/*  */
INSERT INTO "workers"("birthday", "name", "salary")
values('1999-02-16', 'Svetlana', 1200);
/*  */
INSERT INTO "workers"("birthday", "name", "salary")
values('1980-02-16', 'Yevheniy', 1200),
  ('1993-02-16', 'Petr', 1000);
/*  */
UPDATE "workers"
SET "salary" = 200
WHERE "name" = 'Nikita';
/*  */
UPDATE "workers"
SET "birthday" = '1987-02-16'
WHERE id = 4;
/*  */
UPDATE "workers"
SET "salary" = 700
WHERE "salary" = 500;
/*  */
UPDATE "workers"
SET "birthday" = '1999-12-10'
WHERE id > 2
  AND id <= 5;
/*  */
UPDATE "workers"
SET "name" = 'Jane',
  "salary" = 900
WHERE name = 'Nikita';
/*  */
SELECT *
FROM "workers"
ORDER BY id;
/*  */
SELECT *
FROM "workers"
WHERE id = 3;
/*  */
SELECT *
FROM "workers"
WHERE salary > 400
ORDER BY id;
/*  */
SELECT salary,
  birthday
FROM "workers"
WHERE name = 'Yevheniy';
/*  */
INSERT INTO "workers"("birthday", "name", "salary")
values('1984-12-10', 'Petya', 1300),
  ('1994-01-16', 'Petya', 900);
/*  */
SELECT *
FROM "workers"
WHERE name = 'Petya';
/*   */
SELECT *
FROM "workers"
WHERE NOT name = 'Petya';
/*  */
SELECT *
FROM "workers"
WHERE date_part('year', age(birthday)) as 'age' = 27
  OR salary = 1000;
/*  */
SELECT *
FROM "workers"
WHERE date_part('year', age(birthday)) > 25
  AND date_part('year', age(birthday))  <= 28;
/*  */
SELECT *
FROM "workers"
WHERE date_part('year', age(birthday)) > 23
  AND date_part('year', age(birthday))  < 27
  OR salary > 400 AND salary < 1000;
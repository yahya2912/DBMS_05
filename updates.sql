BEGIN;
UPDATE buch
SET verlag = 'Deutscher Taschenbuch Verlag'
WHERE verlag = 'dtv';
COMMIT;

BEGIN;
UPDATE ausleihe
SET rueckgabe_datum = CURRENT_DATE
WHERE ausleihe_id = 2;
COMMIT;

BEGIN;
UPDATE buch
SET tagesgebuehr = tagesgebuehr + 0.10
WHERE erscheinungsjahr < 1960;
COMMIT;

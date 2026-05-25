PRAGMA foreign_keys = ON;

BEGIN;
UPDATE ausleihe SET rueckgabe_datum = NULL WHERE ausleihe_id = 2;
INSERT INTO ausleihe (ausleihe_id, exemplar_id, mitglied_id, ausleihe_datum)
VALUES (6, 3, 1, CURRENT_DATE);
ROLLBACK;

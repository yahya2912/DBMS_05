PRAGMA foreign_keys = ON;

-- Delete 1: remove loans returned more than 30 days ago
BEGIN;
DELETE FROM ausleihe
WHERE julianday(CURRENT_DATE) - julianday(rueckgabe_datum) > 30;
COMMIT;

-- Delete 2: attempt to delete exemplar 3
BEGIN;
DELETE FROM exemplar WHERE exemplar_id = 3;
ROLLBACK;
-- Result: Runtime error near line 3: FOREIGN KEY constraint failed (19)
-- Cause: exemplar_id = 3 is still referenced by ausleihe (loan 2).
--        ON DELETE RESTRICT blocks the deletion.

-- Delete 3: remove associated loan first, then exemplar 3
BEGIN;
DELETE FROM ausleihe WHERE exemplar_id = 3;
COMMIT;

BEGIN;
DELETE FROM exemplar WHERE exemplar_id = 3;
COMMIT;

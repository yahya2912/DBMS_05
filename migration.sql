ALTER TABLE mitglied
    ADD COLUMN telefon TEXT;

CREATE TABLE buch_neu (
    isbn              TEXT           PRIMARY KEY,
    titel             TEXT           NOT NULL,
    erscheinungsjahr  INTEGER        NOT NULL CHECK (erscheinungsjahr BETWEEN 1450 AND 2100),
    verlag            TEXT           NOT NULL,
    tagesgebuehr      NUMERIC(6,2)   NOT NULL CHECK (tagesgebuehr > 0)
);
INSERT INTO buch_neu SELECT * FROM buch;
DROP TABLE buch;
ALTER TABLE buch_neu RENAME TO buch;

CREATE TABLE exemplar_neu (
    exemplar_id  INTEGER  PRIMARY KEY,
    isbn         TEXT     NOT NULL,
    standort     VARCHAR(10) NOT NULL,
    FOREIGN KEY (isbn) REFERENCES buch(isbn)
        ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO exemplar_neu SELECT * FROM exemplar;
DROP TABLE exemplar;
ALTER TABLE exemplar_neu RENAME TO exemplar;

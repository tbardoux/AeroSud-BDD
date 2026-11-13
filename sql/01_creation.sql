
DROP TABLE IF EXISTS VOL;
DROP TABLE IF EXISTS AVION;
DROP TABLE IF EXISTS DESTINATION;
DROP TABLE IF EXISTS COMPAGNIE;

CREATE TABLE COMPAGNIE (
    code_compagnie TEXT NOT NULL PRIMARY KEY
        CHECK (length(code_compagnie) BETWEEN 2 AND 3),
    nom            TEXT NOT NULL,
    pays           TEXT NOT NULL
);

CREATE TABLE AVION (
    immatriculation   TEXT    NOT NULL PRIMARY KEY,
    modele            TEXT    NOT NULL,
    capacite          INTEGER NOT NULL CHECK (capacite > 0),
    annee_fabrication INTEGER NOT NULL
        CHECK (annee_fabrication BETWEEN 1950 AND 2030),
    code_compagnie    TEXT    NOT NULL,
    FOREIGN KEY (code_compagnie) REFERENCES COMPAGNIE (code_compagnie)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE DESTINATION (
    code_iata TEXT NOT NULL PRIMARY KEY
        CHECK (length(code_iata) = 3 AND code_iata NOT GLOB '*[^A-Z]*'),
    nom       TEXT NOT NULL,
    ville     TEXT NOT NULL,
    pays      TEXT NOT NULL
);

CREATE TABLE VOL (
    id_vol            INTEGER PRIMARY KEY AUTOINCREMENT,
    numero_commercial TEXT NOT NULL,
    date_vol          TEXT NOT NULL
        CHECK (date_vol GLOB '[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]'),
    heure_depart      TEXT NOT NULL
        CHECK (heure_depart GLOB '[0-2][0-9]:[0-5][0-9]'),
    heure_arrivee     TEXT NOT NULL
        CHECK (heure_arrivee GLOB '[0-2][0-9]:[0-5][0-9]'),
    statut            TEXT NOT NULL
        CHECK (statut IN ('programmé', 'retardé', 'annulé', 'terminé')),
    immatriculation   TEXT NOT NULL,
    code_iata         TEXT NOT NULL,
    UNIQUE (numero_commercial, date_vol),
    CHECK (heure_arrivee > heure_depart),
    FOREIGN KEY (immatriculation) REFERENCES AVION (immatriculation)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (code_iata) REFERENCES DESTINATION (code_iata)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
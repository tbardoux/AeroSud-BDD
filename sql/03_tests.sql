-- Tests de validation de la base AéroSud
-- À exécuter un par un, après 01_creation.sql et 02_insertion.sql.
-- Les clés étrangères doivent être activées (SQLite les ignore par défaut).
PRAGMA foreign_keys = ON;

-- T01 : avion valide -> accepté
INSERT INTO AVION (immatriculation, modele, capacite, annee_fabrication, code_compagnie)
VALUES ('F-HNEW', 'Airbus A350-900', 324, 2022, 'AF');

-- T02 : compagnie inexistante -> refusé (FOREIGN KEY constraint failed)
INSERT INTO AVION (immatriculation, modele, capacite, annee_fabrication, code_compagnie)
VALUES ('X-TEST', 'Airbus A320', 180, 2018, 'ZZ');

-- T03 : immatriculation en double -> refusé (UNIQUE constraint failed)
INSERT INTO AVION (immatriculation, modele, capacite, annee_fabrication, code_compagnie)
VALUES ('F-GKXA', 'Airbus A320', 180, 2018, 'AF');

-- T04 : capacité égale à zéro -> refusé (CHECK constraint failed: capacite > 0)
INSERT INTO AVION (immatriculation, modele, capacite, annee_fabrication, code_compagnie)
VALUES ('F-ZERO', 'Airbus A320', 0, 2018, 'AF');

-- T05 : statut « en cours » -> refusé (CHECK sur la liste des statuts)
INSERT INTO VOL (numero_commercial, date_vol, heure_depart, heure_arrivee, statut, immatriculation, code_iata)
VALUES ('AS400', '2026-11-07', '09:00', '10:30', 'en cours', 'F-GKXA', 'CDG');

-- T06 : même numéro commercial à la même date -> refusé (UNIQUE)
INSERT INTO VOL (numero_commercial, date_vol, heure_depart, heure_arrivee, statut, immatriculation, code_iata)
VALUES ('AS101', '2026-11-04', '09:00', '10:30', 'programmé', 'F-GKXB', 'CDG');

-- T07 : contrôle global des clés étrangères -> aucune ligne
PRAGMA foreign_key_check;

-- T08 : persistance -> les 4 tables contiennent leurs données après réouverture
SELECT * FROM COMPAGNIE;
SELECT * FROM AVION;
SELECT * FROM DESTINATION;
SELECT * FROM VOL;

-- T09 : destination inexistante -> refusé (FOREIGN KEY constraint failed)
INSERT INTO VOL (numero_commercial, date_vol, heure_depart, heure_arrivee, statut, immatriculation, code_iata)
VALUES ('AS500', '2026-11-07', '09:00', '10:30', 'programmé', 'F-GKXA', 'XXX');

-- T10 : suppression d'une compagnie qui possède des avions -> refusé (ON DELETE RESTRICT)
DELETE FROM COMPAGNIE WHERE code_compagnie = 'AF';

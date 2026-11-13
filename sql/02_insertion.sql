PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO COMPAGNIE (code_compagnie, nom, pays) VALUES ('AF', 'Air France', 'France');
INSERT OR IGNORE INTO COMPAGNIE (code_compagnie, nom, pays) VALUES ('U2', 'easyJet', 'Royaume-Uni');
INSERT OR IGNORE INTO COMPAGNIE (code_compagnie, nom, pays) VALUES ('TO', 'Transavia France', 'France');
INSERT OR IGNORE INTO COMPAGNIE (code_compagnie, nom, pays) VALUES ('IB', 'Iberia', 'Espagne');

INSERT OR IGNORE INTO AVION (immatriculation, modele, capacite, annee_fabrication, code_compagnie) VALUES ('F-GKXA', 'Airbus A320', 178, 2012, 'AF');
INSERT OR IGNORE INTO AVION (immatriculation, modele, capacite, annee_fabrication, code_compagnie) VALUES ('F-GKXB', 'Airbus A321', 212, 2015, 'AF');
INSERT OR IGNORE INTO AVION (immatriculation, modele, capacite, annee_fabrication, code_compagnie) VALUES ('F-HBNA', 'Airbus A220-300', 148, 2019, 'AF');
INSERT OR IGNORE INTO AVION (immatriculation, modele, capacite, annee_fabrication, code_compagnie) VALUES ('G-UZHA', 'Airbus A320', 186, 2016, 'U2');
INSERT OR IGNORE INTO AVION (immatriculation, modele, capacite, annee_fabrication, code_compagnie) VALUES ('G-EZWB', 'Airbus A319', 156, 2010, 'U2');
INSERT OR IGNORE INTO AVION (immatriculation, modele, capacite, annee_fabrication, code_compagnie) VALUES ('F-GZHA', 'Boeing 737-800', 189, 2008, 'TO');
INSERT OR IGNORE INTO AVION (immatriculation, modele, capacite, annee_fabrication, code_compagnie) VALUES ('F-HTVC', 'Boeing 737-800', 189, 2014, 'TO');

INSERT OR IGNORE INTO DESTINATION (code_iata, nom, ville, pays) VALUES ('CDG', 'Paris Charles de Gaulle', 'Paris', 'France');
INSERT OR IGNORE INTO DESTINATION (code_iata, nom, ville, pays) VALUES ('LHR', 'London Heathrow', 'Londres', 'Royaume-Uni');
INSERT OR IGNORE INTO DESTINATION (code_iata, nom, ville, pays) VALUES ('BCN', 'Barcelone El Prat', 'Barcelone', 'Espagne');
INSERT OR IGNORE INTO DESTINATION (code_iata, nom, ville, pays) VALUES ('FCO', 'Rome Fiumicino', 'Rome', 'Italie');
INSERT OR IGNORE INTO DESTINATION (code_iata, nom, ville, pays) VALUES ('AMS', 'Amsterdam Schiphol', 'Amsterdam', 'Pays-Bas');
INSERT OR IGNORE INTO DESTINATION (code_iata, nom, ville, pays) VALUES ('LIS', 'Lisbonne Humberto Delgado', 'Lisbonne', 'Portugal');

INSERT OR IGNORE INTO VOL (numero_commercial, date_vol, heure_depart, heure_arrivee, statut, immatriculation, code_iata) VALUES ('AS101', '2026-11-01', '07:00', '08:25', 'terminé', 'F-GKXA', 'CDG');
INSERT OR IGNORE INTO VOL (numero_commercial, date_vol, heure_depart, heure_arrivee, statut, immatriculation, code_iata) VALUES ('AS102', '2026-11-01', '10:30', '11:55', 'terminé', 'F-GKXB', 'CDG');
INSERT OR IGNORE INTO VOL (numero_commercial, date_vol, heure_depart, heure_arrivee, statut, immatriculation, code_iata) VALUES ('AS204', '2026-11-02', '08:15', '09:40', 'terminé', 'G-UZHA', 'LHR');
INSERT OR IGNORE INTO VOL (numero_commercial, date_vol, heure_depart, heure_arrivee, statut, immatriculation, code_iata) VALUES ('AS310', '2026-11-02', '12:10', '13:50', 'terminé', 'F-GZHA', 'BCN');
INSERT OR IGNORE INTO VOL (numero_commercial, date_vol, heure_depart, heure_arrivee, statut, immatriculation, code_iata) VALUES ('AS101', '2026-11-04', '07:00', '08:25', 'programmé', 'F-GKXA', 'CDG');
INSERT OR IGNORE INTO VOL (numero_commercial, date_vol, heure_depart, heure_arrivee, statut, immatriculation, code_iata) VALUES ('AS150', '2026-11-04', '14:00', '16:05', 'retardé', 'F-HBNA', 'FCO');
INSERT OR IGNORE INTO VOL (numero_commercial, date_vol, heure_depart, heure_arrivee, statut, immatriculation, code_iata) VALUES ('AS204', '2026-11-04', '08:15', '09:40', 'annulé', 'G-UZHA', 'LHR');
INSERT OR IGNORE INTO VOL (numero_commercial, date_vol, heure_depart, heure_arrivee, statut, immatriculation, code_iata) VALUES ('AS310', '2026-11-05', '12:10', '13:50', 'programmé', 'F-GZHA', 'BCN');
INSERT OR IGNORE INTO VOL (numero_commercial, date_vol, heure_depart, heure_arrivee, statut, immatriculation, code_iata) VALUES ('AS315', '2026-11-05', '17:20', '19:10', 'programmé', 'F-HTVC', 'AMS');
INSERT OR IGNORE INTO VOL (numero_commercial, date_vol, heure_depart, heure_arrivee, statut, immatriculation, code_iata) VALUES ('AS220', '2026-11-05', '09:00', '10:35', 'programmé', 'G-EZWB', 'AMS');
INSERT OR IGNORE INTO VOL (numero_commercial, date_vol, heure_depart, heure_arrivee, statut, immatriculation, code_iata) VALUES ('AS151', '2026-11-06', '15:40', '17:55', 'programmé', 'F-GKXA', 'FCO');
INSERT OR IGNORE INTO VOL (numero_commercial, date_vol, heure_depart, heure_arrivee, statut, immatriculation, code_iata) VALUES ('AS310', '2026-11-06', '12:10', '13:50', 'retardé', 'F-GZHA', 'BCN');
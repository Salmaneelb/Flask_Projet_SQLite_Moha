DROP TABLE IF EXISTS emprunts;
DROP TABLE IF EXISTS livres;
DROP TABLE IF EXISTS clients;

-- Table des utilisateurs avec rôles et adresse
CREATE TABLE clients (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    prenom TEXT NOT NULL,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL, -- 'admin' ou 'user'
    adresse TEXT -- Optionnel pour la bibliothèque
);

-- Table des livres avec gestion des stocks
CREATE TABLE livres (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titre TEXT NOT NULL,
    auteur TEXT NOT NULL,
    stock INTEGER NOT NULL DEFAULT 1
);

-- Table pour suivre les emprunts
CREATE TABLE emprunts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_client INTEGER,
    id_livre INTEGER,
    date_emprunt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_client) REFERENCES clients (id),
    FOREIGN KEY (id_livre) REFERENCES livres (id)
);

-- Table pour les tâches (Ajout selon le PDF)
CREATE TABLE tâches (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titre TEXT NOT NULL,
    description TEXT,
    date_echeance DATE,
    statut INTEGER DEFAULT 0, -- 0 pour en cours, 1 pour terminée
    id_client INTEGER,
    FOREIGN KEY (id_client) REFERENCES clients (id)
);

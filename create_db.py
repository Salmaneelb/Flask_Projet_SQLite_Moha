import sqlite3
import os

# On force le répertoire de travail
os.chdir(os.path.dirname(os.path.abspath(__file__)))

connection = sqlite3.connect('database.db')
with open('schema.sql') as f:
    connection.executescript(f.read())

cur = connection.cursor()

# On insère l'admin et l'user avec l'ADRESSE incluse
cur.execute("INSERT INTO clients (nom, prenom, username, password, role, adresse) VALUES (?, ?, ?, ?, ?, ?)",
            ('Admin', 'System', 'admin', 'password', 'admin', 'Bureau Admin'))

cur.execute("INSERT INTO clients (nom, prenom, username, password, role, adresse) VALUES (?, ?, ?, ?, ?, ?)",
            ('Dupont', 'Jean', 'user', '12345', 'user', 'Rue de la Biblio'))

connection.commit()
connection.close()

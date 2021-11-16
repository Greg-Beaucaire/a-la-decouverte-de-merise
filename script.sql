CREATE TABLE Individu(
   id TEXT,
   code VARCHAR(250) NOT NULL,
   nom VARCHAR(50),
   prénom VARCHAR(50),
   PRIMARY KEY(id),
   UNIQUE(code)
);

CREATE TABLE Professeur(
   id TEXT,
   compétence VARCHAR(50),
   PRIMARY KEY(id),
   FOREIGN KEY(id) REFERENCES Individu(id)
);

CREATE TABLE Adresse(
   id VARCHAR(50),
   numéro VARCHAR(50) NOT NULL,
   rue VARCHAR(50) NOT NULL,
   ville VARCHAR(50) NOT NULL,
   code_postal VARCHAR(50) NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE Matière(
   id COUNTER,
   nom VARCHAR(50) NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(nom)
);

CREATE TABLE Salle(
   id COUNTER,
   nom VARCHAR(50) NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(nom)
);

CREATE TABLE Etudiant(
   id_1 TEXT,
   diplome VARCHAR(50),
   id VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_1),
   UNIQUE(id),
   FOREIGN KEY(id_1) REFERENCES Individu(id),
   FOREIGN KEY(id) REFERENCES Adresse(id)
);

CREATE TABLE Cours(
   id_2 INT,
   id COUNTER,
   heure_de_début VARCHAR(50) NOT NULL,
   heure_de_fin VARCHAR(50),
   id_1 INT NOT NULL,
   id_3 TEXT NOT NULL,
   id_4 TEXT NOT NULL,
   PRIMARY KEY(id_2, id),
   FOREIGN KEY(id_2) REFERENCES Salle(id),
   FOREIGN KEY(id_1) REFERENCES Matière(id),
   FOREIGN KEY(id_3) REFERENCES Etudiant(id_1),
   FOREIGN KEY(id_4) REFERENCES Professeur(id)
);

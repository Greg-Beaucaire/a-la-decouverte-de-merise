CREATE TABLE professeur(
   id_professeur SERIAL,
   code VARCHAR(25)  NOT NULL,
   prenom VARCHAR(50)  NOT NULL,
   nom VARCHAR(50)  NOT NULL,
   competence VARCHAR(250) ,
   CONSTRAINT PK_professeur PRIMARY KEY(id_professeur),
   CONSTRAINT AK_professeur UNIQUE(code)
);

CREATE TABLE etudiant(
   id_etudiant SERIAL,
   code VARCHAR(25)  NOT NULL,
   nom VARCHAR(25)  NOT NULL,
   prenom VARCHAR(50)  NOT NULL,
   numero VARCHAR(250) ,
   rue VARCHAR(50) ,
   ville VARCHAR(25) ,
   code_postal VARCHAR(10) ,
   diplome VARCHAR(50) ,
   CONSTRAINT PK_etudiant PRIMARY KEY(id_etudiant),
   CONSTRAINT AK_etudiant UNIQUE(code)
);

CREATE TABLE matiere(
   id_matiere SERIAL,
   nom VARCHAR(50)  NOT NULL,
   CONSTRAINT PK_matiere PRIMARY KEY(id_matiere),
   CONSTRAINT AK_matiere UNIQUE(nom)
);

CREATE TABLE salle(
   id_salle INTEGER,
   nom VARCHAR(50)  NOT NULL,
   CONSTRAINT PK_salle PRIMARY KEY(id_salle),
   CONSTRAINT AK_salle UNIQUE(nom)
);

CREATE TABLE cours(
   id_cours SERIAL,
   heure_de_debut TIMESTAMP NOT NULL,
   heure_de_fin TIMESTAMP NOT NULL,
   id_matiere INTEGER NOT NULL,
   id_salle INTEGER NOT NULL,
   id_professeur INTEGER NOT NULL,
   CONSTRAINT PK_cours PRIMARY KEY(id_cours),
   CONSTRAINT AK_cours_ident UNIQUE(id_salle, heure_de_debut, heure_de_fin),
   CONSTRAINT FK_cours_matiere FOREIGN KEY(id_matiere) REFERENCES matiere(id_matiere),
   CONSTRAINT FK_cours_salle FOREIGN KEY(id_salle) REFERENCES salle(id_salle),
   CONSTRAINT FK_cours_professeur FOREIGN KEY(id_professeur) REFERENCES professeur(id_professeur)
);

CREATE TABLE participant(
   id_etudiant INTEGER,
   id_cours INTEGER,
   CONSTRAINT PK_participant PRIMARY KEY(id_etudiant, id_cours),
   CONSTRAINT FK_participant_etudiant FOREIGN KEY(id_etudiant) REFERENCES etudiant(id_etudiant),
   CONSTRAINT FK_participant_cours FOREIGN KEY(id_cours) REFERENCES cours(id_cours)
);

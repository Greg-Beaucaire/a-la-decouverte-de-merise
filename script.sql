CREATE TABLE individu(
   id_individu SERIAL,
   code VARCHAR(250)  NOT NULL,
   nom VARCHAR(250)  NOT NULL,
   prénom VARCHAR(250)  NOT NULL,
   numero VARCHAR(50) ,
   rue VARCHAR(250) ,
   ville VARCHAR(250) ,
   code_postal VARCHAR(50) ,
   PRIMARY KEY(id_individu),
   UNIQUE(code)
);

CREATE TABLE professeur(
   id_individu INTEGER,
   compétence VARCHAR(250) ,
   PRIMARY KEY(id_individu),
   FOREIGN KEY(id_individu) REFERENCES individu(id_individu)
);

CREATE TABLE etudiant(
   id_individu INTEGER,
   diplome VARCHAR(250) ,
   PRIMARY KEY(id_individu),
   FOREIGN KEY(id_individu) REFERENCES individu(id_individu)
);

CREATE TABLE matiere(
   id_matiere SERIAL,
   nom VARCHAR(250)  NOT NULL,
   PRIMARY KEY(id_matiere),
   UNIQUE(nom)
);

CREATE TABLE salle(
   id_salle INTEGER,
   nom VARCHAR(250)  NOT NULL,
   PRIMARY KEY(id_salle),
   UNIQUE(nom)
);

CREATE TABLE cours(
   id_salle INTEGER,
   id SERIAL,
   heure_de_début TIMESTAMP NOT NULL,
   heure_de_fin TIMESTAMP NOT NULL,
   id_matiere INTEGER NOT NULL,
   id_individu INTEGER NOT NULL,
   PRIMARY KEY(id_salle, id),
   FOREIGN KEY(id_salle) REFERENCES salle(id_salle),
   FOREIGN KEY(id_matiere) REFERENCES matiere(id_matiere),
   FOREIGN KEY(id_individu) REFERENCES professeur(id_individu)
);

CREATE TABLE etudiant_cours(
   id_individu INTEGER,
   id_salle INTEGER,
   id INTEGER,
   PRIMARY KEY(id_individu, id_salle, id),
   FOREIGN KEY(id_individu) REFERENCES etudiant(id_individu),
   FOREIGN KEY(id_salle, id) REFERENCES cours(id_salle, id)
);

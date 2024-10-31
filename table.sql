-- Table chemin
CREATE TABLE chemin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    path VARCHAR(255) NOT NULL
);

-- Table introduction
CREATE TABLE introduction (
    id INT AUTO_INCREMENT PRIMARY KEY,
    textcode TEXT NOT NULL,
    langue VARCHAR(50) NOT NULL,
    id_chemin INT,
    FOREIGN KEY (id_chemin) REFERENCES chemin(id)
);

-- Table URLAPI
CREATE TABLE URLAPI (
    id INT AUTO_INCREMENT PRIMARY KEY,
    textcode TEXT NOT NULL,
    id_chemin INT,
    FOREIGN KEY (id_chemin) REFERENCES chemin(id)
);

-- Table PARAMETRE
CREATE TABLE PARAMETRE (
    id INT AUTO_INCREMENT PRIMARY KEY,
    textcode TEXT NOT NULL,
    langue VARCHAR(50) NOT NULL,
    id_chemin INT,
    FOREIGN KEY (id_chemin) REFERENCES chemin(id)
);

-- Table REQUETE_REPONSE
CREATE TABLE REQUETE_REPONSE (
    id INT AUTO_INCREMENT PRIMARY KEY,
    textcode TEXT NOT NULL,
    langue VARCHAR(50) NOT NULL,
    id_chemin INT,
    FOREIGN KEY (id_chemin) REFERENCES chemin(id)
);

-- Table ERREUR_ControleCode
CREATE TABLE ERREUR_ControleCode (
    id INT AUTO_INCREMENT PRIMARY KEY,
    textcode TEXT NOT NULL,
    langue VARCHAR(50) NOT NULL,
    id_chemin INT,
    FOREIGN KEY (id_chemin) REFERENCES chemin(id)
);

-- Table Suitecode
CREATE TABLE Suitecode (
    id INT AUTO_INCREMENT PRIMARY KEY,
    textcode TEXT NOT NULL,
    langue VARCHAR(50) ,
    id_chemin INT,
    FOREIGN KEY (id_chemin) REFERENCES chemin(id)
);
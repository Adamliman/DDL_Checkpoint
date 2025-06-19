CREATE TABLE Département(
Num_S INT PRIMARY KEY ,
Label VARCHAR(255) NOT NULL,
Nom_du_manager VARCHAR(255)
);


CREATE TABLE employés(
Num_E INT PRIMARY KEY,
Nom VARCHAR(255) NOT NULL,
Position VARCHAR(255) NOT NULL,
Salaire DECIMAL(10,2) NOT NULL ,
Department_Num_S INT,
FOREIGN KEY (Department_Num_S) REFERENCES Département(Num_S)
);


CREATE TABLE projet(
Num_P INT PRIMARY KEY,
Titre VARCHAR(255) NOT NULL,
Date_de_début DATE NOT NULL,
Date_fin DATE NOT NULL,
Department_Num_S INT ,
FOREIGN KEY (Department_Num_S) REFERENCES Département(Num_S)
);


CREATE TABLE  Employé_Projet (
Employé_Num_E INT,
FOREIGN KEY (Employé_Num_E) REFERENCES employés(Num_E),
Employé_Num_P INT,
FOREIGN KEY (Employé_Num_P ) REFERENCES projet(Num_P),
Rôle VARCHAR(255) NOT NULL,
PRIMARY KEY (Employé_Num_P , Employé_Num_E )
);

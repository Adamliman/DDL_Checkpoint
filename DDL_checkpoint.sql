CREATE TABLE D�partement(
Num_S INT PRIMARY KEY ,
Label VARCHAR(255) NOT NULL,
Nom_du_manager VARCHAR(255)
);


CREATE TABLE employ�s(
Num_E INT PRIMARY KEY,
Nom VARCHAR(255) NOT NULL,
Position VARCHAR(255) NOT NULL,
Salaire DECIMAL(10,2) NOT NULL ,
Department_Num_S INT,
FOREIGN KEY (Department_Num_S) REFERENCES D�partement(Num_S)
);


CREATE TABLE projet(
Num_P INT PRIMARY KEY,
Titre VARCHAR(255) NOT NULL,
Date_de_d�but DATE NOT NULL,
Date_fin DATE NOT NULL,
Department_Num_S INT ,
FOREIGN KEY (Department_Num_S) REFERENCES D�partement(Num_S)
);


CREATE TABLE  Employ�_Projet (
Employ�_Num_E INT,
FOREIGN KEY (Employ�_Num_E) REFERENCES employ�s(Num_E),
Employ�_Num_P INT,
FOREIGN KEY (Employ�_Num_P ) REFERENCES projet(Num_P),
R�le VARCHAR(255) NOT NULL,
PRIMARY KEY (Employ�_Num_P , Employ�_Num_E )
);

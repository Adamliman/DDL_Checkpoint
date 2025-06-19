# Comprendre les entités et les relations

## Détails du système

### Employé
Cette entité enregistre les informations relatives à l'employé, telles que :
- **Numéro** : Identifiant unique de l'employé.
- **Nom** : Nom complet de l'employé.
- **Poste** : Fonction ou rôle de l'employé dans l'entreprise.
- **Salaire** : Salaire de l'employé.
- **Service** : Référence au département auquel l'employé appartient.

### Département
Cette entité enregistre les informations suivantes :
- **Numéro** : Identifiant unique du département.
- **Intitulé** : Libellé ou nom du département.
- **Nom du responsable** : Nom du manager en charge du département.

### Projet
Cette entité suit les détails relatifs aux projets :
- **Numéro** : Identifiant unique du projet.
- **Titre** : Intitulé ou nom du projet.
- **Date de début** : Date à laquelle le projet commence.
- **Date de fin** : Date prévue pour la fin du projet.
- **Service** : Référence au département associé au projet.

### Rôles des employés dans les projets
Cette entité permet de suivre la participation des employés aux projets, avec :
- **Employé** : Référence à l'identifiant de l'employé.
- **Projet** : Référence à l'identifiant du projet.
- **Rôle** : Description du rôle de l'employé dans le projet.

## Solution SQL

```sql
-- Table Département
CREATE TABLE Departement (
    Num_S INT PRIMARY KEY,
    Label VARCHAR(255) NOT NULL,
    Nom_du_manager VARCHAR(255) NOT NULL
);

-- Table Employé
CREATE TABLE Employe (
    Num_E INT PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL,
    Position VARCHAR(255) NOT NULL,
    Salaire DECIMAL(10, 2) NOT NULL,
    Department_Num_S INT,
    FOREIGN KEY (Department_Num_S) REFERENCES Departement(Num_S)
);

-- Table Projet
CREATE TABLE Projet (
    Num_P INT PRIMARY KEY,
    Titre VARCHAR(255) NOT NULL,
    Date_de_début DATE NOT NULL,
    Date_fin DATE NOT NULL,
    Department_Num_S INT,
    FOREIGN KEY (Department_Num_S) REFERENCES Departement(Num_S)
);

-- Table Employé_Projet
CREATE TABLE Employe_Projet (
    Employe_Num_E INT,
    Projet_Num_P INT,
    Role VARCHAR(255) NOT NULL,
    PRIMARY KEY (Employe_Num_E, Projet_Num_P),
    FOREIGN KEY (Employe_Num_E) REFERENCES Employe(Num_E),
    FOREIGN KEY (Projet_Num_P) REFERENCES Projet(Num_P)
);
```

## Explications

- **Clés primaires** : Chaque table dispose d'une clé primaire unique pour garantir l'unicité des enregistrements.
- **Clés étrangères** : Elles sont utilisées pour établir les relations entre les tables et assurer l'intégrité référentielle.
- **Contraintes** : Les types de données et les contraintes définissent les attributs de chaque table pour respecter la structure du schéma.

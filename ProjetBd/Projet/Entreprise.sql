CREATE OR REPLACE TYPE ob_entreprise_ty AS OBJECT (
numEntreprise number(10),	
nomEnt       VARCHAR2 (50),
adresseEnt   ob_adresse_ty,
contacte  number(10) );


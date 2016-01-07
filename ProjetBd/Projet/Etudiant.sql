CREATE or REPLACE type ob_etudiant_ty AS OBJECT (
numEtu number(5),
nomEtu VARCHAR2(255),
prenomEtu VARCHAR2 (255),
genre VARCHAR2(5),
email VARCHAR2 (20),
adresseEtu ob_adresse_ty,
anneeStage   Number(4),
stage  ob_stage_ty);


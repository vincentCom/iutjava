CREATE type ob_adresse_ty AS OBJECT (
Rue VARCHAR2(50),
Ville VARCHAR2(30),
departement VARCHAR2 (10),
numRue NUMBER(5),
MAP MEMBER FUNCTION TriDepVille RETURN VARCHAR2);
/
CREATE OR REPLACE TYPE BODY ob_adresse_ty IS 
 MAP MEMBER FUNCTION TriDepVille RETURN VARCHAR2 IS
  BEGIN
      RETURN departement||Ville; 
  END TriDepVille;
END;


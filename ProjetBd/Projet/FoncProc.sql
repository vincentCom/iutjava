CREATE or REPLACE function EtuAvecStage return number is
nb NUMBER(10):=0;
CURSOR moncurseur is SELECT *
                  FROM etudiant
                  where stage IS NOT NULL ;
BEGIN
FOR ligneCurseur IN moncurseur 
LOOP
      nb:=nb+1;
END LOOP;
Return nb  ;
END EtuAvecStage;

/
CREATE or REPLACE function EtuSansStage return number is
nb NUMBER:=0;
CURSOR moncurseur is SELECT *
                  FROM etudiant
                  where stage IS NULL ;
BEGIN
FOR ligneCurseur IN moncurseur 
LOOP
      nb:=nb+1;
END LOOP;
Return nb ;
END EtuSansStage;
/
CREATE or REPLACE function EtuSansStageDate(anneeUt number) return number is
nb NUMBER:=0;
CURSOR moncurseur is  SELECT *
                  FROM etudiant e
                  WHERE e.anneeStage=anneeUt
                  AND e.stage.numStage IS NULL;
begin
FOR ligneCurseur IN moncurseur 
LOOP
      nb:=nb+1;
END LOOP;
Return nb ;
END EtuSansStageDate;                  
/
CREATE or REPLACE procedure EtuParEntreprise(anneeUt number)is
NbEtu number(20);
nomEntreprise ENTREPRISE.NOMENT%type;
Cursor monCurseur IS
      SELECT e.stage.entreprise.nomEnt, count(*)
      FROM etudiant e
      WHERE e.anneeStage >= (to_number(to_char(sysdate,'YYYY'))-anneeUt)
      AND e.stage is not null
      GROUP BY  e.stage.entreprise.nomEnt;
        
BEGIN

OPEN monCurseur ;
LOOP
FETCH monCurseur INTO nomEntreprise, NbEtu;
EXIT WHEN monCurseur%NOTFOUND;
DBMS_OUTPUT.PUT_LINE( ' Entreprise:'  ||
nomEntreprise||' Son nombre d etudiant : ' ||NbEtu ) ;
END LOOP;
CLOSE MonCurseur;
END;
/
CREATE or REPLACE procedure moyEtuParEntrprise(anneeUt number)is
NbMoyEtu number(20);
nomEntreprise ENTREPRISE.NOMENT%type;
Cursor monCurseur IS  
       SELECT e.stage.entreprise.nomEnt, count(*)
      FROM etudiant e
      WHERE e.anneeStage >= (to_number(to_char(sysdate,'YYYY'))-anneeUt)
      AND e.stage is not null
      GROUP BY  e.stage.entreprise.nomEnt;
        
BEGIN

OPEN monCurseur ;
LOOP
FETCH monCurseur INTO nomEntreprise, NbMoyEtu;
EXIT WHEN monCurseur%NOTFOUND;
DBMS_OUTPUT.PUT_LINE( ' Entreprise:'  ||
nomEntreprise||' Son nombre moyen d etudiant : ' ||NbMoyEtu/anneeUt ) ;
END LOOP;
CLOSE MonCurseur;
END;
/

CREATE or REPLACE function  EtuParZone(dept VARCHAR2) return number is
nbStage NUMBER:=0;
CURSOR moncurseur is  SELECT *
                      from etudiant e 
                      where e.stage.entreprise.adresseEnt.departement =dept;
BEGIN
FOR ligneCurseur IN moncurseur 
LOOP
      nbStage:=nbStage+1;
END LOOP;
Return nbStage ;
END  EtuParZone;
/
CREATE or REPLACE procedure StageTouteZone is
NbStage number(20);
NomDept ENTREPRISE.adresseEnt.departement%type;
Cursor monCurseur IS
      
       SELECT e.stage.entreprise.adresseEnt.departement, count(*)
      FROM etudiant e
      WHERE e.stage is not null
      GROUP BY  e.stage.entreprise.adresseEnt.departement;
        
BEGIN

OPEN monCurseur ;
LOOP
FETCH monCurseur INTO NomDept,NbStage;
EXIT WHEN monCurseur%NOTFOUND;
DBMS_OUTPUT.PUT_LINE( ' Departement:'  ||
NomDept||' Son nombre de stage : ' ||NbStage ) ;
END LOOP;
CLOSE MonCurseur;
END;
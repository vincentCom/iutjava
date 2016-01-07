/*
	un script contenant le code comment√© du/des triggers 
	remplissant la table statistique √  chaque modification
*/
-- Ajout d'un Ètudiant
/*create or replace trigger trg_ins_stag 
  after insert
  on ob_stagiaire_ty 
  for each row
begin
  update ob_statistique set nbetu = nbetu+1;
  if ob_stagiaire_ty.entreprise is not null then
    update ob_statistique 
    set ob_statistique.nbstaact = ob_statistique.nbstaact+1;
  end if ;
  update ob_statistique 
  set ob_statistique.nbnostaact = ob_statistique.nbetu - ob_statistique.nbstaact;
end;*/

-- Mise a jour quelconque d'un Ètudiant
create or replace trigger trg_ins_stag 
  after insert or delete or update
  on ob_stagiaire_ty 
  for each row
begin
  update ob_statistique 
  set ob_statistique.nbnostaact = ob_statistique.nbetu - ob_statistique.nbstaact;
end;

-- Suppression d'un Ètudiant
create or replace trigger trg_delete_stag 
  before delete
  on ob_stagiaire_ty 
  for each row
begin
  update ob_statistique set nbetu = nbetu-1;
  if ob_stagiaire_ty.entreprise is not null then
    update ob_statistique 
    set ob_statistique.nbstaact = ob_statistique.nbstaact - 1;   
  end if ;  
end;

-- 

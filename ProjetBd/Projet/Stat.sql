CREATE or REPLACE type ob_stat_ty AS OBJECT (
idS NUMBER(5),
member function EtuAvecStage return number, 
member function EtuSansStage return number,
member function EtuSansStageDate return number,
member procedure EtuParEntreprise,
member procedure moyEtuParEntrprise,
member function EtuParZone return number,
member procedure stageTouteZone,

nbEtuAvecStage Number(10) := EtuAvecStage,
nbEtuSansStage Number(10) := EtuSansStage
);




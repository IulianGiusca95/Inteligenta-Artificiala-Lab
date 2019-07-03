produs(X,Y,Rez):- Rez is X*Y.
impartire(X,Y,Rez):- Rez is X div Y.
/* Nu merge folosit =:= in loc de is fiindca =:= este un operator folosit pentru comparatii aritmetice, nu de atribuire,
Si de aceea obtinem eroare de instantiere cand incercam sa folosim.
*/

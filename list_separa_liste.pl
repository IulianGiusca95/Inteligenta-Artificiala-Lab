%Giusca Iulian 242
%24.04.2016

%pred(+Lista,+ListaImpare,+ListaPare)
pred([H1,H2|T],Li,Lp):-pred(T,Newi,Newp),Li = [H1|Newi], Lp=[H2|Newp].
pred([H],[H],[]).
pred([],[],[]).

%prajitura(nume_prajitura, lista_caracteristici_principale).
prajitura(amandina, [ciocolata, sirop, crema]).
prajitura(mascota, [ciocolata, crema]).
prajitura(jofra, [ciocolata, crema]).
prajitura(savarina, [frisca, sirop]).
prajitura(ecler, [crema, ciocolata]).
prajitura(mousse, [crema]).
prajitura(merengue, [crema, ciocolata, frisca]).
prajitura(excelent, [ciocolata]).
prajitura(trufa, [ciocolata]).


%praji(Nume_prajitura)
%Am creat lista numelor prajiturilor cu ajutorul lui bagof
praji(X):-prajitura(X,_).
get_prajituri(L):-bagof(X,praji(X),L).

%Predicat principal
%list_prajituri(+Ingredient,-Prajituri Cu ingredient, -PrajituriFaraIngredient)
list_prajituri(Ingr,Cu_Ingr,Fara_Ingr):-get_prajituri(Prajituri),calculeaza(Ingr,Prajituri,Cu_Ingr,Fara_Ingr).

%calculeaza(+Ingredient,+ListaPrajituri,+ListaCu,+ListaFara)
%Pentru fiecare element in parte, verific daca ingredientul se afla pe lista sa de ingrediente. Daca da, adaug in lista "Cu", altfel, adaug in "fara"
calculeaza(I,[X|T],Cu,Fara):-prajitura(X,Li),member(I,Li),calculeaza(I,T,Cu1,Fara),Cu = [X|Cu1].
calculeaza(I,[X|T],Cu,Fara):-calculeaza(I,T,Cu,Fara1),Fara = [X|Fara1].
calculeaza(_,[],[],[]).



/*Exemple de interogari | ?- pred([1,2,3,4,5,6,7,8],Impar,Par).

Impar = [1,3,5,7],
Par = [2,4,6,8] ? y
yes

| ?- pred([1,2,3,4,5,6,7],Impar,Par).  
Impar = [1,3,5,7],
Par = [2,4,6] ? y
yes

| ?- pred([1,2],Impar,Par).          
Impar = [1],
Par = [2] ? y
yes

| ?- pred([],Impar,Par).   
Impar = [],
Par = [] ? y
yes

| ?- list_prajituri(ciocolata,Cu,Fara).                           
Cu = [amandina,mascota,jofra,ecler,merengue,excelent,trufa],
Fara = [savarina,mousse] ? y
yes
| ?- list_prajituri(sirop,Cu,Fara).    
Cu = [amandina,savarina],
Fara = [mascota,jofra,ecler,mousse,merengue,excelent,trufa] ? y
yes
| ?- list_prajituri(frisca,Cu,Fara).
Cu = [savarina,merengue],
Fara = [amandina,mascota,jofra,ecler,mousse,excelent,trufa] ? y
yes
| ?- list_prajituri(pisica,Cu,Fara).
Cu = [],
Fara = [amandina,mascota,jofra,savarina,ecler,mousse,merengue,excelent,trufa] ? y
yes
*/
matrice1(m1,0,0,1).
matrice1(m1,0,1,2).
matrice1(m1,0,2,3).
matrice1(m1,1,0,4).
matrice1(m1,1,1,5).
matrice1(m1,1,2,6).
matrice1(m1,2,0,7).
matrice1(m1,2,1,8).
matrice1(m1,2,2,9).

matrice2(m2,[[1,2,3],[4,5,6],[7,8,9]]).

matrice3(m3,[[1,4,7],[2,5,8],[3,6,9]]).

matrice_1(Nume,X,Y,Val):- matrice1(Nume,X,Y,Val).

matrice_2(Nume,X,Y,Val):- matrice2(Nume,Lista),extrage(Lista,X,Y,Val).

extrage([H|T],0,Y,Val):- ext(H,Y,Val).
extrage([H|T],X,Y,Val):- X1 is X-1, extrage(T,X1,Y,Val).
extrage([],_,_,_):- false.

ext([],_,_):- false.
ext([H|T],0,H).
ext([H|T],Y,Val):- Y1 is Y-1, ext(T,Y1,Val).


matrice_3(Nume,X,Y,Val):-matrice3(Nume,Lista),extrage(Lista,Y,X,Val).
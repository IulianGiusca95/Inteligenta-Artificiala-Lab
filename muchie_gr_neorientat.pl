nod(1).
nod(2).
nod(3).
nod(4).
nod(5).
nod(6).
nod(7).

muchie(2,3).
muchie(3,4).
muchie(4,5).
muchie(4,6).
muchie(5,6).



muchie_n(X,Y):-muchie(X,Y);muchie(Y,X). /*Muchie_n face verificarea daca exista una din cele 2 forme, X-Y sau Y-X. */
muchie(X,Y):-muchie(Y,X). /* Daca muchia X-Y nu exista in baza de cunostine, munchie(X,Y) intra in ciclu infinit fiindca va interoga muchie(Y,X), care nu exista, si la randul ei va interoga muchie(X,Y) si tot asa*/




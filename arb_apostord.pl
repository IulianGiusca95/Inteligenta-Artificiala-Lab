%Giusca Iulian 242
%15.5.2016

%arb(+Radacina, +ListaFii )

arb(1, [2, 3, 4, 5]).
arb(2, [6, 7, 8]).
arb(3, [9]).
arb(4, []).
arb(5, [10, 11]).
arb(6, []).
arb(7, []).
arb(8, []).
arb(9, []).
arb(10, []).
arb(11, []).

%apostordine(+Nod) - unifica cu un arbore existent in baza de cunostinte, parcurge lista de fii, apoi afiseaza radacina
apostordine(S):-arb(S,L),parcurge(L),write(S),write(' ').
%parcurge(+Lista) - Lista de fii, aplica apostrdine pentru fiecare element in parte
parcurge([H|T]):-apostordine(H),parcurge(T).
parcurge([]).
/*exemplu de interogare

| ?- apostordine(1).
6 7 8 2 9 3 4 10 11 5 1 
yes

*/



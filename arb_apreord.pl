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

%apreordine(+Nod) - unifica cu un arbore existent in baza de cunostinte, afiseaza nodul curent, parcurge lista
apreordine(S):-arb(S,L),write(S),write(' '),parcurge(L).
%parcurge(+Lista) - Lista de fii, aplica apreordine pentru fiecare element in parte
parcurge([H|T]):-apreordine(H),parcurge(T).
parcurge([]).
/*exemplu de interogare

| ?- apreordine(1).                                         
1 2 6 7 8 3 9 4 5 10 11 
yes
| ?- 

*/



%Giusca Iulian 242
%18.4.2016

/* Idee: Ne folosim de un predicat dinamic in care retinem numarul de liste gasite. pentru fiecare lista gasita, reactualizam valoarea din predicat.
Am avut nevoie de 2 predicate auxiliare, primul care verifica ce tip de element e, incrementand valoarea daca e lista, si al doilea daca am dat de o
lista de lsite, fiindca doream sa ii incrementeze valoarea o singura data.
*/

:-dynamic numar/1.

%predicatul principal
%nr_liste(+X,-Nr).
nr_liste(X,Nr):-retractall(numar(_)),assert(numar(0)),verifica(X),retract(numar(Nr)).


verifica([]):-retract(numar(Nrv)),Nrn is Nrv + 1, assert(numar(Nrn)). %daca termenul e de forma [], incrementeaza valoarea si se opreste
verifica(X):-simple(X),X \== []. %daca termenul e simplu si nu e lista vida, se opreste
verifica([H|T]):- retract(numar(Nrv)),Nrn is Nrv + 1,assert(numar(Nrn)),verifica(H), verifica_rest(T). %daca a intalnit o lista de liste, incrementeaza o singura data valoarea, il verifica pe primul element din lista, iar restul listei este pasat unui alt predicat


verifica_rest([]).
verifica_rest([H|T]):-verifica(H),verifica_rest(T). %aici se face parcurgerea unei liste care a fost incrementata anterior

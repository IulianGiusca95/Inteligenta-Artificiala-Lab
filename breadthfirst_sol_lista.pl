%Giusca Iulian
%6.6.2016

/*Adauga toate solutiile intr-o lista

Idee de rezolvare: la fiecare pas, in loc sa verific daca drumul este solutie, am modificat conditia ca sa adauge rezultatul in solutie daca respecta scopul. La final, afisez lista */

:-dynamic lista/1.

s(a,b).
s(a,d).
s(a,e).
s(b,a).
s(b,c).
s(b,f).
s(c,b).
s(c,f).
s(c,h).
s(d,a).
s(d,g).
s(e,a).
s(e,h).
s(f,b).
s(f,c).
s(g,d).
s(h,c).
s(h,e).
s(h,i).
s(h,j).
s(i,h).
s(j,h).
scop(f).
scop(j).


%concat(+Lista1,+Lista2,-Listarez)
concat([],L,L).
concat([H|T],L,[H|T1]):-concat(T,L,T1).

%membru(+Element,+Lista)
membru(H,[H|_]).
membru(X,[_|T]):-membru(X,T).

%rezolva_b(+Start,- Sol)
rezolva_b(Start):-retractall(lista(_)),assert(lista([])),breadthfirst([[Start]]).

%breadthfirst(+Listadrumuri,-DrumSolutie)
%breadthfirst([[Nod|Drum]|_], [Nod|Drum]):- scop(Nod).
breadthfirst([Drum|Drumuri]) :- 
                verifica(Drum),
				extinde(Drum, DrumuriNoi),
				concat(Drumuri, DrumuriNoi, Drumuri1),
				breadthfirst(Drumuri1).
				
breadthfirst([]):-retract(lista(L)),write(L).

%extinde(+StareDrum,-ListaDrumuriDerivate)
extinde([Nod|Drum],DrumuriNoi):-
				bagof([NodNou,Nod|Drum], (s(Nod,NodNou), \+(membru(NodNou,[Nod|Drum]))),
				DrumuriNoi),
				!.
extinde(_,[]).

%verifica(+L) - verifica daca drumul indeplineste scopul si daca da, adauga drumul in lista
verifica([H|T]):-scop(H),retract(lista(L)),L1 = [[H|T]|L],assert(lista(L1)).
verifica([_|T]).

/*
| ?- rezolva_b(a).                                                     
[[f,b,c,h,e,a],[j,h,c,f,b,a],[f,c,h,e,a],[j,h,c,b,a],[j,h,e,a],[f,c,b,a],[f,b,a]]
yes
*/
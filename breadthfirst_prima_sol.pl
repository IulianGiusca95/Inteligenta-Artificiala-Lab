%Giusca Iulian 242
%6.6.2016

/*Modificati programul pentru breadth-first astfel incat sa nu returneze decat o singura solutie (prima gasita).

Idee de rezolvare - am adaugat un cut atunci cand gaseste solutia. Daca utilizatorul alege no, nu mai cauta si alte solutii
*/

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
rezolva_b(Start, Sol):-breadthfirst([[Start]],Sol).

%breadthfirst(+Listadrumuri,-DrumSolutie)
breadthfirst([[Nod|Drum]|_], [Nod|Drum]):- scop(Nod),!.
breadthfirst([Drum|Drumuri], Sol) :- 
				extinde(Drum, DrumuriNoi),
				concat(Drumuri, DrumuriNoi, Drumuri1),
				breadthfirst(Drumuri1, Sol).

%extinde(+StareDrum,-ListaDrumuriDerivate)
extinde([Nod|Drum],DrumuriNoi):-
				bagof([NodNou,Nod|Drum], (s(Nod,NodNou), \+(membru(NodNou,[Nod|Drum]))),
				DrumuriNoi),
				!.
extinde(_,[]).


/* Exemplu

| ?- rezolva_b(a,Sol).
Sol = [f,b,a] ? ;
no
| ?- 
*/
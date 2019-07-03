/*Modificati programul pentru breadth-first astfel incat la final sa afiseze costul pentru aflarea solutiei (numarul de extinderi).*/

:-dynamic nr_extindere/1.

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
rezolva_b(Start, Sol):-retractall(nr_extindere(_)),assert(nr_extindere(0)),breadthfirst([[Start]],Sol).

%breadthfirst(+Listadrumuri,-DrumSolutie)
breadthfirst([[Nod|Drum]|_], [Nod|Drum]):- scop(Nod),retract(nr_extindere(Nr)),write('Cost:'),write(Nr),nl,assert(nr_extindere(Nr)).
breadthfirst([Drum|Drumuri], Sol) :- 
				extinde(Drum, DrumuriNoi),
				concat(Drumuri, DrumuriNoi, Drumuri1),
				breadthfirst(Drumuri1, Sol).

%extinde(+StareDrum,-ListaDrumuriDerivate)
extinde([Nod|Drum],DrumuriNoi):-
                retract(nr_extindere(OldNr)),NewNr is OldNr+1,assert(nr_extindere(NewNr)),
				bagof([NodNou,Nod|Drum], (s(Nod,NodNou), \+(membru(NodNou,[Nod|Drum]))),
				DrumuriNoi),
				!.
extinde(_,[]).
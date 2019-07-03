/*
Modificati programul pentru breadth-first astfel incat la fiecare noua extindere sa se afiseze numarul extinderii, drumul vechi si drumurile nou generate.
*/

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
rezolva_b(Start, Sol):-retractall(nr_extindere(_)),assert(nr_extindere(1)),breadthfirst([[Start]],Sol).

%breadthfirst(+Listadrumuri,-DrumSolutie)
breadthfirst([[Nod|Drum]|_], [Nod|Drum]):- scop(Nod).
breadthfirst([Drum|Drumuri], Sol) :- 
				extinde(Drum, DrumuriNoi),
				concat(Drumuri, DrumuriNoi, Drumuri1),
				breadthfirst(Drumuri1, Sol).

%extinde(+StareDrum,-ListaDrumuriDerivate)
extinde([Nod|Drum],DrumuriNoi):-
                retract(nr_extindere(Nr)),write('Numar extindere:'),write(Nr),nl,
				write('Drum vechi:'),write([Nod|Drum]),nl,
				Nr1 is Nr+1,assert(nr_extindere(Nr1)),
				bagof([NodNou,Nod|Drum], (s(Nod,NodNou), \+(membru(NodNou,[Nod|Drum])),write('Drum nou:'),write([NodNou,Nod|Drum]),nl),
				DrumuriNoi),
				!.
extinde(_,[]).
:-dynamic ok/1.
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
rezolva_b(Start, Sol):-breadthfirst([[Start]],Sol),retractall(ok(_)).

%breadthfirst(+Listadrumuri,-DrumSolutie)
breadthfirst([[Nod|Drum]|_], [Nod|Drum]):- scop(Nod).
breadthfirst([Drum|Drumuri], Sol) :-
                nl,write('Coada actuala: '),write([Drum|Drumuri]),nl,
				extinde(Drum, DrumuriNoi),
				concat(Drumuri, DrumuriNoi, Drumuri1),
				breadthfirst(Drumuri1, Sol).

%extinde(+StareDrum,-ListaDrumuriDerivate)
extinde([Nod|Drum],DrumuriNoi):-
                assert(ok(0)),
                write('Se extinde drumul' ),write([Nod|Drum]),nl,write('Se adauga in coada'),nl,
				bagof([NodNou,Nod|Drum], (s(Nod,NodNou), \+(membru(NodNou,[Nod|Drum])),write([NodNou,Nod|Drum]),retract(ok(_)),assert(ok(1))),
				DrumuriNoi),retract(ok(Val)),(Val==0 -> write('nimic'),nl;nl).
         		!.
extinde(_,[]).
	
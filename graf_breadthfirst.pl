%Giusca Iulian 242
%9.5.2016

muchie(a,b).
muchie(a,c).
muchie(a,d).
muchie(b,e).
muchie(c,d).
muchie(c,g).
muchie(f,i).
muchie(g,j).
muchie(g,k).
muchie(h,k).
muchie(i,j).
muchie(j,i).
muchie(k,h).
muchie(k,g).
muchie(j,g).
muchie(i,f).
muchie(g,c).
muchie(d,c).
muchie(e,b).
muchie(d,a).
muchie(c,a).
muchie(b,a).
scop(i).
scop(h).

/* practic, tot ce am avut de inlocuit in codul de BF a fost in extinde, al doilea parametru din bagof, in loc de succesor am scrie muchie*/

%concat(+Lista1,+Lista2,-Listarez)
concat([],L,L).
concat([H|T],L,[H|T1]):-concat(T,L,T1).

%membru(+Element,+Lista)
membru(H,[H|_]).
membru(X,[_|T]):-membru(X,T).


%rezolva_b(+Start,- Sol)
rezolva_b(Start, Sol):-breadthfirst([[Start]],Sol).

%breadthfirst(+Listadrumuri,-DrumSolutie)
breadthfirst([[Nod|Drum]|_], [Nod|Drum]):- scop(Nod).
breadthfirst([Drum|Drumuri], Sol) :- 
				extinde(Drum, DrumuriNoi),
				concat(Drumuri, DrumuriNoi, Drumuri1),
				breadthfirst(Drumuri1, Sol).
				
%extinde(+StareDrum,-ListaDrumuriDerivate)
extinde([Nod|Drum],DrumuriNoi):-
				bagof([NodNou,Nod|Drum], (muchie(Nod,NodNou), \+(membru(NodNou,[Nod|Drum]))),
				DrumuriNoi),
				!.
extinde(_,[]).

/* interogare
| ?- rezolva_b(a,Sol).
Sol = [i,j,g,c,a] ? ;
Sol = [h,k,g,c,a] ? ;
Sol = [i,j,g,c,d,a] ? y
yes

*/

%Giusca Iulian 242
%6.6.2016

/*
Modificati programul pentru breadth-first astfel incat sa nu returneze decat solutii care sa aiba lungimea intre o valoare minima si una maxima.

Idee de rezolvare: cand a ajuns la o solutie, verifica lungimea listei si daca se incadreaza intre limitele min-max, afiseaza solutia. Altfel, nu
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

%rezolva_b(+Start,- Sol,+Min,+Max)
rezolva_b(Start, Sol,Min,Max):-breadthfirst([[Start]],Sol,Min,Max). 

%breadthfirst(+Listadrumuri,-DrumSolutie)
breadthfirst([[Nod|Drum]|_], [Nod|Drum],Min,Max):- scop(Nod),lungime([Nod|Drum],0,Nr),Min =< Nr, Max >= Nr.
breadthfirst([Drum|Drumuri], Sol,Min,Max) :- 
				extinde(Drum, DrumuriNoi),
				concat(Drumuri, DrumuriNoi, Drumuri1),
				breadthfirst(Drumuri1, Sol,Min,Max).

%extinde(+StareDrum,-ListaDrumuriDerivate)
extinde([Nod|Drum],DrumuriNoi):-
				bagof([NodNou,Nod|Drum], (s(Nod,NodNou), \+(membru(NodNou,[Nod|Drum]))),
				DrumuriNoi),
				!.
extinde(_,[]).

%lungime(+L,+Count,-Nr) : calculeaza lungimea listei
lungime([H|T],Count,Nr):- Count1 is Count+1, lungime(T,Count1,Nr).
lungime([],Count,Count).

/*
| ?- rezolva_b(a,Sol,4,5).                                             
Sol = [f,c,b,a] ? y
yes
| ?- rezolva_b(a,Sol,4,5).
Sol = [f,c,b,a] ? ;
Sol = [j,h,e,a] ? ;
Sol = [j,h,c,b,a] ? ;
Sol = [f,c,h,e,a] ? ;
no
| ?- rezolva_b(a,Sol,3,4).
Sol = [f,b,a] ? y
yes
| ?- rezolva_b(a,Sol,3,4).
Sol = [f,b,a] ? ;
Sol = [f,c,b,a] ? ;
Sol = [j,h,e,a] ? ;
no
*/
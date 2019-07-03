%Giusca Iulian
%7.6.2016

%am folosit un predicat dinamic pentru a incrementa numarul extinderilor 
:-dynamic numar/1.


s(a,b).
s(b,a).
s(b,c).
s(c,b).
s(b,i).
s(i,b).
s(c,d).
s(d,c).
s(d,e).
s(e,d).
s(d,g).
s(g,d).
s(e,h).
s(h,e).
s(g,h).
s(h,g).
s(e,f).
s(f,e).
scop(y).
scop(z).

%membru(+Element,+Lista)
membru(H,[H|_]).
membru(X,[_|T]):-membru(X,T).

%cale(+Nod,-NodScop,-Solutie).
cale(Nod,Nod,[Nod]).
cale(NodInitial,NodUltim, [NodUltim|Drum]):-
cale(NodInitial,NodPenultim, Drum),
s(NodPenultim,NodUltim),
\+ membru(NodUltim,Drum),
retract(numar(Nr)),
Nr1 is Nr + 1,
assert(numar(Nr1)).


%depthfirst_iterative_deepening(+NodStart, -Solutie)
depthfirst_iterative_deepening(NodStart, Sol):-retractall(numar(_)),assert(numar(0)), cale(NodStart,NodScop,Sol),scop(NodScop),
                                                  retract(numar(Nr)),
												  write('Costul este '),write(Nr),!.

/* Interogare : a gasit cel mai scurt drum catre un nod scop

| ?- depthfirst_iterative_deepening(a,S).                                 
Costul este 4
S = [i,b,a] ? ;
no
| ?- 
*/
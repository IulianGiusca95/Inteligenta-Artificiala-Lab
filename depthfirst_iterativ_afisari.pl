s(a,b).
s(a,c).
s(b,a).
s(b,c).
s(c,b).
s(c,a).

scop(b).

%membru(+Element,+Lista)
membru(H,[H|_]).
membru(X,[_|T]):-membru(X,T).

%cale(+Nod,-NodScop,-Solutie).
cale(Nod,Nod,[Nod]).
cale(NodInitial,NodUltim, [NodUltim|Drum]):-
cale(NodInitial,NodPenultim, Drum),
s(NodPenultim,NodUltim),
\+ membru(NodUltim,Drum).

%depthfirst_iterative_deepening(+NodStart, -Solutie)
depthfirst_iterative_deepening(NodStart, Sol):- cale(NodStart,NodScop,Sol),scop(NodScop).
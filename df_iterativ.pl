s(a,b).
s(a,c).
s(b,a).
s(b,c).
s(c,a).
s(c,b).

scop(b).

%membru(+Element,+Lista)
membru(H,[H|_]).
membru(X,[_|T]):-membru(X,T).

%cale(+Nod,-NodScop,-Solutie).
cale(Nod,Nod,[Nod]).
cale(NodInitial,NodUltim, [NodUltim|Drum]):-
cale(NodInitial,NodPenultim, Drum),
s(NodPenultim,NodUltim),
\+ membru(NodUltim,Drum),
write('extinde nod '),write(NodPenultim),nl,
write([NodUltim|Drum]),nl.

%depthfirst_iterative_deepening(+NodStart, -Solutie)
depthfirst_iterative_deepening(NodStart, Sol):- cale(NodStart,NodScop,Sol),write('testeaza solutie '),write(Sol), da_nu(Sol), scop(NodScop).

da_nu([H|_]):- scop(H), write(' - DA'),nl.
da_nu([H|_]):- \+(scop(H)), write(' - NU'),nl.
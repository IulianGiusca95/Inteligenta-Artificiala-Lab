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
scop(i).
scop(f).

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
write('Numarul extinderii: '),write(Nr),nl,
Nr1 is Nr + 1,
assert(numar(Nr1)),
write('Drum vechi: '),write(Drum),nl,
write('Drum nou: '),write([NodUltim|Drum]),nl,nl.


%depthfirst_iterative_deepening(+NodStart, -Solutie)
depthfirst_iterative_deepening(NodStart, Sol):-retractall(numar(_)),assert(numar(1)), cale(NodStart,NodScop,Sol),scop(NodScop),retract(numar(_)),!.

/* Interogare : a gasit cel mai scurt drum catre un nod scop

| ?- depthfirst_iterative_deepening(a,S).                        
Numarul extinderii: 1
Drum vechi: [a]
Drum nou: [b,a]

Numarul extinderii: 2
Drum vechi: [a]
Drum nou: [b,a]

Numarul extinderii: 3
Drum vechi: [b,a]
Drum nou: [c,b,a]

Numarul extinderii: 4
Drum vechi: [b,a]
Drum nou: [i,b,a]

S = [i,b,a] ? ;
no
*/
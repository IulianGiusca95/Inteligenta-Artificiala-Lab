mc :-initial(S), rezolva_b(S, Soll), afisare(Soll). %porneste algoritmul

%stare(+Mal,+NrMisionariMalCurent,+NrCanibaliMalCurent,+NrMisionariMalOpus,+NrCanibaliMalOpus,+CapacitateaBarcii,+TimpDegradare)
initial(stare(est, 5,5 ,0 ,0 ,8,1)).%starea initiala
scop(stare(vest, 5,5, 0, 0, Nr,_)):-Nr>=0.%starea finala

timpDegradare(1).

%opus(+MalCurent,+MalOpus). :se face schimb de maluri, folosita in functia succesor
opus(est, vest).
opus(vest, est).


%concat(+Lista1,+Lista2,-Listarez)
concat([],L,L).
concat([H|T],L,[H|T1]):-concat(T,L,T1).

%membru(+Element,+Lista)
membru(H,[H|_]).
membru(X,[_|T]):-membru(X,T).

%rezolva_b(+Start,- Sol)
rezolva_b(Start, Sol):-breadthfirst([[Start]],Sol).%algoritmul clasic BF

%breadthfirst(+Listadrumuri,-DrumSolutie)
breadthfirst([[Nod|Drum]|_], [Nod|Drum]):- scop(Nod).
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

% for(0, 4, X).
% X = 0 ;
% X = 1 ;
% X = 2 ;
% X = 3 ;
% X = 4 ;
% false.

for(A, B, A) :- A =< B.
for(A, B, X) :- A1 is A + 1, A1 =< B, for(A1, B, X).

%s(+Stare1,-Stare2)
s(stare(B, NMB, NCB, NMis, NCan, M,Degrad),
  stare(B1, NMB1, NCB1, NMis1, NCan1, MNou,Degrad1)) :-
                        (Degrad=:=0,MNou is M-1, MNou > 0,timpDegradare(Degrad1);Degrad1 is Degrad -1,MNou is M), %se degradeaza un loc in barca  
                        M1 is min(M, NMB), M2 is min(M, NCB),%M1:nr maxim de misionari in barca, M2:canibali
                        for(0, M1, K1), for(0, M2, K2),%pentru toate combinatiile numerice de canibali si misionari care incap in barca se verifica
                        (K1 >= K2 ; K1 =:= 0),%daca numarul de misionari >= nr canibali sau numarul de misionari e 0
						K1 + K2 =< M,%daca misionarii si canibalii incap in barca
						K1 + K2 > 0,%daca numarul lor nu este 0
						%daca cele de mai sus sunt valide
                        NMis1 is NMB - K1,%numarul de misionari scade pe malul curent
						NCan1 is NCB - K2,%numarul de canibali scade pe malul curent 
						(NMis1 >= NCan1; NMis1 =:= 0),%se face verificarea daca nr de misionari a ramas mai mare decat canibalii sau e 0
						%daca cele de mai sus raman valide
                        NMB1 is NMis + K1,%numarul de misionari de pe malul opus
						NCB1 is NCan + K2,%numarul de canibali de pe malul opus
						(NMB1 >= NCB1 ; NMB1 =:= 0),%verificarea conditiei ca misionarii sa nu fie mancati
                        opus(B, B1).%se schimba malurile pentru a fi trimis mai departe ca parametru starii succesor

%afisare(+Solutia)
afisare([]).
afisare([H | T]) :- afisare(T), nl, afis(H).%afisarea solutiei

%afis(stare) - pentru fiecare element din solutie, afiseaza interpretarea datelor
afis(stare(B, NMB, NCB, NMis, NCan, M,_)) :- write('Barca se afla pe malul de '), write(B), nl,
                        write('  pe acest mal sunt '), write(NMB), write(' misionari si '), write(NCB), write(' canibali'), nl,
                        write('  pe malul opus se afla '), write(NMis), write(' misionari si '), write(NCan), write(' canibali.'), nl,
						write('Capacitatea barcii este '),write(M),nl,nl.


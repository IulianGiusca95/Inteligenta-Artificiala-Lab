:-dynamic starebarca/2.

% Membru
membru(X, [X | _]). % caz de oprire
membru(X, [_ | L]) :- membru(X, L). % caz recursiv

% Concatenarea a 2 liste
concat([], L, L).
concat([H | T], L, [H | L1]) :- concat(T, L, L1).

% Permutare a listei
delete_pentru_perm(E, [E | T], T). % daca E e p e prima pozitie atunci rezultatul este T
delete_pentru_perm(E, [H | T], [H | T1]) :- E \== H, delete_pentru_perm(E, T, T1).

permutare([], []).
permutare([H | T], P) :- permutare(T, Q), delete_pentru_perm(H, P, Q).


%concat(+Lista1,+Lista2,-Listarez)
concat2([],L,L).
concat2([H|T],L,[H|T1]):-concat2(T,L,T1).

%membru(+Element,+Lista)
membru2(H,[H|_]).
membru2(X,[_|T]):-membru2(X,T).

%rezolva_b(+Start,- Sol)
rezolva_b2(Start,Nr,Msc):-initial(Start),retractall(starebarca(_,_)),assert(starebarca(Start,Msc)),breadthfirst2([[Start]],Nr,Sol).

%breadthfirst(+Listadrumuri,-DrumSolutie)
breadthfirst2([[Nod|Drum]|_],Nr,[Nod|Drum]):-scop(Nod),retract(starebarca(Nod,Val)),Val>0,numar_misionari([Nod|Drum],Nr).
breadthfirst2([Drum|Drumuri],Nr, Sol) :- 
				extinde2(Drum, DrumuriNoi),
				concat2(Drumuri, DrumuriNoi, Drumuri1),
				breadthfirst2(Drumuri1,Nr, Sol).

%extinde(+StareDrum,-ListaDrumuriDerivate)
extinde2([Nod|Drum],DrumuriNoi):-retract(starebarca(Nod,M)),
				bagof([NodNou,Nod|Drum], (s(Nod,NodNou,Musc),Mactualizat is M - Musc,  
				                          assert(starebarca(NodNou,Mactualizat)),
				                           \+(membru(NodNou,[Nod|Drum]))),
				DrumuriNoi),
				!,assert(starebarca(Nod,M)).
extinde2(_,[]).
	

% Problema canibalilor si a misionarilor
% stare(malul pe care se afla barca, numarul de misionari de pe mal, numarul de canibali, nr misionari mal opus, nr canibali masl opus, capacitatea barcii)

initial(stare(est, 3,3 ,0 ,0 ,2)).
scop(stare(vest, 3, 3, 0, 0, 2)).

opus(est, vest).
opus(vest, est).

% for(0, 4, X).
% X = 0 ;
% X = 1 ;
% X = 2 ;
% X = 3 ;
% X = 4 ;
% false.

for(A, B, A) :- A =< B.
for(A, B, X) :- A1 is A + 1, A1 =< B, for(A1, B, X).

s(stare(B, NMB, NCB, NMis, NCan, M),
  stare(B1, NMB1, NCB1, NMis1, NCan1, M),Muscaturi) :- M1 is min(M, NMB), M2 is min(M, NCB),
                        for(0, M1, K1), for(0, M2, K2),
                        (K1 >= K2 ; K1 =:= 0), K1 + K2 =< M, K1 + K2 > 0,
                        NMis1 is NMB - K1, NCan1 is NCB - K2, (NMis1 >= NCan1; NMis1 =:= 0),
                        NMB1 is NMis + K1, NCB1 is NCan + K2, (NMB1 >= NCB1 ; NMB1 =:= 0),
                        opus(B, B1),(K2=:=0,Muscaturi is 0 ; Muscaturi is 1).

afisare([]).
afisare([H | T]) :- afisare(T), nl, afis(H).

afis(stare(B, NMB, NCB, NMis, NCan, M)) :- write('Barca se afla pe malul de '), write(B), nl,
                        write('  pe acest mal sunt '), write(NMB), write(' misionari si '), write(NCB), write(' canibali'), nl,
                        write('  pe malul opus se afla '), write(NMis), write(' misionari si '), write(NCan), write(' canibali.'), nl.
						
						
numar_misionari([stare(_,M1,C1,M2,C2,_),stare(_,M3,C3,M4,C4,_)|T],Nr):-
               C1 == C3 , C2 == C4, numar_misionari([stare(_,M3,C3,M4,C4,_)|T],Nr1),Nr is Nr1+1;
			   numar_misionari([stare(_,M3,C3,M4,C4,_)|T],Nr).
numar_misionari([H],0).
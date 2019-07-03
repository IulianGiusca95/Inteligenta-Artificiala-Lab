pb_bf :-initial(S),verifica(S),scop(Scop),verifica(Scop), rezolva_b(S, Solutie),write(Solutie). %apeleaza algoritmul in varianta BF
pb_df :-initial(S),verifica(S),scop(Scop),verifica(Scop), rezolva(S, Solutie),write(Solutie). %apeleaza algoritmul in varianta DF

numar(d,4). %numerele asociate blocurilor
numar(c,3).
numar(b,2).
numar(a,1).

initial([[d], [a, b], [c]]). %starea initiala a blocurilor
scop([[], [a, b, c, d], []]). %starea scop

%concat(+Lista1,+Lista2,-Listarez)
concat([],L,L).
concat([H|T],L,[H|T1]):-concat(T,L,T1).

%membru(+Element,+Lista)
membru(H,[H|_]).
membru(X,[_|T]):-membru(X,T).

%rezolva_b(+Start,- Sol)
rezolva_b(Start, Sol):-breadthfirst([[Start]],Sol). %rezolvarea algoritmului breadthfirst, modul clasic

%breadthfirst(+Listadrumuri,-DrumSolutie)
breadthfirst([[Nod|Drum]|_], [Nod|Drum]):- scop(Nod).
breadthfirst([Drum|Drumuri], Sol) :-
                afiseaza(Drum),
				extinde(Drum, DrumuriNoi),
				concat(Drumuri, DrumuriNoi, Drumuri1),
				breadthfirst(Drumuri1, Sol).

%extinde(+StareDrum,-ListaDrumuriDerivate)
extinde([Nod|Drum],DrumuriNoi):-
				bagof([NodNou,Nod|Drum], (s(Nod,NodNou), \+(membru(NodNou,[Nod|Drum]))),
				DrumuriNoi),
				!.
extinde(_,[]).

%rezolva1_d(+Nod,-DrumSolutie)
rezolva(N,Sol):-depthfirst([],N,Sol). %algoritm clasic depthfirst

%depthfirst(+Drum,+Nod, -Solutie)
depthfirst(Drum, Nod, [Nod|Drum]):-scop(Nod).
depthfirst(Drum, Nod, Sol):-
            write(Nod),nl,
			s(Nod,Nod1),
			\+ (membru(Nod1,Drum)), 
			depthfirst([Nod|Drum],Nod1, Sol).


% s(+Lista de stive, - Lista rezultat)
% Lista de stive este lista de la starea respectiva
% Lista rezultat este lista de stive dupa ce un bloc a fost mutat 
s(Lista_stive, Lista_stive_rez) :- membru(X, Lista_stive), %se alege o stiva din lista de stive
                    X = [Varf | _],%se extrage elementul din varful listei de stive
                    det_poz_el(Lista_stive, N, X),%se determina numarul de ordine al stivei selectate de predicatul membru
                    sterg_la_n(Lista_stive, Lista_stive_inter, N),%sterge primul element din stiva n, primind ca parametru o lista intermediara
                membru(Y, Lista_stive),%mai selecteaza un membru din lista de stive, unde sa pozitioneze blocul
                    det_poz_el(Lista_stive, N1, Y),%determina pozitia noii stive extrase
                N1 \== N,%trebuie ca cele doua stive sa fie diferite, adica sa aiba indicii de ordine diferiti
                adauga_la_n(Varf, Lista_stive_inter, Lista_stive_rez, N1),%adauga listei intermediare pe pozitia N1 varfuul stivei alese initial
                \+ permutare(Lista_stive, Lista_stive_rez),
				verifica(Lista_stive_rez).

% Determina pozitia lui X in lista si pune pozitia in N
det_poz_el([X | _], 1, X).
det_poz_el([_ | T], Poz, X) :- det_poz_el(T, Poz1, X), Poz is Poz1 + 1.

% Se sterge primul element din stiva N si se returneaza rezultatul
sterg_la_n([[_ | T] | T1], [T| T1], 1).
sterg_la_n([H | T], [H | LRez], N) :- N > 1, N1 is N - 1, sterg_la_n(T, LRez, N1).

% Se adauga elementul Varf la lista Lista_stive_inter in stiva N1 si se intoarce rezultatul in Lista_stive_rez
adauga_la_n(Varf, [H | T], [[Varf | H] | T], 1).
adauga_la_n(Varf, [H | T], [H | LRez], N) :- N > 1, N1 is N - 1, adauga_la_n(Varf, T, LRez, N1).

% Permutare a listei
delete_pentru_perm(E, [E | T], T). % daca E e p e prima pozitie atunci rezultatul este T
delete_pentru_perm(E, [H | T], [H | T1]) :- E \== H, delete_pentru_perm(E, T, T1).

permutare([], []).
permutare([H | T], P) :- permutare(T, Q), delete_pentru_perm(H, P, Q).

verifica([]).
verifica([H|T]):-verifica_lista(H),verifica(T).

verifica_lista([]).
verifica_lista([H]).
verifica_lista([H1,H2|T]):-numar(H1,N1),numar(H2,N2),N1 < N2,verifica_lista([H2|T]).

afiseaza([H|_]):-write(H),nl. %afiseaza starile intermediare 


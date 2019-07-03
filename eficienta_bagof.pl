lista_p([H|T],L):- H mod 2 =:= 0, lista_p(T,L1), L = [H|L1].
lista_p([_|T],L):- lista_p(T,L).
lista_p([],[]).

lista_p2(L,Lp):-bagof(X,L^(member(X,L),X mod 2 =:= 0),Lp).
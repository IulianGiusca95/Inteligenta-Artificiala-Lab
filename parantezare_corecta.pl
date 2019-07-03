paranteze(_,P):- P < 0, fail.
paranteze([H|T],P):- H=='(', Newp is P+1, paranteze(T,Newp).
paranteze([H|T],P):- H==')', Newp is P-1, paranteze(T,Newp).
paranteze([],0).
paranteze([],P):-P=\=0, fail.

% Giusca Iulian 242
% 19.3.2016


% adauga_incep(+Lista_veche,+Elem,-Lista_noua)
adauga_incep(Lista_veche,Elem,Lista_noua):-Lista_noua=[Elem|Lista_veche].


%adauga_lit(+Atom_vechi,-Atom_nou) 
adauga_lit(A1,A2):-atom_chars(A1,L1),prelucrare(L1,L2),atom_chars(A2,L2).

%prelucrare(+L1,-L2) Predicat auxiliar, formeaza lista care compune noul atom.
% la fiecare pas adauga la inceputul listei o noua litera(cea anterioara din ordinea elxicografica, mai mare sau egala cu litera a). La final, compune pe L2.
prelucrare([H1|T],L):-char_code(H1,C1),char_code('a',C2),C1=< C2,L =[H1|T],atom_chars(A,L),write(A),nl. %conditia de oprire
prelucrare([H1|T],L):-char_code(H1,C1),C2 is C1-1,char_code(H2,C2),atom_chars(A,[H1|T]),write(A),nl,prelucrare([H2,H1|T],L).


/* 

| ?- adauga_incep([1,2,3],a,L).
L = [a,1,2,3] ? y
yes
| ?- adauga_incep([1,2,3],[1,2],L).
L = [[1,2],1,2,3] ? y
yes
| ?- adauga_incep([1,2,3],444,L).  
L = [444,1,2,3] ? y
yes
| ?- adauga_incep([1,2,3],[],L). 
L = [[],1,2,3] ? y
yes
| ?- adauga_incep([],a,L).      
L = [a] ? y
yes

-----------------------------------

| ?- adauga_lit('gugu',A).                                 
gugu
fgugu
efgugu
defgugu
cdefgugu
bcdefgugu
abcdefgugu
A = abcdefgugu ? y
ye

*/
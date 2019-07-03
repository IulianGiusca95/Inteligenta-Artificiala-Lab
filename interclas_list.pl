% Giusca Iulian - 242
%6.5.2016


%interclas(+L1,+L2,-Lrez)
interclas([],[],[]).
interclas([],L,L).
interclas(L,[],L).
interclas([H1|T1],[H2|T2],L):-interclas(T1,T2,Ln), L = [H1,H2|Ln].


/*
Pentru a interclasa doua liste cu atomi care sa respecte regula, mai intai am adaugat primul atom din L1 in lista rezultat,
apoi in cea de-a doua lista am cautat primul element care respecta regula(ca ultimul caracter al elementului din prima lista
sa fie acelasi cu primul caracter din a doua). Cand am gasit un astfel de caracter, salvam caracterul gasit in primul parametru
si schimbam lista in care cautam elementul. Algoritmul se opreste cand una dintre cele doua liste devine vida.
*/
%inter(+L1,+L1,-Lrez)
inter([H1|T1],[H2|T2],L):-inter1(H1,T1,[H2|T2],Ln),L =[H1|Ln].

%inter1(+Element_anterior,+L1,+L2,-Lrez)
inter1(A1,L1,[A2|T],L):-atom_codes(A1,[X1,X2]),atom_codes(A2,[Y1,Y2]),X2 == Y1, inter2(A2,L1,T,Ln), L = [A2|Ln].
inter1(A1,L1,[A2|T],L):-atom_codes(A1,[X1,X2]),atom_codes(A2,[Y1,Y2]),\+(X2 == Y1),inter1(A1,L1,T,L).
inter1(A1,L1,[],[]).

%inter1(+Element_anterior,+L1,+L2,-Lrez)
inter2(A1,[A2|T],L2,L):-atom_codes(A1,[X1,X2]),atom_codes(A2,[Y1,Y2]),X2 == Y1, inter1(A2,T,L2,Ln), L = [A2|Ln].
inter2(A1,[A2|T],L2,L):-atom_codes(A1,[X1,X2]),atom_codes(A2,[Y1,Y2]),\+(X2 == Y1),inter2(A1,T,L2,L).
inter2(A1,[],L2,[]).


/* Exemple de interogari

L = [1,4,2,5,3,6] ? y
yes
| ?- interclas([1,2,3],[4],L).    
L = [1,4,2,3] ? 
yes
| ?- interclas([1],[4,5,6],L). 
L = [1,4,5,6] ? y
yes
| ?- interclas([],[4,5,6],L). 
L = [4,5,6] ? y
yes

| ?- inter([ab,'++',ba, cc, dd,ab,aa,'01'],[bc,cd,da,ff,gh,b0,aa,gg],Lrez).
Lrez = [ab,bc,cc,cd,dd,da,ab,b0,'01'] ? y
yes

| ?- inter([ab,'+++',ba, cc, dd,ab,aa,'01'],[bc,cd,da,ff,gh,b0,aa,gg],Lrez).
no

*/
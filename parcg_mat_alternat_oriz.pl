%Giusca Iulian 242
%6.5.2016

/*
Am declarat o matrice retinuta ca o lista de liste cu un nume, si pentru afisarea matricei alternate, in predicatul principal dau numele
matricei ca data de intrare.
Extrag lista de liste, si afiez listele alternativ. Listele cu indice par, afisate de la stanga la dreapta, cele cu indice impar de la dreapta la stanga
*/

matrice(m1,[[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]).

%predicat principal
%parcurge_alternat(+Nume Matrice)
parcurge_alternat(M1):-matrice(M1,L),parcurge(L).

%parcurge(+Lista de liste) - H1 sunt listele cu indice impar, H2 cele cu indice par
parcurge([H1,H2|T]):-st_dr(H1),dr_st(H2),parcurge(T).
parcurge([H1]):-st_dr(H1).
parcurge([]).

%st_dr(+Lista) - efectuaza afisarea de la stanga la dreapta
st_dr([H|T]):-write(H),write(' '),st_dr(T).
st_dr([]).

%dr_st(+Lista) - efectueaza afisarea de la dreapta la stanga
dr_st([H|T]):-dr_st(T),write(H),write(' ').
dr_st([]).

/* Ex
| ?- parcurge_alternat(m1).                                             
1 2 3 4 8 7 6 5 9 10 11 12 16 15 14 13 
yes
*/
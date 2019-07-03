% Ex 1

lista_nr1([1.0,3,X,1]).
lista_nr1([1,3,2,1]).
lista_nr1([a,1,2,b]).
lista_nr1([1,2,3]).
lista_nr1([]).
lista_nr1([1.0,2.0,3,2]).
lista_nr1([1,2+3,3,1]).
lista_nr1([1,2,[3,[4]]]).

% -----------------------------------------------------------------------
% Ex 2
ras_malefic(vrajitoare, ['mua-ha-ha', 'ba-hah-ha', 'wuahahaha']).
ras_malefic(fantoma, ['buhuhuhu-uuuu','wuhuhu', 'haaaaaaaa']).
ras_malefic(vampir, ['chiri-chiri-chiri-chiri', 'hir-hir']).
ras_malefic(timid, ['hi-hi-hi-uhm-hi?','heh']).
ras_malefic(capcaun, ['u-hu-hu-huh','groh-hroh-hoo','wuhuhu']).
ras_malefic(balaur, ['groh-hroh-hoo','wuahahaha','wuhuhu','heh']).

teme(ion,[vrajitoare,vampir]).
teme(alin,[timid,balaur,capcaun]).
teme(natalia,[fantoma]).

pereche_monstruleti(M1,M2):-ras_malefic(M1,L1),ras_malefic(M2,L2),M1\==M2, M1 @< M2, ras(L1,L2,L1,L2).

ras(L1,L2,[H1|T1],[]):- ras(L1,L2,T1,L2).
ras(L1,L2,[H1|T1],[H2|T2]):-H1==H2;ras(L1,L2,[H1|T1],T2).

se_teme(Copil,Ras):-teme(Copil,Monstri),verifica(Monstri,Ras).
verifica([H|T],Ras):-ras_malefic(H,L), check(L,Ras) ; verifica(T,Ras).
check([H|T],Ras):- H==Ras;check(T,Ras).

% ------------------------------------------------------------------------
% Ex 3
med_lista(L,M):-calculeaza(L,0,0,S,Nr),Nr=\=0,M is S div Nr.

calculeaza([],S,Nr,Sr,Nrr):- Sr=S,Nrr=Nr.
calculeaza([H|T],S,Nr,S_return,Nr_return):-number(H),S1 is S+H, Nr1 is Nr+1, calculeaza(T,S1,Nr1,S_return,Nr_return); calculeaza(T,S,Nr,S_return,Nr_return).

% ------------------------------------------------------------------------
% Ex 4
lg(Atom,Lungime).

calc_list_lg([],[]).
calc_list_lg([H|T],L):-atom(H), atom_codes(H,Sir),nr_litere(Sir,0,Nr_l),calc_list_lg(T,L2),H1=lg(H,Nr_l),L=[H1|L2].

nr_litere([],Nr,Nr_l):-Nr_l=Nr.
nr_litere([H|T],Nr,Nr_l):-Nr1 is Nr+1,nr_litere(T,Nr1,Nr_l).


% -------------------------------------------------------------------------
% Ex 5

suma_liste([H1|T1],[H2|T2],Ls):-number(H1),number(H2), S is H1+H2, suma_liste(T1,T2,Lss), Ls = [S|Lss].
suma_liste([H1|T1],[H2|T2],Ls):- \+number(H1),suma_liste(T1,[H2|T2],Ls).
suma_liste([H1|T1],[H2|T2],Ls):- \+number(H2),suma_liste([H1|T1],T2,Ls).
suma_liste([],[_|_],[]).
suma_liste([_|_],[],[]).

% -------------------------------------------------------------------------
% Ex 6

sum_nr_list(L,S):- calc(L,0,Sum),S=Sum.
calc([],Suma,Suma_finala):-Suma_finala=Suma.
calc([H|T],Suma,Suma_finala):-number(H),Suma2 is Suma+H, calc(T,Suma2,Suma_finala).
calc([H|T],Suma,Suma_finala):-compound(H), calc_lista(H,0,Suma_lista),Suma2 is Suma+Suma_lista,calc(T,Suma2,Suma_finala).
calc_lista([],Suma,Suma_finala):-Suma_finala=Suma.
calc_lista([H|T],Suma,Suma_finala):-number(H),Suma2 is Suma+H,calc_lista(T,Suma2,Suma_finala).

% --------------------------------------------------------------------------
% Ex 7

verif_list([],Nr).
verif_list([H],Nr).
verif_list([H1,H2|T],Nr):-(H1-H2 > Nr ; H2-H1 > Nr), verif_list([H2|T],Nr).

% --------------------------------------------------------------------------
% Ex 8

soarece('Chit').
soarece('Rontz').
soarece('Cascaval-Finder').
pisica('Miau').
pisica('Madeleine Gherutzescu').
pisica('Motanovski').

afisSoarecPisic(Litera):- soarece(X), atom_chars(X,Lista_soarece), verifica_litera(Lista_soarece,Litera),write(X),nl,fail.
afisSoarecPisic(Litera):- pisica(X), atom_chars(X,Lista_pisica), verifica_litera(Lista_pisica,Litera),write(X),nl,fail;true.
verifica_litera([H|T],Lit):- H == Lit,! ; verifica_litera(T,Lit).

% ---------------------------------------------------------------------------
% Ex 9

numere_consecutive(L):- genereaza(1,L1,49),L=L1.

genereaza(N,L,Cod_N):-number(N),N=:=8,L=[].
genereaza(N,L,Cod_N):-number(N) , N=<7 , N>=1 , Cod_N1 is Cod_N + 1 , Cod_N2 is Cod_N + 2 ,number_codes(Nr,[Cod_N , Cod_N1 , Cod_N2]), N1 is N+1, Cod_Nou is Cod_N + 1, genereaza(N1,L1,Cod_Nou),L = [Nr|L1].

% ---------------------------------------------------------------------------
% Ex 10
schimba([],0).
schimba([H|T],S):- H=..L, prelucreaza(L,0,S_final),schimba(T,S_final), S is S+S_final.

prelucreaza([H|T],S,S_final):-H=='term', prelucreaza2(T,S1,S_final1), S_final = S_final1.

prelucreaza2([],S,S).
prelucreaza2([H|T],S,S_final):-number(H), S1 is S+H, prelucreaza2(T,S1,S1_final1), S_final=S_final1.

% ----------------------------------------------------------------------------
% ex 11


matr_nr1(m1, [[10,14,3],[2,1,21],[3,8,10]]).
matr_nr1(m2, [[a,14,3],[2,1,21],[3,8,10]]).
matr_nr1(m3, [[2.8,14,3],[2,1,21],[3,8,10]]).
matr_nr1(m4, [[1,2,3],[4,5,6],[7,8,9]]).

rest_mat(M,E,Mr):-number(E),E>=0,matr_nr1(M,Liste),imparte_linii(Liste,E,M1),Mr=M1.

imparte_linii([],E,[]).
imparte_linii([H|T],E,M):- imparte_linii(T,E,M1),imparte_elemente(H,E,L1),M=[L1|M1].

imparte_elemente([],E,[]).
imparte_elemente([H|T],E,L):-integer(H),H>=0, Nr is (H mod E), imparte_elemente(T,E,L1), L=[Nr|L1]. 



























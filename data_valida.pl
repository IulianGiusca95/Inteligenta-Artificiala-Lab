% Giusca Iulian 242
% 10.3.2016

% Se da o data ca parametru, de forma zi/luna/an si sa se verifice daca este o data valida
% Am folosit un predicat ajutator pentru a stabili daca un an e bisect sau nu, astfel determinand daca luna februarie are 28 de zile sau 29
% Daca luna nu e februarie, atunci daca indicele lunii e mai mic sau egal cu 7 si e luna impara, atunci luna are 31 zile. Daca e para, 30.
% Daca luna nu e februarie, atunci daca indicele lunii e mai mare decat 7 si e luna impara, atunci luna are 30 zile. Daca e para, 31.


% an_bisect(+Z,-T)//Z e anul, si T e o variabila de tip boolean care are valoarea 1 daca anul e bisect si 0 daca nu
an_bisect(Z,T):- number(Z), (Z mod 4 =\=0;Z mod 4 =:=0, Z mod 100 =:=0, Z mod 400 =\=0), T is 0.
an_bisect(Z,T):- number(Z), Z mod 4 =:=0, (Z mod 100 =\=0 ; Z mod 400 =:=0), T is 1.

%---Predicatul solutie---
% data_corecta(+X,+Y,+Z) // X e ziua, Y e luna, Z e anul
data_corecta(X,Y,Z):- number(X), number(Y), number(Z), Y=2, an_bisect(Z,T), T == 0, X is 28.
data_corecta(X,Y,Z):- number(X), number(Y), number(Z), Y=2, an_bisect(Z,T), T == 1, X is 29.
data_corecta(X,Y,Z):- number(X), number(Y), number(Z), Y>0, Y=<7, Y=\=2, Y mod 2 =:= 0, X = 30.
data_corecta(X,Y,Z):- number(X), number(Y), number(Z), Y>0, Y=<7, Y=\=2, Y mod 2 =:= 1, X = 31.
data_corecta(X,Y,Z):- number(X), number(Y), number(Z), Y>7, Y=<12, Y mod 2 =:= 0, X = 31.
data_corecta(X,Y,Z):- number(X), number(Y), number(Z), Y>7, Y=<12, Y mod 2 =:= 0, X = 30.
%-------------------------

/* Exemple de interogari
| ?- data_corecta(28,2,1900).                          
yes
% debug
| ?- data_corecta(29,2,1900).
no
% debug
| ?- data_corecta(29,2,1904).
yes
% debug
| ?- data_corecta(29,2,1900).
no
% debug
| ?- data_corecta(29,2,2000).
yes
% debug
| ?- data_corecta(28,2,2000).
no
% debug
| ?- data_corecta(27,5,2006).
no
% debug
| ?- data_corecta(31,5,2006).
yes
% debug
| ?- data_corecta(31,13,2006).
no
% debug
| ?- data_corecta(31,5,1723). 
yes
% debug
*/
% Giusca Iulian 242
% 10.3.2016

% Predicatul nr_zile primeste 2 variabile, X numarul lunii si Y numarul de zile ale lunii.
% Daca X = 2 , atunci Y trebuie sa fie ori 28, ori 29.
% Daca X <= 7 atunci lunile impare au 31 zile, cele pare 30.
% Daca X >7, atunci lunile impare au 30 zile, lunime pare 31.

% ---Predicatul solutie---
% nr_zile(+X, ?Y) //Nu merge ?X fiindca nu e definita decat luna februarie, pentru restul obtin eroare de instantiere
nr_zile(X,Y):- X is 2, (Y is 28;Y is 29). % Caz particular
nr_zile(X,Y):- X>0, X=<7, X=\=2, X mod 2 =:= 0, Y is 30.
nr_zile(X,Y):- X>0, X=<7, X=\=2, X mod 2 =:= 1, Y is 31.
nr_zile(X,Y):- X>7, X=<12, X mod 2 =:= 0, Y is 31.
nr_zile(X,Y):- X>7, X=<12, X mod 2 =:= 1, Y is 30.
%-------------------------

/* exemple de interogari
| ?- nr_zile(1,30).
no
| ?- nr_zile(1,X). 
X = 31 ? y
yes
| ?- nr_zile(2,X).
X = 28 ? ;
X = 29 ? ;
no
| ?- nr_zile(3,X).
X = 31 ? ;
no
| ?- nr_zile(8,X).
X = 31 ? y
yes
| ?- nr_zile(9,X).
X = 30 ? y
yes
| ?- nr_zile(X,Y).
X = 2,
Y = 28 ? ;
X = 2,
Y = 29 ? ;
! Instantiation error in argument 1 of (>)/2 ---Am obtinut eroare de instantiere deoarece numai luna februarie e explicit declarata ca argument pentru X. Restul sunt intervale.
*/
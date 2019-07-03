% Giusca Iulian 242
% 17.3.2016

% Generarea tuturor numerelor dintr-un interval
% Am generat intervalul recursiv. La fiecare pas verificam daca se respecta conditia X < Y, il dadeam pe X ca parametru lui Z, apoi apelam predicatul dupa ce pe X l-am crescut cu o unitate.
% Se opreste atunci cand X devine mai mare decat Y(pentru interval inchis) si mai mare decat Y-1(pentru interval deschis)

%interval_i(+X,+Y,-Z)
interval_i(X,Y,Z):- X =< Y, (Z is X ; interval_i(X+1,Y,Z)).
%interval_d(+X,+Y,-Z)
interval_d(X,Y,Z):- X < Y-1, (Z is X+1 ; interval_d(X+1, Y, Z)).
/* Exemple de interogari
| ?- interval_d(4,10,X).                                
X = 5 ? ;
X = 6 ? ;
X = 7 ? ;
X = 8 ? ;
X = 9 ? ;
no
| ?- interval_i(4,10,X).
X = 4 ? ;
X = 5 ? ;
X = 6 ? ;
X = 7 ? ;
X = 8 ? ;
X = 9 ? ;
X = 10 ? 
yes

*/
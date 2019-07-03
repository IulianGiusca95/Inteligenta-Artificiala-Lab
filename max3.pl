% Giusca Iulian 242
% 11.3.2016

% Se da un predicat cu 4 parametri, 3 dintre ei contin 3 numere si al patrulea returneaza maximul dintre cele 3

%max(+X,+Y,+Z,-Nr) primii 3 parametri contin cele 3 numere, in Nr se returneaza maximul dintre ele
max(X,Y,Z,Nr):-number(X),number(Y),number(Z),(X>=Y, X>=Z, Nr=X);(Y>=X,Y>=Z, Nr=Y);(Z>=X,Z>=Y,Nr=Z).

/* Exemple de interogari

| ?- max(1,2,3,X). 
X = 3 ? y
yes
| ?- max(1,1,3,X).
X = 3 ? y
yes
| ?- max(1,3,3,X).
X = 3 ? ;
X = 3 ? ;
no
| ?- max(1,1,1,X).
X = 1 ? y
yes
| ?- max(5,9,7,X).
X = 9 ? y
yes
| ?- max(-5,-3,-2,X).
X = -2 ? y
yes
*/
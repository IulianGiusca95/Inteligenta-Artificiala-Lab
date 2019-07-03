% Giusca Iulian 242
% 11.3.2016

% Se da un predicat cu 4 parametri, in cel de-al patrulea sa se returneze suma primilor 2 inmultita cu valoarea celui de-al treilea

%calcul(+X,+Y,+Z,-Nr) , X, Y si Z sunt cele 3 numere, iar in Nr se returneaza calculul
calcul(X,Y,Z,Nr):-number(X),number(Y),number(Z), Nr is (X+Y)*Z. % Am folosit is pentru ca Nr sa ia valoarea expresiei matematice calculate

/* Exemple de interogari

| ?- calcul(1,2,3,X).                                           
X = 9 ? y
yes
| ?- calcul(3,3,3,X).
X = 18 ? y
yes
| ?- calcul(0,0,0,X).
X = 0 ? y
yes
| ?- calcul(0,0,3,X).
X = 0 ? y
yes
| ?- calcul(3,2,0,X).
X = 0 ? y
yes
| ?- calcul(10,5,2,X).
X = 30 ? y
yes
| ?- calcul(1,2,a,Nr).
no
*/
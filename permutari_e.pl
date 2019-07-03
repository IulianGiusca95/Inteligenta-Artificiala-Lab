% Giusca Iulian 242
% 7/3/2016

% Generarea permutarilor de 3 elemente.
% Am verificat daca valorile date ca parametru exista in baza de cunotinte, apoi am pus conditiile ca obiectele afisate sa fie diferite.

% Baza de cunostinte
obiect(a).
obiect(b).
obiect(c).


% -----Predicatul principal-----
% permutari(-X,-Y,-Z) : argumentele nu trebuiesc instantiate pentru a genera toate permutarile de trei obiecte.
% mai intai ii spun programului cine sunt X Y si Z, si anume instante ale lui obiect, apoi pun conditiile sa fie diferite intre ele, si le afisez pe o linie noua fiecare.
permutari(X,Y,Z):- obiect(X), obiect(Y), obiect(Z), X\==Y, X\==Z, Y\==Z, write(X), write(Y), write(Z), nl, fail; true.
% ------------------------------


% Exemplu de interogare
/*
| ?- permutari(X,Y,Z).
abc
acb
bac
bca
cab
cba
yes
*/
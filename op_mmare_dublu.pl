% Giusca Iulian 242
% 7/3/2016

% Sa se creeze un predicat care primeste ca parametri doua numere si verifica daca primul numar e mai mare decat dublul celui de-al doilea.
% Am verificat daca parametrii sunt numere, apoi am efectuat comparatia.

% ----Preducatul Principal-------
% dublu(+X,+Y) - verifica daca X si Y sunt numere, si efectuez comparatia, obtinand rezultatul
dublu(X,Y):- number(X),number(Y),X > 2*Y.
% -------------------------------

% Exemple de interogari
/*
| ?- dublu(a,b).                                            
no
| ?- dublu(10,20).                                          
no
| ?- dublu(20,10).
no
| ?- dublu(21,10).
yes
| ?- dublu(2+3,1).
no
| ?- dublu(4,2).
no
| ?- dublu(5,2).
yes
| ?- dublu(2,5).
no
*/
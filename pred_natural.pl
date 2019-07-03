% Giusca Iulian 242
% 17.3.2016

% Predicat care verifica daca un numar e natural/intreg
% M-am folosit de floor si am verificat daca floor(X) = X (ceea ce ar fi fals pentru orice numar car enu e intreg)

%natural(+X)
natural(X):-number(X),X>=0, X =:= floor(X).
%intreg(+X)
intreg(X):-number(X), X =:= floor(X).

/* Exemple de interogari

| ?- natural(2).                                          
yes
| ?- intreg(2). 
yes
| ?- intreg(-2).
yes
| ?- intreg(0). 
yes
| ?- intreg(0.2).
no
| ?- intreg(-0.2).
no

*/
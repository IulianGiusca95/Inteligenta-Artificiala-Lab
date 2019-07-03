% Giusca Iulian 242
% 11.3.2016

% Se dau 3 structuri de tipul pt(X,Y), reprezentand puncte in plan. Sa se verifice daca punctele sunt coliniare
%Mai intai am verificat daca sunt numere, apoi cu ajutorul unui predicat auxiliar am verificat daca punctele sunt diferite, si apoi am aplicat formula determinantului care daca e 0 => coliniaritate 


% diferit(pt(+X,+Y),pt(+Z,+T)) : Predicat auxiliar, cu ajutorul caruia determin daca punctele sunt distincte in plan
% Nu mai testez daca parametrii sunt numere, argumentele sunt preluate din predicatul principal. Nu ajunge in acest punct daca nu erau numere de la bun inceput.
diferit(pt(X,Y),pt(Z,T)):- X=\=Z;Y=\=T. 

% coliniare(pt(+X1,+Y1),pt(+X2,+Y2),pt(+X3,+Y3) : Predicatul principal
coliniare(pt(X1,Y1),pt(X2,Y2),pt(X3,Y3)):-number(X1),number(X2),number(X3),number(Y1),number(Y2),number(Y3),diferit(pt(X1,Y1),pt(X2,Y2)),diferit(pt(X1,Y1),pt(X3,Y3)),diferit(pt(X2,Y2),pt(X3,Y3)), X1*Y2+X2*Y3+X3*Y1-X3*Y2-X1*Y3-X2*Y1 =:=0.

/* Exemple de interogari

| ?- coliniare(pt(4,1), pt(5,1), pt(1,1)).             
yes
| ?- coliniare(pt(4,1), pt(5,1), pt(4,1)).
no
| ?- coliniare(pt(4,0), pt(5,0), pt(1,0)).             
yes
| ?- coliniare(pt(-2,-2),pt(2,2),pt(0,0)).             
yes
| ?- coliniare(pt(-2,-2),pt(2,2),pt(2,3)).
no
*/
% Giusca Iulian 242
% 17.3.2016

%Sa se determine cmmmc
%Ma folosesc de cmmdc din exercitiul anterior. Formula de calcul este: cmmmc(X,Y) = X*Y / cmmdc(X,Y).

% cmmdc(+X,+Y,-CMMDC)
cmmdc(X,0,Cmmdc):- Cmmdc is X.
cmmdc(X,Y,Cmmdc):-number(X),number(Y),Y=\=0, Z is mod(X,Y), X1 is Y, Y1 is Z, cmmdc(X1,Y1,Cmmdc).

% --- Predicatul principal ---
% cmmmc(+X,+Y,-CMMMC)
cmmmc(X,Y,Cmmmc):- cmmdc(X,Y,Z), Cmmmc is div(X*Y,Z).
% ----------------------------


/* Exemple de interogari

| ?- cmmmc(2,16,X).  
X = 16 ? y
yes
| ?- cmmmc(3,16,X).
X = 48 ? ;
no
| ?- cmmmc(3,27,X).
X = 27 ? y
yes
| ?- cmmmc(12,20,X).
X = 60 ? y
yes
| ?- cmmmc(0,20,X). 
X = 0 ? y
yes
*/
% Giusca Iulian 242
% 17.3.2016

% Sa se stabileasca daca un numar este prim sau numar
% Pentru fiecare numar, efectuez un test, si anume vreific daca se divide cu vreun numar din intervalul [2,X/2]. Daca nu se divide, este prim.
% In predicatul Test, am simulat un for: Predicatul devine fals daca a gasit un numar care il divide pe X, altfel ramane true

% --- Predicatul principal ---
%prim(+Nr)
prim(0).
prim(1).
prim(X):-number(X),X>=0,test(2,X).
% -----------------------------

%test(+I,+X): predicat care simuleaza for(i=2;i<=X;i++)
test(I,X):- I=<div(X,2), \+ 0=:=mod(X,I), test(I+1,X).
test(I,X):- I>div(X,2).

/* Exemple de interogari
| ?- prim(-12).                                   
no
| ?- prim(13).                                    
yes
| ?- prim(12).                                    
no
| ?- prim(10). 
no
| ?- prim(8).  
no
| ?- prim(7).
yes
| ?- prim(5).
yes
| ?- prim(17).
yes
| ?- prim(27).
no
*/
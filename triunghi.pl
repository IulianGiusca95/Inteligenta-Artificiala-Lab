% Giusca Iulian
% 11.3.2016

% Se dau 3 puncte(structuri de forma pt(coord_X,coord_Y)). Sa se determine daca punctele formeaza un triunghi.

/* Pentru a forma un triunghi trebuie sa indeplineasca urmatoarele:
-argumentele date de mine sa fie numere
-punctele sa fie distincte
-lungimile laturilor determinate de muchii sa fie pozitive
-suma lungimilor oricaror doua muchii sa fie strict mai mare decat lungimea celei de-a treia latura

In plus:
-pt triunghi isoscel, verific daca 2 laturi sunt egale
-pt trinughi echilateral, verific daca toate laturile sunt egale
-pt trinughiul dreptunghic, verific teorema lui pitagora pe toate cazurile. Insa folosesc functia round pentru a rotunji numerele irationale
-pt perimetru, daca trinughiul e valid, in al patrulea parametru returnez suma lungimilor laturilor.
*/

% lungime(pt(+X1,+Y1),pt(+X2,+Y2),-Nr) : Predicat auxiliar, care primeste 2 puncte si in Nr returneaza lungimea muchiei determinate de ele
lungime(pt(X1,Y1),pt(X2,Y2),Nr):- Nr is sqrt((X2-X1)*(X2-X1)+(Y2-Y1)*(Y2-Y1)).

% diferit(pt(+X,+Y),pt(+Z,+T)) : Predicat auxiliar care verifica daca punctele sunt distincte.
diferit(pt(X,Y),pt(Z,T)):- X=\=Z;Y=\=T. 

% ---Predicat principal ---
% triunghi(pt(+X1,+Y1),pt(+X2,+Y2),pt(+X3,+Y3))
triunghi(pt(X1,Y1),pt(X2,Y2),pt(X3,Y3)):-number(X1),number(X2),number(X3),number(Y1),number(Y2),number(Y3),
diferit(pt(X1,Y1),pt(X2,Y2)),diferit(pt(X1,Y1),pt(X3,Y3)),diferit(pt(X2,Y2),pt(X3,Y3)),
lungime(pt(X1,Y1),pt(X2,Y2),Nr1),lungime(pt(X1,Y1),pt(X3,Y3),Nr2),lungime(pt(X2,Y2),pt(X3,Y3),Nr3),
Nr1>0,Nr2>0,Nr3>0, Nr1 < Nr2+Nr3, Nr2 < Nr1+Nr3, Nr3 < Nr1+Nr2.
% --------------------------

%tr_isoscel(pt(+X1,+Y1),pt(+X2,+Y2),pt(+X3,+Y3))
tr_isoscel(pt(X1,Y1),pt(X2,Y2),pt(X3,Y3)):- triunghi(pt(X1,Y1),pt(X2,Y2),pt(X3,Y3)),
lungime(pt(X1,Y1),pt(X2,Y2),Nr1),lungime(pt(X1,Y1),pt(X3,Y3),Nr2),lungime(pt(X2,Y2),pt(X3,Y3),Nr3),
(Nr1=:=Nr2 ; Nr1=:=Nr3 ; Nr2 =:= Nr3).


%tr_echilateral(pt(+X1,+Y1),pt(+X2,+Y2),pt(+X3,+Y3))
tr_echilateral(pt(X1,Y1),pt(X2,Y2),pt(X3,Y3)):- triunghi(pt(X1,Y1),pt(X2,Y2),pt(X3,Y3)),
lungime(pt(X1,Y1),pt(X2,Y2),Nr1),lungime(pt(X1,Y1),pt(X3,Y3),Nr2),lungime(pt(X2,Y2),pt(X3,Y3),Nr3),
Nr1 =:= Nr2, Nr2 =:= Nr3.


%tr_dreptunghic(pt(+X1,+Y1),pt(+X2,+Y2),pt(+X3,+Y3))
tr_dreptunghic(pt(X1,Y1),pt(X2,Y2),pt(X3,Y3)):- triunghi(pt(X1,Y1),pt(X2,Y2),pt(X3,Y3)),
lungime(pt(X1,Y1),pt(X2,Y2),Nr1),lungime(pt(X1,Y1),pt(X3,Y3),Nr2),lungime(pt(X2,Y2),pt(X3,Y3),Nr3),
(round(Nr1*Nr1) =:= round(Nr2*Nr2+Nr3*Nr3); round(Nr2*Nr2) =:= round(Nr1*Nr1+Nr3*Nr3) ;round(Nr3*Nr3) =:= round(Nr2*Nr2+Nr1*Nr1)).


% perimetru(pt(+X1,+Y1),pt(+X2,+Y2),pt(+X3,+Y3),-P) : In P se returneaza perimetrul triunghiului.
perimetru(pt(X1,Y1),pt(X2,Y2),pt(X3,Y3),P):- triunghi(pt(X1,Y1),pt(X2,Y2),pt(X3,Y3)),
lungime(pt(X1,Y1),pt(X2,Y2),Nr1),lungime(pt(X1,Y1),pt(X3,Y3),Nr2),lungime(pt(X2,Y2),pt(X3,Y3),Nr3),write(Nr1),nl,write(Nr2),nl,write(Nr3),nl,
P is Nr1+Nr2+Nr3.


/*   Exemple de interogari 
| ?- triunghi(pt(1,0), pt(5,0),pt(5,0)).              
no
| ?- triunghi(pt(0,0), pt(5,5),pt(0,0)).              
no
| ?- triunghi(pt(0,0), pt(3,3),pt(5,0)).
yes

| ?- tr_isoscel(pt(0,0),pt(4,0), pt(2,2)).            
yes
| ?- tr_isoscel(pt(0,0),pt(4,0), pt(2,3)).
yes
| ?- tr_isoscel(pt(0,0),pt(4,0), pt(8,8)).
no
| ?- tr_isoscel(pt(0,0),pt(4,0), pt(3,2)).
no

| ?- tr_echilateral(pt(0,0),pt(4,0), pt(2,3)).
no

| ?- tr_dreptunghic(pt(0,0),pt(4,0), pt(4,10)).       
yes
| ?- tr_dreptunghic(pt(0,0),pt(4,0), pt(10,4)).       
no
| ?- tr_dreptunghic(pt(0,0),pt(4,0), pt(4,4)).        
yes

| ?- perimetru(pt(0,0),pt(4,0), pt(4,4),P).           
4.0
5.656854249492381
4.0
P = 13.65685424949238 ? y
yes
| ?- perimetru(pt(0,0),pt(4,0), pt(10,4),P).          
4.0
10.770329614269007
7.211102550927978
P = 21.981432165196985 ? y
yes
| ?- perimetru(pt(0,0),pt(5,8), pt(2,3),P). 
9.433981132056603
3.605551275463989
5.830951894845301
P = 18.870484302365895 ? y
yes
| ?- perimetru(pt(0,0),pt(4,0), pt(0,0), P).
no

*/
 
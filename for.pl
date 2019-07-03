%Giusca Iulian
%7.5.2016

/* 
Am simulat for-ul cu ajutorul unui predicat dinamic in care retineam marginile date ca parametru, N1 si N2.
Am facut ca sa se afiseze X cat timp N1 e mai mic sau egal ca N2
*/

:-dynamic margin/2.

for(N1,N2,X):-number(N1),number(N2),retractall(margin(_,_)),assert(margin(N1,N2)),
              repeat,
			    retract(margin(I,J)),
				(I > J -> true;
                 write(X),nl,I1 is I+1,assert(margin(I1,J)),fail).
              
/*Ex. de interogari

| ?- for(0,3,'Pisica').
Pisica
Pisica
Pisica
Pisica
yes
| ?- for(2,3,'Pisica').
Pisica
Pisica
yes
| ?- for(2,0,'Pisica').
yes
| ?- for(0,0,'Pisica').
Pisica
yes
| ?
*/
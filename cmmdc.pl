%Giusca Iulian 242
% 17.3.2016

% Sa se determine cmmdc a doua numere
% Am aplicat algoritmul clasic de determinare a cmmdc-ului, cazul de oprire fiind atunci cand al doilea element devine 0


%cmmdc(+X,+Y,-Cmmdc)
cmmdc(X,0,Cmmdc):- Cmmdc is X.
cmmdc(X,Y,Cmmdc):-number(X),number(Y),Y=\=0, Z is mod(X,Y), X1 is Y, Y1 is Z, cmmdc(X1,Y1,Cmmdc).

/*

| ?- prim(-12).                                   
no
| ?- prim(13).                                    
yes
| ?- prim(12).                                    
no
| ?- prim(10)..
     
     .
! Syntax error
! operator expected after expression
! in line 245
! prim ( 10 ) 
! <<here>>
! .. . 
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
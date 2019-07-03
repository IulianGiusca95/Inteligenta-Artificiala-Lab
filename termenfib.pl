% Giusca Iulian 242
% 17.3.2016

% Sa se calculeze al n-lea termen din sirul lui Fibonacci
% Pentru fiecare Fx trebuie sa cunosc Fx-1 si Fx-2 asa ca i-am aflat in mod recursiv. 


% fib(+X,-Fib) : X e al catalea termen sa fie calculat, iar Fib va returna termenul cautat.
fib(1,1).
fib(2,1).
fib(N,F):-number(N),N>0, N1 is N-1,N2 is N-2, fib(N1,F1),fib(N2,F2), F is F1+F2.


/* Exemple de interogari
| ?- fib(1,X).                                       
X = 1 ? y
yes
| ?- fib(2,X).
X = 1 ? y
yes
| ?- fib(3,X).
X = 2 ? y
yes
| ?- fib(4,X).
X = 3 ? y
yes
| ?- fib(5,X).
X = 5 ? y
yes
| ?- fib(6,X).
X = 8 ? y
yes
| ?- fib(20,X).
X = 6765 ? y
yes
| ?- consult('C:/Users/Iulian/Desktop/termenfib.pl').
% consulting c:/users/iulian/desktop/termenfib.pl...
% consulted c:/users/iulian/desktop/termenfib.pl in module user, 0 msec -56 bytes
yes
| ?- fib(0,X).                                       
no
| ?- fib(4,X).
X = 3 ? ;
no

*/
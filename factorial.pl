% Giusca Iulian 242
% 17.3.2016

% Predicat care calculeaza facutorialul pentru un anumit numar
% Predicatul principal va efectua calculele recursiv.


%factorial(+N,-F) : N este numarul, F va returna calculul efectuat
factorial(0,1). % conditia de oprire
factorial(N,F):-number(N),N>=0, N1 is N-1, factorial(N1,F1), F is F1*N.

/* Exemple de interogari

| ?- factorial(2,X).                                 
X = 2 ? ;
no
| ?- factorial(3,X).
X = 6 ? ;
no
| ?- factorial(4,X).
X = 24 ? y
yes
| ?- factorial(6,X).
X = 720 ? y
yes
| ?- factorial(a,X).
no
| ?- factorial(-1,X).
no
| ?- factorial(0,X). 
X = 1 ? y
yes

*/
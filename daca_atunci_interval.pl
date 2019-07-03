interval(A,B,_):-(\+ integer(A); \+ integer(B); A>B),!,fail.
interval(_,B,X):-X=B.
interval(A,B,X):- interval(A,B,X1), ((X1==A) -> (!, fail) ; (X is X1 -1) ) .

/*
| ?- interval(1,7,X).                                                
X = 7 ? ;
X = 6 ? ;
X = 5 ? ;
X = 4 ? ;
X = 3 ? ;
X = 2 ? ;
X = 1 ? ;
no
*/
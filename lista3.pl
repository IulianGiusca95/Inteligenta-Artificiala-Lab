lista3(X,Y,Z,L) :-number(X),number(Y),X<Y,number(Z),X<Z,Y<Z, L = [X,Y,Z].

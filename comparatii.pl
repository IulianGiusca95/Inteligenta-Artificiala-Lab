mmicnr(X1,X2):- X1 < X2.
mmarenr(X1,X2):- X1 > X2.
mmicenr(X1,X2):- X1 =< X2.
mmareenr(X1,X2):- X1 >= X2.
egalexp(X1,X2):- X1 =:= X2. 
diferitexp(X1,X2):- X1 =\= X2.
egalterm(X1,X2):- X1 == X2.
diferitterm(X1,X2):- X1 \== X2.

mmicterm(X1,X2):- X1 @< X2.
mmareterm(X1,X2):- X1 @> X2.
mmiceeterm(X1,X2):- X1 @=< X2.
mmareeterm(X1,X2):- X1 @>= X2.

% =:= forteaza calculul si analizeaza rezultatul, pe cand == analizeaza termenii. De aceea, egalterm(2+3,5*1) da rezultatul no, iar egalexp(2+3,5*1) yes

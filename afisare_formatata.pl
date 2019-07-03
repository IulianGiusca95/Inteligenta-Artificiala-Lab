f1:-read(X),integer(X),Rez is X*X+X+1, format('\nX = ~d ,rezultat=~d\n',[X,Rez]).
f2:-read(X),Rez is X*X+X+1,format('\n X=~f ,rezultat=~f\n',[X,Rez]).
f3:-read(X),integer(X),Rez is X*X+X+1,write('X= '),write(X),write(' rezultat= '),write(Rez),nl.
f4a:-format('~s',['Salut']).
f4b:-format('~a',['Salut']).
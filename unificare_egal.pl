unificare(X,Y):- X=Y. %Lui x i se atribuie valoarea Y si se vor face referire la acelasi obiect
unificare1(X,X). %Face exact acelasi lucru ca si unificare, dar mai scurt scris.
produs1(X,Y,Rez):- Rez = X*Y. %Lui Rez i se atribuie string-ul 'X*Y', nu si valoarea sa
produs2(X,Y,Rez1):-produs1(X,Y,Rez), Rez1 is Rez.
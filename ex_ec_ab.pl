%Caz1: si A si B sunt numere, asa ca verifica doar daca relatia este egala sau nu. Am folosit operatorul =:= fiindca efectueaza o comparatie aritmetica
ec1(A,B):- number(A), number(B), -A+B =:= 2.


%Caz2: B e variabila, si deci lui B i se va atribui valoarea 2 + A. Am folosit operatorul de unificare "is" pentru a atribui valoarea matematica lui B 
ec1(A,B):- number(A), var(B), B is 2 + A.


%Caz3: A e variabila, analog ca si Caz2
ec1(A,B):- var(A), number(B), A is B - 2.


%Caz4: Ambele sunt variabile, asa ca pe acest caz am atribuit o valoare lui A pentru ca sa nu o aleaga el aleator si ca sa poata sa il afle pe B.
ec1(A,B):- var(A), var(B), A is -1, B is 2+A.
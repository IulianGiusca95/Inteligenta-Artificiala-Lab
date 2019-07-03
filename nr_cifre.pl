% Giusca Iulian 242
% 17.3.2016

%Sa se determine din cate cifre e alcatuit un numar
%M-am folosit de o baza de cunosinte pentru a putea determina corect si numerele negative, si faptul ca 0 e alcatuit dintr-o cifra(altfel obtineam cu o unitate mai mult pentru fiecare numar)

%nr_cifre(+Nr,-Cif)
nr_cifre(0,1).
nr_cifre(1,1).
nr_cifre(2,1).
nr_cifre(3,1).
nr_cifre(4,1).
nr_cifre(5,1).
nr_cifre(6,1).
nr_cifre(7,1).
nr_cifre(8,1).
nr_cifre(9,1).
nr_cifre(-1,1).
nr_cifre(-2,1).
nr_cifre(-3,1).
nr_cifre(-4,1).
nr_cifre(-5,1).
nr_cifre(-6,1).
nr_cifre(-7,1).
nr_cifre(-8,1).
nr_cifre(-9,1).
nr_cifre(N,Cif):-number(N), N1 is div(N,10), nr_cifre(N1,Cif1), Cif is Cif1+1.

%Exemple de interogari

/*

| ?- nr_cifre(45,Cif).                                
Cif = 2 ?                                                  
yes
| ?- nr_cifre(0,Cif).                                 
Cif = 1 ? y
yes
| ?- nr_cifre(-45,Cif).
Cif = 2 ? y
yes
| ?- nr_cifre(101,Cif).
Cif = 3 ? y
yes

*/
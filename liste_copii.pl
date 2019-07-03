%copil(nume_copil,baiat/fata,inaltime_in_metri,nr_kilograme)
copil(ioana,f,1.59,55).
copil(mihai,b,1.70,95).
copil(danut,b,1.68,70).
copil(lili,f,1.43,43).
copil(andreea,f,1.49,47).
copil(bogdanel,b,1.72,79).
copil(dorel,b,1.67,91).
copil(delia,f,1.61,58).
copil(miki,b,1.63,68).

/*predicat care selecteaza un copil (de fapt numele acestuia) 
daca are inaltimea intre 1.60 si 1.70 sau kilograme intre 50 si 80*/

ales(X):-copil(X,_,I,K),(I>=1.60, I =< 1.70; K>=50,K =< 80).

lista_copii(L):-bagof(X,ales(X),L).
lista_copii_cuantif(L):-bagof(X,X^ales(X),L).%aici va avea acelasi rezultat cu lista_copii(L)
multime_copii(L):-setof(X,ales(X),L).
findall_copii(L):-findall(X,ales(X),L).


ales2(X):-copil(X,_,I,_),I>1.90.

lista_copii2(L):-bagof(X,ales2(X),L).
multime_copii2(L):-setof(X,ales2(X),L).
findall_copii2(L):-findall(X,ales2(X),L).

%ce se intampla cand apar in scop variabile care nu sunt prezente si in expresia din primul parametru?
copil1(X,G):-copil(X,G,_,_).

lista_copii3(L,G):-bagof(X,copil1(X,G),L).
lista_copii3a(L,G):-bagof(X,copil(X,G,_,_),L).
lista_copii3b(L):-bagof(X,copil1(X,_),L).
lista_copii3c(L):-bagof(X,G^copil1(X,G),L).%ce observati?

multime_copii3(L,G):-setof(X,copil1(X,G),L).
multime_copii3a(L,G):-setof(X,copil(X,G,_,_),L).

findall_copii3(L,G):-findall(X,copil1(X,G),L).
findall_copii3a(L,G):-findall(X,copil(X,G,_,_),L).

/*predicat necesar pentru predicatele pe care 
urmeaza sa le definiti in cadrul acestui exercitiu*/
tip_inaltime(I,scund):-I<1.5.
tip_inaltime(I,mediu):-1.5=<I,I<1.7.
tip_inaltime(I,inalt):-1.7=<I.
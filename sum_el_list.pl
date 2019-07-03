%Giusca Iulian 242
%24.4.206

%sum_list(+L,-S)
sum_list([],0).
sum_list([H|T],S):-number(H),sum_list(T,S1),S is S1+H.


%nr_copii(+L,-Total) 
%Verific daca elementele sunt de tipul 'clasa(X,Y,Z)', si daca da, adaug numarul de fete si baieti la suma totala.
nr_copii([],0).
nr_copii([clasa(_,F,B)|T],Total):-number(F),number(B),nr_copii(T,Total1), Total is Total1 + F + B .

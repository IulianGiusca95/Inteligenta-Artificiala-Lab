% Giusca Iulian 242
% 19.3.2016


%sterge_el(+L1,+Element,-L2) - In L2 intoarce continutul listei L1 dupa ce a fost inlaturat primul element E
sterge_el([],E,[]).
sterge_el([H|T],E,L):- H \== E , sterge_el(T,E,L1), L = [H|L1] ;  L = T.

%sterge_toate_el(+L1,+Element,-L2) - In L2 intoarce continutul listei L1 dupa ce au fost inlaturate toate aparitiile lui E
sterge_toate_el([],E,[]).
sterge_toate_el([H|T],E,L):- H\==E, sterge_toate_el(T,E,L1), L=[H|L1] ; sterge_toate_el(T,E,L1), L = L1.

%sterge_concurenti(+V1, +V2, +Lista_concurenti, -Lista_admisi) - in [V1,V2] avem intervalul de varsta al concurentilor care pot participa. In L2 sunt salvati concurentii din L1 care respecta conditia impusa de varsta
sterge_concurenti(_,_,[],[]).
sterge_concurenti(V1,V2,[H|T],L):- concurent(Nume,Varsta) = H,(Varsta <V1;Varsta > V2),sterge_concurenti(V1,V2,T,L1),L=L1;sterge_concurenti(V1,V2,T,L1),L=[H|L1].

/* Exemple de interogari

| ?- sterge_toate_el([1,2,3],2,L).                         
L = [1,3] ? y
yes
| ?- sterge_toate_el([1,2,3,2,4,2,5,2],2,L).               
L = [1,3,4,5] ? y
yes
| ?- sterge_toate_el([2,2,2,2,2],2,L).      
L = [] ? y
yes
| ?- sterge_toate_el([2],2,L).        
L = [] ? y
yes
| ?- sterge_toate_el([ ],2,L).
L = [] ? y
yes

-----------------------------------------------------

| ?- sterge_el([],2,L).
L = [] ? y
yes
| ?- sterge_el([1,2,3],2,L).
L = [1,3] ? y
yes
| ?- sterge_el([1,2,2,3],2,L).
L = [1,2,3] ? y
yes
| ?- sterge_el([2],2,L).      
L = [] ? y
yes

------------------------------------------------------

| ?- sterge_concurenti(30,40,[concurent(ana, 20), concurent(ion, 35), concurent(liliana, 50), concurent(teo, 37), concurent(andrei, 31), concurent(lisa, 41), concurent(oana, 31)],L).
L = [concurent(ion,35),concurent(teo,37),concurent(andrei,31),concurent(oana,31)] ? y
yes

*/
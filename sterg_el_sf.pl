% Giusca Iulian
% 19.3.2016

%sterge_sf(+Lista_veche, -Lista_noua)
%Am parcurs lista pana la ultimul element, si cand ajung la o lista formata din un element, nu il adaug in lista nou formata.
sterge_sf([],[]).
sterge_sf([H],[]).
sterge_sf([H|T],L):-sterge_sf(T,Ln), L=[H|Ln].


%elimina_vagoane(+Tren_vechi,+Valoare,-Tren_nou)
elimina_vagoane([],_,[]).
elimina_vagoane([H|T],E,Trenulet):- elimina_vagoane(T,E,L),v(Cantitate)=H,Cantitate<E, L==[],Trenulet=L. %elimina vagoane cu Cantitate <E doar daca Trenuletul nu contine deja vagoane care au fost adaugate anterior
elimina_vagoane([H|T],E,Trenulet):- elimina_vagoane(T,E,L),Trenulet=[H|L]. 


/* Exemple de interogari 

| ?- sterge_sf([1,2,3,4],L).
L = [1,2,3] ? y
yes
| ?- sterge_sf([1],L).      
L = [] ? y
yes
| ?- sterge_sf([],L). 
L = [] ? y
yes

----------------------------

| ?- elimina_vagoane( [v(10), v(3), v(2), v(7), v(0), v(1), v(0)] , 5, L).
L = [v(10),v(3),v(2),v(7)] ? y
yes
| ?- elimina_vagoane( [v(3), v(3), v(2), v(4), v(0), v(1), v(0)] , 5, L). 
L = [] ? y
yes

*/

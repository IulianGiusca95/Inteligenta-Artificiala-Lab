% Giusca Iulian 242
% 20.3.2016


%adauga_sf(+L1, +E, -L2) - Adauga la sfarsitul lui L1 elementul E. Apoi, returneaza rezultatul prin lista L2
adauga_sf([],E,L2):-L2=[E].
adauga_sf([H|T],E,L):-adauga_sf(T,E,L1),L=[H|L1].

%------Predicat principal----------
%adauga_elem_citit(+L1,-L2)
adauga_elem_citit([H],L):-citeste(H,L1),L=[H|L1].
adauga_elem_citit([H|T],L):-adauga_elem_citit(T,L1),L=[H|L1].
%-----------------------------------

%Predicat auxiliar
%citeste(+H,-L) : in H se afla ultimul element din lista L1, asupra caruia verificam paritatea.
%se citesc elemente pana cand elementul citit e de paritate diferita fata de ultimul element.
citeste(H,L):-read(E), (E mod 2)=:=(H mod 2), citeste(H,L1), L=[E|L1] ; L=[].
/*

| ?- adauga_sf([1,2,3,4],5,L).
L = [1,2,3,4,5] ? y
yes
| ?- adauga_sf([1],5,L).      
L = [1,5] ? y
yes
| ?- adauga_sf([],5,L). 
L = [5] ? y
yes

-------------------------------------------

| ?- adauga_elem_citit([1,2,3,4,5],L).                  
|: 7.  
|: 9.
|: 2.
L = [1,2,3,4,5,7,9] ? yes
| ?- adauga_elem_citit([1,2,3,4,5],L).
|: 6.
L = [1,2,3,4,5] ? yes
| ?- adauga_elem_citit([],L).         
no
| ?- adauga_elem_citit([1],L).
|: 3.
|: 5.
|: 2.
*/
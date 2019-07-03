% Giusca Iulian 242
% 19.3.2016


% sterge_incep(+Lista_veche, -Lista_noua) - Primeste o lista ca parametru si returneaza lista prin parametrul Lista_noua(Primeste Lista_veche ca parametru, fara primul element).
sterge_incep([H|T],T).

% sterge_spatii(+A1,-A2) - Primeste ca parametru un atom, ii sterge spatiile de la inceput, si il returneaza

sterge_spatii(A1,A2):-atom_chars(A1,L), prelucrare(L,L1), atom_chars(A2,L1).

%prelucrare(+L1,-L2) - in L1 se afla caracterele care alcatuiesc atomul. Se va returna o lista L2 dupa ce caracterele spatiu de la inceput au fost eliminate
prelucrare([],[]). % conditire de oprire in cazul in care toate caracterele sunt spatii
prelucrare([H|T],L2):- char_code(H,C1),char_code(' ',C2),C1=:=C2,prelucrare(T,L2).
prelucrare(L1,L1).


/* Exemple de interogari
| ?- sterge_spatii('    Atom',A).
A = 'Atom' ? y
yes
| ?- sterge_spatii('Atom',A).    
A = 'Atom' ? y
yes
| ?- sterge_spatii('     ',A).
A = '' ? y
yes
| ?- sterge_spatii('  a b c d',A).
A = 'a b c d' ? y
yes
| ?- sterge_incep([1,2,3,4],L).   
L = [2,3,4] ? y
yes
| ?- sterge_incep([1,2,' ',3,4],L).
L = [2,' ',3,4] ? y
yes
| ?- sterge_incep([1],L).          
L = [] ? y
yes
| ?- sterge_incep([ ],L).
no
*/


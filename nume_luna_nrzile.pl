% Giusca Iulian 242
% 10.3.2016

% Programul primeste o baza de cunostinte, luna si numarul de ordine asociat acesteia.
% Face interogari de genul numele lunii dat ca parametru si o variabila Y.
% Cauta numarul asociat lunii in baza de cunostinte(numarul e Z in program) si opereaza cu acesta in mod similar ca la exercitiul 13

% Baza de cunostinte
% luna(+X,+Y)
luna(ianuarie,1).
luna(februarie,2).
luna(martie,3).
luna(aprilie,4).
luna(mai,5).
luna(iunie,6).
luna(iulie,7).
luna(august,8).
luna(septembrie,9).
luna(octombrie,10).
luna(noiembrie,11).
luna(decembrie,12).

% ---Predicatul solutie ---
% nr_zile1(+X,?Y) //nu merge ?X fiindca doar luna februarie este definita, pentru restul obtin eroare de instantiere
nr_zile1(X,Y):- luna(X,Z),Z is 2, (Y is 28;Y is 29). %Caz special
nr_zile1(X,Y):- luna(X,Z), Z>0, Z=<7, Z=\=2, Z mod 2 =:= 0, Y is 30.
nr_zile1(X,Y):- luna(X,Z),Z>0, Z=<7, Z=\=2, Z mod 2 =:= 1, Y is 31.
nr_zile1(X,Y):- luna(X,Z),Z>7, Z=<12, Z mod 2 =:= 0, Y is 31.
nr_zile1(X,Y):- luna(X,Z),Z>7, Z=<12, Z mod 2 =:= 1, Y is 30.
% --------------------------
/* Exemple de interogari

| ?- nr_zile1(februarie,X).
X = 28 ? ;
X = 29 ? ;
no
| ?- nr_zile1(ianuarie,X). 
X = 31 ? y
yes
| ?- nr_zile1(ianuarie,30).
no
| ?- nr_zile1(mai,X).      
X = 31 ? y
yes
| ?- nr_zile1(iulie,X).
X = 31 ? y
yes
| ?- nr_zile1(august,X).
X = 31 ? y
yes
| ?- nr_zile1(noiembrie,X).
X = 30 ? y
yes
| ?- nr_zile1(X,Y). //Pentru X nedeclarat, ii va asocia doar valoarea februarie fiindca luna februarie este explicit declarata(are Z-ul fixat 2) pe cand celelalte luni nu(incluse in interval)    
X = februarie,
Y = 28 ? ;
X = februarie,
Y = 29 ? y
yes

*/
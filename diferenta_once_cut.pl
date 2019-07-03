q(1).
q(2).

z(3).
z(4).

p1(X):-q(X),!.
p1(X):-z(X).

p2(X):-once(q(X)).
p2(X):-z(X).

/* ! - opreste executia predicatului cand a gasit o conditie adevarata
| ?- p1(X).                                                        
X = 1 ? ;
no

once - executa pana cand gaseste q(X) adevarat, apoi continua evaluand si valorile posibile pentru z(X) .
| ?- p2(X).
X = 1 ? ;
X = 3 ? ;
X = 4 ? ;
no

*/

:-write('---acest program a fost consultat\n mesaj scris cu ajutorul unei directive---').

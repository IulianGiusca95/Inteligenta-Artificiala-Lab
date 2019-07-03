%Giusca Iulian 242
%15.5.2016

%arb(+Stanga,+Radacina,+Dreapta)
arb(2,1,3).
arb(4,2,null).
arb(5,3,6).
arb(null,4,null).
arb(7,5,8).
arb(null,6,null).
arb(null,7,null).
arb(null,8,null).

%preordine(+H) H este radacina arborelui curent
preordine(H):-arb(S,H,R),write(H),preordine(S),preordine(R).
preordine(null).

/*exemplu de interogare

| ?- preordine(1).                                           
12435786
yes

*/

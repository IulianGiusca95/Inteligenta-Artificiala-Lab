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

%postordine(+H) H este radacina arborelui curent
postordine(H):-arb(S,H,R),postordine(S),postordine(R),write(H).
postordine(null).

/*exemplu de interogare

| ?- postordine(1).                                           
42785631
yes

*/



%Giusca Iulian 242
%24.04.2016

%predicatul principal
%pred(+Numar,+Max,-ListaMultipli)
pred(N,Max,Lr):-number(N),multipli(N,Max,1,Lr).


%multipli(+Numar,+Max,+Indice de multiplicitate,-Lista rezultat)
%Cat timp N * Indice e mai mic decat max, il adaug in lista rezultat.
multipli(N,Max,Indice,Lr):- Val is N*Indice, Val=<Max,
                            Indice1 is Indice + 1, multipli(N,Max,Indice1,L),
							Lr = [Val|L].
multipli(N,Max,Indice,[]):-Val is N*Indice, Val > Max.


/* Exemple de interogari

L = [10,20,30,40,50,60,70] ? y
yes
| ?- pred(2,7,L).  
L = [2,4,6] ? y
yes
| ?- pred(2,8,L).
L = [2,4,6,8] ? ;
no
| ?- pred(2,1,L).
L = [] ? y
yes
| ?
*/
